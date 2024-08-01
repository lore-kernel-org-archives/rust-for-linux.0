Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739016C856
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500397; cv=none; b=dBQVne3JOoNWgPHoSCuUVLkLqOtPfbhVZHsp0ZeahgEhSGviAkd+XNFEAeFtu7fPSvkT4KE5JNE6hZ4eRutqXbAMnXCzYyhUk2ZjN6PhTYX6mQvWHtKO/SSHH3lMouF9709FIRVYMIPdUWmdgzXAHv70/ozjWdywdTHPfp8loao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500397; c=relaxed/simple;
	bh=F8X1OnxFEkRRAOal1oJFpgBUn2uLlB9Fg2lEdNyF7Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSN11SifPh1N5K2ajOaUXZPakqfJdh0Jlgz+TG0hAiRKjSuQrgv3/rXEZ0W9K2snJJYKww2AaLRAkj8PAtF1bKNfZbNSQGcu4ajpsPPMbOHXkU6Tgu3dOF0NXKgssGPirDbPAAdEPiIQG0oXnCOIDoweII4/I135dbL9otbrS/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nqLh/qpn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nqLh/qpn"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-369cb9f086aso3664097f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722500394; x=1723105194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z48QEimQdUdR9cUUTzAn0JtO3vTcfoiQ1GyipJs6wJY=;
        b=nqLh/qpnMZ8daxdihJDjXUt9FVUVDn1i3E26NPtNdHAfD7+2bAOHf9Cf5SR5CwZrYQ
         FOBZHlJ66KdiClANsB0iKoBWN52estnWvsxRTx2zpUp9jVyQ9Lb7iHupGJT6iyBE3ZP7
         joYUfdaZ6FD7uJLQtqFvK3AsTZEBKqmovP9DsoDJSrchdmPXIUTU+ME4RyZRisI2m0oO
         gvpzW8+pEXCWkk2Eko6xbThvJ7HQJPOVTRjuZYUwSFPaUbnAlKxbeD20H2/AvZISjWcb
         /+39+yD2pMilpGw5ii+rWisHXrC34ZQeS6sYGUB0rFpvX3s9UrnNUcoFUNLPM0L95BWc
         8Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500394; x=1723105194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z48QEimQdUdR9cUUTzAn0JtO3vTcfoiQ1GyipJs6wJY=;
        b=vXOjdptu25WthX53lp22oQ91Y3E+AdlNPo5x4tOKW9HUC5izT6vjfdUz3dm+sOLWuH
         6JS2ko+XP8EPGiHrGBVcXqOLVwa8BLPEu6Wmjmwe2BFduV+F1p1JHBkesc1IM6VPTMYL
         TxEVwIvVCeBKsesNN9oFIZfS4KupFZT7uomUc17NLLbkxVDtqfIQlck2CghwoUrt0pQK
         nEIUWEf6Lpvyy/Z8VyNI3XqpOSvYBY3SUQM4JjJbQtFNjDKyH/OcyuAYwfpCrijZmaqh
         ZkXBrkRqyit5CqbdeScafRe2uMwjhG7bIIzhfIc///DkIztxjK+oyFK7jtd602TWvh/o
         N3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXG6xbHamIWkHqr0avj+91EXvnBSxISrdPk/Ca/ZLj41OEfW1wPVnKoKvc2OG0S1GKfFmFOFA6sNLMFwouBNzAq4S6Elo+VsHlu9Wh1zxo=
X-Gm-Message-State: AOJu0YwUC8C/o7Zg+fx8ApjfKx+0SB0szMP5rrkfTz78LtPQvLeyFpji
	MiImaEyhQyofl3MtcpJQntEHwaL3UF0C2UW6NC1zFMfvJeWoYbjFY9dJEh9DUuQZzjOZxqXvknj
	ak7NZE2v25MuFJXAUL6I2OaYl5htcMlCdlvNl
X-Google-Smtp-Source: AGHT+IEMfwhKTMBK0cnCuAuh+rhXBm29w7tYDwKoyPqOZyNudYkoi3YBiIcjx3+7V/3Jvthfm7RnbXLZ9LOcULLTUV8=
X-Received: by 2002:adf:e890:0:b0:366:ee9b:847 with SMTP id
 ffacd0b85a97d-36baacc81b9mr1395000f8f.14.1722500393355; Thu, 01 Aug 2024
 01:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-2-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-2-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 10:19:41 +0200
Message-ID: <CAH5fLgj5xf4QdDU7yWrqUjcmJw4Rqe0-UzesHLhfQRvPqAv8eA@mail.gmail.com>
Subject: Re: [PATCH v3 01/25] rust: alloc: add `Allocator` trait
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
> Add a kernel specific `Allocator` trait, that in contrast to the one in
> Rust's core library doesn't require unstable features and supports GFP
> flags.
>
> Subsequent patches add the following trait implementors: `Kmalloc`,
> `Vmalloc` and `KVmalloc`.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

It could be nice to mention that the design without `self` parameters
is necessary for compatibility with #[derive(SmartPointer)].

>  rust/kernel/alloc.rs | 73 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index 1966bd407017..b79dd2c49277 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -11,6 +11,7 @@
>  /// Indicates an allocation error.
>  #[derive(Copy, Clone, PartialEq, Eq, Debug)]
>  pub struct AllocError;
> +use core::{alloc::Layout, ptr::NonNull};
>
>  /// Flags to be used when allocating memory.
>  ///
> @@ -86,3 +87,75 @@ pub mod flags {
>      /// small allocations.
>      pub const GFP_NOWAIT: Flags =3D Flags(bindings::GFP_NOWAIT);
>  }
> +
> +/// The kernel's [`Allocator`] trait.
> +///
> +/// An implementation of [`Allocator`] can allocate, re-allocate and fre=
e memory buffer described
> +/// via [`Layout`].
> +///
> +/// [`Allocator`] is designed to be implemented as a ZST; [`Allocator`] =
functions do not operate on
> +/// an object instance.
> +///
> +/// # Safety
> +///
> +/// Memory returned from an allocator must point to a valid memory buffe=
r and remain valid until
> +/// it is explicitly freed.
> +///
> +/// Any pointer to a memory buffer which is currently allocated must be =
valid to be passed to any
> +/// other [`Allocator`] function. The same applies for a NULL pointer.
> +///
> +/// If `realloc` is called with:
> +///   - a size of zero, the given memory allocation, if any, must be fre=
ed
> +///   - a NULL pointer, a new memory allocation must be created
> +pub unsafe trait Allocator {
> +    /// Allocate memory based on `layout` and `flags`.
> +    ///
> +    /// On success, returns a buffer represented as `NonNull<[u8]>` that=
 satisfies the layout
> +    /// constraints (i.e. minimum size and alignment as specified by `la=
yout`).
> +    ///
> +    /// This function is equivalent to `realloc` when called with a NULL=
 pointer.
> +    fn alloc(layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, Allo=
cError> {
> +        // SAFETY: Passing a NULL pointer to `realloc` is valid by it's =
safety requirements and asks
> +        // for a new memory allocation.
> +        unsafe { Self::realloc(None, layout, flags) }
> +    }
> +
> +    /// Re-allocate an existing memory allocation to satisfy the request=
ed `layout`. If the
> +    /// requested size is zero, `realloc` behaves equivalent to `free`.
> +    ///
> +    /// If the requested size is larger than the size of the existing al=
location, a successful call
> +    /// to `realloc` guarantees that the new or grown buffer has at leas=
t `Layout::size` bytes, but
> +    /// may also be larger.
> +    ///
> +    /// If the requested size is smaller than the size of the existing a=
llocation, `realloc` may or
> +    /// may not shrink the buffer; this is implementation specific to th=
e allocator.
> +    ///
> +    /// On allocation failure, the existing buffer, if any, remains vali=
d.
> +    ///
> +    /// The buffer is represented as `NonNull<[u8]>`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to an existing and valid memory allocation crea=
ted by this allocator
> +    /// instance.
> +    ///
> +    /// Additionally, `ptr` is allowed to be a NULL pointer; in this cas=
e a new memory allocation is
> +    /// created.
> +    unsafe fn realloc(
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        flags: Flags,
> +    ) -> Result<NonNull<[u8]>, AllocError>;

Is it intentional that this allows you to change the alignment of an
allocation? If so, that could use a note in the docs.

> +    /// Free an existing memory allocation.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must point to an existing and valid memory allocation crea=
ted by this `Allocator`
> +    /// instance.
> +    unsafe fn free(ptr: NonNull<u8>) {
> +        // SAFETY: `ptr` is guaranteed to be previously allocated with t=
his `Allocator` or NULL.
> +        // Calling `realloc` with a buffer size of zero, frees the buffe=
r `ptr` points to.
> +        let _ =3D unsafe { Self::realloc(Some(ptr), Layout::new::<()>(),=
 Flags(0)) };
> +    }

At the very least, the provided implementation of `free` changes the
alignment when it calls `realloc`.

Alice
