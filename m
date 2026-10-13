Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A433B1BD
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894561; cv=none; b=NaAH2BPLHl1q6jNrjPBOxZIn8DGflzS3BI+HcS8cmy3/h2L0FfyLBNXL+4ys1SYMk7Pn9gnta6pG80a4z88YVM8z7k0BTq936Qf4hiVw44fSaPt8Ykb4Yg5+zd/lmUtnWkRONp/wtjZx8U6QX8uCJ2DhEzjosK/mugFzTbegA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894561; c=relaxed/simple;
	bh=0VfHI99mjbV2FxjU9pgiKgFoWso8sMbEw/GYHNs7kfA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ki0KzEWl0QxBFQ1L9plYkd8zKGciTwIsCfvK1ngCDQsiTpSWWtnB+cV3Fz3pCY12iyet6OH79Cp+L490XirxqbWzJ7N5sm0CoEUguoMUGyW9e5uo4MrJpChEiE06z55Zx1FI/3x+Emh+08khrJqW1BMWzTKfFn9UxjNnH2zNSt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nMIo0/d2; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nMIo0/d2"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a0761224e1so26829925e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791894557; x=1792499357; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U+ILcrewVHhOsLOTzQWydUELGX8n+kxmBpJfSUA6g3Y=;
        b=nMIo0/d2IKiY+n0Zfp6tGu5xvlYcz3bt3ue+beN43bj1AxZoROn0R5F4ajzeYOl1qX
         WNJf8NeU6rHQYiN4tF09bFtVRy4W41ZeDMXqpMiwL16PTuF6f0fqzjUV6a52MISag192
         0WErNFnHCg4p75YmWseR96IBOn/BhrDsZ6S5R3xyk8XF4oDoS8UZHmKNd0HwqMNo+ZJC
         hTCbGcAjRn176PWYCPCu6FQ1bbwxG393d3fI00Di+lzVI1YwgvcjcYToQhotJBoAbdCy
         lr/dCdJ7okmwq9jHVlMCCb1YuLLAliK6lv4LAnizNRTfwFEBQect+7kB9UczIwglcaMC
         IReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894557; x=1792499357;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+ILcrewVHhOsLOTzQWydUELGX8n+kxmBpJfSUA6g3Y=;
        b=ZDRaYQFSzjWBtYUPxLEzVHrVK/TEkMO6dOd0Q/9QfqJ7GIiOtlEh2FLQbqJ1ZuhK+6
         CvAHDPu85SYvhF+iLfSmo1PcEQhi/QHS7ybOeYVJclsp+eojQCUUc5ODHm5huhU1sfXg
         nJ26bWbCE0qoLT1to12/vCrQCGV7nOXyq1R1SsLZzLUlF9LmztjZqFn9SZzZrrP3VWjn
         pYXGm9cbOyU89KzC7CuibpIwVwryskfcOsognhLupeUTcmuuYl2kxWwQq8vaaRNJpAnj
         5YiU0XeEOk+hmAxhh2cTVPvBq+j3yrGUzmYRDS/IvFJK5dC6rAcaNespHdC0P6cjUxb6
         M+qQ==
X-Forwarded-Encrypted: i=1; AKwUvByfUoK4ZQeaA0x43iFxRK3ZxSJO/F6QRgRXv33ASr/SA/LZ1QNSVym6Mr7iYUR11SeXzdHO4asScqyBiaxjFg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKqBDSbmk4c9jWoWjBdDYqnev7HYlbVLNEJbVld7leWeAMxSjGs
	p9Z9Z8LqkUJJae42VaSmpooLJF4BUN/W8DvSTr2dBlHR9+uANHRUMbig261J9twqkCJ9H2oaT46
	7OguL94ed3jm2wVlrjA==
X-Received: from wmbjd18.prod.google.com ([2002:a05:600c:68d2:b0:4a1:95d4:bb4b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3144:b0:4a1:70b2:8dbb with SMTP id 5b1f17b1804b1-4a18e4b0347mr230265515e9.19.1791894554836;
 Tue, 13 Oct 2026 05:29:14 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:29:02 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA0kzmoC/3WNzQ6CMBCEX4Xs2Zr+oCWefA/DoWzXsolQ0pJGQ
 3h3K3eP32Tmmw0yJaYMt2aDRIUzx7mCPjWAo5sDCfaVQUt9lZ20YuKMvhaRhHerE1ah1Za6QdM F6mpJ9OT3YXz0lUfOa0yf46CoX/rfVZRQojXYamNIDtLcQ4zhRWeME/T7vn8BUIhg168AAAA=
X-Change-Id: 20260807-miscdevice-data-71c727e8b2e5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=16519; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=0VfHI99mjbV2FxjU9pgiKgFoWso8sMbEw/GYHNs7kfA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqziQQDqIYM32dtFfrP0UhY+Cngvhoyb7Eac8CI
 GdvY+gzTgyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCas4kEAAKCRAEWL7uWMY5
 Rt17D/96NGE17ns+bsMkZ7G2eax1D+ePCwBeZN3reUv4z1nSN2wCLi1tWb2eWGQpfpDl7MJt3rL
 a/25z1yfpHWgHtBAfXZEB4EuWGe63WbDvXO2dCRfCKQF6oB88prLtEy91pLMeDerFTkAtpL5KTL
 NoO+FFmHfYI6Xtq3FbpAkms3iBHXLDoj++ZBXHPXPPsHYBeuRrdVYqGa9kTDYz7kldOoAhLCRaW
 gl5IO71UqfvrUmXsyjZKM6e8UV242gfShUHeZSH0/+wW8v+U2whem8wwpvDenVV76CyI30k9Vpm
 E4bPCh+DMpefA9SskKtR23eOmbtIygpH5v9x0L8pGm/Esnbn6wR1DaJ4b+Ivq/D9z+Oov4AyPbY
 9x41wEXrg8QwTvCGGs+f/ah1icWWvgcUsznwrK2Kth8YtXdeftOfT41krodLuT7+8oSxcBC+icn
 XRBu32Vl+WD+ylqIgA9WWZG8di7Sxk8FgQGAfb9gg5ylO7s/Vu6qsRgOkiEj/HQku57zrI9fXWF
 eTSmn5CCwapDaD7l/0BpNZBKR9GAizcLtyEXhCfuAXRAY5CT5S957PMddmIHO6Bs9/D7vY12KLi
 mMzIRt3JIwGox39co1phL2Vir+hfg2RZvzmT90C+W1koUup7AdqlDsxxMtZ4drm1QJytAdGeT3k S2fpE2xAa/vp/kg==
X-Mailer: b4 0.14.3
Message-ID: <20261013-miscdevice-data-v2-1-d727496ed705@google.com>
Subject: [PATCH v2] rust: miscdevice: add registration data to MiscDevice
From: Alice Ryhl <aliceryhl@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently when fds for a miscdevice are opened, the only "global" data
they are given access to is the MiscDeviceRegistration value. However,
this value doesn't let you store any user-provided data, so there is no
way for different fds from the same miscdevice to interact with each
other. Thus, let the user specify a type to be stored in the
MiscDeviceRegistration in which the user can store whichever data they
would like.

The intended user of this patch is Rust course material. MiscDevice is a
nice and relatively easy to use API for someone's first driver, and
being able to persist data from fd to fd allows the student to interact
with their driver using 'cat' and 'echo', even though each call opens a
new fd.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Store `T` directly in `MiscDeviceRegistration<T>` instead of adding a `RegistrationData` associated type.
- Make `MiscDeviceRegistration::register` `unsafe` (requiring `Drop` to run) so `T` does not need to be `'static`.
- Rename `MiscDevice::Ptr` to `MiscDevice::File`.
- Use `container_of!` and `Opaque::cast_from` in `MiscdeviceVTable::open`.
- Rebase on `char-misc-next`.
- Link to v1: https://lore.kernel.org/r/20260807-miscdevice-data-v1-1-43c4233e0b03@google.com
---
 rust/kernel/miscdevice.rs        | 100 ++++++++++++++++++++++++++-------------
 samples/rust/rust_misc_device.rs |  29 ++++++++----
 2 files changed, 87 insertions(+), 42 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 8d4b719bd83f..ecc142a1b7ea 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -10,6 +10,7 @@
 
 use crate::{
     bindings,
+    container_of,
     device::Device,
     error::{
         to_result,
@@ -32,7 +33,10 @@
         Opaque, //
     }, //
 };
-use core::marker::PhantomData;
+use core::{
+    marker::PhantomData,
+    ops::Deref, //
+};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
@@ -63,37 +67,56 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
 /// - Deregistration occurs exactly once in [`Drop`] via `misc_deregister()`.
 /// - `inner` wraps a valid, pinned `miscdevice` created using
 ///   [`MiscDeviceOptions::into_raw`].
-#[repr(transparent)]
+#[repr(C)]
 #[pin_data(PinnedDrop)]
 pub struct MiscDeviceRegistration<T> {
     #[pin]
     inner: Opaque<bindings::miscdevice>,
-    _t: PhantomData<T>,
+    #[pin]
+    data: T,
 }
 
 // SAFETY: It is allowed to call `misc_deregister` on a different thread from where you called
-// `misc_register`.
-unsafe impl<T> Send for MiscDeviceRegistration<T> {}
+// `misc_register`, and `T` is `Send`.
+unsafe impl<T: Send> Send for MiscDeviceRegistration<T> {}
 // SAFETY: All `&self` methods on this type are written to ensure that it is safe to call them in
-// parallel.
-unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
+// parallel, and `T` is `Sync`.
+unsafe impl<T: Sync> Sync for MiscDeviceRegistration<T> {}
 
 impl<T: MiscDevice> MiscDeviceRegistration<T> {
     /// Register a misc device.
-    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
+    ///
+    /// # Safety
+    ///
+    /// The caller must not `mem::forget()` the returned [`MiscDeviceRegistration`] or otherwise
+    /// prevent its [`Drop`] implementation from running.
+    pub unsafe fn register<'a>(
+        opts: MiscDeviceOptions,
+        data: impl PinInit<T, Error> + 'a,
+    ) -> impl PinInit<Self, Error> + 'a
+    where
+        T: 'a,
+    {
         try_pin_init!(Self {
+            data <- data,
             inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
                 // SAFETY: The initializer can write to the provided `slot`.
                 unsafe { slot.write(opts.into_raw::<T>()) };
 
                 // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
                 // get unregistered before `slot` is deallocated because the memory is pinned and
-                // the destructor of this type deallocates the memory.
+                // the caller guarantees that the destructor of this type will run.
+                //
+                // The `data` field is already initialized and is only dropped after
+                // `misc_deregister` in `PinnedDrop::drop`. Since `T: Sync` and the caller
+                // guarantees that `Drop` will run before `T` becomes invalid, it is sound for the
+                // `open` callback to access `&MiscDeviceRegistration<T>` until `misc_deregister`
+                // returns.
+                //
                 // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
                 // misc device.
                 to_result(unsafe { bindings::misc_register(slot) })
             }),
-            _t: PhantomData,
         })
     }
 
@@ -113,6 +136,14 @@ pub fn device(&self) -> &Device {
     }
 }
 
+impl<T> Deref for MiscDeviceRegistration<T> {
+    type Target = T;
+    #[inline]
+    fn deref(&self) -> &T {
+        &self.data
+    }
+}
+
 #[pinned_drop]
 impl<T> PinnedDrop for MiscDeviceRegistration<T> {
     fn drop(self: Pin<&mut Self>) {
@@ -121,19 +152,23 @@ fn drop(self: Pin<&mut Self>) {
     }
 }
 
-/// Trait implemented by the private data of an open misc device.
+/// Trait implemented by the data stored in a [`MiscDeviceRegistration`].
 #[vtable]
-pub trait MiscDevice: Sized {
-    /// What kind of pointer should `Self` be wrapped in.
-    type Ptr: ForeignOwnable + Send + Sync;
+pub trait MiscDevice: Sized + Sync {
+    /// The type of the data stored in each file for this miscdevice.
+    ///
+    /// This type must be pointer-sized, so it will usually be a [`KBox`] or [`Arc`].
+    ///
+    /// [`Arc`]: crate::sync::Arc
+    type File: ForeignOwnable + Send + Sync + 'static;
 
     /// Called when the misc device is opened.
     ///
     /// The returned pointer will be stored as the private data for the file.
-    fn open(_file: &File, _misc: &MiscDeviceRegistration<Self>) -> Result<Self::Ptr>;
+    fn open(_file: &File, _misc: &MiscDeviceRegistration<Self>) -> Result<Self::File>;
 
     /// Called when the misc device is released.
-    fn release(device: Self::Ptr, _file: &File) {
+    fn release(device: Self::File, _file: &File) {
         drop(device);
     }
 
@@ -146,7 +181,7 @@ fn release(device: Self::Ptr, _file: &File) {
     /// error, the kernel will complete initialization of the VMA according to the properties of
     /// `vma`.
     fn mmap(
-        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
         _file: &File,
         _vma: &VmaNew,
     ) -> Result {
@@ -154,12 +189,12 @@ fn mmap(
     }
 
     /// Read from this miscdevice.
-    fn read_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterDest<'_>) -> Result<usize> {
+    fn read_iter(_kiocb: Kiocb<'_, Self::File>, _iov: &mut IovIterDest<'_>) -> Result<usize> {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
     /// Write to this miscdevice.
-    fn write_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterSource<'_>) -> Result<usize> {
+    fn write_iter(_kiocb: Kiocb<'_, Self::File>, _iov: &mut IovIterSource<'_>) -> Result<usize> {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
@@ -169,7 +204,7 @@ fn write_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterSource<'_>) -> Res
     ///
     /// [`kernel::ioctl`]: mod@crate::ioctl
     fn ioctl(
-        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
         _file: &File,
         _cmd: u32,
         _arg: usize,
@@ -186,7 +221,7 @@ fn ioctl(
     /// provided, then `compat_ptr_ioctl` will be used instead.
     #[cfg(CONFIG_COMPAT)]
     fn compat_ioctl(
-        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
         _file: &File,
         _cmd: u32,
         _arg: usize,
@@ -196,7 +231,7 @@ fn compat_ioctl(
 
     /// Show info for this fd.
     fn show_fdinfo(
-        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
+        _device: <Self::File as ForeignOwnable>::Borrowed<'_>,
         _m: &SeqFile,
         _file: &File,
     ) {
@@ -220,13 +255,14 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         }
 
         // SAFETY: The open call of a file can access the private data.
-        let misc_ptr = unsafe { (*raw_file).private_data };
+        let misc_ptr = Opaque::cast_from(unsafe { (*raw_file).private_data }.cast());
 
         // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
-        // associated `struct miscdevice` before calling into this method. Furthermore,
-        // `misc_open()` ensures that the miscdevice can't be unregistered and freed during this
-        // call to `fops_open`.
-        let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
+        // associated `struct miscdevice` (which is the `inner` field of a valid
+        // `MiscDeviceRegistration<T>`) before calling into this method. Furthermore, `misc_open()`
+        // ensures that the miscdevice can't be unregistered and freed during this call to
+        // `fops_open`, and `T: Sync` allows sharing `&MiscDeviceRegistration<T>` across threads.
+        let misc = unsafe { &*container_of!(misc_ptr, MiscDeviceRegistration<T>, inner) };
 
         // SAFETY:
         // * This underlying file is valid for (much longer than) the duration of `T::open`.
@@ -257,7 +293,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // SAFETY: The release call of a file owns the private data.
         let private = unsafe { (*file).private_data };
         // SAFETY: The release call of a file owns the private data.
-        let ptr = unsafe { <T::Ptr as ForeignOwnable>::from_foreign(private) };
+        let ptr = unsafe { <T::File as ForeignOwnable>::from_foreign(private) };
 
         // SAFETY:
         // * The file is valid for the duration of this call.
@@ -320,7 +356,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // SAFETY: This is a Rust Miscdevice, so we call `into_foreign` in `open` and
         // `from_foreign` in `release`, and `fops_mmap` is guaranteed to be called between those
         // two operations.
-        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private.cast()) };
+        let device = unsafe { <T::File as ForeignOwnable>::borrow(private) };
         // SAFETY: The caller provides a vma that is undergoing initial VMA setup.
         let area = unsafe { VmaNew::from_raw(vma) };
         // SAFETY:
@@ -341,7 +377,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // SAFETY: The ioctl call of a file can access the private data.
         let private = unsafe { (*file).private_data };
         // SAFETY: Ioctl calls can borrow the private data of the file.
-        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        let device = unsafe { <T::File as ForeignOwnable>::borrow(private) };
 
         // SAFETY:
         // * The file is valid for the duration of this call.
@@ -366,7 +402,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // SAFETY: The compat ioctl call of a file can access the private data.
         let private = unsafe { (*file).private_data };
         // SAFETY: Ioctl calls can borrow the private data of the file.
-        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        let device = unsafe { <T::File as ForeignOwnable>::borrow(private) };
 
         // SAFETY:
         // * The file is valid for the duration of this call.
@@ -387,7 +423,7 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         // SAFETY: The release call of a file owns the private data.
         let private = unsafe { (*file).private_data };
         // SAFETY: Ioctl calls can borrow the private data of the file.
-        let device = unsafe { <T::Ptr as ForeignOwnable>::borrow(private) };
+        let device = unsafe { <T::File as ForeignOwnable>::borrow(private) };
         // SAFETY:
         // * The file is valid for the duration of this call.
         // * There is no active fdget_pos region on the file on this thread.
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 41e26c825060..f5b2b00b933a 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -156,7 +156,11 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         };
 
         try_pin_init!(Self {
-            _miscdev <- MiscDeviceRegistration::register(options),
+            // SAFETY: `_miscdev` is stored in `RustMiscDeviceModule` and dropped when the module
+            // is unloaded; `mem::forget()` is never called on it.
+            _miscdev <- unsafe {
+                MiscDeviceRegistration::register(options, try_pin_init!(RustMiscDevice {}))
+            },
         })
     }
 }
@@ -166,8 +170,13 @@ struct Inner {
     buffer: KVVec<u8>,
 }
 
+/// Data shared by all open files for the same instance of this miscdevice.
+#[pin_data]
+struct RustMiscDevice {}
+
+/// Data that is stored per file for this miscdevice.
 #[pin_data(PinnedDrop)]
-struct RustMiscDevice {
+struct RustMiscDeviceFile {
     #[pin]
     inner: Mutex<Inner>,
     dev: ARef<Device>,
@@ -175,16 +184,16 @@ struct RustMiscDevice {
 
 #[vtable]
 impl MiscDevice for RustMiscDevice {
-    type Ptr = Pin<KBox<Self>>;
+    type File = Pin<KBox<RustMiscDeviceFile>>;
 
-    fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
+    fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Self::File> {
         let dev = ARef::from(misc.device());
 
         dev_info!(dev, "Opening Rust Misc Device Sample\n");
 
         KBox::try_pin_init(
             try_pin_init! {
-                RustMiscDevice {
+                RustMiscDeviceFile {
                     inner <- new_mutex!(Inner {
                         value: 0_i32,
                         buffer: KVVec::new(),
@@ -196,7 +205,7 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         )
     }
 
-    fn read_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterDest<'_>) -> Result<usize> {
+    fn read_iter(mut kiocb: Kiocb<'_, Self::File>, iov: &mut IovIterDest<'_>) -> Result<usize> {
         let me = kiocb.file();
         dev_info!(me.dev, "Reading from Rust Misc Device Sample\n");
 
@@ -207,7 +216,7 @@ fn read_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterDest<'_>) -> Resu
         Ok(read)
     }
 
-    fn write_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterSource<'_>) -> Result<usize> {
+    fn write_iter(mut kiocb: Kiocb<'_, Self::File>, iov: &mut IovIterSource<'_>) -> Result<usize> {
         let me = kiocb.file();
         dev_info!(me.dev, "Writing to Rust Misc Device Sample\n");
 
@@ -223,7 +232,7 @@ fn write_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterSource<'_>) -> R
         Ok(len)
     }
 
-    fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
+    fn ioctl(me: Pin<&RustMiscDeviceFile>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
         dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
 
         // Treat the ioctl argument as a user pointer.
@@ -245,13 +254,13 @@ fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result
 }
 
 #[pinned_drop]
-impl PinnedDrop for RustMiscDevice {
+impl PinnedDrop for RustMiscDeviceFile {
     fn drop(self: Pin<&mut Self>) {
         dev_info!(self.dev, "Exiting the Rust Misc Device Sample\n");
     }
 }
 
-impl RustMiscDevice {
+impl RustMiscDeviceFile {
     fn set_value(&self, mut reader: UserSliceReader) -> Result<isize> {
         let new_value = reader.read::<i32>()?;
         let mut guard = self.inner.lock();

---
base-commit: 79e5797d243a466138f641932f81dc69f796060c
change-id: 20260807-miscdevice-data-71c727e8b2e5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

