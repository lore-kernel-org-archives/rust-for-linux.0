Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C263081CD;
	Tue, 16 Sep 2025 16:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039564; cv=none; b=U0u7X/CwXBqWA9t5sbLYO3xPWj6uTOKEX71RF71JaDFN07Z4ezu7KmGt7/V3n/BiskeO7rlPw0pRe2slEyCyIAu6huJHn8wfBIM2RCZRQPP/7l2hhqrrbLZEoLCTZJK1honTybfE+xvNMgVHW1zbLYqbn4m9BbM3ru+2wXayQO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039564; c=relaxed/simple;
	bh=CMIhn5I1ibyNWInfyVbHeO7bbRYX4OymSkquNuSYjaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsaAyjMrsT4m8FZRY/8V3hhHnSsW02KrkEz97H2YD+M52Nv/cuyKFFAqS7eanNHk4iQKQLIBZPDd3iElVxZlJBAxIwbyN0bfUkzVrkCBnrmZ8U3minLg0wIMV5YRGetlfL2GFfyC3w2wfQ6K8zA+MyL7JJv61T/VbG3Q1dSsSdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TbNzJKte; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TbNzJKte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41945C4CEEB;
	Tue, 16 Sep 2025 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758039563;
	bh=CMIhn5I1ibyNWInfyVbHeO7bbRYX4OymSkquNuSYjaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TbNzJKte2c+MDZXfUpgnsK4vXcb79b/iNL2or6P6BXomUW+BDhIPxtLxds4v8r0pl
	 b0VC29aiYuI3wFg212cYdjBEZZG/gVqHrqDZfvY0i2hKKHEb8wLc6XLElF0p4r0mMf
	 lFLy23E9qgPQBiP+PfF0q8brzJ1xcOpA4X9y6BhQ=
Date: Tue, 16 Sep 2025 18:19:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: JaimeF <jaimefine6@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, david.m.ertman@intel.com,
	ira.weiny@intel.com, leon@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, onur-ozkan <work@onurozkan.dev>
Subject: Re: [PATCH] rust: auxiliary: fix "initialialized" typo
Message-ID: <2025091605-gleeful-lunacy-a33a@gregkh>
References: <20250916124102.14182-1-jaimefine6@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916124102.14182-1-jaimefine6@gmail.com>

On Tue, Sep 16, 2025 at 12:41:02PM +0000, JaimeF wrote:
> From: Jaime Fan <jaimefine6@gmail.com>
> 
> Fixes a spelling mistake in a comment: "initialialized" → "initialized".
> This improves clarity in the documentation and avoids confusion for readers.
> 
> Suggested-by: onur-ozkan <work@onurozkan.dev>
> Link: https://github.com/Rust-for-Linux/linux/issues/1187
> Signed-off-by: Jaime Fan <jaimefine6@gmail.com>
> ---
>  rust/kernel/auxiliary.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
> index 58be09871397..129eae8ff2e7 100644
> --- a/rust/kernel/auxiliary.rs
> +++ b/rust/kernel/auxiliary.rs
> @@ -317,12 +317,12 @@ pub fn new(parent: &device::Device, name: &CStr, id: u32, modname: &CStr) -> Res
>  
>          // SAFETY:
>          // - `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`, which has
> -        //   been initialialized,
> +        //   been initialized,
>          // - `modname.as_char_ptr()` is a NULL terminated string.
>          let ret = unsafe { bindings::__auxiliary_device_add(adev, modname.as_char_ptr()) };
>          if ret != 0 {
>              // SAFETY: `adev` is guaranteed to be a valid pointer to a `struct auxiliary_device`,
> -            // which has been initialialized.
> +            // which has been initialized.
>              unsafe { bindings::auxiliary_device_uninit(adev) };
>  
>              return Err(Error::from_errno(ret));
> -- 
> 2.50.1
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
