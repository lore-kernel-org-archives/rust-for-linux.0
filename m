Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4EE37F72E
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086149; cv=none; b=BK0YNm36uDbxTWPR2vDkQ0yC3b00JMw6VfzhIaPZFJbpsdgjO7Kq9kmkV5UvhbThzV1SSK0tYDJWnlAgU6iflJFiu1b+5hZCNdmaQN6iJqfNW8+Weosh9c6JwI4ZySwTr2x8pCVoOzmErfZalr3Beo4Dw08njeQgvlCcN6T1lxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086149; c=relaxed/simple;
	bh=6ESVuJjZ9ui3/4DwNjKV/PraMIkzSH0Vd92IDm2WfD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOvb2YXjvv2ti6hbTMH3MduH6HZCXkbTun74DzrP0fLmz5Mc6lAvDS0r3CgwrURK3oNU7bpik38Ze6EoXwl6ND+5+mBWbo8uxHvNAtydptYtMNlF1ViYJiJ9FlW9Hbe6nbPOFr84xPdeAXbMhYDsHOfpS+X0QrK33FRioKd2PEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bS0DasBk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bS0DasBk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7091F00A3E;
	Fri,  7 Aug 2026 07:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086148;
	bh=3oQWJsZRvEwPxCRQ6qISEKyc40r/iISGRFtA3wGNP7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bS0DasBk0ktCm6tC1qyv12CkzWVF+LsAx+u0C0vrigp7NuWL9Kl1dmT06geswfrc5
	 JUX8KdGtIxADu/fHOpvp9Yd+kEa90/iwXIFuOrrotN01VrYnvpToyabOqwfpV4iZSU
	 vdxx4t7WI0BjIXGkoRv7RTCmw5VAQnOmJxdr8nUe/M4Nnk5cO6cIC1tb03liYb1Jol
	 S/DwsauEejATU5Bd/z6832I5NtHAqiRUhYDF9S6IK6LdgMmhBkHUpCQSueGtQOsQBs
	 J4CDrbsl2Pz0YdODLsjMk2xAuNx0h4PtqyubwVxauedL9lx1F6+kwrtQ1vygqFe2+U
	 PD7px93/fqx4w==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C3C6DF40068;
	Fri,  7 Aug 2026 03:02:26 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 07 Aug 2026 03:02:26 -0400
X-ME-Sender: <xms:AoN1al-E3MJR7qFQ8L_Hvh95zg8Bh1TqyLM2uLqotLhLQKJiW52E7A>
    <xme:AoN1avPVBMtX4CoML6lnBXJdnfMzLXG1rdjeSz4X6Pm0h8hGyjUWxYinSUxHs_KN_
    51RPSPPV7AnXVzsjpHG1yERdnahk5mYA5zHFUT9MahuSr0qXsQk>
X-ME-Received: <xmr:AoN1arUBZiFNjK7LZgioFL8a5YhIMRI3zPc3m66N0G4ywyuVndx_CybIGW0CT_9LHYPfcQnoVvsnbFPA9xTnTg-wVCUoTMgs>
X-ME-Proxy-Cause: dmFkZTGymVtxh0AmopRY+TfTfXYPCmloL5eVBz8w4y+3KFrHM+Bwv6o50auh1636bSBYkE
    H90J+8ZvDwGP+GEnsL03hmghhkCvgcLvZRJlD0Z0K6idzeBe96fVCfVF90zAumgR10DH6A
    dzrkds6t6yssM5k8WnRKyJY7PoN9yPTJEd8yclKHhKcjgA77IEZ54Ob7IjTR0RbJw1Jd/H
    MAKXnEz1+HSwhiWHnu3/dGxtHg6i6x+jlrZPffCsJNEQERYySXee/h/1gQg2z905mRcC4Y
    mB/oQJoiVpI6TFSRaftlL1E+wAZyQH5fXLMWv+6L12SLyEAsyE0kkUaQtsxqspvPUOq9AA
    jTmfS5/QKolSD4R7HDa4dhZQPCPAQYRI1iO+O7rxtEWugxuOlzZllTY7KeKdL0DiSaLNZF
    eSGMRKMDR1xjY6X4KybfHsyb4fEYt/A25awL5+AfR+6blU5KwI+gwGYCsvfirAgfg9uJmu
    U9SNSfDoBdVOIztvn7gRHPjFYb88EDs+koyXI7iFHUSgjNg4R9XeK0W+X3LGWhJ2zTYqU1
    c9tCwDptqYBijtzsT+E3SNviqTdFE2KA8m1eMp/pumKG+QlCp8UiP6Z4dwy8cLP957BsYq
    EiMPGVrpuUfZ+Q2Jf5UB9r/qSlm+dBuKFyXGd07YyY59dUXQ+lbeCCVNhm8g
X-ME-Proxy: <xmx:AoN1angXigLIC_3PDhnxPOHOuUgcPq_UDKHIKR8AFbf5zsvPjKaqbg>
    <xmx:AoN1ar-EeNz89z2BGHkRqsiepeVE4gs0rtxj2TraSaCOz8mTDYuy-A>
    <xmx:AoN1auQoTj7DUSEbN-SG8id0oEDLOgoQl7A0leUBjx1QFJiZF0HpUg>
    <xmx:AoN1aqueFz_bXucIsgabAPmfUn1ArdNx4mv-C5U_2fp1JZejGQ8koA>
    <xmx:AoN1ag6DL1cV5ixlg-KYn4PNme9YftAXYgg-JgMMrWpPQVwoKxBK31Ts>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:26 -0400 (EDT)
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
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v5 01/18] preempt: Track NMI nesting to separate per-CPU counter
Date: Fri,  7 Aug 2026 00:01:58 -0700
Message-ID: <20260807070218.27144-2-boqun@kernel.org>
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Move NMI nesting tracking from the preempt_count bits to a separate
per-CPU counter (nmi_nesting). This is to free up the NMI bits in the
preempt_count, allowing those bits to be repurposed for other uses.

Reduce NMI_BITS from 4 to 1, using it only to detect if we're in an NMI.
The per-CPU counter currently caps nesting at 15.

[boqun: Address Steven Rostedt's comment on the BUG_ON() condition]
[boqun: Use preempt_count_set() in __nmi_exit() to avoid underflow]

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/hardirq.h                        | 17 +++++++++++++----
 include/linux/preempt.h                        |  9 +++++++--
 kernel/softirq.c                               |  2 ++
 tools/testing/selftests/bpf/bpf_experimental.h |  2 +-
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index d57cab4d4c06..8d4895531a45 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -10,6 +10,8 @@
 #include <linux/vtime.h>
 #include <asm/hardirq.h>
 
+DECLARE_PER_CPU(unsigned int, nmi_nesting);
+
 extern void synchronize_irq(unsigned int irq);
 extern bool synchronize_hardirq(unsigned int irq);
 
@@ -102,14 +104,17 @@ void irq_exit_rcu(void);
  */
 
 /*
- * nmi_enter() can nest up to 15 times; see NMI_BITS.
+ * nmi_enter() can nest - nesting is tracked in a per-CPU counter.
  */
 #define __nmi_enter()						\
 	do {							\
 		lockdep_off();					\
 		arch_nmi_enter();				\
-		BUG_ON(in_nmi() == NMI_MASK);			\
-		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
+		/* Maximum NMI nesting is 15. */		\
+		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
+		__this_cpu_inc(nmi_nesting);			\
+		__preempt_count_add(HARDIRQ_OFFSET);		\
+		preempt_count_set(preempt_count() | NMI_MASK);	\
 	} while (0)
 
 #define nmi_enter()						\
@@ -124,8 +129,12 @@ void irq_exit_rcu(void);
 
 #define __nmi_exit()						\
 	do {							\
+		unsigned int nesting;				\
 		BUG_ON(!in_nmi());				\
-		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
+		__preempt_count_sub(HARDIRQ_OFFSET);		\
+		nesting = __this_cpu_dec_return(nmi_nesting);	\
+		if (!nesting)					\
+			preempt_count_set(preempt_count() & ~NMI_MASK);	\
 		arch_nmi_exit();				\
 		lockdep_on();					\
 	} while (0)
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index d964f965c8ff..586f96688325 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -17,6 +17,8 @@
  *
  * - bits 0-7 are the preemption count (max preemption depth: 256)
  * - bits 8-15 are the softirq count (max # of softirqs: 256)
+ * - bits 16-19 are the hardirq count (max # of hardirqs: 16)
+ * - bit 20 is the NMI flag (no nesting count, tracked separately)
  *
  * The hardirq count could in theory be the same as the number of
  * interrupts in the system, but we run all interrupt handlers with
@@ -24,16 +26,19 @@
  * there are a few palaeontologic drivers which reenable interrupts in
  * the handler, so we need more than one bit here.
  *
+ * NMI nesting depth is tracked in a separate per-CPU variable
+ * (nmi_nesting) to save bits in preempt_count.
+ *
  *         PREEMPT_MASK:	0x000000ff
  *         SOFTIRQ_MASK:	0x0000ff00
  *         HARDIRQ_MASK:	0x000f0000
- *             NMI_MASK:	0x00f00000
+ *             NMI_MASK:	0x00100000
  * PREEMPT_NEED_RESCHED:	0x80000000
  */
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	4
+#define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 4425d8dce44b..10af5ed859e7 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -88,6 +88,8 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
 EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 #endif
 
+DEFINE_PER_CPU(unsigned int, nmi_nesting);
+
 /*
  * SOFTIRQ_OFFSET usage:
  *
diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 67ff7882299e..e4e12001fce9 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -367,7 +367,7 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	4
+#define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-- 
2.50.1 (Apple Git-155)

