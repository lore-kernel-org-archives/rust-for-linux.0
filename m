Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793592005;
	b=dJWMghSjLChl+3/z9X7CPLxkWoC/SPJN5tBFTSkaEFx8kQ9yrrWfrNK6j2xJ+9UlJEu3
	 PRX/aRcL1ZifzOm0/xEIkO4kpctWGC9CNgjZ2QWi318y6gU7upXkK1Nm7oa9oV6ae4Mvx
	 z5mcKFvHFrdvGd7TgPzOCM8McE2txfqbHNEnZK6vBkhHRAsfDIO7l4sPDOarzhpbW8INP
	 Ap3ogXnaq+qKV9uAeYJ/wdYdf1/IOf2FvsRs8K1KSiB0uPTxwI5wTbDdK47fj35t05xpI
	 CEAfLJcoZL94ErreakGhRSWnqI+k6wNQcWjm37bTcu9TVA0y9cbdTfW0gKjPq2qKb/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592005;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gncsxwOxdzIxepPD7LeGQpejJVFwj8dCdQz9R4xpCMo=;
	b=r9JB7IXWVxCKec8La6F43qIK3oMRWhrV5EbedhS9l+wqHk7PY5gB14ybdC3h2MFMds8+
	 hkhtblirpAfLJ4I20F5CEjmCRW35bKp94QCXjSEVZRHmsEC5w8rG8Os3wGp8uo01O9jRJ
	 QDgQIPKCYIyHwddrHtQuJg6ihAN7f/0G96FpEiW7LttSgqw2T2mZXJLfog/hQ4XCJY6ZE
	 +74yXrZ+FmfKGoGFdaVQrRguKcgkW4LsA4INDqotmZSQU79WeDZu2PAhymqbWjNlLrIwx
	 UT9QK6SyEHTX+TIx2ieUDIDKWOVafr/ooFTafzi+drDgZvZPbOdrK9MmLZ3tRymP4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=fVX7d3bK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rzQqew3y;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30648606A331
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 04:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30648606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=fVX7d3bK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rzQqew3y
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 6419BEC0584
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Nov 2026 23:00:03 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 01 Nov 2026 23:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793592003; x=1793678403; bh=gncsxwOxdzIxepPD7LeGQ
	pejJVFwj8dCdQz9R4xpCMo=; b=fVX7d3bK7lq5sBaKTguvlVI331JEjwKeFwMys
	1CO9NuB/3aykg87S91/1GsV1WwbWduqL3FwijW6AiOaGTnkWODQVoxabPml5XY/s
	K0R/UYPBG6ewN4/2mB7R+u8NJN1S+KY1u6wmbxM8T1y1+Qefmboza8f2gI3p7zfB
	FAXlZ3HG3VDUNDk/X8wjjKsWysXG/lWMWrfqBAy9IRD2r7G0qsHyR+No3dngEdnJ
	JnrVqJ5+iyS9oj5Oanrba4e1NG/oZbdzuhoWullrhhT3ycj1nj5tzOMd08vYb4+6
	GigAr+zUI2L+yfyIovDMQy/OGKhE0I5rr4YGYf+PWb8kublFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793592003; x=1793678403; bh=gncsxwOxdzIxepPD7LeGQpejJVFwj8dCdQz
	9R4xpCMo=; b=rzQqew3yw1DvxkOiDszkMy//d8C90r5LGDsoi+QVIgEYaGOgyrU
	1ckK4U8et4g6YMlPfFHj2tW5vhaPdaQmayjKgdLMhknol+mIQGBCD/flnD8JgBql
	MkWQvk50LAs6Ct//T79U7iGxAYxfuZVk1Xls+q2fesWCvfdmXuKzOglZ7b31u72m
	5Q2Ig6ETo5W6f84PS70lOflGJr6yFJeaBcAaaE7J42rYKJbKkUgQnFNWW06/MDCm
	9N/LKyQ7+hTKKRU4Cpt3HTyCmAhlxiN+KE03fkZC5Rej1cn4JBDAyri3M29KziFF
	fEfAzZA4wvMIxw4JAVdk/zXhAoqLymKyYzQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793592003; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:Tqz//7PfOTDl3pxobOAD4l2bFWke2kjrwZHznsmKoe5fvDt
	NK5KlLzuz5/wb7QVeFGuomPmyv2YXvNqBzJKaCTZbtwY2T08naa8qC641NGY/bnw
	rnp4EoRJf1N5ppSVyYi3P5suCGEBF/L6aQptpasiYxvjXurXa46deD1U4DBxxqMV
	EM7J+QVUfhqA7yRL0m5x+KN2OfywQWdt5yNSGJ6xPh94zIKURafL08F3vh9I4t8S
	V0WRHaAHeT9WTNDGRdFDgoGzQTa5uy788+pfUyKePqYUQcvQ8IIFpArYi3vO6ZDZ
	7AUs/rFXQgC9DfEuEcM7R1qe9PvkcVudTCilutQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:+KcfsUXN/YwfNwTjKuT7VWcDsfHqeljGgjLuvNQOzKA=:ZZpd0dsrq1/URa2LFXFA2hu1SK7Q5VhT6gu0H9BpfmA=;
X-ME-Sender: <xms:wgroagpr3EtdmmaH0mKLjFA8ItrK5R3MhpaJRVR7GNiNzzygVED0Uw>
    <xme:wgroan9ADkzTcOrtHUe4UCjlM81vEbYQt_wZH612V9mxp0XH7t6uh2I67zuMJzkYD
    ZtFgAipoX5dnokgSZZfT07YLsJRG_eHdxkCwRFpSVCynEOb81VWyP8>
X-ME-Received: <xmr:wgroap2URmJPxlHYEHuOTNa0hDHen1tF8An6BVwpHJqx-d8peYnNQ_DlE3C40Op4h__kTUgtkf8xKdgY1v0>
X-ME-Proxy-Cause: dmFkZTEzRXtRiaTAd4mGyeYqv0SnP4pmBnK31j78JtHP38Kn6jQ6IK4qBMU8wakTI2ax4s
    1mG1U9J5X2+Dh/br1aF8IoylDS+c4sb2RUAxBKpsldoSnvDbhNHYNTTBNL/zoGmfn/9YT0
    4NEQbOtLrhOvh3NmjHWq/k4gg41pTmQ0P5UD9YmL9xfuv+jDMZIGfK1ZW0rHCaJeFct/6i
    RjOfFfbrUZ73ItmB7UYM46Ud68aYdKLDDjo/6H0Vhorg+lqvk4/x1r0FG3pFKbR5nEbbWq
    vV0T19Vc9iXHFs7HDal9YNhAPHNO613iq+fNFYdjy/Q4V/ZRThJ3F1xUdsOkDw9M2t4atW
    QrJvu4eBbGt81VwJ4+n99B1gZyOPkuu2TMXmgMPkcmPP+YksG1jrbwdMxxDpZkpX7lS7M2
    na/S29QtxAPoP8IOJ9BiYs3OTYOFIyslYiVtkMj75nV5hyBCOjEI8MUbc/ILdllNsw/4jY
    B03zUJuLxFixXfkQ9ArXF6FJbgeZKSlS5n6b1A3eVj++cFaDmsajeJVTVXNfQlN0dMun99
    Hsc1m+0LgzxveFm6DLNFqkVp/nPSAxBvy2dd3eXYD9zkbaW68VIN1keTnvhW1+kfmZ17lQ
    z2hvJXDsie8CvsnFP54wzptGlu5WkCgotmyJUOPL096t/L9XGkWr7pckyVAA
X-ME-Proxy: <xmx:wgroaqn8CRPONngnsXL1mrx5UQNlULbcf1rCvnkCBRoLGviaGO4g8Q>
    <xmx:wgroam0HMtSCbS5ZPiHqNeV05xwluSAIC_6iNfGFaiSEgTnylapE5Q>
    <xmx:wgroapje4cUO3eP4KV0floCqMaQSfRaKE9CQG_X9iet0EG7K-dMgIg>
    <xmx:wgroakWaBgjtZ6rp5RI9NRFZD_nKn85Yw3QMzdMMQnSRUxwR6IqTIw>
    <xmx:wwroajWmY4vkchsR1J8T1PPlb2dP1QhyL7BufpVsE5n-prIYBghhqhk6>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Nov 2026 22:59:56 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	lossin@kernel.org,
	lyude@redhat.com,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v9] rust: sync: condvar: use Delta<Jiffy> for timeout and result
Date: Mon,  2 Nov 2026 12:59:34 +0900
Message-ID: <20261102035934.711973-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

wait_interruptible_timeout() takes the timeout as a raw Jiffies, and
CondVarTimeoutResult reports the remaining time as a raw Jiffies. The
type does not show the unit.

Switch the parameter and the result fields to Delta<Jiffy>.

Delta<Jiffy> is signed, but schedule_timeout() prints an error and a
stack dump for a negative timeout. Clamp a negative timeout to zero, so
it means an immediate timeout.

Update the only user, binder. It now converts the freeze timeout with
Delta::to_jiffies_timeout() instead of msecs_to_jiffies(). Both round
up, so a short timeout does not become zero. They differ only for a
very long timeout. msecs_to_jiffies() returns MAX_JIFFY_OFFSET for
2^31 ms (about 24.9 days) or more, which means an infinite
timeout. to_jiffies_timeout() has no such special case. It converts
such a value to the matching number of jiffies, so the wait is long
but finite.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v9:
- Send as a single patch. Patches 1/4 and 2/4 of v8 are in v7.4-rc1,
  and the workqueue patch will be sent separately
- Rebase on v7.4-rc1
- Drop the comparison with enqueue_delayed() from the commit message
v8: https://lore.kernel.org/rust-for-linux/20261002050428.2746277-1-tomo@flapping.org/
---
 drivers/android/binder/process.rs |  7 ++++---
 rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
 2 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 1f4cb43f1de6..edde0ea35687 100644
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
@@ -1552,8 +1553,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         inner.is_frozen = IsFrozen::InProgress;
 
         if info.timeout_ms > 0 {
-            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
-            while jiffies > 0 {
+            let mut jiffies = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
+            while jiffies.as_jiffies() > 0 {
                 if inner.outstanding_txns == 0 {
                     break;
                 }
@@ -1570,7 +1571,7 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
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

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

