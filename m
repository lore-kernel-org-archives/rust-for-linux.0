Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F93BFE4C;
	Thu,  1 Oct 2026 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843144; cv=none; b=gCJoHYQMMz/HBSSOzYqhxXK4tDvx9yf9n0u59hthWCOtNe5lhkeLjn72o5ZpKgVX7AP3UjLLMUPLTvS9mPxXzGWez6p7kqEJdA+y2faRkiFs6AH9T87vsz/PPJb8WO6P/0P88xrTFGgiNssjnAvlM28iGpJ7LUq0HRXC0iMHaiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843144; c=relaxed/simple;
	bh=m73cJpZ4mN7Zlz5owrSkffQhN7T84WirlnCuUSXGht4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFZpwcxio+qSMfPs8hbFAmirr5tmVFFB6CkbB7HfO5Q/oBe8LXTkU7lKNWkjcq3xQNePfZQ+sc61eSWLOVHhLWg3tijGSRbnnkoeKz4I03kBf4SQpUn91n96zcRIMMcx2nzDfUeVn+nKw8m8GAwYvU8v5i1H1mTn/gxebddG8oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzQue37s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzQue37s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0561F0089C;
	Thu,  1 Oct 2026 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843138;
	bh=IGorMimYc8yudGo/nlM+T5b/HwNtqxyvYNF1bQTaJM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RzQue37sQvRjtkd2efprXkdi3lb4m6wOngu7IXboCC7iw+o/gGQa+bmTfQkEeODcw
	 bXu+MxpokjvAQ1eqD2Z5BwYggJ0QNVPEfKMw2UQI6kvGxBGn/QU4nYdg8uyjnVDLWA
	 0C9l4eq/ZEfk64zs1610QVDeSS7ayVEB+DVW5T72+27p+B1FreHkelm0Dy63EURWuL
	 5YxyPxJ3JsbyszsCWyo0Qut8oTdqXiRhgNjhxV9yDrbJ+KK3cOOsJVBoKvtaJINyUC
	 Cgi5gLiXiipJbTsf+FI8LeC4EwtJmhfxZoQybCVg23zyA8X3TgokREi21cblBhf8EL
	 IVX34iqC00fEQ==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id C7E3AF40066;
	Thu,  1 Oct 2026 04:25:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 01 Oct 2026 04:25:36 -0400
X-ME-Sender: <xms:ABm-aroLcIZh_MTfJbdbcDLLqW_wuPwJL7i5BZVRXq_7PLZYXZAybQ>
    <xme:ABm-arN5abcYS4Ol2V7x6I2WvT9MhQez87d3A8okULNLb56780D7AjPrsg3eauBWs
    CBocqizzAmA5kxjQfUE14BTi_v72qbs9l9xR0QYrDkhRp5s-bCqTzY>
X-ME-Received: <xmr:ABm-ahwrlVrm_3fTMBPDI6hrMB7bg0aNGgtZ5Lh5BmAQCo0LZ-BRM8-8rVvE>
X-ME-Proxy-Cause: dmFkZTFTtZ9e+AEXGyH/UMNFNKx7GWX00fXAsakj+PulafEHjbIKBMQx7Xnly6B3nqNRyA
    VpoObhA1Qhfd5N42FAzO0sTBGw4yFG6PnLFuaeM1bW97EfiTCSnufadyR4ojJhWoPi2Orp
    Nw2JMX8opnwBw/C+wIQG8nb1UCGojK0rMbXtCocQAaV/C59AWyi9HRGVAloGTrFNLENSW6
    18Nhy0c76z6pdAWuM1RbSN8pspZwRgkcin1hWylWhTZJTEMyJuzlL76xznqewDQePbxkmp
    OZxFI4a4FQttqB7KZKggwQOHJeTyNiNl9FbtOJ+hzXoyQwWY84px4TyS7SR9tfVXrM6geZ
    KbIHvH94ia8CfR26QJY4T2Rr/5nTh0Rn6adpiWG5UodqQ8haSj2hrGdVCb3THrs833k+Ih
    L6Y2ZyPVjQzDOjwgh7U9+utayVw+bm1zDhwMcO8zPZMGyttMtd7+vDp6F/PKgqUIjP8jII
    gZglkjO/c72+UImn1o9EjgdmiL0Xak7KG7eOfMQE2l8cOTjhSPYu8rDKhfAqzzrJfCG6Xf
    q1sytCVilNK3EgaDtkS+g9JSibu9bgBFYQQWjzbY1Gldcb8qoEocZvWZGjZmlFHj4kMSlw
    zklEdmMEGJcZuWcsffixYeWzbDlZqUWjchcV01RrGzU0tvhRIVxPrAYLzHBQ
X-ME-Proxy: <xmx:ABm-avzAlHtdR8f9Kg7LiSrGIwhr_TODNddFbQtN_d7VQOl8SwU50g>
    <xmx:ABm-aiKvBCo-cxTqx9a8kOCdwuXAiSKccqkc5YBlTcY-Do0Q4HT8dA>
    <xmx:ABm-ajhpFdrSASCMR8JuIjw8HJPbVSbO03MpPCYRw7ZrO2Vcldw_xw>
    <xmx:ABm-arNaRXf1CwINQiPiFpNLVj9kX49dfuF4gOETYK46d6vZBPfF_w>
    <xmx:ABm-am7uQCslWYMApX5nIAWRFWLnysaN7nU9rku1R9O0DWebbsA19gnR>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 04:25:36 -0400 (EDT)
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
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v2 5/5] irq: Add max local_interrupt_disable() nesting level kunit test case
Date: Thu,  1 Oct 2026 10:25:19 +0200
Message-ID: <20261001082519.16195-6-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261001082519.16195-1-boqun@kernel.org>
References: <20261001082519.16195-1-boqun@kernel.org>
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
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
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
2.51.0

