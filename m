Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1C29A326
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767087494; cv=none; b=assSOhPQFYFZCcyffBezkP0sTbY6h1oCoHk/ReQjzUKUmmlDGOrN1TDzGKYNItiR9idfBwy4S5egnxfcTK4thOc7Uwfw81mTRJPjDjS1Q9EdyuAjhjCm6bedx8rH5wwzCdvintO/SfzQdKoeKZzYZ5SRvSnTSojjZ7oA8Dw5UBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767087494; c=relaxed/simple;
	bh=QSdfyVlEPfmTFD+Bfe+JvYoFi7DG3u+05JzG5g1kbkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQ+IzDp0XlbO8BnrBFhWDMKIJX2t25dqoBNk9jsF4drxJSIO5Lt8ncJIPLPq1ggxwJGe8cFGBj3YGeS+jhJLv2j9ep4r/PMAPyqel4nLZu5v0eGONVrtGaQcAr84RHw/+pVHSj1wB7U/hshY4Bbn5SaZJzlU5TenAh6kHW0HkLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKltd7ci; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKltd7ci"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c27d14559so7677241a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 01:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767087492; x=1767692292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQGW2jPczZZnYpESWHYrMkoJFFKz26KyVMBhXgGQqlY=;
        b=RKltd7ciFRrYq2L4ueiRZPBJQV5pjMWARNpqxrBiq0wRmFGKYyEdwz2iVmNTIHB3xe
         IwtsrFsF6E87ZjOeh55wAt2OguGs5IuPDobxjWBrUfy24rxHLsi2N610kQf5LKGtH2rM
         l7dAQtUc2pBBdwPe7ROPi7wdPmSDpnEKOlv6DMnsPD4jOD6K9VL2Boe5ZuIRr6aneOCY
         PB4drshNAhWi6XI8sq3JyG92mKRM8V/KjEL5SiuHna+7swAsH/o0HP3y6xRNYY9oU12j
         xPbUrmluX46wufDoKynyM3lpC5gE85L2YeXadKrjy1b2IYtzkXl1dAP3TD9idKLwblEi
         ysFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767087492; x=1767692292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQGW2jPczZZnYpESWHYrMkoJFFKz26KyVMBhXgGQqlY=;
        b=HEjqPQ78XWbfyTozLYpPESU58DsK/qPJlL2Q63Y9JwiiP8i6YWaBXr2/RkrOvC+WEi
         9+lBsNkPbFEe9weLAfkjMOjlPRHLLvtZ1oCBo1pOApLMctl57VHPLW3nO+V7/iiMKtRm
         eqZvegymjtIANwZrnOTk+ZDSmA1dnFdj2tI1HffnxwnUKI0iq+rHD6H9MS1sKrBnK+XN
         V7uyiRRXtuMumm9TA9SZ8iyVJcPQxWouXxMzOy7uMP5wpLMjh2TolA82UyEeBijI46wj
         ZVrqSXyze2zuCX67khV59/wA5Ee7yRz+q2CN3MZwr1OIuE6xML38Sz3UaeUidkUZDijl
         VDUw==
X-Forwarded-Encrypted: i=1; AJvYcCUTI6zicZDyf9dHpr6szHF+6+pb6+iti2Y5SWgqczkDfX7yhUwEHEVx3GOliVumWVRmaDvwXjz0isGayFCiFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTaYIm5As5RmwJ/l8J1SX63iuMiuEiUcrVcoPhYDwkGrWmjMWN
	uBUtxv2Fe8MAqhePyQm6GA4iyZHkrp312QqIcFTJE4V4J6NjVuqAfKzQ
X-Gm-Gg: AY/fxX4Bi0ntvcfjkjyyqUxXHEtKY2QY4qh3iZoD/77rl/puyUK5gdPKF7j20reSsYJ
	ZeApi6NCuhkLDPc5gGFfdsEcF8JOCwLcTp3GFtaKnHMk+SO0RgM2DGeeGazffaYnL1O3LOjvMKS
	0p0JBeJApRUQeM0/MGFg9117OiMo3gVlUJwMSF9Gx/7+FKyvkuf7+FTfMFq0VAvy2QR5B05R6Wi
	HO3zLHlR8cCvk6xgtcgL+y/rebtLfNzXMJXPG3NInQZ9d086LtAJV6d5IlotGEQBd28O3FQyDri
	83hrNza85OrHJjS3lc9jscMkZU3egt68CgUpQEDmdPUgRGyPkKRyiAEBNGui5po8sSdtxR2snoM
	NuNHEaba1ZbGakX5IBIPJyCZEuVdSRpGTYqcrSQJuRV/0XUkvxHVKZyYjRd5l3lkB5aVl1xAc5/
	77FBQzDuNzyLbyg/Y/9+79TCZyAkhfVKUwIzQotJAQay7u29yMQducpUPA0ct+9w==
X-Google-Smtp-Source: AGHT+IHmb3WYEleSOTp3agTUQLANPioMMED8tz3pPwJzcKls/o8WgGZDZz+Zu+uMNqPE1EVUQv10Mw==
X-Received: by 2002:a17:90a:e7c9:b0:32e:7340:a7f7 with SMTP id 98e67ed59e1d1-34e921131admr23204415a91.2.1767087491861;
        Tue, 30 Dec 2025 01:38:11 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm13378158a91.9.2025.12.30.01.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 01:38:11 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: aliceryhl@google.com,
	arve@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com,
	boqun.feng@gmail.com
Cc: a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 3/3] rust_binder: Switch to kernel::sync atomic primitives
Date: Tue, 30 Dec 2025 18:37:18 +0900
Message-ID: <20251230093718.1852322-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Convert uses of AtomicBool, AtomicUsize, and AtomicU32.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/android/binder/rust_binder_main.rs | 20 ++++++++----------
 drivers/android/binder/stats.rs            |  8 ++++----
 drivers/android/binder/thread.rs           | 24 ++++++++++------------
 drivers/android/binder/transaction.rs      | 16 +++++++--------
 4 files changed, 32 insertions(+), 36 deletions(-)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index c79a9e742240..47bfb114cabb 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -18,6 +18,7 @@
     prelude::*,
     seq_file::SeqFile,
     seq_print,
+    sync::atomic::{ordering::Relaxed, Atomic},
     sync::poll::PollTable,
     sync::Arc,
     task::Pid,
@@ -28,10 +29,7 @@
 
 use crate::{context::Context, page_range::Shrinker, process::Process, thread::Thread};
 
-use core::{
-    ptr::NonNull,
-    sync::atomic::{AtomicBool, AtomicUsize, Ordering},
-};
+use core::ptr::NonNull;
 
 mod allocation;
 mod context;
@@ -90,9 +88,9 @@ fn default() -> Self {
 }
 
 fn next_debug_id() -> usize {
-    static NEXT_DEBUG_ID: AtomicUsize = AtomicUsize::new(0);
+    static NEXT_DEBUG_ID: Atomic<usize> = Atomic::new(0);
 
-    NEXT_DEBUG_ID.fetch_add(1, Ordering::Relaxed)
+    NEXT_DEBUG_ID.fetch_add(1, Relaxed)
 }
 
 /// Provides a single place to write Binder return values via the
@@ -215,7 +213,7 @@ fn arc_pin_init(init: impl PinInit<T>) -> Result<DLArc<T>, kernel::error::Error>
 
 struct DeliverCode {
     code: u32,
-    skip: AtomicBool,
+    skip: Atomic<bool>,
 }
 
 kernel::list::impl_list_arc_safe! {
@@ -226,7 +224,7 @@ impl DeliverCode {
     fn new(code: u32) -> Self {
         Self {
             code,
-            skip: AtomicBool::new(false),
+            skip: Atomic::new(false),
         }
     }
 
@@ -235,7 +233,7 @@ fn new(code: u32) -> Self {
     /// This is used instead of removing it from the work list, since `LinkedList::remove` is
     /// unsafe, whereas this method is not.
     fn skip(&self) {
-        self.skip.store(true, Ordering::Relaxed);
+        self.skip.store(true, Relaxed);
     }
 }
 
@@ -245,7 +243,7 @@ fn do_work(
         _thread: &Thread,
         writer: &mut BinderReturnWriter<'_>,
     ) -> Result<bool> {
-        if !self.skip.load(Ordering::Relaxed) {
+        if !self.skip.load(Relaxed) {
             writer.write_code(self.code)?;
         }
         Ok(true)
@@ -259,7 +257,7 @@ fn should_sync_wakeup(&self) -> bool {
 
     fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result<()> {
         seq_print!(m, "{}", prefix);
-        if self.skip.load(Ordering::Relaxed) {
+        if self.skip.load(Relaxed) {
             seq_print!(m, "(skipped) ");
         }
         if self.code == defs::BR_TRANSACTION_COMPLETE {
diff --git a/drivers/android/binder/stats.rs b/drivers/android/binder/stats.rs
index 037002651941..ab75e9561cbf 100644
--- a/drivers/android/binder/stats.rs
+++ b/drivers/android/binder/stats.rs
@@ -5,7 +5,7 @@
 //! Keep track of statistics for binder_logs.
 
 use crate::defs::*;
-use core::sync::atomic::{AtomicU32, Ordering::Relaxed};
+use kernel::sync::atomic::{ordering::Relaxed, Atomic};
 use kernel::{ioctl::_IOC_NR, seq_file::SeqFile, seq_print};
 
 const BC_COUNT: usize = _IOC_NR(BC_REPLY_SG) as usize + 1;
@@ -14,14 +14,14 @@
 pub(crate) static GLOBAL_STATS: BinderStats = BinderStats::new();
 
 pub(crate) struct BinderStats {
-    bc: [AtomicU32; BC_COUNT],
-    br: [AtomicU32; BR_COUNT],
+    bc: [Atomic<u32>; BC_COUNT],
+    br: [Atomic<u32>; BR_COUNT],
 }
 
 impl BinderStats {
     pub(crate) const fn new() -> Self {
         #[expect(clippy::declare_interior_mutable_const)]
-        const ZERO: AtomicU32 = AtomicU32::new(0);
+        const ZERO: Atomic<u32> = Atomic::new(0);
 
         Self {
             bc: [ZERO; BC_COUNT],
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 1a8e6fdc0dc4..82264db06507 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -15,6 +15,7 @@
     security,
     seq_file::SeqFile,
     seq_print,
+    sync::atomic::{ordering::Relaxed, Atomic},
     sync::poll::{PollCondVar, PollTable},
     sync::{Arc, SpinLock},
     task::Task,
@@ -34,10 +35,7 @@
     BinderReturnWriter, DArc, DLArc, DTRWrap, DeliverCode, DeliverToRead,
 };
 
-use core::{
-    mem::size_of,
-    sync::atomic::{AtomicU32, Ordering},
-};
+use core::mem::size_of;
 
 /// Stores the layout of the scatter-gather entries. This is used during the `translate_objects`
 /// call and is discarded when it returns.
@@ -273,8 +271,8 @@ struct InnerThread {
 impl InnerThread {
     fn new() -> Result<Self> {
         fn next_err_id() -> u32 {
-            static EE_ID: AtomicU32 = AtomicU32::new(0);
-            EE_ID.fetch_add(1, Ordering::Relaxed)
+            static EE_ID: Atomic<u32> = Atomic::new(0);
+            EE_ID.fetch_add(1, Relaxed)
         }
 
         Ok(Self {
@@ -1537,7 +1535,7 @@ pub(crate) fn release(self: &Arc<Self>) {
 
 #[pin_data]
 struct ThreadError {
-    error_code: AtomicU32,
+    error_code: Atomic<u32>,
     #[pin]
     links_track: AtomicTracker,
 }
@@ -1545,18 +1543,18 @@ struct ThreadError {
 impl ThreadError {
     fn try_new() -> Result<DArc<Self>> {
         DTRWrap::arc_pin_init(pin_init!(Self {
-            error_code: AtomicU32::new(BR_OK),
+            error_code: Atomic::new(BR_OK),
             links_track <- AtomicTracker::new(),
         }))
         .map(ListArc::into_arc)
     }
 
     fn set_error_code(&self, code: u32) {
-        self.error_code.store(code, Ordering::Relaxed);
+        self.error_code.store(code, Relaxed);
     }
 
     fn is_unused(&self) -> bool {
-        self.error_code.load(Ordering::Relaxed) == BR_OK
+        self.error_code.load(Relaxed) == BR_OK
     }
 }
 
@@ -1566,8 +1564,8 @@ fn do_work(
         _thread: &Thread,
         writer: &mut BinderReturnWriter<'_>,
     ) -> Result<bool> {
-        let code = self.error_code.load(Ordering::Relaxed);
-        self.error_code.store(BR_OK, Ordering::Relaxed);
+        let code = self.error_code.load(Relaxed);
+        self.error_code.store(BR_OK, Relaxed);
         writer.write_code(code)?;
         Ok(true)
     }
@@ -1583,7 +1581,7 @@ fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result<()> {
             m,
             "{}transaction error: {}\n",
             prefix,
-            self.error_code.load(Ordering::Relaxed)
+            self.error_code.load(Relaxed)
         );
         Ok(())
     }
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 4bd3c0e417eb..2273a8e9d01c 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -2,11 +2,11 @@
 
 // Copyright (C) 2025 Google LLC.
 
-use core::sync::atomic::{AtomicBool, Ordering};
 use kernel::{
     prelude::*,
     seq_file::SeqFile,
     seq_print,
+    sync::atomic::{ordering::Relaxed, Atomic},
     sync::{Arc, SpinLock},
     task::Kuid,
     time::{Instant, Monotonic},
@@ -33,7 +33,7 @@ pub(crate) struct Transaction {
     pub(crate) to: Arc<Process>,
     #[pin]
     allocation: SpinLock<Option<Allocation>>,
-    is_outstanding: AtomicBool,
+    is_outstanding: Atomic<bool>,
     code: u32,
     pub(crate) flags: u32,
     data_size: usize,
@@ -105,7 +105,7 @@ pub(crate) fn new(
             offsets_size: trd.offsets_size as _,
             data_address,
             allocation <- kernel::new_spinlock!(Some(alloc.success()), "Transaction::new"),
-            is_outstanding: AtomicBool::new(false),
+            is_outstanding: Atomic::new(false),
             txn_security_ctx_off,
             oneway_spam_detected,
             start_time: Instant::now(),
@@ -145,7 +145,7 @@ pub(crate) fn new_reply(
             offsets_size: trd.offsets_size as _,
             data_address: alloc.ptr,
             allocation <- kernel::new_spinlock!(Some(alloc.success()), "Transaction::new"),
-            is_outstanding: AtomicBool::new(false),
+            is_outstanding: Atomic::new(false),
             txn_security_ctx_off: None,
             oneway_spam_detected,
             start_time: Instant::now(),
@@ -215,8 +215,8 @@ pub(crate) fn find_from(&self, thread: &Thread) -> Option<&DArc<Transaction>> {
 
     pub(crate) fn set_outstanding(&self, to_process: &mut ProcessInner) {
         // No race because this method is only called once.
-        if !self.is_outstanding.load(Ordering::Relaxed) {
-            self.is_outstanding.store(true, Ordering::Relaxed);
+        if !self.is_outstanding.load(Relaxed) {
+            self.is_outstanding.store(true, Relaxed);
             to_process.add_outstanding_txn();
         }
     }
@@ -227,8 +227,8 @@ fn drop_outstanding_txn(&self) {
         // destructor, which is guaranteed to not race with any other operations on the
         // transaction. It also cannot race with `set_outstanding`, since submission happens
         // before delivery.
-        if self.is_outstanding.load(Ordering::Relaxed) {
-            self.is_outstanding.store(false, Ordering::Relaxed);
+        if self.is_outstanding.load(Relaxed) {
+            self.is_outstanding.store(false, Relaxed);
             self.to.drop_outstanding_txn();
         }
     }
-- 
2.43.0

