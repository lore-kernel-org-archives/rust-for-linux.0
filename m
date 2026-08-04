Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AE474261
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860106; cv=none; b=HkXVtH1lFMMZn236H66QOVWAUOiZ4tk6f2dPoRiq8RkX60ni1oIWuXLbnzWRYVCvRrjXCKFh1xuy7FMOcG4uhLv7fVW4+DiglLLAFZLnXpoPF2tv23U6S91bjduQwL3TtU42cu+az1sFt1+Lt6ZMfCtjEyI3BD5n28Jqpv7HS0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860106; c=relaxed/simple;
	bh=TcirFITXiiVEzgBfiZWswwyD92L/VOu9Yzk80E8ZDYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oju+AgpZCqQLz1WdhNr1RP4b2CqnpUEXX6ZU70ibbLBA2HtMS7XrGdMFdxWxChK67DsKg2Ql3+UXyg7W8SMgnHVZs7jvleB5kQkztDP5DFhfFzPOm9b+cEWgeyoI1Nk4MVVNuqcpoKjSFqro8jwmK40sLiOAoCfbaDHHG8ekj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyyN90YI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyyN90YI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA5E1F00AC4;
	Tue,  4 Aug 2026 16:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860099;
	bh=koUnNVxTgcqVkfNjlw+37XcYk2uWFTpcvzbP8xX2P9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UyyN90YImr5wPHR578JLTn+kOt+3zdGIGnD4livnjMSQVotMo29MfTVhjPJw8SqGy
	 UoQldomol5dlq9x0eTVx/tg70dNKnQKKEl4g/zNKypDWVQx3SzoWLsHcE03Pa2U37K
	 K6FmsPBKfodMCwGxZwYVYEaEkB7s1uqxqNVamlmFNzw/udECCeAsx5ramnsE+HVBOf
	 prSFFO9Pujtvy0pmt1Fqxm1mXSnJfGtk6NQz5fzSYrPzzYykEjAHNbjRZqfD9h1uWa
	 MGsvAT+sXKkxK3tq7xkLWxOBW960nAKhWD7Owgb3WbXD1WBiQ3H8IlMYdT6PTFbkbv
	 zH/ak0AicyA5w==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7963EF40066;
	Tue,  4 Aug 2026 12:14:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 04 Aug 2026 12:14:58 -0400
X-ME-Sender: <xms:AhByaukpkyx1yiwU5drwsFdlFIXGUCXXNgvLLmAmEmQb-rNrsst0Jg>
    <xme:AhByarB1nBNRTrgm7Oq4PI8BxS2xl0qPYTvCIxfbEpCQcq5MdeQ-EyjDC8znE2RDe
    So02Iz4z9WIFSlyymfytRNzPS2UHdMZkmfg2-AKs6GfXz5dP3e8DA>
X-ME-Received: <xmr:AhByagDEBCn9EuHI4elVak-KDbs7gfv3ZmI7sxNL-wL5tg2Tetx2FUTnvqx9YrgGPi1vFsqg7wh02NRSRghYozywoD5_uXBF>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbVO
    aenDcH08zAIddQAApNItbNBUIw1z7JHORMAyK4l8wvX9/ThX52etRbCZ39xlVgW88vQTdA
    X1xAqTDV25os7op2jSYrSeeqVssydWsoUNNqFU3p9mymoBS743aZ6ByDXbqoKrFJzxvU1j
    hzdh2Tr1Qqc8DHk/dYXgSfw7b3du3kRnCeyoL7iz/CAMr8J/GARun6ksdy3Tuiq8p+mo/J
    Q5GUx3pre9uwz8pgPcVxnG7tffuVua8jufsRJBgS+8sdUY1U26smaR9Ja2jkDehhxdA6o3
    w3MU78u1ctOmqWRtsnFpO8b4BVHClOND4i7+1GXN8wzerf540bsLEPQAHgVw
X-ME-Proxy: <xmx:AhByaiGzPQ3TQA3dnuuqUTEUhujc0j-pOPvvr88ZrTKm03uWUFEnLw>
    <xmx:AhByan5-HLXzj9sa6J-sxo-JWqonEH2-LoBeSRY8_vXD1djgRJBd_w>
    <xmx:AhByapSPz9csJUwaimyiWHIEyPqqjzsdzBrPNx4x32fPe5UERBBrPQ>
    <xmx:AhByai6rilWlIeuyYcRySocjsQ7ngJPD9oA2GhJsbhoYkGOGyJ4dWQ>
    <xmx:AhByamRLcztxtf4W-XIBQ28OFKy9tGNmNbgwPGx_9aIPA2URJxqb0TGU>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:14:57 -0400 (EDT)
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
Subject: [PATCH v4 02/17] preempt: Introduce HARDIRQ_DISABLE_BITS
Date: Tue,  4 Aug 2026 09:14:24 -0700
Message-ID: <20260804161447.84806-3-boqun@kernel.org>
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

In order to support preempt_disable()-like interrupt disabling, that is,
using part of preempt_count() to track interrupt disabling nesting
level, change the preempt_count() layout to contain 8-bit
HARDIRQ_DISABLE count.

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

