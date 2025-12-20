Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8381B424F
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224101; cv=none; b=EXlTEauYiJ+NA1tf47gIJOp+CCkhQ2YlOi1GpyOBFRxYiwp66a+zWOmJZRc8Fn0ZzxAiLnLu7mPGuq4U8Ge+CTHm7uYiabQNy7jU+MMpQlXArmCtaGyySCy1K/sOY3an24tORbBwnyjN3C4nyjOBfFCR+NTs6Z8sMtY740kOhSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224101; c=relaxed/simple;
	bh=rqVPjPvOP/eczPJdYGczf1j/6Xtk0OMMW37CAdn8u8U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SzQfEcLTbCsN48IDPW6LN22lGZkGJcXtK+ebsm5Q5LZtJF8DLDluPkbo4PMPE/hBXhDcn5Wsj2QR52UiN3ACQbjdr3F9F8lr6uds4XVwNMcs2fq4AC9uM7Da5OGkmrhlPVoQ4bbn2XVCMeZjVsI6p/XskK4UhD5an7Ee1ROzDOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q4uxg6Vw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q4uxg6Vw"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so20915645e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 01:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766224099; x=1766828899; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
        b=Q4uxg6Vwu3VxffWrGfyJrv+togy6gbYjxNv/HGQjR3rSamdZ+GiovZ65u+1XkgXjql
         bjSAzqihfbNVN7eY8zGtQeLWut/AeR3Hjd1s1r5yVdL5oU+ePlEzL4zbdROifqe2zgUX
         khxODN+T7l9hXwQtmJbpvokq4NsDy3HlHgBo6SiyGKaOecaxPqEbvvNe0oO0Q/v9hEgy
         HqIdmFXf2eF3anX1KoLlMOKC0HUH+YwclnVyqdUkGPeaGyH3StodtRtjz19uO0hF2v3w
         GVvFmSG72TewQOdTQSC3indiaBToMbo/zwy05oGLgVYBVWOOL9pQvJuonY0QDbjDvNod
         n/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224099; x=1766828899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOW4PnpVwJ1a1ow90wBbPY5V5qFqMGNXJlCYoRRToZ8=;
        b=XnJz5B0JaCzyaC6t2SzIPGny5W2/fNPRVTUs3uRxdTXmeDZLm79buNKMBURdFTwQVf
         xVZKuKVuGjkmDG2j7eC9SKhwn1WE0aBX3J8QcXdj80Rd7neb0tEB4XFMYpEfkRntcI5k
         plYafQd1cui4VC482GONv+yhCF8pkVNLQRG1OS5CCyn7U3Vac7gIITk/syzssYwkv7af
         NjIqqc2PIj8ky3c3HHWqDSfKF8n0SFLcWr5fhxiTQplqaZkTjpcfldc1zY+LPj5a+ibV
         vtB5xtKXuaXxWk3Xx95ozLaNn49/KRZdptkulCSyO9VN1kMaIjMKbK/0AXR+wwxDxLAh
         de7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY1NOQgf1ZDZK1TtuUZ1QmUfBgY1YkmfoCD9evTvE5Y74OY7Pmo9d8kTUkHEWNLa33nyn4+r+hMxFoX5//Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo1+wgW/LrBNPvMox9ZuqVG8CJS1OLl5A7ufaHkrEDCLC14Ni3
	9SjeAjy/Z/ScM/etYC/PvDNcZ+mVSTav7o6mVLO2cNmJx+d5BCLGKmsdp9Bl2ws5Ar7vqkeWbxB
	IB/JwU8UfANWo+Yj3Sw==
X-Google-Smtp-Source: AGHT+IF/wwyCbmZKrb9+OJuirDYtRZw2m8SWoZaJ0QqeIqy0vt7I3G/xdsnBsD2ylGONwHmPG8Ly7PYUfnT9IJg=
X-Received: from wmbjp12.prod.google.com ([2002:a05:600c:558c:b0:475:decb:4c4d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:608d:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-47d195667d6mr53518855e9.10.1766224098608;
 Sat, 20 Dec 2025 01:48:18 -0800 (PST)
Date: Sat, 20 Dec 2025 09:48:17 +0000
In-Reply-To: <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com> <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
Message-ID: <aUZw4fpWRUWFsb9r@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Lyude Paul <lyude@redhat.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

On Fri, Dec 19, 2025 at 04:35:00PM +0100, Danilo Krummrich wrote:
> On Fri Nov 28, 2025 at 3:14 PM CET, Alice Ryhl wrote:
> > +    /// Returns a [`GpuVmBoObtain`] for the provided GEM object.
> > +    #[inline]
> > +    pub fn obtain(
> > +        &self,
> > +        obj: &T::Object,
> > +        data: impl PinInit<T::VmBoData>,
> > +    ) -> Result<GpuVmBoObtain<T>, AllocError> {
> > +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> > +    }
> 
> Does this method make sense? We usually preallocate a VM_BO, then enter the
> fence signalling critical path and then obtain the VM_BO.

Hmm, but there is something tricky here. When do we add it to the extobj
list, then? If we add it before starting the critical path, then we must
also call drm_gpuvm_bo_obtain_prealloc() before starting the critical
path because obtain must happen before drm_gpuvm_bo_extobj_add(). And
adding it to extobj after signalling the fence seems error prone.

And besides, adding it to the extobj list before the critical path
means that we can have drm_gpuvm_exec_lock() lock the new BO without
having to do anything special - it's simply in the extobj list by the
time we call drm_gpuvm_exec_lock().

> > +impl<T: DriverGpuVm> DerefMut for GpuVmCore<T> {
> > +    #[inline]
> > +    fn deref_mut(&mut self) -> &mut T {
> > +        // SAFETY: By the type invariants we may access `core`.
> > +        unsafe { &mut *self.0.core.get() }
> > +    }
> > +}
> 
> Hm..it seems more natural to me to deref to &GpuVm<T> and provide data() and
> data_mut().

That's fair.

> > +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> > +    #[inline]
> > +    fn drop(&mut self) {
> > +        // SAFETY: It's safe to perform a deferred put in any context.
> > +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
> 
> This does not need to be deferred, no?

I think what I *actually* want to call here is

	kref_put(&self->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);

like what drm_gpuvm_bo_obtain_prealloc() does as of the first patch in
this series.

> > +    }
> > +}
> > +
> > +/// A [`GpuVmBo`] object in the GEM list.
> > +///
> > +/// # Invariants
> > +///
> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> > +pub struct GpuVmBoObtain<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> 
> How is this different from GpuVmBo? The only object that is not in the GEM list
> should be GpuVmBoAlloc, i.e. the preallocated one.

The difference is whether there is pointer indirection or not.

This type is morally an ARef<GpuVm<T>>, except I don't expose any way
to increment the refcount.

Alice
