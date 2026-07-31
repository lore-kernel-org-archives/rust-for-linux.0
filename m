Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C625137C0EB
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529858; cv=none; b=tMo4jzaw/8mJ6RNN/7fJ7lbKjhP2I2ZPzqK1qpxCDwd2WFDXJQoSBPMzgFEzpaCs+Zn6unZfrMp+1dWB7pzp/uGx30jmzJC7gZfp24f1CcjSIk4kGqtLXgjp5ZGXzya+3LYvjPRjGMKvXQspaA7DGmucWCh/Joh96TXfv3fdHAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529858; c=relaxed/simple;
	bh=wDgCVjJ/tA3qX/HeiFMz1nTp8TMLkeOU11f9oh74hBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cu1uMUuACH6J7av2uQwOG6ZTOLsUselnrsjU/uXvS+GSfp5eEd/80bUgdsSWxOCqpu+dGPICdnCgMbLpupYPHys4u4pmCvfpQSPBYqmUaQr1wKlNF6ZBqE+Y//gMQ5QnB5Qk5vrCll3jMxzfBti0lHbzGsveZrrvft1zZlVjtt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFCAFdPx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFCAFdPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E444C1F00ADB;
	Fri, 31 Jul 2026 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529855;
	bh=IEhLMS7nxZRwSg2vdpqlNZceshQyW6DjfMg9v8g3lYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NFCAFdPxhdQh8BRnApTEFVGAXv4YfzWShQEXyhNJLpSbL4LVokBGlGo3YZs14pPfC
	 D4i6J8wzH4fZI6utppSDDVW/OKEoysuhKzsaVlZQYzyrfNCUvgHUiIhrErVpVkiVjb
	 797s6G9gh3458cRy32tWgGVudlMW23wXTfFT73qk+iijb4qBWe8SWHq+SPJ9Rl3mN1
	 gY/4C/z2zeQ9hYIAzZfWTjy2HegCnCZ4v0JUvu7RJDJqkYjBWpi8Ev+3AXz8m7GJCh
	 +brxbmfvc3X65waodSXFBfGAQXqvDb8SaRjQVTUBT57j7LNrGNkENb5IXcRfx6AgjM
	 Cik8xlerX00JA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1EC57F4007A;
	Fri, 31 Jul 2026 16:30:54 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 31 Jul 2026 16:30:54 -0400
X-ME-Sender: <xms:_gVtagL0vsYVPczdTU9X_t1rVs150iIV876wjJ_sBTzyPm_5t0nuxQ>
    <xme:_gVtalX43wwkf115nEJ5IRWPwlkPkxEEar4gKeE68xzmLv7DjqTr5AeyIwyaGbGZ4
    aW2djm5zRTMIeYmAVicyk6tl4Pu3b-xZjlEAzGpvUdKCPP08JH-qqY>
X-ME-Received: <xmr:_gVtakGiP3jwBnaP5ib1dAYb8NkEH42gQpryZrmeKLqLhX5JCYa4LTtuSykXYdcFz6BTU1EU9CK96vUb6Ft2O5PI4DCS1QSk>
X-ME-Proxy-Cause: dmFkZTFIC2VVTLK13uDkALWshPgkkwS9DC5Q8ljHaA42IPRnmgkrxQSeK5HYsDRhN4GhLk
    6Lg9dLbHgT0DH+qVaNoW+UUFxptAXHUIdqGwEJPczm0ywmTmF9/CSNIQrGZfaA0/SYDXt9
    FCHeSX4ZePBeVl3Top6EjJd42yXsFqp+L0LPuLnabUXIo8fT3yX5hMg5WmOramFVWkXrXb
    dtjJi0qTpjt7TXVawGUwOyoJ/Q6jP1wNaVQH+6xYGS7UXVpHVglHDWcX7SjmpbiByeHS7C
    oLMM3JHkGXdP7WkAt31sGvl3IAmYfCODupTHvovIO6+oDBZmEBw2YefLw5AUKyninHXIXb
    XzY00AcIvzX8Hr7Ddyn34ihLwau265zq/BOJSu2D80uZkRDGelLx79QX7cWFsiNnULjQtd
    +2o+HjfoKa9NPxNgeT1E+FmButCt60mA37kWV0NyX3kxtKSAFwC4sxB9sJ6hmorPm7Ftgy
    QQSeoyIcd5SmPXRiJkJwaeRf+nTDf0Ezs6j3n1IUpODt+59Gubrv9Qns2ff/5xNOGoIBY1
    DgxUdE/X6MapPz/cBPu/F/Xkf8MH6j7h5xRTRFauVURKKoTa8QY6q373qg02fcHHHJX21/
    SH2IwBQMLgNwOoqhmfUzQK78d7PQaV/a+W2F24bUrWi3YNvy810EtneAKV0g
X-ME-Proxy: <xmx:_gVtas666O5GtBMENd609HKvoHBTuPUvTokb4f6K6YWCQpEg0Ke0Fg>
    <xmx:_gVtaicxUI1Y3y9-P2EZochFrqshke7xEsdlv_O5wPrGhTHOzIR4XA>
    <xmx:_gVtaol3IprdBfvtTnOO9VpL27rinHTfxNARUeBjJbVCUbbsGu0uWQ>
    <xmx:_gVtan-MGduL0tzjPXNixKQgVKwvtkMRBcq4T6PWYCkwUW20YsLKZw>
    <xmx:_gVtauEAZGxSLqFoQ8p3jPncMuYUDllEuSQcv-TYMj5jkJJnHAAu6tPo>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:53 -0400 (EDT)
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
Subject: [PATCH 10/24] preempt: Introduce HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Fri, 31 Jul 2026 13:30:11 -0700
Message-ID: <20260731203031.13679-11-boqun@kernel.org>
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

With the changes that enable preempt count to tracking irq disabling
nesting, we don't have enough bits in 32bit preempt count
implementation, as a result we move NMI nesting bits out of the 32bit
preempt count. However on the architectures that can support 64bit
preempt count implementation, we can keep the NMI nesting bits in the
32bit preempt count and avoid maintaining NMI nesting bits out of the
same cache line.

Therefore HAS_SEPARATE_PREEMPT_RESCHED_BITS is introduced to allow
architectures to select this. Note that under this kconfig, preempt
count is maintained in a 64bit word however preempt_count() still
remains as an int because all the effective bits still fit in
(previously we mask out NEED_RESCHED bit in preempt_count()). This
should make no functional changes for existing preempt_count() users.

Enable this for x86_64 along with the introduction of the Kconfig.

[boqun: Undo the __preempt_count_{add,sub}() optimization in 32bit
preempt count since it may introduce {over,under}flow]

Originally-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 arch/x86/Kconfig               |  1 +
 arch/x86/include/asm/preempt.h | 55 +++++++++++++++++++++++-----------
 arch/x86/kernel/cpu/common.c   |  2 +-
 include/linux/hardirq.h        | 48 +++++++++++++++++++++--------
 include/linux/preempt.h        | 20 +++++++------
 kernel/Kconfig.preempt         |  4 +++
 kernel/sched/core.c            | 12 ++++++--
 kernel/softirq.c               |  6 ++++
 lib/locking-selftest.c         |  2 +-
 9 files changed, 107 insertions(+), 43 deletions(-)

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
index 1220656f3370..12353eeebc52 100644
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
+ *   reserve the NEED_RESCHED bit from the old count.
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
index 8d4895531a45..b5dc907274db 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -10,8 +10,6 @@
 #include <linux/vtime.h>
 #include <asm/hardirq.h>
 
-DECLARE_PER_CPU(unsigned int, nmi_nesting);
-
 extern void synchronize_irq(unsigned int irq);
 extern bool synchronize_hardirq(unsigned int irq);
 
@@ -94,6 +92,38 @@ void irq_exit_rcu(void);
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
+		/* Maximum NMI nesting is 15. */		\
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
+
 /*
  * NMI vs Tracing
  * --------------
@@ -110,18 +140,14 @@ void irq_exit_rcu(void);
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
@@ -129,12 +155,8 @@ void irq_exit_rcu(void);
 
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
index 33fc4c814a9f..87d5367f986c 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -30,18 +30,20 @@
  * NMI nesting depth is tracked in a separate per-CPU variable
  * (nmi_nesting) to save bits in preempt_count.
  *
- *         PREEMPT_MASK:	0x000000ff
- *         SOFTIRQ_MASK:	0x0000ff00
- * HARDIRQ_DISABLE_MASK:	0x00ff0000
- *         HARDIRQ_MASK:	0x0f000000
- *             NMI_MASK:	0x10000000
- * PREEMPT_NEED_RESCHED:	0x80000000
+ *				32bit		HAS_SEPARATE_PREEMPT_RESCHED_BITS
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
 #define HARDIRQ_DISABLE_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	1
+#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
@@ -116,8 +118,8 @@ static __always_inline unsigned char interrupt_context_level(void)
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
index d1ab1799794c..491136a313db 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -91,7 +91,13 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
 EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
 
+#ifndef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
+/*
+ * Any 32bit architecture that still cares about performance should
+ * probably ensure this is near preempt_count.
+ */
 DEFINE_PER_CPU(unsigned int, nmi_nesting);
+#endif
 
 /*
  * SOFTIRQ_OFFSET usage:
diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index bfafe1204c7b..c3d976c801bb 100644
--- a/lib/locking-selftest.c
+++ b/lib/locking-selftest.c
@@ -1429,7 +1429,7 @@ static int unexpected_testcase_failures;
 
 static void dotest(void (*testcase_fn)(void), int expected, int lockclass_mask)
 {
-	int saved_preempt_count = preempt_count();
+	long saved_preempt_count = preempt_count();
 #ifdef CONFIG_PREEMPT_RT
 	int saved_mgd_count = current->migration_disabled;
 	int saved_rcu_count = current->rcu_read_lock_nesting;
-- 
2.50.1 (Apple Git-155)

