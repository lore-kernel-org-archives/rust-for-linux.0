Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9C33F373;
	Wed, 21 Jan 2026 17:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769016729; cv=pass; b=pdLyUQgpKQwzyET3fCxDfFd42e6zcYSJJm6KK806U6Cv+uJim3eVMNrVPMKtLADZ2/QQfw0SOTQyEPXW0ePdrUWdfD/tSm1LF03hnuX/Wkw2W796rY6QOGgbUhiyrXn/4WbT2QdzDPoZpBdKHtb4bkNLMHmKHmuGGR691o55jmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769016729; c=relaxed/simple;
	bh=1gM6P+aKo1zzF6qaFZyMT5D9q65C1wZd1sCiehhOgwA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Zc/ZDgcb5+S4vqVX0v0gUy607ccYnh79hy1i5te6OTgpUTMqLu7WyOCT1jfKC91BTaJkYpacZUpGsgd2WhDl/4/UbLsPleYxl+q0gXWU5gKFOdpNPtCqAJmPQt4Jerl16n88zAd70KMrsS8O6pHf3S8nDzo3poSvGKu5Ypnl6jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=R6VJiYOs; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="R6VJiYOs"
ARC-Seal: i=1; a=rsa-sha256; t=1769016705; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yy1eI9bWp2X48L9uQyrRW+0kzsIvrK15CDZ/Qa8rkkHJNSgORut9AG4PouIx7/D22FjIr6/C83Zw0rt3qOTFVMEBFSmJMAjlQkcNJlTh4amuTCABZtTUcH15sWeOCwKkQbnW1HTia+uU7IVlDeHUEJ8PgY7Q7cqB38zlfDcysPI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769016705; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=URdt5KiuBpMRqsnqjYUPR+eoLsDfCQvUnjUE3NGoKCg=; 
	b=ZlcpXKkIPhKF5a4yUCk6RO2nyCyuRsqOJ9MNax1+KdkMeEfSjNRtQc0HrbCktM7JsXn9D8Yll2isaPiYcuOVjzl70AHZT2FP/Ib+6kT9XIjaPbE+wzpNSFrunyhveK9ZVeFhOCHAJTAwmEGelDLVVurLHgJ8Tltfv5BqXORKNsM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769016704;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=URdt5KiuBpMRqsnqjYUPR+eoLsDfCQvUnjUE3NGoKCg=;
	b=R6VJiYOs7XTuAh+pSh0B6VgjfspxQ79hHh/YSp/l8HPVo9uUopnMItA4ZWfLJsLF
	INTKtzOHpsJy7ENv2zDQ5zqMEnSSVlKXYZjB8/OwlZT1RPfOF0CJM1QGQN2qZh46eAw
	lavfaGpb9AsoNjM519TLMvOU44WmMNYj7SQwNOwM=
Received: by mx.zohomail.com with SMTPS id 1769016702659351.889045124566;
	Wed, 21 Jan 2026 09:31:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 3/6] rust: gpuvm: add GpuVm::obtain()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
Date: Wed, 21 Jan 2026 14:31:26 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Janne Grunau <j@jannau.net>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C31C1A08-D626-48D6-8F8C-39209BF94B50@collabora.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-3-dd95c04aec35@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Alice,

This looks good. See a few nits below:

> On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> This provides a mechanism to create (or look up) VMBO instances, which
> represent the mapping between GPUVM and GEM objects.
>=20
> The GpuVmBoResident<T> type can be considered like ARef<GpuVm<T>>,
> except that no way to increment the refcount is provided.

So this is like GpuVmCore, right? Since that is an ARef whose refcount =
cannot
be incremented.

>=20
> The GpuVmBoAlloc<T> type is more akin to a pre-allocated GpuVm<T>, so
> it's not really a GpuVm<T> yet. Its destructor could call

Maybe you mean a pre-allocated GpuVmBo?

> drm_gpuvm_bo_destroy_not_in_lists(), but as the type is currently
> private and never called anywhere, this perf optimization does not =
need
> to happen now.
>=20
> Pre-allocating and obtaining the gpuvm_bo object is exposed as a =
single
> step. This could theoretically be a problem if one wanted to call
> drm_gpuvm_bo_obtain_prealloc() during the fence signalling critical
> path, but that's not a possibility because:
>=20
> 1. Adding the BO to the extobj list requires the resv lock, so it =
cannot
>   happen during the fence signalling critical path.
> 2. obtain() requires that the BO is not in the extobj list, so =
obtain()
>   must be called before adding the BO to the extobj list.
>=20
> Thus, drm_gpuvm_bo_obtain_prealloc() cannot be called during the fence
> signalling critical path. (For extobjs at least.)

What about internal objects? This is merely a sanity check from my side.

>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> rust/kernel/drm/gpuvm/mod.rs   |  32 +++++-
> rust/kernel/drm/gpuvm/vm_bo.rs | 219 =
+++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 248 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gpuvm/mod.rs =
b/rust/kernel/drm/gpuvm/mod.rs
> index =
81b5e767885d8258c44086444b153c91961ffabc..cb576a7ffa07bc108704e008b7f87de5=
2a837930 100644
> --- a/rust/kernel/drm/gpuvm/mod.rs
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -25,13 +25,20 @@
>=20
> use core::{
>     cell::UnsafeCell,
> +    mem::ManuallyDrop,
>     ops::{
>         Deref,
>         Range, //
>     },
> -    ptr::NonNull, //
> +    ptr::{
> +        self,
> +        NonNull, //
> +    }, //
> };
>=20
> +mod vm_bo;
> +pub use self::vm_bo::*;
> +
> /// A DRM GPU VA manager.
> ///
> /// This object is refcounted, but the "core" is only accessible using =
a special unique handle. The
> @@ -68,8 +75,8 @@ const fn vtable() -> &'static =
bindings::drm_gpuvm_ops {
>             vm_free: Some(Self::vm_free),
>             op_alloc: None,
>             op_free: None,
> -            vm_bo_alloc: None,
> -            vm_bo_free: None,
> +            vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
> +            vm_bo_free: GpuVmBo::<T>::FREE_FN,
>             vm_bo_validate: None,
>             sm_step_map: None,
>             sm_step_unmap: None,
> @@ -166,6 +173,16 @@ pub fn va_range(&self) -> Range<u64> {
>         Range { start, end }
>     }
>=20
> +    /// Get or create the [`GpuVmBo`] for this gem object.
> +    #[inline]
> +    pub fn obtain(
> +        &self,
> +        obj: &T::Object,
> +        data: impl PinInit<T::VmBoData>,
> +    ) -> Result<GpuVmBoResident<T>, AllocError> {
> +        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
> +    }
> +
>     /// Clean up buffer objects that are no longer used.
>     #[inline]
>     pub fn deferred_cleanup(&self) {
> @@ -191,6 +208,12 @@ pub fn is_extobj(&self, obj: &T::Object) -> bool =
{
>         // SAFETY: By type invariants we can free it when refcount =
hits zero.
>         drop(unsafe { KBox::from_raw(me) })
>     }
> +
> +    #[inline]
> +    fn raw_resv_lock(&self) -> *mut bindings::dma_resv {
> +        // SAFETY: `r_obj` is immutable and valid for duration of =
GPUVM.
> +        unsafe { (*(*self.as_raw()).r_obj).resv }
> +    }

Shouldn=E2=80=99t we call this raw_resv? Adding =E2=80=9Clock=E2=80=9D =
to a name may incorrectly
hint that the lock is actually taken.

> }
>=20
> /// The manager for a GPUVM.
> @@ -200,6 +223,9 @@ pub trait DriverGpuVm: Sized {
>=20
>     /// The kind of GEM object stored in this GPUVM.
>     type Object: IntoGEMObject;
> +
> +    /// Data stored with each `struct drm_gpuvm_bo`.
> +    type VmBoData;
> }
>=20
> /// The core of the DRM GPU VA manager.
> diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs =
b/rust/kernel/drm/gpuvm/vm_bo.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..310fa569b5bd43f0f872ff859b362437=
7b93d651
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/vm_bo.rs
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +use super::*;
> +
> +/// Represents that a given GEM object has at least one mapping on =
this [`GpuVm`] instance.
> +///
> +/// Does not assume that GEM lock is held.
> +#[repr(C)]
> +#[pin_data]
> +pub struct GpuVmBo<T: DriverGpuVm> {
> +    #[pin]
> +    inner: Opaque<bindings::drm_gpuvm_bo>,
> +    #[pin]
> +    data: T::VmBoData,
> +}
> +
> +impl<T: DriverGpuVm> GpuVmBo<T> {
> +    pub(super) const ALLOC_FN: Option<unsafe extern "C" fn() -> *mut =
bindings::drm_gpuvm_bo> =3D {
> +        use core::alloc::Layout;
> +        let base =3D Layout::new::<bindings::drm_gpuvm_bo>();
> +        let rust =3D Layout::new::<Self>();
> +        assert!(base.size() <=3D rust.size());
> +        if base.size() !=3D rust.size() || base.align() !=3D =
rust.align() {
> +            Some(Self::vm_bo_alloc)
> +        } else {
> +            // This causes GPUVM to allocate a `GpuVmBo<T>` with =
`kzalloc(sizeof(drm_gpuvm_bo))`.
> +            None
> +        }
> +    };
> +
> +    pub(super) const FREE_FN: Option<unsafe extern "C" fn(*mut =
bindings::drm_gpuvm_bo)> =3D {
> +        if core::mem::needs_drop::<Self>() {
> +            Some(Self::vm_bo_free)
> +        } else {
> +            // This causes GPUVM to free a `GpuVmBo<T>` with `kfree`.
> +            None
> +        }
> +    };
> +
> +    /// Custom function for allocating a `drm_gpuvm_bo`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Always safe to call.
> +    // Unsafe to match function pointer type in C struct.

Is this missing an extra =E2=80=9C/=E2=80=9C token? Also, I think this =
is a bit hard to parse initially.

> +    unsafe extern "C" fn vm_bo_alloc() -> *mut bindings::drm_gpuvm_bo =
{
> +        KBox::<Self>::new_uninit(GFP_KERNEL | __GFP_ZERO)
> +            .map(KBox::into_raw)
> +            .unwrap_or(ptr::null_mut())
> +            .cast()
> +    }
> +
> +    /// Custom function for freeing a `drm_gpuvm_bo`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The pointer must have been allocated with =
[`GpuVmBo::ALLOC_FN`], and must not be used after
> +    /// this call.
> +    unsafe extern "C" fn vm_bo_free(ptr: *mut bindings::drm_gpuvm_bo) =
{
> +        // SAFETY:
> +        // * The ptr was allocated from kmalloc with the layout of =
`GpuVmBo<T>`.
> +        // * `ptr->inner` has no destructor.
> +        // * `ptr->data` contains a valid `T::VmBoData` that we can =
drop.
> +        drop(unsafe { KBox::<Self>::from_raw(ptr.cast()) });
> +    }
> +
> +    /// Access this [`GpuVmBo`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of `'a`, the pointer must reference a valid =
`drm_gpuvm_bo` associated with
> +    /// a [`GpuVm<T>`].
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> =
&'a Self {
> +        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> +        self.inner.get()
> +    }
> +
> +    /// The [`GpuVm`] that this GEM object is mapped in.
> +    #[inline]
> +    pub fn gpuvm(&self) -> &GpuVm<T> {
> +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> +        unsafe { GpuVm::<T>::from_raw((*self.inner.get()).vm) }
> +    }
> +
> +    /// The [`drm_gem_object`](crate::gem::Object) for these =
mappings.
> +    #[inline]
> +    pub fn obj(&self) -> &T::Object {
> +        // SAFETY: The `obj` pointer is guaranteed to be valid.
> +        unsafe { <T::Object as =
IntoGEMObject>::from_raw((*self.inner.get()).obj) }
> +    }
> +
> +    /// The driver data with this buffer object.
> +    #[inline]
> +    pub fn data(&self) -> &T::VmBoData {
> +        &self.data
> +    }
> +}
> +
> +/// A pre-allocated [`GpuVmBo`] object.
> +///
> +/// # Invariants
> +///
> +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData`, =
has a refcount of one, and is
> +/// absent from any gem, extobj, or evict lists.
> +pub(super) struct GpuVmBoAlloc<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> +
> +impl<T: DriverGpuVm> GpuVmBoAlloc<T> {
> +    /// Create a new pre-allocated [`GpuVmBo`].
> +    ///
> +    /// It's intentional that the initializer is infallible because =
`drm_gpuvm_bo_put` will call
> +    /// drop on the data, so we don't have a way to free it when the =
data is missing.
> +    #[inline]
> +    pub(super) fn new(
> +        gpuvm: &GpuVm<T>,
> +        gem: &T::Object,
> +        value: impl PinInit<T::VmBoData>,
> +    ) -> Result<GpuVmBoAlloc<T>, AllocError> {
> +        // CAST: `GpuVmBoAlloc::vm_bo_alloc` ensures that this memory =
was allocated with the layout
> +        // of `GpuVmBo<T>`. The type is repr(C), so `container_of` is =
not required.
> +        // SAFETY: The provided gpuvm and gem ptrs are valid for the =
duration of this call.
> +        let raw_ptr =3D unsafe {
> +            bindings::drm_gpuvm_bo_create(gpuvm.as_raw(), =
gem.as_raw()).cast::<GpuVmBo<T>>()
> +        };
> +        let ptr =3D NonNull::new(raw_ptr).ok_or(AllocError)?;
> +        // SAFETY: `ptr->data` is a valid pinned location.
> +        let Ok(()) =3D unsafe { value.__pinned_init(&raw mut =
(*raw_ptr).data) };
> +        // INVARIANTS: We just created the vm_bo so it's absent from =
lists, and the data is valid
> +        // as we just initialized it.
> +        Ok(GpuVmBoAlloc(ptr))
> +    }
> +
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub(super) fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> +        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
> +        unsafe { (*self.0.as_ptr()).inner.get() }
> +    }
> +
> +    /// Look up whether there is an existing [`GpuVmBo`] for this gem =
object.
> +    #[inline]
> +    pub(super) fn obtain(self) -> GpuVmBoResident<T> {
> +        let me =3D ManuallyDrop::new(self);
> +        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
> +        let ptr =3D unsafe { =
bindings::drm_gpuvm_bo_obtain_prealloc(me.as_raw()) };
> +
> +        // If the vm_bo does not already exist, ensure that it's in =
the extobj list.

Wording is a bit off. Obviously only external objects should be in the =
extobj
list. This is correctly captured by the check below, but the wording =
above
makes it sound unconditional.

> +        if ptr::eq(ptr, me.as_raw()) && =
me.gpuvm().is_extobj(me.obj()) {
> +            let resv_lock =3D me.gpuvm().raw_resv_lock();
> +            // SAFETY: The GPUVM is still alive, so its resv lock is =
too.
> +            unsafe { bindings::dma_resv_lock(resv_lock, =
ptr::null_mut()) };
> +            // SAFETY: We hold the GPUVMs resv lock.
> +            unsafe { bindings::drm_gpuvm_bo_extobj_add(ptr) };
> +            // SAFETY: We took the lock, so we can unlock it.
> +            unsafe { bindings::dma_resv_unlock(resv_lock) };
> +        }
> +
> +        // INVARIANTS: Valid `drm_gpuvm_bo` in the GEM list.
> +        // SAFETY: `drm_gpuvm_bo_obtain_prealloc` always returns a =
non-null ptr
> +        GpuVmBoResident(unsafe { NonNull::new_unchecked(ptr.cast()) =
})
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVmBoAlloc<T> {
> +    type Target =3D GpuVmBo<T>;
> +    #[inline]
> +    fn deref(&self) -> &GpuVmBo<T> {
> +        // SAFETY: By the type invariants we may deref while `Self` =
exists.
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // TODO: Call drm_gpuvm_bo_destroy_not_in_lists() directly.
> +        // SAFETY: It's safe to perform a deferred put in any =
context.
> +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) =
};
> +    }
> +}
> +
> +/// A [`GpuVmBo`] object in the GEM list.
> +///
> +/// # Invariants
> +///
> +/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData` =
and is present in the gem list.
> +pub struct GpuVmBoResident<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
> +
> +impl<T: DriverGpuVm> GpuVmBoResident<T> {
> +    /// Returns a raw pointer to underlying C value.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
> +        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
> +        unsafe { (*self.0.as_ptr()).inner.get() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVmBoResident<T> {
> +    type Target =3D GpuVmBo<T>;
> +    #[inline]
> +    fn deref(&self) -> &GpuVmBo<T> {
> +        // SAFETY: By the type invariants we may deref while `Self` =
exists.
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Drop for GpuVmBoResident<T> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: It's safe to perform a deferred put in any =
context.
> +        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) =
};
> +    }
> +}
>=20
> --=20
> 2.52.0.457.g6b5491de43-goog
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
