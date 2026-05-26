Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ADC246BBA;
	Tue, 26 May 2026 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812420; cv=none; b=SYQi0/t7Dp/te4XGNqsqKgKT8tTRAAmPDnZQmlX+uG0T/Vh9PETV69qx5e3+KvrS706mI4lkcBgRXG/ad5CVn/rkiuRIaMXFl520J+DAvXldpEf3JNK1wNBh242wim0JZwzAPC8dhQDr0O9bfQfUhzEmcgQIA5h5abnYI2gxzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812420; c=relaxed/simple;
	bh=hirtgnU5oI1xGK9SGhojFB2wpqDgvsDgfCs4ChFCNvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgT0hVKg+b6PYzj76PYogeTDFNZ6qyNeEwfG9yWFb/OTFdqFAp0T+C5z4xwsi9t0d5Gbnz0hO02hv610LqqsZG+58uGIblQ29de6EP34d8x5xXIs80WtlU1Y7vQ+ThEQJT/5uWbUXQu8swV7hqwSBccHOLb5XQS2I+weHoe8ScU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PzTHfdun; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PzTHfdun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4E31F000E9;
	Tue, 26 May 2026 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779812419;
	bh=GFb+8FIqcJj8nWINVtXrQyLYn/DNaGmEaU5hpK7FMJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PzTHfdunIJizscGLJhCawh7pO2TyCCPeKp88jg9Py1sepqar+73FGecGWeT5tWIh6
	 q3MPdyo3Nx2Z0FJz0Lkbhc24AVGf5iKSX45INYQD+TywT33zABhSAtszeSxnfDCPZt
	 lJK7KwOzHBtjgCW7LWkKfgIMe+8N/dQSPkNXMI1M=
Date: Tue, 26 May 2026 18:19:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aary Milind Kinge <kingeaary@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: devres: optimize type name allocation and fix
 truncation
Message-ID: <2026052607-underhand-mauve-dcaa@gregkh>
References: <20260526094329.533943-1-kingeaary@gmail.com>
 <20260526115825.1480768-1-kingeaary@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526115825.1480768-1-kingeaary@gmail.com>

On Tue, May 26, 2026 at 05:28:25PM +0530, Aary Milind Kinge wrote:
> The unconditional 128-byte const array allocation for every unique
> `Devres<T>` caused unnecessary .rodata bloat in production builds,
> and type names exceeding 127 bytes were silently truncated without
> any indication in debug logs.
> 
> Gate the `TYPE_NAME`, `TYPE_NAME_BUF`, and `TYPE_NAME_CSTR` constants
> behind `#[cfg(CONFIG_DEBUG_DEVRES)]` so the 128-byte buffer is only
> allocated when device resource debugging is enabled. For production
> builds, use `crate::c_str!("")` as a zero-cost empty C-string fallback.
> 
> When the type name is too long to fit in the 127-byte buffer (plus null
> terminator), the copy routine now appends "..." at the end — copying
> only the first 124 bytes — to clearly indicate truncation rather than
> silently dropping trailing characters.
> 
> Signed-off-by: Aary Milind Kinge <kingeaary@gmail.com>
> ---
>  rust/kernel/devres.rs | 55 ++++++++++++++++++++++++++++++++++++++++---
>  rust/kernel/lib.rs    |  1 +
>  2 files changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 9e5f93aed20c..79cfe7d9a415 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -185,6 +185,57 @@ pub(super) unsafe fn devres_node_remove(
>  }
>  
>  impl<T: Send> Devres<T> {
> +    #[cfg(CONFIG_DEBUG_DEVRES)]
> +    const TYPE_NAME: &'static str = core::any::type_name::<T>();
> +
> +    #[cfg(CONFIG_DEBUG_DEVRES)]
> +    const TYPE_NAME_BUF: [u8; 128] = {
> +        let bytes = Self::TYPE_NAME.as_bytes();
> +        let mut buf = [0u8; 128];
> +        let mut i = 0;
> +
> +        if bytes.len() > 127 {
> +            // Copy exactly 124 bytes, then append '...' to clearly indicate truncation
> +            while i < 124 {
> +                buf[i] = bytes[i];
> +                i += 1;
> +            }
> +            buf[124] = b'.';
> +            buf[125] = b'.';
> +            buf[126] = b'.';
> +            buf[127] = 0; // Null terminator
> +        } else {
> +            // Copy normally
> +            while i < bytes.len() {
> +                buf[i] = bytes[i];
> +                i += 1;
> +            }
> +            buf[i] = 0; // Null terminator
> +        }
> +        buf
> +    };
> +
> +    #[cfg(CONFIG_DEBUG_DEVRES)]
> +    const TYPE_NAME_CSTR: &'static crate::str::CStr = {
> +        let static_buf: &'static [u8; 128] = &Self::TYPE_NAME_BUF;
> +
> +        let mut len = 0;
> +        while len < 128 && static_buf[len] != 0 {
> +            len += 1;
> +        }
> +
> +        // SAFETY: `static_buf` is promoted to static memory, and we verified the null byte.
> +        unsafe {
> +            crate::str::CStr::from_bytes_with_nul_unchecked(core::slice::from_raw_parts(
> +                static_buf.as_ptr(),
> +                len + 1,
> +            ))
> +        }
> +    };
> +
> +    #[cfg(not(CONFIG_DEBUG_DEVRES))]
> +    const TYPE_NAME_CSTR: &'static crate::str::CStr = crate::c_str!("");
> +
>      /// Creates a new [`Devres`] instance of the given `data`.
>      ///
>      /// The `data` encapsulated within the returned `Devres` instance' `data` will be
> @@ -209,9 +260,7 @@ pub fn new<E>(dev: &Device<Bound>, data: impl PinInit<T, E>) -> Result<Self>
>                      unsafe {
>                          base::devres_set_node_dbginfo(
>                              node,
> -                            // TODO: Use `core::any::type_name::<T>()` once it is a `const fn`,
> -                            // such that we can convert the `&str` to a `&CStr` at compile-time.
> -                            c"Devres<T>".as_char_ptr(),
> +                            Self::TYPE_NAME_CSTR.as_char_ptr(),
>                              core::mem::size_of::<Revocable<T>>(),
>                          )
>                      };
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b72b2fbe046d..48df181788f6 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -22,6 +22,7 @@
>  // Expected to become stable.
>  #![feature(arbitrary_self_types)]
>  #![feature(derive_coerce_pointee)]
> +#![feature(const_type_name)]
>  //
>  // To be determined.
>  #![feature(used_with_arg)]
> -- 
> 2.51.0
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
