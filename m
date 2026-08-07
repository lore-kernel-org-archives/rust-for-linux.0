Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AC63947B5
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086165; cv=none; b=GI/BLeMBRBGluwwGrAH8wqUQH6KiLNQgP8VaKSB4tu4epSECWb7152f5h1ajOkiTtP8HAhv92aKJTUUikBkPS9kNAQvzp1LLCMRRFtFMO74xkZduuncFJ7NuBMCyRrDLxVftS/IPq7ypm7k6VKzG7d0GXDTjS/fPZq/DgbJ5sos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086165; c=relaxed/simple;
	bh=nHQ7cZ5+k7RgGGfNoGDfPRnJLZsmOgdHMe6yrMx/xuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKuocsTOHAI92zinu60B50f4kIn9bl5W1d8JfeDsXJikwf2mxkyHsyfksxOt6X40qg8vgVWlBNMaTUhMGVj8CYujV1B2ssHP7vJfoAK02MFK/zyp7ph6P/o9J5XXZErpxWMbTrewUPtbE8m7AodShbaHwa2MM+Yco3eOdPN0fh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPBDzJXG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPBDzJXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCDD1F00A3A;
	Fri,  7 Aug 2026 07:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086162;
	bh=FDRECyJGIodi8AT12h/ANJTDSaE/Zgze3j4PFvNPEDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lPBDzJXGWNixzUct5sUCkMLZfR8YYtSW52Tin1JbNogG3YeLKIQ1tCOzx1ay9tF38
	 MIELtvM6ccVncF86F9IkDS15waO1xS1eBtkIzBCaeg/CxiY47UF+q2XXorxUYKdaeA
	 J5WFMiqePZYVpPZynCONTA8CMjvRRcndLxLfaT5lK1gBIysuB422t5febgKt9EHzyr
	 ScKuzi5sr4S9g1Sd6xiMaAVAQ3Qs7itPnFVYPeYG+PAAxxlcTTu67Bud+92NNzkj7o
	 zW+f4lh6cSL5CD9ao5PjWSOnM2Uvub/QIoOULDe706sUN4XuVtQO36PDIcdamBVnRC
	 OHalignZ7hgmA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 38E44F40068;
	Fri,  7 Aug 2026 03:02:41 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 07 Aug 2026 03:02:41 -0400
X-ME-Sender: <xms:EYN1aroUXfYERLu1_euKbA-0BP1b30XCeimSDtsN80HOS0a5v_iBYw>
    <xme:EYN1ah-5Opsr6ZB8zY6xvV-asu41pqmGt3S9jdLGBn8GFdaCzKFqbn-UFvG9wh5le
    tW1L_T7XroUVlfQVMlzCUqGhtEa95Zk9ZgvK6rvw9K6AKlrfDc44kE>
X-ME-Received: <xmr:EYN1ap1O3B7_vjWVq2H1zcCIBIyajpP0jzDwDmD8gEqjMwyaG6UZ9CQ0xFIoO3SsaIfnhFUdi5AYeJm7i_wTcycVVB9_6GiQ>
X-ME-Proxy-Cause: dmFkZTELT6mPBN+tf+gYDjbmfxF2aJuNia3fHRbo+cksodwgHpv175RY/La8br7LVuLKD+
    xpTrulxkYenRUqjuFjoYpWp5kB81fkgSYs4cUOn9Aimg2+sWPDBZPSJD0AkLNVKo9ymnEn
    XwkNJDHucJ7KY3ALZ5VcWOWe5XHuNtoJV5e7Q54FFSKl7KOd+nrEm1L6dR4Jdu+LjwwV/e
    gMJ05NqNZsVzzu9M3eDFzAUAJPeoh4s2jJHbhIzGNi7DAZxkNRx1H6hWOvNKjwmDuMbW1g
    3/Yvg82sjVAOqgIP9o+xyvh3ddqbO1HSSPQ13n3n5YTt3W/2pxiARls47VLAs4X6PdSfHw
    PZgY/tsWSFXVCQe2XGHjIRwoZsh63uV1397w+Swj2HHef5pe6QRzTSez6WI+Q7Q4z/D95L
    xhVaUc7ANWbu39Q1RDnoK5Hb0u200JjeIL1Ur0v9pznDgCq3yu0WI74hfXUHI5gWS2xCpg
    /p8l7AuXBpxoozFqyERY1YmCQxhPtK5Lyvcur1eOAaJGYePJhu3Sn30oMt+0CEH8ZGHc0Q
    Loz3pmUIkFZ4mrRvxR1jgnNOAzGDPh0W00ZznvrTFg4RbB8TCv6joKG5eHmKXi9p7I0AoF
    216sJhfd7K5yHFL/uRZeMUyVczRQ9GjMZFB/j9K92yUh/nk4S/qmCfN/NKRg
X-ME-Proxy: <xmx:EYN1asBFb_rTrm1q0_fgYI5klkTbcPn3kKjdvSawxXsPlXkar9vFXA>
    <xmx:EYN1agDP7Cmc3LZfJeD_-FgftbI4ierq5d-3l4SxSOdFaRG-HdMIXA>
    <xmx:EYN1atP7c5KvCf73A9_05Qq8MOzjiWQ-Z_fIUMFlR_iOgvj9ioTCsQ>
    <xmx:EYN1aqN95bw6bin_QPUibwwePbhJV3S8A_hgeKrUe6xHj6kJ9FjoCQ>
    <xmx:EYN1ahuMA2aNK90JNH3Hrzkzx39kTHHZtxhUF5P4RMy6ejElcFeU1_z8>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:40 -0400 (EDT)
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
Subject: [PATCH v5 11/18] preempt: Introduce HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Fri,  7 Aug 2026 00:02:08 -0700
Message-ID: <20260807070218.27144-12-boqun@kernel.org>
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

With the changes that enable preempt count to track IRQ disabling
nesting, we don't have enough bits in 32-bit preempt count
implementation, as a result we move NMI nesting bits out of the 32-bit
preempt count. However on the architectures that can support 64-bit
preempt count implementation, we can keep the NMI nesting bits in the
32-bit preempt count and avoid maintaining NMI nesting bits outside of
the same cache line.

Therefore HAS_SEPARATE_PREEMPT_RESCHED_BITS is introduced to allow
architectures to select this. Note that under this Kconfig, preempt
count is maintained in a 64-bit word however preempt_count() still
remains as an int because all the effective bits still fit in
(previously we mask out NEED_RESCHED bit in preempt_count()). This
should make no functional changes for existing preempt_count() users.

Enable this for x86_64 along with the introduction of the Kconfig.

[boqun: Undo the __preempt_count_{add,sub}() optimization in 32-bit
preempt count since it may introduce {over,under}flow]

[boqun: Address the feedback from Shrikanth]

Originally-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 arch/x86/Kconfig                              |  1 +
 arch/x86/include/asm/preempt.h                | 55 +++++++++++++------
 arch/x86/kernel/cpu/common.c                  |  2 +-
 include/linux/hardirq.h                       | 47 +++++++++++-----
 include/linux/preempt.h                       | 23 +++++++-
 kernel/Kconfig.preempt                        |  4 ++
 kernel/sched/core.c                           | 12 +++-
 kernel/softirq.c                              |  6 ++
 .../testing/selftests/bpf/bpf_experimental.h  |  2 +-
 9 files changed, 115 insertions(+), 37 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bdad90f210e4..6a7067d20a6a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -326,6 +326,7 @@ config X86
 	select USER_STACKTRACE_SUPPORT
 	select HAVE_ARCH_KCSAN			if X86_64
 	select PROC_PID_ARCH_STATUS		if PROC_FS
+	select HAS_SEPARATE_PREEMPT_RESCHED_BITS		if X86_64 && PREEMPT_COUNT
 	select HAVE_ARCH_NODE_DEV_GROUP		if X86_SGX
 	select FUNCTION_ALIGNMENT_16B		if X86_64 || X86_ALIGNMENT_16
 	select FUNCTION_ALIGNMENT_4B
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index 1220656f3370..022838589d2a 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -7,10 +7,20 @@
 
 #include <linux/static_call_types.h>
 
-DECLARE_PER_CPU_CACHE_HOT(int, __preempt_count);
+DECLARE_PER_CPU_CACHE_HOT(unsigned long, __preempt_count);
 
-/* We use the MSB mostly because its available */
-#define PREEMPT_NEED_RESCHED	0x80000000
+/*
+ * We use the MSB for PREEMPT_NEED_RESCHED mostly because it is available.
+ */
+#define PREEMPT_NEED_RESCHED	(~(((unsigned long)-1L) >> 1))
+
+#ifdef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
+#define __pc_dec		"decq"
+#define __pc_op(op, ...)	raw_cpu_##op##_8(__VA_ARGS__)
+#else
+#define __pc_dec		"decl"
+#define __pc_op(op, ...)	raw_cpu_##op##_4(__VA_ARGS__)
+#endif
 
 /*
  * We use the PREEMPT_NEED_RESCHED bit as an inverted NEED_RESCHED such
@@ -24,18 +34,26 @@ DECLARE_PER_CPU_CACHE_HOT(int, __preempt_count);
  */
 static __always_inline int preempt_count(void)
 {
-	return raw_cpu_read_4(__preempt_count) & ~PREEMPT_NEED_RESCHED;
+	return __pc_op(read, __preempt_count) & ~PREEMPT_NEED_RESCHED;
 }
 
-static __always_inline void preempt_count_set(int pc)
+/*
+ * unsigned long preempt count parameter works for both 32bit and 64bit cases:
+ *
+ * - For 32bit, "int" (the return of preempt_count()) and "unsigned long" have
+ *   the same size.
+ * - For 64bit, the effective bits of a preempt count sits in 32bit, and we
+ *   preserve the NEED_RESCHED bit from the old count.
+ */
+static __always_inline void preempt_count_set(unsigned long pc)
 {
-	int old, new;
+	unsigned long old, new;
 
-	old = raw_cpu_read_4(__preempt_count);
+	old = __pc_op(read, __preempt_count);
 	do {
 		new = (old & PREEMPT_NEED_RESCHED) |
 			(pc & ~PREEMPT_NEED_RESCHED);
-	} while (!raw_cpu_try_cmpxchg_4(__preempt_count, &old, new));
+	} while (!__pc_op(try_cmpxchg, __preempt_count, &old, new));
 }
 
 /*
@@ -58,17 +76,17 @@ static __always_inline void preempt_count_set(int pc)
 
 static __always_inline void set_preempt_need_resched(void)
 {
-	raw_cpu_and_4(__preempt_count, ~PREEMPT_NEED_RESCHED);
+	__pc_op(and, __preempt_count, ~PREEMPT_NEED_RESCHED);
 }
 
 static __always_inline void clear_preempt_need_resched(void)
 {
-	raw_cpu_or_4(__preempt_count, PREEMPT_NEED_RESCHED);
+	__pc_op(or, __preempt_count, PREEMPT_NEED_RESCHED);
 }
 
 static __always_inline bool test_preempt_need_resched(void)
 {
-	return !(raw_cpu_read_4(__preempt_count) & PREEMPT_NEED_RESCHED);
+	return !(__pc_op(read, __preempt_count) & PREEMPT_NEED_RESCHED);
 }
 
 /*
@@ -77,22 +95,22 @@ static __always_inline bool test_preempt_need_resched(void)
 
 static __always_inline void __preempt_count_add(int val)
 {
-	raw_cpu_add_4(__preempt_count, val);
+	__pc_op(add, __preempt_count, val);
 }
 
 static __always_inline void __preempt_count_sub(int val)
 {
-	raw_cpu_add_4(__preempt_count, -val);
+	__pc_op(add, __preempt_count, -val);
 }
 
 static __always_inline int __preempt_count_add_return(int val)
 {
-	return raw_cpu_add_return_4(__preempt_count, val);
+	return __pc_op(add_return, __preempt_count, val);
 }
 
 static __always_inline int __preempt_count_sub_return(int val)
 {
-	return raw_cpu_add_return_4(__preempt_count, -val);
+	return __pc_op(add_return, __preempt_count, -val);
 }
 
 /*
@@ -102,7 +120,7 @@ static __always_inline int __preempt_count_sub_return(int val)
  */
 static __always_inline bool __preempt_count_dec_and_test(void)
 {
-	return GEN_UNARY_RMWcc("decl", __my_cpu_var(__preempt_count), e,
+	return GEN_UNARY_RMWcc(__pc_dec, __my_cpu_var(__preempt_count), e,
 			       __percpu_arg([var]));
 }
 
@@ -111,7 +129,7 @@ static __always_inline bool __preempt_count_dec_and_test(void)
  */
 static __always_inline bool should_resched(int preempt_offset)
 {
-	return unlikely(raw_cpu_read_4(__preempt_count) == preempt_offset);
+	return unlikely(__pc_op(read, __preempt_count) == preempt_offset);
 }
 
 #ifdef CONFIG_PREEMPTION
@@ -158,4 +176,7 @@ do { \
 
 #endif /* PREEMPTION */
 
+#undef __pc_op
+#undef __pc_dec
+
 #endif /* __ASM_PREEMPT_H */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index a3df21d26460..73a6d9f6a78e 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2236,7 +2236,7 @@ DEFINE_PER_CPU_CACHE_HOT(struct task_struct *, current_task) = &init_task;
 EXPORT_PER_CPU_SYMBOL(current_task);
 EXPORT_PER_CPU_SYMBOL(const_current_task);
 
-DEFINE_PER_CPU_CACHE_HOT(int, __preempt_count) = INIT_PREEMPT_COUNT;
+DEFINE_PER_CPU_CACHE_HOT(unsigned long, __preempt_count) = INIT_PREEMPT_COUNT;
 EXPORT_PER_CPU_SYMBOL(__preempt_count);
 
 DEFINE_PER_CPU_CACHE_HOT(unsigned long, cpu_current_top_of_stack) = TOP_OF_INIT_STACK;
diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index 8d4895531a45..860895a7f4e2 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -10,8 +10,6 @@
 #include <linux/vtime.h>
 #include <asm/hardirq.h>
 
-DECLARE_PER_CPU(unsigned int, nmi_nesting);
-
 extern void synchronize_irq(unsigned int irq);
 extern bool synchronize_hardirq(unsigned int irq);
 
@@ -94,6 +92,37 @@ void irq_exit_rcu(void);
 #define arch_nmi_exit()		do { } while (0)
 #endif
 
+#ifdef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
+static __always_inline void __preempt_count_nmi_enter(void)
+{
+	__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);
+}
+
+static __always_inline void __preempt_count_nmi_exit(void)
+{
+	__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);
+}
+#else
+DECLARE_PER_CPU(unsigned int, nmi_nesting);
+
+#define __preempt_count_nmi_enter()				\
+	do {							\
+		__preempt_count_add(HARDIRQ_OFFSET);		\
+		/* NMI nesting is represented in 4 bits. */     \
+		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
+		__this_cpu_inc(nmi_nesting);			\
+		preempt_count_set(preempt_count() | NMI_MASK);  \
+	} while (0)
+
+#define __preempt_count_nmi_exit()				\
+	do {							\
+		__preempt_count_sub(HARDIRQ_OFFSET);		\
+		if (!__this_cpu_dec_return(nmi_nesting))	\
+			preempt_count_set(preempt_count() & ~NMI_MASK); \
+	} while (0)
+
+#endif
+
 /*
  * NMI vs Tracing
  * --------------
@@ -110,18 +139,14 @@ void irq_exit_rcu(void);
 	do {							\
 		lockdep_off();					\
 		arch_nmi_enter();				\
-		/* Maximum NMI nesting is 15. */		\
-		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
-		__this_cpu_inc(nmi_nesting);			\
-		__preempt_count_add(HARDIRQ_OFFSET);		\
-		preempt_count_set(preempt_count() | NMI_MASK);	\
+		__preempt_count_nmi_enter();			\
 	} while (0)
 
 #define nmi_enter()						\
 	do {							\
 		__nmi_enter();					\
 		lockdep_hardirq_enter();			\
-		ct_nmi_enter();				\
+		ct_nmi_enter();					\
 		instrumentation_begin();			\
 		ftrace_nmi_enter();				\
 		instrumentation_end();				\
@@ -129,12 +154,8 @@ void irq_exit_rcu(void);
 
 #define __nmi_exit()						\
 	do {							\
-		unsigned int nesting;				\
 		BUG_ON(!in_nmi());				\
-		__preempt_count_sub(HARDIRQ_OFFSET);		\
-		nesting = __this_cpu_dec_return(nmi_nesting);	\
-		if (!nesting)					\
-			preempt_count_set(preempt_count() & ~NMI_MASK);	\
+		__preempt_count_nmi_exit();			\
 		arch_nmi_exit();				\
 		lockdep_on();					\
 	} while (0)
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 33fc4c814a9f..8299657f0f86 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -34,14 +34,31 @@
  *         SOFTIRQ_MASK:	0x0000ff00
  * HARDIRQ_DISABLE_MASK:	0x00ff0000
  *         HARDIRQ_MASK:	0x0f000000
+ *
+ * When HAS_SEPARATE_PREEMPT_RESCHED_BITS=y, PREEMPT_NEED_RESCHED is put in a
+ * separate word and that allows 64bit load-store architectures to 'set'
+ * PREEMPT_NEED_RESCHED without messing up the otherwise symmetric
+ * modifications used on preempt_count and still load the whole thing
+ * (single-copy) atomically, without having to resort to full atomic
+ * operations.
+ *
+ * Because of the above, NMI_MASK bits are different depending on
+ * HAS_SEPARATE_PREEMPT_RESCHED_BITS:
+ *
+ * - HAS_SEPARATE_PREEMPT_RESCHED_BITS=n:
+ *
  *             NMI_MASK:	0x10000000
  * PREEMPT_NEED_RESCHED:	0x80000000
+ *
+ * - HAS_SEPARATE_PREEMPT_RESCHED_BITS=y:
+ *             NMI_MASK:	0xf0000000
+ * (PREEMPT_NEED_RESCHED is in a different word)
  */
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	1
+#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
@@ -116,8 +133,8 @@ static __always_inline unsigned char interrupt_context_level(void)
  * preempt_count() is commonly implemented with READ_ONCE().
  */
 
-#define nmi_count()	(preempt_count() & NMI_MASK)
-#define hardirq_count()	(preempt_count() & HARDIRQ_MASK)
+#define nmi_count()		(preempt_count() & NMI_MASK)
+#define hardirq_count()		(preempt_count() & HARDIRQ_MASK)
 #ifdef CONFIG_PREEMPT_RT
 # define softirq_count()	(current->softirq_disable_cnt & SOFTIRQ_MASK)
 # define irq_count()		((preempt_count() & (NMI_MASK | HARDIRQ_MASK)) | softirq_count())
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 88c594c6d7fc..35f546a042b1 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -122,6 +122,10 @@ config PREEMPT_RT_NEEDS_BH_LOCK
 config PREEMPT_COUNT
        bool
 
+config HAS_SEPARATE_PREEMPT_RESCHED_BITS
+	bool
+	depends on PREEMPT_COUNT && 64BIT
+
 config PREEMPTION
        bool
        select PREEMPT_COUNT
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9b3f1764fa9e..6d88343c3bad 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5973,8 +5973,13 @@ void preempt_count_add(int val)
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
 	 * Underflow?
+	 *
+	 * Cannot detect underflow based on the current preempt_count() value
+	 * if using HAS_SEPARATE_PREEMPT_RESCHED_BITS because preempt count takes all 32
+	 * bits.
 	 */
-	if (DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
+	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
+	    DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
 		return;
 #endif
 	__preempt_count_add(val);
@@ -6006,7 +6011,10 @@ void preempt_count_sub(int val)
 	/*
 	 * Underflow?
 	 */
-	if (DEBUG_LOCKS_WARN_ON(val > preempt_count()))
+	unsigned int uval = val;
+	unsigned int pc = preempt_count();
+
+	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
 		return;
 	/*
 	 * Is the spinlock portion underflowing?
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 0c9b2269a8d6..7980a4a232f9 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -103,7 +103,13 @@ void _local_interrupt_enable(void)
 }
 EXPORT_SYMBOL(_local_interrupt_enable);
 
+#ifndef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
+/*
+ * Any 32bit architecture that still cares about performance should
+ * probably ensure this is near preempt_count.
+ */
 DEFINE_PER_CPU(unsigned int, nmi_nesting);
+#endif
 
 /*
  * SOFTIRQ_OFFSET usage:
diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 0159a3d365c8..56520d551abd 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -368,7 +368,7 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	1
+#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-- 
2.50.1 (Apple Git-155)

