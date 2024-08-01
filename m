Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3C16E89C
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722501801; cv=none; b=mSveUG0sFN/6+ThZuw68FdA7GfoN/Akl82LwuT53DueWOWBOOuYQGHo26c/pPrm4vikBMIktGb8ryIRLYn38eaosRcznhqvymktYlMIYtLvAIbTEJRFjpSVY47jIy4eCW4BD5DgnjYOrJhay9CVRvUv5rVvQO7sMVI253B/YZHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722501801; c=relaxed/simple;
	bh=YpfUPoMyJ2Qi6FjWPKXYwaaW5Amqw9wZMYibb+kjjJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j23Gfoap/hF4TzGF0mOYiWARlQ+86PfUEC0JFKCHG9sMxrxj0PlVqYdafx+cenAXxWF+cLpl4BT0MHWFNJTU9D15OP135j/k+7E4gHWN81QiQ4gdBq2qqRBJ+7Bjkp8PGBGainYK5YiykHYsfJsvVUUm2kj2ClQFVh3F7LHICsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s0Yv4vH3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s0Yv4vH3"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efd530a4eso10345932e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722501798; x=1723106598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=057qsfQo25vgSdyD+iBQubS+WGiFw59ECgKt87tVL5A=;
        b=s0Yv4vH33mP2ttUQoXb+sOvVPIYpWalveiHBFWObxHz9vUAne8eaUEL9MNZ0u7wjBA
         n6r5KxXDrTD4KLygyDpMRDShMY/hE6KDtaim/mhsztr9kWzng8aj/98CWVQHr3viDEbP
         /winImSwflf6P8l3VBjhfBFNY5s6v8+x786XyRZAcWsi+Hwu9oq0jKkED4B0cU+whqZ/
         uJwCQtawcSYiou4kRG0zVOsQDRYs9iCTxxvQKoOWEBHBFU/+XkMACD8i+BuPJa3h7IAB
         YCnwKKjASGXXTn+9Rumj+4cdXscMebJGefDARolmft2E7054uqaPA0RYKfpxF9GshNhx
         QiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722501798; x=1723106598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=057qsfQo25vgSdyD+iBQubS+WGiFw59ECgKt87tVL5A=;
        b=X3SLnG2jp2yop8wcBeSyW9soLZ+XpYhbaNE8Y7X6L/W4XDsrCBQ09n8EADaJf+ujkp
         Ehix/F0gFYT4q3j7JsdKIwp5xPmVbUeTJrUe7s8gxzvooPRl9u6VyKRW+krCPvOf587X
         gOfzs5bsJN63zX2VURfgRlZanjc3Ux4JldZJjnMyxAx5trrp0xr5MPR+TEgCBC+/yRnV
         GgWfNJtyPnV7LgbETxO5xrhL3BeVLRKuvW8X2RH2B7VVXRNMEIgWto/x8N/+81eoHq7x
         JuXc5/LlV6Gc0ryjI0K/LBmnwmfOt6NoqiixmZ5vgKmY68KIb27HUGtPvmAoRfEyTPW6
         UPeA==
X-Forwarded-Encrypted: i=1; AJvYcCX9nBcCa0bqUV/LlFPFFjamfgg5a9c42YDdu6MyaWGLPUylOpKfPQ9KSsfmll+TLjmvu5rtdHHfltCcvrDmusGtCpibVrjKQyUindmF+Y0=
X-Gm-Message-State: AOJu0Ywj73Ue8qrFQG3W8EuUGNNGXvcOU8TsHZ0BkWm6zNq+zS+Lr9kv
	LVTGzg4zgOt2/j9jHbUEz2BtHPwvsK8q8soXZN7VcY8k0yhrYic5F1UpSq2wJY9us130/Y5K845
	cHwEXY86UObnTT2Y1e7YyuKEApbJSd+xQNifi
X-Google-Smtp-Source: AGHT+IENcEymBHeQ//Di7A/pvJi5huPTzBOnLqISBj+H9wlfHEJY13Wl4uiIRucbmw7OOtQPbn95aJ6SQzpDE5dbI48=
X-Received: by 2002:ac2:55a7:0:b0:52f:441:bdd9 with SMTP id
 2adb3069b0e04-530b61bc022mr813511e87.34.1722501797458; Thu, 01 Aug 2024
 01:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-7-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-7-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 10:43:05 +0200
Message-ID: <CAH5fLgiXpojYs3B68toTK+S18mnfRnChtwkve4_eWLXt_417rA@mail.gmail.com>
Subject: Re: [PATCH v3 06/25] rust: alloc: implement `Vmalloc` allocator
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Implement `Allocator` for `Vmalloc`, the kernel's virtually contiguous
> allocator, typically used for larger objects, (much) larger than page
> size.
>
> All memory allocations made with `Vmalloc` end up in `vrealloc()`.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

One nit below, but.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/helpers.c                      |  8 ++++++++
>  rust/kernel/alloc/allocator.rs      | 24 ++++++++++++++++++++++++
>  rust/kernel/alloc/allocator_test.rs |  1 +
>  3 files changed, 33 insertions(+)
>
> diff --git a/rust/helpers.c b/rust/helpers.c
> index 92d3c03ae1bd..4c628986f0c9 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -33,6 +33,7 @@
>  #include <linux/sched/signal.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/vmalloc.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>
> @@ -200,6 +201,13 @@ rust_helper_krealloc(const void *objp, size_t new_si=
ze, gfp_t flags)
>  }
>  EXPORT_SYMBOL_GPL(rust_helper_krealloc);
>
> +void * __must_check __realloc_size(2)
> +rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
> +{
> +       return vrealloc(p, size, flags);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_vrealloc);
> +
>  /*
>   * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we c=
an
>   * use it in contexts where Rust expects a `usize` like slice (array) in=
dices.
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator=
.rs
> index 397ae5bcc043..e9a3d0694f41 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -16,6 +16,12 @@
>  /// `bindings::krealloc`.
>  pub struct Kmalloc;
>
> +/// The virtually contiguous kernel allocator.
> +///
> +/// The vmalloc allocator allocates pages from the page level allocator =
and maps them into the
> +/// contiguous kernel virtual space.
> +pub struct Vmalloc;
> +
>  /// Returns a proper size to alloc a new object aligned to `new_layout`'=
s alignment.
>  fn aligned_size(new_layout: Layout) -> usize {
>      // Customized layouts from `Layout::from_size_align()` can have size=
 < align, so pad first.
> @@ -58,6 +64,10 @@ fn krealloc() -> Self {
>          Self(bindings::krealloc)
>      }
>
> +    fn vrealloc() -> Self {
> +        Self(bindings::vrealloc)
> +    }

Technically needs an

// INVARIANT: The function pointer is vrealloc.
Self(bindings::vrealloc)

> +
>      // SAFETY: `call` has the exact same safety requirements as `Allocat=
or::realloc`.
>      unsafe fn call(
>          &self,
> @@ -136,6 +146,20 @@ unsafe fn alloc_zeroed(&self, layout: Layout) -> *mu=
t u8 {
>      }
>  }
>
> +unsafe impl Allocator for Vmalloc {
> +    unsafe fn realloc(
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        flags: Flags,
> +    ) -> Result<NonNull<[u8]>, AllocError> {
> +        let realloc =3D ReallocFunc::vrealloc();
> +
> +        // SAFETY: If not `None`, `ptr` is guaranteed to point to valid =
memory, which was previously
> +        // allocated with this `Allocator`.
> +        unsafe { realloc.call(ptr, layout, flags) }
> +    }
> +}
> +
>  #[global_allocator]
>  static ALLOCATOR: Kmalloc =3D Kmalloc;
>
> diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allo=
cator_test.rs
> index 4785efc474a7..e7bf2982f68f 100644
> --- a/rust/kernel/alloc/allocator_test.rs
> +++ b/rust/kernel/alloc/allocator_test.rs
> @@ -7,6 +7,7 @@
>  use core::ptr::NonNull;
>
>  pub struct Kmalloc;
> +pub type Vmalloc =3D Kmalloc;
>
>  unsafe impl Allocator for Kmalloc {
>      unsafe fn realloc(
> --
> 2.45.2
>
