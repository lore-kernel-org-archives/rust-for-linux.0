Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F23379EC8
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529845; cv=none; b=rBjw4qr49k/w7ysWM7Qc3VAUruGpagGj/EMGTiKIk4qEARHhIMUSuZJXdqYs9/ZnkRQtsNB+Imhs9te604M6B6wPPkHzOFVVSSkwOvRlsqCy58HThHuLWh7oYWuQkSNhzvFN1Lrt66N8KbH1dj91eDpGXDeCNpswt1illEWrgHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529845; c=relaxed/simple;
	bh=k6E9T3RdSQ8la9/9Bg2w9Nv7e++ulTqGtk8Wi6e/JeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5f941B2Ar9qbDCuDZE/6JnYJlz+EWWEhQ5g4QXw6LRzOiIn7oAJRFaV4jJ/pdYdFjSJlN5YpsJdIvgJyVer1KkTZrO/x6H02io9OEhIkc0JwAn0jvUKUbaHs0TMm3FfbgQX2H7sa80Xz73/ZiHis7nRFShOy1lpcDq0woEmXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVM+wHcZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVM+wHcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36FB1F00ADE;
	Fri, 31 Jul 2026 20:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529842;
	bh=WiO5r9en3b3j6Z1SoF27ACEmDDEt+2SFG5r2qfaLJ+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bVM+wHcZcmlCkJsJyu6Hkza2i8CtybDdk0EFmBTHq7nMdb/wFHl72S0szDjsxYLvk
	 mq9tczjKsbzoTZMzQvz2lXBQlZh9UMJPwNgv/BGbXVM6qzJaWuw8wzzf99PAIIGNvo
	 WBSR4b1IwZZBKEF+fd+Pmdb3CnxKIEflo/GUmN0TR9/2Sv4WQOrXajC9KEs9jgpz2W
	 3O0qEqNUgUZvr5DYvXudvtk1wOZVwKGJOUrxhHTWw2JhP1FkssYRIxKbnYEaDOYNHj
	 kJzv5yL/EE7Wh6dgWwpM9dmjUrG0DskplhDboRDKq6oF4btksPYP+IkQUW64la8OpS
	 P2uWb9okz81sA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id E1A87F40077;
	Fri, 31 Jul 2026 16:30:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 31 Jul 2026 16:30:40 -0400
X-ME-Sender: <xms:8AVtagiO0R6lhTzUq8c4hfRREwnEv1BF_Z16oMoRXXajmiOrsPRlHA>
    <xme:8AVtaja-acsIDeVxBAPK2Y6RVA_iaHKd_mNzjqu5XIV9sF-JSl65-WB8EwxRwiq-Z
    vPstNve4HBRU52ZZkjVNNZ1SZmWjm16TZvNo9tuDMarAHLMSZjdAA>
X-ME-Received: <xmr:8AVtauMgeXf2UAhC1G0VqqrptXLGC_9EXRLMy-AVQpIVJROYJyX7hkvHmfLi18y6id5ZERoO1aEH2HorsmTFjxEFZ8Khw4wu>
X-ME-Proxy-Cause: dmFkZTFdRdBIF8ZH/aPs2g1lRw7GATpB3kPZdHQ9SRq3TCfYELIaqSZraFLrXlLQvfZ+Zw
    L2FnPfSJd952oWr+y28mIfAsYcvh2g32U0J8iwTV49f0k9Q8hXOe/2BgVhInUEnjhmC2lX
    03vYTAlN0bq9NjF03uLbRgPGL4766SVn/XbgM9h+YDdXpmZY+TYoTPsYcygLFMbtetKCiX
    MKKxau189OoX/tBJGac9kkLntk5lYAb6ORV5iOKO0UE2KpFdBfn5cZVhjAZINCJF+DQAjd
    IJX9TqJvKbTOKjLKBWundtWMSfFqKbkgkDYizysOgKGZkbbhOs1gMmPcuy0Gf54a13j8SY
    BsLS4AhaphsYC31TNG3SgAjWtldfFFLoqnwREbfJsO18aSConmL5I8Ko/dYwJS0xO9XdlI
    08ZIoev6MdmKsrc9XJWrbgki7BUAQeMt+8cF8SkUl8lmNzbr+CVkPY7K0HZVOM4znHeF2w
    iBTUweF5HV6Pn6dKOoBMOaswFmdVkSFMENwkQknMeNXUVgFJ1h+9nfs0EE//kEu8ii+JsM
    zSsB07IV1Dp/xm1N3dazcJLt7i0+CTnQesSK37zkN8wuzdXmwDvvq7pKg2FSoxjyb4Ke6v
    XSZnJ4Uqh1IksIwPUQaPJf2Y8jObTUbaIEBJCz+VCzdMw+ctDsLY1swtHd4g
X-ME-Proxy: <xmx:8AVtasYWyvigcJbcMMFcYDr-kpTxCUUvogG-jsBxDGEiEm6PxMqeeA>
    <xmx:8AVtamWbNMVVK0wmoCLBjmmy9klXDAAMk7vG4NNmDAnfVfnz9bzG4w>
    <xmx:8AVtajBbyUWsP-KKD_lKQJ_uVH9HbIclH4t1pjFHNP5VQuo0c1x-Vw>
    <xmx:8AVtaqJjzK98Kxo_5mXTiVZ1MR4ufEs4P0CnR8voS_cozDUzl0njCQ>
    <xmx:8AVtapvHcycBsSUWPd1X-tfi8F2eZtYVKSPg3TRgkHDbty8hIE5py_6N>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:40 -0400 (EDT)
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
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH 01/24] preempt: Track NMI nesting to separate per-CPU counter
Date: Fri, 31 Jul 2026 13:30:02 -0700
Message-ID: <20260731203031.13679-2-boqun@kernel.org>
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Move NMI nesting tracking from the preempt_count bits to a separate per-CPU
counter (nmi_nesting). This is to free up the NMI bits in the preempt_count,
allowing those bits to be repurposed for other uses.

Reduce NMI_BITS from 4 to 1, using it only to detect if we're in an NMI.
The per-CPU counter currently caps nesting at 15.

[boqun: Solve Steven Rostedt's comment on the BUG_ON() condition]
[boqun: Use preempt_count_set() in __nmi_exit() to avoid underflow]

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260121223933.1568682-3-lyude@redhat.com
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

