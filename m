Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5098D278E67
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754063085; cv=none; b=dMoOU0MTqvhpavVodBAf+mywrjJXN73nN8ManWqWYFv3+q4HxHGDzrEfgB3lBwWV6vlC9tiVA26ZCgvGMsGjFA9JvVXVqqnKYq3Hwp06TOZRmiCIt/svroClPiYLsha9aU3a7WQ8XsWC/ql1CnnNP4EM3hxUgSkzUoK6REdLPdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754063085; c=relaxed/simple;
	bh=kHPZSBEZzQzR7CMf81PCkao5jHXZcAMwZJiNaN9mRQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jB+1IJWDDU+dgoB4hSYmf2yIWyzI/D7qDqK2AvD80KtFItAWH1IEwsYUCo6pFIwCGG/+k/fUySMt39heErIABCUAUd52wm+/JchMcjc9HbYSvJifbuKG6Yb3/G+l2GczZfT8ahovY3mGSPyifpsHEJWO9KBx4MPfPVXQiWAFuHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEpoEcmT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEpoEcmT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b780bdda21so837185f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754063081; x=1754667881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBPCELonZG05X0aYMg4c9grHdttWvMDek2jw7T/Qy3Q=;
        b=bEpoEcmTnkyXs7HLnLk1y6PftIcWYbe3RcM1SBGUxiVNpiRFVqJlDPzWEtqMAsI4jm
         6WNnFE1dwOM3aBAOO/rDjXxQrUMSD7ea2uCt3TO+Dfbq9UkVvS+x+noLmAiieX8b1NQD
         gnL3GiCewQEjk1OY3jNnFVNU0W696Sp6rmmrleXOkoy+GeCrnOnr8vllksKiVDBE4n9F
         C97MJBogrPGQQOYpKDSI82hEJsERfTrIxkClJKeFU3DkSuFqmXYCulkN+8bhItdTy5wD
         uOWErYVad0Bu6wRalsh8jG5/o+UA1hBmhmGSM+QDQzs/bSeS682+dLTRlZheDMgNZW+n
         Hviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754063081; x=1754667881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBPCELonZG05X0aYMg4c9grHdttWvMDek2jw7T/Qy3Q=;
        b=AepDJcOw+s8lCylaNGVzxwwetTQoQ0ePZjW7DI/01ndr7xzs/miigiJT8ETBqoG4nA
         clAhRZYLX65nbJKso8JeXPlZAPWA5iL0e0AKT+jKWQSe+Ajh7FEm5fBEHcGm0RPJFggV
         B9FHHs4U6PXC53wqkpnj0VQJ1xKin4j7vsgNNJdhNgNAvzlHU8sx+WU9kkkwQZfOJFba
         AFcM6OOL7wSGKtxPRdeybFjg69dDlgo+R2cL2i7Pn6BpWxDlTwy9SLP/+OwiIx/s8mHV
         s5X9wyjgwpQDdqvS+fvYuCF3XKMoeIJ0x1n4e54Ev2KzBGBePCA9We64Gc1/cgdT+2Ze
         ohlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQfffiqfQiNl/3V7tcZS8kWTSVCcxE0vD4/JsxdtbZtNqoOrp4gZst6IIHnQdjZ027GyQvH3deRVx1fUX4Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYc8yf1c7hZNKPtmpm3UDRn5U7wePxCKSLE+Ld5C3jfA64gVt
	7sT07oe36WbkRJUV6GLNJusA1PJPcHkD9RRQkB6rwUIC08TuRmMF58fN
X-Gm-Gg: ASbGncsN3g5CxpT3vOkMcU/1TGI+GQbJPwLg7lCJk+idAtfl4zB8bQwYYRxKH+xdwwo
	4ISsMrJzQkGHKzuV9IW3VB1pHpuDcGuSup0S6EVQuMU+ijck+FeDsKTrCbr3Kqg4SmiqdH9t7gi
	/mAuAUvJmlEl+h755M9VGP037bwsaZauNKJoL3Oe7IdlYmI1+gIf8A3iAFbm3Pl7CpVrbjNeVzm
	HcYvhe6zAji11oIEYglhA2sR8Se2m7uDlzHF93I9pZc828FFVpqU3FmennIdfU9r3623pqnSFcJ
	5fCIjGrm/3mP7yDrSC2ayJf5GEYgx9WNVUzkonkLMRFwJyc00UPNAeqtWSZaVZV7jS2jjFqtYej
	RXzhcW0iNHCzYtV6A5tnwptC0vT5HzePq65q7B4p0NLpori+d/HvpMosZjZmUoFFe36WjGFLf
X-Google-Smtp-Source: AGHT+IG3BTMCd2v/b3pTOLMu+C4aHlGIaTO3OHfGCz5LlmOH8nQRkhkKdujtP1fcSJyuUq7DqcUIZA==
X-Received: by 2002:a05:6000:420d:b0:3b7:8473:312c with SMTP id ffacd0b85a97d-3b8d94064dfmr265649f8f.0.1754063081326;
        Fri, 01 Aug 2025 08:44:41 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac158sm6439680f8f.4.2025.08.01.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:44:40 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 2/3] rust: i2c: add manual I2C device creation abstractions
Date: Fri,  1 Aug 2025 16:44:38 +0100
Message-ID: <20250801154438.14759-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In addition to the basic I2C device support, added rust abstractions
upon `i2c_new_client_device`/`i2c_unregister_device` C functions.

Implement the core abstractions needed for manual creation/deletion
of I2C devices, including:

 * `i2c::Registration` — a NonNull pointer created by the function
                          `i2c_new_client_device`

 * `i2c::I2cAdapterRef` — a safe reference around `struct i2c_adapter`

 * `i2c::I2cBoardInfo` — a safe wrapper around `struct i2c_board_info`

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 rust/kernel/i2c.rs | 111 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index fafcae92cfdb..bbdc41124fd8 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -139,7 +139,6 @@ extern "C" fn probe_callback(pdev: *mut bindings::i2c_client) -> kernel::ffi::c_
         let info =
             Self::i2c_id_info(pdev).or_else(|| <Self as driver::Adapter>::id_info(pdev.as_ref()));
 
-
         from_result(|| {
             let data = T::probe(pdev, info)?;
 
@@ -312,6 +311,77 @@ fn shutdown(dev: &Device<device::Core>) {
     }
 }
 
+/// The i2c adapter reference
+///
+/// This represents the Rust abstraction for a reference to an existing
+/// C `struct i2c_adapter`.
+///
+/// # Invariants
+///
+/// A [`I2cAdapterRef`] instance represents a valid `struct i2c_adapter` created by the C portion of
+/// the kernel.
+#[repr(transparent)]
+pub struct I2cAdapterRef(NonNull<bindings::i2c_adapter>);
+
+impl I2cAdapterRef {
+    fn as_raw(&self) -> *mut bindings::i2c_adapter {
+        self.0.as_ptr()
+    }
+
+    /// Gets pointer to an `i2c_adapter` by index.
+    pub fn get(index: i32) -> Option<Self> {
+        // SAFETY: `index` must refer to a valid I2C adapter; the kernel
+        // guarantees that `i2c_get_adapter(index)` returns either a valid
+        // pointer or NULL. `NonNull::new` guarantees the correct check.
+        let adapter = NonNull::new(unsafe { bindings::i2c_get_adapter(index) })?;
+        Some(Self(adapter))
+    }
+}
+
+impl Drop for I2cAdapterRef {
+    fn drop(&mut self) {
+        // SAFETY: This `I2cAdapterRef` was obtained from `i2c_get_adapter`,
+        // and calling `i2c_put_adapter` exactly once will correctly release
+        // the reference count in the I2C core. It is safe to call from any context
+        unsafe { bindings::i2c_put_adapter(self.as_raw()) }
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
+    /// Create a new board‐info for a kernel driver.
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
+        &self.0 as *const _
+    }
+}
+
 /// The i2c client representation.
 ///
 /// This structure represents the Rust abstraction for a C `struct i2c_client`. The
@@ -340,7 +410,7 @@ fn as_raw(&self) -> *mut bindings::i2c_client {
 kernel::impl_device_context_into_aref!(Device);
 
 // SAFETY: Instances of `Device` are always reference-counted.
-unsafe impl crate::types::AlwaysRefCounted for Device {
+unsafe impl<Ctx: device::DeviceContext> crate::types::AlwaysRefCounted for Device<Ctx> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
         unsafe { bindings::get_device(self.as_ref().as_raw()) };
@@ -389,3 +459,40 @@ unsafe impl Send for Device {}
 // SAFETY: `Device` can be shared among threads because all methods of `Device`
 // (i.e. `Device<Normal>) are thread safe.
 unsafe impl Sync for Device {}
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
+    pub fn new(i2c_adapter: &I2cAdapterRef, i2c_board_info: &I2cBoardInfo) -> Result<Self> {
+        // SAFETY: the kernel guarantees that `i2c_new_client_device()` returns either a valid
+        // pointer or NULL. `NonNull::new` guarantees the correct check.
+        let raw_dev = from_err_ptr(unsafe {
+            bindings::i2c_new_client_device(i2c_adapter.as_raw(), i2c_board_info.as_raw())
+        })?;
+
+        Ok(Self(NonNull::new(raw_dev).unwrap()))
+    }
+}
+
+impl Drop for Registration {
+    fn drop(&mut self) {
+        unsafe { bindings::i2c_unregister_device(self.0.as_ptr()) }
+    }
+}
+
+// SAFETY: A `Device` is always reference-counted and can be released from any thread.
+unsafe impl Send for Registration {}
+
+// SAFETY: A `Device` is always reference-counted and can be released from any thread.
+unsafe impl Sync for Registration {}
-- 
2.43.0

