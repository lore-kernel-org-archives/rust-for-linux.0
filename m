Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73213161A3
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 04:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421848; cv=none; b=L8z7HGPU6MwXTheCKhYhxO3IB0RP0xepry5paPAHP4zCO7qcovcG/PTYNhfkXM6ynU7ott3VtegpuOUnVLXAf80L6aNhDLNjl5AB10655JJq6vB5btvkRpzyBQmdXEyHtnL8+E+5LiHRS5sNFkRAlBjjXM+qn2vMA2Z17O7ejPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421848; c=relaxed/simple;
	bh=hqzDoFZ+FnJ+kwkQ1XUbPH87gH8HIR00iTIZdoqIJfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5VRfQ7ueFZYnKVyiZNX2FMewEyKN8TWNkgfWwY2QO2/rP3EtpDNXZNwaaONcc0BHqEuJw6bBxyqz9Uh7pPizxucV6dM+taH4HJ7ODG61BIpv1rkzAZ3cCvWNY/Ydp0+eog8ag5vD7tzeGbjT6hBYbBoH6SNzWRiVevwkD7wU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT9DUAmc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT9DUAmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8FA1F00A3E;
	Tue, 11 Aug 2026 04:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786421845;
	bh=7uHnXoIwtSGCT9rqIiBE0UwPM81LBEEkAOAS7zp4QXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iT9DUAmchj+8A4PxqZtXMhp8aJ+zXqpWuUmga1sg1awW/ev+sPm53pXJxoN20jXXo
	 NmAzl4WbXk/zqxt9jOLgGsBgGQbvzOGjgFikQJtt8jokjmlcbWI9Qg3+ORQk53UzdE
	 Ix8I+DX3hZmg12Q3tq4blC1/whuFkZ1QSrz36Xw421BJXv6OYMfhkhQBfOSkGmqFAM
	 OMHEkfxbC3cP4tOyE16QtqNGXGYc6zm/PsPn+Pe9OsXDc3qvDIFJZ3I1lqOvjF+tGV
	 QIZZsHMY76EBOasvqTPeDV1gxvWUuKba7mp6BUwkRiJRYoDu34VQPXH2MYkaq9p/a4
	 Oo9qGL/npLilg==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4B10BF40066;
	Tue, 11 Aug 2026 00:17:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 11 Aug 2026 00:17:24 -0400
X-ME-Sender: <xms:VKJ6askxjGhTWwtSa3EPHNthq0DESrcmQZTuvaQM1uClyfPVWSaysg>
    <xme:VKJ6arTsHsdtFI1i1UPV1dnfClL6gW1hjX9H6ENC3pCIkxgaf7G71aCZWJGBISYl7
    VAC_NGyi6_lWU989FbzTh_HXLY770wtI3aI9jNNC5WdDk4HsI-wVg>
X-ME-Received: <xmr:VKJ6aruF73LA_gsS2ajNMP8bC9O-jUwVNYS5WVCXaBMIxrpjdSE8Kpyt829A2xVl20_aDG6DIb9YgLiM5uQE03Wx52KlHJnZ>
X-ME-Proxy-Cause: dmFkZTGhPmSJ2utFx5D+CERYZNZI0lWwnPoWtdGm1Q24HJV4wHGzzwHlMIG+Ha5+CXwcMV
    A4Y9FRkPx4iKSOEUD0o2bsQuhlyU9EriC9Wg14EdheA+ghP28LE9/AWvwFlpxSSeaugzOB
    7cy4mIL1Zm7HiOC+SZefKLt12lBqjCbJwen8IDKEhCYWwgAOLbn6601jx3eoTsUn+elAvW
    +Nb62Q3PknpJ5JS/PGcU8W3OZCAnD6uTdZFXZQ5gjZYvJftgWnEBjoe2o4DqsJ8oOzcaMy
    Yz2rdDjTzptNIY6+Mw8UVdo8kkEkZUhr3Jhp99XO6QkjjOLjPFF2Am+c3dLYLr4j2hpoCb
    HCeT09AUZDGH/KNAEPjn6oIsZsPjAtM0BkZN09ohNQoIsKmXRg4SSF/n/BD7+vC0arCgdE
    AT/9krDegem1+X2rlJqyIz1UZ6tzuEcDdzGjQzC023qp8/laYcSlVYjSc00Pzq6sh8+5dn
    VQYgxDR3F0IgIxBoGEdidLgFg14Mn159pd7rj1TnzaZ9uVsJx14+VVezOR3VcHQBTaox97
    TA8jVpJzeYrODfhDSGcN2mEXLkIaN92O5Exzju9C6UQwMzpHSIPMyMX++ib5wBxiOUV+6W
    5LmFXndWVpfCNLwDJ28t5GsMxi7mu354b2C8xBddEuP4AJMxJ2XqIOMXJ6sA
X-ME-Proxy: <xmx:VKJ6as5lMMhPK5HG78_sqG0eKhMokqYrF4qJBzCufSYwWouo8vahdA>
    <xmx:VKJ6aujc3ZZmXGxMYeZ3Gf4K_faRdPaYqtgCbwexP_Iw1o0ZN0WceQ>
    <xmx:VKJ6amlOYb1GQdrIu61_ubbQPBC4BL1cl5yDRemEpWDYPQ8OtWxCJw>
    <xmx:VKJ6alvDV4BkseYcVMxIuzzSOVuJx-nKKu5naNrWOtbSuw-AtvoFfg>
    <xmx:VKJ6akBPeTTHJGhwv1nFZo0bvBbygzUTsf0ukl3bbECYszQPtvz1x837>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 00:17:23 -0400 (EDT)
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
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH 4/4] irq: Add max local_interrupt_disable() nesting level kunit test case
Date: Mon, 10 Aug 2026 21:17:14 -0700
Message-ID: <20260811041714.27679-5-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260811041714.27679-1-boqun@kernel.org>
References: <20260810085255.GE1642880@noisy.programming.kicks-ass.net>
 <20260811041714.27679-1-boqun@kernel.org>
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

