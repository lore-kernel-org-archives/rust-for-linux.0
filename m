Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C2286B2
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4rJx2hY"
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5D31AA
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 04:41:00 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6bcdfcde944so181112b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Oct 2023 04:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698320459; x=1698925259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ryj3V1A/dEGckovKqzQD04UV/O1IKnSiR0rF5gapNDg=;
        b=c4rJx2hYixOak3uA2QQdyi4idy8b70FV3tzcB6XtoM364EamsO22rvU5Hxnt6Kdt3m
         in/mKs8YsbwTpB0MJfO8BryJjaxZcYPzisWZJcwUkqgwMaIMl1+MUNgtRa7X1jbe6eOf
         D+/8xy03sUEjH4Zyn8QyO/GntIkg94skGvq511VvSml1Akx1duvE8OtlW/D9J1cMhSh1
         byguhuNlS0c21op0zhE4c7TmImE170WGVDn/o5TzxXE+K4LwQqRhtSOK9LVuY5/IELFn
         Rg/1XANXX96FsAJs99HMDVSDLV3/VLCWswLzVL6avIHqwjuAeek9BkXjrbAl24iOJukv
         APcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698320459; x=1698925259;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ryj3V1A/dEGckovKqzQD04UV/O1IKnSiR0rF5gapNDg=;
        b=ImNX2nCKlsSlcDp9Jkmrn+MmoqZE+MhyHVovh/EDU/FymMMC19QBm9GOa8bEm5ww5O
         VAg/MnWatbM/agZvzSlIxA8+dUH9ze7yCKkdv/Ab6o2lVN+oeC6UWQZFwQ8FcwXy5SEk
         sEySw8WKAFfwdUjA4zfISLnF2WHA3HoswzabJHqmV4tLxc4lwNSb2ulQjloRiLqElNSV
         tUz5aI8/45t+f3+5gsvWBnG97+w+RADZnt7AKZQ5A3XSf/yTMJJ5kRC4gCF7X5QCm2av
         O20ESSP1N7S3v3lgCqkONOYDD4sHjUtVkUGbDqxaSkan3wDJoG6ujKfRC5r2zq8JIwEO
         6z1g==
X-Gm-Message-State: AOJu0YxTjipZ1vaUpS2vBq0HzgnZLEBFg/fSV7X4fEfnIUdWZf73l+5a
	E6my1cqCU8jLSu1gosZ25ueebbbWhDZRkrfw
X-Google-Smtp-Source: AGHT+IFEKfOlwPfNgB9ImgwAPzAXiC9HxsMcjrwn6FHEq1SPKKZnkEvhoxU9zDTBOIn4madjQjGgRg==
X-Received: by 2002:a05:6a21:9998:b0:15c:b7bb:2bd9 with SMTP id ve24-20020a056a21999800b0015cb7bb2bd9mr19792971pzb.6.1698320459343;
        Thu, 26 Oct 2023 04:40:59 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id x11-20020aa78f0b000000b00690fe1c928csm11390130pfr.147.2023.10.26.04.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 04:40:59 -0700 (PDT)
Date: Thu, 26 Oct 2023 20:40:58 +0900 (JST)
Message-Id: <20231026.204058.2167744626131849993.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Subject: [PATCH v2] rust: fix relative links to kernel header files
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72=dAYc=EQnJOuBvV5cKLo85O=A1AP03F9B6nJdDwdAT1w@mail.gmail.com>
References: <20231026.110919.517001374342898485.fujita.tomonori@gmail.com>
	<CANiq72=dAYc=EQnJOuBvV5cKLo85O=A1AP03F9B6nJdDwdAT1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Relative links to kernel header files are broken due to the move of
the output path. Some of the links have been broken before that.

Fixes: 48fadf440075 ("docs: Move rustdoc output, cross-reference it")
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

