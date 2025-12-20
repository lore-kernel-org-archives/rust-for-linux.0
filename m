Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2296B1E32CF;
	Sat, 20 Dec 2025 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224520; cv=none; b=ZE5wDoLf4GbfqMyCOfw07uAtzmiEqk2QeTX6KN65Gvyip843ObpdaDYYSFQuzYwWG+7cVYNwtG9l4WpYVu36voBodA14THQUgqNbdui3jiq6+A3lUKHogwwttfEI89xvInEm4YOTSS+wogzpKAX3SbXQ/5IXQBuEXf4+vOx2DBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224520; c=relaxed/simple;
	bh=DsXPYUVbREy4zRd6Zi8tQA71E7JOmmLFEOMCqh9ffNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxxFMayRW9jv5LKdMkq4vzyDoWB004wO2iL7vfU+VuK9aHQVfZ0HWPAY7Zm465kkQ5JbWw702kCDH2penT9/PxDf3CQv2XYYzbtnvnWtzoQyO8k59mIN4ts7SIsYWZaD2GNKYyZ4hVC+T+rmjxoSMvIeA7P9Dt2KyeFrq4NrH4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RrYagWMf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RrYagWMf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93092C4CEF5;
	Sat, 20 Dec 2025 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766224520;
	bh=DsXPYUVbREy4zRd6Zi8tQA71E7JOmmLFEOMCqh9ffNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrYagWMfHN2LTZJlubyK2V8wpIDkkvAEfDPAQkZb2UhEq8cUAss7YFJhYEJw3kA0d
	 KKISRm7pGR0fRQuL7vIainuvbY7x8eg1PwiAa3gkor3u/UscWIfMwdVJBC8ZLpme40
	 C4nLn70X6Dhp49KtlGpJ0zkCJTG8jGcYvuCMSjcQ=
Date: Sat, 20 Dec 2025 10:55:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Riccardo <riccioadami@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: document safety requirements for fmt::Arguments
 dereference
Message-ID: <2025122027-roast-boggle-bab8@gregkh>
References: <20251220094332.12254-1-riccioadami@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220094332.12254-1-riccioadami@gmail.com>

On Sat, Dec 20, 2025 at 09:43:32AM +0000, Riccardo wrote:
> Signed-off-by: Riccardo <riccioadami@gmail.com>
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
