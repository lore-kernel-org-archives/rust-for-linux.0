Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875E5EAC5
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="S74alzrN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFA7C433C7;
	Thu, 11 Jan 2024 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704959665;
	bh=4BozqcVMCb8BcIpmY6PQWXKUbOKjBN4s0dg+jjJ586w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S74alzrNEDMyu9dU4OC8eFphiF5/ynCVoB/VNgyGh/6eSPF/ihqZFLsmSyw1WOmH4
	 +GOxKdEUqD5ybZ0GeqFuEVDvcbKEulpuyC1UK3+khpaUKElVFZdkPbK6lG6pzSqRvA
	 tG8L+BnDILaJzYU+b3nM6acwQbbEykVQ2Z5BY1PU=
Date: Thu, 11 Jan 2024 08:54:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
Message-ID: <2024011108-shortcake-underwent-e12d@gregkh>
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
 <2024011114-tartar-jimmy-9e0d@gregkh>
 <4b2265c7-3ef3-4bca-8237-3752d2915c0a@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b2265c7-3ef3-4bca-8237-3752d2915c0a@de.bosch.com>

On Thu, Jan 11, 2024 at 08:29:06AM +0100, Behme Dirk (CM/ESO2) wrote:
> On 11.01.2024 07:59, Greg KH wrote:
> > On Thu, Jan 11, 2024 at 07:44:15AM +0100, Dirk Behme wrote:
> > > The existing to_result() takes a (signed) integer from a kernel C function
> > > and converts it to an error if it's negative. Additionally, there are
> > > kernel C functions returning an unsigned integer where 0 is the error case.
> > > For example gen_pool_alloc() and friends. Provide a mechanism to convert
> > > this to Result too.
> > > 
> > > Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> > > ---
> > >   rust/kernel/error.rs | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > I'm unsure if something like this is acceptable. Therefore the RFC.
> > > But I want at least ask ;) In the end this is a slightly modified
> > > copy of the existing to_result().
> > > 
> > > diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> > > index 376280b6a745a..3306b8f590866 100644
> > > --- a/rust/kernel/error.rs
> > > +++ b/rust/kernel/error.rs
> > > @@ -248,6 +248,16 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
> > >       }
> > >   }
> > > +/// Converts an unsigned integer as returned by a C kernel function to EINVAL if it's zero,
> > > +/// and `Ok(u64)` otherwise.
> > > +pub fn to_result_zero(val: core::ffi::c_ulong) -> Result<u64> {
> > > +    if val == 0 {
> > > +        Err(code::EINVAL)
> > > +    } else {
> > > +        Ok(val)
> > > +    }
> > > +}
> > 
> > How would this be used?
> 
> One (randomly selected) usage example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/cpu/mce/genpool.c#n107
> 
> node = (void *)gen_pool_alloc(mce_evt_pool, sizeof(*node));
> if (!node) {
> 	pr_warn_ratelimited("MCE records pool full!\n");
> 	return -ENOMEM;
> }
> 
> > 0 is normally not an error, why would you
> > need/want to turn that into an error value?

So you are treating NULL as 0 in rust bindings somehow?

I guess a usage of the new function would be good to see to clarify this
please.

thanks,

greg k-h
