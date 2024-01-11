Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB99A46B1
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 06:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G5oGeo5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7A1C43390;
	Thu, 11 Jan 2024 06:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704956390;
	bh=/jkzW4kXBBuy41xI7tCMAYxf+JixLznIxr1JwdjSKZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G5oGeo5EzO+52ySPGuQzl/g7PWa1NY/S8nrkvCdu2QCQL0LWvrPIph0rdzBPSNum7
	 M0NO+h81UzuwkR99RJM2tp/2GVm5hrGYHoZtJF/GrWUH3ai0okX3cNAygM0ysZ8Aqm
	 F/K+E6x5vM7zexKOQA9Bd6b1I8h4QOzN/Kj0G22A=
Date: Thu, 11 Jan 2024 07:59:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
Message-ID: <2024011114-tartar-jimmy-9e0d@gregkh>
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111064415.908487-1-dirk.behme@de.bosch.com>

On Thu, Jan 11, 2024 at 07:44:15AM +0100, Dirk Behme wrote:
> The existing to_result() takes a (signed) integer from a kernel C function
> and converts it to an error if it's negative. Additionally, there are
> kernel C functions returning an unsigned integer where 0 is the error case.
> For example gen_pool_alloc() and friends. Provide a mechanism to convert
> this to Result too.
> 
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  rust/kernel/error.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> I'm unsure if something like this is acceptable. Therefore the RFC.
> But I want at least ask ;) In the end this is a slightly modified
> copy of the existing to_result().
> 
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 376280b6a745a..3306b8f590866 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -248,6 +248,16 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
>      }
>  }
>  
> +/// Converts an unsigned integer as returned by a C kernel function to EINVAL if it's zero,
> +/// and `Ok(u64)` otherwise.
> +pub fn to_result_zero(val: core::ffi::c_ulong) -> Result<u64> {
> +    if val == 0 {
> +        Err(code::EINVAL)
> +    } else {
> +        Ok(val)
> +    }
> +}

How would this be used?  0 is normally not an error, why would you
need/want to turn that into an error value?

thanks,

greg k-h
