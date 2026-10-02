Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFCB3546C0
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917610; cv=none; b=KH/wKhrkabXo17hVa6QYLkudmdxalY7Ekeyh25s9RI7Rdk5mMEJW7s81aveEnZAZ4t4qBjQhZYTnO61E8+/iRC8yzY8KyzhoSlCal+VslOEn13LhSFssPVFBMuTXiQKNYD7BGbU694jBLB51a+Xh0pgP6vGEj7PLlkNLxJaw0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917610; c=relaxed/simple;
	bh=lV7ZTuYenBRvM6UVR6/W623JFycZkoj42BYa3ajgWgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgIUDAtFMnJatftVx3hJC18KFgjPmTfpOlLMsceVCn9Aihk++3eKnqDJGdlr8xGuaxfWu7y9lysHOG0UpFotQT463KI8vwOTbaxg0npVWy0hJ+RTe6gpuFR9RIANZf8ZH2WUT9XjIEsjHqtmsrMAn6nxlb6RZyvo6mx9+MkP14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=czBb5Leb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l+s93Ebo; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="czBb5Leb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l+s93Ebo"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C276B140017D
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 01:06:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 02 Oct 2026 01:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790917607; x=
	1791004007; bh=As8yt6sjzq7TE4EtvYuv+ap0lTLC+K00OlcNKMhtfkE=; b=c
	zBb5LebSXNa5pZHkD3viCnu0CrIMZ948z1HNcE/AuOfYhpgS54SWfmmKeJgcN0K7
	pG0FcUqcQVwmVvILGr7V7rpuV07yjVQvI5mpFeJ/WwoyuloQKxxp4n/py3tu1moN
	lBz9sacirKrFIgsLW5mSDN59Hz1H1snqWdTNsmUSYdWIEZJEz93OXh+qO9yVS2Pf
	gzSovPxC+fqf/JfhK3IWLWPx/1GAVt92kPZseccesj0XjXxHOdRFbthq8hbgPfIb
	UgEUd7Gu/B4JI8cuXeIXCmOvdxlqxbHKopPqfyUqvu1+IwvPSuva0FojodF1CECM
	2uMbtKJxA09z04sKXOfUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790917607; x=1791004007; bh=A
	s8yt6sjzq7TE4EtvYuv+ap0lTLC+K00OlcNKMhtfkE=; b=l+s93Ebo0aT+w+wTa
	H7TRHCLwfv92/D//8kBknFAtQN3Xmxc9f8s+Ij72yg6/3piCaAOSLcmPFsQaRMtb
	F8wHOxQ/gDwQ2h2zrL7TVAa3jzrbZoB2PfSgotvpBQ8YSWlCPa0R9wBF0fItX9Y8
	bs+3sd3Cd8uXEN39BRNbScwYgEBeDQwhusSQ9qavXzBMBQ0W7v+KrWyjm7UT1sNH
	gx9gxOyStzk+NvG5a6l64I5TTPCjl1WeO3DBjMVsGpthU2NnL44ronit/xVUmKN+
	kIDOFn51zYiumSn49uhLqiS4MRzxL2nyx7r3Eax57T8n2BjxS8uqy1Rf1V4AnOe1
	WMdKw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790917607; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:jV91wnitcr7rS0fwmvFGJtDnKjr4Ubrtw9RsJnNlFFAnFjh
	Bd7YRFJ5psmmL7CkUFGCciCmd0/tDweALDG2kOIozgHF0rcsoSd9Ol1khXMQe32X
	t0aU3relKPyClNNUujyFWbG/tSChCjbLVBzHtpbWNkyNiyl/LIBq9FUHMflsHZ+I
	JJVxSRQNRRvVvldtR7Lu7/k+nsn1qR7vF3AJM/hKWCLpSQf6UTiNg/UX/Wgsde6m
	BNSdfVG+P3Ig/zKbqxfcHJTYQMdu9zHyyluJ3CkICYB/0GxxSQ09RMN/nl/W9+7L
	jaDQ3NRUegT5dU3zCMGmvHWtnKxlqrpGK1kCGpQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:4jR1oijPAtRi2ee/27BZoakhCj3LFfm7jFoTi3YAurg=:lV7ZTuYenBRvM6UVR6/W623JFycZkoj42BYa3ajgWgs=;
X-ME-Sender: <xms:5zu_ak9sblWJ6J4EwwGxGAJkH-3r_ix0CHEBpSRWWEi7JyfvvFucXg>
    <xme:5zu_akNvHqg6YwgpOO7KasAaKDTycSFQjfpBaCc_HGHcgjvm9gdbChQ_92A_1bAyO
    WYPdh01co5cnwTjVP495bGRqqTcs6dMsrfjJYYEzThTe3nDH8aNt2F2dQ>
X-ME-Received: <xmr:5zu_agGoUyI8CgT9PiANhrEFS6wO-Hk9WeQsKWU_EAASuH7u-9-T_Xgp1fesNgWQumPR3BjiqO-b1NK5j6Q>
X-ME-Proxy-Cause: dmFkZTELvTMN69lYRbQNGD/nF0+g7jMLhSVtWbnZe9N+kj2KU3usaQJLeOfxYjDsBQauW2
    7OAacvJ6db8UHudM//IEBdl5QKozZnLcdI+Bn0xO8OGqlP4+gmL4ExcYuV4ugGwzFLWKQp
    7B8DmwFmdrWdDy18FDSAe02bYlmcrw14l0S7p/2nNaZYDmQY6ZhAasvyWxEMYknQEiZn/T
    gZIKMBTi+ATmKMkHp3mAMys6O40ib269EnsQ2zqHZjyLhuhhWQFWAKG+7yziIE3jicdMSS
    YsM4+Z1Kri+KVqv3xXthvajC4Sqy/4EKAYjjF78ZofR2UC+gX0RPu6LK0K1Y2yLylZHSMT
    ZUAOQJUMYjzPqtOXN8PmgXC8+Af5P5P7aYp5BqpVtlDU0tjrtq5icshdDcmiEISyWA5zQ5
    dpK58GmlE4EJtGvlrwPljNXMVQ0oCQz4GV3277cwhesHmzXMEq9/4KQ9rcCiI2qvAC4cl5
    bT6jL9XpUVpg7C9VKARDxxEOIDE2cwXKLIjR+DOmEYAw+2f+wN9wQINUMoSFSeBfRvtpW+
    +OpZRlLpzl//IY7Zf7p2nInSb7++Z1UH1tODDV3r6TM06PSLE1rRcBZ+hz2nnSFQdI0D7p
    iMS+BS/6hlGy+wsifoWjVGaGw7kieLDwArZw0YiXCPATqxw5Vav1q82isp4Q
X-ME-Proxy: <xmx:5zu_aih4LNVm5EUB7Wz78uxMxMUy3F6Sv2Nb_wxuJFKa9xxgxUqNuQ>
    <xmx:5zu_akT6cCouwNoLlKmJHMV5wSq-6jJ2eBWawM7cNoZ4BUOE8lP7Ag>
    <xmx:5zu_ai_6xn5PL9umuX0eXDL7oe78dXY_EqV_8dU15ivMwXQ6-g_kcQ>
    <xmx:5zu_aiSqjQms5apx6a4OlB8xO_K6iDRLmX_R8q5S31V1ySkuGfPDVg>
    <xmx:5zu_arzutf6adeitPYBNChv2e97yb3N9Ub-0OHiBQjAvaZCKnIMmlpC5>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 01:06:41 -0400 (EDT)
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
	tj@kernel.org,
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
	jiangshanlai@gmail.com,
	markus.probst@posteo.de,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v8 4/4] rust: sync: condvar: use Delta<Jiffy> for timeout and result
Date: Fri,  2 Oct 2026 14:04:28 +0900
Message-ID: <20261002050428.2746277-5-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002050428.2746277-1-tomo@flapping.org>
References: <20261002050428.2746277-1-tomo@flapping.org>
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
index 5372bfbd93b3..2edd3dcd4edc 100644
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
+                        jiffies = Delta::ZERO;
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

