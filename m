Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E294399D3
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757092; cv=none; b=n8maorocvvINAZwHu3BDifWjiwTfRA5OLq1dj4Ox3pY+mK1/IxqRtWIAsKuj9KWfbwA+n1l3zge55tZuaZ/1EsvzViuvKMKFN+KAXv1ARhVN2b7OwfS4EnlelZDkBTySIMaAgdM/8zO+YPM21bsDytdbThyDHu1SDuXAgjbqHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757092; c=relaxed/simple;
	bh=74oXo+urqlpIlvaHoSVuRQQv33xObM3eYsBk3lIexhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bF81ZYC3UFy/Spk6SH/lPrSg+ROFKzD+yrvs5ElWTPupsHxf7TubtYNU9uzPEWQim2lWu6sNrsw0CYRXJzxYkOZoGNApJJKtXJuyEyyD9HXA+LKvcMrUAzHAcB5Jw1iEI69MJ+LKc5Qm5izyqzRusG276bKvaCln2XlMaq1cVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=XRPbkLeV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IGDjgUgJ; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="XRPbkLeV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IGDjgUgJ"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 0012D1300153;
	Wed, 22 Jul 2026 17:51:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jul 2026 17:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784757088; x=
	1784760688; bh=M18QPOMPxPN0ZiPf3XmQUeFTbhHf8Fgk2rpCMPjbcnc=; b=X
	RPbkLeVAJwsbrmlC5TxdNy9ecwoWoIOl8lC7BuH8ChqIesGJxd/bW7eDC/zEcgKz
	Miej8dJWaCpgaZMcNW6cdq0qbBySJd+wbNCtDHbPaCZFAHBDtD0nQVyPTnYWdK+E
	XV1t+wjUXBPZ4attOB0+gb9CsvEMkD8S1Kdig47Mnl7k3/CwYy7b49SyYHLK8aBS
	sACk4TmqMOaGym3mAmZNra99lSnvZzn6LHSQekNx7XSqSSyn+XOwnsrLEbxsc0mY
	lhXg+g5LFtpLDMxlZKE/aW9b6oSCmzaOurWZpGeffVXoeHswpr4tYyGImOUakY7q
	GAlYNOF3GOvXzHOcrHGHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784757088; x=1784760688; bh=M
	18QPOMPxPN0ZiPf3XmQUeFTbhHf8Fgk2rpCMPjbcnc=; b=IGDjgUgJQ41qZTtDQ
	e9JVPydHuk4+K5AptmOmQyOjJQmqtzPMD5174kjY6iNU3tqRsLBhMgQpdWThamqg
	V8SUgbVmPoXI996k4WjX02FpQcuOnE4x7heIcspJBzY7t3EmgA9iFSyU86eNsfiv
	sylQQMujL0mO5/bm7o8bLyXTmeXChfJMV9w9wf1xOzXNHT+zcZG0Z6MkngFqhGDE
	PFuTuSJNOaFI4D2r9iTIbohjhkm3xa8dxhrzrKnHJsMNq9bZ/B5wHIn8BWoDtXgx
	x/KPTC0BWfIJQKb30Yyfjp6/GnezJxs35faVqUjJdbeTEyFCOt97+8AFtQ+4lnC5
	bwdvg==
X-ME-Sender: <xms:YDthapmxNMxlF1S-eCBuPbX0Ws-pRlY4ykYFGxlBxkUqlF4axJv7MA>
    <xme:YDthag9DrQksYaweBrO12nOriex2ZLrEVVXqrx9jxtlhl9FppQ6_RD6Gy4R5rz8jg
    ktn_sGJ1Rr9ae1Bg1xLq8uq7l8c7U8ZGf8xDAUHcEQ42gIRc00ggZU>
X-ME-Received: <xmr:YDthardTI8WCPxTr2XXUkHM-2HYluaxHv9D8N8AFCArSJBqodBn-23Yk0Rwfef1XPhCjz4O6rN98pTxGYQ0>
X-ME-Proxy-Cause: dmFkZTGuoNy9B4Nm4eUiSt/VO/ZwmCQP+pc5e41if9fnwGdZOMxeWyXy+Utey7GravQTWS
    muAn+B62eren/+/qU3EjCcmq1A6Eqv/2TSGyUXtamSBV1XbJXh0burYHMsiltX+K3CtEff
    Wco0eXJKyhY0hcEwzWNRu2xlxwLsydcKZzw9PWSXF6a5FRETjsjcJ2OKj6rTuDQTgABHtb
    ILguifJG57tR2Wc7xaCTnmZVRe6QvnD67FskWzmUPI2exQarWI/gxcbziaEnx1ptUC9fe2
    5uCFs5iP9pgb++LyH7dLUYB5glPYeF9nYP1PyEK9FtB8D5G90yfpz901nPJyFMuBsApRuB
    yrTZE3GfoXSzjIPEFEv9fPTbZXbyGo2Xfo3ME+oByJgJYCvL6KzKQQDxVddrXmjVr00rnz
    MjxsG7nGUOkSBNutVYZh7L25leynATLwK+pRuw8au81kHbKcX6TopGKEZkMozn10FjdRCw
    cTUVqyAkouStwyX0TVtpD8UGOM5+EjN9j80R8uc3AZ+jT30Xm/d3Re0+h7zuYL0sRul5B1
    WKSm6EB8JUTscPzZVkRL/RBplpEDpgDfNWjBia2EXs9Tbcef/h87TpBIFQffGp9Hb7lzLZ
    4pWbIkDU+TqHtLAbmTFIb/lG84rWCk7voBCDvVbxchgFJIKi3xMCZv9baarg
X-ME-Proxy: <xmx:YDthai6qUR-6u2kEK5Bwlb-AgeD94wMBRpVBtfPsMrMn_Gept4c8MA>
    <xmx:YDthan96EXgtodStLiCu7Dj9Sa_B5iaIzL43SwkmvEdBDotP7kBGWA>
    <xmx:YDthasw3Ajw1_1Nk1MEUWTcVaUmILzhlgQCFQUrwMej6qNDlxVKqag>
    <xmx:YDthauFmj-cFt05kw2PnDEBdAxAo0jFzP5qG_NBYLRhFiJsorftXxQ>
    <xmx:YDthat7B1hf-xpcLYwsOB_26k-uIZYJQC2uj8GaOckptdcWqxK5T6fto>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 17:51:22 -0400 (EDT)
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
Subject: [PATCH v4 2/7] rust: time: add jiffies time unit for Delta
Date: Thu, 23 Jul 2026 06:49:46 +0900
Message-ID: <20260722214951.72941-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722214951.72941-1-tomo@flapping.org>
References: <20260722214951.72941-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add a Jiffy time unit with isize as its representation and provide
Delta<Jiffy>::from_jiffies() and as_jiffies() as the unit-specific
constructor and accessor, mirroring from_nanos()/as_nanos() on the
nanosecond Delta.

Represent the jiffies span as isize: Delta is a signed span (nanoseconds
use i64) and, as a timeout, the value only needs to reach
MAX_JIFFY_OFFSET ((LONG_MAX >> 1) - 1). isize is signed and matches the
kernel's c_long, so it meets both.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 8c01ca62b471..20f059d19a6c 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -295,6 +295,7 @@ mod private {
     pub trait Sealed {}
 
     impl Sealed for super::Nsec {}
+    impl Sealed for super::Jiffy {}
 }
 
 /// A trait for time units.
@@ -314,6 +315,17 @@ impl TimeUnit for Nsec {
     type Repr = i64;
 }
 
+/// A time unit of jiffies.
+///
+/// A [`Delta<Jiffy>`] stores its value as `isize` jiffies and can represent
+/// any `isize` value, including negative, zero, and positive numbers.
+#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
+pub struct Jiffy;
+
+impl TimeUnit for Jiffy {
+    type Repr = isize;
+}
+
 /// A span of time.
 ///
 /// The span is stored in the unit given by the type parameter `U` (see
@@ -325,6 +337,20 @@ pub struct Delta<U: TimeUnit = Nsec> {
     value: U::Repr,
 }
 
+impl Delta<Jiffy> {
+    /// Create a new [`Delta`] from a number of jiffies.
+    #[inline]
+    pub const fn from_jiffies(jiffies: isize) -> Self {
+        Self { value: jiffies }
+    }
+
+    /// Return the number of jiffies in the [`Delta`].
+    #[inline]
+    pub const fn as_jiffies(self) -> isize {
+        self.value
+    }
+}
+
 impl ops::Add for Delta {
     type Output = Self;
 
-- 
2.43.0

