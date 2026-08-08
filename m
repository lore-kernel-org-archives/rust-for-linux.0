Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D579537D124
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170580; cv=none; b=NUFrpK7Xp1YP07K5hMtuJ9ILLd6knIFusbamHRYj3fj22C1J2aT6uQ3kjD5DhTV38NxlRp/iaqnHFtPoYzovEIsabWYocpsv1wc4OBt+mrmVkeKM8UU3S99Yp8UcctFR2hwxbR0BxjejDivw1zkfOuG2EGsBqkHIXVkB7az6ghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170580; c=relaxed/simple;
	bh=Ms5KBYQpni1moI/h4ZdD14ZzCVOzSfbH2cdJJNyiJ38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNVWSTNHcaTzbeTIrmYs5GRBDsNa5XxrmsI7F4J29wNhrTOLffRclaHKnwoqFRQqFe2s9LTa+O0EQBOFf8Gw+9ewRly0D+gLraC5tduk3tXdAQpwDJtt1yDsFFOJyQNdqrUHGGo1vrA/aQUxPG9IzerwJmYUrB1n8SZ+9tFET3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=LPds77iZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NwBwhe0d; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="LPds77iZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NwBwhe0d"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id F134313801CD;
	Sat,  8 Aug 2026 02:29:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 08 Aug 2026 02:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786170577; x=
	1786174177; bh=yXfmAcZoSQtFnbb9AeLfddhoi4abQbt904L9A25B/64=; b=L
	Pds77iZo1Ir4nYXWmJT9I4EfKdKGYBzNOHa4/v8R/N6HBbNcdKfLni627dBBqUzG
	lvXa60b5n12p/qyKF0N3CYUn0CJZXm7rNh5jdBBk9YfApVZiHtD7UbB3v3q/d6QB
	VCW1A9qctdOUQW9iroWc8wKTW7KgvIqpYgC/fzyAfeygOUrRtwT03z7SMvACH5eC
	OS4MrDPgO7+kcUevxpghXnELThB5rs8dzTZkPb9Wd0BnNbyJRJxn6tR41sOZ3xmC
	VISap+N1ivZRS7BX9aFKqSaN5puxmgl8Xk9LZhxvLSfvi0/WTI0n//knNjGtQ78O
	42YfGmWXl02u6+VUdmfww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786170577; x=1786174177; bh=y
	XfmAcZoSQtFnbb9AeLfddhoi4abQbt904L9A25B/64=; b=NwBwhe0dN6JGK488o
	KC1f0Yq1z0JUL4DfzN4CYgUscoq0R2FvcmQ7HgFBx7qGUSIuYOwhNpaA7kMSP28c
	sUL/h6gGr0mUyxQyypTVwmmCvwXBipbsc2RbGWXoUq27SDMRct84dRMCvp+IKFXR
	cKFqh6lWczjNqfAX9xjpA3IMAB2bEoaASWy60c27qM2zjvg47DtesaPAuuTeyYAZ
	qHj3bttxZ/OM7bKN9ajbQWtm7yjjc4SmyfcrCmTdZFUi74r6uerzi4MOkHzWuqWA
	D1yZoJ5WOugXJAQfjLg2c1r910XkgrqaWI2UqNzSMdIjBBhxb5LDk0QMBEoOcH6g
	L8uNA==
X-ME-Sender: <xms:0cx2aiESvXCrTTFK7I8Lw0ZwZNo5YL16uWiTzA4CaGQHVhcWCYBLgw>
    <xme:0cx2aveM2IuYe09F3zO2sU_p2J-TNP0TAApvZOWQHXdbUml8di9DMXff919QVTL0_
    OlfL0gN4qA_pRxRuclbGvEQFqk0OEdD5bGSyJ7Q-r-Sy00XHfugLmQ>
X-ME-Received: <xmr:0cx2an872GfY8xQbLMHmsTqc9iz7vDdhPN-MiBPc8QYF_qi5KCN-Dg5OrZwWFhU4-mhK2NydBIkwXimFlcw>
X-ME-Proxy-Cause: dmFkZTFDgi3l1zUrtfDoKGgYbKlLqeLs/xP3ecL6BY++kFwTvBynarwSPOwtTpz/DkYntg
    pA15JUfQ3LcJm1F/HSVxIfXfcI/jJNTWTDNjKk3YTB73Ot1kf53Rte6xkTGdRtME9a4OO2
    oy+GlhHkatF7721IuAcw9Ifyufk84P5toY+NGboEtSbghXwjGOLyzjoOKpluDIZdM7enhJ
    RRNVFzBOAv5QkG4dE72VGy8mgTr4zpfQ4aGqQvyoyDowUZHJUZLTdLgM0QMM0Fq1pLintf
    WK1jEQ2pn8VNOsNlU5mchRaxtaDEMRrwVkRLFNPJZw2aR0oS9o8HuG5MRxwFRlJwOrSzKB
    Q8jJNkez9NCGC+4SJjIOrp5fw5vRibLY8bpQLxr2cDcX+f7VbId5VWtBCpQEdS++9BtPrB
    PNa1bZv356RwQ0ydte7IS0ceEN8foVQtWjzxINY70E3vb9Bt6N718WrVp8adF7lbaDhJFQ
    FRr1j/xwFkbUBWHEsB4Sz7qu4pC4RR3loZdThJTAU12uLcnNShdX5Gicuy8Wt76+dlhLDk
    rLl6FC5iaX5X2RIQJJvmBah5QBNySaw8BxaSSh3/Oog9ObEtqGI2nezgBw4tEIgrUa4fzK
    JbxDn+DexqtkDtYHE3SUYV0/80EYRAxml9IoA+WjtG0+W3xebHHLPxYrQlLg
X-ME-Proxy: <xmx:0cx2alYK9gqPQzC92AQOuyQTOiuPtpkcaxRgSH1j2_Zm5cSsksrgfQ>
    <xmx:0cx2aodbUtBQil1ERmhHNqcYujo51DuBumsTMXpslH7aElJ-fNzOag>
    <xmx:0cx2ajQ4L329h5ajZav7cojhwGNJoZ7AwkoT9vJ843fOu8U0KGwjbA>
    <xmx:0cx2aikD9qXCkOtyT57d64asTAh_nXed6YaPaYbNvVuOedQKrhS4dA>
    <xmx:0cx2aoaPPlPP7-YOtIKN4zC3zfP0aNhHm0SVOpkPi6QPWnA41BmCOoEQ>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 02:29:32 -0400 (EDT)
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
Subject: [PATCH v6 6/7] rust: sync: condvar: use Delta<Jiffy> for timeout and result
Date: Sat,  8 Aug 2026 15:28:38 +0900
Message-ID: <20260808062839.1159990-7-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808062839.1159990-1-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
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
index cdd1a9079726..69680c9a5ef9 100644
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
+            let mut jiffies = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
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

