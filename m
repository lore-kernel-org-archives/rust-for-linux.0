Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338A03596F8
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001622; cv=none; b=KtY7gq/MxaG0SxkjuUN8+a7TpJ3pw3mXdRgj7e2860xKeBKRJ7wz45+pGOb63XEdhygqIDGHp4DRgO+y40nB0Tpo3z44MTm0KE+DOVXMl55ocw7kXi3QDGhj5YhVPMwUZ2AUZfGCxE0blFTh27+wAhrLrQoL/kFj/7R7+Iv28Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001622; c=relaxed/simple;
	bh=S5P5DtcVF6BPqwlPAhTNZgNH9vVWAP9U/pnsPq45Lf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pqiwriq9srVGgYYNMT9DVf2igMR6/8YX1gdAvgTl4rIpNGV8/ZbSXVjpFSb92/2Ma4kfq8fxOjBDpf3adDydeZQhbSI8ywQWmregLmYdGs5de+XwxsrZFQNrCB+Xu6y+5eYkltd1inHVHXUgzKeqAx+K6wuzPLVp/QNP1nh/UtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=aovBKyRf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VgipK+0o; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="aovBKyRf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VgipK+0o"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 4BEEB1380231;
	Thu,  6 Aug 2026 03:33:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 06 Aug 2026 03:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786001620; x=
	1786005220; bh=SbOIwbW2S4CYQpzxjpl6OhfC5zaWzNlzY0GTgOxVWwY=; b=a
	ovBKyRfKbKTUcmOStJnou1CkiATQExLaZj41/doSa25hjskX5BirRZ2cW7cvp2yf
	6pWfSVAsf0sy8vXmNMYPzXNg9tbFzzWUCt9L2uoSlNwv01HT7zHH1p3TuoqT/zJ6
	U6HvYoHqaPXxa9bt6YYOg7suVB+YnqDNCTDOkGy/A3QGfZeAzzakPqzveAcJDYty
	GPMvi8tCBlyCByDM4LEc8AWwP02tUYq80DMeY/TMH1VDNZALesL24n56WJzVD5TR
	oucwIHduITXEZLItJSV4vJ+cjOHDsK0ohGNEAuv3WymmuaSMnf2Jn2H4ptoHKsoq
	ccK7dWwTif4qLDrW6bRag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786001620; x=1786005220; bh=S
	bOIwbW2S4CYQpzxjpl6OhfC5zaWzNlzY0GTgOxVWwY=; b=VgipK+0opG2vVkiZR
	+im6Zz8WKuHXi3PL+svRCJJifSBpR2QtKgnEdGh7WJ1DCJpHUjzi8h4QSdHGIpmm
	SVS/IaaeYIJ0rWdP+GJq9/YfYSX7jLdUUp1Jwl2r7Bm0IYBC9uw8MXIiptc2AT3L
	aoi7ctDUr2aadnql3P7zbcjLMXEXCawQwXNqWi/pcOxrBRiPafgCpc2qPq5yLCmn
	XDqTi8/azXB2eJXku0cp0Pr8fiRHf9KpNwznKuYh1eVogw8w3tNNo5zAXYEHFC0u
	8Ux9EIX6vEtOmXZQb7oPjB49z/CwaLjxnHn2o0t5Az2LeMiGgFXXuZXrwqcrKezw
	3NtlA==
X-ME-Sender: <xms:0zh0albXEB67v4V5l4X1dI8syEvrBxMtUVzAKcQy_coK21ocPkz-CQ>
    <xme:0zh0aogijV7J3kna4mQ-QssXDv4tK-7b02midm96Lt24QoSgkn-fuHsGD3RaCKDaK
    xeZnStBzULpY8aDHkaY7hnLbBTunGHVUlV6CuXJCU6VD8vYjXbyU4rL>
X-ME-Received: <xmr:0zh0ajwwyPxuX-FkaFnfq6gmItSmH81Y4TzqGKKTcJBM3c_Bj0BsQ2P_HE0VPbC50A_nWlVRZtV3IMO6fSY>
X-ME-Proxy-Cause: dmFkZTFwssCoV0lXwk38ymRuHjYILl1Auox30KXDYumUVM6N7JvAcmnJtVEhECOyuOe7NT
    JZODyWKxQ3aiskA582xmRP4uhwwQzJm853ThDWYXLAvlR+Yc06MFo76d8WZ7bnjJKFwPXa
    shfrz1ZvinkOPoT/8/y1yisIUqIH8BGY9CfwT8UTF72oFM7knPsdcZCHBHRyUS1s7z8dme
    2LDVxDRqgJ3EjTbWIlaYZ4faxxQUn726LvQG/0qvi9SmXdljwTQbjqeis9qwmRniXimfwc
    mr8pdD2WPQ3HUQtsmnkv2MjsxJTl0nIzzzaiKFqOvV+cFhbvHDPfOdBfX0acvUODPiUvaS
    rsTrWmw1OmKJPpvwPHScQ4pF/b8y5+QzWQwWKOUF4CxgdSibFTHIlR3JlHg2vdHSRP6yw5
    YZfQeW1Vc1Grr5UHF8ckqOKNGw9ubbGuATLcYfh5nbX5vbxBqP0STsaGTmmoGDdvo/bmR6
    7BV0vrXHCK+cp5luCXDVdct3XKOmtPnvwgIRc7qgTnj5DD1ikpUfOjU8ijH+UdulXUplsm
    MCI8sytDm6yAd6iM/H0a6fX3wVfamKDk+R0swl9odWfmYhlnFo9oY2OZsZoUiL2gztKdOy
    NE1fQ7zH6UaYZE6y4CLukXCa/GPYcplcZ18PAZAxJZrB7oiyM6s4IZrcJIaw
X-ME-Proxy: <xmx:0zh0as8MP48EM6Z8IkrjG4mMEN3PbeWVeqtvhhwtBvRjNYkzUbCc5w>
    <xmx:0zh0agwfLfFs0GeDtsx-7xHHNG04816hyHeyqm2Sr3ecXUu048Ug3g>
    <xmx:0zh0atX1mZodP0wJpqeALv13teieLpWAT_2zUOMB90jF3wEoWVIEgQ>
    <xmx:0zh0arZmM4FLsRmJDsuAHzLS0vmlaOWro0nYzzaqJbhxZpTbTtDLpw>
    <xmx:1Dh0asQmsGQoiuEtGifP_sthba0rxv7lZspj8_GFO50RfFhdEP-aO42O>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:33:34 -0400 (EDT)
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
Subject: [PATCH v5 6/7] rust: sync: condvar: use Delta<Jiffy> for timeout and result
Date: Thu,  6 Aug 2026 16:32:40 +0900
Message-ID: <20260806073241.1024319-7-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806073241.1024319-1-tomo@flapping.org>
References: <20260806073241.1024319-1-tomo@flapping.org>
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

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/android/binder/process.rs |  7 ++++---
 rust/kernel/sync/condvar.rs       | 29 ++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index cdd1a9079726..aacce7d07499 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -33,6 +33,7 @@
         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
     },
     task::Task,
+    time::Delta,
     uaccess::{UserSlice, UserSliceReader},
     uapi,
     workqueue::{self, Work},
@@ -1482,8 +1483,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         inner.is_frozen = IsFrozen::InProgress;
 
         if info.timeout_ms > 0 {
-            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
-            while jiffies > 0 {
+            let mut jiffies = Delta::from_millis(info.timeout_ms.into()).to_jiffies();
+            while jiffies.as_jiffies() > 0 {
                 if inner.outstanding_txns == 0 {
                     break;
                 }
@@ -1500,7 +1501,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
                         jiffies = remaining;
                     }
                     CondVarTimeoutResult::Timeout => {
-                        jiffies = 0;
+                        jiffies = Delta::from_jiffies(0);
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

