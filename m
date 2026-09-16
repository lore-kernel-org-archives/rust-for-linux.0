Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9F147987C
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550820; cv=none; b=DxOLglKKF8sdI3TFJ/3VSxPF2Ygbu2VgypNSn1z0GzSoXISmAl68OeDMTwf/m/yTguzq7FyIGzG1mmWK0KfBcwE7V/lYxbMaI0iQYbNy//faeN53wsbYzqSgNKKj6bQ6GO1Ir1bWgz4xAFXfSfJ4OmK6gx6eHMs+MbhiYl4jqrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550820; c=relaxed/simple;
	bh=yb6+4huqL0zgwzOQmfLYH6xAcyTr8AdHsewuHImzmg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EEYRo4l2VnM1f/MTteYfpL8/lF3GDLIawtBd3Ad+Hpufy1+nvUwUmqFzLnN5mjVUeYWOy0FeihdxBsSuvcs9kmHfX/p3GUf8R5RcQLb6Uvpum3E2ZZcQ3rkjgFBWTOzJ8+r+Vy6n0bunDtWY0w7/Ye2oRWzgVPNtJ+domtXcIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpTMgbC6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpTMgbC6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so3675955e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550791; x=1790155591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7bkQ2UD6cgUEWaO8D2iJnysxMPIRCpoJcts2P9y/bjQ=;
        b=hpTMgbC6huD9PnPPpEIJ5xCx72QfTYp3/CMv16IIqjV4XyDUYaKszcDFAMKxYMRQ7v
         /5WRwdE4wxNN4bK/KyOTlTWnz5jKcS1hva1O7WhwLcUMeajnSmRMIx4Bslq3Lv9GaEnL
         5e+dMlvH/Li0NFCnOxOMT1N9mzITmFjs/7XwxRITKnJs7wHSz2RGX0msHmuPjWpJJeEc
         rRj50OPNFznKaDtUKKF2sHX25QYca2IIDaveRz9ZeHLVnrTrWacTnAgvN29b5j475HpY
         6yjQ8clSlopYIP3M+1YfMWMQcdcnk1j4+ZSvRifmv3rCFTqvNtPa2DyUtwIgq4UmLXGf
         MpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550791; x=1790155591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7bkQ2UD6cgUEWaO8D2iJnysxMPIRCpoJcts2P9y/bjQ=;
        b=t94lLDu8hWSPj7r3pOtVbnIqZUHKfRami+Q7gfQtuJaHnMaVeSVTo5jpiUarZMJKGa
         KKfQE5lIOJKmkS/gRKWOhG90QPITIGgBV/yG4cMsLLMGu9lgOoEVrWeEjNmODvtSvFlK
         lDEt+mVa5rhryjI+6CwESU4ZF3PAwCcmVdjTq9Ry3JzIQQRr3GHU4PFYzSuPbGmGpWvx
         XzddgvX2/rX/fuGudAiDKWcwyjdBlMKwhobJmppDmA+3m/aiUXGFV+MfCS+cuY4LW1Ja
         4E+h2+YST2pfwZdxjclsUsERI2wDrlTnG9LhU30BCjwg5XelY9FcuP/vTCXpfvdKBDFn
         LPIg==
X-Gm-Message-State: AFuF++nmguvhUdPJqncSbRLOBq/zL9gXN41rlmq7HcWQTurVCtF5rkra
	yxNINXrkiIp/q8TkuWOTDxhd5lIVs9+NMqcJ3Ed2BeySZf/Lq/iOPR85/HGH3ra/
X-Gm-Gg: AYBFou2pcz5m66yl6QcXaYb/2TsmqULlXU0Ejyg7OfQnWZlt3chw7a+tEWqN4+B0E1w
	/ryjTcU5zy1YSCtX2CIytW27x26oGMS6fqhbdqiWsYpasVNoXZ8a8k3mDhJvrviL7g3ZOsFOfnU
	SXWEmnGf1x+4HHC4oYoQ7FN7wRgIkavAuNp91aVaiF8ZyzZbGraaFU8jJx3F7uZlk+zeE9aalhl
	Yt/eCiO1IW2p4Q7a/Y5HaJgtJy8fwTT+va7LugDPV5hyhUxMGmJhLmLvxKbfVVnJTbSGRWhNUOC
	KieovWCX8gUl3amlYJPhKbjorEtaMnRCWzkzoQZHLSjn9YU1iS+1o4pLis1K/PaAh2/xYLeLNJx
	sDz8WhaGiM7sejERuF0FH5cSdd18b+tm1UN2Tefh8ssgoHNYaMNxyLvoSH76+ME1X1c3BniMtjI
	LbDit9PU2N/ZJyDI365je2YrkcTeVkeMJFTftExNyM4Yf+ZHKhjSGiGGvC5jfEVxYsnTSraRGrC
	Ilrnfs6+jAYxJABgtP3afr16Kx9R63b2vk/+i+ctzdyOHi+8uDqtnz0UafG6Mhgug==
X-Received: by 2002:a05:600c:1913:b0:49e:816a:9bae with SMTP id 5b1f17b1804b1-49eb733e538mr20447885e9.28.1789550790690;
        Wed, 16 Sep 2026 02:26:30 -0700 (PDT)
Received: from moosama76.. ([156.193.15.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da9a7csm60854635e9.11.2026.09.16.02.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:26:30 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamed Osama <mohamed.osama189110@gmail.com>,
	Gary Guo <gary@garyguo.net>
Subject: [PATCH v1] rust: mem: add DropGuard
Date: Wed, 16 Sep 2026 12:26:26 +0300
Message-ID: <20260916092626.533461-1-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a `DropGuard` type to the Rust kernel memory module for running
cleanup code when a scope is left.

`DropGuard` runs a `FnOnce` callback when dropped and provides
`dismiss()` to take the wrapped value without running the callback.

Replace the current `ScopeGuard` users in `gen_disk`, `serdev`, and
`sync::lock` with `DropGuard`. Keep `ScopeGuard` since it is still used
elsewhere.

Add KUnit tests for cleanup on drop and `dismiss()`.

Tested with:
- `make LLVM=1 -j$(nproc)`
- KUnit: 8 tests passed
- `make LLVM=1 rustfmtcheck`
- `git diff --check`
- `checkpatch.pl`
- `make LLVM=1 rustdoc`

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/Rust-for-Linux/linux/issues/1255
Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/Kconfig.test         |  10 +++
 rust/kernel/block/mq/gen_disk.rs |  11 +--
 rust/kernel/mem.rs               | 120 +++++++++++++++++++++++++++++++
 rust/kernel/serdev.rs            |   8 +--
 rust/kernel/sync/lock.rs         |   5 +-
 5 files changed, 142 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index e6a5c7a795f0..011c72f14e2c 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -33,6 +33,16 @@ config RUST_KVEC_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_DROP_GUARD_KUNIT_TEST
+	bool "KUnit tests for Rust DropGuard API" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust DropGuard API.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
 config RUST_BITMAP_KUNIT_TEST
 	bool "KUnit tests for Rust bitmap API" if !KUNIT_ALL_TESTS
 	default KUNIT_ALL_TESTS
diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index fc97dd873974..d9019fbbb361 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -10,11 +10,12 @@
     block::mq::{Operations, TagSet},
     error::{self, from_err_ptr, Result},
     fmt::{self, Write},
+    mem::DropGuard,
     prelude::*,
     static_lock_class,
     str::NullTerminatedFormatter,
     sync::Arc,
-    types::{ForeignOwnable, ScopeGuard},
+    types::ForeignOwnable,
 };
 
 /// A builder for [`GenDisk`].
@@ -102,7 +103,7 @@ pub fn build<T: Operations>(
         queue_data: T::QueueData,
     ) -> Result<GenDisk<T>> {
         let data = queue_data.into_foreign();
-        let recover_data = ScopeGuard::new(|| {
+        let recover_data = DropGuard::new((), |_| {
             // SAFETY: T::QueueData was created by the call to `into_foreign()` above
             drop(unsafe { T::QueueData::from_foreign(data) });
         });
@@ -150,7 +151,7 @@ pub fn build<T: Operations>(
         // SAFETY: `gendisk` is a valid pointer as we initialized it above
         unsafe { (*gendisk).fops = &TABLE };
 
-        let cleanup_failure = ScopeGuard::new_with_data((gendisk, data), |(gendisk, data)| {
+        let cleanup_failure = DropGuard::new((gendisk, data), |(gendisk, data)| {
             // SAFETY: `gendisk` came from `__blk_mq_alloc_disk()` above and
             // has not been added to the VFS on this cleanup path.
             unsafe { bindings::put_disk(gendisk) };
@@ -161,7 +162,7 @@ pub fn build<T: Operations>(
 
         // The failure guard now owns both pieces of cleanup; the early guard
         // must not run on this path anymore.
-        recover_data.dismiss();
+        DropGuard::dismiss(recover_data);
 
         let mut writer = NullTerminatedFormatter::new(
             // SAFETY: `gendisk` points to a valid and initialized instance. We
@@ -185,7 +186,7 @@ pub fn build<T: Operations>(
             },
         )?;
 
-        cleanup_failure.dismiss();
+        DropGuard::dismiss(cleanup_failure);
 
         // INVARIANT: `gendisk` was initialized above.
         // INVARIANT: `gendisk` was added to the VFS via `device_add_disk` above.
diff --git a/rust/kernel/mem.rs b/rust/kernel/mem.rs
index f2d4cdf87d00..f2d1f9bc9337 100644
--- a/rust/kernel/mem.rs
+++ b/rust/kernel/mem.rs
@@ -4,6 +4,92 @@
 
 use crate::prelude::*;
 
+use core::{
+    mem::ManuallyDrop,
+    ops::{Deref, DerefMut},
+};
+
+/// Wraps a value and runs a closure when dropped.
+///
+/// This is useful for running cleanup code when leaving a scope.
+///
+/// The [`DropGuard::dismiss`] function can be used to take ownership of the wrapped
+/// value without running the cleanup function.
+#[doc(alias = "ScopeGuard")]
+#[doc(alias = "defer")]
+pub struct DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    inner: ManuallyDrop<T>,
+    f: ManuallyDrop<F>,
+}
+
+impl<T, F> DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    /// Creates a new `DropGuard`.
+    #[inline]
+    #[must_use]
+    pub fn new(inner: T, f: F) -> Self {
+        Self {
+            inner: ManuallyDrop::new(inner),
+            f: ManuallyDrop::new(f),
+        }
+    }
+
+    /// Consumes the `DropGuard`, returning the wrapped value without
+    /// running the cleanup function.
+    #[inline]
+    pub fn dismiss(guard: Self) -> T {
+        let mut guard = ManuallyDrop::new(guard);
+
+        // SAFETY: We have taken ownership of the guard and prevent its destructor from running.
+        let value = unsafe { ManuallyDrop::take(&mut guard.inner) };
+
+        // SAFETY: We have taken ownership of the guard.
+        unsafe { ManuallyDrop::drop(&mut guard.f) };
+
+        value
+    }
+}
+
+impl<T, F> Deref for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    type Target = T;
+
+    fn deref(&self) -> &T {
+        &self.inner
+    }
+}
+
+impl<T, F> DerefMut for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    fn deref_mut(&mut self) -> &mut T {
+        &mut self.inner
+    }
+}
+
+impl<T, F> Drop for DropGuard<T, F>
+where
+    F: FnOnce(T),
+{
+    fn drop(&mut self) {
+        // SAFETY: `DropGuard` is in the process of being dropped.
+        let inner = unsafe { ManuallyDrop::take(&mut self.inner) };
+
+        // SAFETY: `DropGuard` is in the process of being dropped.
+        let f = unsafe { ManuallyDrop::take(&mut self.f) };
+
+        f(inner);
+    }
+}
+
 /// Transmute between two types.
 ///
 /// Use this instead of [`core::mem::transmute`] when it is known that sizes are identical but this
@@ -232,3 +318,37 @@ unsafe impl AsReprMut for $signed {}
     // `usize` is not normalized to particular integer for portability.
     usize isize,
 }
+
+#[cfg(CONFIG_RUST_DROP_GUARD_KUNIT_TEST)]
+#[macros::kunit_tests(rust_drop_guard)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn test_drop_runs_cleanup() {
+        let mut cleaned = false;
+
+        {
+            let _guard = DropGuard::new(42, |value| {
+                assert_eq!(value, 42);
+                cleaned = true;
+            });
+        }
+
+        assert!(cleaned);
+    }
+
+    #[test]
+    fn test_dismiss_returns_value_without_cleanup() {
+        let mut cleaned = false;
+
+        let guard = DropGuard::new(42, |_| {
+            cleaned = true;
+        });
+
+        let value = DropGuard::dismiss(guard);
+
+        assert_eq!(value, 42);
+        assert!(!cleaned);
+    }
+}
diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index 17ca504b7f8d..a400d241c2ad 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -13,6 +13,7 @@
         to_result,
         VTABLE_DEFAULT_ERROR, //
     },
+    mem::DropGuard,
     new_mutex,
     of,
     prelude::*,
@@ -21,10 +22,7 @@
         Mutex, //
     },
     time::Jiffies,
-    types::{
-        Opaque,
-        ScopeGuard, //
-    }, //
+    types::Opaque, //
 };
 
 use core::{
@@ -174,7 +172,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             }))?;
             // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
             let private_data = unsafe { sdev.as_ref().drvdata_borrow::<PrivateData<'_, T>>() };
-            let private_data = ScopeGuard::new_with_data(private_data, |_| {
+            let private_data = DropGuard::new(private_data, |_| {
                 // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
                 drop(unsafe { sdev.as_ref().drvdata_obtain::<PrivateData<'_, T>>() });
             });
diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..15f9cbe76c8d 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -7,8 +7,9 @@
 
 use super::LockClassKey;
 use crate::{
+    mem::DropGuard,
     str::{CStr, CStrExt as _},
-    types::{NotThreadSafe, Opaque, ScopeGuard},
+    types::{NotThreadSafe, Opaque},
 };
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
 use pin_init::{pin_data, pin_init, PinInit, Wrapper};
@@ -242,7 +243,7 @@ pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
         // SAFETY: The caller owns the lock, so it is safe to unlock it.
         unsafe { B::unlock(self.lock.state.get(), &self.state) };
 
-        let _relock = ScopeGuard::new(||
+        let _relock = DropGuard::new((), |_|
                 // SAFETY: The lock was just unlocked above and is being relocked now.
                 unsafe { B::relock(self.lock.state.get(), &mut self.state) });
 
-- 
2.43.0

