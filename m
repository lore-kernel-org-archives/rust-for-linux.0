Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8A2253A7
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754039931; cv=none; b=amGONFHOnVxBER9FEBvxUc21FScE5rbyB/LP9mWWPnSEXG5upsIvQZSMCGJzye420Lti3FXlP3txp6Xn6bNOXSwZdyuoYGVwqcLiJSIjYiAPQOU0J8FFxYaLm6JLy0Lk6G3QT1+Ukv/EejjkDHpIYtRhL1C3+6IhQnH4iy1vreQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754039931; c=relaxed/simple;
	bh=CaBYQCyAa09aBCMB+C0SD9r3fiTxVP88jvyR9stLsRw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qAOuM4QO4fMgm3J00XTKS7N9h6QV3u508zNtHv6fnVQNPWXc4SXAm1DNtvAfugiHOhA8d6kUhs5Juado1ROnKx0ErSoYW648i9P8AVYqESeZZ9EAqGGGPckmvDkOvq85zN+gKnNux4z+kWFAQfzpxNzySSK8i2FbImYZxTfZXS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PLkV4FeO; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PLkV4FeO"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so9426625e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 02:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754039927; x=1754644727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPJ/V5RI8K47BlVRi/QYNKYG6CvA+YvGWmagXwaMydA=;
        b=PLkV4FeOahLBOrXwCqrlzeZa3HhRyAoKjtcjGchAj5fpbrp1shwLRUqsU3bpJn2b/P
         StJIbf4isfl8u/loiT7PG2pO4tAIHAicZ+fQWENLAjKQwYTEO2omAf/zHQpg0vzHTzmk
         mLsikPgjie8d7II/sXHwFzkX2uVA8j0jNladSEMIV+9kyX9LkNC0mso4JIwn/qTNohCb
         a73xqMKm6ij7nVdXhU/QtuAuontmkPL57+CbIN+fFsm7kreUl8sFAaLleW0Ppet+mcqP
         QirtO9ld1T3O01y/WqaCaoQWFsWoxhH0oEDrrC7KZ8vKLbdDQbTip8FW+z8uChiPmeW2
         pUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754039927; x=1754644727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPJ/V5RI8K47BlVRi/QYNKYG6CvA+YvGWmagXwaMydA=;
        b=uFwZ/yWZMozNQ8bK/M27LYXpEvBFUIqV7JgDXx8KtXiWGmbwAWYrmos1teoiA+8nVF
         Jn6S/yh5J2OQZfKYmtcuvN3w+HNcYgIP8phfHigK2orGSO7IBMDtp8zRohsp+oAHwBt4
         EBfo/KgezORjHfkNsLvZsyQjmqDxCoBbUdLypXk0k5uC/2z2qoeJJeJdzmBmbYWIQQpD
         XAroJbbk8Ht5c3gMtIe6D5fHUwE10b+k4832hgWIWbEtPOy5QDVQt+cnARmS2wZ6sD5h
         80sfrz2cGPxQ9ySbbMA7Q1Ieu9RLXjdrXeb9F45Idt0i9rIN/VI3L/H8sUB2LEFo6Myd
         y8eA==
X-Forwarded-Encrypted: i=1; AJvYcCVNSA+Bh83I+ETzjWZXnxvbkcI1QGB5b94NYJ9NX8upq22c1r+JOkB1/h8TNzqXLaCMttmxN253oLukvnV1OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsJF+Zk1Mosr7Pvobpj5zG3em7Sk5mXR7nYiVw64jS3RzZmeR6
	hoigt/S6VSf5kaPi5dLT/4+eg7cbMnvQxjE+j3G/HjrnicWsQFxWvKuyK2uJY+dhkUEpFeW5ENX
	ebuTrcyC6VvZaWh9ZHA==
X-Google-Smtp-Source: AGHT+IG5NOG6HNujXCAaZiDz9P+DKaUO9EQNwoy/JaT1RYCYpKkIaBQBCpy2nJhwB2K8nNEaJFZ6PYv/FKhZr48=
X-Received: from wmbhj26.prod.google.com ([2002:a05:600c:529a:b0:458:a7c9:d6e5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e12:b0:456:161c:3d6f with SMTP id 5b1f17b1804b1-45892b9e2ecmr91292135e9.11.1754039927660;
 Fri, 01 Aug 2025 02:18:47 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:18:46 +0000
In-Reply-To: <20250731154919.4132-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org> <20250731154919.4132-3-dakr@kernel.org>
Message-ID: <aIyGdr8vKV4XE6Io@google.com>
Subject: Re: [PATCH 2/4] rust: drm: ensure kmalloc() compatible Layout
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 31, 2025 at 05:48:07PM +0200, Danilo Krummrich wrote:
> drm::Device is allocated through __drm_dev_alloc() (which uses
> kmalloc()) and the driver private data, <T as drm::Driver>::Data, is
> initialized in-place.
> 
> Due to the order of fields in drm::Device
> 
>   pub struct Device<T: drm::Driver> {
>      dev: Opaque<bindings::drm_device>,
>      data: T::Data,
>   }

I'm not convinced this patch is right.

Imagine this scenario: T::Data has size and alignment both equal to 16,
and lets say that drm_device has a size that is a multiple of 8 but not
16 such as 72. In that case, you will allocate 72+16=88 bytes for
Device, but actually the size of Device is 96 because there is 8 bytes
of padding between dev and data.

Alice

> even with an arbitrary large alignment requirement of T::Data it can't
> happen that the size of Device is smaller than its alignment requirement.
> 
> However, let's not rely on this subtle circumstance and create a proper
> kmalloc() compatible Layout.
> 
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/drm/device.rs | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 3bb7c83966cf..d19410deaf6c 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -5,6 +5,7 @@
>  //! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm/drm_device.h)
>  
>  use crate::{
> +    alloc::allocator::Kmalloc,
>      bindings, device, drm,
>      drm::driver::AllocImpl,
>      error::from_err_ptr,
> @@ -12,7 +13,7 @@
>      prelude::*,
>      types::{ARef, AlwaysRefCounted, Opaque},
>  };
> -use core::{mem, ops::Deref, ptr, ptr::NonNull};
> +use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
>  
>  #[cfg(CONFIG_DRM_LEGACY)]
>  macro_rules! drm_legacy_fields {
> @@ -96,6 +97,10 @@ impl<T: drm::Driver> Device<T> {
>  
>      /// Create a new `drm::Device` for a `drm::Driver`.
>      pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<ARef<Self>> {
> +        // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
> +        // compatible `Layout`.
> +        let layout = Kmalloc::aligned_layout(Layout::new::<Self>());
> +
>          // SAFETY:
>          // - `VTABLE`, as a `const` is pinned to the read-only section of the compilation,
>          // - `dev` is valid by its type invarants,
> @@ -103,7 +108,7 @@ pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>) -> Result<A
>              bindings::__drm_dev_alloc(
>                  dev.as_raw(),
>                  &Self::VTABLE,
> -                mem::size_of::<Self>(),
> +                layout.size(),
>                  mem::offset_of!(Self, dev),
>              )
>          }
> -- 
> 2.50.0
> 
