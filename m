Received: from outbound.ms.icloud.com (ms-2003f-snip4-5.eps.apple.com [57.103.72.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823FF3A75B6
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Jul 2026 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783171677; cv=none; b=bwPZq9svanzsS43LkzXZHLbza/+NEzhmFXJgw9zRhZChdTpfEj7glEAP2DWvRerX5dTntt+cpfXE3qfeicGWVnc5/wSmoggjpzqDRl8YtELlmAEVgfmRBDk68GzcQZXJICtdX7Ak6AiM9iTdDoN+GHGXh/eD/V+C9fNd5U1CrIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783171677; c=relaxed/simple;
	bh=cXkQwUNGQScvrk9qU/VKUg8DNn5kcdcZbQzuWNBQ5ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZEIMgcYKhjY0+f4k/SYPtz9bC9hkG8IdVNHYQ6Z7Bl0tggIGeMm/HtDKk5RLvri3nbGfAlPG+vpVrp7MnyxOlCH0LW//URBtak3OQPtBWD92zszSqB82yHCYATkwZnWXPm1xO2BzLCUwxo3xtf4s599tFQz1Of1YldfMKM3Biw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=vJWkffok; arc=none smtp.client-ip=57.103.72.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="vJWkffok"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPS id 7F1B31800103;
	Sat, 04 Jul 2026 13:27:51 +0000 (UTC)
X-ICL-RepId: 019f2d50-657d-7034-bfb2-66e60741d076
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhNAEMFXwBeC0oCQwZfBlBcHA4ZWAZdMFgUWgxEAlwXFxZWGRcNVk1YFFoMRAJcFxcWVhkXGVFNC04TBVIHXU1WDUcPWB5cFBcVQENeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVSAV4KQRlXHx0DUh8SHVAcDlEFWwBGCU8DWQZYAEUMQB1fBV4BQg5NHl4aH10dVjhSAV4KQRlXHx0DUh8MUE0BQwgKCEcDTRdeMlMEXxFQFg==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1783171675; x=1785763675; bh=61TR1OaTY9lXp8Xl31GTWk4BaEAvul1/gGaHKhp8jA0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=vJWkffok+WJ/Xe1l5ULDkf3AlIMmgFKAc4OEl5DY6WIqhnhHerIbhkoEEge842nWEKX7G6aayCevzZkzL1fJ7f23tPYDQLV6BpZcoTwu7YLk79007c8qmI7cbFgu0uHBbQPqeNYyMMCbWaSBQxZPP9wn0MnaTQiHriCO5U67bjOZw8aGuTkaCnkA6chK8rsoCrBUixDZoNkkSdkjrnrPSqxRSJroYo+afKDsD7qLxvQeaq7AMdmxbgh/aHowwHGZ8gqZTgaj1ffWluzHo8ZPc00RvAs/fdzRYl0bVh3FUdIzX2CELgmD+hAqFc8+Pm4owzNm9vqlobyJyU9voORhiA==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-20-percent-0 (Postfix) with ESMTPSA id 7BD5A18000A6;
	Sat, 04 Jul 2026 13:27:47 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
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
Subject: [PATCH v1 2/2] rust: sync: use Delta for CondVar timeout API
Date: Sat,  4 Jul 2026 22:25:58 +0900
Message-ID: <20260704132558.2253275-3-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704132558.2253275-1-tomo@aliasing.net>
References: <20260704132558.2253275-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KoyAob2ZsZLfhQsYJbhrnP07TV3wG9OW
X-Proofpoint-ORIG-GUID: KoyAob2ZsZLfhQsYJbhrnP07TV3wG9OW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDEzNiBTYWx0ZWRfX/4sKBK3R/Ml6
 wYAs24NUAyAl/6Wlwwg8Swq1JIkngNpeaeMoFOrXGnJHSFWYqxjcGmk2k97In645PUspKiDWBrs
 xlBs2uxm6weYeN6jHe/BIvw9sG0vqiZ1wHpgzc9YDGIUJq9USr5fjh7DyFrVZ5QUymfrHg/GXOO
 zzWgBAQUi6qADLk9FwJJLh5AE9O7FzFBlS1LHrE843QiMCiN3893xNF0KTXbAA4GifolTkrsIXw
 1fUHDn1wlOEWpk5wyK+Hywj5gQJw/J78+7X4nV9xSG+r27io23Yq9Cu8xpA79E7yB7qyVawVEc4
 NDiAoFvZRIQwPweeF8c

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

wait_interruptible_timeout() and CondVarTimeoutResult take/return a
raw jiffies count (a plain c_ulong alias with no type safety). Callers
have to know on their own that the value meant jiffies and convert
to/from it themselves, which is easy to get wrong (e.g. passing a
millisecond value where a jiffies value is expected).

Switch to Delta, the duration type already used elsewhere, so the unit
is part of the type instead of a caller convention.

Use as_jiffies_ceil() rather than a plain truncating conversion: a
caller that passes a nonzero Delta expects the call to actually sleep
for roughly that long (or return earlier via a wakeup or signal).

Update binder's ioctl_freeze(), the only caller, accordingly.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/android/binder/process.rs | 12 ++++++------
 rust/kernel/sync/condvar.rs       | 20 ++++++++++++--------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 96b8440ceac6..cc693484489a 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1468,25 +1468,25 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         inner.is_frozen = IsFrozen::InProgress;
 
         if info.timeout_ms > 0 {
-            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
-            while jiffies > 0 {
+            let mut delta = kernel::time::Delta::from_millis(info.timeout_ms.into());
+            while !delta.is_zero() {
                 if inner.outstanding_txns == 0 {
                     break;
                 }
 
                 match self
                     .freeze_wait
-                    .wait_interruptible_timeout(&mut inner, jiffies)
+                    .wait_interruptible_timeout(&mut inner, delta)
                 {
                     CondVarTimeoutResult::Signal { .. } => {
                         inner.is_frozen = IsFrozen::No;
                         return Err(ERESTARTSYS);
                     }
-                    CondVarTimeoutResult::Woken { jiffies: remaining } => {
-                        jiffies = remaining;
+                    CondVarTimeoutResult::Woken { delta: remaining } => {
+                        delta = remaining;
                     }
                     CondVarTimeoutResult::Timeout => {
-                        jiffies = 0;
+                        delta = kernel::time::Delta::ZERO;
                     }
                 }
             }
diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index 69d58dfbad7b..c94ae83a583f 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -12,7 +12,7 @@
     task::{
         MAX_SCHEDULE_TIMEOUT, TASK_FREEZABLE, TASK_INTERRUPTIBLE, TASK_NORMAL, TASK_UNINTERRUPTIBLE,
     },
-    time::Jiffies,
+    time::Delta,
     types::Opaque,
 };
 use core::{marker::PhantomPinned, pin::Pin, ptr};
@@ -186,15 +186,19 @@ pub fn wait_interruptible_freezable<T: ?Sized, B: Backend>(
     pub fn wait_interruptible_timeout<T: ?Sized, B: Backend>(
         &self,
         guard: &mut Guard<'_, T, B>,
-        jiffies: Jiffies,
+        delta: Delta,
     ) -> CondVarTimeoutResult {
-        let jiffies = jiffies.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);
+        let jiffies = c_long::try_from(delta.as_jiffies_ceil()).unwrap_or(MAX_SCHEDULE_TIMEOUT);
         let res = self.wait_internal(TASK_INTERRUPTIBLE, guard, jiffies);
 
-        match (res as Jiffies, crate::current!().signal_pending()) {
-            (jiffies, true) => CondVarTimeoutResult::Signal { jiffies },
+        match (res, crate::current!().signal_pending()) {
+            (jiffies, true) => CondVarTimeoutResult::Signal {
+                delta: Delta::from_jiffies(jiffies as u64),
+            },
             (0, false) => CondVarTimeoutResult::Timeout,
-            (jiffies, false) => CondVarTimeoutResult::Woken { jiffies },
+            (jiffies, false) => CondVarTimeoutResult::Woken {
+                delta: Delta::from_jiffies(jiffies as u64),
+            },
         }
     }
 
@@ -248,11 +252,11 @@ pub enum CondVarTimeoutResult {
     /// Somebody woke us up.
     Woken {
         /// Remaining sleep duration.
-        jiffies: Jiffies,
+        delta: Delta,
     },
     /// A signal occurred.
     Signal {
         /// Remaining sleep duration.
-        jiffies: Jiffies,
+        delta: Delta,
     },
 }
-- 
2.43.0

