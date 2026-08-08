Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A9F37EFFB
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170558; cv=none; b=oli5zSa8mb/v0qMkq1KktVtcJv1VtHAuoQRJHPlTsLdCT8dB0R3H9QH7ZRNevLvJ3rZjVf9odv4TaA0KvLOxUyQEGLdK6eV/r3pyvw9GjiePJe08f0viRLc+/spvCp1Y+2BNMHSwYqeZ15lY5/6Zm+YRUmDGey3BuDOVLqAdTxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170558; c=relaxed/simple;
	bh=E4KcG3ktG/1GXn+zs7NazLflEOsln9uwx4fR2ITVoAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNzVvvZ0dZCBIsu/z958xTmhosnPCQR9USslJwosp6VsCzS28KYuMy23Aw8kzz990RF+LEP3Qdx09M4ja0r+PUCjLmlnIlRgTWIQy8n0xwTSL0lW/48wWLQnUotiOZlFn7uPQ1ZCD+Vkn+aNa4rNMw4bAGVVdfoWZ7lYglukTFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=OKOIhaR0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DXSrIy8K; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="OKOIhaR0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DXSrIy8K"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 9110C13801C5;
	Sat,  8 Aug 2026 02:29:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 08 Aug 2026 02:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786170554; x=
	1786174154; bh=j0IhwqtK28rrP3EPOoZw0ICwwg2m/mfDLa95HXwnUAQ=; b=O
	KOIhaR0mcCJu0yBgVu458gsAekRP8vQf9w78MIpOWHRhYgIyo88lpsiiooIuMavX
	+wtSFLrO7zDPTGFQXCnyOklANEiXwFtFQGrgsgOkfnJkB6LXtXtII9SekV+PyLQh
	vKq7+6TpPr3qLi3LcCNkOsyXbCtLIwEjMcS1WBADQEikoXY/NQ/8hBTFniqDYyXc
	OQbWYLVbm1obQvMOBe433jRJt0O3QMXEkYyGH6NxPmhcEVA+Nlnm4v4BUhVI2C8I
	QfUKA4b8v8b76E4guoNa/M+wm8qW2D7lB43X3vHQ491JZy42/Hb7waUgfilttglt
	zDbPuxLWRwQKPPcgBXkMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786170554; x=1786174154; bh=j
	0IhwqtK28rrP3EPOoZw0ICwwg2m/mfDLa95HXwnUAQ=; b=DXSrIy8KA2LMS4JFO
	qwJUX57AFiXLMg4eqG+UHyKywTvUI0WSZ9FYU9YLRoT9+mXsQEe7oxgdDtiCCCQE
	ywL1GkjgHsetTEk8BDAdSH+k7LKSToQslh60+IO6Ag1wn51z94JlqkPlkZjVl46b
	j7mA9TJ209unwOf3v/WLpJ1cDkU5L+QCqMCyeaM2h+29ZPjQP05vJq0wSxrtPInl
	JEncyLG0pn4EH9ROohWp5ZSzsnj130mvjN+SqQeb5xTetNywOfYepVftAhydicWF
	gEZmMdyEDf8u/bCB8P6cGtZ0mwf4APXFNDXN3xlvuVG7W+nRXwEJzdJpjwJI81W1
	UDKFg==
X-ME-Sender: <xms:usx2apVVgPDNcmebVz_2HRkFAQZsWE0-cNbDr0xMK3MnOWJdMQS9pw>
    <xme:usx2alt9hiedZMdvTSJfBGsyMAU4Fp96GcSFiKwfbdqnoj_C8m6aeseC6vu5tmitQ
    3kk8QHNT1-eoqYnAflofmFr7IuooJHYF-C4kwwuSARbpKtgNLF0Vbs>
X-ME-Received: <xmr:usx2ahNuEUu5pGTWXa5bAAw_7KsdUQ2xVQ14Js0bQm_h3yu7JCtwqrfuxaD6vN00uqVSBBWJB8bouBjuxCE>
X-ME-Proxy-Cause: dmFkZTGPkp/tjUF9QhjmhubFpVsEJiLyXpdymDQrM8aVQ3kZuefEetQxeEW0ZOf4RrEr9P
    LsxjTKn60UCLD1q8TGml7nMYQgaOZD6UryIwVsYw9c3jQPw69RG55VceGwySH18w/RXixP
    9ALHD292JMWwKQ2E2TR4oVe8cE/VF35DjCuy8p2zkKeBmUj7k5VChHrMhTMNGL9/0k+flN
    D/XO/y8C66ZMkHzR5HQRnvxIGNJ22YhihAosFjsscruigf2Ki1At7aI9+pPQrR08nl/TLi
    2PNvSDjqxzYH449vkP95HWg/wP5kxHrjdUvNcOiDpPYzwspfXJSX/omV4B8zmmoEMc26Zv
    vLX24LGSBV36H5wWRj97YN7iJ8xf/SNCxjytY7odHWtXiq2VdhGePPqWfu2xvsZUraqm8t
    7dctc1yLLv4qIFqINP4iZ1n+95G3sfFzlYh6vnXGILaVTpgg3g6pTNMNDlNwZPCVO7UVFQ
    uGOZW+QevpT6JPeBVKHMeQu34REMjHFY1f3sBiabfwGnhP6gCXMywU58HR34lw0qOoBqMT
    fPbHwhkalLF459I3HRamOT2CjMrqf+LdrXcQZLSfr5AgVYvwADrCTGx17BIS4LBBdvCZm8
    so+UzY6lw0XS+dvYcunbFJBMCJF+o6qXGwSPiUk3X1IfJrnjFJFh3lFhwxoA
X-ME-Proxy: <xmx:usx2alqLMSb_ghwbkgXuoL4xGddxIFaeairYMlBHyaUQZmRlY54Ryg>
    <xmx:usx2ajviQUa9aaMBIeVrfWYeR_FhWsL0BTZKTf3h2lgCxrorqtpbCA>
    <xmx:usx2athKIS1K6cd-yGm1wcUplL-RBfX6vWiNk10-XJEMx3FIPN4muQ>
    <xmx:usx2av1K93MYGtilIAIKKVR-f6rPcom87Ditgc4gI_8gJsrAeCBcwQ>
    <xmx:usx2agMBYT2dEuuhGcKmtWYo8ywb87R5kFvX2-Z4-BcGzV--UAyG0oFg>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 02:29:09 -0400 (EDT)
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
Subject: [PATCH v6 2/7] rust: time: add jiffies time unit for Delta
Date: Sat,  8 Aug 2026 15:28:34 +0900
Message-ID: <20260808062839.1159990-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808062839.1159990-1-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
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

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index afe35759bc15..bff72a4a0b0d 100644
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
+pub enum Jiffy {}
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

