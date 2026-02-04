Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7D13D1CCC;
	Wed,  4 Feb 2026 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203566; cv=none; b=sKkdgUd4TlG8akFSJNgRTZqMyeHKPzDPXtJHCZCR9fUGtRMKAG+V/4wo1WWiMVE5FY9Qh4TBEjb8XrMbgP/8jlRCJQhpgALGPJ820/4xDHQd0bZqH4Qr1AxioWsTzCDDEJampnXrNd5ZivMzatXzGHKXC47eLwj107wD8J3vMSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203566; c=relaxed/simple;
	bh=LLOiCgvCcIqhqxTFiYN/Cxzkgk8my+BZ8Q+wONoP4WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XB7Fh4V0VjsXFHhFCfFKGi5VhlpEPmJXEVxTv7ZciZlJQAgEWHuHdxPh658UKLSRM5lkOhm71mHbuKLUrB4CKp5fpJMmRH1NVDrXv+2AckjFGMTtEICkZzBGm1HbNBuZ72im/4ZQBU9lhPKdIvbaWNRCU3jzvMF8jaJ7s1ZETMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PmK3TmiU; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PmK3TmiU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xebr8N6zuj++iO3tdM1wrJYQzE8kDlvSfex0uf/j8kM=; b=PmK3TmiUptdGt6r9ssg1rN6zYI
	fmVk9iIoEhF7h+eEu2lgx2YQkp0PMgyCqn/FsZ/4wiaNTVAgeci0jWkngRMMOJrLSiqxo68+N+Nfa
	x1FTrZkch+/taNS5dwqeUvdg5ZN8LYIkEu9WuQMkbIIiyTiQyB9JVuCVq9SC1irE4rs3wdLAiGBjm
	EVf/ShZ9AkHkj9pBIPtVBONMzf354mAzl2uheWg9LbR57r7vTCXclfnj0RoVyqErJl1V6YLGOTas+
	g6seF3QUofKRj6MInKWq2MJIWHD8wcm8U5XcjG46k9Pk6s/JdIjveEU/Jfc9zRLh1a7fwyOb+T8fZ
	6un2P0Ow==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnaoE-00000000NAd-3IBe;
	Wed, 04 Feb 2026 11:12:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0A3D8300BD2; Wed, 04 Feb 2026 12:12:34 +0100 (CET)
Date: Wed, 4 Feb 2026 12:12:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203121520.GN1282955@noisy.programming.kicks-ass.net>

On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
> But I'm really somewhat sad that 64bit can't do better than this.

Here, the below builds and boots (albeit with warnings because printf
format crap sucks).

---
 arch/x86/Kconfig               |  1 +
 arch/x86/include/asm/preempt.h | 53 ++++++++++++++++++++++++++++++------------
 arch/x86/kernel/cpu/common.c   |  2 +-
 include/linux/hardirq.h        |  7 +++---
 include/linux/preempt.h        | 52 ++++++++++++++++++++++++++++++++++-------
 init/main.c                    |  2 +-
 kernel/Kconfig.preempt         |  4 ++++
 kernel/sched/core.c            |  8 +++----
 kernel/softirq.c               | 10 +++++++-
 kernel/time/timer.c            |  2 +-
 lib/locking-selftest.c         |  2 +-
 11 files changed, 106 insertions(+), 37 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..2bd1972fd4c7 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -326,6 +326,7 @@ config X86
 	select USER_STACKTRACE_SUPPORT
 	select HAVE_ARCH_KCSAN			if X86_64
 	select PROC_PID_ARCH_STATUS		if PROC_FS
+	select PREEMPT_LONG			if X86_64
 	select HAVE_ARCH_NODE_DEV_GROUP		if X86_SGX
 	select FUNCTION_ALIGNMENT_16B		if X86_64 || X86_ALIGNMENT_16
 	select FUNCTION_ALIGNMENT_4B
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index 578441db09f0..1b54d5555138 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -7,10 +7,19 @@
 
 #include <linux/static_call_types.h>
 
-DECLARE_PER_CPU_CACHE_HOT(int, __preempt_count);
+DECLARE_PER_CPU_CACHE_HOT(unsigned long, __preempt_count);
 
-/* We use the MSB mostly because its available */
-#define PREEMPT_NEED_RESCHED	0x80000000
+/*
+ * We use the MSB for PREEMPT_NEED_RESCHED mostly because it is available.
+ */
+
+#ifdef CONFIG_64BIT
+#define PREEMPT_NEED_RESCHED	(~((-1L) >> 1))
+#define __pc_op(op, ...)	raw_cpu_##op##_8(__VA_ARGS__)
+#else
+#define PREEMPT_NEED_RESCHED	(~((-1) >> 1))
+#define __pc_op(op, ...)	raw_cpu_##op##_4(__VA_ARGS__)
+#endif
 
 /*
  * We use the PREEMPT_NEED_RESCHED bit as an inverted NEED_RESCHED such
@@ -24,18 +33,18 @@ DECLARE_PER_CPU_CACHE_HOT(int, __preempt_count);
  */
 static __always_inline int preempt_count(void)
 {
-	return raw_cpu_read_4(__preempt_count) & ~PREEMPT_NEED_RESCHED;
+	return __pc_op(read, __preempt_count) & ~PREEMPT_NEED_RESCHED;
 }
 
-static __always_inline void preempt_count_set(int pc)
+static __always_inline void preempt_count_set(long pc)
 {
 	int old, new;
 
-	old = raw_cpu_read_4(__preempt_count);
+	old = __pc_op(read, __preempt_count);
 	do {
 		new = (old & PREEMPT_NEED_RESCHED) |
 			(pc & ~PREEMPT_NEED_RESCHED);
-	} while (!raw_cpu_try_cmpxchg_4(__preempt_count, &old, new));
+	} while (!__pc_op(try_cmpxchg, __preempt_count, &old, new));
 }
 
 /*
@@ -58,33 +67,45 @@ static __always_inline void preempt_count_set(int pc)
 
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
  * The various preempt_count add/sub methods
  */
 
-static __always_inline void __preempt_count_add(int val)
+static __always_inline void __preempt_count_add(long val)
 {
-	raw_cpu_add_4(__preempt_count, val);
+	__pc_op(add, __preempt_count, val);
 }
 
-static __always_inline void __preempt_count_sub(int val)
+static __always_inline void __preempt_count_sub(long val)
 {
-	raw_cpu_add_4(__preempt_count, -val);
+	__pc_op(add, __preempt_count, -val);
 }
 
+#ifdef CONFIG_64BIT
+static __always_inline void __preempt_count_nmi_enter(void)
+{
+	__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);
+}
+
+static __always_inline void __preempt_count_nmi_exit(void)
+{
+	__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);
+}
+#endif
+
 /*
  * Because we keep PREEMPT_NEED_RESCHED set when we do _not_ need to reschedule
  * a decrement which hits zero means we have no preempt_count and should
@@ -101,7 +122,7 @@ static __always_inline bool __preempt_count_dec_and_test(void)
  */
 static __always_inline bool should_resched(int preempt_offset)
 {
-	return unlikely(raw_cpu_read_4(__preempt_count) == preempt_offset);
+	return unlikely(__pc_op(read, __preempt_count) == preempt_offset);
 }
 
 #ifdef CONFIG_PREEMPTION
@@ -148,4 +169,6 @@ do { \
 
 #endif /* PREEMPTION */
 
+#undef __pc_op
+
 #endif /* __ASM_PREEMPT_H */
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index e7ab22fce3b5..9d3602f085c9 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2219,7 +2219,7 @@ DEFINE_PER_CPU_CACHE_HOT(struct task_struct *, current_task) = &init_task;
 EXPORT_PER_CPU_SYMBOL(current_task);
 EXPORT_PER_CPU_SYMBOL(const_current_task);
 
-DEFINE_PER_CPU_CACHE_HOT(int, __preempt_count) = INIT_PREEMPT_COUNT;
+DEFINE_PER_CPU_CACHE_HOT(unsigned long, __preempt_count) = INIT_PREEMPT_COUNT;
 EXPORT_PER_CPU_SYMBOL(__preempt_count);
 
 DEFINE_PER_CPU_CACHE_HOT(unsigned long, cpu_current_top_of_stack) = TOP_OF_INIT_STACK;
diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index d57cab4d4c06..77defd9624bf 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -108,15 +108,14 @@ void irq_exit_rcu(void);
 	do {							\
 		lockdep_off();					\
 		arch_nmi_enter();				\
-		BUG_ON(in_nmi() == NMI_MASK);			\
-		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
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
@@ -125,7 +124,7 @@ void irq_exit_rcu(void);
 #define __nmi_exit()						\
 	do {							\
 		BUG_ON(!in_nmi());				\
-		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
+		__preempt_count_nmi_exit();			\
 		arch_nmi_exit();				\
 		lockdep_on();					\
 	} while (0)
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index d964f965c8ff..7617ca97f442 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -17,6 +17,9 @@
  *
  * - bits 0-7 are the preemption count (max preemption depth: 256)
  * - bits 8-15 are the softirq count (max # of softirqs: 256)
+ * - bits 16-23 are the hardirq disable count (max # of hardirq disable: 256)
+ * - bits 24-27 are the hardirq count (max # of hardirqs: 16)
+ * - bit 28 is the NMI flag (no nesting count, tracked separately)
  *
  * The hardirq count could in theory be the same as the number of
  * interrupts in the system, but we run all interrupt handlers with
@@ -24,31 +27,41 @@
  * there are a few palaeontologic drivers which reenable interrupts in
  * the handler, so we need more than one bit here.
  *
- *         PREEMPT_MASK:	0x000000ff
- *         SOFTIRQ_MASK:	0x0000ff00
- *         HARDIRQ_MASK:	0x000f0000
- *             NMI_MASK:	0x00f00000
- * PREEMPT_NEED_RESCHED:	0x80000000
+ * NMI nesting depth is tracked in a separate per-CPU variable
+ * (nmi_nesting) to save bits in preempt_count.
+ *
+ *				32bit		64bit + PREEMPT_LONG
+ *
+ *         PREEMPT_MASK:	0x000000ff	0x00000000000000ff
+ *         SOFTIRQ_MASK:	0x0000ff00	0x000000000000ff00
+ * HARDIRQ_DISABLE_MASK:	0x00ff0000	0x0000000000ff0000
+ *         HARDIRQ_MASK:	0x0f000000	0x000000000f000000
+ *             NMI_MASK:	0x10000000	0x00000000f0000000
+ * PREEMPT_NEED_RESCHED:	0x80000000	0x8000000000000000
  */
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
+#define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	4
+#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_PREEMPT_LONG))
 
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
 
@@ -105,8 +118,8 @@ static __always_inline unsigned char interrupt_context_level(void)
  * preempt_count() is commonly implemented with READ_ONCE().
  */
 
-#define nmi_count()	(preempt_count() & NMI_MASK)
-#define hardirq_count()	(preempt_count() & HARDIRQ_MASK)
+#define nmi_count()		(preempt_count() & NMI_MASK)
+#define hardirq_count()		(preempt_count() & HARDIRQ_MASK)
 #ifdef CONFIG_PREEMPT_RT
 # define softirq_count()	(current->softirq_disable_cnt & SOFTIRQ_MASK)
 # define irq_count()		((preempt_count() & (NMI_MASK | HARDIRQ_MASK)) | softirq_count())
@@ -132,6 +145,27 @@ static __always_inline unsigned char interrupt_context_level(void)
 # define in_task()		(!(preempt_count() & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)))
 #endif
 
+#ifndef CONFIG_PREEMPT_LONG
+DECLARE_PER_CPU(unsigned int, nmi_nesting);
+
+#define __preempt_count_nmi_enter()				\
+	do {							\
+		unsigned int _o = NMI_MASK + HARDIRQ_OFFSET;	\
+		__this_cpu_inc(nmi_nesting);			\
+		_o -= (preempt_count() & NMI_MASK);		\
+		__preempt_count_add(_o);			\
+	} while (0)
+
+#define __preempt_count_nmi_exit()				\
+	do {							\
+		unsigned int _o = HARDIRQ_OFFSET;		\
+		if (!__this_cpu_dec_return(nmi_nesting))	\
+			_o += NMI_MASK;				\
+		__preempt_count_sub(_o);			\
+	} while (0)
+
+#endif
+
 /*
  * The following macros are deprecated and should not be used in new code:
  * in_softirq()   - We have BH disabled, or are processing softirqs
diff --git a/init/main.c b/init/main.c
index b84818ad9685..f8f4b78b7a06 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1367,7 +1367,7 @@ static inline void do_trace_initcall_level(const char *level)
 
 int __init_or_module do_one_initcall(initcall_t fn)
 {
-	int count = preempt_count();
+	long count = preempt_count();
 	char msgbuf[64];
 	int ret;
 
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 88c594c6d7fc..2ad9365915eb 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -122,6 +122,10 @@ config PREEMPT_RT_NEEDS_BH_LOCK
 config PREEMPT_COUNT
        bool
 
+config PREEMPT_LONG
+	bool
+	depends on PREEMPT_COUNT && 64BIT
+
 config PREEMPTION
        bool
        select PREEMPT_COUNT
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b411e4feff7f..f54dd3cb66f2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5709,7 +5709,7 @@ static inline void sched_tick_stop(int cpu) { }
  * If the value passed in is equal to the current preempt count
  * then we just disabled preemption. Start timing the latency.
  */
-static inline void preempt_latency_start(int val)
+static inline void preempt_latency_start(long val)
 {
 	if (preempt_count() == val) {
 		unsigned long ip = get_lock_parent_ip();
@@ -5746,7 +5746,7 @@ NOKPROBE_SYMBOL(preempt_count_add);
  * If the value passed in equals to the current preempt count
  * then we just enabled preemption. Stop timing the latency.
  */
-static inline void preempt_latency_stop(int val)
+static inline void preempt_latency_stop(long val)
 {
 	if (preempt_count() == val)
 		trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
@@ -8774,7 +8774,7 @@ void __might_sleep(const char *file, int line)
 }
 EXPORT_SYMBOL(__might_sleep);
 
-static void print_preempt_disable_ip(int preempt_offset, unsigned long ip)
+static void print_preempt_disable_ip(long preempt_offset, unsigned long ip)
 {
 	if (!IS_ENABLED(CONFIG_DEBUG_PREEMPT))
 		return;
@@ -8846,7 +8846,7 @@ void __might_resched(const char *file, int line, unsigned int offsets)
 }
 EXPORT_SYMBOL(__might_resched);
 
-void __cant_sleep(const char *file, int line, int preempt_offset)
+void __cant_sleep(const char *file, int line, long preempt_offset)
 {
 	static unsigned long prev_jiffy;
 
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 77198911b8dd..51a7f391edab 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -88,6 +88,14 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
 EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 #endif
 
+#ifndef CONFIG_PREEMPT_LONG
+/*
+ * Any 32bit architecture that still cares about performance should
+ * probably ensure this is near preempt_count.
+ */
+DEFINE_PER_CPU(unsigned int, nmi_nesting);
+#endif
+
 /*
  * SOFTIRQ_OFFSET usage:
  *
@@ -609,7 +617,7 @@ static void handle_softirqs(bool ksirqd)
 
 	while ((softirq_bit = ffs(pending))) {
 		unsigned int vec_nr;
-		int prev_count;
+		long prev_count;
 
 		h += softirq_bit - 1;
 
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 1f2364126894..89c348139218 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1723,7 +1723,7 @@ static void call_timer_fn(struct timer_list *timer,
 			  void (*fn)(struct timer_list *),
 			  unsigned long baseclk)
 {
-	int count = preempt_count();
+	long count = preempt_count();
 
 #ifdef CONFIG_LOCKDEP
 	/*
diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index d939403331b5..8fd216bd0be6 100644
--- a/lib/locking-selftest.c
+++ b/lib/locking-selftest.c
@@ -1429,7 +1429,7 @@ static int unexpected_testcase_failures;
 
 static void dotest(void (*testcase_fn)(void), int expected, int lockclass_mask)
 {
-	int saved_preempt_count = preempt_count();
+	long saved_preempt_count = preempt_count();
 #ifdef CONFIG_PREEMPT_RT
 #ifdef CONFIG_SMP
 	int saved_mgd_count = current->migration_disabled;
