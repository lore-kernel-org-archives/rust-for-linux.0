Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7AA37CD41;
	Fri, 31 Jul 2026 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529854; cv=none; b=J2+6nvDtLN2pUXnhWXxknJBIXIcezMTjQ34eD2PdyqJSg90g7jXbHL+JahKg8X75MHWw1kpvqjfmCLhIG4rNoWYEZS9uaWWRGS5szoLtDDDqYibghLfkFF2ysbH8sFx96u1QbMSRprbOJn46i1So6TNKSkGSTlNMEzm5t2IEwTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529854; c=relaxed/simple;
	bh=bGbp7ZAovMFSYOk12em7HB3rK+s0+f5BMcq+64sn+xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVmCXvep9dbvr0ldzwNLW0fFEFni7a+xUCK9OpDKavkgsVX8abrogj4EpJvEoPbgGfUp8ruk4ywY+KgRS/6o+rfzeI0YgN/RfQKzRIcsMGI87wcQy9F58PdrxqrSz0df/btsJmQNA+JHjHzvsqHffdO1MSDUCVDuPEU7c4odh24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N18D/Gi/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N18D/Gi/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437231F01558;
	Fri, 31 Jul 2026 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529849;
	bh=5OPx7quzXUSGt6ByZC5s4NaWSZlJv3l+K0FTPDFDBPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N18D/Gi/z4RcA+Ro9K7tMf1Mg9WDD670V/x6FLoA7JndmUFsQa9QVnFsXT2e00Wgw
	 jaz+nAg57XF35M4zVSh8kM/rUm7eIDw3nnrIoDjf7rrrurjKKO58lNbBL0+mC/G0pq
	 h9+Bt4l1LREMs5Jp+30VFpUN0b2Kbu97TJuS8JclmrOrgCs3FADgiwVaU+j2EBdxUi
	 /WJLe84/SeYFgG+M2YlNSqxZkaqnPVHoKM+7LzeoV4ioCzjjdlbKhpVBNaEhE5r7tt
	 JF2YKNkyPhaGqxLB0CZ0bJsdJ9D3FImiKxmkEMcoAOW/7KKPK151X27x9d1MJcbpgZ
	 KjnmvBh+9AmFg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 71BD3F4007A;
	Fri, 31 Jul 2026 16:30:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 31 Jul 2026 16:30:48 -0400
X-ME-Sender: <xms:-AVtagYS5Tj19CTxjoHfRPoSrQibYSyk0aktEtf8dADMT7Sr87CRQQ>
    <xme:-AVtaglYwgnfEYXiXi3jjUuL3nrg6PpARZIb6HYm8Puu1yaUs--7RpTtAuKyC815j
    J7j3qjBKwUW7IYNl-Yk-GCz_KG78gkgPwGiDMTj1mop5kinG88t_A>
X-ME-Received: <xmr:-AVtauUZjthHzavuW0ouuD7FgO_m_FIJrFQAtCTKrWcDi3wN6belQlqO6Fo71XghhNZnxF1mjToaKD3uPOoPIYdkYrXWNb-P>
X-ME-Proxy-Cause: dmFkZTFdRdBIF8ZH/aPs2g1lRw7GATpB3kPZdHQ9SRq3TCfYELIaqSZraFLrXlLQvfZ+Zw
    L2FnPfSJd952oWr+y28mIfAsYcvh2g32U0J8iwTV49f0k9Q8hXOe/2BgVhInUEnjhmC2lX
    03vYTAlN0bq9NjF03uLbRgPGL4766SVn/XbgM9h+YDdXpmZY+TYoTPsYcygLFMbtetKCiX
    MKKxau189OoX/tBJGac9kkLntk5lYAb6ORV5iOKO0UE2KpFdBfn5cZVhjAZINCJF+DQAjd
    IJX9TqJvKbTOKjLKBWundtWMSfFqKbkgkDYizysOgKGZkbbhOs1gMmPcuy0Gf54a13j8cR
    pRoCl8cr0A8gEDTfqmAcSL6gX7sjXZrmC7yrKNjSu0IamfpnIG/9xd76hqh+6hv2ROKCsD
    swFhlt6jYTOmO5PBxXpLgRjGtqh360dZxELLjD2t4JwnvE4QfrX0eD+EODi97V2rgMQros
    w0a+jIWhVLYesU1viaqj28r8Tml6H150tNPJMql9EtjA/9lQKhPGKQj3wj4oizPjHPeQw5
    gG0x3cF9AUb2rVeEPZnpg31lekXFlpABqMhF/36zkGwg47FDc6/7SwSRa2HZZ3OwFELKbk
    SbOI22rZQ3ZUArwpqOq0nUZn+tIIRH7CM5TEPtzGjPGJZYtJ6zIzeRABtblQ
X-ME-Proxy: <xmx:-AVtaqID__IxbG1QaSE939eVmzpqJhBs_soak-h2_Cw-GWouiRgPAA>
    <xmx:-AVtamurq0vkZnE9Spp60g58BU2nobmhZqrMwf5fDvaksslS6o_VLw>
    <xmx:-AVtan2enoXHZcJmUCht6B6sfmhDFi6Wgnf1M6oaMpbdGuV3vy9F7g>
    <xmx:-AVtamNa5SpjaCJ3VTKhzGgByjahpc1TAN0I9d7geq6eh8F3fC7QnQ>
    <xmx:-AVtavWCVQfXcgSAS4IECh5WJ88cHos1lkWjs25XwG8mqddcBUuWOCow>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:47 -0400 (EDT)
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
Subject: [PATCH 06/24] irq: Add KUnit test for refcounted interrupt enable/disable
Date: Fri, 31 Jul 2026 13:30:07 -0700
Message-ID: <20260731203031.13679-7-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
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
Link: https://patch.msgid.link/20260121223933.1568682-7-lyude@redhat.com
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
index 000000000000..b4f224595f26
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
+kunit_test_suite(refcount_interrupt_test_suite);
+MODULE_AUTHOR("Lyude Paul <lyude@redhat.com>");
+MODULE_DESCRIPTION("Refcounted interrupt unit test suite");
+MODULE_LICENSE("GPL");
-- 
2.50.1 (Apple Git-155)

