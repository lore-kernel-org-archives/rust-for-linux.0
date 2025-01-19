Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457891DFE06;
	Sun, 19 Jan 2025 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737324702; cv=none; b=u2S2l3Vfl48DDXLjeqrmsAR78YwWHaB3I1lOeoqspw+BhjA/d+K7Kw8qLtiLwaR+U9yjogq0mtZSC3aOCCKkPxgwx1tZ8MihsKW2SQbH2iPCyXhkMuna5HBEXijYfVnxnB4n5En7O4NrHfSPaaqBQ6SGgx19n3+S9vFFiTwBguY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737324702; c=relaxed/simple;
	bh=BpzYCh8E9xDZIgTNEb/PKjudC6fYs4uMTBBIrckxig0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W8JCWx6wCLdTwx4DLgIWO+gLAnqH1O3E0oFnNF+N0xWSTT3Fgmsb6Knxj65I1rCCyk1TVU0uShOL/yt2REwl8o531YsfBCE532G9oszaoyDlZW92DrU7nVqKOzjxcTTxJ9xJAMyyE9oZDMmG1FkIeP3j6f6yTXgZ5cvZ8jqqkRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6yfgZge; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6yfgZge"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso794353966b.3;
        Sun, 19 Jan 2025 14:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737324698; x=1737929498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGfLMcIDkPRrhYim8Rns6iE8vW+Zh9BxsU3jOi2B09I=;
        b=C6yfgZge4em2/I4JiMOWPTlj9zwXzOTSOs9SMqoyjH4cnE+FSoMwqHQXHd3HGFlw7Y
         UJTb1REhaIPDkbITdbgxd7S+uEA9RKMzu5+D0TtU+QWNvimH/Lg6jKGSdN3Rp3M6OIXp
         qAwjWkJHymRjRAGSZO+kk7xw89bX7qYotAW++J5z+c5yJ9fXr9Lryw64xV1B67abDYw9
         ZXwPdvB2wtoJjJ+v/y6CgQIjrZ71AA/95cfqK05dHURa0mgfEr+32pWfVPoLWzl5XLrH
         V5WsOI3r5djj7g4vRXcqnNu58/REtWnUKER1PldX7dKCx1s/KGynHVSkXwXz6Pomk0S5
         cNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737324698; x=1737929498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGfLMcIDkPRrhYim8Rns6iE8vW+Zh9BxsU3jOi2B09I=;
        b=gwyVRKnPghQrTrQ7W/KhXSHyJ9M0mOm17AyHIuB5LXVQSGy2FQevnwc5XQSd7wr8gt
         BDlI2UULG8+GAmfb3D8S1+UMJgB0oqlxWzfM0PCPDrHfCrf1FsbeCa9oMOyw93PxaD11
         Uv6LVvfLxB+OENdNj8BtrtgLF0sgkWx3mFN3QON1wXG9/Jap9plMq6hpPeP7K6EDmjS2
         /Yfxvwh3q8bmwLLTeC3Sz9BybtwMj3ai5MM+Av940Z0iaFLhriA1DljUpI5j7H9kXxc4
         rY2m8z18lHorABneMnFut8BcEYx/9S52Uv6opLDMI4qW89ugzSmAfc7x0STHX/YTSu+0
         OIlg==
X-Forwarded-Encrypted: i=1; AJvYcCWZSYuBiEy1yY7CcWhn5SQ7vGMgdq+NzHnJenoIYUFgq8Nno0f7P0i0pHRMoMcrIRJaVd8Q77NgTCvQ77Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0OPKxd/+1hgT4nY+3OFSrmK7RiqO07j6W46Z80frW9ngYWd4v
	1lqfvgEGrLi2YAb1YSYTk2y0jxJLNTHpJLUxnmUMCAmGQed9driT
X-Gm-Gg: ASbGncsJycf+nwS3cYbYW4q+xX+ObTImzeA16CkcT0Dd4fDQ+akHvu5W3zfdkK7rwwg
	WveH1fEU87VT1AkO1EVcf2XRF+6RX6nGA7QG2Iu1o063REt/un2hggFb8Xrmd5Ju7nuobu1CbjC
	nDAKJ7ZiHnBFlgKn8AohctSx+YU6SqfhUDhROyBwELC7lU6PC+zShnycvsiWpPw5fQ7j1G7GTAo
	9m5K+zg9bnR0IRHJJcTHVu9mfyeZcpoQgz1tC0kir0hec3xydIQPWjtuQ==
X-Google-Smtp-Source: AGHT+IGnlI9X7EVqCZboVTMPTBX4one4eac6oIxq5S7Oy+vpy3KvC60We2FfIooBwJxl2hCNXOgJYg==
X-Received: by 2002:a17:907:2d8d:b0:aa6:800a:128c with SMTP id a640c23a62f3a-ab38b1e2014mr980137966b.11.1737324698313;
        Sun, 19 Jan 2025 14:11:38 -0800 (PST)
Received: from [10.0.1.56] ([2001:871:22a:8634::1ad1])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab384c5c3e1sm537196366b.7.2025.01.19.14.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 14:11:37 -0800 (PST)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Date: Sun, 19 Jan 2025 23:11:14 +0100
Subject: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
In-Reply-To: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737324695; l=7704;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=BpzYCh8E9xDZIgTNEb/PKjudC6fYs4uMTBBIrckxig0=;
 b=29Z/PiKr0jB/kl18aLPpSPyb2sU5EEHBoVX9kSK3zImR9QodcHr/B+B9bZ6SyRIl4z5+CSrbo
 8VzcuBrS9C1Ba6U45eofOSxGd486glG4k3zZneRTWunZMq7JiKKj1kf
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

When using the Rust miscdevice bindings, you generally embed the
MiscDeviceRegistration within another struct:

struct MyDriverData {
    data: SomeOtherData,
    misc: MiscDeviceRegistration<MyMiscFile>
}

In the `fops->open` callback of the miscdevice, you are given a
reference to the registration, which allows you to access its fields.
For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
accessor to pull out miscdevice::this_device") you can access the
internal `struct device`. However, there is still no way to access the
`data` field in the above example, because you only have a reference to
the registration.

Using container_of is also not possible to do safely. For example, if
the destructor of `MyDriverData` runs, then the destructor of `data`
would run before the miscdevice is deregistered, so using container_of
to access `data` from `fops->open` could result in a UAF. A similar
problem can happen on initialization if `misc` is not the last field to
be initialized.

To provide a safe way to access user-defined data stored next to the
`struct miscdevice`, make `MiscDeviceRegistration` into a container that
can store a user-provided piece of data. This way, `fops->open` can
access that data via the registration, since the data is stored inside
the registration.

The container enforces that the additional user data is initialized
before the miscdevice is registered, and that the miscdevice is
deregistered before the user data is destroyed. This ensures that access
to the userdata is safe.

For the same reasons as in commit 88441d5c6d17 ("rust: miscdevice:
access the `struct miscdevice` from fops->open()"), you cannot access
the user data in any other fops callback than open. This is because a
miscdevice can be deregistered while there are still open files.

A situation where this user data might be required is when a platform
driver acquires a resource in `probe` and wants to use this resource in
the `fops` implementation of a `MiscDevice`.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
 rust/kernel/miscdevice.rs        | 37 ++++++++++++++++++++++++++++++-------
 samples/rust/rust_misc_device.rs |  4 +++-
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index dfb363630c70b7187cae91f692d38bcf42d56a0a..3a756de27644e8a14e5bbd6b8abd9604e05faed4 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -16,7 +16,7 @@
     prelude::*,
     seq_file::SeqFile,
     str::CStr,
-    types::{ForeignOwnable, Opaque},
+    types::{Aliased, ForeignOwnable, Opaque},
 };
 use core::{
     ffi::{c_int, c_long, c_uint, c_ulong},
@@ -49,24 +49,30 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
 /// # Invariants
 ///
 /// `inner` is a registered misc device.
-#[repr(transparent)]
+#[repr(C)]
 #[pin_data(PinnedDrop)]
-pub struct MiscDeviceRegistration<T> {
+pub struct MiscDeviceRegistration<T: MiscDevice> {
     #[pin]
     inner: Opaque<bindings::miscdevice>,
+    #[pin]
+    data: Aliased<T::RegistrationData>,
     _t: PhantomData<T>,
 }
 
 // SAFETY: It is allowed to call `misc_deregister` on a different thread from where you called
 // `misc_register`.
-unsafe impl<T> Send for MiscDeviceRegistration<T> {}
+unsafe impl<T: MiscDevice<RegistrationData: Send>> Send for MiscDeviceRegistration<T> {}
 // SAFETY: All `&self` methods on this type are written to ensure that it is safe to call them in
 // parallel.
-unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
+// MiscDevice::RegistrationData is always Sync.
+unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
 
 impl<T: MiscDevice> MiscDeviceRegistration<T> {
     /// Register a misc device.
-    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
+    pub fn register(
+        opts: MiscDeviceOptions,
+        data: impl PinInit<T::RegistrationData, Error>,
+    ) -> impl PinInit<Self, Error> {
         try_pin_init!(Self {
             inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
                 // SAFETY: The initializer can write to the provided `slot`.
@@ -79,6 +85,7 @@ pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
                 // misc device.
                 to_result(unsafe { bindings::misc_register(slot) })
             }),
+            data <- Aliased::try_pin_init(data),
             _t: PhantomData,
         })
     }
@@ -97,10 +104,18 @@ pub fn device(&self) -> &Device {
         // before the underlying `struct miscdevice` is destroyed.
         unsafe { Device::as_ref((*self.as_raw()).this_device) }
     }
+
+    /// Access the additional data stored in this registration.
+    pub fn data(&self) -> &T::RegistrationData {
+        // SAFETY:
+        // No mutable reference to the value contained by self.data can ever be created.
+        // The value contained by self.data is valid for the entire lifetime of self.
+        unsafe { &*self.data.get() }
+    }
 }
 
 #[pinned_drop]
-impl<T> PinnedDrop for MiscDeviceRegistration<T> {
+impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
     fn drop(self: Pin<&mut Self>) {
         // SAFETY: We know that the device is registered by the type invariants.
         unsafe { bindings::misc_deregister(self.inner.get()) };
@@ -113,6 +128,11 @@ pub trait MiscDevice: Sized {
     /// What kind of pointer should `Self` be wrapped in.
     type Ptr: ForeignOwnable + Send + Sync;
 
+    /// The additional data carried by the `MiscDeviceRegistration` for this `MiscDevice`.
+    /// If no additional data is required than () should be used.
+    /// This data can be accessed in `open()` using `MiscDeviceRegistration::data()`.
+    type RegistrationData: Sync;
+
     /// Called when the misc device is opened.
     ///
     /// The returned pointer will be stored as the private data for the file.
@@ -218,6 +238,9 @@ impl<T: MiscDevice> VtableHelper<T> {
     // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
     // associated `struct miscdevice` before calling into this method. Furthermore, `misc_open()`
     // ensures that the miscdevice can't be unregistered and freed during this call to `fops_open`.
+    // Since this the `MiscDeviceRegistration` struct uses `#[repr(C)]` and the miscdevice is the
+    // first entry it is guaranteed that the address of the miscdevice is the same as the address
+    // of the entire `MiscDeviceRegistration` struct.
     let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
 
     // SAFETY:
diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index 40ad7266c2252e5c0b4e91e501ef9ada2eda3b16..779fcfd64119bdd5b4f8be740f7e8336c652b4d3 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -136,7 +136,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
         };
 
         try_pin_init!(Self {
-            _miscdev <- MiscDeviceRegistration::register(options),
+            _miscdev <- MiscDeviceRegistration::register(options, ()),
         })
     }
 }
@@ -156,6 +156,8 @@ struct RustMiscDevice {
 impl MiscDevice for RustMiscDevice {
     type Ptr = Pin<KBox<Self>>;
 
+    type RegistrationData = ();
+
     fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
         let dev = ARef::from(misc.device());
 

-- 
2.48.1

