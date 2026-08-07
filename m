Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F037383993
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112581; cv=none; b=hV2oliHH/tHX5/7Ipvry5NdRd9EDVShxH4rVJhfKtCDQRVkc1Xjt49iEJANJGYNYl/i4k9KC4GZsI5f1tjyvjAs4t4h8xKvLDUhZ9Vd9WQnUWNG7GVifEB26aAZj6MdhwfLagvRoprR1f7rjpZirwFv0yBXHccy3vb3C9ApFuGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112581; c=relaxed/simple;
	bh=vGj7Jdr6m8YPlzXYPqA9zX3+W7xmqCnwuHFUj8pM3CI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JTLZaV/VdKieXfxpYtlyQp4LxTqvrDBhrr7kU6mI86R4Yn6Zx2n0P0g7jxdlUPXApVWrrPyJF8m0R4woHpHhP4N8Pcnkv1ut2CSe2wfU0iRXs3XMZg/xD0NH0Nb0bwiZPgMIBajGduBguv7fKGELkPvQK7mBKYXwFVbd54eDFa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GMe3tjBD; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GMe3tjBD"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-495569acf8dso21173455e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786112577; x=1786717377; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzGbZEoBwqwrmqrq1fd896OnOvEqGPKdiH/Cain02vM=;
        b=GMe3tjBDZIEKN+YWpPStlEv2X2GSQlZDsW6XhtOvIk9+nHVTmxjhILRpzXlFGDMD0i
         O5EbrlqwFSqhOx11ej3WJILzzlbz0X9hdaiqsDkUoW3Hn2cyt2+DljMCB/6J17nAa6wP
         ikfcB8xso+8J+RNi9F1d3wHZWARfwdTYEDTAT0OGJ1fJTTlInNZInLEzU6mghxH9L2Wn
         I1MKGaVE7F7+wt3+lIM0OwTej9oa2lj56PSTjmaVVyapBqdjtA++JyZQuKoxtbeGNHss
         s8cAOWptBsJFW3Myf4MhF4KsH0TZHuhAMuQoV3oo5k80QwODV2cYLHVix2Kzk37Y+z0c
         vH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112577; x=1786717377;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzGbZEoBwqwrmqrq1fd896OnOvEqGPKdiH/Cain02vM=;
        b=sNawZbbJRMG33f96xaL5kx3AWTv2pYBk+sZsgtXE5db/juSB0C11kBRIYlWKoh9HTz
         cCQ8Bl5MxuEi6OW62XznBawy5zVJY1JtKEBVZ/bsPOU9mlkexgefWGTpBFp0FNVVrHAF
         3IrpuqqXsACnMR4ZN2YhEpraCIx67g2ulsPaX1XPpkXQDOQCHm2Ehhn4M/6w28g3Tr7z
         CwTUAmckkarpPkySuJiIF2UP82ZudfsECuExQrVh+fjDtfocgu+4CU31l3K27TkSumpJ
         3nXjK6G4D28zXIZWNzN1L4lTLyCzjlku0DYhX/wPzRw+zDWUK28oj1ungFJBLy5b4+Iw
         uLnA==
X-Forwarded-Encrypted: i=1; AHgh+RqOsjbuojgCxfgrvaLytLXKF1zUAKvFTtWU7koj7kPXs44vhqlLa6Fro6Cyaz2Yvpw8IN12vqP0pVRKUWlxaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdw38MyNeMnXPQUPgpsK67fiiAuP4LxdRaNnBIcoVqOO9Vtqdb
	GCsXPUliyqwxYEVsA36ue33xSeJCKbOyWmIHGrxBQPEsuWY//l1VmWdsyP/DEpapXY2gZhSofWQ
	XyS69sl/hiL6u2UdPcQ==
X-Received: from wrmf10.prod.google.com ([2002:adf:e90a:0:b0:47f:6d90:86fa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46ca:b0:499:53c4:1daa with SMTP id 5b1f17b1804b1-49953c41e18mr169990915e9.15.1786112577044;
 Fri, 07 Aug 2026 07:22:57 -0700 (PDT)
Date: Fri, 07 Aug 2026 14:22:49 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADjqdWoC/x2MQQqAIBAAvyJ7TtCFUvpKdDDdag9ZaEQg/j3pO
 DAzBTIlpgyjKJDo4cxnbKA7AX53cSPJoTGgwkFZZeTB2YcmepLB3U4a7Q0asgtSD626Eq38/sd prvUDZ9wc2mEAAAA=
X-Change-Id: 20260807-miscdevice-data-71c727e8b2e5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5981; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vGj7Jdr6m8YPlzXYPqA9zX3+W7xmqCnwuHFUj8pM3CI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqdeo6MMYXvfePHV3CU0BwW5pW4xW8S7PLMIlvK
 Hdfosdb2VaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCanXqOgAKCRAEWL7uWMY5
 RknbD/9BaDmSn0eaK4TsRMq+IQ8e2dw7bEUWDvr0IK85e4e6PDtKTNMC0izk//lozSVpVhsLuih
 S4tEv4s4vv4p+tLbN75shuEfAnIqx4NRYMvGozGgvWrZrDgXfG0fW1uOkFN9wYNmBldWMSUYYz0
 Ms7dRhymx7sgVNmThCYAVryM8fqoW40oih70cNUSdBfy8uh77cfesRhF1Ts5OqyPTScyK/hWwX1
 YWE4BC6XfQFs/K+SMEbzD/OvA6Zb1ToKY4O8FZVI2ijH7VioZgSysgXDroHtCil/B71gLYVwnhd
 NnYkhaRHhz2FBKKCsChkiUvcFE0KRv504zjIxbljobIfEXb03kcz69nr3DphQab1Bh9qi8UdDza
 kkG8Zvd4UumeYtFGA4hpHiAD2XVAIPkb5gMNNznwNnAuy9M70xc5F6XlNhxisj/k55nY+ttqmxO
 CvH1Q3zFqhec5JF8cD4meXqAGmAvLa/nwkm1rLnVr40F+aggJ1/lbdspIoyCUQjRytlIM/MQuvS
 TZmZFeyo3mygxjnT++GGZMGiOWdx34LRvmxhfAYtCvcDPbBuekvaKI5nRmdRAU3eE627wg3SIXi
 yz/8Ggpl7gz1qaZH0/alD/3X0ujgowAd2tZmC52YcnAYYPOm5uVezQcMeuuTK3K9+S1AKu0ZM5G Vmcx+qGrnN38JsQ==
X-Mailer: b4 0.14.3
Message-ID: <20260807-miscdevice-data-v1-1-43c4233e0b03@google.com>
Subject: [PATCH] rust: miscdevice: add registration data to MiscDevice
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

The intended user of this patch is Rust course material. Miscdevice is a
nice and relatively easy to use API for someone's first driver, and
being able to persist data from fd to fd allows the student to interact
with their driver using 'cat' and 'echo', even though each call opens a
new fd.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/miscdevice.rs        | 42 ++++++++++++++++++++++++++++++----------
 samples/rust/rust_misc_device.rs |  3 ++-
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 3abef1b8543d..c4910918cd15 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -31,7 +31,10 @@
         Opaque, //
     },
 };
-use core::marker::PhantomData;
+use core::{
+    marker::PhantomData,
+    ops::Deref, //
+};
 
 /// Options for creating a misc device.
 #[derive(Copy, Clone)]
@@ -62,25 +65,30 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
 /// - Deregistration occurs exactly once in [`Drop`] via `misc_deregister()`.
 /// - `inner` wraps a valid, pinned `miscdevice` created using
 ///   [`MiscDeviceOptions::into_raw`].
-#[repr(transparent)]
+#[repr(C)]
 #[pin_data(PinnedDrop)]
-pub struct MiscDeviceRegistration<T> {
+pub struct MiscDeviceRegistration<T: MiscDevice> {
     #[pin]
     inner: Opaque<bindings::miscdevice>,
-    _t: PhantomData<T>,
+    #[pin]
+    data: T::RegistrationData,
 }
 
 // SAFETY: It is allowed to call `misc_deregister` on a different thread from where you called
 // `misc_register`.
-unsafe impl<T> Send for MiscDeviceRegistration<T> {}
+unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::RegistrationData: Send {}
 // SAFETY: All `&self` methods on this type are written to ensure that it is safe to call them in
-// parallel.
-unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
+// parallel. The `RegistrationData` type is always `Sync`.
+unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
 
 impl<T: MiscDevice> MiscDeviceRegistration<T> {
     /// Register a misc device.
-    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
+    pub fn register(
+        opts: MiscDeviceOptions,
+        data: impl PinInit<T::RegistrationData, Error>,
+    ) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
+            data <- data,
             inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
                 // SAFETY: The initializer can write to the provided `slot`.
                 unsafe { slot.write(opts.into_raw::<T>()) };
@@ -88,11 +96,14 @@ pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
                 // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
                 // get unregistered before `slot` is deallocated because the memory is pinned and
                 // the destructor of this type deallocates the memory.
+                //
+                // The `data` field is `Sync + 'static`, so it's okay for the `open` callback to
+                // access it until the destructor is invoked.
+                //
                 // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
                 // misc device.
                 to_result(unsafe { bindings::misc_register(slot) })
             }),
-            _t: PhantomData,
         })
     }
 
@@ -112,8 +123,16 @@ pub fn device(&self) -> &Device {
     }
 }
 
+impl<T: MiscDevice> Deref for MiscDeviceRegistration<T> {
+    type Target = T::RegistrationData;
+    #[inline]
+    fn deref(&self) -> &T::RegistrationData {
+        &self.data
+    }
+}
+
 #[pinned_drop]
-impl<T> PinnedDrop for MiscDeviceRegistration<T> {
+impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
     fn drop(self: Pin<&mut Self>) {
         // SAFETY: We know that the device is registered by the type invariants.
         unsafe { bindings::misc_deregister(self.inner.get()) };
@@ -126,6 +145,9 @@ pub trait MiscDevice: Sized {
     /// What kind of pointer should `Self` be wrapped in.
     type Ptr: ForeignOwnable + Send + Sync;
 
+    /// The registration data shared between all open files for this character device.
+    type RegistrationData: Sync + 'static;
+
     /// Called when the misc device is opened.
     ///
     /// The returned pointer will be stored as the private data for the file.
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 41e26c825060..0bde071743ef 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -156,7 +156,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         };
 
         try_pin_init!(Self {
-            _miscdev <- MiscDeviceRegistration::register(options),
+            _miscdev <- MiscDeviceRegistration::register(options, Ok(())),
         })
     }
 }
@@ -176,6 +176,7 @@ struct RustMiscDevice {
 #[vtable]
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
+    type RegistrationData = ();
 
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());

---
base-commit: 220190f97da558e67cd01c62f1b84fe77b267a5a
change-id: 20260807-miscdevice-data-71c727e8b2e5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

