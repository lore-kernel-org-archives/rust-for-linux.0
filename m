Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77B947A0B5;
	Wed, 21 Jan 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015134; cv=pass; b=mWemnvJuYYSswl0CbfBvSCIXa3ahpjewEcHNzOuu/BDKk/nzZyT50RrgTHAw6FTZuYr0g2K/WdEnEXV1SXQDyOe3XGYxI1AAtQSCE8FgucUzqr0PBi5FX21MrpNoAMQjQeppmnpylU+3i6otmtysGwj4xCv0rBDCgRSGC29Y+Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015134; c=relaxed/simple;
	bh=TTHkS79n1uLPGBmAuoFfvfFuL7n4O8BEUqjEC/gbrR0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jvkIW5z2bxiXAx8kopKW8hscNQufye7ETe5cXoC7Khn+Z3D+b4TofV3i6ZF6a7B9CM1OELNfLoqP6sH0dGiLiMcssVK9U1LsUh6/VJ4pLfgCNT4kUqbq68CBYXn8vS51Cq31BPgY5oTaH5jeIxqt48tsIxUQVQImvFb//Vf+TXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=bnHcVk2X; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bnHcVk2X"
ARC-Seal: i=1; a=rsa-sha256; t=1769015090; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QZICHcC95ZpklvfWEkDLCzvBtcFzD9y99SXp7U/IXMY1vSEUJpqoKWehzg9P8UwMQAN9Pwze0pQnnl+ilLNIWFpZt93Z0OQawSo7fiWLhSeTCPoGN1/quSYvXWmY/YSApwR24TJRBKvOu+xmxBhaTj9S9sgUa8HvO2yZSiBZQvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769015090; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dZkuuGxpeogOiWY6FL3madw0+8/PIOeqXZFUN2JlwYk=; 
	b=ezrUNrFAMYobpvPphPQSkRfokkL6ThOA/+q5zSbrG56ADYD6C2271q3/ZU7g90ylh1JXulPztFwyg4csj3NXVzmFo9Bf79tgmOkXgyd9hOZ1C9V1S/M/cQ29pltYkkqbT6/tRWu0N0J2pOBHNBJe1fe/HWaD5k0aq/xrlQA0yW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769015090;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=dZkuuGxpeogOiWY6FL3madw0+8/PIOeqXZFUN2JlwYk=;
	b=bnHcVk2XrJq7aXZBJJUOhtBk2POhQQ89QSO3tciLlIscI+jWhbcdpxCDgb8C9Pbj
	tuBL1LsxFCPtE2/lz67di2hqnenoaqTaBJzpcv80ue5tY+iGvw0418iGFypWqcMOXDs
	MBtQ/+B7DNuBqAL4+TRU+V88k1XCZ0St68AJ7Toc=
Received: by mx.zohomail.com with SMTPS id 1769015089907399.9052330621796;
	Wed, 21 Jan 2026 09:04:49 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/6] rust: drm: add base GPUVM immediate mode
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260121-gpuvm-rust-v3-1-dd95c04aec35@google.com>
Date: Wed, 21 Jan 2026 14:04:33 -0300
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
Message-Id: <52A861BB-9CA1-4F16-AFF5-E3AA96B5833D@collabora.com>
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-1-dd95c04aec35@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Alice,

> On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> From: Asahi Lina <lina+kernel@asahilina.net>
>=20
> Add a GPUVM abstraction to be used by Rust GPU drivers.
>=20
> GPUVM keeps track of a GPU's virtual address (VA) space and manages =
the
> corresponding virtual mappings represented by "GPU VA" objects. It =
also
> keeps track of the gem::Object<T> used to back the mappings through
> GpuVmBo<T>.
>=20
> This abstraction is only usable by drivers that wish to use GPUVM in
> immediate mode. This allows us to build the locking scheme into the =
API
> design. It means that the GEM mutex is used for the GEM gpuva list, =
and
> that the resv lock is used for the extobj list. The evicted list is =
not
> yet used in this version.
>=20
> This abstraction provides a special handle called the GpuVmCore, which
> is a wrapper around ARef<GpuVm> that provides access to the interval
> tree. Generally, all changes to the address space requires mutable
> access to this unique handle.
>=20
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> MAINTAINERS                     |   2 +
> rust/bindings/bindings_helper.h |   1 +
> rust/helpers/drm_gpuvm.c        |  18 ++++
> rust/helpers/helpers.c          |   1 +
> rust/kernel/drm/gpuvm/mod.rs    | 231 =
++++++++++++++++++++++++++++++++++++++++
> rust/kernel/drm/mod.rs          |   1 +
> 6 files changed, 254 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index =
3b84ad595e226f231b256d24f0da6bac459e93a8..618becae72985b9dfdca8469ee48d475=
2fd0ca41 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8720,6 +8720,8 @@ S: Supported
> T: git https://gitlab.freedesktop.org/drm/misc/kernel.git
> F: drivers/gpu/drm/drm_gpuvm.c
> F: include/drm/drm_gpuvm.h
> +F: rust/helpers/drm_gpuvm.c
> +F: rust/kernel/drm/gpuvm/
>=20
> DRM LOG
> M: Jocelyn Falempe <jfalempe@redhat.com>
> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
> index =
a067038b4b422b4256f4a2b75fe644d47e6e82c8..dd60a5c6b142ec2c5fd6df80279ab681=
3163791c 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -33,6 +33,7 @@
> #include <drm/drm_drv.h>
> #include <drm/drm_file.h>
> #include <drm/drm_gem.h>
> +#include <drm/drm_gpuvm.h>
> #include <drm/drm_ioctl.h>
> #include <kunit/test.h>
> #include <linux/auxiliary_bus.h>
> diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
> new file mode 100644
> index =
0000000000000000000000000000000000000000..d1471e5844ec81f994af9252d9054053=
ab13f352
> --- /dev/null
> +++ b/rust/helpers/drm_gpuvm.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +#ifdef CONFIG_DRM_GPUVM
> +
> +#include <drm/drm_gpuvm.h>
> +
> +struct drm_gpuvm *rust_helper_drm_gpuvm_get(struct drm_gpuvm *obj)
> +{
> + return drm_gpuvm_get(obj);
> +}
> +
> +bool rust_helper_drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
> +     struct drm_gem_object *obj)
> +{
> + return drm_gpuvm_is_extobj(gpuvm, obj);
> +}
> +
> +#endif // CONFIG_DRM_GPUVM
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index =
79c72762ad9c4b473971e6210c9577860d2e2b08..0943d589b7578d3c0e207937f63a5e02=
719c6146 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -26,6 +26,7 @@
> #include "device.c"
> #include "dma.c"
> #include "drm.c"
> +#include "drm_gpuvm.c"
> #include "err.c"
> #include "irq.c"
> #include "fs.c"
> diff --git a/rust/kernel/drm/gpuvm/mod.rs =
b/rust/kernel/drm/gpuvm/mod.rs
> new file mode 100644
> index =
0000000000000000000000000000000000000000..81b5e767885d8258c44086444b153c91=
961ffabc
> --- /dev/null
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +#![cfg(CONFIG_DRM_GPUVM =3D "y")]
> +
> +//! DRM GPUVM in immediate mode
> +//!
> +//! Rust abstractions for using GPUVM in immediate mode. This is when =
the GPUVM state is updated
> +//! during `run_job()`, i.e., in the DMA fence signalling critical =
path, to ensure that the GPUVM
> +//! and the GPU's virtual address space has the same state at all =
times.
> +//!
> +//! C header: =
[`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.h)
> +
> +use kernel::{
> +    alloc::AllocError,
> +    bindings,
> +    drm,
> +    drm::gem::IntoGEMObject,
> +    prelude::*,
> +    sync::aref::{
> +        ARef,
> +        AlwaysRefCounted, //
> +    },
> +    types::Opaque, //
> +};
> +
> +use core::{
> +    cell::UnsafeCell,
> +    ops::{
> +        Deref,
> +        Range, //
> +    },
> +    ptr::NonNull, //
> +};
> +
> +/// A DRM GPU VA manager.
> +///
> +/// This object is refcounted, but the "core" is only accessible =
using a special unique handle. The
> +/// core consists of the `core` field and the GPUVM's interval tree.
> +///
> +/// # Invariants
> +///
> +/// * Stored in an allocation managed by the refcount in `self.vm`.
> +/// * Access to `data` and the gpuvm interval tree is controlled via =
the [`GpuVmCore`] type.
> +#[pin_data]
> +pub struct GpuVm<T: DriverGpuVm> {
> +    #[pin]
> +    vm: Opaque<bindings::drm_gpuvm>,
> +    /// Accessed only through the [`GpuVmCore`] reference.
> +    data: UnsafeCell<T>,
> +}
> +
> +// SAFETY: By type invariants, the allocation is managed by the =
refcount in `self.vm`.
> +unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
> +    fn inc_ref(&self) {
> +        // SAFETY: By type invariants, the allocation is managed by =
the refcount in `self.vm`.
> +        unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: By type invariants, the allocation is managed by =
the refcount in `self.vm`.
> +        unsafe { bindings::drm_gpuvm_put((*obj.as_ptr()).vm.get()) };
> +    }
> +}
> +
> +impl<T: DriverGpuVm> GpuVm<T> {
> +    const fn vtable() -> &'static bindings::drm_gpuvm_ops {
> +        &bindings::drm_gpuvm_ops {
> +            vm_free: Some(Self::vm_free),
> +            op_alloc: None,
> +            op_free: None,
> +            vm_bo_alloc: None,
> +            vm_bo_free: None,
> +            vm_bo_validate: None,
> +            sm_step_map: None,
> +            sm_step_unmap: None,
> +            sm_step_remap: None,
> +        }
> +    }
> +
> +    /// Creates a GPUVM instance.
> +    #[expect(clippy::new_ret_no_self)]
> +    pub fn new<E>(
> +        name: &'static CStr,
> +        dev: &drm::Device<T::Driver>,
> +        r_obj: &T::Object,
> +        range: Range<u64>,
> +        reserve_range: Range<u64>,
> +        data: T,
> +    ) -> Result<GpuVmCore<T>, E>
> +    where
> +        E: From<AllocError>,
> +        E: From<core::convert::Infallible>,
> +    {
> +        let obj =3D KBox::try_pin_init::<E>(
> +            try_pin_init!(Self {
> +                data: UnsafeCell::new(data),
> +                vm <- Opaque::ffi_init(|vm| {
> +                    // SAFETY: These arguments are valid. `vm` is =
valid until refcount drops to
> +                    // zero.
> +                    unsafe {
> +                        bindings::drm_gpuvm_init(
> +                            vm,
> +                            name.as_char_ptr(),
> +                            =
bindings::drm_gpuvm_flags_DRM_GPUVM_IMMEDIATE_MODE
> +                                | =
bindings::drm_gpuvm_flags_DRM_GPUVM_RESV_PROTECTED,
> +                            dev.as_raw(),
> +                            r_obj.as_raw(),
> +                            range.start,
> +                            range.end - range.start,
> +                            reserve_range.start,
> +                            reserve_range.end - reserve_range.start,
> +                            const { Self::vtable() },
> +                        )
> +                    }
> +                }),
> +            }? E),
> +            GFP_KERNEL,
> +        )?;
> +        // SAFETY: This transfers the initial refcount to the ARef.
> +        Ok(GpuVmCore(unsafe {
> +            ARef::from_raw(NonNull::new_unchecked(KBox::into_raw(
> +                Pin::into_inner_unchecked(obj),
> +            )))
> +        }))
> +    }
> +
> +    /// Access this [`GpuVm`] from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The pointer must reference the `struct drm_gpuvm` in a valid =
[`GpuVm<T>`] that remains
> +    /// valid for at least `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a =
Self {
> +        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a =
`GpuVm<T>`. Caller ensures the
> +        // pointer is valid for 'a.
> +        unsafe { &*kernel::container_of!(Opaque::cast_from(ptr), =
Self, vm) }
> +    }
> +
> +    /// Returns a raw pointer to the embedded `struct drm_gpuvm`.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm {
> +        self.vm.get()
> +    }
> +
> +    /// The start of the VA space.
> +    #[inline]
> +    pub fn va_start(&self) -> u64 {
> +        // SAFETY: The `mm_start` field is immutable.
> +        unsafe { (*self.as_raw()).mm_start }
> +    }
> +
> +    /// The length of the GPU's virtual address space.
> +    #[inline]
> +    pub fn va_length(&self) -> u64 {
> +        // SAFETY: The `mm_range` field is immutable.
> +        unsafe { (*self.as_raw()).mm_range }
> +    }
> +
> +    /// Returns the range of the GPU virtual address space.
> +    #[inline]
> +    pub fn va_range(&self) -> Range<u64> {
> +        let start =3D self.va_start();
> +        // OVERFLOW: This reconstructs the Range<u64> passed to the =
constructor, so it won't fail.
> +        let end =3D start + self.va_length();
> +        Range { start, end }
> +    }
> +
> +    /// Clean up buffer objects that are no longer used.
> +    #[inline]
> +    pub fn deferred_cleanup(&self) {
> +        // SAFETY: This GPUVM uses immediate mode.
> +        unsafe { =
bindings::drm_gpuvm_bo_deferred_cleanup(self.as_raw()) }
> +    }
> +
> +    /// Check if this GEM object is an external object for this =
GPUVM.
> +    #[inline]
> +    pub fn is_extobj(&self, obj: &T::Object) -> bool {
> +        // SAFETY: We may call this with any GPUVM and GEM object.
> +        unsafe { bindings::drm_gpuvm_is_extobj(self.as_raw(), =
obj.as_raw()) }
> +    }
> +
> +    /// Free this GPUVM.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Called when refcount hits zero.
> +    unsafe extern "C" fn vm_free(me: *mut bindings::drm_gpuvm) {
> +        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a =
`GpuVm<T>`.
> +        let me =3D unsafe { =
kernel::container_of!(Opaque::cast_from(me), Self, vm).cast_mut() };
> +        // SAFETY: By type invariants we can free it when refcount =
hits zero.
> +        drop(unsafe { KBox::from_raw(me) })
> +    }
> +}
> +
> +/// The manager for a GPUVM.
> +pub trait DriverGpuVm: Sized {
> +    /// Parent `Driver` for this object.
> +    type Driver: drm::Driver;
> +
> +    /// The kind of GEM object stored in this GPUVM.
> +    type Object: IntoGEMObject;

Hmm, can=E2=80=99t we derive that from Driver::AllocOps? More =
specifically, shouldn=E2=80=99t we enforce it?

> +}
> +
> +/// The core of the DRM GPU VA manager.
> +///
> +/// This object is a unique reference to the VM that can access the =
interval tree and the Rust
> +/// `data` field.
> +///
> +/// # Invariants
> +///
> +/// Each `GpuVm` instance has at most one `GpuVmCore` reference.
> +pub struct GpuVmCore<T: DriverGpuVm>(ARef<GpuVm<T>>);
> +
> +impl<T: DriverGpuVm> GpuVmCore<T> {
> +    /// Access the core data of this GPUVM.
> +    #[inline]
> +    pub fn data(&mut self) -> &mut T {
> +        // SAFETY: By the type invariants we may access `core`.
> +        unsafe { &mut *self.0.data.get() }
> +    }
> +}
> +
> +impl<T: DriverGpuVm> Deref for GpuVmCore<T> {
> +    type Target =3D GpuVm<T>;
> +
> +    #[inline]
> +    fn deref(&self) -> &GpuVm<T> {
> +        &self.0
> +    }
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index =
1b82b6945edf25b947afc08300e211bd97150d6b..a4b6c5430198571ec701af2ef452cc9a=
c55870e6 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -6,6 +6,7 @@
> pub mod driver;
> pub mod file;
> pub mod gem;
> +pub mod gpuvm;
> pub mod ioctl;
>=20
> pub use self::device::Device;
>=20
> --=20
> 2.52.0.457.g6b5491de43-goog
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

