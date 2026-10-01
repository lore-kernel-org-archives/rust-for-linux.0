Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FE4248BB;
	Thu,  1 Oct 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843137; cv=none; b=V/dNjiAqLy5qYOMWWAF6ume4Ebw6IvZyoEznd8xzoNqDXs2XditnPFL0b5xGdd6aABWp2l3EYi8LFSsBThYUU/Xe6B1aOtG0PcvV0LMoc3fw5i7pzyGHVZtencuSpUzW6fJnew3a9bbISPqGU35qc/vDEBY1eHRUd83Rw2GaSwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843137; c=relaxed/simple;
	bh=5diiHiVmDS05dwLe7WYeKPaCu0+HCfuKD9tUPp7po7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmaugS4V8jUUtOtwpP2zqJV8Y23Om/PDnJKlsYuHcfWdOejJEuSnhexbsT9I5q7SfxJadIcYCa86I2dWkTTc5s1OJ6okqxC/Eb/rnqSffeNJYna5SxEsMCmyABkJ5BvhdXyD9r6h+4bwU4lF+4rktdVaGKCS3vvVCGsXvAfwVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QS2ynEXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QS2ynEXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F7D1F000FF;
	Thu,  1 Oct 2026 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843131;
	bh=SHLOHSohPtQG3VbyBK2TIcEgfKw6XKrtRO1iuA5qzj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QS2ynEXXiGhSfrYJWoXW3gAGx6f+xKxlnDNg0OiGdcbVjunbXkiGLKWjh4CBurKQc
	 qpllEwedaZV0SrfMI0jp3PyN3CKrnwq561oZGiU7ZP7BFWrI8yg5LcXzyDzyDWhyIY
	 I0QV20tTWu7rhY1DqSOX8QLQ0bJapleSnUKlbvR9wdLMuf6EJ6lImoogDXWJqQhp4f
	 F7a1VzPOjdoULW7jgI1UfyFsLpwfEDdjVXtWWHr4jNAakjHoP2dyE/J0Yx4m9CfpnC
	 JUSbZCGOhfuR+jeSKyhpDjNB+tp0voRmALzUq6RdnYRJ/ChvyyS5z+WPzsrSlvaIIx
	 TUFCg1RjUUJeA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5E6C1F40067;
	Thu,  1 Oct 2026 04:25:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 01 Oct 2026 04:25:30 -0400
X-ME-Sender: <xms:-hi-aka_sFTh_M5b0rjsH_F9frpW-5Md-5bz6Z6rzWMin5KsKtvOsw>
    <xme:-hi-aoygCLXn-eHzvswcFx7BJQGWYKOchRpLr6fy9q1XRl9yC-FuAufV7vl4MarVG
    ri4JOtPTvYtGAqV85TlHfhJbP_-0LtdcbpJpDXFS-_JYlKtjLRYHPs>
X-ME-Received: <xmr:-hi-andh-Q2ptGEIq0llK6ospjVNuIsxv3ajr9_rsTMfJdLnQf-PVZ_jKiEv>
X-ME-Proxy-Cause: dmFkZTFTtZ9e+AEXGyH/UMNFNKx7GWX00fXAsakj+PulafEHjbIKBMQx7Xnly6B3nqNRyA
    VpoObhA1Qhfd5N42FAzO0sTBGw4yFG6PnLFuaeM1bW97EfiTCSnufadyR4ojJhWoPi2Orp
    Nw2JMX8opnwBw/C+wIQG8nb1UCGojK0rMbXtCocQAaV/C59AWyi9HRGVAloGTrFNLENSW6
    18Nhy0c76z6pdAWuM1RbSN8pspZwRgkcin1hWylWhTZJTEMyJuzlL76xznqewDQePbxkmp
    OZxFI4a4FQttqB7KZKggwQOHJeTyNiNl9FbtOJ+hzXoyQwWY84px4TyS7SR9tfVXrM6gAp
    00IjD3/dOxXX4SLnFdyu6hJtEsEUaG5a2GAjGgjXxjx22ewwADokSVXe2HQZ1iU7848LrK
    VJpNBKC3alJf0Ga2Apd4kGi9YXkdhPLnfkduO11XU4lcYUdyYWdmWpckUcMmBNYS6EY51G
    nc2CSo0lEcO8LJQvLjUVNgVdg/wPSmcr4JgFBTy5ZIK6TWihKdIu0nmqilIGKQQZd4KbiH
    M7otyxY0csc5E2AUnrD9m92WqOW37/edue5OczruPIICYYsolSzvUjkLCEUSeObQ5qlFFH
    vjXia0LPiq8XD+k1+68yFRpO9f+2YaCukSmqnFYFTdueuxmrDHOpWfCIgerg
X-ME-Proxy: <xmx:-hi-auLnq0h4obDHMAplX2UaCXHLA9xfFUpYSPs8gBzEcJnf4Q8WQg>
    <xmx:-hi-ag3NiwLPbNxCEeVc2qX8LqFDu_PJPaClnLcRd_V_vftdyJ_bkg>
    <xmx:-hi-anbGPavXST5lUyHbdONv-C4CesihPZl7QuCFl1r8hkxC49qo1g>
    <xmx:-hi-aqgmWWzgsVKlcs7EWAwxfif-B-BJuWvXBw_be2OKFNNml43JEA>
    <xmx:-hi-am8k1daLyx7k84FUdJaATcIDXHV_76TiUmdfhwkVKex3C0506tIg>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 04:25:29 -0400 (EDT)
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
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH v2 1/5] irq: Make refcount_interrupt kunit test selectable
Date: Thu,  1 Oct 2026 10:25:15 +0200
Message-ID: <20261001082519.16195-2-boqun@kernel.org>
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

From: Kuan-Wei Chiu <visitorckw@gmail.com>

Currently, refcount_interrupt_test is built unconditionally when
CONFIG_KUNIT is enabled, causing it to run unexpectedly during boot.

Fix this by introducing CONFIG_REFCOUNT_INTERRUPT_KUNIT_TEST so the
test can be configured independently, following standard kunit
practices.

Fixes: 07a88e2bcd5b ("irq: Add KUnit test for refcounted interrupt enable/disable")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
Reviewed-by: Boqun Feng <boqun@kernel.org>
---
 kernel/irq/Kconfig  | 12 ++++++++++++
 kernel/irq/Makefile |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/Kconfig b/kernel/irq/Kconfig
index 05cba4e16dad..6923f37eaab4 100644
--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -150,6 +150,18 @@ config IRQ_KUNIT_TEST
 
 	  If unsure, say N.
 
+config REFCOUNT_INTERRUPT_KUNIT_TEST
+	tristate "Test refcounted interrupt enable/disable" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the kunit tests for the refcounted interrupt
+	  infrastructure. It verifies the correctness of single, nested,
+	  and multiple interrupt enable/disable state changes and ensures
+	  that the underlying reference counting mechanisms work as expected.
+
+	  If unsure, say N.
+
 endmenu
 
 config GENERIC_IRQ_MULTI_HANDLER
diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
index 44c4d6fc502a..0e5df962a149 100644
--- a/kernel/irq/Makefile
+++ b/kernel/irq/Makefile
@@ -16,4 +16,4 @@ obj-$(CONFIG_SMP) += affinity.o
 obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) += debugfs.o
 obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) += matrix.o
 obj-$(CONFIG_IRQ_KUNIT_TEST) += irq_test.o
-obj-$(CONFIG_KUNIT) += refcount_interrupt_test.o
+obj-$(CONFIG_REFCOUNT_INTERRUPT_KUNIT_TEST) += refcount_interrupt_test.o
-- 
2.51.0

