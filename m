Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649CB37756A
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900449; cv=none; b=Nhwd54m0nD1yPqFTC8JFed20I9C51AnfrHohKJrKoxIPL11vJ6qX17xrkATM2rd1/44TFF6BNa4wy7ObYVwmKG/QtLZZVatoLNiakkXdm571JxcHJAwAGHOr9L6RhNvKzy13n0mfMG1vqphoaaX4hbAYxTMx67vgsUA4JCxWnlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900449; c=relaxed/simple;
	bh=cXkQwUNGQScvrk9qU/VKUg8DNn5kcdcZbQzuWNBQ5ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGuOAzv1de8cn9EPpRCr4n4DCdtR4QBOsD5tPlFXotO5XptzNG26p5xl4jSSGuvlkTh8aoe2A1ZML6T4ePAhcpRtIIPwuJeAhdTRIpYyfQ2dADrjnE+oNy1gyc9K5cJx9rpoqlE9nzQ79av1IahC6hUbkzK+U/XFFcX4kS+TeTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=GIO+YBcJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=USJayI2E; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="GIO+YBcJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="USJayI2E"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 98F081380277;
	Sun, 12 Jul 2026 19:54:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 12 Jul 2026 19:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1783900447; x=
	1783904047; bh=61TR1OaTY9lXp8Xl31GTWk4BaEAvul1/gGaHKhp8jA0=; b=G
	IO+YBcJ/TCnBZJWnkGjptHUsFyRQrbmg7gpcYCVZJAT1WJ/zbo4gBxhSHdOTxSuF
	xbeWJe2Y7+Qo0iM6VSw1+9ZC3vVUBAhxegwDIR2DffZ/O35NpFuqm/yAIwKvQTUr
	Tln5/oz3SNYM6STRZy3xWwMi5YZe/DDo2I+3MRbZRNMXT8c+a4ZR4sQbF0q8hFYP
	4lMuunpqb5h/ShaPFTs9hfE/uw51GZkjms9lreflsxgt7HmaNzcWF0uYFJ7IQBCk
	z0RgGURZ/T5NknGyWyx/UgpF8SFVJYH8vxmfFbvdD71o6Cl6ibs7Sdzm+arUoKKY
	2J/mLSUna2+Tg6OwCYJZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1783900447; x=1783904047; bh=6
	1TR1OaTY9lXp8Xl31GTWk4BaEAvul1/gGaHKhp8jA0=; b=USJayI2EoyoQXcmnE
	VHQCLnUfpauNifUdLbSzHVcrmol63P+4GvBqDpDKs1rb6fwl7NA86fcBgja91Z7f
	b6k6X13HMKM7E3xDsmCuV5cleoDKBWT8hqyExZF+m5XcAWyUYiWR+5st9vb8ymzL
	6eMZmIy+XdgipiEDR/1Tk8RkzXlVNpZBbD5ThjRcQ2mr/PZFUvC5aohXRgZ0Qyjy
	OjpkD4Szi9c7Z6dlAGTkavt7D93Co6KOZm/3MR8VfpiQXvMCSQ4ngAnxQ+HkYaHC
	C78EO3zkXEZJ6XBuGRZUNgycTknIsXbVeUFtEJxL+AX7E4Mj/UMUWp+hNnAvp5T4
	MtF1g==
X-ME-Sender: <xms:HylUahIQSMi16-_qsvCSg2USKeVbr30rPKJk7JGTFh9-KLRKr0XEDg>
    <xme:HylUapQyWcoDFw78bDYDv0vorqUSBnDEGBYaGoUVJX50qFdYobVL1-gwpMwVwEEKM
    Jrx2Sc-jcGH-aPrKbABidUTAyv_2tb862cSAkQdvfqObHEd2UDd_n4>
X-ME-Received: <xmr:HylUaljNJWx8_bIYK6U3ONMJgmGHPhSDtHlbJ-02lc_JEICmzOnqg3RviQeJlvCD2uI08utYC6HB3XWs6yg>
X-ME-Proxy-Cause: dmFkZTGNFHVZi4u/+ximQc7vEJp7TLrBn6NdggyCR75nwP4lnn477LaQt2vTNxg8hsGca7
    RJR4BnKEWso28swF6QTYuCcrY+KaqPZeHXGdgARShj6G69Cwkwvroz5iUFhhkqpjDH8ygn
    2R7Bg4/4SLVd/Fltf0G8trNRrxTl7enWCkDBUgeC/y3JAEOxOg1aLWKKPOuZeNZrX7ePKa
    z/0mFRD0n7+ClAVzs/bhWfRh5tMSIfyIGMOEO58FgkrbYcgfOzLfYR3OT1jUWu92yXm6q0
    UmextV7aVIxRpJuxEvOWLlhZdaetPK9Rsp5bc99pTqzgTvOgNsZA70DXklwY7kiIuX0Jam
    MOUUJ3Px+U8oik/7T/z3CWWRL8Rn22ncScks4RE0slMXDnjth6dJOyhQsDQ6//qScQ3w4g
    hpOgjmXJAl9qZolKW63Jy1m2IhN9CG/eybXz41zW4v2igr4ALAm1J1ZKvTP0mONxMV53pn
    CvsCYRJfDKiIosfbx5XIsEZxE+80Q+/ncoscET0gYxN8LiJf3r4L2xjJExnVKqg7UhXx2x
    pgr19/45hSF4YD2CZaOD7VKF4GuRDCKBE6Q8NX9+sYyFoVSbrEo34XhItzjIef1RAy7heL
    +kjPvfn3/TIZeinD8PCOX5ijNFHSOE53OW3ro7pKPNr4QsIqgmzkSpHVupbQ
X-ME-Proxy: <xmx:HylUarsZEjN2XHd9Mwn82LRDT1RWG8lLAiVTYDa3gtAbPhr60ecm8Q>
    <xmx:HylUaoinNeGciSu-LLz8nr_pNENQ4-w2Zr1TwnYma_oI76YIncHZZw>
    <xmx:HylUaqF6K9PG36qDP86n3eUMhirD1FqsWIn9t-W2hfoTtJype36dGA>
    <xmx:HylUapI5iKiuLGrlp6HhUclarYlbPHNC2fjcVGIcDwukpMDt2xo7ng>
    <xmx:HylUaoDPA30CUkLYPS4iijEQt1c_Cd3OgQZQkbqxUO9EfvXF2_2oAWWh>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jul 2026 19:54:02 -0400 (EDT)
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
Subject: [PATCH v2 2/4] rust: sync: use Delta for CondVar timeout API
Date: Mon, 13 Jul 2026 08:52:44 +0900
Message-ID: <20260712235246.3069713-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712235246.3069713-1-tomo@flapping.org>
References: <20260712235246.3069713-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

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

