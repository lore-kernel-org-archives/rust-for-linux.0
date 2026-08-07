Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397B391832
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086157; cv=none; b=q1MaeOsUCK1gN6yABNqTESEzGcwUD77Wde110Ah43Xk9mUocBoMiFMc2WRkj8EtM7O+0lYSX6rXi2W56P9FS93FwkoZ9OgHAGko5bkxDP8639Ayg0tgJ8dxqIPBI3UUgkuhrGePAwvGLOYE5WtVLbSMpXn/TrhUcpMH5PDGtRjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086157; c=relaxed/simple;
	bh=M6+m/0c8IuZ1xZ+UnruHtoqzFvPgWzMV2K9poAY63Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExJEmsqkOy5doyTkuAOjyv42wzTn88hhwp/tZag4IcfZJllDwhMn2NGRbs/TUzFNKsXkGJzMynpAPQhLHdmggB1ztudljeYtKxgMFp/73mYL4+wNGWhzKJ/ZBzdk74eFTLjf18pc/WYxhdheJHdf4hPr74aCgUnX/qt//1UZ9Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhtS8WTk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhtS8WTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047EA1F000E9;
	Fri,  7 Aug 2026 07:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086155;
	bh=+D9X1kYa+VRU9yRO4WbCcrFIABEuEB98nxaJDGa/Hfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fhtS8WTkQfLEhFgeD5UbV1gqUpcGm7Rck9Xg4GbEBUiwXXLjWByeI2p/1vTmnlyk5
	 rmHecua1jdZ1jLwdz6CDBfjSeS+MlzzOy/3vdPqFBVDLRSI+vQW8qW1QAIQs5mXzPk
	 hyVHTTP29h/DSn7bC8uiBVEOZN5zWUvO8x7A3bvlPJNPe79mQDTpZb7Qq3ZgsHXjMN
	 Y+v0wsEuYkdiUoqXQQsG1HT6UayWsa09wAmAczPJwSsTQ4pJtNBKy55vSIXHJD2psE
	 91UoJQsCviribBzMfU6CM6I7zr7NZNKNQwpdlG8reNu3PES/b/g+HOOK5qyY/4TekN
	 NvRFAHJngoOyQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1D774F40066;
	Fri,  7 Aug 2026 03:02:34 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 07 Aug 2026 03:02:34 -0400
X-ME-Sender: <xms:CoN1aicGDXkFj08gORGawGs8A5SVCk50IFlwWwWAR1iqqM7ZdsZj2g>
    <xme:CoN1aoJnSwWZvvNPjTyv4boTYL_lWncsGJulimPmtrAGN0K1G8IIfAgzU5Fc6wmJy
    2BmSMgESD4hL_BpX0iUOzQmNCNl2FQo-db76J3rZAaNEg6ZXwMcOw>
X-ME-Received: <xmr:CoN1app60-p0SKCV8jfHD-FHydc0FKR4a5hwfSZSkUhkK-hxtTDCCmAL0WPhWWtBQoq3mTcxD0a6agB5NThqHkbjWWhj7ZjW>
X-ME-Proxy-Cause: dmFkZTELT6mPBN+tf+gYDjbmfxF2aJuNia3fHRbo+cksodwgHpv175RY/La8br7LVuLKD+
    xpTrulxkYenRUqjuFjoYpWp5kB81fkgSYs4cUOn9Aimg2+sWPDBZPSJD0AkLNVKo9ymnEn
    XwkNJDHucJ7KY3ALZ5VcWOWe5XHuNtoJV5e7Q54FFSKl7KOd+nrEm1L6dR4Jdu+LjwwV/e
    gMJ05NqNZsVzzu9M3eDFzAUAJPeoh4s2jJHbhIzGNi7DAZxkNRx1H6hWOvNKjwmDuMbW1g
    3/Yvg82sjVAOqgIP9o+xyvh3ddqbO1HSSPQ13n3n5YTt3W/2pxiARls47VLAs4X6PdSfH0
    wdndMsJjTG3YJRTfVWddIDNZEXa2Bgy24oJasNFwLCsCmNNPB5bcP4ECzegpNSkN55J9mV
    54kuc4ywcJYNiK5PAZKjnDCH8/7Tzihy4t4YMlOJvExlSntHmz1c5abnQTysgytqfLPvr3
    F1BM+stAcS5QFoQYc+VO1vaSYyDRN4bdNDI9WPTy92hQW+dDm5dkpo1JrYa7mx2RlkNRNW
    HSHXJLwSDSd/A3V8AOMBbzzZAJLaC3wP8E9ezecoLNy9FRACV5Elze3eicAW3uWjrqUFfT
    vZFyihjZvqAVMC9xMdlJiICUo/VsYo/BF8DbeoEjgt0+t5CWKtxDWWYDDdvA
X-ME-Proxy: <xmx:CoN1amVoz7BnV8QrCaTdKBqPU3aAYVFqrqsvWfPvT3KlktCXUwANrw>
    <xmx:CoN1as3j9X95mjZ2NlD6fwhA8UbWERZAMuRuAhoGbuZbh9g4r6Fysg>
    <xmx:CoN1av3HgMqkq6PxcEs3MdqH3SxWlOcwSFv8iRIB_eNo4dQ-1ZSd8g>
    <xmx:CoN1ajmUXfqbuVUKLCXOEtRN6qQGQv05KepeOFwGzup2LmB-SePjvQ>
    <xmx:CoN1aoPpqSET_frww8JpGHRchi84HhYrr33jCroTwgS4EEqjaW_lQ7em>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:33 -0400 (EDT)
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
Subject: [PATCH v5 06/18] irq: Add KUnit test for refcounted interrupt enable/disable
Date: Fri,  7 Aug 2026 00:02:03 -0700
Message-ID: <20260807070218.27144-7-boqun@kernel.org>
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

