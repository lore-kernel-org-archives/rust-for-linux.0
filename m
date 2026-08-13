Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D40474261
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628953; cv=none; b=e6CBibhV9xdB5QuIeCp4lTT6BpjUK8DFTsAPOz3b661ArQ5N/+ZbGzoS+ysKq0Cc6fopFlKwukmu69hxTnchzVd0idP5ZEdbMULRuCA+pb0hlpJ1w36WduaT/dwiAInTpVUwA/8aSfciq2cohMSGzeFcQI9XB6cCiVGjBxpH8Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628953; c=relaxed/simple;
	bh=Q2bH2NG1cNeNZeJAYFABnXDjGMLXSW1AJJh0iJeLaiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H4ywLrnjh3IEm0xpttO2VN7BGNF9cOJnmx+Huqy3PPFTPwXBZXY0yao6jmDH7he5Wj/YkTO4DNLrLLsgDumlIN949CBp0cCbDAE4h6pQ0xUdV3qU8Rb9L0BDmHMXByEitqADD1TCoHlypb5SnFzgXLrPV9tR195jvbtPkw0z4eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=AtR9xo9h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AWhQGzLm; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="AtR9xo9h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AWhQGzLm"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 7EE0113004D1;
	Thu, 13 Aug 2026 09:49:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 13 Aug 2026 09:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1786628950; x=
	1786632550; bh=K9xEuPH/Jy/6vZ8VWZn5/892WSE9R3c7R5MqaTnm7uI=; b=A
	tR9xo9hX100Qsn1hktrWUjzHamihtfbKfsofkvlXdAgXays8njSnYWdfrCgAvfir
	+kgzKcIjSq3EJ+M4fwoTvuuCDXKctisjvfMHJWPrBCHQXfFU+EJiYEWTJHLUkQ5O
	gTaZlU769jzAU1kpzDskQRRnTHt5w8nz0fbn6rql61z0qUIClWA4IQXMdKHyfCB0
	/IhTDCzmaWiR1/VhcsSMZU60p8YcEeHLqtZ+ZfERQllrcZStdlqVo9YBdm+UwHtD
	fOtbXdy6x6dKTLjaHOgGdq8IudHloJO5N1CuhLtJgxSej/w0rFLbgDQkve8jwLhZ
	kQvz6kOJ4mvKp3siUMy9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786628950; x=1786632550; bh=K
	9xEuPH/Jy/6vZ8VWZn5/892WSE9R3c7R5MqaTnm7uI=; b=AWhQGzLmTsP4T6MC6
	GcgcLHTkESUWcdqHoxucSK5Dx5DpwjiZOjhFlBFAvxQIHQ2fOH/DM/9Zbjs0iYfP
	DxeSwL8D9EV/TQRHY/+YTG8ksf+XMPlS3O9rPdbdOsHYftflDEEVH8XxKTQs/AlO
	apKwZPLKVc+OD/aiE7HkSep0VcE3oKUAgHcanjELjs5nXgFJx4k2FLhP9XFEipy2
	IOPgpZuLdhleaWbrlI/+SzLtS0ieua+yq2jD49on5kLeleLEgylq3zBMSL397lyP
	QBDr/Y5gw2mXs5/cb2aOsUaTcLz3us4PUC4/HZ6ctxxPlWaOupE7ZKqpZJNVsP3/
	zu5hQ==
X-ME-Sender: <xms:Vst9aiXCDfejludvW3mG3Co-QoRx2w6WYbMQfKwIoyqvf6FyuuWocA>
    <xme:Vst9aqc2aHmo-DIekUO3CF3iT2eDWYiIBNtene07xFnfcZVtMlhfidzkQa7_LjLOo
    PWh9T7tSYvBGO8-jOnjWsjUsfK6e-MvaZxmdBBxaP1oQiJtMiDjeIEh>
X-ME-Received: <xmr:Vst9ah42gY82X1KCacITC_tJO2jhQgVxaXQmwgIZ3NjgF9kD5sko3q95YcvCLSGG_B2bzue_I4XbgXLGMDg>
X-ME-Proxy-Cause: dmFkZTF9+qeFgD3Ub/ObX5dw2JHcjNj3yUaai0Sbsvm/KfEPdnGBDRpG1TAEunNPVraCLj
    kYswY5zIUVBZS0P6vISBKrCYYHNZ4EUTGQi/PbmOKeqv1kiIO3ZlFeQn8L8Otlqg9q2RV6
    335Ki+rs7SWcVS2oZHvatKljSk/jU+Ppka06TvihgUFdRYnpwd7WPgI8AWQPzjfvde6hv7
    /bUzoJdSRwSee6QGYa88jOge0Ct2ZotnSaIdiq677RfWDMOTin00iVbSMF3tZKxQ88whzj
    GPXFriKKIU9FxXwQkDC59IDqNmn/ZoA2slNToXlr0iPyT8yWwETi8VKV8cUooE9t44fCAK
    GlQBNNYOReATiJhP8cgHfchlly7SgxPTY0CiRMX7hLZgBYzb+PQSZdkEKdI9zj20NZXPQl
    06J8AMeGNygFT4eqOSRHSBm4LW0gArP9aANg41D0gbHFPPHd2p7fLb5K8dTG1TRoN9PdHb
    /tImj0m9z3ualaHI+N7gJOedCFcl85Ki0jWOY+UTHhKl0JfQu4/OnQnEWIeVdrI64IbXmM
    Z4EGyPFOx19n5AHTRLvf9eRgn3vGkJX/ZAZ0qddfaqc8drBUbORbQU1KuYpIL6/mg9SXW9
    s6lNU2lxUfH/6lirTQYT24G3NLz78UeygmKS68qJcjGxUFyOlNk9smaHxFlg
X-ME-Proxy: <xmx:Vst9atTovWvj6rgX-ndvqrDT2DjWNezkdEvhn5g4TAavYlhJ1XnUvQ>
    <xmx:Vst9akdT5nVc4gRFwfVm34iTi-UYU6EuH3jU6_mNyQRTfV8pvE6wCw>
    <xmx:Vst9atTVsjmzj7o_lhrzxf7IxF8EZPADxCXS7JYNFiklt9o5-Fl1mA>
    <xmx:Vst9atOkez7aDz72ftYZzquAcpMPnKlwuSWsI0AwwCNG72MjfThn-Q>
    <xmx:Vst9aiHiIQ1krwAnOwofR8oWm6HDDSQYbuUqTqYJfz-RTWUbcukpv9Ht>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 09:49:05 -0400 (EDT)
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
Subject: [PATCH v1 3/4] rust: hrtimer: Restrict expires() to safe contexts
Date: Thu, 13 Aug 2026 22:48:33 +0900
Message-ID: <20260813134834.1562995-4-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813134834.1562995-1-tomo@flapping.org>
References: <20260813134834.1562995-1-tomo@flapping.org>
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
Acked-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
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
index d94275f2e93f..59e9559e7099 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -557,27 +557,36 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
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
 
@@ -1060,6 +1069,17 @@ pub fn forward(&mut self, now: HrTimerInstant<T>, interval: Delta) -> u64 {
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
-- 
2.43.0

