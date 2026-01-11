Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5884033FE17
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133000; cv=none; b=QdnoUvsLYZEVaE1cCRhj7tfi2Ukfb2duH2sUy28LH3Xu064EbBeisHTOfIl3d2DVmGk+flV/qo8WS9Cv+ToNw1jnfnq7FaCgBXpOJbAlGoYchtFTfjNiqNjFpPdjLlhTehOi4mYtkoD73ZzLuDnNq5IhyfQ9BEk85UoIJDlqIOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133000; c=relaxed/simple;
	bh=ckaVxbnmvXzyHcXkCNQpLuivnDHrCJVKzDXH3GPdWJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTpYNtQHE20P7vhSWjX8fVTyeSWBXrlbqHHOjOEhwJvbM4AC8nIsosDDWw7qaZHFfCWJBv0yz5dREqxAZ/6atiGB9ARFpxA0sSiT+0LhnM7GlclMa+b4k1riO4ao/fz6IJssvU5OAvSGxW2PooWFwtrria5CDkGvOfmExBJZaIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U6glLShO; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U6glLShO"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a2f2e5445so68399376d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132994; x=1768737794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6OvpiJdw5TyvWRjrvwiLpBSMWakY47LEYvS3gBWiPZ8=;
        b=U6glLShOjwIafxjOOUdUugxDulEUBeVWZRTEMPQP141p6aojpQomXiB+70Ne1XF0MJ
         XlgPVTbgZR2z5fh+dtzUslI8WpT2RclDfUnngrgD5Knvpwk2gn/HNgaZr4FhtwDXK+g6
         CCauM2fdcuguQ9oM3WUInyeRs4vPOEUeq5ORbO820fWI9GB7oT1Rq4dZb8gk+dIUfVpS
         v8TuRRwio8t+qoteGxgNDYlqzCuCHDGEEKat9HETBD/VrMDOTWQfyHXrN8LKt0kyWGMI
         jTMRyU7ppRn2gsXLl713wbNet/77K1z0D6gl+6J/H3aQ44cEV6fWx2VPlV9y9U+Nx4y+
         lTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132994; x=1768737794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OvpiJdw5TyvWRjrvwiLpBSMWakY47LEYvS3gBWiPZ8=;
        b=VIxtFG1wNzxU3xwj0lvJ8rfuR+t7r/ct1ZuHXNN2mME/3EZj9ML+3n0WWOrtReK52O
         +dZXFvn/yHiblX4L81VnO4Y30vbYCnw9Ho1dtmz8An7EEeMKpsVI63rMDXs6L3q/2pJc
         9FqKMvBvhfitY5gYXip+erkCVeI4PXWIycIFH2o1+tql6AkePSnMqbRoojR7tW7Stfmx
         LlrqToguRWU/9Cpnlw4WrVymeyQQonoNqIp+/dQXju6QXkgwMPSg7SilfZtTZEAWJTU3
         2j4MYB59ki55hOBJGfyPUlZCvJOnchjvpkTMOTTu/utbqDdubIiyFjlwNmRih1pHPLo/
         JU4Q==
X-Gm-Message-State: AOJu0YxGGCDcZb48c6kjabhdjENwPOAW5Go0H4mfZCgovA1lnK6UEF0c
	EQismEeFZFj09I34DlgLb3AmmMCxZhF+N5MotGrDSoRYOXuv/QQKeQqm
X-Gm-Gg: AY/fxX6AwLSjQnGTJrwhRYQYA7zryUR3g476/9KYqfLBvOJPbPPxXdAiBOkyHB/OW+3
	i+OoimSNh1E/LDW/TOHA+i6/0zW6qzqIVhJUm3BwZxvN9Ery6b6C6MoN48O8IhFAo8nwqiq6hOf
	XXuew1gKxYyLpaY3f1xEVju1Vwx+EOAEE6c9vadukoP8astDFcF/KlTkwTl2zEt1on9IhSdf5NV
	PgSK1UbpiFnpUchFtwbFgWdobtUoKtkascytbotC0ZkgGVjjoKyhtIgjxJiEEfaYZcnYbx8yU0V
	G8a3TrGOaEEcKQS3S+At9qH8g64G51bDtBgbvoxaoN6Mgscns+qJoXJIVpsO4KB6wi3Z0s/PFV/
	mq9xHY05JaVXq+BNdSAuaanKe8zOoWqB2EZvKOzVhsZqvSbmjy05cAlAykEW700HghIYJurHOox
	SSPWAeDQM06R2JiMix+4Mru/Geppka8VOgueHtWbmOx5JpDaEJeK/WM54muxgbZR9EVv80CaIWy
	Qst6gTdiau/mqDXobyAFcRRRQ==
X-Google-Smtp-Source: AGHT+IEfsu42kjo+3MdE+dTuWPwn4ZELRpNHJLdpG9Iyvb9bmgYPnpiFyqpd6MhNhLlGzN60Yauakg==
X-Received: by 2002:a05:6214:260f:b0:88a:2de5:c824 with SMTP id 6a1803df08f44-890842aafd6mr219449636d6.54.1768132994149;
        Sun, 11 Jan 2026 04:03:14 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077268016sm116156616d6.46.2026.01.11.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:13 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5F3ABF40068;
	Sun, 11 Jan 2026 07:03:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 11 Jan 2026 07:03:13 -0500
X-ME-Sender: <xms:gZFjaZe1FbmzoQKX8YzZC9Fi0RvW_Nc4zlgBpY5mkh6LcnpFeRFchg>
    <xme:gZFjaRkQzS_SKKyG4PQsVwWHCkNy7OzeUss6hKhT_io2JYRkTnQeLKD8_rc36UARN
    mhodrAY3nP-xLoglByhUOey8Jhd4IwN8Ox2xey8GeulhrJef_vMXQ>
X-ME-Received: <xmr:gZFjaYrwmMiqbMOqNCgu55MKfETBqCMAkqs8IjfG5iP_pMhtL3Pouasn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeefffffveeigfehjeffffffudfhvdeiudegudfgieetueegkeeiheegvdffleet
    geenucffohhmrghinhepmhhsghhiugdrlhhinhhkpdhskhhiphdrshhtohhrvgdpvghrrh
    horhgptghouggvrdhsthhorhgvpdhishgpohhuthhsthgrnhguihhnghdrshhtohhrvgen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhngh
    hosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugies
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtg
    hpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhjvggu
    rgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvg
    ht
X-ME-Proxy: <xmx:gZFjaeGK2VeBrWSUKsHnqgHh8_OfyrqPRj8wLWih0awouyLw4sT-Gg>
    <xmx:gZFjaeRM_ZPL0U0hBaxj4r232QHEcdGPoT0Gzf4OIaO7Q4I-CRgnWg>
    <xmx:gZFjaUMIyWMJ8QDP57lTMP_6lL6bbEl9tSnAdmZVmTVMMxT855fmTg>
    <xmx:gZFjabkmrDLBZ9AF5wYRxeae7AMAJcwlAe4Fd5yum57kQRK8vxX8zw>
    <xmx:gZFjaWaCNLWcQLzbMeUTd2RZEYhSCAcrs3lmboh1k258HSXMaHy9O9a3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:12 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 23/36] rust_binder: Switch to kernel::sync atomic primitives
Date: Sun, 11 Jan 2026 20:01:56 +0800
Message-ID: <20260111120209.6133-21-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Convert uses of AtomicBool, AtomicUsize, and AtomicU32.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Acked-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251230093718.1852322-4-fujita.tomonori@gmail.com
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
2.51.0

