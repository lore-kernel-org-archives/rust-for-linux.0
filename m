Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FAC21ABBB;
	Sat, 20 Dec 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766226830; cv=none; b=tiM9yVNJ4aBA27eE4Z4t0hhipb+eSiKxQfFRRGa4MQAfiAmhTs7iGSGfv6PXah87ktDbuW0zcDyd+Hbpmi+gRE1Vz21ZpGkjOwZqIuy4zNeSQqSW5ee3AXlW4lnA3ekPOVnJZ3FqoU8K9PY69aPJDyP+szPn6Xnx/3oEqVqX6Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766226830; c=relaxed/simple;
	bh=PO5wsrdug/WbW3M926QVBp6evsVZhB8pjON6pBLTTJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOe6vCSmZHJoMvfVWjOIvBjIMqvkTWCjg1L7iXySI+Agi22wfqt72orDpqQdjumR2Z9N4IjoNPoqasnI3NoLMViHqeNxOFRBoWS7byJUK5iDlTZw8c9h2gBpSSBe7P9y6Gdl6K+KPwi3vJISnuowwVPgyAog64YCBPwX24wJT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KDNRxe1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KDNRxe1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46F6C4CEF5;
	Sat, 20 Dec 2025 10:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766226830;
	bh=PO5wsrdug/WbW3M926QVBp6evsVZhB8pjON6pBLTTJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDNRxe1C0uE4VsfNm90oN7Y+gLb96UTFk9OywuDQrtwvHU805woRNihpcLJEuKLGM
	 hclDf3fj25JsPdgtZwrzOiLhjrmJGfHt8CZ/FRIWm7yncotNNgZgmMRf2bVfSG4bQa
	 eVwweBJeVEszIYSO35cjDUP9R1UdCaodZxNwOy1o=
Date: Sat, 20 Dec 2025 11:33:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Riccardo <riccioadami@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: document safety requirements for fmt::Arguments
 dereference
Message-ID: <2025122025-limelight-vixen-0b9c@gregkh>
References: <20251220101401.25361-1-riccioadami@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220101401.25361-1-riccioadami@gmail.com>

On Sat, Dec 20, 2025 at 10:14:01AM +0000, Riccardo wrote:
> From: Riccardo Adami <riccioadami@gmail.com>
> 
> This patch documents the safety requirements for dereferencing
> `fmt::Arguments` in the kernel's `vsnprintf` formatting path. This
> clarifies why it is safe to perform the unsafe dereference in
> `rust_fmt_argument` and helps future maintainers understand the
> invariants, reducing the risk of incorrect modifications.
> 
> ---
>  rust/kernel/print.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 899bed9c08fd..5f54be97a6a0 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -25,10 +25,10 @@
>      // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
>      let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
>      //SAFETY: `ptr` is provided by the kernel formatting path for the `%pA`
> -// specifier during `vsnprintf` processing and always points to a valid
> -// `fmt::Arguments` value created by the caller. The value lives at least
> -// for the duration of this call and is only read here. It is not stored
> -// or accessed after returning, so dereferencing it is safe.
> +    // specifier during `vsnprintf` processing and always points to a valid
> +    // `fmt::Arguments` value created by the caller. The value lives at least
> +    // for the duration of this call and is only read here. It is not stored
> +    // or accessed after returning, so dereferencing it is safe.
>  
>      let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
>      w.pos().cast()
> -- 
> 2.52.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
