Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4BB37C926
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529852; cv=none; b=ZMATfP5Fn9mEkjQyCDQ4oirknlepOUa6nDLQhyMYI+dHpkcqcLrGgZAW8Ejz37GHv/CpHxUh+HUynCpP0eePc5h8EPMNzWqVNoT8xmqEC0wkupsYlnE2a9F5L9j/78mRU8bKqkNmUkmdAgtyUh0JDj5oeaQaeT02syu43uI7y+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529852; c=relaxed/simple;
	bh=to0RP4Su+MQgZQGe+JSAj9EmfBFi1aiWWRZPL1K6doM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mS/n3Ay2c8cAH720WF3KPeMYmjGOmMWjBHAt41UlG7WPjvyrIsjz/OCAguQtpblmGRHyMiJjj0bAzz+fSg8f9WyN+d2XEVlt56ELvrrse2Xj0XPUXq3EirbMWg77+pqizA0Fh83PeHOQBeqIeOlE/Aucp4DfuwSaZbuMpM12n5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoQceZ+h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoQceZ+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9F71F00ADB;
	Fri, 31 Jul 2026 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529848;
	bh=zaL3yYnLyWfmGyr/NqPQXNi1BCOD+TsBumBelPwYXZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RoQceZ+hUp1rg8GPyHAGDnRvHPFS6xqsRB+t0wUW1Ik7cBr+WCoElE0OICEUPmWUU
	 jsr9wgJS3vvAtEiByxvWpNkrLRtZugnF6oBIlORt6UbxBPWZde2jkstaCGC1bTKXLk
	 CviQkiLoCvACnZsfsFGQvgA7sUWlNThmCzPsATMW+mucQMWcGiGmztGcdO7yFFIn+P
	 7WiVstZSLAjEyDYUBa0yZ907emNphUyLqGONb6mh8XVvKC+oB1uXpRRCJo3Uk8Ezdd
	 c/lz3/1urYU3Ti5ga/tKZBfjw8U9y/kXYQzHZdsH1As2r3cyNGq6Oh6yieUArcqDjf
	 w1DBNuFXSXwpA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1483AF40077;
	Fri, 31 Jul 2026 16:30:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 31 Jul 2026 16:30:47 -0400
X-ME-Sender: <xms:9wVtaqsqzDLQXEHgSi3SH3M2z6zojpV8XiSIG1AelsDP-RC_i6llFw>
    <xme:9wVtap3hHDZWT-KvHhy-4AQwI4ngUW_kKhyDzH7RLi8TgpWnBorkvm1uGiQu-mAoj
    _zZGh4LsSSva_cSC_BM7vWuvkdDTO6cL_1H8MqhXOiIOmiE6bP0Ng>
X-ME-Received: <xmr:9wVtar69gcyfVgBDkmA3grboplej2OPbMgY7GihQ98u6ULrfDYMVArRA6ANOF2P-hZFK8hg5OA03s9IzNzRcRUOWJUnmTEm6>
X-ME-Proxy-Cause: dmFkZTFdRdBIF8ZH/aPs2g1lRw7GATpB3kPZdHQ9SRq3TCfYELIaqSZraFLrXlLQvfZ+Zw
    L2FnPfSJd952oWr+y28mIfAsYcvh2g32U0J8iwTV49f0k9Q8hXOe/2BgVhInUEnjhmC2lX
    03vYTAlN0bq9NjF03uLbRgPGL4766SVn/XbgM9h+YDdXpmZY+TYoTPsYcygLFMbtetKCiX
    MKKxau189OoX/tBJGac9kkLntk5lYAb6ORV5iOKO0UE2KpFdBfn5cZVhjAZINCJF+DQAjd
    IJX9TqJvKbTOKjLKBWundtWMSfFqKbkgkDYizysOgKGZkbbhOs1gMmPcuy0Gf54a13j8Sm
    UmcOx+4EJMNfu9gA3gGgYz1gzu+a4+d94aVOKt5anODL+/3E7yxXwwzjNpfdo40eps/Wyf
    gPSt3mJoNlaSArxLVpobfg9Ft9lBRSYviLs5I+hPo0Nh5dK3m2O5D1pszFbqkNE49y/8zQ
    1oK7tEwgDcnpBynAAhBEWfuERsmQvR6/YJm4hUhTGuweThq921ru5hhpb95zIadA+T9qd+
    m4HEsRWEVhYgp+JiNJ7Yjmj7u9fLG3RBAtst1BOcQHlog1qYg36w5hLwCF1/KK2S7xGZoV
    qgfDgcC7mkgta4Y+gZYU/26LFoYzoIb08s0aiqp1PLwkH/NpqhRq6nLiC2lw
X-ME-Proxy: <xmx:9wVtagWiRW7BZMvihy_wa-i4Ym6KYbBSVaqqAQQ7hfvsbA7E-4bKFQ>
    <xmx:9wVtajh__cnwHVvF9TH99L-RWVtJurlHP8ns3dl8vjg_O_jEoC3QDQ>
    <xmx:9wVtagfuhcxmzQntTMYKZXgkEcU8BP9AmU4P6YLHwlLOBmD7Bij0XQ>
    <xmx:9wVtai0TOEohrPJdwqxldzeC3xbKnIw-KzqLXgCGOlDSybvWgnyHdA>
    <xmx:9wVtaspnKAU2Jnx5T1EcU0hFjeub_U___XHoL-Dhjhg1RGnnavBhyEX1>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:46 -0400 (EDT)
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
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 05/24] irq & spin_lock: Add counted interrupt disabling/enabling
Date: Fri, 31 Jul 2026 13:30:06 -0700
Message-ID: <20260731203031.13679-6-boqun@kernel.org>
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

From: Boqun Feng <boqun.feng@gmail.com>

Currently the nested interrupt disabling and enabling is present by
_irqsave() and _irqrestore() APIs, which are relatively unsafe, for
example:

	<interrupts are enabled as beginning>
	spin_lock_irqsave(l1, flag1);
	spin_lock_irqsave(l2, flag2);
	spin_unlock_irqrestore(l1, flags1);
	<l2 is still held but interrupts are enabled>
	// accesses to interrupt-disable protect data will cause races.

This is even easier to triggered with guard facilities:

	unsigned long flag2;

	scoped_guard(spin_lock_irqsave, l1) {
		spin_lock_irqsave(l2, flag2);
	}
	// l2 locked but interrupts are enabled.
	spin_unlock_irqrestore(l2, flag2);

(Hand-to-hand locking critical sections are not uncommon for a
fine-grained lock design)

And because this unsafety, Rust cannot easily wrap the
interrupt-disabling locks in a safe API, which complicates the design.

To resolve this, introduce a new set of interrupt disabling APIs:

*	local_interrupt_disable();
*	local_interrupt_enable();

They work like local_irq_save() and local_irq_restore() except that 1)
the outermost local_interrupt_disable() call save the interrupt state
into a percpu variable, so that the outermost local_interrupt_enable()
can restore the state, and 2) a percpu counter is added to record the
nest level of these calls, so that interrupts are not accidentally
enabled inside the outermost critical section.

Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
and spin_unlock_irq_enable(), as a result, code as follow:

	spin_lock_irq_disable(l1);
	spin_lock_irq_disable(l2);
	spin_unlock_irq_enable(l1);
	// Interrupts are still disabled.
	spin_unlock_irq_enable(l2);

doesn't have the issue that interrupts are accidentally enabled.

This also makes the wrapper of interrupt-disabling locks on Rust easier
to design.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260121223933.1568682-6-lyude@redhat.com
---
 include/linux/interrupt_rc.h     | 67 ++++++++++++++++++++++++++++++++
 include/linux/preempt.h          |  4 ++
 include/linux/spinlock.h         | 23 +++++++++++
 include/linux/spinlock_api_smp.h | 41 +++++++++++++++++++
 include/linux/spinlock_api_up.h  | 16 ++++++++
 include/linux/spinlock_rt.h      | 18 +++++++++
 kernel/locking/spinlock.c        | 29 ++++++++++++++
 kernel/softirq.c                 | 14 ++++++-
 8 files changed, 211 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/interrupt_rc.h

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
new file mode 100644
index 000000000000..dd4444c61330
--- /dev/null
+++ b/include/linux/interrupt_rc.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * include/linux/interrupt_rc.h - refcounted local processor interrupt
+ * management.
+ *
+ * Since the implementation of this API currently depends on
+ * local_irq_save()/local_irq_restore(), we split this into it's own header to
+ * make it easier to include without hitting circular header dependencies.
+ */
+
+#ifndef __LINUX_INTERRUPT_RC_H
+#define __LINUX_INTERRUPT_RC_H
+
+#include <linux/irqflags.h>
+#include <asm/processor.h>
+#ifdef CONFIG_SMP
+#include <asm/smp.h>
+#endif
+
+/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
+struct interrupt_disable_state {
+	unsigned long flags;
+};
+
+DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
+
+static inline void local_interrupt_disable(void)
+{
+	unsigned long flags;
+	int new_count;
+
+	WARN_ON_ONCE(in_nmi());
+
+	new_count = hardirq_disable_enter();
+
+	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
+
+	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
+		local_irq_save(flags);
+		raw_cpu_write(local_interrupt_disable_state.flags, flags);
+	}
+}
+
+static inline void local_interrupt_enable(void)
+{
+	int new_count;
+
+	new_count = hardirq_disable_exit();
+
+	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
+		unsigned long flags;
+
+		flags = raw_cpu_read(local_interrupt_disable_state.flags);
+		local_irq_restore(flags);
+		/*
+		 * TODO: re-read preempt count can be avoided, but it needs
+		 * should_resched() taking another parameter as the current
+		 * preempt count
+		 */
+#ifdef CONFIG_PREEMPTION
+		if (should_resched(0))
+			__preempt_schedule();
+#endif
+	}
+}
+
+#endif /* !__LINUX_INTERRUPT_RC_H */
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index e2d3079d3f5f..33fc4c814a9f 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -151,6 +151,10 @@ static __always_inline unsigned char interrupt_context_level(void)
 #define in_softirq()		(softirq_count())
 #define in_interrupt()		(irq_count())
 
+#define hardirq_disable_count()	((preempt_count() & HARDIRQ_DISABLE_MASK) >> HARDIRQ_DISABLE_SHIFT)
+#define hardirq_disable_enter()	__preempt_count_add_return(HARDIRQ_DISABLE_OFFSET)
+#define hardirq_disable_exit()	__preempt_count_sub_return(HARDIRQ_DISABLE_OFFSET)
+
 /*
  * The preempt_count offset after preempt_disable();
  */
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 241277cd34cf..3d405cc4c121 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -57,6 +57,7 @@
 #include <linux/linkage.h>
 #include <linux/compiler.h>
 #include <linux/irqflags.h>
+#include <linux/interrupt_rc.h>
 #include <linux/thread_info.h>
 #include <linux/stringify.h>
 #include <linux/bottom_half.h>
@@ -273,9 +274,11 @@ static inline void do_raw_spin_unlock(raw_spinlock_t *lock) __releases(lock)
 #endif
 
 #define raw_spin_lock_irq(lock)		_raw_spin_lock_irq(lock)
+#define raw_spin_lock_irq_disable(lock)	_raw_spin_lock_irq_disable(lock)
 #define raw_spin_lock_bh(lock)		_raw_spin_lock_bh(lock)
 #define raw_spin_unlock(lock)		_raw_spin_unlock(lock)
 #define raw_spin_unlock_irq(lock)	_raw_spin_unlock_irq(lock)
+#define raw_spin_unlock_irq_enable(lock)	_raw_spin_unlock_irq_enable(lock)
 
 #define raw_spin_unlock_irqrestore(lock, flags)		\
 	do {							\
@@ -290,6 +293,8 @@ static inline void do_raw_spin_unlock(raw_spinlock_t *lock) __releases(lock)
 
 #define raw_spin_trylock_irqsave(lock, flags) _raw_spin_trylock_irqsave(lock, &(flags))
 
+#define raw_spin_trylock_irq_disable(lock)	_raw_spin_trylock_irq_disable(lock)
+
 #ifndef CONFIG_PREEMPT_RT
 /* Include rwlock functions for !RT */
 #include <linux/rwlock.h>
@@ -372,6 +377,12 @@ static __always_inline void spin_lock_irq(spinlock_t *lock)
 	raw_spin_lock_irq(&lock->rlock);
 }
 
+static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
+	__acquires(lock) __no_context_analysis
+{
+	raw_spin_lock_irq_disable(&lock->rlock);
+}
+
 #define spin_lock_irqsave(lock, flags)				\
 do {								\
 	raw_spin_lock_irqsave(spinlock_check(lock), flags);	\
@@ -402,6 +413,12 @@ static __always_inline void spin_unlock_irq(spinlock_t *lock)
 	raw_spin_unlock_irq(&lock->rlock);
 }
 
+static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
+	__releases(lock) __no_context_analysis
+{
+	raw_spin_unlock_irq_enable(&lock->rlock);
+}
+
 static __always_inline void spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
 	__releases(lock) __no_context_analysis
 {
@@ -427,6 +444,12 @@ static __always_inline bool _spin_trylock_irqsave(spinlock_t *lock, unsigned lon
 }
 #define spin_trylock_irqsave(lock, flags) _spin_trylock_irqsave(lock, &(flags))
 
+static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
+	__cond_acquires(true, lock) __no_context_analysis
+{
+	return raw_spin_trylock_irq_disable(&lock->rlock);
+}
+
 /**
  * spin_is_locked() - Check whether a spinlock is locked.
  * @lock: Pointer to the spinlock.
diff --git a/include/linux/spinlock_api_smp.h b/include/linux/spinlock_api_smp.h
index bda5e7a390cd..07a94ba1d760 100644
--- a/include/linux/spinlock_api_smp.h
+++ b/include/linux/spinlock_api_smp.h
@@ -28,6 +28,8 @@ _raw_spin_lock_nest_lock(raw_spinlock_t *lock, struct lockdep_map *map)
 void __lockfunc _raw_spin_lock_bh(raw_spinlock_t *lock)		__acquires(lock);
 void __lockfunc _raw_spin_lock_irq(raw_spinlock_t *lock)
 								__acquires(lock);
+void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+								__acquires(lock);
 
 unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
 								__acquires(lock);
@@ -39,6 +41,7 @@ int __lockfunc _raw_spin_trylock_bh(raw_spinlock_t *lock)	__cond_acquires(true,
 void __lockfunc _raw_spin_unlock(raw_spinlock_t *lock)		__releases(lock);
 void __lockfunc _raw_spin_unlock_bh(raw_spinlock_t *lock)	__releases(lock);
 void __lockfunc _raw_spin_unlock_irq(raw_spinlock_t *lock)	__releases(lock);
+void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)	__releases(lock);
 void __lockfunc
 _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
 								__releases(lock);
@@ -55,6 +58,11 @@ _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
 #define _raw_spin_lock_irq(lock) __raw_spin_lock_irq(lock)
 #endif
 
+/* Use the same config as spin_lock_irq() temporarily. */
+#ifdef CONFIG_INLINE_SPIN_LOCK_IRQ
+#define _raw_spin_lock_irq_disable(lock) __raw_spin_lock_irq_disable(lock)
+#endif
+
 #ifdef CONFIG_INLINE_SPIN_LOCK_IRQSAVE
 #define _raw_spin_lock_irqsave(lock) __raw_spin_lock_irqsave(lock)
 #endif
@@ -79,6 +87,11 @@ _raw_spin_unlock_irqrestore(raw_spinlock_t *lock, unsigned long flags)
 #define _raw_spin_unlock_irq(lock) __raw_spin_unlock_irq(lock)
 #endif
 
+/* Use the same config as spin_unlock_irq() temporarily. */
+#ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQ
+#define _raw_spin_unlock_irq_enable(lock) __raw_spin_unlock_irq_enable(lock)
+#endif
+
 #ifdef CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE
 #define _raw_spin_unlock_irqrestore(lock, flags) __raw_spin_unlock_irqrestore(lock, flags)
 #endif
@@ -105,6 +118,18 @@ static __always_inline bool _raw_spin_trylock_irq(raw_spinlock_t *lock)
 	return false;
 }
 
+static __always_inline bool _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
+	__cond_acquires(true, lock)
+{
+	local_interrupt_disable();
+	if (do_raw_spin_trylock(lock)) {
+		spin_acquire(&lock->dep_map, 0, 1, _RET_IP_);
+		return true;
+	}
+	local_interrupt_enable();
+	return false;
+}
+
 static __always_inline bool _raw_spin_trylock_irqsave(raw_spinlock_t *lock, unsigned long *flags)
 	__cond_acquires(true, lock)
 {
@@ -143,6 +168,14 @@ static inline void __raw_spin_lock_irq(raw_spinlock_t *lock)
 	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
 }
 
+static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+	__acquires(lock) __no_context_analysis
+{
+	local_interrupt_disable();
+	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
+	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
+}
+
 static inline void __raw_spin_lock_bh(raw_spinlock_t *lock)
 	__acquires(lock) __no_context_analysis
 {
@@ -188,6 +221,14 @@ static inline void __raw_spin_unlock_irq(raw_spinlock_t *lock)
 	preempt_enable();
 }
 
+static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
+	__releases(lock)
+{
+	spin_release(&lock->dep_map, _RET_IP_);
+	do_raw_spin_unlock(lock);
+	local_interrupt_enable();
+}
+
 static inline void __raw_spin_unlock_bh(raw_spinlock_t *lock)
 	__releases(lock)
 {
diff --git a/include/linux/spinlock_api_up.h b/include/linux/spinlock_api_up.h
index a9d5c7c66e03..e4de8bb26a15 100644
--- a/include/linux/spinlock_api_up.h
+++ b/include/linux/spinlock_api_up.h
@@ -42,6 +42,9 @@
 #define __LOCK_IRQSAVE(lock, flags, ...) \
   do { local_irq_save(flags); __LOCK(lock, ##__VA_ARGS__); } while (0)
 
+#define __LOCK_IRQ_DISABLE(lock, ...) \
+  do { local_interrupt_disable(); __LOCK(lock, ##__VA_ARGS__); } while (0)
+
 #define ___UNLOCK_(lock) \
   do { __release(lock); (void)(lock); } while (0)
 
@@ -61,6 +64,10 @@
 #define __UNLOCK_IRQRESTORE(lock, flags, ...) \
   do { local_irq_restore(flags); __UNLOCK(lock, ##__VA_ARGS__); } while (0)
 
+#define __UNLOCK_IRQ_ENABLE(lock, ...) \
+  do { __UNLOCK(lock, ##__VA_ARGS__); local_interrupt_enable(); } while (0)
+
+
 #define _raw_spin_lock(lock)			__LOCK(lock)
 #define _raw_spin_lock_nested(lock, subclass)	__LOCK(lock)
 #define _raw_read_lock(lock)			__LOCK(lock, shared)
@@ -70,6 +77,7 @@
 #define _raw_read_lock_bh(lock)			__LOCK_BH(lock, shared)
 #define _raw_write_lock_bh(lock)		__LOCK_BH(lock)
 #define _raw_spin_lock_irq(lock)		__LOCK_IRQ(lock)
+#define _raw_spin_lock_irq_disable(lock)	__LOCK_IRQ_DISABLE(lock)
 #define _raw_read_lock_irq(lock)		__LOCK_IRQ(lock, shared)
 #define _raw_write_lock_irq(lock)		__LOCK_IRQ(lock)
 #define _raw_spin_lock_irqsave(lock, flags)	__LOCK_IRQSAVE(lock, flags)
@@ -97,6 +105,13 @@ static __always_inline int _raw_spin_trylock_irq(raw_spinlock_t *lock)
 	return 1;
 }
 
+static __always_inline int _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
+	__cond_acquires(true, lock)
+{
+	__LOCK_IRQ_DISABLE(lock);
+	return 1;
+}
+
 static __always_inline int _raw_spin_trylock_irqsave(raw_spinlock_t *lock, unsigned long *flags)
 	__cond_acquires(true, lock)
 {
@@ -132,6 +147,7 @@ static __always_inline int _raw_write_trylock_irqsave(rwlock_t *lock, unsigned l
 #define _raw_write_unlock_bh(lock)		__UNLOCK_BH(lock)
 #define _raw_read_unlock_bh(lock)		__UNLOCK_BH(lock, shared)
 #define _raw_spin_unlock_irq(lock)		__UNLOCK_IRQ(lock)
+#define _raw_spin_unlock_irq_enable(lock)	__UNLOCK_IRQ_ENABLE(lock)
 #define _raw_read_unlock_irq(lock)		__UNLOCK_IRQ(lock, shared)
 #define _raw_write_unlock_irq(lock)		__UNLOCK_IRQ(lock)
 #define _raw_spin_unlock_irqrestore(lock, flags) \
diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
index 373618a4243c..560d06384e0c 100644
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -96,6 +96,12 @@ static __always_inline void spin_lock_irq(spinlock_t *lock)
 	rt_spin_lock(lock);
 }
 
+static __always_inline void spin_lock_irq_disable(spinlock_t *lock)
+	__acquires(lock)
+{
+	rt_spin_lock(lock);
+}
+
 #define spin_lock_irqsave(lock, flags)			 \
 	do {						 \
 		typecheck(unsigned long, flags);	 \
@@ -122,6 +128,12 @@ static __always_inline void spin_unlock_irq(spinlock_t *lock)
 	rt_spin_unlock(lock);
 }
 
+static __always_inline void spin_unlock_irq_enable(spinlock_t *lock)
+	__releases(lock)
+{
+	rt_spin_unlock(lock);
+}
+
 static __always_inline void spin_unlock_irqrestore(spinlock_t *lock,
 						   unsigned long flags)
 	__releases(lock)
@@ -131,6 +143,12 @@ static __always_inline void spin_unlock_irqrestore(spinlock_t *lock,
 
 #define spin_trylock(lock)	rt_spin_trylock(lock)
 
+static __always_inline int spin_trylock_irq_disable(spinlock_t *lock)
+	__cond_acquires(true, lock)
+{
+	return rt_spin_trylock(lock);
+}
+
 #define spin_trylock_bh(lock)	rt_spin_trylock_bh(lock)
 
 #define spin_trylock_irq(lock)	rt_spin_trylock(lock)
diff --git a/kernel/locking/spinlock.c b/kernel/locking/spinlock.c
index b42d293da38b..764641f6ec57 100644
--- a/kernel/locking/spinlock.c
+++ b/kernel/locking/spinlock.c
@@ -129,6 +129,19 @@ static void __lockfunc __raw_##op##_lock_bh(locktype##_t *lock)		\
  */
 BUILD_LOCK_OPS(spin, raw_spinlock, __acquires);
 
+/* No rwlock_t variants for now, so just build this function by hand */
+static void __lockfunc __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+{
+	for (;;) {
+		local_interrupt_disable();
+		if (likely(do_raw_spin_trylock(lock)))
+			break;
+		local_interrupt_enable();
+
+		arch_spin_relax(&lock->raw_lock);
+	}
+}
+
 #ifndef CONFIG_PREEMPT_RT
 BUILD_LOCK_OPS(read, rwlock, __acquires_shared);
 BUILD_LOCK_OPS(write, rwlock, __acquires);
@@ -176,6 +189,14 @@ noinline void __lockfunc _raw_spin_lock_irq(raw_spinlock_t *lock)
 EXPORT_SYMBOL(_raw_spin_lock_irq);
 #endif
 
+#ifndef CONFIG_INLINE_SPIN_LOCK_IRQ
+noinline void __lockfunc _raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+{
+	__raw_spin_lock_irq_disable(lock);
+}
+EXPORT_SYMBOL_GPL(_raw_spin_lock_irq_disable);
+#endif
+
 #ifndef CONFIG_INLINE_SPIN_LOCK_BH
 noinline void __lockfunc _raw_spin_lock_bh(raw_spinlock_t *lock)
 {
@@ -208,6 +229,14 @@ noinline void __lockfunc _raw_spin_unlock_irq(raw_spinlock_t *lock)
 EXPORT_SYMBOL(_raw_spin_unlock_irq);
 #endif
 
+#ifndef CONFIG_INLINE_SPIN_UNLOCK_IRQ
+noinline void __lockfunc _raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
+{
+	__raw_spin_unlock_irq_enable(lock);
+}
+EXPORT_SYMBOL_GPL(_raw_spin_unlock_irq_enable);
+#endif
+
 #ifndef CONFIG_INLINE_SPIN_UNLOCK_BH
 noinline void __lockfunc _raw_spin_unlock_bh(raw_spinlock_t *lock)
 {
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 10af5ed859e7..d1ab1799794c 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -88,6 +88,9 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
 EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 #endif
 
+DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
+EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
+
 DEFINE_PER_CPU(unsigned int, nmi_nesting);
 
 /*
@@ -728,7 +731,16 @@ static inline void __irq_exit_rcu(void)
 #endif
 	account_hardirq_exit(current);
 	preempt_count_sub(HARDIRQ_OFFSET);
-	if (!in_interrupt() && local_softirq_pending()) {
+	/*
+	 * Interrupts may happen between hardirq_disable_enter() and
+	 * local_irq_save() in local_interrupt_disable(), if irq_exit() invokes
+	 * softirq here, we may have a softirq handler calling
+	 * local_interrupt_disable() but it won't disable the irq because
+	 * hardirq disabling count is already 1, hence we need to prevent
+	 * invoking softirq when a local_interrupt_disable() is ongoing.
+	 */
+	if (!in_interrupt() && !hardirq_disable_count() &&
+	    local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
 		 * before enabling interrupts to run SoftIRQ.
-- 
2.50.1 (Apple Git-155)

