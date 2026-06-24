Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98E3DD506;
	Wed, 24 Jun 2026 17:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782322914; cv=none; b=XnHKjyXWm+csHjqQnqw69/HWU/nSMq2bH2+QW8QW6Uc4pGmB4xgCiBROAo4avAa5Cl2Wp/cCvJhrPJ2WNZFRrP2N6NDjyQW2fvqAdcPirg6BZUkDBxdJ41TsjaWRpnDEZk7lS2eFBvpj+3xGLjastjnHVR2B2N/YmZ2JV6Cz2wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782322914; c=relaxed/simple;
	bh=AwbhJP1HAcCmSg2npfePYVjGB31LJQSxDmptsSdzv5Q=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=N4UEZW72U/Wn4PZ6AC0vo/bDRzJotbvxpPSwGOHXJcMEa89toK0pMSdhLEkjox+Sg4bXOZ8uEGxUQDst9rIBt8gnCwR1l2QbFh2U61TGxvXoJ3vtUEwj/MLBTqFBOl+V5wD+u4f2N2UfUBHRTtExr2X34/5xHOK719bRGOmVjds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxeutC07; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxeutC07"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41111F000E9;
	Wed, 24 Jun 2026 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782322912;
	bh=eLwi8xI81Bmf4inUQDsf3IJ4B3kekqxaANfo7WRxrDs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=KxeutC070zOelD0Od+emOCuXMhQIri5SCBkaU2gDAuuUHs4BIDOsZCBAphtxi5P1q
	 oFhyxojl5zYUD9dWCOExg+DOZjAhsk4/H7iian5cU41877fP8Qxe6ql/Ev9xPYh8so
	 TgYE9T9xFje/CdcFNjhYs+hQgSencO6+zW3VDoesWGQJJHK34Ho847Tb9gGk3tAN92
	 CE2LWDSGVe3SvINOL5BINUuk79w/WFO5po06/oHdT9yjsWXoGExTgsPaoKPtxKNcfH
	 /y3JMer48SEpOF3u53pUJLhCTvqCjETZWu4+CXzQAQOJFXk0/9f13K2qP4vnK/eF4M
	 CA1DTbrnmRcBQ==
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Jun 2026 19:41:45 +0200
Message-Id: <DJHGQN654CJR.281FZSV2S5AI8@kernel.org>
Subject: Re: [PATCH v4 2/2] rust: introduce abstractions for fwctl
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <jgg@nvidia.com>, <gary@garyguo.net>, <joelagnelf@nvidia.com>,
 <aliceryhl@google.com>, <kwilczynski@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
 <daniel.almeida@collabora.com>
To: "Zhi Wang" <zhiw@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260624091758.1678092-1-zhiw@nvidia.com>
 <20260624091758.1678092-3-zhiw@nvidia.com>
In-Reply-To: <20260624091758.1678092-3-zhiw@nvidia.com>

On Wed Jun 24, 2026 at 11:17 AM CEST, Zhi Wang wrote:
> +impl<T: Operations> Device<T> {

[...]

> +    /// Returns the parent device.
> +    ///
> +    /// The parent is guaranteed to be bound while any fwctl callback is
> +    /// running (ensured by the `registration_lock` read lock on the ioc=
tl
> +    /// path and by `Devres` on the teardown path).
> +    pub fn parent(&self) -> &device::Device<device::Bound> {
> +        // SAFETY: fwctl sets the parent during allocation.
> +        let parent_dev =3D unsafe { (*self.as_raw()).dev.parent };
> +        // SAFETY: The parent stays live while fwctl ops run.
> +        let dev: &device::Device =3D unsafe { device::Device::from_raw(p=
arent_dev) };
> +        // SAFETY: Devres teardown keeps the parent bound here.
> +        unsafe { dev.as_bound() }
> +    }

You can't return a Device<Bound> from fwctl::Device; it is reference counte=
d and
can outlive driver unbind. But I think this method isn't needed anyways, so=
 I'd
just drop it.

> +impl<T: Operations> Registration<T> {
> +    /// Register a previously allocated fwctl device.
> +    pub fn new<'a>(
> +        parent: &'a device::Device<device::Bound>,
> +        dev: &'a Device<T>,
> +    ) -> impl PinInit<Devres<Self>, Error> + 'a {
> +        pin_init::pin_init_scope(move || {
> +            // SAFETY: `dev` is a valid fwctl_device backed by an ARef.
> +            let ret =3D unsafe { bindings::fwctl_register(dev.as_raw()) =
};
> +            if ret !=3D 0 {
> +                return Err(Error::from_errno(ret));
> +            }
> +
> +            Ok(Devres::new(parent, Self { dev: dev.into() }))
> +        })

I have recently been working on getting rid of Devres for Registration type=
s and
device resources in favor of Rust-native lifetimes using higher-ranked type=
s
(HRT). This has a couple of advantages, e.g. it simplifies accessing device
resources from destructors and (with pin-init self-referential support) all=
ows
us to share (Rust) references between private data structures.

This has been merged for existing device resources, bus device private data=
 and
auxiliary registration data [1]. There's also a follow-up series to support
invariance [2] and another one to enable it for the DRM subsystem [3].

Class devices infrastructure should follow that same pattern, i.e. the
fwctl::Registration type should gain a lifetime and the fwctl private data
provided via fwctl callbacks should be tied to the lifetime of the Registra=
tion,
i.e. the lifetime the underlying bus device is bound to the driver.

Please find a diff in [4] implementing this for fwctl and a diff in [5]
demonstrating how this is used in nova-core. (Feel free to pick up the prov=
ided
code and use it in any way.)

(Please ignore that I use fwctl::DeviceType::Mlx5 in the nova-core diff, it=
 is
just there to make the code compile, so I could do a smoke test.)

Thanks,
Danilo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D2c7c65933600e8db2ec1a78dec5008de876dd3ad
[2] https://lore.kernel.org/driver-core/20260618230834.812007-1-dakr@kernel=
.org/
[3] https://lore.kernel.org/driver-core/20260620184924.2247517-1-dakr@kerne=
l.org/

[4] FWCTL diff:

diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
index f5f802f5299c..65abea866b22 100644
--- a/rust/kernel/fwctl.rs
+++ b/rust/kernel/fwctl.rs
@@ -8,16 +8,20 @@
     bindings,
     container_of,
     device,
-    devres::Devres,
     prelude::*,
     sync::aref::{
         ARef,
         AlwaysRefCounted, //
     },
-    types::Opaque, //
+    types::{
+        ForLt,
+        Opaque, //
+    }, //
 };
 use core::{
+    cell::UnsafeCell,
     marker::PhantomData,
+    mem,
     ptr::NonNull,
     slice, //
 };
@@ -89,8 +93,12 @@ pub enum FwRpcResponse {
 /// vtable used by the core `fwctl` layer to manage per-FD user contexts a=
nd
 /// handle RPC requests.
 pub trait Operations: Sized + Send + Sync {
-    /// Driver data embedded alongside the `fwctl_device` allocation.
-    type DeviceData: Send + Sync;
+    /// Data owned by the [`Registration`] and accessible during callbacks=
.
+    ///
+    /// This is a [`ForLt`](trait@ForLt) type whose lifetime is tied to th=
e parent bus device
+    /// binding scope. Drivers use this to store references to resources b=
ound to this scope, such as PCI
+    /// BARs or typed bus device references.
+    type RegistrationData: ForLt;
=20
     /// fwctl device type identifier.
     const DEVICE_TYPE: DeviceType;
@@ -99,57 +107,68 @@ pub trait Operations: Sized + Send + Sync {
     ///
     /// Returns a [`PinInit`] initializer for `Self`. The instance is drop=
ped
     /// automatically when the FD is closed (after [`close`](Self::close))=
.
-    fn open(device: &Device<Self>) -> impl PinInit<Self, Error>;
+    fn open<'a>(
+        device: &'a Device<Self>,
+        reg_data: &'a <Self::RegistrationData as ForLt>::Of<'a>,
+    ) -> impl PinInit<Self, Error>;
=20
     /// Called when the user context is closed.
     ///
     /// The driver may perform additional cleanup here that requires acces=
s
     /// to the owning [`Device`]. `Self` is dropped automatically after th=
is
     /// returns.
-    fn close(_this: Pin<&mut Self>, _device: &Device<Self>) {}
+    fn close<'a>(
+        _this: Pin<&mut Self>,
+        _device: &'a Device<Self>,
+        _reg_data: &'a <Self::RegistrationData as ForLt>::Of<'a>,
+    ) {
+    }
=20
     /// Return device information to userspace.
     ///
     /// The default implementation returns no device-specific data.
-    fn info(_this: Pin<&Self>, _device: &Device<Self>) -> Result<KVec<u8>,=
 Error> {
+    fn info<'a>(
+        _this: Pin<&Self>,
+        _device: &'a Device<Self>,
+        _reg_data: &'a <Self::RegistrationData as ForLt>::Of<'a>,
+    ) -> Result<KVec<u8>, Error> {
         Ok(KVec::new())
     }
=20
     /// Handle a userspace RPC request.
-    fn fw_rpc(
+    fn fw_rpc<'a>(
         this: Pin<&Self>,
-        device: &Device<Self>,
+        device: &'a Device<Self>,
+        reg_data: &'a <Self::RegistrationData as ForLt>::Of<'a>,
         scope: RpcScope,
         rpc_in: &mut [u8],
     ) -> Result<FwRpcResponse, Error>;
 }
=20
-/// A fwctl device with embedded driver data.
+/// A fwctl device.
 ///
-/// `#[repr(C)]` with the `fwctl_device` at offset 0, matching the C
-/// `fwctl_alloc_device()` layout convention.
+/// `#[repr(C)]` with the `fwctl_device` at offset 0, matching the C `fwct=
l_alloc_device()` layout
+/// convention. Contains a pointer to the [`Registration`]'s data, set at =
registration time and
+/// cleared on unregistration.
 ///
 /// # Invariants
 ///
 /// - `dev` is embedded at offset 0 and is initialised by fwctl.
 /// - The fwctl refcount owns the allocation lifetime.
-/// - `data` is dropped from the fwctl core release hook before `kfree()`.
+/// - `registration_data` is either `NonNull::dangling()` (before registra=
tion / after
+///   unregistration) or points to a valid `RegistrationData` owned by the=
 [`Registration`].
 #[repr(C)]
 pub struct Device<T: Operations> {
     dev: Opaque<bindings::fwctl_device>,
-    data: T::DeviceData,
+    registration_data: UnsafeCell<NonNull<<T::RegistrationData as ForLt>::=
Of<'static>>>,
 }
=20
 impl<T: Operations> Device<T> {
-    /// Allocate a new fwctl device with embedded driver data.
+    /// Allocate a new fwctl device.
     ///
     /// Returns an [`ARef`] that can be passed to [`Registration::new()`]
-    /// to make the device visible to userspace. The caller may inspect or
-    /// configure the device between allocation and registration.
-    pub fn new(
-        parent: &device::Device<device::Bound>,
-        data: impl PinInit<T::DeviceData, Error>,
-    ) -> Result<ARef<Self>> {
+    /// to make the device visible to userspace.
+    pub fn new(parent: &device::Device<device::Bound>) -> Result<ARef<Self=
>> {
         const_assert!(
             core::mem::offset_of!(Self, dev) =3D=3D 0,
             "struct fwctl_device must be at offset 0"
@@ -157,8 +176,7 @@ pub fn new(
=20
         let ops =3D core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::<T=
>::VTABLE).cast_mut();
=20
-        // SAFETY: `ops` is static, `parent` is bound, and `size` includes=
 the
-        // offset-0 `fwctl_device` plus `DeviceData`.
+        // SAFETY: `ops` is static, `parent` is bound, and `size` covers t=
he full `Device<T>`.
         let raw =3D unsafe {
             bindings::_fwctl_alloc_device(parent.as_raw(), ops, core::mem:=
:size_of::<Self>())
         };
@@ -169,42 +187,21 @@ pub fn new(
=20
         let this =3D raw.cast::<Self>();
=20
+        // INVARIANT: Set `registration_data` to dangling (no registration=
 yet).
         // SAFETY: `this` points to the allocation just returned by fwctl.
-        let data_ptr =3D unsafe { core::ptr::addr_of_mut!((*this).data) };
-        // SAFETY: `data_ptr` addresses the uninitialised tail data.
-        unsafe { data.__pinned_init(data_ptr) }.inspect_err(|_| {
-            // SAFETY: `raw` still owns the initial reference.
-            unsafe { bindings::fwctl_put(raw) };
-        })?;
-
-        // SAFETY: `raw` is a live fwctl_device allocated above.
-        unsafe { (*raw).release_data =3D Some(Self::release_data_callback)=
 };
-
-        // SAFETY: `raw` owns the initial reference and `DeviceData` is re=
ady.
-        Ok(unsafe { ARef::from_raw(NonNull::new(raw.cast::<Self>()).ok_or(=
ENOMEM)?) })
-    }
+        unsafe {
+            core::ptr::addr_of_mut!((*this).registration_data)
+                .write(UnsafeCell::new(NonNull::dangling()));
+        };
=20
-    /// Returns a reference to the embedded driver data.
-    pub fn data(&self) -> &T::DeviceData {
-        &self.data
+        // SAFETY: `raw` owns the initial reference.
+        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(this)) })
     }
=20
     fn as_raw(&self) -> *mut bindings::fwctl_device {
         self.dev.get()
     }
=20
-    /// # Safety
-    ///
-    /// `raw` must point to an offset-0 `fwctl_device` embedded in `Device=
<T>`.
-    /// fwctl calls this exactly once from the device release path.
-    unsafe extern "C" fn release_data_callback(raw: *mut bindings::fwctl_d=
evice) {
-        let this =3D raw.cast::<Self>();
-
-        // SAFETY: fwctl invokes this callback once during the final devic=
e
-        // release, before freeing the allocation.
-        unsafe { core::ptr::drop_in_place(core::ptr::addr_of_mut!((*this).=
data)) };
-    }
-
     /// # Safety
     ///
     /// `ptr` must point to a valid `fwctl_device` embedded in a `Device<T=
>`.
@@ -213,18 +210,17 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_devi=
ce) -> &'a Self {
         unsafe { &*ptr.cast() }
     }
=20
-    /// Returns the parent device.
+    /// Returns a reference to the registration data.
+    ///
+    /// # Safety
     ///
-    /// The parent is guaranteed to be bound while any fwctl callback is
-    /// running (ensured by the `registration_lock` read lock on the ioctl
-    /// path and by `Devres` on the teardown path).
-    pub fn parent(&self) -> &device::Device<device::Bound> {
-        // SAFETY: fwctl sets the parent during allocation.
-        let parent_dev =3D unsafe { (*self.as_raw()).dev.parent };
-        // SAFETY: The parent stays live while fwctl ops run.
-        let dev: &device::Device =3D unsafe { device::Device::from_raw(par=
ent_dev) };
-        // SAFETY: Devres teardown keeps the parent bound here.
-        unsafe { dev.as_bound() }
+    /// The caller must ensure the device is registered, i.e. that this is=
 called within a fwctl
+    /// callback protected by `registration_lock`. The pointer cast from `=
Of<'static>` to `Of<'_>`
+    /// is sound because [`ForLt`] guarantees covariance.
+    unsafe fn registration_data_unchecked(&self) -> &<T::RegistrationData =
as ForLt>::Of<'_> {
+        // SAFETY: Caller guarantees the device is registered, so the poin=
ter is valid.
+        // Lifetimes do not affect layout, so the cast is sound.
+        unsafe { (*self.registration_data.get()).cast::<_>().as_ref() }
     }
 }
=20
@@ -251,62 +247,98 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }
=20
-// SAFETY: `Device<T>` is refcounted by the fwctl core and may be released=
 from
-// any thread. The embedded driver data is `Send`.
+// SAFETY: `Device<T>` is refcounted by the fwctl core and may be released=
 from any thread.
 unsafe impl<T: Operations> Send for Device<T> {}
=20
-// SAFETY: Shared access to the embedded `fwctl_device` is protected by th=
e
-// fwctl core, and the embedded driver data is `Sync`.
+// SAFETY: Shared access to the embedded `fwctl_device` is protected by th=
e fwctl core. The
+// `registration_data` field is only mutated before registration and after=
 unregistration (both
+// single-threaded with respect to callbacks).
 unsafe impl<T: Operations> Sync for Device<T> {}
=20
 /// A registered fwctl device.
 ///
-/// Must live inside a [`Devres`] to guarantee that [`fwctl_unregister`] r=
uns
-/// before the parent driver unbinds. `Devres` prevents the `Registration`
-/// from being moved to a context that could outlive the parent device.
+/// Carries the lifetime `'a` of the parent device to ensure that [`fwctl_=
unregister`] runs (via
+/// [`Drop`]) before the parent driver unbinds. Owns the
+/// [`RegistrationData`](Operations::RegistrationData) which is accessible=
 during callbacks via the
+/// pointer stored in [`Device`].
 ///
-/// On drop the device is unregistered (all user contexts are closed and
-/// `ops` is set to `NULL`) and the [`ARef`] is released.
+/// On drop the device is unregistered (all user contexts are closed and `=
ops` is set to `NULL`)
+/// and the registration data is dropped.
 ///
 /// [`fwctl_unregister`]: srctree/drivers/fwctl/main.c
-pub struct Registration<T: Operations> {
+pub struct Registration<'a, T: Operations> {
     dev: ARef<Device<T>>,
+    _reg_data: Pin<KBox<<T::RegistrationData as ForLt>::Of<'a>>>,
 }
=20
-impl<T: Operations> Registration<T> {
-    /// Register a previously allocated fwctl device.
-    pub fn new<'a>(
-        parent: &'a device::Device<device::Bound>,
-        dev: &'a Device<T>,
-    ) -> impl PinInit<Devres<Self>, Error> + 'a {
-        pin_init::pin_init_scope(move || {
-            // SAFETY: `dev` is a valid fwctl_device backed by an ARef.
-            let ret =3D unsafe { bindings::fwctl_register(dev.as_raw()) };
-            if ret !=3D 0 {
-                return Err(Error::from_errno(ret));
-            }
+impl<'a, T: Operations> Registration<'a, T>
+where
+    for<'b> <T::RegistrationData as ForLt>::Of<'b>: Send + Sync,
+{
+    /// Register a previously allocated fwctl device with the given regist=
ration data.
+    ///
+    /// The `reg_data` is owned by the registration and accessible during =
callbacks via
+    /// `Device::registration_data_unchecked()`.
+    ///
+    /// # Safety
+    ///
+    /// Callers must not `mem::forget()` the returned [`Registration`] or =
otherwise prevent its
+    /// [`Drop`] implementation from running, since `fwctl_unregister` mus=
t be called before the
+    /// parent device is unbound.
+    pub unsafe fn new(
+        _parent: &'a device::Device<device::Bound>,
+        dev: &Device<T>,
+        reg_data: impl PinInit<<T::RegistrationData as ForLt>::Of<'a>, Err=
or>,
+    ) -> Result<Self> {
+        let reg_data: Pin<KBox<<T::RegistrationData as ForLt>::Of<'a>>> =
=3D
+            KBox::pin_init(reg_data, GFP_KERNEL)?;
+
+        // Store the registration data pointer in the device before regist=
ration, so that it is
+        // visible once callbacks can be invoked.
+        //
+        // SAFETY: Lifetimes do not affect layout, so the pointer cast is =
sound.
+        let ptr: NonNull<<T::RegistrationData as ForLt>::Of<'static>> =3D
+            unsafe { mem::transmute(NonNull::from(Pin::get_ref(reg_data.as=
_ref()))) };
+
+        // SAFETY: No concurrent access; the device is not yet registered.
+        unsafe { *dev.registration_data.get() =3D ptr };
+
+        // SAFETY: `dev` is a valid fwctl_device backed by an ARef.
+        let ret =3D unsafe { bindings::fwctl_register(dev.as_raw()) };
+        if ret !=3D 0 {
+            // SAFETY: No concurrent readers; registration failed.
+            unsafe { *dev.registration_data.get() =3D NonNull::dangling() =
};
+            return Err(Error::from_errno(ret));
+        }
=20
-            Ok(Devres::new(parent, Self { dev: dev.into() }))
+        Ok(Self {
+            dev: dev.into(),
+            _reg_data: reg_data,
         })
     }
 }
=20
-impl<T: Operations> Drop for Registration<T> {
+impl<T: Operations> Drop for Registration<'_, T> {
     fn drop(&mut self) {
-        // SAFETY: `Registration` lives inside a `Devres`, which guarantee=
s
-        // that drop runs while the parent device is still bound.
+        // SAFETY: The Registration lifetime guarantees that the parent de=
vice is still bound.
+        // `fwctl_unregister` takes the write lock, closes all user contex=
ts, and sets ops=3DNULL.
+        // After it returns, no callbacks can be running or will run.
         unsafe { bindings::fwctl_unregister(self.dev.as_raw()) };
-        // ARef<Device<T>> is dropped after this, calling fwctl_put.
+
+        // SAFETY: `fwctl_unregister` guarantees no concurrent readers.
+        unsafe { *self.dev.registration_data.get() =3D NonNull::dangling()=
 };
+
+        // `self._reg_data` is dropped here =E2=80=94 safe because no conc=
urrent readers remain.
     }
 }
=20
-// SAFETY: `Registration` can be sent between threads; the underlying
-// fwctl_device uses internal locking.
-unsafe impl<T: Operations> Send for Registration<T> {}
+// SAFETY: `Registration` can be sent between threads; the underlying fwct=
l_device uses internal
+// locking.
+unsafe impl<T: Operations> Send for Registration<'_, T> {}
=20
-// SAFETY: `Registration` provides no mutable access; the underlying
-// fwctl_device is protected by internal locking.
-unsafe impl<T: Operations> Sync for Registration<T> {}
+// SAFETY: `Registration` provides no mutable access; the underlying fwctl=
_device is protected by
+// internal locking.
+unsafe impl<T: Operations> Sync for Registration<'_, T> {}
=20
 /// Internal per-FD user context wrapping `struct fwctl_uctx` and `T`.
 ///
@@ -376,7 +408,10 @@ impl<T: Operations> VTable<T> {
         // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layout.
         let device =3D unsafe { Device::<T>::from_raw(raw_fwctl) };
=20
-        let initializer =3D T::open(device);
+        // SAFETY: open_uctx is called under registration_lock read; the d=
evice is registered.
+        let reg_data =3D unsafe { device.registration_data_unchecked() };
+
+        let initializer =3D T::open(device, reg_data);
=20
         let uctx_offset =3D core::mem::offset_of!(UserCtx<T>, uctx);
         // SAFETY: `uctx_size` reserves space for the full `UserCtx<T>`.
@@ -396,13 +431,17 @@ impl<T: Operations> VTable<T> {
         // SAFETY: fwctl keeps the owning device live for this callback.
         let device =3D unsafe { Device::<T>::from_raw((*uctx).fwctl) };
=20
+        // SAFETY: close_uctx is called under registration_lock write (fro=
m fwctl_unregister) or
+        // under registration_lock read (from fwctl_fops_release); the dev=
ice is registered.
+        let reg_data =3D unsafe { device.registration_data_unchecked() };
+
         // SAFETY: close is called for an opened Rust user context.
         let ctx =3D unsafe { UserCtx::<T>::from_raw_mut(uctx) };
=20
         {
             // SAFETY: fwctl never moves an opened user context.
             let pinned =3D unsafe { Pin::new_unchecked(&mut ctx.uctx) };
-            T::close(pinned, device);
+            T::close(pinned, device, reg_data);
         }
=20
         // SAFETY: close is the last callback before fwctl frees the alloc=
ation.
@@ -421,10 +460,13 @@ impl<T: Operations> VTable<T> {
         let ctx =3D unsafe { UserCtx::<T>::from_raw(uctx) };
         let device =3D ctx.device();
=20
+        // SAFETY: info is called under registration_lock read; the device=
 is registered.
+        let reg_data =3D unsafe { device.registration_data_unchecked() };
+
         // SAFETY: fwctl never moves an opened user context.
         let pinned =3D unsafe { Pin::new_unchecked(&ctx.uctx) };
=20
-        match T::info(pinned, device) {
+        match T::info(pinned, device, reg_data) {
             Ok(kvec) if kvec.is_empty() =3D> {
                 // SAFETY: `length` is a valid out-parameter.
                 unsafe { *length =3D 0 };
@@ -461,6 +503,9 @@ impl<T: Operations> VTable<T> {
         let ctx =3D unsafe { UserCtx::<T>::from_raw(uctx) };
         let device =3D ctx.device();
=20
+        // SAFETY: fw_rpc is called under registration_lock read; the devi=
ce is registered.
+        let reg_data =3D unsafe { device.registration_data_unchecked() };
+
         // SAFETY: fwctl passes a valid in/out buffer for this callback.
         let rpc_in_slice: &mut [u8] =3D
             unsafe { slice::from_raw_parts_mut(rpc_in.cast::<u8>(), in_len=
) };
@@ -468,7 +513,7 @@ impl<T: Operations> VTable<T> {
         // SAFETY: fwctl never moves an opened user context.
         let pinned =3D unsafe { Pin::new_unchecked(&ctx.uctx) };
=20
-        match T::fw_rpc(pinned, device, scope, rpc_in_slice) {
+        match T::fw_rpc(pinned, device, reg_data, scope, rpc_in_slice) {
             Ok(FwRpcResponse::InPlace(len)) =3D> {
                 // SAFETY: `out_len` is valid.
                 unsafe { *out_len =3D len };

[5] nova-core diff:

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver=
.rs
index 5738d4ac521b..34d595b655fc 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -3,6 +3,7 @@
 use kernel::{
     auxiliary,
     device::Core,
+    fwctl,
     pci,
     pci::{
         Class,
@@ -15,7 +16,7 @@
         Atomic,
         Relaxed, //
     },
-    types::ForLt,
+    types::ForLt, //
 };

 use crate::gpu::Gpu;
@@ -23,6 +24,34 @@
 /// Counter for generating unique auxiliary device IDs.
 static AUXILIARY_ID_COUNTER: Atomic<u32> =3D Atomic::new(0);

+struct FwctlRegData<'a> {
+    _bar: Bar0<'a>,
+}
+
+struct FwctlUctx;
+
+impl fwctl::Operations for FwctlUctx {
+    type RegistrationData =3D ForLt!(FwctlRegData<'_>);
+    const DEVICE_TYPE: fwctl::DeviceType =3D fwctl::DeviceType::Mlx5;
+
+    fn open(
+        _device: &fwctl::Device<Self>,
+        _reg_data: &FwctlRegData<'_>,
+    ) -> impl PinInit<Self, Error> {
+        Ok(FwctlUctx)
+    }
+
+    fn fw_rpc(
+        _this: core::pin::Pin<&Self>,
+        _device: &fwctl::Device<Self>,
+        _reg_data: &FwctlRegData<'_>,
+        _scope: fwctl::RpcScope,
+        _rpc_in: &mut [u8],
+    ) -> Result<fwctl::FwRpcResponse, Error> {
+        Err(ENOTSUPP)
+    }
+}
+
 #[pin_data]
 pub(crate) struct NovaCore<'bound> {
     #[pin]
@@ -30,6 +59,7 @@ pub(crate) struct NovaCore<'bound> {
     bar: pci::Bar<'bound, BAR0_SIZE>,
     #[allow(clippy::type_complexity)]
     _reg: auxiliary::Registration<'bound, ForLt!(())>,
+    _fwctl_reg: fwctl::Registration<'bound, FwctlUctx>,
 }

 pub(crate) struct NovaCoreDriver;
@@ -78,6 +108,8 @@ fn probe<'bound>(
             pdev.enable_device_mem()?;
             pdev.set_master();

+            let fwctl_dev =3D fwctl::Device::<FwctlUctx>::new(pdev.as_ref(=
))?;
+
             Ok(try_pin_init!(NovaCore {
                 bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/b=
ar0")?,
                 // TODO: Use `&bar` self-referential pin-init syntax once =
available.
@@ -95,6 +127,17 @@ fn probe<'bound>(
                     crate::MODULE_NAME,
                     (),
                 )?,
+                // SAFETY: `_fwctl_reg` is dropped before `bar` (struct fi=
eld drop order), and its
+                // drop calls `fwctl_unregister` before the parent device =
is unbound.
+                _fwctl_reg: unsafe {
+                    fwctl::Registration::new(
+                        pdev.as_ref(),
+                        &fwctl_dev,
+                        Ok(FwctlRegData {
+                            _bar: &*core::ptr::from_ref(bar),
+                        }),
+                    )?
+                },
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nov=
a_core.rs
index 735b8e17c6b6..d5f050b2b55e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -74,6 +74,7 @@ fn init(module: &'static kernel::ThisModule) -> impl PinI=
nit<Self, Error> {
     description: "Nova Core GPU driver",
     license: "GPL v2",
     firmware: [],
+    imports_ns: ["FWCTL"],
 }

 kernel::module_firmware!(firmware::ModInfoBuilder);
