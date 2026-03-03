Received: from outbound.ci.icloud.com (ci-2003f-snip4-5.eps.apple.com [57.103.91.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45E3624A3
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 06:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.91.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772518229; cv=none; b=senRSwnyq7ADUfHV0Qld56NBMI0RPHhutQmS7IUQB7t1wNFmTGkTsjO1cVSNXJEyut1F6J81dQOnXx3d2uOPKJkjTGzlLfpRQqorTuHtemYBVWBs79o+iyV3EQRltzsmA4V7grq6+DXemZ/Ndg6OGp7nenxThpTRV1mv0q7Jet8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772518229; c=relaxed/simple;
	bh=3awracQBqBPZOls3F739WOk4JaMIWyd0MKXB7bN16Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sLpoatvzB3Frd3yiSojrJ0Y/HKjjQmo6bCm7Hr6EOWOl/rFcuZkZGRDqRjQg8f5lTuMC7QTMjshWSpfFIeBuWYYMmJD4nGwPWfzZUa/G73nW4CvpwRAbPNe6t2zJERqkfZaMQRpHd5OZ6Eu2L4XgLtMq9A0DuLsVWwW8UTPNAQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net; spf=pass smtp.mailfrom=aliasing.net; dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b=saVY+c3q; arc=none smtp.client-ip=57.103.91.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliasing.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliasing.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aliasing.net header.i=@aliasing.net header.b="saVY+c3q"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-15 (Postfix) with ESMTPS id 4B25218000A9;
	Tue,  3 Mar 2026 06:10:25 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliasing.net; s=sig1; t=1772518227; x=1775110227; bh=Tsb0Pln2qQ3FXj3SHBz+RTL/BdHdrL58+gjvsi0htvY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=saVY+c3qrgfmSLhbAtO7WmGP4mS5d7Hyh6vv34f6LLa+me0rh3czsL+9GyW8WDJ1aGCcH5AcOwuULuNhVZa3YvntAWDajmfTX665meSM6L2qsd5iT4OT8uSNgjOmeb32b0UBJZB5vFfWUM7tagw+uTU8nlx4wo742W/WjGL4+WTFc1qniQ8rWpHGiRklmdOdFoDyoLhQOjthFKBi4qSA23GZ5Zvo3W6J5lN4O/ph7ZlGEGC4FsqhyK81EL0Asp2iwNJW+DSbXVy+nh7dZFhzcJ0el3NptBhHk5v185mGStwczDnjW/bmG3z7/wJcpKTu64casDLZcgqewOJAlOa5rA==
mail-alias-created-date: 1769500909675
Received: from bee.. (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-15 (Postfix) with ESMTPSA id DDAC4180020D;
	Tue,  3 Mar 2026 06:10:21 +0000 (UTC)
From: FUJITA Tomonori <tomo@aliasing.net>
To: a.hindborg@kernel.org,
	ojeda@kernel.org,
	gary@garyguo.net
Cc: dirk.behme@de.bosch.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	frederic@kernel.org,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
Date: Tue,  3 Mar 2026 15:10:00 +0900
Message-ID: <20260303061000.73970-1-tomo@aliasing.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Authority-Info-Out: v=2.4 cv=Madhep/f c=1 sm=1 tr=0 ts=69a67b52
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=h38X0v18AAAA:8 a=pGLkceISAAAA:8 a=u2gGhAnWh_5ohZzoCfwA:9
 a=hjDv5vYt9AxPTMVfK17q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0MCBTYWx0ZWRfX2sDC+SytSXwk
 zGagLnfWUfyuOSOTnjirJKRw0ewSheBhgTngeOoNRoXijhXWistPPeD70FrcMd8pFL6/OktpBem
 K6JlBeExQoa1ccEF/d+paXzC9jJTquChAR41conAo/BAd0chnTuP4D1bwU09SR9DDQkHfRvqghH
 BNUigmTnYH1qReaohi9b8ac4nBVk6e4YiyXDjwnnmW9emTXbNIT2FhON3ht5+I6KgLYf+s+gb3F
 3l453Ir8cvNQ48RdgQb+2xAXuni7zWB4DVOiZQIYVE7YgRfoHekffoCozFbkfozpgskRSyAjwLe
 QQoY4sSHvniRifOfaNZPEuwnzFF8KplWC5Ne1FpHrji9zhJ31RatNcld+6rDC0=
X-Proofpoint-GUID: -4jutrMGhcYLnmn9OWUL-6hXSKRVVg9R
X-Proofpoint-ORIG-GUID: -4jutrMGhcYLnmn9OWUL-6hXSKRVVg9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxlogscore=525
 spamscore=0 mlxscore=0 clxscore=1030 adultscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603030040
X-JNJ: AAAAAAABKEYT2ZhrUzzDBOcGOvu9urwJn6kDVw41fQ78d0OjEOBHO058Yu4prLGgfDEP0I9Mrp/NWrsSyZ7JafJO+ALE6Ui4X0DLfILrsFBRmi6VzvpvpXyh8aNH/ibG/tcjDQ/HtGReV6dD32yzulVlJOUUmcsEZCuc5rnglZms6L5RRh2r+8TfROyUy2nagN3ZZy1FCJigQbPFh2ZnVwExbdwHWbS5R+i8UQlkLVqctxx037ETKjZYndWU7J/nxAaFow2z3XrO9Mii30tvsoLR1aCjhP+K29ylZgy4N4hwdihFDludMpcFFXC1/sxXHESOkY7Y5oYjtzYzM6m8yjFXT99W1CTtxI7OcmAm5c5KH0ICS+m/Ic2MJMggp/S5JlufrGtHSzPMbQ0778Rop3sNqlHzCN5L+3eMQ9HT6hskCBUfpTfUzCFDjLwNma0xgFS79673wYys/yyIJLmmv89FeQembXBCAVObp5Lf4slO0X4iL3cP8V7kK8cVcVSQgcgDQymnTjnqKU4ZhcxjT1SkyQjGki7+fTlUPOSQ+T7B6ujIDy+AjXIHClKIH92OHhixyxOpokvtidaV/7sD6MVkRaUX9NEBhT3F47GR0ZALValVNyYEghbTnskpVznty1lCeYVfAaqHBurgwk1HDy747AeXzXPvRB5WaNyqQs+opi0iZVqzMyLoMd4o4VSvxQcMZ2yTPyULsSg05Oh71BtiResTlcmSonl0YmqD9//QGvf4XFQlw1RYL6TvrddQJTLJb0CJoTpmlENhNw/nUWr8sPKr7XQT2Y50VObGROPOs6D+X7zxTr6D9BD73Iw4sAEzBk9tlUYWGmX1QS4aGXyOuzW6Fs7W

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

HrTimer::expires() previously read node.expires via a volatile load, which
can race with C-side updates. Rework the API so it is only callable with
exclusive access or from the callback context.

Introduce expires_unchecked() with an explicit safety contract, switch
HrTimer::expires() to Pin<&mut Self>, add
HrTimerCallbackContext::expires(), and route the read through
hrtimer_get_expires() via a Rust helper.

Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---

Note that I will send a separate patch to remove
HrTimerCallbackContext after the discussion concludes.

v3:
- Change the signature of raw_expires()
- Rename raw_expires() to expires_unchecked()
v2: https://lore.kernel.org/rust-for-linux/20260224132507.315637-1-tomo@aliasing.net/
- Add Fixes and Closes tags
- Fix and improve comments
v1: https://lore.kernel.org/rust-for-linux/20260110115838.3109895-1-fujita.tomonori@gmail.com/
---
 rust/helpers/time.c         |  6 +++++
 rust/kernel/time/hrtimer.rs | 46 ++++++++++++++++++++++++++-----------
 2 files changed, 39 insertions(+), 13 deletions(-)

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
index 856d2d929a00..a4aea06e2c2d 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -224,27 +224,36 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
         self.forward(HrTimerInstant::<T>::now(), interval)
     }
 
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must either have exclusive access to `self`, or be within the context of the
+    /// timer callback.
+    #[inline]
+    unsafe fn expires_unchecked(&self) -> HrTimerInstant<T>
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY:
+        // - The C API requirements for this function are fulfilled by our safety contract.
+        // - Timers cannot have negative `ktime_t` values as their expiration time.
+        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(Self::raw_get(self))) }
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
+        // SAFETY: `expires_unchecked` does not move `Self`.
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
+        // SAFETY: By existence of `Pin<&mut Self>`, we have exclusive access to `Self`.
+        unsafe { this.expires_unchecked() }
     }
 }
 
@@ -729,6 +738,17 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64 {
     pub fn forward_now(&mut self, duration: Delta) -> u64 {
         self.forward(HrTimerInstant::<T>::now(), duration)
     }
+
+    /// Return the time expiry for the timer.
+    ///
+    /// This function is identical to [`HrTimer::expires()`] except that it may only be used from
+    /// within the context of a [`HrTimer`] callback.
+    pub fn expires(&self) -> HrTimerInstant<T> {
+        // SAFETY:
+        // - We are guaranteed to be within the context of a timer callback by our type invariants.
+        // - By our type invariants, `self.0` always points to a valid `HrTimer<T>`.
+        unsafe { self.0.as_ref().expires_unchecked() }
+    }
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0

