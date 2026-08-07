Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F63932F9
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086160; cv=none; b=sSrmtdoootet5DCGQJJZYwfIakJFCoThua6AbnfeZiVL6/9GxtrL9UbzLma0C+K4Wu8d/koHvI3kn7MUh54U49JPOVGdtymCZpE5TqmM7+CYvhAR3IiFIdKro6aL5x2SoQ2VHOgNlXTtRwgzvXRbgiD/r11fLV4J6LmnWCt9ei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086160; c=relaxed/simple;
	bh=hqzDoFZ+FnJ+kwkQ1XUbPH87gH8HIR00iTIZdoqIJfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvkF/ZDwFJZA44cFBjEtqd0sES3cyrzXQyIFQvq4bOAJ3l++hWWQHMdGYYgTVzRHKJP5SON66/6Nv0vtYhSciGto6kqX56yZU4chVPaurLD5Lw322qCnmb/zbBm9viEH2/ftxdfg7KMbaVOmuIxhslsEjjz19i28eM9n3KSijTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1JxGlJB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1JxGlJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E053C1F00A3D;
	Fri,  7 Aug 2026 07:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086158;
	bh=7uHnXoIwtSGCT9rqIiBE0UwPM81LBEEkAOAS7zp4QXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O1JxGlJBh/hV9iLPY0jY9foQ/tgXlkqmGQEgVOa8+WglAjEqGp0D9pPdaoiBGsdQC
	 oN/6PHI5pgmPmJ5DVJKLqLjQifQhCL3uCAoz1PKxUYtqLVK0YJtzsiOMkMTRzjc+30
	 d0DDSi8L2a+3fr1VqhlLqE+cNwOHbX0N5UZ/GBr2ZbqWDPkue1LO5DgaSEa4jiO7dO
	 ih6uNiqdTMaAmQVfaiHJzJKPZRyqnO1z3LGrkV7a/B+bG+n7c96vHoO5kv/kPDQcSg
	 Wp+JZKtSG/MtlEqPnhp6WmtCo/U1/UF3oaxWWaiKVOmy8+nhRRI95kOVGo69yvCv3v
	 CU61LTl7czpSw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7E2EDF40068;
	Fri,  7 Aug 2026 03:02:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 07 Aug 2026 03:02:35 -0400
X-ME-Sender: <xms:C4N1aqEuU0V81YmAivgpTXz21pD5lR-iFSCkbJUo5NY4U4Wxe8SwYA>
    <xme:C4N1anpKPYjD6iSIR8-EQLl0yoApEfPi29dg5TqJBcG7jWmX-8sTY-gK05xo309dJ
    P2vnUEyvYIHZk9sKmwZkGy7BjFo_K-1JG3DceUHFcvkJHxs6-nwMGI>
X-ME-Received: <xmr:C4N1alz0b0FvdZsx_ugypD_-Z_d9oVJQbrCltPrI81rQC4-G0L3fpg0m-brE6nc1mg-EF9SKRTUs3lgV3Wv15GyDf4LP-U2r>
X-ME-Proxy-Cause: dmFkZTGyvHdDd1GzGWN1VJTYexoeLWbYipFw83SRb2uXMsYl+KFTYaUEpOTqk5K+My00CP
    NgJOi8LOILsVWSxl4ccyvtrBefkjyfVln7ypRQ+bh49utynffTDp/Bsg/I+mtxl14w83ED
    50tRYjk+o0iP8mpu+QvCT+Dk+0ekkSaH2jaUkhQ2IGs7hn31QTDC3HO568nJzP+sCzaxl0
    cNxOjeFWag8Xux4s5MnrVTP/LpOs6EV32l4U2+8ipe5mhbLBKcn8VxJg/bq9Q7Ww63Su+/
    gyrSa0CaL2q4j6exaTekIVpxNJMTqSgpye9e2bSA0gixFi8opX6xU3WPxpol6ShOOMsGZJ
    nFqkAbVEMZ00RZpD7c494NV/JTofmnieGnOaMXAmEQp5cypldMKVeKr5aDRiDSkYhlvQHF
    7FMWicd4K3e/uHkITRvX43ehpJ+8ZHYuBnJ+epM8QXIGscLq3X2xt9S8chQJRllCiHL/3g
    KWnXC3QTtIP5WAylRFy/i/nnTEAh1To4p95SiZkU+4mg7sgbe32PzSjvDo6BAcQ6kxVoAy
    OuduM26mMDNEGxI/h3C1lqWheJp+jnj9NQnmicZWRumTS86LzbGpCY01SqghpygjQJVfVu
    WFyaZPRjftJlzFaEYaqbUuOJi0HSqmGhQakDI4/IP/napRuNvInPRJHRvOTA
X-ME-Proxy: <xmx:C4N1ahNySsjoyJ50v-mXOOdzO48tGKkXH9r_5DDs5Qh0ODj2-cF5_w>
    <xmx:C4N1aldAlZAdfzCKFlm8VCC9GPDeubqEVd1plJBkCy0tTebfWx_A3A>
    <xmx:C4N1at5nNIwEcWKGSSKK8DsNLB7EJv_KB4rQPfOwgJ-6dzJYzVrRyA>
    <xmx:C4N1alJgCRkg4air3Igktj_I3Q3k70ZAYqTwE137mP3vl6_8TRvv_A>
    <xmx:C4N1ap5KSJrJJzbSCCUAsrC1X6ctlAgx11JYHqo8jM31gFwu2ymIbXVd>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:35 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v5 07/18] irq: Add max local_interrupt_disable() nesting level kunit test case
Date: Fri,  7 Aug 2026 00:02:04 -0700
Message-ID: <20260807070218.27144-8-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260807070218.27144-1-boqun@kernel.org>
References: <20260807070218.27144-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To confirm the max nesting level of local_interrupt_disable() works, a
kunit test is added to the whole test suite.

Note that when DEBUG_PREEMPT=y, it'll generate a warning which is
expected.

Suggested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 kernel/irq/refcount_interrupt_test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/kernel/irq/refcount_interrupt_test.c b/kernel/irq/refcount_interrupt_test.c
index ca904dba24b9..38dfccbaa4d4 100644
--- a/kernel/irq/refcount_interrupt_test.c
+++ b/kernel/irq/refcount_interrupt_test.c
@@ -52,6 +52,27 @@ static void test_multiple_irq_change(struct kunit *test)
 	TEST_IRQ_ON();
 }
 
+static void test_max_nesting_irq_change(struct kunit *test)
+{
+	for (int i = 0; i < __IRQ_MASK(HARDIRQ_DISABLE_BITS); i++) {
+		local_interrupt_disable();
+		TEST_IRQ_OFF();
+	}
+
+
+	for (int i = 0; i < __IRQ_MASK(HARDIRQ_DISABLE_BITS); i++) {
+		TEST_IRQ_OFF();
+		local_interrupt_enable();
+	}
+
+	TEST_IRQ_ON();
+
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_ON();
+}
+
 static void test_irq_save(struct kunit *test)
 {
 	unsigned long flags;
@@ -79,6 +100,7 @@ static struct kunit_case test_cases[] = {
 	KUNIT_CASE(test_single_irq_change),
 	KUNIT_CASE(test_nested_irq_change),
 	KUNIT_CASE(test_multiple_irq_change),
+	KUNIT_CASE(test_max_nesting_irq_change),
 	KUNIT_CASE(test_irq_save),
 	{},
 };
-- 
2.50.1 (Apple Git-155)

