Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBF82D3A7C
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362133; cv=none; b=gYM4GdonqUW6hbG8CkYz0j3n4zjaXd74fbs0tIGs3Adbc/LBMWCiIOyVR29x9CDlyPRjoQorYnG9EZN2PSvwpZsuodsns6XRKBav75jT1okx13MUc2xSACOrwAfQDqYndHpQT7PqLWEv0HvSAG+CDjkTI/+aL9fWnQM/dqQg2xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362133; c=relaxed/simple;
	bh=4FRGKxUjmT5V97OsFFUs9UKwCeGpR9rkrqnQkUrp31M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eST7Ds+WYUqb3MGpgeXCVVrGTk7M4Hdxa4BFHhVFf4o9phpYeTy8Qtg06NLnXklEY+xqIbncgI/N8z3TUOCQUs5M+YhZlqf36Y62BKgRQaPW7Vv6TH/OqWIG88/AQr5zqJtgD7BeTfHRiFaBtjeW+EuEYg37SEefcu5rOYsQbr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=guaWKyh0; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="guaWKyh0"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39c184b20a2so883510f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Apr 2025 02:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744362130; x=1744966930; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SHnGewIV1agnoOjGZwgUR7YbP805CZBtE+LcY2jKnig=;
        b=guaWKyh0ETUKUrxGok2gg/uJgNYTfRlxo9LUwHPFgOeKB8mXhBVdYgoGqbvkJ+G/hv
         0ICKn/a1JexWCDbfbenTjjwnSKyyiBTUkO9Bz9Mv44etPlsw2lLuvUzc2rT1/sogg6DK
         63T+/0uoorqHfng5Ewe0TzOdGLiDmB7TI8/nW1+y+wMkiNuvtVDZogWNSAdarvKjz/8S
         ge7GrPBsGr3TIyK15+vWnzNn7LttfwxR6VeFUV7kQYkiilF3Wi6GP0NLOD2uZW53ROxr
         vuv2SfUu12Q9WW8+awiEf88ATB0FPkn2HvH12fbGkf7gr3rv1BYxlHbkI+auyMpBWyYY
         6X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362130; x=1744966930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHnGewIV1agnoOjGZwgUR7YbP805CZBtE+LcY2jKnig=;
        b=i9GBmCLcTjmECO4pJyYl4JC01B1KycbhWNY8jnmYD3UHDhRkU9Crd0mGffTiDnnX2R
         21vXOTCzgh7gW/6QDVXyM70AltLh3OhP6HaiNHBV9No/v5WHriCd7y0Ewq+pqHM3c/61
         VDakyBdim6lN/Ct/w84DGnNQrfEo/oZezWMkHVuqMVwpfx04Un2IIfZut6+rJOyhclFY
         1stQaiDO6NzxnWpKHNfbStSkMUyfPIJ6toAdWGvlA1Wj2BtdydUZOQcy6nG25dAPsXQq
         wFvYhORvZBlouxzIcwUuLOxaAPIK01zxPbjot8ZdjJyluQ8pPQeZIyVoPmcuPPXYueIE
         0MPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2FDMCSHHpxnq/phDDGxWfdp62OkrbD18CZj29uMPdxsp2xeyPQS9PqBaplQKhvghDcjh+tJN0RLcW+X/uMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmj7RRsuggP+Pjm4FqkkVQZ5Xb/2NysvNfgBHlTg+eqllYdpSe
	3x4M2s4KP/22N1eC5FFnpukGhGvjvwl+qIco62c0dUedSFCTP/QFI9rLcrF9W1fv0AGgk1nDh0I
	gZFhDSpR05AtEQg==
X-Google-Smtp-Source: AGHT+IGknNB36GwS9G8tRiPkbu2Av2DOm6kWwYYKMcuyvBuMkSEKDm/6GTJWrFS/W+dxqv11gdhJsHkpVK/R1Lw=
X-Received: from wmbev17.prod.google.com ([2002:a05:600c:8011:b0:43e:fb23:3edc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40d9:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-39ea5214ecdmr1468410f8f.32.1744362130477;
 Fri, 11 Apr 2025 02:02:10 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:02:08 +0000
In-Reply-To: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250409-container-of-mutness-v1-1-64f472b94534@gmail.com>
Message-ID: <Z_jakOS8mciIpxy0@google.com>
Subject: Re: [PATCH] rust: retain pointer mut-ness in `container_of!`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 09, 2025 at 10:43:16AM -0400, Tamir Duberstein wrote:
> Avoid casting the input pointer to `*const _`, allowing the output
> pointer to be `*mut` if the input is `*mut`. This allows a number of
> `*const` to `*mut` conversions to be removed at the cost of slightly
> worse ergonomics when the macro is used with a reference rather than a
> pointer; the only example of this was in the macro's own doctest.
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> This patch is extracted from 3 other series to reduce duplication.
> ---
>  rust/kernel/lib.rs    |  5 ++---
>  rust/kernel/rbtree.rs | 23 ++++++++++-------------
>  2 files changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index de07aadd1ff5..1df11156302a 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -190,7 +190,7 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>  /// }
>  ///
>  /// let test = Test { a: 10, b: 20 };
> -/// let b_ptr = &test.b;
> +/// let b_ptr: *const _ = &test.b;
>  /// // SAFETY: The pointer points at the `b` field of a `Test`, so the resulting pointer will be
>  /// // in-bounds of the same allocation as `b_ptr`.
>  /// let test_alias = unsafe { container_of!(b_ptr, Test, b) };
> @@ -199,9 +199,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>  #[macro_export]
>  macro_rules! container_of {
>      ($ptr:expr, $type:ty, $($f:tt)*) => {{
> -        let ptr = $ptr as *const _ as *const u8;
>          let offset: usize = ::core::mem::offset_of!($type, $($f)*);
> -        ptr.sub(offset) as *const $type
> +        $ptr.byte_sub(offset).cast::<$type>()
>      }}
>  }

This implementation does not check the type of `ptr`. Would we not want
it to have the type of the field?

Alice
