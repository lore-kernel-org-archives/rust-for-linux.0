Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F0F30149E
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774225; cv=none; b=WQOlMtC8Q3UvQN1O249ogoc1YiXOcBpecZt2oVkzwI1ZDsfMukfcGzFOoG9OzhQPorfbIR3YeJokGxO8O/v4t/a4xMfSISTyh7Y3BTDdWeqR6mUQuzbxowJ6HMqq5MHETLrn2a6trDPY3m8hGiCAnPzcgdd4IjU73vr3qrQbiZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774225; c=relaxed/simple;
	bh=CF3rzU8jIMRswcaMpUzkI1EDHIxMdo134zKxifMVFkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=klnEe/opcCGFy9x9vBEXx6C4LGxNjt4X4gflnbvBkuCaN3U8a5QZO5+qpKol+Ytr7tEVDMpRD9qHvy7z/3Pz/RaGDIivGm6KbTmd+ttmpAOP3WPKdD5mncvaKWAomY78er7SM4Cr2RbcjCS+JVRhYeQeWe6YlIBm10ns/4q42zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvyuPw29; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvyuPw29"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775895d69cso14773765e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 03:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762774222; x=1763379022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DHfgELXkhVwbquT5P2ScfIFNktEJf3l1zoswfQXwCs=;
        b=JvyuPw29R1b4XwvB8XWXt3HFwRFafi/zCHwAnPBI/OcLO5pKCv72IRX4wtlBRJtv8k
         ChzTBdLPFh33lI3UvijcXe01tye+esFP2aBnEzIL3pGM9iWgy3dIzBkE6nGUsa+4ZrMC
         cQcTmx8v9+bYMUkQP5WBmAtIiPctE+chivhIu9osb3qqP269qRViRc3tqb6R6hICMeWu
         Hscjf+5ZvBB66jSohyYwMNKhaVKthBAeZtdsi+c3OfGEZlPjDrtbNd0dfh643lRzL3Eu
         SU964DGBlQsSQdqFPoEW6cCEX43t+z2JPMTUsNHrHIlmS4B6PZLZU6yAq5Xrx1mEnotm
         kW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774222; x=1763379022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+DHfgELXkhVwbquT5P2ScfIFNktEJf3l1zoswfQXwCs=;
        b=w7saC8Pm70LBF93A3cx9mvestmiTJVfUT0tutfqLpLmLCXdWv0xIvmpxL7ckiv6hvk
         RRZZnaXBPhQ11zei3AQNCHiwwTcyYhqA4yMKt73DbYwkPAjoNK91KScqdyqW8otLmf7w
         60r7B3wt10O+TDCQywQ2zjOBkJwHWefho+t0twKulatBtbbx4WS9TSA8tmO9bLxjaa/0
         4wMBAj3iQXepzMRTz6ntj9D7Jlvk05XNrT8cZN1ZaCiib5knH5PTUknx0sMHQkvfs3oL
         qWGoMNroh+MBkfuxx0DQoge1PIvxiGLt7hpoNjqHd5JpPA4sj33fmj0P58jYv/moYzdc
         A70w==
X-Forwarded-Encrypted: i=1; AJvYcCUy9tmwRenG+csGCfv3KaYWszXEqNyAWb+6vE9tKmB+91aEHgrPvPcuPzlk28lf6onnvmuVvXMOkzQq6xIpNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHLh8O1WNLGmUmORttGMlWfaI+ov9GoDFN/vu9z5njsJH1iiX
	9un+djbPphhb5dax6n2JyL6WE+qjTIdVpg3J6HdOvWzqUkUV9V4IgHJR
X-Gm-Gg: ASbGncua9bSspwGtgzCUtD69zFgnGx4QSqG7a0PAWymE0AyK9CP4/YWuMxlOngIAuXB
	hIBtUfWDlXirH2BGzy7ozA38Zxl+QjmboAVRlTV7bjB15wuTrhTBgoRKw/rW2BvxYkUwzwfYqS4
	1LnV4vAk88v/5xmIT+9JfhkjN+1CydX2q994ROr80/hLsWQzhmuDCcvZ7Sl+/9KslTt8f7jO6lW
	aKTT8uRoiBD/GDY4Ry3Tv64POiHRin2qJfvMF6zWJa3tJOuN/m4hfOTmnegWmkNQmg42M3ZXShX
	vcQnz0eWb7ZO0v7pbaJb/A0WOQxd+pzdnF0KMExSp/cQ19HrRYLdC5tsHXgHVIhpkCFQtEj7Ugv
	LNGde9oBuCgPMFGLD5GaKmHD6f6O0zEID5K4434cGJNi+z/cZx7xJwYl70PojglQKseRpsIxrNp
	p/ksbRduHqrHRY8Nw=
X-Google-Smtp-Source: AGHT+IFJfZmt0xxSrdQkoDsqsgPBc19P9epE+8RZNMB3WgQayLAvztXdTXuBwiKABJ42GiyeZr2u3A==
X-Received: by 2002:a05:600c:46d5:b0:475:d952:342f with SMTP id 5b1f17b1804b1-4777329e142mr57554745e9.39.1762774221527;
        Mon, 10 Nov 2025 03:30:21 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477773f7749sm116462535e9.7.2025.11.10.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:30:21 -0800 (PST)
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Hung <alex.hung@amd.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v7 2/4] rust: i2c: add manual I2C device creation abstractions
Date: Mon, 10 Nov 2025 11:30:18 +0000
Message-ID: <20251110113018.51510-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
References: <20251110112437.50405-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In addition to the basic I2C device support, add rust abstractions
upon `i2c_new_client_device`/`i2c_unregister_device` C functions.

Implement the core abstractions needed for manual creation/deletion
of I2C devices, including:

 * `i2c::Registration` — a NonNull pointer created by the function
                          `i2c_new_client_device`

 * `i2c::I2cAdapter` — a ref counted wrapper around `struct i2c_adapter`

 * `i2c::I2cBoardInfo` — a safe wrapper around `struct i2c_board_info`

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 rust/kernel/i2c.rs | 153 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 41ef7c65c555..27f9ee628e2c 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -6,6 +6,7 @@
 use crate::{
     acpi, container_of, device,
     device_id::{RawDeviceId, RawDeviceIdIndex},
+    devres::Devres,
     driver,
     error::*,
     of,
@@ -13,7 +14,12 @@
     types::{AlwaysRefCounted, Opaque},
 };
 
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ptr::{from_ref, NonNull},
+};
+
+use kernel::types::ARef;
 
 /// An I2C device id table.
 #[repr(transparent)]
@@ -345,6 +351,101 @@ fn unbind(dev: &I2cClient<device::Core>, this: Pin<&Self>) {
     }
 }
 
+/// The i2c adapter representation.
+///
+/// This structure represents the Rust abstraction for a C `struct i2c_adapter`. The
+/// implementation abstracts the usage of an existing C `struct i2c_adapter` that
+/// gets passed from the C side
+///
+/// # Invariants
+///
+/// A [`I2cAdapter`] instance represents a valid `struct i2c_adapter` created by the C portion of
+/// the kernel.
+#[repr(transparent)]
+pub struct I2cAdapter<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::i2c_adapter>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> I2cAdapter<Ctx> {
+    fn as_raw(&self) -> *mut bindings::i2c_adapter {
+        self.0.get()
+    }
+}
+
+impl I2cAdapter {
+    /// Returns the I2C Adapter index.
+    #[inline]
+    pub fn get_nr(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct i2c_adapter`.
+        unsafe { (*self.as_raw()).nr }
+    }
+    /// Gets pointer to an `i2c_adapter` by index.
+    pub fn get(index: i32) -> Result<ARef<Self>> {
+        // SAFETY: `index` must refer to a valid I2C adapter; the kernel
+        // guarantees that `i2c_get_adapter(index)` returns either a valid
+        // pointer or NULL. `NonNull::new` guarantees the correct check.
+        let adapter = NonNull::new(unsafe { bindings::i2c_get_adapter(index) }).ok_or(ENODEV)?;
+
+        // SAFETY: `adapter` is non-null and points to a live `i2c_adapter`.
+        // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
+        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
+    }
+}
+
+// SAFETY: `I2cAdapter` is a transparent wrapper of a type that doesn't depend on `I2cAdapter`'s generic
+// argument.
+kernel::impl_device_context_deref!(unsafe { I2cAdapter });
+kernel::impl_device_context_into_aref!(I2cAdapter);
+
+// SAFETY: Instances of `I2cAdapter` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::i2c_get_adapter(self.get_nr()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::i2c_put_adapter(obj.as_ref().as_raw()) }
+    }
+}
+
+/// The i2c board info representation
+///
+/// This structure represents the Rust abstraction for a C `struct i2c_board_info` structure,
+/// which is used for manual I2C client creation.
+#[repr(transparent)]
+pub struct I2cBoardInfo(bindings::i2c_board_info);
+
+impl I2cBoardInfo {
+    const I2C_TYPE_SIZE: usize = 20;
+    /// Create a new [`I2cBoardInfo`] for a kernel driver.
+    #[inline(always)]
+    pub const fn new(type_: &'static CStr, addr: u16) -> Self {
+        build_assert!(
+            type_.len_with_nul() <= Self::I2C_TYPE_SIZE,
+            "Type exceeds 20 bytes"
+        );
+        let src = type_.as_bytes_with_nul();
+        // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut i2c_board_info: bindings::i2c_board_info = unsafe { core::mem::zeroed() };
+        let mut i: usize = 0;
+        while i < src.len() {
+            i2c_board_info.type_[i] = src[i];
+            i += 1;
+        }
+
+        i2c_board_info.addr = addr;
+        Self(i2c_board_info)
+    }
+
+    fn as_raw(&self) -> *const bindings::i2c_board_info {
+        from_ref(&self.0)
+    }
+}
+
 /// The i2c client representation.
 ///
 /// This structure represents the Rust abstraction for a C `struct i2c_client`. The
@@ -423,3 +524,53 @@ unsafe impl Send for I2cClient {}
 // SAFETY: `I2cClient` can be shared among threads because all methods of `I2cClient`
 // (i.e. `I2cClient<Normal>) are thread safe.
 unsafe impl Sync for I2cClient {}
+
+/// The registration of an i2c client device.
+///
+/// This type represents the registration of a [`struct i2c_client`]. When an instance of this
+/// type is dropped, its respective i2c client device will be unregistered from the system.
+///
+/// # Invariants
+///
+/// `self.0` always holds a valid pointer to an initialized and registered
+/// [`struct i2c_client`].
+#[repr(transparent)]
+pub struct Registration(NonNull<bindings::i2c_client>);
+
+impl Registration {
+    /// The C `i2c_new_client_device` function wrapper for manual I2C client creation.
+    pub fn new<'a>(
+        i2c_adapter: &I2cAdapter,
+        i2c_board_info: &I2cBoardInfo,
+        parent_dev: &'a device::Device<device::Bound>,
+    ) -> impl PinInit<Devres<Self>, Error> + 'a {
+        Devres::new(parent_dev, Self::try_new(i2c_adapter, i2c_board_info))
+    }
+
+    fn try_new(i2c_adapter: &I2cAdapter, i2c_board_info: &I2cBoardInfo) -> Result<Self> {
+        // SAFETY: the kernel guarantees that `i2c_new_client_device()` returns either a valid
+        // pointer or NULL. `from_err_ptr` separates errors. Following `NonNull::new` checks for NULL.
+        let raw_dev = from_err_ptr(unsafe {
+            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_board_info.as_raw())
+        })?;
+
+        let dev_ptr = NonNull::new(raw_dev).ok_or(ENODEV)?;
+
+        Ok(Self(dev_ptr))
+    }
+}
+
+impl Drop for Registration {
+    fn drop(&mut self) {
+        // SAFETY: `Drop` is only called for a valid `Registration`, which by invariant
+        // always contains a non-null pointer to an `i2c_client`.
+        unsafe { bindings::i2c_unregister_device(self.0.as_ptr()) }
+    }
+}
+
+// SAFETY: A `Registration` of a `struct i2c_client` can be released from any thread.
+unsafe impl Send for Registration {}
+
+// SAFETY: `Registration` offers no interior mutability (no mutation through &self
+// and no mutable access is exposed)
+unsafe impl Sync for Registration {}
-- 
2.43.0

