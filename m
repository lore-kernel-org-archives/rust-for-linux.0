Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0363B1EC8;
	Sat, 27 Jun 2026 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782569704; cv=none; b=XZTsu0v9PGBi8VRT6XAF23oLHcYREP7Bq1yRd1Q6VSjr6VIKB39i/+EnkE2M3tf8ocAPMWIUIKnWbln2cReLhH5jDZRecJqiykXYyxDJxF0cTgVxkWAyNvDJaNxmykkxq2crhfZRbTGk8e2m3pouDVuGwYVy32wEOIMyZZPMLMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782569704; c=relaxed/simple;
	bh=g0V8yH28WtGVcfVsmMvZvhNTdCo0wq+F5TTRwMYLpig=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Shg/FsG1SeejOq3esC60v0NdtZ5Oph1zyPwklXSYtoN6Sm6LqzjZXqUHhNH9+DzYHttVWfMeDD8uFlUewXqkEAXW1r4BH/B2PZA+u8cPWq1niIkEFKkL3rJ1ZFiCz9yOzjerQi5Nj24QyAiCkIP7Bl/b+Ltadx5rjHRUaWZ1ewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQlEeytI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQlEeytI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 539E81F000E9;
	Sat, 27 Jun 2026 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782569702;
	bh=6i9InLtTN2TaerRAJw0IpRJOnIC1vqKUZbRV/Eqcfwo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=nQlEeytIYTh3Pgz3ibQfae3gUYD5+zoiyQSe1pBEFcqnwX/kDNAJHnw9TrvjQIu5n
	 jlnrXiCtfsbFpG94s7d9bZueiBAvZueL40Vs4cpBCP5aFtWLj46lv8pkmVBo+cZy2F
	 cLlGAWPT2C2OHA3d0Oso792ggH+B4vAMTSSfAFvPkDHVTlfYwB9fBmsiWOVcA1mdTO
	 p8zas78UGxpTMMcLLMsr1THW6TbZC8jqw1BjCMXZ7lNkytsihdCR7xLv9SiUqh2Y9q
	 wXnFmdTLAissjto1R6mW/12SMu4gp0jKYJ4ImbK8CcRAmfoiAQCpTcn7vot/DSt1NF
	 pZXTWchGauZjg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 16:14:55 +0200
Message-Id: <DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org>
To: "Zhi Wang" <zhiw@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
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
References: <20260624091758.1678092-1-zhiw@nvidia.com>
 <20260624091758.1678092-3-zhiw@nvidia.com>
 <DJHGQN654CJR.281FZSV2S5AI8@kernel.org> <20260625112429.3e89e869@inno-dell>
In-Reply-To: <20260625112429.3e89e869@inno-dell>

On Thu Jun 25, 2026 at 10:24 AM CEST, Zhi Wang wrote:
> Thanks so much. I will take a look and re-spin it today.

This also works with a GAT lifetime and doesn't need ForLt in the first pla=
ce.
Please find the updated diff below.

Thanks,
Danilo

diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
index f5f802f5299c..80e592a21bfc 100644
--- a/rust/kernel/fwctl.rs
+++ b/rust/kernel/fwctl.rs
@@ -5,19 +5,18 @@
 //! C header: `include/linux/fwctl.h`

 use crate::{
-    bindings,
-    container_of,
-    device,
-    devres::Devres,
+    bindings, container_of, device,
     prelude::*,
     sync::aref::{
         ARef,
         AlwaysRefCounted, //
     },
-    types::Opaque, //
+    types::Opaque,
 };
 use core::{
+    cell::UnsafeCell,
     marker::PhantomData,
+    mem,
     ptr::NonNull,
     slice, //
 };
@@ -88,9 +87,15 @@ pub enum FwRpcResponse {
 /// Each implementation corresponds to a specific device type and provides=
 the
 /// vtable used by the core `fwctl` layer to manage per-FD user contexts a=
nd
 /// handle RPC requests.
-pub trait Operations: Sized + Send + Sync {
-    /// Driver data embedded alongside the `fwctl_device` allocation.
-    type DeviceData: Send + Sync;
+pub trait Operations: Sized + Send + Sync + 'static {
+    /// Data owned by the [`Registration`] and accessible during callbacks=
.
+    ///
+    /// The lifetime `'a` is tied to the [`Registration`] scope (which liv=
es within the parent bus
+    /// device binding scope). Drivers use this to store references to res=
ources bound to this
+    /// scope, such as PCI BARs or typed bus device references.
+    type RegistrationData<'a>: Send + Sync + 'a
+    where
+        Self: 'a;

     /// fwctl device type identifier.
     const DEVICE_TYPE: DeviceType;
@@ -99,57 +104,68 @@ pub trait Operations: Sized + Send + Sync {
     ///
     /// Returns a [`PinInit`] initializer for `Self`. The instance is drop=
ped
     /// automatically when the FD is closed (after [`close`](Self::close))=
.
-    fn open(device: &Device<Self>) -> impl PinInit<Self, Error>;
+    fn open<'a>(
+        device: &'a Device<Self>,
+        reg_data: &'a Self::RegistrationData<'a>,
+    ) -> impl PinInit<Self, Error>;

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
+        _reg_data: &'a Self::RegistrationData<'a>,
+    ) {
+    }

     /// Return device information to userspace.
     ///
     /// The default implementation returns no device-specific data.
-    fn info(_this: Pin<&Self>, _device: &Device<Self>) -> Result<KVec<u8>,=
 Error> {
+    fn info<'a>(
+        _this: Pin<&Self>,
+        _device: &'a Device<Self>,
+        _reg_data: &'a Self::RegistrationData<'a>,
+    ) -> Result<KVec<u8>, Error> {
         Ok(KVec::new())
     }

     /// Handle a userspace RPC request.
-    fn fw_rpc(
+    fn fw_rpc<'a>(
         this: Pin<&Self>,
-        device: &Device<Self>,
+        device: &'a Device<Self>,
+        reg_data: &'a Self::RegistrationData<'a>,
         scope: RpcScope,
         rpc_in: &mut [u8],
     ) -> Result<FwRpcResponse, Error>;
 }

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
+    registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>,
 }

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
@@ -157,8 +173,7 @@ pub fn new(

         let ops =3D core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::<T=
>::VTABLE).cast_mut();

-        // SAFETY: `ops` is static, `parent` is bound, and `size` includes=
 the
-        // offset-0 `fwctl_device` plus `DeviceData`.
+        // SAFETY: `ops` is static, `parent` is bound, and `size` covers t=
he full `Device<T>`.
         let raw =3D unsafe {
             bindings::_fwctl_alloc_device(parent.as_raw(), ops, core::mem:=
:size_of::<Self>())
         };
@@ -169,42 +184,21 @@ pub fn new(

         let this =3D raw.cast::<Self>();

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

-    /// Returns a reference to the embedded driver data.
-    pub fn data(&self) -> &T::DeviceData {
-        &self.data
+        // SAFETY: `raw` owns the initial reference.
+        Ok(unsafe { ARef::from_raw(NonNull::new_unchecked(this)) })
     }

     fn as_raw(&self) -> *mut bindings::fwctl_device {
         self.dev.get()
     }

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
@@ -213,18 +207,18 @@ unsafe fn from_raw<'a>(ptr: *mut bindings::fwctl_devi=
ce) -> &'a Self {
         unsafe { &*ptr.cast() }
     }

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
+    /// callback protected by `registration_lock`. The pointer cast from
+    /// `RegistrationData<'static>` to `RegistrationData<'_>` is sound bec=
ause lifetimes do not
+    /// affect layout, and the data is guaranteed alive for the duration o=
f the borrow.
+    unsafe fn registration_data_unchecked(&self) -> &T::RegistrationData<'=
_> {
+        // SAFETY: Caller guarantees the device is registered, so the poin=
ter is valid.
+        // Lifetimes do not affect layout, so the cast is sound.
+        unsafe { (*self.registration_data.get()).cast::<_>().as_ref() }
     }
 }

@@ -251,62 +245,94 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
     }
 }

-// SAFETY: `Device<T>` is refcounted by the fwctl core and may be released=
 from
-// any thread. The embedded driver data is `Send`.
+// SAFETY: `Device<T>` is refcounted by the fwctl core and may be released=
 from any thread.
 unsafe impl<T: Operations> Send for Device<T> {}

-// SAFETY: Shared access to the embedded `fwctl_device` is protected by th=
e
-// fwctl core, and the embedded driver data is `Sync`.
+// SAFETY: Shared access to the embedded `fwctl_device` is protected by th=
e fwctl core. The
+// `registration_data` field is only mutated before registration and after=
 unregistration (both
+// single-threaded with respect to callbacks).
 unsafe impl<T: Operations> Sync for Device<T> {}

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
+    _reg_data: Pin<KBox<T::RegistrationData<'a>>>,
 }

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
+impl<'a, T: Operations> Registration<'a, T> {
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
+        reg_data: impl PinInit<T::RegistrationData<'a>, Error>,
+    ) -> Result<Self> {
+        let reg_data: Pin<KBox<T::RegistrationData<'a>>> =3D KBox::pin_ini=
t(reg_data, GFP_KERNEL)?;
+
+        // Store the registration data pointer in the device before regist=
ration, so that it is
+        // visible once callbacks can be invoked.
+        //
+        // SAFETY: Lifetimes do not affect layout, so the pointer cast is =
sound.
+        let ptr: NonNull<T::RegistrationData<'static>> =3D
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

-            Ok(Devres::new(parent, Self { dev: dev.into() }))
+        Ok(Self {
+            dev: dev.into(),
+            _reg_data: reg_data,
         })
     }
 }

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

-// SAFETY: `Registration` can be sent between threads; the underlying
-// fwctl_device uses internal locking.
-unsafe impl<T: Operations> Send for Registration<T> {}
+// SAFETY: `Registration` can be sent between threads; the underlying fwct=
l_device uses internal
+// locking.
+unsafe impl<T: Operations> Send for Registration<'_, T> {}

-// SAFETY: `Registration` provides no mutable access; the underlying
-// fwctl_device is protected by internal locking.
-unsafe impl<T: Operations> Sync for Registration<T> {}
+// SAFETY: `Registration` provides no mutable access; the underlying fwctl=
_device is protected by
+// internal locking.
+unsafe impl<T: Operations> Sync for Registration<'_, T> {}

 /// Internal per-FD user context wrapping `struct fwctl_uctx` and `T`.
 ///
@@ -376,7 +402,10 @@ impl<T: Operations> VTable<T> {
         // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layout.
         let device =3D unsafe { Device::<T>::from_raw(raw_fwctl) };

-        let initializer =3D T::open(device);
+        // SAFETY: open_uctx is called under registration_lock read; the d=
evice is registered.
+        let reg_data =3D unsafe { device.registration_data_unchecked() };
+
+        let initializer =3D T::open(device, reg_data);

         let uctx_offset =3D core::mem::offset_of!(UserCtx<T>, uctx);
         // SAFETY: `uctx_size` reserves space for the full `UserCtx<T>`.
@@ -396,13 +425,17 @@ impl<T: Operations> VTable<T> {
         // SAFETY: fwctl keeps the owning device live for this callback.
         let device =3D unsafe { Device::<T>::from_raw((*uctx).fwctl) };

+        // SAFETY: close_uctx is called under registration_lock write (fro=
m fwctl_unregister) or
+        // under registration_lock read (from fwctl_fops_release); the dev=
ice is registered.
+        let reg_data =3D unsafe { device.registration_data_unchecked() };
+
         // SAFETY: close is called for an opened Rust user context.
         let ctx =3D unsafe { UserCtx::<T>::from_raw_mut(uctx) };

         {
             // SAFETY: fwctl never moves an opened user context.
             let pinned =3D unsafe { Pin::new_unchecked(&mut ctx.uctx) };
-            T::close(pinned, device);
+            T::close(pinned, device, reg_data);
         }

         // SAFETY: close is the last callback before fwctl frees the alloc=
ation.
@@ -421,10 +454,13 @@ impl<T: Operations> VTable<T> {
         let ctx =3D unsafe { UserCtx::<T>::from_raw(uctx) };
         let device =3D ctx.device();

+        // SAFETY: info is called under registration_lock read; the device=
 is registered.
+        let reg_data =3D unsafe { device.registration_data_unchecked() };
+
         // SAFETY: fwctl never moves an opened user context.
         let pinned =3D unsafe { Pin::new_unchecked(&ctx.uctx) };

-        match T::info(pinned, device) {
+        match T::info(pinned, device, reg_data) {
             Ok(kvec) if kvec.is_empty() =3D> {
                 // SAFETY: `length` is a valid out-parameter.
                 unsafe { *length =3D 0 };
@@ -461,6 +497,9 @@ impl<T: Operations> VTable<T> {
         let ctx =3D unsafe { UserCtx::<T>::from_raw(uctx) };
         let device =3D ctx.device();

+        // SAFETY: fw_rpc is called under registration_lock read; the devi=
ce is registered.
+        let reg_data =3D unsafe { device.registration_data_unchecked() };
+
         // SAFETY: fwctl passes a valid in/out buffer for this callback.
         let rpc_in_slice: &mut [u8] =3D
             unsafe { slice::from_raw_parts_mut(rpc_in.cast::<u8>(), in_len=
) };
@@ -468,7 +507,7 @@ impl<T: Operations> VTable<T> {
         // SAFETY: fwctl never moves an opened user context.
         let pinned =3D unsafe { Pin::new_unchecked(&ctx.uctx) };

-        match T::fw_rpc(pinned, device, scope, rpc_in_slice) {
+        match T::fw_rpc(pinned, device, reg_data, scope, rpc_in_slice) {
             Ok(FwRpcResponse::InPlace(len)) =3D> {
                 // SAFETY: `out_len` is valid.
                 unsafe { *out_len =3D len };
