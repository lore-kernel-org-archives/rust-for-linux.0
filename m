Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5476F244663
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Aug 2025 22:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162666; cv=none; b=K9Briu5UOAVbQ3uFAFr4B/hjvaserx2Q4o34Brk7rnNBHdt1wWPz5gkc3THiwshoMJqvtfLn/uyNFJOmiaxcxJbZpKthJYZXnbfPy5YFqjLuNpozjb8IWxPd4aFVcQ9dfpZMXNw9ToZRQOGCA85YgXY61qCrSQjZ9y710Z2AnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162666; c=relaxed/simple;
	bh=k6CXn/IUYlwjU1mZtJc9lxFjypMrLSwhiknLwvu+nv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWuriVNuArk+k1FOPruGT2jwAMFR8fxtfG3ScZaUIrW4g7jWwKrZs0U4pD0ykgb2y8bpumQsftuO9JWJUKoKkOx+HOhwswVr6y0D5U9ROrM82K4TAUhJpg/9O4de+7I+LVMXI0JZJgzMCsXwmiO87cD9n9qFyuzrWthqKQZC6CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev; spf=pass smtp.mailfrom=weathered-steel.dev; dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b=Fl/ynRlI; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weathered-steel.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weathered-steel.dev header.i=@weathered-steel.dev header.b="Fl/ynRlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weathered-steel.dev;
	s=protonmail3; t=1756162661; x=1756421861;
	bh=vu75YEXvimcJ8M7zeA0lHn5w01NrEWPJKFgrd8A1RLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:In-Reply-To:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Fl/ynRlIhd0FmHjA3hrav+sCIaFxEFAcogm91AM2bH0A+LebNabi19EhKjwEZZAqT
	 oyqV7J2T8fZZm0YUCdXjtcBlxJ5sRkjD/hspiF5w8PBNfYadRqY9VlvzCn598vH+3B
	 1CFhAdNBJscHem/ze8se6gjovExwr78Xh47yY/Qr6nUYvVLBI/FuX0v+kT67Goka/s
	 jBcFY0sMPh5N14PCGMUo2AuBNVyg/lJ6jYcttymmRVksA1PhJU3BVnInIRDJJbElPu
	 opQPCXAEE0/Fyg2xRv0E1zRdpsRkAgXn8/NK8cuWXMRpcdGgD+zz95QTVdLRCNqD0B
	 /EAukiP+WlUMA==
X-Pm-Submission-Id: 4c9mQq0mdPz1DF4C
Date: Mon, 25 Aug 2025 22:57:36 +0000
From: Elle Rhumsaa <elle@weathered-steel.dev>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, tamird@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: uaccess: use to_result for error handling
Message-ID: <aKzqYDfsZNQmvmUw@archiso>
References: <20250821091939.14019-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821091939.14019-1-work@onurozkan.dev>

On Thu, Aug 21, 2025 at 12:19:39PM +0300, Onur Özkan wrote:
> Simplifies error handling by replacing the manual check
> of the return value with the `to_result` helper.
> 
> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> ---
>  rust/kernel/uaccess.rs | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index a8fb4764185a..9992eece2694 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -7,7 +7,7 @@
>  use crate::{
>      alloc::{Allocator, Flags},
>      bindings,
> -    error::Result,
> +    error::{to_result, Result},
>      ffi::{c_char, c_void},
>      prelude::*,
>      transmute::{AsBytes, FromBytes},
> @@ -495,9 +495,7 @@ fn raw_strncpy_from_user(dst: &mut [MaybeUninit<u8>], src: UserPtr) -> Result<us
>          )
>      };
> 
> -    if res < 0 {
> -        return Err(Error::from_errno(res as i32));
> -    }
> +    to_result(res as i32)?;
> 
>      #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
>      assert!(res <= len);
> --
> 2.50.0

Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
