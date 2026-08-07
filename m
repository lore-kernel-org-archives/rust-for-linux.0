Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FCC390CBE;
	Fri,  7 Aug 2026 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086151; cv=none; b=PPPvPBMQPhsh1mFpW73RsAG6VGgSQQeEOQHREjEX9ynJ/5NGR4t2aYQj3pZT1cvO2QLBANQCdRZGxgyaWePxX3DRELjrmvjqDkxiB3fxR+OU2WV1awpGQ4Jn7mhNqvfeRdy6ddHsBgyF4kFc+aJXMlv2D0Xe/MUpoGxLv6/Kc3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086151; c=relaxed/simple;
	bh=CEFovGyeXMpftokmGqMA9XIJ9FL21tUPcuXNNde++wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sR3HTWv4/HtmbcDGDwYikFIss/x5DJpm0o1ERiFr6rarvZrP/YRbXJf3HzDIR00RXeDCZIUjgnzVRxn78HzdwjvTNB1SaPqoTFslu0JoDM5KkqPRAPPXYrMqbhpxwcrEDJDKFZFMfL9iVJ0wNxk3dVwJ/kGXtecpWA1I1Saq1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c13Wuymp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c13Wuymp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0351F00A3F;
	Fri,  7 Aug 2026 07:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086149;
	bh=VBb3FbGLQGm67Ub08TQMzCeI8jjhoUtbqsCyiVOt/HM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c13WuympHNd2JKDLxnNQjqqe2JW+0ut5J7pjd3jjRqaICvEq94dijK1d7x91YKEKQ
	 vlOu0k4JmHHTGCwscyntwsRexGDKGDfSh5kJITJI1UA9GzWjjY6sM71TLA2fg19R4u
	 I9NLZfbBz4sP3KuEkEgVPf/AoIi6B4wDL9/LeD7LaFb2w18jVVmb70/qi6+qu2HTH0
	 XXuxOt37mPSvloTWfEuwbrmUrcMjLe/3L3fowatVqCv1rDwHv4XvtJGSjYkJCg3v8x
	 L7MnjYDR2/MqTzAjc+gg1HVyA+jxfdV2vnURgh0IJQRRyIKkIABAMhddjucquMvnaE
	 co/9Uq5X7rRYw==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 31C7AF40066;
	Fri,  7 Aug 2026 03:02:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 07 Aug 2026 03:02:28 -0400
X-ME-Sender: <xms:BIN1avMOD4ROoOU4-9ysBq-sHtMCQSMNqwv5aYL8JOX3QHjPdCk4KQ>
    <xme:BIN1amR5XfForWZVHbObt8qWqMe57iVmEnjikkWWM4wdqLgpS48ydDT7maXdss_RN
    994q1ETNsmc-GPR7LHOGKaE8VVnezycu14jMKFJ7dU9jF02LZSPwQ>
X-ME-Received: <xmr:BIN1av4pAhp6xDw8vbVGBMqmVXdvF9YcRMuzadPONovF1S-nc1QSeHyjMuK_8D6dKV1vQ74x0zVfnIfYIkKc7aYNSIiBv8R9>
X-ME-Proxy-Cause: dmFkZTELT6mPBN+tf+gYDjbmfxF2aJuNia3fHRbo+cksodwgHpv175RY/La8br7LVuLKD+
    xpTrulxkYenRUqjuFjoYpWp5kB81fkgSYs4cUOn9Aimg2+sWPDBZPSJD0AkLNVKo9ymnEn
    XwkNJDHucJ7KY3ALZ5VcWOWe5XHuNtoJV5e7Q54FFSKl7KOd+nrEm1L6dR4Jdu+LjwwV/e
    gMJ05NqNZsVzzu9M3eDFzAUAJPeoh4s2jJHbhIzGNi7DAZxkNRx1H6hWOvNKjwmDuMbW1g
    3/Yvg82sjVAOqgIP9o+xyvh3ddqbO1HSSPQ13n3n5YTt3W/2pxiARls47VLAs4X6PdSfRw
    0i4flKekFgwscxxBdQcR10/AiGpVK7ZvcpqdyKp8fFzbNPXbAWO/O6dkRe9wI3DbEwamyj
    1ljajEO1BLGPRaKXrzCC3Il85ddUqjAOJ7MY+hIJzUIaL33rHMw7RI5OSRSrGmdLV+4uX6
    omIrstDim84VQSnHYjMwxAjGLppu8ObQ+u9VgF1Olbw6+ZaEQtvdrtmruNjt4hfKaSNddW
    hCJIvye6IAIJpQ5oRMt9vPKlzLcBVqHIQL1wm4m+CCuchOgYfinLzD1CQdWBqX7XGqxw6j
    g/jEoByw6E4l4r3w+sdVdTxBJDgO+uMTia6eko+FUwMEsEURRplm/oC/xL0A
X-ME-Proxy: <xmx:BIN1ag3UEkjzVEeINt8nGtsGdBYi963p3tJo1ylLGIAC2YxB90otJQ>
    <xmx:BIN1asmTZR_JJ9ZiLq2pRSXNmkJahAIBCft4Is_1Nc7vY13WKuMYVQ>
    <xmx:BIN1amhb-E5Gf3H1Kq0I0UPa-FXC5213tB1xHt9nbztTg-xRI8cOhw>
    <xmx:BIN1ahQOfkIvmW7Nk7p7Yu1nvLd6LC1AUD9nxbz0vZlI7EQIQbGBtQ>
    <xmx:BIN1ajiS6n8Fvw62c7Ww05dTzILf_muHz6eIZBxf02vD1yZXsHTQQ94c>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:27 -0400 (EDT)
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
Subject: [PATCH v5 02/18] preempt: Introduce HARDIRQ_DISABLE_BITS
Date: Fri,  7 Aug 2026 00:01:59 -0700
Message-ID: <20260807070218.27144-3-boqun@kernel.org>
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

In order to support preempt_disable()-like interrupt disabling, that is,
using part of preempt_count() to track interrupt disabling nesting
level, change the preempt_count() layout to contain 8-bit
HARDIRQ_DISABLE count.

Co-developed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/preempt.h                        | 16 +++++++++++-----
 tools/testing/selftests/bpf/bpf_experimental.h |  5 ++++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 586f96688325..e2d3079d3f5f 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -17,8 +17,9 @@
  *
  * - bits 0-7 are the preemption count (max preemption depth: 256)
  * - bits 8-15 are the softirq count (max # of softirqs: 256)
- * - bits 16-19 are the hardirq count (max # of hardirqs: 16)
- * - bit 20 is the NMI flag (no nesting count, tracked separately)
+ * - bits 16-23 are the hardirq disable count (max # of hardirq disable: 256)
+ * - bits 24-27 are the hardirq count (max # of hardirqs: 16)
+ * - bit 28 is the NMI flag (no nesting count, tracked separately)
  *
  * The hardirq count could in theory be the same as the number of
  * interrupts in the system, but we run all interrupt handlers with
@@ -31,29 +32,34 @@
  *
  *         PREEMPT_MASK:	0x000000ff
  *         SOFTIRQ_MASK:	0x0000ff00
- *         HARDIRQ_MASK:	0x000f0000
- *             NMI_MASK:	0x00100000
+ * HARDIRQ_DISABLE_MASK:	0x00ff0000
+ *         HARDIRQ_MASK:	0x0f000000
+ *             NMI_MASK:	0x10000000
  * PREEMPT_NEED_RESCHED:	0x80000000
  */
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
+#define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
 #define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-#define HARDIRQ_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_DISABLE_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_SHIFT	(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
 #define NMI_SHIFT	(HARDIRQ_SHIFT + HARDIRQ_BITS)
 
 #define __IRQ_MASK(x)	((1UL << (x))-1)
 
 #define PREEMPT_MASK	(__IRQ_MASK(PREEMPT_BITS) << PREEMPT_SHIFT)
 #define SOFTIRQ_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
+#define HARDIRQ_DISABLE_MASK	(__IRQ_MASK(HARDIRQ_DISABLE_BITS) << HARDIRQ_DISABLE_SHIFT)
 #define HARDIRQ_MASK	(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
 #define NMI_MASK	(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
 
 #define PREEMPT_OFFSET	(1UL << PREEMPT_SHIFT)
 #define SOFTIRQ_OFFSET	(1UL << SOFTIRQ_SHIFT)
+#define HARDIRQ_DISABLE_OFFSET	(1UL << HARDIRQ_DISABLE_SHIFT)
 #define HARDIRQ_OFFSET	(1UL << HARDIRQ_SHIFT)
 #define NMI_OFFSET	(1UL << NMI_SHIFT)
 
diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index e4e12001fce9..0159a3d365c8 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -366,17 +366,20 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
 
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
+#define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
 #define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-#define HARDIRQ_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_DISABLE_SHIFT	(SOFTIRQ_SHIFT + SOFTIRQ_BITS)
+#define HARDIRQ_SHIFT	(HARDIRQ_DISABLE_SHIFT + HARDIRQ_DISABLE_BITS)
 #define NMI_SHIFT	(HARDIRQ_SHIFT + HARDIRQ_BITS)
 
 #define __IRQ_MASK(x)	((1UL << (x))-1)
 
 #define SOFTIRQ_MASK	(__IRQ_MASK(SOFTIRQ_BITS) << SOFTIRQ_SHIFT)
+#define HARDIRQ_DISABLE_MASK	(__IRQ_MASK(HARDIRQ_DISABLE_BITS) << HARDIRQ_DISABLE_SHIFT)
 #define HARDIRQ_MASK	(__IRQ_MASK(HARDIRQ_BITS) << HARDIRQ_SHIFT)
 #define NMI_MASK	(__IRQ_MASK(NMI_BITS)     << NMI_SHIFT)
 
-- 
2.50.1 (Apple Git-155)

