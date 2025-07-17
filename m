Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A220DD75
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Jul 2025 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752777701; cv=none; b=X8lImV8Xw2g3hxNcYhrkHQL8ePH556CC2wXkIK5iCEOIWDT45HhyT13ou77cUt4DJLaM2KECVUJoJSm6SX3iXHH7IRAlOhwfqVkCIvaHBFD3hADzcCKHXAFo5o45uInn2R7AVaPN5F+/eMJtFSgV127mCy1w50grupIE56E+V8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752777701; c=relaxed/simple;
	bh=ofWZ1Qzc4k/LUvMp2rHzwA5a+a9hlYXcr5xkMSypWJU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqxF9xckpdTiOpJPhcWd7HHLPyMs6V5/1X3BR+ao6lZjiLD6DJ1HuCW1lqLJIhWH7xTGd4bP3drOJ20XaPyZ93ZNC3OcLFV5bvhG7F2fKiLnhQ+nj0aTpKCIXDnq5SVNWZL6s/W3K37DLA6CnGl654ok30294RNSPbNyY6hL28w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BVRJX01h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BVRJX01h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752777698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dau2hKa7kErg6HbxuM6qegnuMlniWBUutgH8V/lAlUA=;
	b=BVRJX01hxwuw5MK1uWpOjX5QOhxZHVHm/qC4OzeN2BmesGffTuMh/OexlO4qq5cQ+upF4x
	rJN06SVnK1j8wpOJKi9cd6rpXUbFSX1KLDPLDV9O6H0zU4HiIKZx3GCUYhNZx0yglNEirR
	A4c/OOD4mSBoNCyxxkYA2zNumQexQJs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-ico_mijHOLimFRYYJEkG9g-1; Thu,
 17 Jul 2025 14:41:35 -0400
X-MC-Unique: ico_mijHOLimFRYYJEkG9g-1
X-Mimecast-MFC-AGG-ID: ico_mijHOLimFRYYJEkG9g_1752777694
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D61F1800283;
	Thu, 17 Jul 2025 18:41:34 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.66.69])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D18F01956089;
	Thu, 17 Jul 2025 18:41:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v11 04/14] irq: Add KUnit test for refcounted interrupt enable/disable
Date: Thu, 17 Jul 2025 14:37:56 -0400
Message-ID: <20250717184055.2071216-5-lyude@redhat.com>
In-Reply-To: <20250717184055.2071216-1-lyude@redhat.com>
References: <20250717184055.2071216-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

While making changes to the refcounted interrupt patch series, at some
point on my local branch I broke something and ended up writing some kunit
tests for testing refcounted interrupts as a result. So, let's include
these tests now that we have refcounted interrupts.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 kernel/irq/Makefile                  |   1 +
 kernel/irq/refcount_interrupt_test.c | 108 +++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 kernel/irq/refcount_interrupt_test.c

diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
index c0f44c06d69df..dbab58fe59ee0 100644
--- a/kernel/irq/Makefile
+++ b/kernel/irq/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_GENERIC_IRQ_IPI_MUX) += ipi-mux.o
 obj-$(CONFIG_SMP) += affinity.o
 obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
 obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
+obj-$(CONFIG_KUNIT) += refcount_interrupt_test.o
diff --git a/kernel/irq/refcount_interrupt_test.c b/kernel/irq/refcount_interrupt_test.c
new file mode 100644
index 0000000000000..8fe938db2860f
--- /dev/null
+++ b/kernel/irq/refcount_interrupt_test.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit test for refcounted interrupt enable/disables.
+ */
+
+#include <kunit/test.h>
+#include <linux/spinlock.h>
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
+/* (init and exit are the same */
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
+kunit_test_suites(&refcount_interrupt_test_suite);
+
+MODULE_AUTHOR("Lyude Paul <lyude@redhat.com>");
-- 
2.50.0

