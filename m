Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE7413797
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786145457; cv=none; b=iMFTlMhg7wFjzYvH8+3N5aVdiujclhROOB4vW9qNh8+bX1Kn+dAYX9g+vssk2BUY7djI5eKzlcqgk8p1awNb7OG5JnJ1HG9WeNCD4KT3ptGZRX+sJtikWAM8dCPPEwKWDt0DA67kDWjY0DIhk6mDlLonfwK3Rhh3tp2moyPjbsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786145457; c=relaxed/simple;
	bh=3kHYL9xk6gKusikR412tfQcB+DYU/CLbq1KfCrWDh9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7fjLtd3KKs+20alWDE+E8+MjdWpI2Tx8TDPevpIB7zPFhc5L4wRIdMrv7PpN1QbzT2KsxMg54ZMT8cKiwC+C8jFjYxMcN8PpRQzlqiElcaSdufqylJFJMqsJ5fQIjG5t1CrSUi1oaGP76QLOFhN+Xg87ZKWnPxApiR5woS+sqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=jDU5DVdk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N7PwIstb; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="jDU5DVdk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N7PwIstb"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 6B5DB13002E7;
	Fri,  7 Aug 2026 19:30:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 07 Aug 2026 19:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1786145450; x=1786149050; bh=KdX/+SdC/VbZWtzwNIyD6
	JjCkpuyuyAWJmrVchSEoqE=; b=jDU5DVdk3O6T9ZEzfK1MySnDsU8FUD9ZhG4oO
	SXqTuWG1YusA/zio+iebm3b6JbZ5KkcY1jrCDS9XkjI6idFFaRaZv9D94FVeuyFQ
	cfyne/MjALHHHROjpM5cy6S2Qv2lMykORL0SnU7C1bsGpk/QGWZMuMiP8Wq2CIAS
	prvCPyPsh4ONv5SyyzKUcp8HtDcGKi2bjkdP2dytEdmOkYHdaAQyDk9Py3aFMW4F
	jpAByLJKP09tuQx74mAGXm6zfgDlrLOyUytwUveF+t0rjOgPKIkn0GLUWTJijWRm
	WgQRNDkc45T2XZVyoTckQwxHvJbMUnKknPCNDdfBoInuBSolA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786145450; x=1786149050; bh=KdX/+SdC/VbZWtzwNIyD6JjCkpuyuyAWJmr
	VchSEoqE=; b=N7PwIstbGU9TWzkQpl9+5yh10hBzda6Pb5gTJMMerUivHeoIOQk
	w7aiZW5XwxcsXWSwrnoP+bQLksSxCfilOfTDkTshSkC4L0DDNY1x8DAMNoilsqg7
	QHM6iNk4XpgWpWmMHLhcF0yx4Qj9fkdwW5yW9vPJDICU/D0ONvgWQF+0UCttHlxk
	V8imR7Y1NHrl0ZE9jNJrKwE4gn3fMxBOWFLtkLufwxJc3+CmYAFYF6TIk+EBj2Xr
	wU7sFebnzwdtmWRMaxS1kuqOcboY4Z1SDs93rGnQmipP4i5din70E+qBagE1vGfU
	fk+oZHswRt3mrnwlqTuv18gPd2IL5zvRN9g==
X-ME-Sender: <xms:qWp2anE1EgmrieU34Osp7QonPiiR5w_nhIjWmmUR8Q4JPeB2n05MrQ>
    <xme:qWp2agOW81ak1HK5xzpv-FkK-MBoLslgVBvds25K0ZpOQkL6wz-C1ySdFPHXAVUa9
    AKNJlkYbkSpWOCuEp0KRMoChA_SW7SWT6SwA_6VX1Pp-UhWdMmNsBIW>
X-ME-Received: <xmr:qWp2akp4Vcz2pIhn1nvRPXxk00F5_v-KivOS6XoMFeJ_2uHB4dO3R76PNTRpUgvuMyayJbvgSSIb7Yy-Jo0>
X-ME-Proxy-Cause: dmFkZTEGj6voEhhesnIAcfnVpyCar3Cq/47FuXF1kkH71sdvM6Cc8qNS5SgGWHrD8MokHn
    J1saKNulmJZq0McdkWrlFw1yKLDzjuKoL+aGkX1qBQRzDXzwwuo7kqTn0VaT/HHXQZmRDA
    AJHJlCaYkdlYwgLI1xXfE+0ncN2Eb2tHWkZ7VBRBswa/g3vXd8lvJQLkH962pvopCjGqT/
    8n05JF3+EpVohYkyMcTHlt2xhLEJxvJUTBgNDnuqDGig7fKlGBKfQA52DNRY1M3QdbxO9K
    dqItuBJSejGRFJd1OjeHWs4dlxI1rb1Z1ECdPLe8FCkXJknjEUTATKRQq5Cq2rDguHmGDG
    l1Be477fP5Q2+bQ0oL+mZ43XVt29sJQrDuNf9asqgitxd1aRCZyfF/bBByNau7GpHx78th
    wCvJLCOTaKLjg6brHcdoQVmR4lWcWNakHyIYTxRsIleS2BVykxOps8cJz6B48d+x02WiFH
    wXxO8zXxHmPpEByBAvRV9ixzTo6ZMjxPR+ih/93mN9jOKebjwF/uiwprUMKOiU3witWGdc
    QjcDI0O86QI6fymwOI6duJfuPn6RBCtGTYDEQBRg3K41Bfr+StfjXKcJwZ7+IDMyhV63WM
    n9vTOuvWBmTz4WzKRuThl2sNQnR4/ABV2GJSvex3KFsAXyftpF0o16h+DK5A
X-ME-Proxy: <xmx:qWp2apCdIS7KdkpoB9rZ6zIHZNX2of-dervGJUdpt-WZ4yGMOi6XRg>
    <xmx:qWp2alMvC3Rv3QK35JJ89KD5HfvnJhWBNCpgrao10pi2NPsrNMJoaQ>
    <xmx:qWp2avBOJ9CsyOXqz1UWa9FUZKnyX0qM-_n9N6_iW1kUqj3cZAy6YQ>
    <xmx:qWp2ar9dsuCdvihrPzl3gMjyKF1NAstbpnB7PieTTyH5q_YTyug9Fw>
    <xmx:qWp2ag3_XgDISjeraqUzX28XwNq8JcqcoTsHYwhuFi8dgQfxtv2hv77t>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 19:30:44 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
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
Subject: [PATCH v4 1/2] rust: hrtimer: Restrict expires() to safe contexts
Date: Sat,  8 Aug 2026 08:30:38 +0900
Message-ID: <20260807233039.1091842-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

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
v4
- Add a patch to make HrTimer repr(transparent)
v3: https://lore.kernel.org/all/20260303061000.73970-1-tomo@aliasing.net/
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
index 2d7f1131a813..1db84cd4cbe8 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -560,27 +560,36 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
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
 
@@ -1065,6 +1074,17 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64 {
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

base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
-- 
2.43.0

