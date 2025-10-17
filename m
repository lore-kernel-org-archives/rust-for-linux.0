Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9693451B3
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706621; cv=none; b=u+5+pzz3V5ND1v1aFrnhir9+LkJjLS/w9D7oJhacab18aKzFhJmjDJYY91M7QLyFdw5Lg2MOqbDNfkqNAfeyBhPkiBDtL55bA8HgmzkUXO55uDY5t12P75G36/61fBaEwKetTva5hbYx7PMjzIP6feXutKEN+sg/Sevpcf6bB3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706621; c=relaxed/simple;
	bh=EEnm10MyYA68jZvokqSZJ7WfWmlN6TZQC+epsXTbdnY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VYeNjaNIZDxQvVPU+fOWJYh2PT/0cb7bNSYQbq2WEKYVktWlSCJqyplkwO7s14yb+aiwjdfUK6fDQE34Wx6f2hBbKJghsH7t0gYTF1WEkq6B87azKhYLFeguMoDi7OndEIZoBQC07QKdZ6fk9JIAB0/tjy6rnqHG9szStde+umg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4yKyRtXL; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4yKyRtXL"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-471001b980eso12842435e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760706618; x=1761311418; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DoKMhSsyXfCYMAzn+A2bSpqJRrRoIP0G76cRQo/jaDg=;
        b=4yKyRtXLt1e28eRbQC+4UoY7CddijifB+pHvv4PunRxXpNJbGNbTzW29kNIbcnNl12
         /pfxM5O7yabXtqi9z4+c8LrYrP85Qq5vulVag4ozniNIzQokIEYMSXoL6hfE/2+2zr+H
         xkFKKrtsEqMWbjH9nVbbJJNXO8dISi9FbNWP3oYzI6HDERg32N1p4i60ezm2UoFcbCSN
         6NVciX/t+vN0CcSXUfvSHANwQF2/qKoyPbLuN4d+6WCjfeLLogVcBF0GDKSzHRWbHYyy
         3kENiOBd91BPd1Xg/dsLs1nJqI/M8UNBauCOKNlfz2fGPvWVqQM+skxIbTXyNFQuDHQQ
         ey0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706618; x=1761311418;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DoKMhSsyXfCYMAzn+A2bSpqJRrRoIP0G76cRQo/jaDg=;
        b=XCCkZPiewBp5eI1/9YKJntNH2DkOQZYrwgmkp9AP+FpeBV3Nb0EEhiKVW1rmg3yDZT
         rRq3+baaP23LAW9ktmv4WE4vHjIS4oQ0pQ3e/3i8HLxvKNHGLedR/4pSep9lamIJ5N8f
         Ns4MBlIfuWOcz88o34GdoedokyKr1MZG2isKrv4f9AsYam3WdvQVSwNXZAaA3Wjbp0VM
         66wcVSQ2SthOxveqxBnunxe+JG61lexKlJB0/8YrgkxxtIR8NeWVi4VO0jzP2TFZP2CL
         2xQum2q1U4nMZ4yw6YfV6nsSitaJU/o3ncqqYeJ3RzuCLdG/d23g/PvjexxOz9n6c9Zc
         NGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgpfUef615DcLIUzOgLkrxoKuWRELnsE1l6w9AZDy3IS/vhthiWrDlFUm2U0E8zTmyumAg4lBTYfVaD5dzJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuDjKqJuTEI5IkTL3IbROnxnvTal3nqg43hGUwMTB0K9Rvevme
	wzEgZEp2N96/4vmFkb/QdRUDg3W2gxCEUDPLB6AlWT0KXA5/JBnwyuvURJSfpKfceT+V2dAE0uX
	XzuXgLhfuTiv0TtgqVQ==
X-Google-Smtp-Source: AGHT+IFiCznOq3jJbbGi+1Po7x6b9rs4AbbiNhIwAWz98uYVYGfItGbGzMFvBzl0siZ+LujshcHcrsGvZWg5Wc0=
X-Received: from wmgg24.prod.google.com ([2002:a05:600d:18:b0:46f:aa50:d706])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8c:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-471178a4af1mr25882615e9.13.1760706618472;
 Fri, 17 Oct 2025 06:10:18 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:10:17 +0000
In-Reply-To: <20251016202044.2748678-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016202044.2748678-1-lyude@redhat.com>
Message-ID: <aPJAOXtv2knFkyDP@google.com>
Subject: Re: [PATCH] rust: drm/gem: Remove Object.dev
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 16, 2025 at 04:18:58PM -0400, Lyude Paul wrote:
> I noticed by chance that there's actually already a pointer to this in
> struct drm_gem_object. So, no use in carrying this around!
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 30c853988b942..28d929edae267 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -187,12 +187,10 @@ impl<T: IntoGEMObject> BaseObject for T {}
>  /// Invariants
>  ///
>  /// - `self.obj` is a valid instance of a `struct drm_gem_object`.
> -/// - `self.dev` is always a valid pointer to a `struct drm_device`.
>  #[repr(C)]
>  #[pin_data]
>  pub struct Object<T: DriverObject + Send + Sync> {
>      obj: Opaque<bindings::drm_gem_object>,
> -    dev: NonNull<drm::Device<T::Driver>>,
>      #[pin]
>      data: T,
>  }
> @@ -222,9 +220,6 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
>              try_pin_init!(Self {
>                  obj: Opaque::new(bindings::drm_gem_object::default()),
>                  data <- T::new(dev, size),
> -                // INVARIANT: The drm subsystem guarantees that the `struct drm_device` will live
> -                // as long as the GEM object lives.
> -                dev: dev.into(),
>              }),
>              GFP_KERNEL,
>          )?;
> @@ -247,9 +242,9 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
>  
>      /// Returns the `Device` that owns this GEM object.
>      pub fn dev(&self) -> &drm::Device<T::Driver> {
> -        // SAFETY: The DRM subsystem guarantees that the `struct drm_device` will live as long as
> -        // the GEM object lives, hence the pointer must be valid.
> -        unsafe { self.dev.as_ref() }
> +        // SAFETY: `struct drm_gem_object.dev` is initialized and valid for as long as the GEM
> +        // object lives.
> +        unsafe { drm::Device::from_raw((*self.as_raw()).dev) }

The wording here and in the invariants could be improved to say that
T::Driver is the right choice for the generic parameter.

Alice
