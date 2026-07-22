Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7F37B3FE
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757120; cv=none; b=KU4epIRdtk5RvTB9DaiRWhIr1gmV8P5LjNttO3qCYhbQ3kGJduVYKWQcAqWRKBDg9GEsN+wF6YPTbPIFI6YhomixREwVadzjEsTepXpfLCNp2x4m3QeDreEVaww4KbkSDo0kllCS9WH4k+kyd1jTaAS02dkBLeO8NPyECdaPAaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757120; c=relaxed/simple;
	bh=YuQs/FiQ+ttOmPZqOTP5X3btkHCW0T+8JPF/3KYIEQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJztvOkxaTkkzQpPgX2wKCSsV14Xge3T7fRU6s3pot6cPVXecEQUvJgfnCo2uEbSHJ5sWSpjCZzEnz3vMzyNV0K75AIO/Grb3vW0O5Ko19qvLuOR74STZhMCmkLkuIlUn+gd647+/UfOhS5zJ04DG2VFVHcAYhdkmf6iYBC7VqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=EOAombze; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wi5OB05Q; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="EOAombze";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wi5OB05Q"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.stl.internal (Postfix) with ESMTP id E43D61300153;
	Wed, 22 Jul 2026 17:51:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 22 Jul 2026 17:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784757117; x=
	1784760717; bh=FU4eGiv80y656b6/AzUOo7+COXlZ+V7VW0uaQK82WG0=; b=E
	OAombze6jkEag2NtcGPCS33JqUDFbAYv2J0VfnHhVbJvsI7BRewYWEh9uZOnN2e8
	Cxm3+E81IFhuWFxl0QCBRNaMN8O9MSJzgU+WvRu/YaFKt9wxHiKuTmZaJbN9AkJp
	MMapUrXe1ISnaKpQaPq+lDvB0iSWvHgXsPTyZfsJZU93zsMkCcIUqievs/NQ+9PX
	qyMIOVaN3M2o99kcH3iGxEtEw32m3pZ4jO//W5FjkQU60P3yIq6Wa+lJmSow1fEW
	572R8DBOmisfic6VTtAI5zgH6/DNDxQP5eiRRNZCjzF+EnZbkjo6HCSrH+9VVmIo
	xyFHquvit2aXxq1w3PaKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784757117; x=1784760717; bh=F
	U4eGiv80y656b6/AzUOo7+COXlZ+V7VW0uaQK82WG0=; b=Wi5OB05QejHfLU9o2
	oh6bg7yh09CS9Q6j6bF1BasimQtCsxAYkN7oVguqHjT8DsciQeGsCy2sDI1xGgqn
	ktH99ZoiHBmlwYuGPqcp2vqmtVTDrslfawNRRBIS87wvSCs7vJfmj4TNa6oU8GhA
	XlqXVNzVl2bvrYj7zfUCteehxT1UHXofYLSKHwerDwGdjTHqRt2xkD51OeeI/uDZ
	ySNGSpqcHABFpf81srPI5CUtmzCupw6W6gIczvEZfD9cQWwEVIXM3kFB8rrAz2Nf
	gYTfLGkSw9NOndXM0cgU9Slwnm0E1bXDShWf3IyT+yZUVDeUCQ4HyPRpbQ0ap9UH
	4v7Eg==
X-ME-Sender: <xms:fTthamKTvaMSo55eOe-POMUQjMCmKfrwL8t8jQPsa9QgOFOKUiMQQQ>
    <xme:fTthaqT7Gz2eKr59PXbT-_QCsxA6J9Lx_C60sU31gsclhe1HQl_GyoKoXfm4W8MUZ
    ZHZAGHQbl7tzinX36Fs7B8Cz_IWPnSJVW1bhB5RuMZsAGeVA2rhciw>
X-ME-Received: <xmr:fTthaijJeYRZbfj4HqTMpOURX-ouR8_4ek2x6GEywgiOrzJo_uOfCdo5cVpFuR8KUFghFNACIAOZeR9W6bo>
X-ME-Proxy-Cause: dmFkZTEpeWXQv+nSz+4SlAnMQtfuIvsM4emkX+JSfoYDPilOheIT9V0GshcGfeRAFi1z/m
    Mlp6+j5AohBaow+nB3wcs9MNmKH86+NtxbmsFbdiGOMGqSkISn7FViK8YA5L4ANsFat/lK
    PPYpSD8h3LLacphpcWhJ1RVk0j4lbw3sprNI4kFRSIHrrCCywESTa3IkbVVTRRRaTCetWa
    OJocjDEE4eMqUip4gk8SEIvOCS8/G9xhjBx0jj0cpgD7TUxIEElT5IIBlZcTFCSas4QcRd
    2LjliwA6NRaZga3bl8bgIjJ5yeHn1UV40tTw4rtB64Ogubjm37Q5IqN6/5lGXG7KfKDZk4
    p9YqcyKFXgbdeL0oAlN/rdafDedzRtvMbstG/QtwRxdieKNabvyzAA2roXGqBX7FQkglkV
    OUkID+Du7MIN8oDDnW+CBGAOVPxUAG1ZEZeJTzggzKjLZrojPuWm17mWwgKRZZOKmIFsHu
    sQ8o+/TFVZcXBeDzSkDIF/LSWGFGcz7ZhLoKfHX8tU4Zdesc1M7LGuSXab7W239UhG+GOT
    m3n5/kX4P93RdSkDfiRwv8uFvc0O1zUh3fiSn7o1zVmzJjtvtdFOMsTYp3E7sCRP4pMWLI
    3D5WNSvHxIb1JSn8h1oUtccEtq3ucZaLBQhlMtwUivebaH3pZWST2mX9zdIg
X-ME-Proxy: <xmx:fTthaksx0YawhJozcKA9zTX9IwgcBQHxWcXMAmjGwRosIFqfgwuvsw>
    <xmx:fTthatgPftGZwVMJoqFyTn67C6IoIJQ7DA75S2A6GbGbG0iqqJ-xiQ>
    <xmx:fTtharHEd7lP2M8L-sC3yqLjJ8pQTT8XOwbyYshxU-90GVmtrAraRA>
    <xmx:fTthamIiTmjxu0naDEef6xHsdsqxhZfS_HP5BiIIeyHE0bj5NOMRgA>
    <xmx:fTthaisVHRzYlrFUPXDvcVZWSiZKII0Z0voyaPTzYq-WL5cu1rOGh4yS>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 17:51:51 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v4 6/7] rust: sync: condvar: use Delta<Jiffy> for timeout and result
Date: Thu, 23 Jul 2026 06:49:50 +0900
Message-ID: <20260722214951.72941-7-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722214951.72941-1-tomo@flapping.org>
References: <20260722214951.72941-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

wait_interruptible_timeout() takes the timeout as a raw Jiffies and
reports the remaining time as raw Jiffies in CondVarTimeoutResult. That
is the C representation rather than a kernel time type, so it neither
carries the unit in its type nor composes with the Delta spans used
elsewhere, and it pushes the unsigned-to-signed conversion onto callers.

Switch the parameter and the result fields to Delta<Jiffy>. So a delay
is expressed in the same time vocabulary as the rest of the kernel
crate.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/android/binder/process.rs |  6 +++---
 rust/kernel/sync/condvar.rs       | 29 ++++++++++++++++++++---------
 2 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index cdd1a9079726..314962b5361d 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1482,8 +1482,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         inner.is_frozen = IsFrozen::InProgress;
 
         if info.timeout_ms > 0 {
-            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
-            while jiffies > 0 {
+            let mut jiffies = kernel::time::Delta::from_millis(info.timeout_ms.into()).to_jiffies();
+            while jiffies.as_jiffies() > 0 {
                 if inner.outstanding_txns == 0 {
                     break;
                 }
@@ -1500,7 +1500,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
                         jiffies = remaining;
                     }
                     CondVarTimeoutResult::Timeout => {
-                        jiffies = 0;
+                        jiffies = kernel::time::Delta::from_jiffies(0);
                     }
                 }
             }
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 69d58dfbad7b..73e123aac860 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -12,7 +12,10 @@
     task::{
         MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
     },
-    time::Jiffies,
+    time::{
+        Delta,
+        Jiffy, //
+    },
     types::Opaque,
 };
 use core::{marker::PhantomPinned, pin::Pin, ptr};
@@ -186,15 +189,23 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
     pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
         &self,
         guard: &mut Guard<'_, T, B>,
-        jiffies: Jiffies,
+        delta: Delta<Jiffy>,
     ) -> CondVarTimeoutResult {
-        let jiffies = jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);
-        let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
+        let jiffies = delta.as_jiffies();
+        let res = self.wait_internal(
+            TASK_INTERRUPTIBLE,
+            guard,
+            jiffies.clamp(0, MAX_SCHEDULE_TIMEOUT),
+        );
 
-        match (res as Jiffies, crate::current!().signal_pending()) {
-            (jiffies, true) => CondVarTimeoutResult::Signal { jiffies },
+        match (res, crate::current!().signal_pending()) {
+            (jiffies, true) => CondVarTimeoutResult::Signal {
+                jiffies: Delta::from_jiffies(jiffies),
+            },
             (0, false) => CondVarTimeoutResult::Timeout,
-            (jiffies, false) => CondVarTimeoutResult::Woken { jiffies },
+            (jiffies, false) => CondVarTimeoutResult::Woken {
+                jiffies: Delta::from_jiffies(jiffies),
+            },
         }
     }
 
@@ -248,11 +259,11 @@ pub enum CondVarTimeoutResult {
     /// Somebody woke us up.
     Woken {
         /// Remaining sleep duration.
-        jiffies: Jiffies,
+        jiffies: Delta<Jiffy>,
     },
     /// A signal occurred.
     Signal {
         /// Remaining sleep duration.
-        jiffies: Jiffies,
+        jiffies: Delta<Jiffy>,
     },
 }
-- 
2.43.0

