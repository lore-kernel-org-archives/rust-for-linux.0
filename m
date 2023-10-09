Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E68171C0;
	Mon,  9 Oct 2023 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G3rROSpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECC8C433C9;
	Mon,  9 Oct 2023 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696863848;
	bh=zkKPQyJWY/bWLSLvlhwqdh1lXsEEe34SJtWArwfDDpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3rROSpbq8gLpTMZWFOnj/Fm736okNGFEt7YDiwLJU5UG6/dFbApLN4x4xhDtOHVI
	 P6xZIebGTAyMB6OBTGosbMSEGcDdfOtlUDD8iiglgP0BQQ+NjvwuXP7iBy0v9UKRMd
	 JassXp7JuGNAs9WzSaSclE2LjMyqCNsdUjYxyzZY=
Date: Mon, 9 Oct 2023 17:04:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrea Righi <andrea.righi@canonical.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH net-next v3 0/3] Rust abstractions for network PHY drivers
Message-ID: <2023100902-tactful-april-559f@gregkh>
References: <20231009013912.4048593-1-fujita.tomonori@gmail.com>
 <5334dc69-1604-4408-9cce-3c89bc5d7688@lunn.ch>
 <CANiq72n6DMeXQrgOzS_+3VdgNYAmpcnneAHJnZERUQhMExg+0A@mail.gmail.com>
 <ZSQMVc19Tq6MyXJT@gpd>
 <a3412fbc-0b32-4402-a3c8-6ccaf42a2ee4@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3412fbc-0b32-4402-a3c8-6ccaf42a2ee4@lunn.ch>

On Mon, Oct 09, 2023 at 04:56:36PM +0200, Andrew Lunn wrote:
> On Mon, Oct 09, 2023 at 04:21:09PM +0200, Andrea Righi wrote:
> > On Mon, Oct 09, 2023 at 02:53:00PM +0200, Miguel Ojeda wrote:
> > > On Mon, Oct 9, 2023 at 2:48 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > >
> > > > Any ideas?
> > > 
> > > That is `RETHUNK` and `X86_KERNEL_IBT`.
> > > 
> > > Since this will keep confusing people, I will make it a `depends on !`
> > > as discussed in the past. I hope it is OK for e.g. Andrea.
> > 
> > Disabling RETHUNK or IBT is not acceptable for a general-purpose kernel.
> > If that constraint is introduced we either need to revert that patch
> > in the Ubuntu kernel or disable Rust support.
> > 
> > It would be nice to have a least something like
> > CONFIG_RUST_IS_BROKEN_BUT_IM_HAPPY, off by default, and have
> > `RUST_IS_BROKEN_BUT_IM_HAPPY || depends on !`.
> 
> Should this actually be CONFIG_RUST_IS_BROKEN_ON_X86_BUT_IM_HAPPY ?

Just do the proper dependency on RETHUNK and you should be fine, it will
be able to be enabled on arches that do not require RETHUNK for proper
security.

> At lest for networking, the code is architecture independent. For a
> driver to be useful, it needs to compile for most architectures. So i
> hope Rust will quickly make it to other architectures. And for PHY
> drivers, ARM and MIPS are probably more important than x86.

Is MIPS a proper target for rust yet?

thanks,

greg k-h
