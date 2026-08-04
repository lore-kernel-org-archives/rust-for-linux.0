Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABFD47427D
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860114; cv=none; b=sYXScjO8YXuZfE3TtME8hkg++a8zTWTSerGbs4S7hyGuZf/SZea9hPFGC3EwvM9u8a0wd5C6rj7Dyxt/Vrj4yojORJ0GtljPCigBdxsEqppL2EXqjcrTkpmUPHQns6UOG5JhMLkWmucvZUQKL2G8BajLhmmUFucSJXBf+V8pPzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860114; c=relaxed/simple;
	bh=M6+m/0c8IuZ1xZ+UnruHtoqzFvPgWzMV2K9poAY63Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqdSIXNIMOimvlDDZ6hOMPpJ+oSJoSfxWO0LsXN1ncUY/cnoA0szZW9vPBXXTCqcvdPhyt9B/KMH4ls9bxk+13GgVtyr6Bm4VDo2PKYNf1IWyKTdQ4h8RuauYMTxU/bP3gBMa24X77s+Ju/ShQI0GNnn6VqR1Erkgm58KCSNs2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhYcD3ML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhYcD3ML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC041F00A3F;
	Tue,  4 Aug 2026 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860107;
	bh=+D9X1kYa+VRU9yRO4WbCcrFIABEuEB98nxaJDGa/Hfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EhYcD3MLMyJ9Z+DQJ3NesGvwAetAZpiJOxtlQEsUWNocMqqgtO9WyYOhSD0czk/rs
	 WLbh7cCSLZFxrJtGwloWBD36uIORKfrfei6d7SOadPA9OICfAjeidhSwbNDDQMcGmW
	 j98te0n9YhEJIgAHCFNLKwMIpa6ReuknokAWOAd592CV0nqmBDYlQ9ngf4k13RPsZD
	 2JqfUxpu81R0zqdWGjlzoB5inFM5mBEuKLNzQDOiouOG2zSlfFej1eQp5Pmj1qa5m6
	 RLiW5MWx8mlTrzYuPVVGSmFLJal71g766QTES3y2ugGE+bHA8b87lnqNXFuv+4mZ0h
	 67VUWq4Pc5a8Q==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id B8B81F40066;
	Tue,  4 Aug 2026 12:15:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 04 Aug 2026 12:15:05 -0400
X-ME-Sender: <xms:CRByanH0xNZlNfEKircYZo6MLU8X57tSjk7MNC8r-OoC59tYp8vF0w>
    <xme:CRByapjhJezpL7XkVsxY8k78qyP8vCp9ctJL7jZB1vXVupWXwbDL5PKiS-FK37kWi
    5cQAHTBq1lKR6fRaIy4H4KUGXb4TGU7LnjANtt2DilRikRipp-RQTc>
X-ME-Received: <xmr:CRByasglWnyDFK4uuEsWNJR__yexOSX7u3XrdHbnneUz9PekcRLFbr6UvVqabg9tbMMptKsIe1Iu1YVstt3D4UNJff2ifzCU>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbf/
    yxVjFZQlSmzX0OM//kwSCAssv5Zm++y+ZiDO6tfkkrHx3qC1vS/lUGkg6f70GvmuPxRCXA
    2RoP7FF6V51YYg1YoW71QMdU7eixAukmh2RL8SDYjd9aaAbgYiMsQsH9RdRHQunBp6VkNH
    WkS5AZM+345nNapQpKdd/jCkGx3knBBJEgYopHw+7v4iOCZ1wN95THmWRZaG8pAS2tvZbK
    wSgWxDkzL4SrUZrqC8nukYt+RZA/kzUQ1AR3Ao/Ybn5qXsaCYdgooyI0taknia00dMUMdN
    v80sNR02XnPtSChZVmQjc6/dYjix2W0r9Am/6ZY+UFkfgsIhM+Kft+c5cdhw
X-ME-Proxy: <xmx:CRByakkF0tL18scWRtyH29x2eIM5qkJEoajFu8PVchJAoKTnL-N2Zw>
    <xmx:CRByaoZp84OOzRcvn1ZhDkv5aoCWygA5toR2XbsWbA67r19DULrr4g>
    <xmx:CRByavzR2pufMOhK9BKjbvlKBYY8fTBP9cQTRRRG-PulPq7qhBGsMA>
    <xmx:CRByanZh31NgzSUs2rKXD0g461JV_2-V7igyyArhrz-dKXJF8-sxEg>
    <xmx:CRByagyYqRvk3aAoN_igC0tpLZknuQYEf8iQ8b4VzVr6FggdoRhAYOJ6>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:04 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 06/17] irq: Add KUnit test for refcounted interrupt enable/disable
Date: Tue,  4 Aug 2026 09:14:28 -0700
Message-ID: <20260804161447.84806-7-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-1-boqun@kernel.org>
References: <20260804161447.84806-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

While making changes to the refcounted interrupt patch series, at some
point on my local branch I broke something and ended up writing some kunit
tests for testing refcounted interrupts as a result. So, let's include
these tests now that we have refcounted interrupts.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 kernel/irq/Makefile                  |   1 +
 kernel/irq/refcount_interrupt_test.c | 109 +++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 kernel/irq/refcount_interrupt_test.c

diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
index 86a2e5ae08f9..44c4d6fc502a 100644
--- a/kernel/irq/Makefile
+++ b/kernel/irq/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_SMP) += affinity.o
 obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
 obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
 obj-$(CONFIG_IRQ_KUNIT_TEST) += irq_test.o
+obj-$(CONFIG_KUNIT) += refcount_interrupt_test.o
diff --git a/kernel/irq/refcount_interrupt_test.c b/kernel/irq/refcount_interrupt_test.c
new file mode 100644
index 000000000000..ca904dba24b9
--- /dev/null
+++ b/kernel/irq/refcount_interrupt_test.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for refcounted interrupt enable/disables.
+ */
+
+#include <kunit/test.h>
+#include <linux/interrupt_rc.h>
+
+#define TEST_IRQ_ON() KUNIT_EXPECT_FALSE(test, irqs_disabled())
+#define TEST_IRQ_OFF() KUNIT_EXPECT_TRUE(test, irqs_disabled())
+
+/* ===== Test cases ===== */
+static void test_single_irq_change(struct kunit *test)
+{
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+}
+
+static void test_nested_irq_change(struct kunit *test)
+{
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+
+	local_interrupt_enable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_ON();
+}
+
+static void test_multiple_irq_change(struct kunit *test)
+{
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+
+	local_interrupt_enable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_ON();
+
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_ON();
+}
+
+static void test_irq_save(struct kunit *test)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	TEST_IRQ_OFF();
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_OFF();
+	local_irq_restore(flags);
+	TEST_IRQ_ON();
+
+	local_interrupt_disable();
+	TEST_IRQ_OFF();
+	local_irq_save(flags);
+	TEST_IRQ_OFF();
+	local_irq_restore(flags);
+	TEST_IRQ_OFF();
+	local_interrupt_enable();
+	TEST_IRQ_ON();
+}
+
+static struct kunit_case test_cases[] = {
+	KUNIT_CASE(test_single_irq_change),
+	KUNIT_CASE(test_nested_irq_change),
+	KUNIT_CASE(test_multiple_irq_change),
+	KUNIT_CASE(test_irq_save),
+	{},
+};
+
+/* init and exit are the same. */
+static int test_init(struct kunit *test)
+{
+	TEST_IRQ_ON();
+
+	return 0;
+}
+
+static void test_exit(struct kunit *test)
+{
+	TEST_IRQ_ON();
+}
+
+static struct kunit_suite refcount_interrupt_test_suite = {
+	.name = "refcount_interrupt",
+	.test_cases = test_cases,
+	.init = test_init,
+	.exit = test_exit,
+};
+
+kunit_test_suite(refcount_interrupt_test_suite);
+MODULE_AUTHOR("Lyude Paul <lyude@redhat.com>");
+MODULE_DESCRIPTION("Refcounted interrupt unit test suite");
+MODULE_LICENSE("GPL");
-- 
2.50.1 (Apple Git-155)

