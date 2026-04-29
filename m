Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB88739658A
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449787; cv=none; b=UL7JaUH6wvMzaiqqqG2vnP1H9sTWYWaSw7nLAMYy0gf6idEE3oXi1EDggkj2b8dLVunCa3lgTdoHrzaWnbjdMseKLuQsaxm71o3iFVvaPhr4BkCHIFHKhaQJzisD9tDL/e66vwklNSPa9kKHRjeb6cZAxJWiqt4TR0RqRRLICPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449787; c=relaxed/simple;
	bh=LN67d/FJzMppHHtbV9T5QweCRhIfpdDesj7GgoJjdpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A1ew3LJKAARGVRmo+iQkqJpkgCgLaZHwDpwlu+L0hFq+exha3j5805YaxirsnNKT55DBDCxkfTH9LOM0MeVgho7kAuNLFGHFfWITDnPkDNRvTQ09Ab963ql+OUEjOWLJHdcuJ92vMNAngyzlDermfpJCNBT4DN8NTH77T/Iknno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c2rJ/PW/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c2rJ/PW/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48a5523fd53so46558365e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777449784; x=1778054584; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEG/I8pPPYBATQ/hJAtxhRYJOnBvxSA+K2ZLFC/1AAs=;
        b=c2rJ/PW/OjYoI8Yir9/ZOjSeAH4c1yyuMQgCIS1+kLoW5UKPMNfqxbOcEv+QSAEBnL
         2eQtgAxqIdtyiFJdjAHmmWXQFkLF+DiVGdPHgYahkhQDW8LnvUK0mTeY6IJdQuZjTCcb
         FxrktJOeka0NC5fDH9V2j+d5mW0LQ2BbMPRRDORMvUHwIHz/zHbT4diwlV3a+hLkKEs9
         dPn/HVtFuMVguK2CDitUYoHVYtBYTmXFfiDSXfLfBz4i62LvNyKLYEPwYwZcaTKppzUd
         BUfCVYzmNT0gjTRY8RiL5SokkWPnaJa7OSkZnzwnqHj/L9EWC/3yvdBoUmR9cSW3JbIY
         M58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449784; x=1778054584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEG/I8pPPYBATQ/hJAtxhRYJOnBvxSA+K2ZLFC/1AAs=;
        b=rcPheApq2bSWBedDWtdZZSZOD/pjvUIjnI4zVofTktm3TT/7j7ErEzAQ0JWLfJ8dfd
         0W0D5dszPFOn8rhz00Nk6LgSCUHDXuaf6/CwUd1OlIU2Q6/b8DIhRrtKM9T5zullS2/Y
         pn5aHmqDbkml4erDL95IIHSsE+ZrVrSl9eXBLYjbaR24pI3k8eQkqD2DF1xdC653vbt/
         Y4ufwW3Jv0/Bnd5Z/x6KTkb24AaiZQ6wz0psNI3/4yklrPrqASFo0zkc5Dn1CHcg3T30
         Sqie+052BRreaAXx/2JalWNZESR4oIlzPMZq5iqWVaJClOCjcS3RRGKM5K5fo3oL2Ii2
         kcfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fDpZaJ6ypLZf3NSH1oFPEg/w+OTDYetUrf86xmgYXnmU/xDlSk7PLO/HXgKNL4KF0X3YZbk7PDRtROxyJFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHoSN5e0J/f3M7Sah0+p/7bQpYcYl+qanV4rHfxgDxH8fvuwk+
	z63rZbQfl+RAcbR8YHtPheN0hFbFAnsFQoy3mFOHcr46uPpEks/yWanp2V+dsnL39I2Uz25gwSZ
	CUhVZdTxxM9jrIURfnQ==
X-Received: from wmdd17.prod.google.com ([2002:a05:600c:a211:b0:488:c696:8bf2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1a:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-48a77b04774mr98771505e9.12.1777449784107;
 Wed, 29 Apr 2026 01:03:04 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:03:02 +0000
In-Reply-To: <20260428-fix-drm-1-v1-1-755057178066@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428-fix-drm-1-v1-1-755057178066@nvidia.com>
Message-ID: <afG7Np4Lmv9k7D1U@google.com>
Subject: Re: [PATCH] rust: drm: fix unsound initialization in drm::Device::new
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 09:20:21PM +0900, Eliot Courtney wrote:
> If pinned initialization of drm::Device::Data fails, it calls
> drm::Device::release via drm_dev_put. This materializes a reference to
> &drm::Device, but it's not fully constructed yet, because initializing
> `data` failed. It should not be dropped either. Instead, if pinned
> initialization fails, make sure drm::Device::release isn't called.
> 
> Fixes: 2e9fdbe5ec7a ("rust: drm: device: drop_in_place() the drm::Device in release()")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

For the concerns about duplicating vtables, could the temporary vtable
be a stack variable?

>  rust/kernel/drm/device.rs | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index adbafe8db54d..78ea0eb12535 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -111,6 +111,13 @@ impl<T: drm::Driver> Device<T> {
>          fops: &Self::GEM_FOPS,
>      };
>  
> +    // Use a vtable without a `release` callback until `data` is initialized, so init failure
> +    // can release the DRM device without dropping uninitialized fields.
> +    const ALLOC_VTABLE: bindings::drm_driver = bindings::drm_driver {
> +        release: None,
> +        ..Self::VTABLE
> +    };
> +
>      const GEM_FOPS: bindings::file_operations = drm::gem::create_fops();
>  
>      /// Create a new `drm::Device` for a `drm::Driver`.
> @@ -120,12 +127,12 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
>          let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
>  
>          // SAFETY:
> -        // - `VTABLE`, as a `const` is pinned to the read-only section of the compilation,
> +        // - `ALLOC_VTABLE`, as a `const` is pinned to the read-only section of the compilation,
>          // - `dev` is valid by its type invarants,
>          let raw_drm: *mut Self = unsafe {
>              bindings::__drm_dev_alloc(
>                  dev.as_raw(),
> -                &Self::VTABLE,
> +                &Self::ALLOC_VTABLE,
>                  layout.size(),
>                  mem::offset_of!(Self, dev),
>              )
> @@ -133,6 +140,10 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
>          .cast();
>          let raw_drm = NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
>  
> +        // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `__drm_dev_alloc` was
> +        // successful.
> +        let drm_dev = unsafe { Self::into_drm_device(raw_drm) };
> +
>          // SAFETY: `raw_drm` is a valid pointer to `Self`.
>          let raw_data = unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
>  
> @@ -140,15 +151,14 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
>          // - `raw_data` is a valid pointer to uninitialized memory.
>          // - `raw_data` will not move until it is dropped.
>          unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
> -            // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `__drm_dev_alloc` was
> -            // successful.
> -            let drm_dev = unsafe { Self::into_drm_device(raw_drm) };
> -
>              // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_dev` must be valid and the
>              // refcount must be non-zero.
>              unsafe { bindings::drm_dev_put(drm_dev) };
>          })?;
>  
> +        // SAFETY: `drm_dev` is still private to this function.
> +        unsafe { (*drm_dev).driver = &Self::VTABLE };

It would be bad if this ended up being a reference to a local variable.
Please use `&const { Self::VTABLE }` so that it doesn't compile if this
occurs.

Alice
