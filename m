Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BCF330307
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 01:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790732544; cv=none; b=LBAqIEm5UcfBJLoSLi7mNfBlHTjE/+E2s79ISBBp+RHJManNLUwdApYofPP2YvKEmCx5HEbc1r0+P2MnGW7iJESlWsFnru97byBNFvr5p0vS8u8Rgyry2Y+aD+T89GT3hEI7zX+BqoNeJ8hgEW4g2iNZEc7UDXo7Ebs4ZvZeSHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790732544; c=relaxed/simple;
	bh=Dzcdw+F8Wj7YoU+9gYZsfjq9r4b6vq6GlEwB94eMqXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=redsZu0LInVjJF1q4UJ/SKDT32FG3TsKS5yr+DyYg/g2LtgGnyRIR1A6/rrWt4kidR/vaCYd+QcHPCb8jKKi+c3SJaelgFNopdNJdbdmTNlbSPsJI61SpMCoESBXgp0NybHjQbcPwzDYX+uM/UjDjH4qUqoc5DWwgljMT2x/Y9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=i06ZUfnB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AU5J2Aso; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="i06ZUfnB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AU5J2Aso"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 662DB7A0788;
	Tue, 29 Sep 2026 21:42:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 29 Sep 2026 21:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790732541; x=
	1790818941; bh=rTVirVkqDRXn0EOFLq+c6vrA4Ry/VUHeb0rHC0vHsmI=; b=i
	06ZUfnBQD9PwYJEKVoyhsHBFKkcIJcKYEfxGXAt36aPRZqGBjXRMf8S6WT55ozNq
	4EHJrX0023jfmGdyPbHkHbX/OlhaBXMrj+/xu1FtZyQ6xFIWUgozDGzxtSx4hZDO
	CnBDRSpVjSe39/O3oXAFc64pS+ACs7GeN757LrDDCCoXE629cZHD00B35zIU4FN8
	EGqHtMljg9oBBv6o0sXA7JSVNl5v55Kh2gXndhMjUkyRRiQWENHjrUcrH5UKKeG6
	rwV26tANFcZI+wQ2ofyBILd96AAj+7+IixkI4xONz3jkM1KOo6azdwB7brON+SDq
	RCYic8nlEac5WJiVUvyOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790732541; x=1790818941; bh=r
	TVirVkqDRXn0EOFLq+c6vrA4Ry/VUHeb0rHC0vHsmI=; b=AU5J2AsoMavCtNQGk
	CjdNjMnZQZ0ml/WOLnuTOYpp7aMAUdlStD7eKkZqZ/TMj1nY/t88P2jon5PcRpid
	PAhkbIiRCYt4DdwHWqi6D7R1ieZf9PGknHp4Ch6fvMlNztcqqWbKDUKipDRTJvqN
	CZ4sOdle0qUdBBpop4ZU9UvQA4cBzbWjxhj6xMbUrkaLf2X3SROK/V97ejfsPAAU
	SDXJHxTnX0NvC+hI+PfDGRYqWGSAzfmJ8GINo7lpg7zfJJ6AAjPWoygIVxYWMQKf
	WXGT8torApuAk/eEonP8r11biCVqPVibRLE+pj5MLoCHTImNAa0f5XA/b05WJ+zC
	1VOlQ==
X-ME-Sender: <xms:_Wi8avqlWR49e0H0BTaCLx2a-sXboity9D4LypZyGkK6EB09Czv4ZQ>
    <xme:_Wi8aiDgBrCx9nR9loIvAFkPkjxo9bwi0StsSNbd7ldAP3T1P-E_coAcFSxnmKulf
    vmBVHFVZS9Zc2A06YbJ_K9d6colMWi-aO6_2R8nHCCATasvCnnab-Bb>
X-ME-Received: <xmr:_Wi8auaFjqiEsh3CIx5xQU2BU8wm9Kc9zY9biK7PU9p5B45_rjIVGLm346_wUFtcK10QwXKFOcUwnkDacKY>
X-ME-Proxy-Cause: dmFkZTF28iLjUt/+/+jOu2GRhg2WUMQRPasnoXHyJ1IrCs/7vyK+w7ntbzJ4H08Of/htb2
    +uVXyjLt03jGAg2WoI7VuSiPaMveTFP8+l24I95VMNMR9bGTEn9m7oxhrT0YmIn8BPnbwo
    OBXSZozi2UEqP3u8JrKQ/BzDB3YmgKLXmaMS5nAqNmGLOUk9NJlcn79rzaxQjKZQedkkIT
    IIAlx9ZL0HNNO5ZQb0ka2ECjh9zTn5TY3l9/Ud9/OJLkaF6JtbWgRf3xto6xNCGmn4kMsy
    wjtlvydoGvkKS+JnrmDtqdCWV8Rx2RyB/A9FPqAmUYj1rR/c75JBGAmDSi6JDyETJTuHrH
    mDN5AbTU4ycJqVyHT88L6iD8AnSUp3yYnqgt0wP3i8FMTTBkX4zu/Ps03kHgu//x1dVPyW
    zaQB/Vry0Eh3vO/iUBO0pGnow35AN+7KsMyc2CB87gvdxSrxm7UJk7yl8kGk6Vt7u2udhh
    IKwdTnTuCSuYSd8onbD2gWQH8cRkLvjPIBcKR/gGVObpjpusEIheEbpBhSBFB/UV/WUM2x
    ovD+13ZdHPlfqnla2Ghwj5fdu0FKd+TvMmcRdYvLLA6Jp0WTIZfY24KiyY6o9CZpuGiZh0
    ynZZAfr0AVBmByuZjRf3ADUavtbaEsnJP0jcOhkQYDAxOD4adDt2izPHvhqw
X-ME-Proxy: <xmx:_Wi8aqvYYaaQ5bpyjLd5502i-pEN7RPnj58jag-Pw_SrS57hnLvH9g>
    <xmx:_Wi8ag9MyBGydvAQiWlbSdevI-Af2RndUdKTSVKr76Nr_Zfvqp6ifA>
    <xmx:_Wi8aqU7gep2hvYGze16l9nP10kvUTF6fBtsS4QGBE5EHT-O9VUdBA>
    <xmx:_Wi8aktNqqpnnvoVaKkBzP3v2QEcsO1ORSwcs2ffBBmWmzKJjiC1ow>
    <xmx:_Wi8apK4zn2WfcSduIKdRVPb5bk-d-uWo-6KWbywu06EFSE9R5VZvL-a>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 21:42:15 -0400 (EDT)
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
	tkjos@android.com,
	tj@kernel.org
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	jiangshanlai@gmail.com,
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
Subject: [PATCH v7 2/2] rust: sync: condvar: use Delta<Jiffy> for timeout and result
Date: Wed, 30 Sep 2026 10:41:24 +0900
Message-ID: <20260930014124.1454138-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930014124.1454138-1-tomo@flapping.org>
References: <20260930014124.1454138-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

wait_interruptible_timeout() takes the timeout as a raw Jiffies, and
CondVarTimeoutResult reports the remaining time as a raw Jiffies. The
type does not show the unit.

Switch the parameter and the result fields to Delta<Jiffy>, in the
same way as enqueue_delayed().

Delta<Jiffy> is signed, but schedule_timeout() prints an error and a
stack dump for a negative timeout. Clamp a negative timeout to zero, so
it means an immediate timeout.

Update the only user, binder. It now converts the freeze timeout with
Delta::to_jiffies_timeout() instead of msecs_to_jiffies(). Both round
up, so a short timeout does not become zero. They differ only for a
very long timeout. msecs_to_jiffies() returns MAX_JIFFY_OFFSET for
2^31 ms (about 24.9 days) or more, but to_jiffies_timeout() converts
such a value like any other value.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/android/binder/process.rs |  7 ++++---
 rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd93b3..ca944a50c6eb 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -35,6 +35,7 @@
         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, SetOnce, SpinLock, UniqueArc,
     },
     task::{Pid, Task},
+    time::Delta,
     uaccess::{UserSlice, UserSliceReader},
     uapi,
     workqueue::{self, Work},
@@ -1549,8 +1550,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         inner.is_frozen = IsFrozen::InProgress;
 
         if info.timeout_ms > 0 {
-            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
-            while jiffies > 0 {
+            let mut jiffies = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
+            while jiffies.as_jiffies() > 0 {
                 if inner.outstanding_txns == 0 {
                     break;
                 }
@@ -1567,7 +1568,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
                         jiffies = remaining;
                     }
                     CondVarTimeoutResult::Timeout => {
-                        jiffies = 0;
+                        jiffies = Delta::from_jiffies(0);
                     }
                 }
             }
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 69d58dfbad7b..ae70e91eca94 100644
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
@@ -182,19 +185,29 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
     /// Atomically releases the given lock (whose ownership is proven by the guard) and puts the
     /// thread to sleep. It wakes up when notified by [`CondVar::notify_one`] or
     /// [`CondVar::notify_all`], or when a timeout occurs, or when the thread receives a signal.
+    ///
+    /// A negative timeout is treated as zero.
     #[must_use = "wait_interruptible_timeout returns if a signal is pending, so the caller must check the return value"]
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
 
@@ -248,11 +261,11 @@ pub enum CondVarTimeoutResult {
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

