Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002066;
	b=ThhiDGpUDFmle8Ra9/V53xZR6h5SMOInC9rynTwQqjemViRiFqfrVAoBHqt9bBH+T4W4
	 8ZFUaWW0Ad1qGi2JlFLb9TDgoiQJUogb9O/sIpMzKE8RIJaElBxbT1K2zsUKip+E9R6iu
	 UTEiRBZxxFy6mnyqmI+d6zY8nY6g/t/aca6PC8oosNenzOiOGfheQKo1bjR3cwSdMhjFF
	 5NFovCLAKtDV3Jedq9CsjG96umn3ah0cFqkyKck3xDkpfbgnS5JKWyfiYj3BoRw4TyBql
	 yMDGu/egNWzf6L4q0r8rk+67mnzdz2hoh4A1mNI/fyxwakpVeENNXv+H4LvmBVpiy4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
	b=LBRq0AzwxmEK+7goOSzWUsPQ3KVnCeBnqxxBeiVXY94Q+Gt8nVTBg3GSQqnHm2P2s7tW
	 jPxQRWp9hQrcVZavOM0AzBGDTpWfNfA++1gv9NufEoXr2SRYD8iH6b6xAf1Ucw9nst8e6
	 ZYIzU3pqLyoTFG1zUPw9FpYT1F1P8n/nZL8GVjz27gi84rFZEnh4x1ZUC+9lD91mYkoUT
	 hbEAl/mBBgWKwfOFw+WdmFMV1EKWqjJfEay+LaRjnIFW6nhLm3TCY1umV662BawN8YVQ9
	 u1Ul4gsC75C+gf9Jby5LobcLTxrNUZDJBpL6b2va1NRXL3DOokDHiC1yJPAkzcp2SKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U5uNPXeU;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A0B606A325
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A0B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U5uNPXeU
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso4076935e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002064; x=1795606864; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
        b=U5uNPXeUdtp4NBOVu4ZhluUyJ0mNvLuYeuQrg5v2BS+ZqqOp1CVI0jFzT5Irc+n25g
         0btxBfU/9JIk2hfz99IJ3XlgNzTX3iVpGrGZGomYdSFcd0PihHD5VHkpkmu7pDogIEdJ
         sVXJHY2T2dwNrdkj0ixzN8rkAt0mQEQ6czmQFyHbc5MPm9qv5RbPznv52P1/MrBOrS65
         RLUT00vvnT1Llw+nG+W0LSHEjrBp5Ux/pbZ85I3jObQ8EnyvDTuXrt9L9HS4DoBc7AV1
         TFEW2x8arxIKXGXHwR7VSH/NHimDOzV0egdTKVMcF1a3iWbODkSr7kRnc27i+W/Px000
         dv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002064; x=1795606864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
        b=ybDEuOWOpsa8Qxw1YgbE6k7FDRLIEqgYkpzhZXo2KwfEVYix07gj7h42URM4iVKkoD
         aU+fCo1YkMOh/000u8Gtd+oCpxQsRWzJvh8MD9n6tb6cZ3bkUePCCSwg+F+xZQGeMaLa
         x8MyxbC3bMjcmq1DFVkWtia+AsIjpIES0Y5YcvJBohMPKQwm6GoODYuZPvYXyXOZ31H0
         gj+/PSK7eJfTG+sq4l74FDGJQDok+3pddHIlUhtf8CWGGYmhjW16rLhP2NIw7XBsoAMb
         g3IRpBnmbV9BwEjajC1nOzEGS/GBI4cdfg+MIAthE9/GBAEDLBB2XPt1XjoPVm5MSAdy
         PePw==
X-Forwarded-Encrypted: i=1; AL+hErEH9oKqC22fvtpofE+e7lP0jpAxCUZwziZgZTpy/3g1DuuvHqn4jXRV3+q4klY5q9Z/ynkpetRG1WsAiyDgNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8RslvRXGBH4+RSly0aj7LtBc1ie+12te7poqXWmPlYtB8ku3i+
	8WItau8hMw02gNc12CVPCuchWlqt2PCFAvspDRg7Sp+NOLHidH339diJHwFwCtEEaVm3UNZLhqU
	phifCAYEZ5oJbqwj8TA==
X-Received: from wmbhb15.prod.google.com ([2002:a05:600c:868f:b0:4bb:5d5c:ab85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83cf:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb7d6cd41amr41190555e9.4.1795002062763;
 Wed, 18 Nov 2026 03:41:02 -0800 (PST)
Date: Wed, 18 Nov 2026 11:41:01 +0000
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118114102.490384-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/3] rust: drm: gem: shmem: implement gem_create_object
 for prime imports
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>, Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 12:14:08PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> For a prime-imported BO with no `gem_create_object` callback,
> `__drm_gem_shmem_create()` allocates `kzalloc(sizeof(struct
> drm_gem_shmem_object))`, which is smaller than the Rust `Object<T>`
> wrapper. A later `container_of!()` from a `drm_gem_object` back to
> `Object<T>` then runs past the allocation and corrupts the heap.
> 
> Provide a `gem_create_object` callback that allocates the full
> `Object<T>` via `KBox::pin_init`. Move `obj` to the first field so the
> returned pointer is at offset zero, satisfying the `kfree()` on the
> init-failure path. This is now compile-checked with `const_assert!`.
> 
> Imported BOs have no userspace creation arguments, so extend
> `DriverObject` with a `create_imported(dev, size)` constructor and
> implement it for Tyr's `BoData`, Nova, and the in-tree KUnit driver.
...
> +    /// Create a new driver data object for a GEM object that is being imported
> +    /// from another driver (e.g. via dma-buf).
> +    ///
> +    /// Imported objects are allocated by the importing helper, which only
> +    /// provides the device and size. There is no driver-supplied
> +    /// [`DriverObject::Args`], so drivers must initialize the per-object
> +    /// state without those arguments.
> +    fn create_imported(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
...
> +        // SAFETY: We never move out of `self`. Ownership of the allocation is transferred to the
> +        // C side, which will run `__drm_gem_shmem_init()` next and later free us via
> +        // `free_callback` (or `kfree()` on the `__drm_gem_shmem_init()` error path, matching the
> +        // C kzalloc fallback contract).
> +        let new = KBox::into_raw(unsafe { Pin::into_inner_unchecked(new) });
> +
> +        // SAFETY: `new` was just produced by `KBox::into_raw` and so is a valid pointer to an
> +        // initialized `Self`. `obj.base` is the embedded `drm_gem_object` the caller expects.
> +        unsafe { &raw mut (*(*new).obj.get()).base }
> +    }

I ran this through a review agent, and it found these two things. As far as I
can tell, these are valid concerns.

1. On the `__drm_gem_shmem_init()` failure path, `__drm_gem_shmem_create()`
   calls `kfree(obj)` directly rather than reconstructing `KBox<Self>`.
   Having `obj` at offset 0 ensures `kfree(obj)` frees the start of the slab
   allocation, but it skips running `Drop` on `Object<T>` and `inner: T`. If a
   driver's `T` owns any fields with non-trivial `Drop` implementations
   initialized in `T::create_imported()`, they will be leaked if
   `__drm_gem_shmem_init()` fails (e.g. if `drm_gem_create_mmap_offset()`
   fails).

2. `Object<T>::ALLOC_OPS` also sets:

       dumb_create: Some(bindings::drm_gem_shmem_dumb_create),

   `drm_gem_shmem_dumb_create()` calls `drm_gem_shmem_create()` ->
   `__drm_gem_shmem_create(dev, size, false)` -> `gem_create_object_callback()`,
   and `DRM_IOCTL_MODE_CREATE_DUMB` only checks `dev->driver->dumb_create`
   (not `DRIVER_MODESET`). So `T::create_imported()` can also be called to
   create a non-imported dumb buffer (`obj.is_imported() == false`).

Instead of implementing `gem_create_object`, what do you think about
exporting a `private = true` counterpart to `drm_gem_shmem_init()` (similar to
commit e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from
drm_gem_shmem_create()")), implementing a Rust `gem_prime_import_sg_table`
callback on `shmem::Object<T>` directly, and setting `dumb_create: None` in
`Object<T>::ALLOC_OPS`? That way `new: Pin<KBox<Self>>` stays owned by Rust
across `__drm_gem_shmem_init()` just like in `Object::new()`, so `Drop` runs
normally on error and `obj` does not need to sit at offset 0 for `kfree(obj)`.

Alice
