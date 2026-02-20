Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F9B326D6B
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771575400; cv=none; b=HVpkvKVMQ5i+1wKGU7WE4BcfZ+/Hao0gS82ArgSFS/0ww6I7Sl9rJuWCKzcGxxFfVUMqsJSwr6rk0DKlVqW1pohMJ6QAwT1SagO5d9OEwZd5BXP0O9E8ICY4VSPibUFfllhhxJlVhaw1BQ/YeEzlD1ufOO17THG+3652SMzVOPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771575400; c=relaxed/simple;
	bh=JEMcAPfavE4xeyGu3udM3KXamn237t2x+0V0qZcEuEQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tDx86qMdO6zB4CIr+0risalvTq6CLleA27CSDvENwWEnabBZdl+ALb1GD3BLJ8O3ezyQbodBaFBWFEcMmEtnRpSBZCHtoHIG3LOXwPZkZ9xSGYLtG52/dF8p0vErW4qGfGVjfHvYXwJu6i0t1CI2FYSctKRM4Q9KDxbX5dKmpFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nKr01JHj; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nKr01JHj"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-658c19d5ca0so2076552a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 00:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771575397; x=1772180197; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PyET7l0I7fLKTMPMjBwCdOePtcIDSdcQj0ubAt5TBQI=;
        b=nKr01JHjklK2dSMEqV1/7jyUXsXPyEvEvT0Ft6KczWU5G6I+MIQzcGwxwYSN3EEiXL
         wo8XaIgCFeEa1Y54T7ZAr+id4l07UhBN3e8e5o0e0/QMxPbnSjt9Tbs/Q1cLQcDx04NA
         KfyXilX63gNUEr6McrQ4EbeL5OfVsbNkW6xnjNJmdmzQN5X1WodVFzY/txHWeCa3Ujkh
         ncbvIw7YsYFWRFE3MLT/Ma9g5wuzxJCazgInYxKYUYzEjj3bm+GCgrpAd5XXWbXTC/I/
         kmIcmY5g5wczvqG3WXNimFfERD9G7LhgpW6unSn6+nLWyDN7JByjoleYlY3eG1bmY6HZ
         WCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771575397; x=1772180197;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PyET7l0I7fLKTMPMjBwCdOePtcIDSdcQj0ubAt5TBQI=;
        b=VEnGyVqx0It8ijKKJusO0LHbG2xhc/O4G28UizKHdCDgb0Ik0QikkeTFaXIhy9vIEC
         zmqHpJ97y5zAh/gaVuU4pBQ2SASsJWYuwPCPNKSgORWPHJ0K+M0vPnWOGoaKPCHBtmWB
         F+h+3L/bEOnVm8SGZ6HHiWBBkyeq77v/ITvOO0kJ+VgJLMBubx6debTHvDL4Z6tbv9VY
         DNABRDd6F/l8HgMPub7zeZD3XNIG+f9WyNWOkOLztu3UG+10KAVmYyBNpKAVwkzRRlRz
         S03uqhwucoG4SlE/1Fz2RuCgQCXDb5tURDjebsWHctw/sNajy6ed/2ODEWa9W4ipZWSf
         0SHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2bMV1SWI7xQ7Tndqp1zmr5GuH20SvVz/TD+pX0w98M2ihH015nhfepRaYDcuyFhIyvDxKuji8v/zPaxrKkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwuJQIv5ZU9a9Mi50dbStFLNPdSruyVY/xcMbfXv4VoKXhtKfl
	5dNPJCVXCWGfS/G7I/rvfLe0LtjHAGrFpYEDyEFwy+61SHlxXY50wn0DPLHoGTnmwih+LQxxfxq
	vBgMqAPeic3q35SqQFA==
X-Received: from edvd12.prod.google.com ([2002:aa7:ce0c:0:b0:659:31c4:b9d0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27d0:b0:65c:b71:e69e with SMTP id 4fb4d7f45d1cf-65e825a4ef5mr496694a12.8.1771575396787;
 Fri, 20 Feb 2026 00:16:36 -0800 (PST)
Date: Fri, 20 Feb 2026 08:16:35 +0000
In-Reply-To: <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com> <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
Message-ID: <aZgYY_fetgz_GDR8@google.com>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 19, 2026 at 08:22:14PM +0100, Danilo Krummrich wrote:
> On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> > +/// Represents that a given GEM object has at least one mapping on this [`GpuVm`] instance.
> > +///
> > +/// Does not assume that GEM lock is held.
> > +#[repr(C)]
> > +#[pin_data]
> > +pub struct GpuVmBo<T: DriverGpuVm> {
> > +    #[pin]
> > +    inner: Opaque<bindings::drm_gpuvm_bo>,
> > +    #[pin]
> > +    data: T::VmBoData,
> > +}
> > +
> > +impl<T: DriverGpuVm> GpuVmBo<T> {
> > +    pub(super) const ALLOC_FN: Option<unsafe extern "C" fn() -> *mut bindings::drm_gpuvm_bo> = {
> > +        use core::alloc::Layout;
> > +        let base = Layout::new::<bindings::drm_gpuvm_bo>();
> > +        let rust = Layout::new::<Self>();
> > +        assert!(base.size() <= rust.size());
> > +        if base.size() != rust.size() || base.align() != rust.align() {
> > +            Some(Self::vm_bo_alloc)
> > +        } else {
> > +            // This causes GPUVM to allocate a `GpuVmBo<T>` with `kzalloc(sizeof(drm_gpuvm_bo))`.
> > +            None
> 
> So, if T::VmBoData is a ZST *and* needs drop, we may end up allocating on the C
> side and freeing on the Rust side.
> 
> I assume this is intentional and there is nothing wrong with it, but without a
> comment it might be a bit subtle.

Yeah it's subtle but correct.

> Another subtlety is that vm_bo_free() and vm_bo_alloc() assume that inner is
> always the first member. I'd probably add a brief comment why this even has to
> be the case, i.e. vm_bo_alloc() does not return *mut c_void, but *mut
> bindings::drm_gpuvm_bo.

I will add comments.

> > +    /// Access this [`GpuVmBo`] from a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// For the duration of `'a`, the pointer must reference a valid `drm_gpuvm_bo` associated with
> > +    /// a [`GpuVm<T>`].
> > +    #[inline]
> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &'a Self {
> 
> I think this a good candidate for crate private, as we don't want drivers to use
> this, but still use it in other DRM core modules.
> 
> > +        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
> > +        unsafe { &*ptr.cast() }
> > +    }
> > +
> > +    /// Returns a raw pointer to underlying C value.
> > +    #[inline]
> > +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> 
> Less important, but probably also only needed in core DRM code.

For cases like these two, I do think one can run into cases where you
want them to be public. E.g. the vma confusion bugfix uses a raw pointer
for now:
https://lore.kernel.org/all/20260218-binder-vma-check-v2-1-60f9d695a990@google.com/

I'm generally not so worried about methods like these being public
because they can't be used without unsafe.

> > +    /// Look up whether there is an existing [`GpuVmBo`] for this gem object.
> > +    #[inline]
> > +    pub(super) fn obtain(self) -> GpuVmBoRegistered<T> {
> > +        let me = ManuallyDrop::new(self);
> > +        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
> > +        let ptr = unsafe { bindings::drm_gpuvm_bo_obtain_prealloc(me.as_raw()) };
> > +
> > +        // Add the vm_bo to the extobj list if it's an external object, and if the vm_bo does not
> > +        // already exist. (If we are using an existing vm_bo, it's already in the extobj list.)
> > +        if ptr::eq(ptr, me.as_raw()) && me.gpuvm().is_extobj(me.obj()) {
> > +            let resv_lock = me.gpuvm().raw_resv();
> > +            // SAFETY: The GPUVM is still alive, so its resv lock is too.
> > +            unsafe { bindings::dma_resv_lock(resv_lock, ptr::null_mut()) };
> 
> Maybe add a TODO to replace this with a proper lock guard once available?

Ok.

> > +/// A [`GpuVmBo`] object in the GEM list.
> > +///
> > +/// # Invariants
> > +///
> > +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` and is present in the gem list.
> > +pub struct GpuVmBoRegistered<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> 
> I know that I proposed to rename this from GpuVmBoResident to GpuVmBoRegistered
> in a drive-by comment on v3.
> 
> But now that I have a closer look, I think it would be nice to just have GpuVmBo
> being the registered one and GpuVmBoAlloc being the pre-allocated one.
> 
> As it is currently, I think it is bad to ever present a &GpuVmBo to a driver
> because it implies that we don't know whether it is a pre-allocated one or a
> "normal", registered one. But we do always know.

Actually, I think GpuVmBo is already the registered one.
GpuVmBoRegistered is just ARef<GpuVmBo<T>>.

> For instance, in patch 6 we give out &'op GpuVmBo<T>, but it actually carries
> the invariant of being registered.
> 
> Of course, we could fix this by giving out a &'op GpuVmBoRegistered<T> instead,
> but it would be nice to not have drivers be in touch with a type that can be one
> or the other.
> 
> I know that the current GpuVmBo<T> also serves the purpose of storing common
> code. Maybe we can make it private, call it GpuVmBoInner<T> and have inline
> forwarding methods for GpuVmBo<T> and GpuVmBoAlloc<T>. This is slightly more
> overhead in this implementation due to the forwarding methods, but less
> ambiguity for drivers, which I think is more important.

I think we should keep the current state that GpuVmBo is registered, and
only GpuVmBoAlloc is not. That is most useful.

Alice
