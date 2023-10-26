Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975B7440B
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 02:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQahjpmD"
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49596132
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Oct 2023 19:09:21 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6bcbfecf314so89253b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Oct 2023 19:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698286160; x=1698890960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:from:subject:to:message-id
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9IjQGRgY8WZwf2p5hkguCiEe1I+h399KG6yhIBOUak=;
        b=dQahjpmDp4qIlbW3fQdEXKe7HCuFJEuFckjOa/1HsfYegojsmpy7fX4B1X9MC0bgLT
         8DrVgn8O74InKevn0OskSNLBRW8Be8xr8TJsTBcUOTtPDiVZ/+JtH1/tNpptYLKp7UoO
         5QlsGFysQPqFskuO7GfkZhXswyGPYRmVByxR6Wc44tJ+MsGwmEk3PF7Frbb64Fuem4Rw
         rmmbtvKzk7DRu4jPdUS1njTfkkjswUBWi5z9yDRooGokv3CbmZ0qZlW15YgHx9VDcQ1v
         Om3s3wXwJsWqD8BuSv27xcakD2B3c+lKiVXdA6cjrs0HQehlInfdvG/Az29de8Dpnd5Z
         9Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698286160; x=1698890960;
        h=content-transfer-encoding:mime-version:from:subject:to:message-id
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9IjQGRgY8WZwf2p5hkguCiEe1I+h399KG6yhIBOUak=;
        b=jbICmfOpEUfLi3l4kiiUvYfGWUTDPgUNwyUzmFfRt6mWtgjVeBpknxKsWZHHgkPJpR
         X8uapUqbH80I48Y0CTYLQ4UXdbxLxFgRyI5WyTqUVi3lorlIz9utXyo4DfWcfb0dabOJ
         NYHZnLPSn+7POLEafcYMwPj8PmU9F27dF+uNkm9WnWy96bsC5ZRpeyG3HMNhyM2TEoaN
         D+PRsqvt6kHXzZDeUlL7dFg22JUzOWKDjyWLaNhDyLSCPN58/cmVZcxwhpq4CTnN5EuG
         WNv5oltaSqA9cD9FUV3781NwZ/P1n7Kw/TdjxxmU/TbptZaDRSd2NRx+j+nl7M7hRkD8
         HZ3Q==
X-Gm-Message-State: AOJu0Yw+GpS6cPnEfFOx+pmM3D4GaZ/x+k1sfmbVIbaX6EMro9LiL2VA
	xh9w6bVl21eFZIAKlax7/ZrLig1sbMFZnkMw
X-Google-Smtp-Source: AGHT+IFitIy2xbC1evqhuz4t/4X3ApkaISL7AKley9JTUkhE8YsZh5BM35X3WdxbCYXmXUzWa03O8A==
X-Received: by 2002:a05:6a21:8cc5:b0:17b:170c:2d11 with SMTP id ta5-20020a056a218cc500b0017b170c2d11mr15933274pzb.6.1698286160112;
        Wed, 25 Oct 2023 19:09:20 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id jj5-20020a170903048500b001ca21c8abf7sm9857311plb.188.2023.10.25.19.09.19
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 19:09:19 -0700 (PDT)
Date: Thu, 26 Oct 2023 11:09:19 +0900 (JST)
Message-Id: <20231026.110919.517001374342898485.fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: fix relative links to kernel header files
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Relative links to kernel header files are broken due to the move of
the output path? Looks like some of links has been broken before that.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/error.rs              | 2 +-
 rust/kernel/ioctl.rs              | 2 +-
 rust/kernel/kunit.rs              | 2 +-
 rust/kernel/print.rs              | 8 ++++----
 rust/kernel/sync/condvar.rs       | 2 +-
 rust/kernel/sync/lock/mutex.rs    | 2 +-
 rust/kernel/sync/lock/spinlock.rs | 2 +-
 rust/kernel/task.rs               | 2 +-
 rust/macros/lib.rs                | 2 +-
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 032b64543953..5c9cd2e3b03f 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -2,7 +2,7 @@
 
 //! Kernel errors.
 //!
-//! C header: [`include/uapi/asm-generic/errno-base.h`](../../../include/uapi/asm-generic/errno-base.h)
+//! C header: [`include/uapi/asm-generic/errno-base.h`](../../../../../../include/uapi/asm-generic/errno-base.h)
 
 use crate::str::CStr;
 
diff --git a/rust/kernel/ioctl.rs b/rust/kernel/ioctl.rs
index c49e1a8d3fd0..5aff1d7f107d 100644
--- a/rust/kernel/ioctl.rs
+++ b/rust/kernel/ioctl.rs
@@ -2,7 +2,7 @@
 
 //! ioctl() number definitions
 //!
-//! C header: [`include/asm-generic/ioctl.h`](../../../../include/asm-generic/ioctl.h)
+//! C header: [`include/asm-generic/ioctl.h`](../../../../../../include/asm-generic/ioctl.h)
 
 #![allow(non_snake_case)]
 
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 722655b2d62d..f91dea97b47c 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -2,7 +2,7 @@
 
 //! KUnit-based macros for Rust unit tests.
 //!
-//! C header: [`include/kunit/test.h`](../../../../../include/kunit/test.h)
+//! C header: [`include/kunit/test.h`](../../../../../../include/kunit/test.h)
 //!
 //! Reference: <https://docs.kernel.org/dev-tools/kunit/index.html>
 
diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 8009184bf6d7..d3fa37ea3656 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -2,7 +2,7 @@
 
 //! Printing facilities.
 //!
-//! C header: [`include/linux/printk.h`](../../../../include/linux/printk.h)
+//! C header: [`include/linux/printk.h`](../../../../../../include/linux/printk.h)
 //!
 //! Reference: <https://www.kernel.org/doc/html/latest/core-api/printk-basics.html>
 
@@ -48,7 +48,7 @@ pub mod format_strings {
     /// The format string is always the same for a given level, i.e. for a
     /// given `prefix`, which are the kernel's `KERN_*` constants.
     ///
-    /// [`_printk`]: ../../../../include/linux/printk.h
+    /// [`_printk`]: ../../../../../../include/linux/printk.h
     const fn generate(is_cont: bool, prefix: &[u8; 3]) -> [u8; LENGTH] {
         // Ensure the `KERN_*` macros are what we expect.
         assert!(prefix[0] == b'\x01');
@@ -97,7 +97,7 @@ pub mod format_strings {
 /// The format string must be one of the ones in [`format_strings`], and
 /// the module name must be null-terminated.
 ///
-/// [`_printk`]: ../../../../include/linux/_printk.h
+/// [`_printk`]: ../../../../../../include/linux/_printk.h
 #[doc(hidden)]
 #[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
 pub unsafe fn call_printk(
@@ -120,7 +120,7 @@ pub unsafe fn call_printk(
 ///
 /// Public but hidden since it should only be used from public macros.
 ///
-/// [`_printk`]: ../../../../include/linux/printk.h
+/// [`_printk`]: ../../../../../../include/linux/printk.h
 #[doc(hidden)]
 #[cfg_attr(not(CONFIG_PRINTK), allow(unused_variables))]
 pub fn call_printk_cont(args: fmt::Arguments<'_>) {
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index ed353399c4e5..7ce8304c5c02 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -69,7 +69,7 @@ macro_rules! new_condvar {
 /// }
 /// ```
 ///
-/// [`struct wait_queue_head`]: ../../../include/linux/wait.h
+/// [`struct wait_queue_head`]: ../../../../../../include/linux/wait.h
 #[pin_data]
 pub struct CondVar {
     #[pin]
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index 09276fedc091..88b7f9fab2a4 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -84,7 +84,7 @@ macro_rules! new_mutex {
 /// }
 /// ```
 ///
-/// [`struct mutex`]: ../../../../include/linux/mutex.h
+/// [`struct mutex`]: ../../../../../../../../include/linux/mutex.h
 pub type Mutex<T> = super::Lock<T, MutexBackend>;
 
 /// A kernel `struct mutex` lock backend.
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 91eb2c9e9123..52fc57995576 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -82,7 +82,7 @@ macro_rules! new_spinlock {
 /// }
 /// ```
 ///
-/// [`spinlock_t`]: ../../../../include/linux/spinlock.h
+/// [`spinlock_t`]: ../../../../../../../../include/linux/spinlock.h
 pub type SpinLock<T> = super::Lock<T, SpinLockBackend>;
 
 /// A kernel `spinlock_t` lock backend.
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 7eda15e5f1b3..a10709e185d1 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -2,7 +2,7 @@
 
 //! Tasks (threads and processes).
 //!
-//! C header: [`include/linux/sched.h`](../../../../include/linux/sched.h).
+//! C header: [`include/linux/sched.h`](../../../../../../include/linux/sched.h).
 
 use crate::{bindings, types::Opaque};
 use core::{marker::PhantomData, ops::Deref, ptr};
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index c42105c2ff96..97637223c82f 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -20,7 +20,7 @@
 /// The `type` argument should be a type which implements the [`Module`]
 /// trait. Also accepts various forms of kernel metadata.
 ///
-/// C header: [`include/linux/moduleparam.h`](../../../include/linux/moduleparam.h)
+/// C header: [`include/linux/moduleparam.h`](../../../../../include/linux/moduleparam.h)
 ///
 /// [`Module`]: ../kernel/trait.Module.html
 ///
-- 
2.34.1

