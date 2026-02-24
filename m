Received: from outbound.ci.icloud.com (ci-2003l-snip4-8.eps.apple.com [57.103.91.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6B396B9A
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939726; cv=none; b=SsRBMabIU44WmIrHJaLtbrnIZQtnpL4cQIE2qadpriDGXsaNHg97jhSoiWNlASVeQ40MTEErp8KgE4t3Dyjuw1OfM6HstgQ4tImrlpAg8vF/TgdYDpSEtNGAbZ1GnCLHOEgsWxiWUz/Jk3RyPatN86Ky9aWR9AC2ak8iZPduWIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939726; c=relaxed/simple;
	bh=lIqYJW8hkUMY1V1F6d7O3lkHqk0O6MLa0qzb2h4D1Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LXWjUb/nKVtbXPeqy2g8tUbFq7UNhy63GHfNGuhEUwZvlGFpbXzEi0wBm8WHsS3HwpNKYuuWDFWVFkTIXatRHrhHiacVDOlLsCQdHvn31lyZ2LKpUNSDQmFijl2uJycaQxqvGvL67qIO+XJbd1t5WN0CQs3kiLYTcGtdmSwLjdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=CA5kd3RH; arc=none smtp.client-ip=57.103.91.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="CA5kd3RH"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-0 (Postfix) with ESMTPS id 04DF918040DF;
	Tue, 24 Feb 2026 13:28:40 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1771939724; x=1774531724; bh=uDzSpRQnsKZXpRRhVqrNUhwqNU2mSRg29QHzKyqO/sE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=CA5kd3RHLI2N+VGmGMoz3G7Ji38fwTwcub9xcRQ3GGEy47Gr4PXDlnrtPsEGYvL3RVtqv1WOd2+yCDCaoJ3SXNcp/vD8kfoFODaQC2M0hrv1MNnHxmBQtCdWF+z5h6YtiwY4A9pEE5eOnLMRRbIytkupx+GjECdknCGXsT/6KW/LQFTNZcGYnkevb3+oxy7CQAe7Pq88LHctX3pJd3ldz/1Go3n8Pg1sVD+yRsM/n0gjI6ijtZ7bqBpsMV8UsGPdrmMs1KmOr2xmtsEwNjjITv5j66YZouwJDmSrSNzTptUOqeIrYkrMPnJkHnnXlHlw1rV913A/k/GUVxoNk6Kd1Q==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-0 (Postfix) with ESMTPSA id 6A45818040DD;
	Tue, 24 Feb 2026 13:28:36 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: dirk.behme@de.bosch.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2] rust: hrtimer: Restrict expires() to safe contexts
Date: Tue, 24 Feb 2026 22:25:07 +0900
Message-ID: <20260224132507.315637-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Authority-Info-Out: v=2.4 cv=HKHO14tv c=1 sm=1 tr=0 ts=699da78a
 cx=c_apl:c_apl_out:c_pps a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=JouNnQUc7SE4L-yjL0wA:9
X-Proofpoint-GUID: tNv4KCjQlpGfHt318xD7s-NPs7ePD8FJ
X-Proofpoint-ORIG-GUID: tNv4KCjQlpGfHt318xD7s-NPs7ePD8FJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDExMCBTYWx0ZWRfX6nZ+dUAkJ4+Z
 VolD0R35A9d58r8B7Y2MegADYJl0ECm8FF7GNyjRH+b3e+9E7C/ZFYmHD14/Vm/36z1lmWbfH2B
 GX6cB8ZIZtxMLYmnwBXCfY0OwSdcYucSk+dqqCDXPuglGz+brL/6GW0GpHlUPXaYqCwwJMveDE7
 NDj2EdwZtRLjIxxUQihTICtvxB+n+B0ODPQHzG3Csy+wmhuQGlqhQLFv7R8/3ukTBLdaFgVdZfV
 /JoNWgqyqt9gfH74fTd8+urYNq4DZTZl3tbWIQB76xnMlqANrwuhLIHdSXYC5+ejBkVb/f/gxvA
 YT39R3rEq+hHNULBFHwW7O83CxvEcPlD4w1/RSaLyj/TxwNHLIdGzrVYCH0zWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1030 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=643 suspectscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602240110
X-JNJ: AAAAAAABOokSFtlCtm3dqW22CJYXtOmZvtbkbBFyb737xVzJa2Uwp1OO0kEM/oam1lW8m1nABrUZY9Oq4Q1wdHvcNZn3j/9u1g9yFSUPIPzvVDMYG6EfnFLXb7Gl60/ohzjoH3NmfOC3OZU3MbAyWiY9gR6sZYe5VPpBa9NTVzAVAGNfbu/kzG3PNwNywhCayUt0R4mOuvKbc/11H1hsta1Yf+pBs3USilEZ/BZ4IO57Ry+qf2C92q3Y8lGCoieF4pHGl4tFZDk2JeUndBhJuSY+0X5KgZkAGFwDWPVC+CMO9XgAFeD+CMdQ1p4YnjAgHi4X63liZahrm0HtXHPWq0tKzmPCPDbmIRUl5VKjhBpD4tqL+iF62wjRTUTaJwVqI+nq1NWXiml6LOQPJY+NEqGO6yq064eBut/9yd8bhXRmZmxJuR/JluT9GCQwegx7L1qAkYH08P0xJ3xvNpTA3s0wWa6YOsu9b7nFniUv+YSb2K1/0IUOXL6t0SNzdcLhfdzH1n0hzfODHb4rCAP9sfAWZH2yCdY8r9Rfei2J6ua8lwU/4xiVofU6wNEUVYqFWbUtqC9MDlA/VHVhh1UvOoCXLliNLk55bI27ZUS6aHTMfj0MDpU1YC6catKslAh2Z/SZUxrim6W0sGemo6MRW5jB0vihd4K4mrzLNwAu0ETqZ+CP0VQZuWSW52C7FiaqAbsYH3ZJQ7gxwqKhLhcxnPIb9Oomlpx6/sxYPwvTHmdH9k1op4afuongROqm5BZYBQrJ9ydGEASwF97NBDFLLzQQ+1G5MXGoLYSoEf2fLABA1BBVd5F7+7PTP0JllWGhdmQt2pF7yxtQiYt6wWpnjghS

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

HrTimer::expires() previously read node.expires via a volatile load, which
can race with C-side updates. Rework the API so it is only callable with
exclusive access or from the callback context.

Introduce raw_expires() with an explicit safety contract, switch
HrTimer::expires() to Pin<&mut Self>, add
HrTimerCallbackContext::expires(), and route the read through
hrtimer_get_expires() via a Rust helper.

Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2:
- Add Fixes and Closes tags
- Fix and improve comments
v1: https://lore.kernel.org/rust-for-linux/20260110115838.3109895-1-fujita.tomonori@gmail.com/
---
 rust/helpers/time.c         |  6 +++++
 rust/kernel/time/hrtimer.rs | 49 +++++++++++++++++++++++++++----------
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 32f495970493..ef8999621399 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -2,6 +2,7 @@
 
 #include <linux/delay.h>
 #include <linux/ktime.h>
+#include <linux/hrtimer.h>
 #include <linux/timekeeping.h>
 
 __rust_helper void rust_helper_fsleep(unsigned long usecs)
@@ -38,3 +39,8 @@ __rust_helper void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }
+
+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return hrtimer_get_expires(timer);
+}
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00..78e2343fd016 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -224,27 +224,39 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
         self.forward(HrTimerInstant::<T>::now(), interval)
     }
 
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// # Safety
+    ///
+    /// - `self_ptr` must point to a valid `Self`.
+    /// - The caller must either have exclusive access to the data pointed to by `self_ptr`, or be
+    ///   within the context of the timer callback.
+    #[inline]
+    unsafe fn raw_expires(self_ptr: *const Self) -> HrTimerInstant<T>
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY:
+        // - The C API requirements for this function are fulfilled by our safety contract.
+        // - `self_ptr` is guaranteed to point to a valid `Self` via our safety contract.
+        // - Timers cannot have negative `ktime_t` values as their expiration time.
+        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(Self::raw_get(self_ptr))) }
+    }
+
     /// Return the time expiry for this [`HrTimer`].
     ///
     /// This value should only be used as a snapshot, as the actual expiry time could change after
     /// this function is called.
-    pub fn expires(&self) -> HrTimerInstant<T>
+    pub fn expires(self: Pin<&mut Self>) -> HrTimerInstant<T>
     where
         T: HasHrTimer<T>,
     {
-        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`.
-        let c_timer_ptr = unsafe { HrTimer::raw_get(self) };
+        // SAFETY: `raw_expires` does not move `Self`.
+        let this = unsafe { self.get_unchecked_mut() };
 
-        // SAFETY:
-        // - Timers cannot have negative ktime_t values as their expiration time.
-        // - There's no actual locking here, a racy read is fine and expected
-        unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
-        }
+        // SAFETY: By existence of `Pin<&mut Self>`, the pointer passed to `raw_expires` points to a
+        // valid `Self` that we have exclusive access to.
+        unsafe { Self::raw_expires(this) }
     }
 }
 
@@ -729,6 +741,17 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64 {
     pub fn forward_now(&mut self, duration: Delta) -> u64 {
         self.forward(HrTimerInstant::<T>::now(), duration)
     }
+
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// This function is identical to [`HrTimer::expires()`] except that it may only be used from
+    /// within the context of a [`HrTimer`] callback.
+    pub fn expires(&self) -> HrTimerInstant<T> {
+        // SAFETY:
+        // - We are guaranteed to be within the context of a timer callback by our type invariants.
+        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`.
+        unsafe { HrTimer::<T>::raw_expires(self.0.as_ptr()) }
+    }
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0

