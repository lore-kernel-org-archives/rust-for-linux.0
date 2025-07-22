Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355F32E498E
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187641; cv=none; b=ikcSVm3WSmMUZM2Vt5daTYeWPGZGAoWWRI+OQJ13etiLJnlInyrwWCD1e+Iy0SBLr+06u4GIYNZFTr6ngA7ZGYV2h6sRRHYSoWcbi6J0jdRirRJSq0E3aPB3EktLFRLvYtcMnZG0ckCrGnwi+RqtSkW2tcN3BYhl4ky2JouFxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187641; c=relaxed/simple;
	bh=RHSf1djWQ5ziuqFNfIcXAngCpz/As9JffyIUYTaCsAQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u28nAcOtz8H26lztX+zZuDb1LAKbX4mujfFH7aP/mk7sxlPTNHol6kWtGoOsHXTUyqaJAJZ4ExXLgdgWi68w84bQ75jSxr1GDwqm6KzygFbYfhKBikq66WH+iVP2vXujoBLay7JRWQqRRJwAWxzjOtYb48Y47SG7MyZKzTzeBmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l6DODV5E; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l6DODV5E"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a5058f9ef4so2054281f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 05:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753187637; x=1753792437; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHuFNlg3XjE6xiR6wmMnLidoCY7UAyUub3aLnrvtSCI=;
        b=l6DODV5ERtVhs5iYBvuSZRVb4T8kD3SY/lRc+ObnQ36CG064Z13r+zCXzwUW5FVWTt
         c12Ht5oIFjbSNGHRBAm5GTtWAecyX3zWA7F3CUP4FcC6XMIcEiwTXOXqiUGhdsLtHEt9
         0vmpS2JvkWu0MAFwc2ggCScjkRYTWwSUQdbA3R7ls7ltZW/qyryDljlD27Gx6oY/qg5D
         gAso0PSTgRMHfGuL+WKsbRs1JvRN4+F0RdO7vI7dD1idABH3qpv2y74sz3fEgOu/Yi+I
         +O0OURUNKul6sygmgp/LTPFWTJFb6AOuvPa4GoA1lkKCn3nAU/L9B4bAQyfTaajZlIDF
         WrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187637; x=1753792437;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHuFNlg3XjE6xiR6wmMnLidoCY7UAyUub3aLnrvtSCI=;
        b=pvn8DwJAR5c9R0J/s9ZSK9M2BWJMGgW7WzrYv7RYWY/6mWXijClS1lG40wogHLPzT0
         TpOIz4Og5uslwOc8psJyour7CexOx2xAJUxV5opbw1g3oFYx5UZbCCaGBLeo+Ei4bI/G
         nK4ngVBdSdrbv+fbmIq4RHo3NZ6mIPEfsu0J3CcU4sjWWu/ewdBb9kwYAxZe7/1pyJgc
         BSQ2UAi6bba6rmHRzUXLMwSiTLN7Ffali0rDjr/rF+IIstaNM6j7s7XZZXWdOow1T0v7
         YNiyFIIm6sPlJl4PUH02wkZqY6bBa7BBkyoxBqsyOlTJ6rBTX0odJktObwTB7yQ7NM/y
         Y5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1DcS2wlXXYRGQTNnTXwXNEwlZUPcdLmmrOdha8+6L2KdT2ydvpG7nN+WvAveRgzfc5PcllH3y2NL7ghZPEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3k0rQjT7+uLX7q71DtNVI7E7iexI7586XECl+G3iaGVX2Zt3n
	8BCSHlTXNMAc8+kOxeU+SEGetNN3vVvrsWfgpEvpzXfom59oUln54FZAzR5mTqhr+tfxl5N//FU
	fZFBrmN3nwHpDaMM0sw==
X-Google-Smtp-Source: AGHT+IGCiOpv5N70smSx4M9mF1xjWR2XagRQxcYjCsEDgG6w3ESOsRvYxhb36yCsFqyKuqaSd52odsvNBTbgqJU=
X-Received: from wrmr13.prod.google.com ([2002:adf:e68d:0:b0:3a4:e608:d34b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:250c:b0:3b5:e6c0:1241 with SMTP id ffacd0b85a97d-3b60dd65266mr23484990f8f.9.1753187637394;
 Tue, 22 Jul 2025 05:33:57 -0700 (PDT)
Date: Tue, 22 Jul 2025 12:33:11 +0000
In-Reply-To: <20250722-iov-iter-v3-0-3efc9c2c2893@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250722-iov-iter-v3-0-3efc9c2c2893@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7067; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RHSf1djWQ5ziuqFNfIcXAngCpz/As9JffyIUYTaCsAQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBof4UwSU9RtvHAUUnUlpX4wTNHJ4T948ieWfHyh
 Az1EfYuqEmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaH+FMAAKCRAEWL7uWMY5
 RiiDD/0arJRqkglkqv8O2LNCN5M8Y/lNP6cBHo2WXsuQsthaCvatn6fQuh5ygLbkFOEID275jw1
 X32NCjHXSAmR9nyhVFAGUGBQvgBTq+N4zK/ptCcgr1KU2AaZZYEIPimvck2d2aZsZNoC92oTabB
 VgaUsQHH1D2+LieOsicE92gY++iDiolQ8ySK/T1XHIt72fZtNygiZBiDQHxCid8F0cEPe23ie5q
 W8L1zRPUQX0VZWOF7OsNu1Dkc8XYJXKGPF3pSX+E8UqRBIkej5Wt6MAzMoFI8nwvbZbRMAiifTS
 OCbW+o1Lb8gvM6iudP40KKeXHa9QMA0vKxBZMdnHwCeYMahu1dwFA96GLRoj+TFT7f5q3rZtkYq
 CRLMrRKa5Mlqu5f81nCpS4MBUccUTFlHfvNBDXK1BJrIzwXJh7evFWhhs45AXNZ3MF2L+uTN/W0
 1QUlkNJyHyzVb/t/e9O5hlHX1CzV9IQLa05COxeaYjyu0rNDeQSCUOODh5E8jXCZXgHhxkQBNGz
 zn+6U8R/ToLlK1ZFXwDTd6YvELahZnKZWMsKVCQZGFTksgGZS8HKcY0mUENl235Clqz+JpeT15z
 fJ6DKShQHdW5045N8FNfya54XuYrGyD7H6meZHYFt4rrkid8wSq4ubN4Ze8w3MpI6A7549BEskD lsH9sLZsjY5xcHQ==
X-Mailer: b4 0.14.2
Message-ID: <20250722-iov-iter-v3-3-3efc9c2c2893@google.com>
Subject: [PATCH v3 3/4] rust: miscdevice: Provide additional abstractions for
 iov_iter and kiocb structures
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"

These will be used for the read_iter() and write_iter() callbacks, which
are now the preferred back-ends for when a user operates on a char device
with read() and write() respectively.

Cc: Christian Brauner <brauner@kernel.org>
Co-developed-by: Lee Jones <lee@kernel.org>
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/fs.rs         |  3 +++
 rust/kernel/fs/kiocb.rs   | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/miscdevice.rs | 63 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index 0121b38c59e63d01a89f22c8ef6983ef5c3234de..6ba6bdf143cb991c6e78215178eb585260215da0 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -6,3 +6,6 @@
 
 pub mod file;
 pub use self::file::{File, LocalFile};
+
+mod kiocb;
+pub use self::kiocb::Kiocb;
diff --git a/rust/kernel/fs/kiocb.rs b/rust/kernel/fs/kiocb.rs
new file mode 100644
index 0000000000000000000000000000000000000000..837f4be7cb8fbca6e3f9aeff74d1c904df3ff7ff
--- /dev/null
+++ b/rust/kernel/fs/kiocb.rs
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 Google LLC.
+
+//! Kernel IO callbacks.
+//!
+//! C headers: [`include/linux/fs.h`](srctree/include/linux/fs.h)
+
+use core::marker::PhantomData;
+use core::ptr::NonNull;
+use kernel::types::ForeignOwnable;
+
+/// Wrapper for the kernel's `struct kiocb`.
+///
+/// Currently this abstractions is incomplete and is essentially just a tuple containing a
+/// reference to a file and a file position.
+///
+/// The type `T` represents the private data of the underlying file.
+///
+/// # Invariants
+///
+/// `inner` points at a valid `struct kiocb` whose file has the type `T` as its private data.
+pub struct Kiocb<'a, T> {
+    inner: NonNull<bindings::kiocb>,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T: ForeignOwnable> Kiocb<'a, T> {
+    /// Create a `Kiocb` from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must reference a valid `struct kiocb` for the duration of `'a`. The private
+    /// data of the file must be `T`.
+    pub unsafe fn from_raw(kiocb: *mut bindings::kiocb) -> Self {
+        Self {
+            // SAFETY: If a pointer is valid it is not null.
+            inner: unsafe { NonNull::new_unchecked(kiocb) },
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Access the underlying `struct kiocb` directly.
+    pub fn as_raw(&self) -> *mut bindings::kiocb {
+        self.inner.as_ptr()
+    }
+
+    /// Get the Rust data stored in the private data of the file.
+    pub fn file(&self) -> <T as ForeignOwnable>::Borrowed<'a> {
+        // SAFETY: The `kiocb` lets us access the private data.
+        let private = unsafe { (*(*self.as_raw()).ki_filp).private_data };
+        // SAFETY: The kiocb has shared access to the private data.
+        unsafe { <T as ForeignOwnable>::borrow(private) }
+    }
+
+    /// Gets the current value of `ki_pos`.
+    pub fn ki_pos(&self) -> i64 {
+        // SAFETY: The `kiocb` can access `ki_pos`.
+        unsafe { (*self.as_raw()).ki_pos }
+    }
+
+    /// Gets a mutable reference to the `ki_pos` field.
+    pub fn ki_pos_mut(&mut self) -> &mut i64 {
+        // SAFETY: The `kiocb` can access `ki_pos`.
+        unsafe { &mut (*self.as_raw()).ki_pos }
+    }
+}
diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index ad51ffc549b85da9b71ed866bf0afd4c4cb76f07..eaa626277cc39d84761a2228f5aee05640323094 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -13,7 +13,8 @@
     device::Device,
     error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_int, c_long, c_uint, c_ulong},
-    fs::File,
+    fs::{File, Kiocb},
+    iov::{IovIterDest, IovIterSource},
     mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
@@ -136,6 +137,16 @@ fn mmap(
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
+    /// Read from this miscdevice.
+    fn read_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterDest<'_>) -> Result<usize> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Write to this miscdevice.
+    fn write_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterSource<'_>) -> Result<usize> {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
     /// Handler for ioctls.
     ///
     /// The `cmd` argument is usually manipulated using the utilities in [`kernel::ioctl`].
@@ -240,6 +251,46 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         0
     }
 
+    /// # Safety
+    ///
+    /// `kiocb` must be correspond to a valid file that is associated with a
+    /// `MiscDeviceRegistration<T>`. `iter` must be a valid `struct iov_iter` for writing.
+    unsafe extern "C" fn read_iter(
+        kiocb: *mut bindings::kiocb,
+        iter: *mut bindings::iov_iter,
+    ) -> isize {
+        // SAFETY: The caller provides a valid `struct kiocb` associated with a
+        // `MiscDeviceRegistration<T>` file.
+        let kiocb = unsafe { Kiocb::from_raw(kiocb) };
+        // SAFETY: This is a valid `struct iov_iter` for writing.
+        let iov = unsafe { IovIterDest::from_raw(iter) };
+
+        match T::read_iter(kiocb, iov) {
+            Ok(res) => res as isize,
+            Err(err) => err.to_errno() as isize,
+        }
+    }
+
+    /// # Safety
+    ///
+    /// `kiocb` must be correspond to a valid file that is associated with a
+    /// `MiscDeviceRegistration<T>`. `iter` must be a valid `struct iov_iter` for writing.
+    unsafe extern "C" fn write_iter(
+        kiocb: *mut bindings::kiocb,
+        iter: *mut bindings::iov_iter,
+    ) -> isize {
+        // SAFETY: The caller provides a valid `struct kiocb` associated with a
+        // `MiscDeviceRegistration<T>` file.
+        let kiocb = unsafe { Kiocb::from_raw(kiocb) };
+        // SAFETY: This is a valid `struct iov_iter` for reading.
+        let iov = unsafe { IovIterSource::from_raw(iter) };
+
+        match T::write_iter(kiocb, iov) {
+            Ok(res) => res as isize,
+            Err(err) => err.to_errno() as isize,
+        }
+    }
+
     /// # Safety
     ///
     /// `file` must be a valid file that is associated with a `MiscDeviceRegistration<T>`.
@@ -336,6 +387,16 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {
         open: Some(Self::open),
         release: Some(Self::release),
         mmap: if T::HAS_MMAP { Some(Self::mmap) } else { None },
+        read_iter: if T::HAS_READ_ITER {
+            Some(Self::read_iter)
+        } else {
+            None
+        },
+        write_iter: if T::HAS_WRITE_ITER {
+            Some(Self::write_iter)
+        } else {
+            None
+        },
         unlocked_ioctl: if T::HAS_IOCTL {
             Some(Self::ioctl)
         } else {

-- 
2.50.0.727.gbf7dc18ff4-goog

