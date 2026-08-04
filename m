Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB23F44FA;
	Tue,  4 Aug 2026 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785868025; cv=none; b=jlmTqP53IJaCAQMGtMFbQWom9N36NLe7PWgM7JbZnupxOYVC10pOjLgjzUgmPgEdwygm59j+qVIMtzs/hg8CmS9QfJczXB8KfQmgl9D9joIaLtmQr2tU7yiXuM2+eoHFl1NMcAO9QXIPsmWa2tto9h0Rrv/iv3lv/32KrCZd+B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785868025; c=relaxed/simple;
	bh=iQoKVdk+WoHUva/63rpRvYkCWZ9qSATZl0EQn9XEYsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFbC7rvEy0WrW0371Zxx0HsEhAchOtRL+wb6lKjECd50MIOx0G4ZUQDDVBw70paQJ0ftORnnrA9z8O07gThiRYFK0v2jCcczZGGqa+3yNnJb84NQ4CdVkGZVaOEI2Ay0S4RS1n3YiLxaw8xXhD5BjtmRMoJcdsINJDScCArSnFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0ZocLcZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0ZocLcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34A01F00A3A;
	Tue,  4 Aug 2026 18:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785868023;
	bh=zN6/KLhnbDkhM3wWSDXhZNiVQv2y1o6WorrIxoYKYx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H0ZocLcZZtEFF/bPOPTd+qpRYSr/wrRsq312GaexPB7hYiS4uqK+VsGd4EBO+Boww
	 5jgpKQ2/BPUVDreyh3lY4ogK4yEzWCgQdpYtGS2tJsdz+Y0FWI1fAuLfb12CoKU5nZ
	 ZmD3z6xNeF3EgEU8i/faw1I8bgS9Q3iWJPzQkNmaMzY/tPAgB9uLV0OkX/prMMFNCU
	 /tcEI9F9q5r4fuiJCluB2yypvWIz0122jD8lQT18w2Yigw3HxpbZo12MFgjRamtEAy
	 BK1LnLwdQAre6QmLbO0n5aci0nA7Jf2WO1FUs6TOlncRG0JND2SvOsRyh9lm7wZq5D
	 AAiE3/QTLcwCg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id E0708F40068;
	Tue,  4 Aug 2026 14:27:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 04 Aug 2026 14:27:01 -0400
X-ME-Sender: <xms:9S5yahB_PHZhQyrwr1euXivViwWGk7iOq_q_TmWqTPjKL4lE8L-brQ>
    <xme:9S5yakvBKuVCZuLRhiJCtEeksMpTdL_UNWrE0vc_ERXOGzD-3EQB63LmgXe_hTDG_
    q0zIyrgqMBrch0N2XivV2nNj4Kwl8qWb1InKIVIE3gmoUTM_Q-bZQ>
X-ME-Received: <xmr:9S5yav82bFeAMuZ9aab53jTe92Sp5oz2H9FlHHVhkgb3nv8ejaC6zsYWMKrD5JkxOeiIb_0F9w4vnT39VsO9aoeFG07xeSfo>
X-ME-Proxy-Cause: dmFkZTFVunpfLyaejSZWxqOZ/mbx0utN08rWMoz86CKZC0SWvye8MmM8puxN/3wU/hXQro
    jx5uej8a3lLQHhxcdjZFAEchcHY91sLE2VonxbY2gvaDwV8FEggkuHI6oo5qTHaPxp5JtN
    vhR5cU2Odk7UgWzRli3XlZg3CnyiaQ5vTeKVZNfzj0CZBTrPApzkcZrN9a4aA7306992xw
    CsMdup2tuMBmVCKyo2L6gbX+Nv7OEMC9l/TohmI2WnOTFPISJQUpbZSBpU2xd4r35z9ICq
    oqyVv4/BIXFgfkDZMnVYk/QXeOXvoEdjsyaV/PHac2YzdY3mmbTHJTw3asegpPfKPjrLUE
    g6pJIJixc7Rg/cbgjGRjRW4651m5hP6RnJ3qOnGy36Y+24xAd1KV3VKMzY1rJbNoP55AhG
    wmH+67NgMPwjyDyEPzHzuwwBd4+cgOPGl9s57tQJqxRjBnSZxZG6DVmgDD0XO7YlRqrWoj
    8oqVyX39c7+BEpIFQOQyOUK/tqNWpYJT4Uk/KenKJPUEIBCQsI2175pWHbx7lpqPKiYwIv
    ioFp2xsqQ4KsC9GOdfc5rS3aAuwC0fO6wkq9/b6iPSKpJs5P535N5vXCzvIl8s58YTIHFy
    6ZrRtvcADWh63Cl2ipSJAfkDBVgzaoliDGxXT6yFiTstf0QuODGQ6iEEWh6Q
X-ME-Proxy: <xmx:9S5yarTDruWoD9B6jJTmaH9I-rk14HLQrfEcX5EBGwivlmRrUXn8dg>
    <xmx:9S5yahWfqDNO3YZPOQvkp5elzWUYYawDIwQH_UQJVXenqp92gbu03Q>
    <xmx:9S5yat8Z9Zs3NMocRAC88_z_mgpSFe4m6L8Ueh83Qt1Zu9orilAUnQ>
    <xmx:9S5yah3v6RpzFpX3uaQW2Ntywm4erltvxOYK6GTL7yXR_vbFa5nzHw>
    <xmx:9S5yaifyX75JK_Z8ZLGKpQ4Cve18zIcGWBP8VCsH8pY1t5oFqhZNw0WH>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 14:26:59 -0400 (EDT)
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
Subject: [PATCH v4.1 05/17] irq & spin_lock: Add counted interrupt disabling/enabling
Date: Tue,  4 Aug 2026 11:26:57 -0700
Message-ID: <20260804182657.87716-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-6-boqun@kernel.org>
References: <20260804161447.84806-6-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the nested interrupt disabling and enabling is represented by
_irqsave() and _irqrestore() APIs, which are relatively unsafe, for
example:

	<interrupts are enabled as beginning>
	spin_lock_irqsave(l1, flag1);
	spin_lock_irqsave(l2, flag2);
	spin_unlock_irqrestore(l1, flags1);
	<l2 is still held but interrupts are enabled>
	// accesses to interrupt-disable protected data will cause races

This is even easier to trigger with guard facilities:

	unsigned long flag2;

	scoped_guard(spin_lock_irqsave, l1) {
		spin_lock_irqsave(l2, flag2);
	}
	// l2 locked but interrupts are enabled.
	spin_unlock_irqrestore(l2, flag2);

(Hand-to-hand locking critical sections are not uncommon for a
fine-grained lock design)

And because of this unsafety, Rust cannot easily wrap the
interrupt-disabling locks in a safe API, which complicates the design.

To resolve this, introduce a new set of interrupt disabling APIs:

*	local_interrupt_disable();
*	local_interrupt_enable();

They work like local_irq_save() and local_irq_restore() except that 1)
the outermost local_interrupt_disable() call saves the interrupt state
into a per-CPU variable, so that the outermost local_interrupt_enable()
can restore the state, and 2) a per-CPU counter is added to record the
nest level of these calls, so that interrupts are not accidentally
enabled inside the outermost critical section.

Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
and spin_unlock_irq_enable(), as a result, code as follows:

	spin_lock_irq_disable(l1);
	spin_lock_irq_disable(l2);
	spin_unlock_irq_enable(l1);
	// Interrupts are still disabled.
	spin_unlock_irq_enable(l2);

doesn't have the issue that interrupts are accidentally enabled.

This also makes the wrapper of interrupt-disabling locks on Rust easier
to design.

Signed-off-by: Lyude Paul <lyude@redhat.com>
[boqun: Apply Peter's feedback and fix spell errors reported by Ingo]
[boqun: Address the duplicate spin_acquire() spotted by sashiko]
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/interrupt_rc.h     | 82 ++++++++++++++++++++++++++++++++
 include/linux/preempt.h          |  4 ++
 include/linux/spinlock.h         | 23 +++++++++
 include/linux/spinlock_api_smp.h | 41 ++++++++++++++++
 include/linux/spinlock_api_up.h  | 15 ++++++
 include/linux/spinlock_rt.h      | 18 +++++++
 kernel/locking/spinlock.c        | 31 ++++++++++++
 kernel/softirq.c                 | 28 ++++++++++-
 8 files changed, 240 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/interrupt_rc.h

diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
new file mode 100644
index 000000000000..b9a7f05ecf42
--- /dev/null
+++ b/include/linux/interrupt_rc.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_INTERRUPT_RC_H
+#define __LINUX_INTERRUPT_RC_H
+
+/*
+ * include/linux/interrupt_rc.h - refcounted local processor interrupt
+ * management.
+ *
+ * Since the implementation of this API currently depends on
+ * local_irq_save()/local_irq_restore(), we split this into its own header to
+ * make it easier to include without hitting circular header dependencies.
+ */
+
+#include <linux/irqflags.h>
+#include <linux/preempt.h>
+#include <linux/processor.h>
+#include <linux/smp.h>
+
+#ifndef MODULE
+/* Per-CPU interrupt disabling state for local_interrupt_{disable,enable}(). */
+DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
+
+static __always_inline void __local_interrupt_disable(void)
+{
+	unsigned long flags;
+
+	local_irq_save(flags);
+	raw_cpu_write(local_interrupt_disable_state, flags);
+}
+
+static __always_inline void __local_interrupt_enable(void)
+{
+	unsigned long flags = raw_cpu_read(local_interrupt_disable_state);
+
+	local_irq_restore(flags);
+}
+
+#ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
+static __always_inline void _local_interrupt_disable(void)
+{
+	__local_interrupt_disable();
+}
+
+static __always_inline void _local_interrupt_enable(void)
+{
+	__local_interrupt_enable();
+}
+#else
+extern void _local_interrupt_disable(void);
+extern void _local_interrupt_enable(void);
+#endif
+
+#else /* !MODULE */
+extern void _local_interrupt_disable(void);
+extern void _local_interrupt_enable(void);
+#endif /* !MODULE */
+
+static inline void local_interrupt_disable(void)
+{
+	int new_count;
+
+	WARN_ON_ONCE(in_nmi());
+
+	new_count = hardirq_disable_enter();
+
+	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
+
+	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
+		_local_interrupt_disable();
+}
+
+static inline void local_interrupt_enable(void)
+{
+	int new_count;
+
+	new_count = hardirq_disable_exit();
+
+	if ((new_count & HARDIRQ_DISABLE_MASK) == 0)
+		_local_interrupt_enable();
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
index bda5e7a390cd..90909d933dab 100644
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
@@ -105,6 +118,16 @@ static __always_inline bool _raw_spin_trylock_irq(raw_spinlock_t *lock)
 	return false;
 }
 
+static __always_inline bool _raw_spin_trylock_irq_disable(raw_spinlock_t *lock)
+	__cond_acquires(true, lock)
+{
+	local_interrupt_disable();
+	if (_raw_spin_trylock(lock))
+		return true;
+	local_interrupt_enable();
+	return false;
+}
+
 static __always_inline bool _raw_spin_trylock_irqsave(raw_spinlock_t *lock, unsigned long *flags)
 	__cond_acquires(true, lock)
 {
@@ -143,6 +166,15 @@ static inline void __raw_spin_lock_irq(raw_spinlock_t *lock)
 	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
 }
 
+static inline void __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+	__acquires(lock) __no_context_analysis
+{
+	local_interrupt_disable();
+	preempt_disable();
+	spin_acquire(&lock->dep_map, 0, 0, _RET_IP_);
+	LOCK_CONTENDED(lock, do_raw_spin_trylock, do_raw_spin_lock);
+}
+
 static inline void __raw_spin_lock_bh(raw_spinlock_t *lock)
 	__acquires(lock) __no_context_analysis
 {
@@ -188,6 +220,15 @@ static inline void __raw_spin_unlock_irq(raw_spinlock_t *lock)
 	preempt_enable();
 }
 
+static inline void __raw_spin_unlock_irq_enable(raw_spinlock_t *lock)
+	__releases(lock)
+{
+	spin_release(&lock->dep_map, _RET_IP_);
+	do_raw_spin_unlock(lock);
+	local_interrupt_enable();
+	preempt_enable();
+}
+
 static inline void __raw_spin_unlock_bh(raw_spinlock_t *lock)
 	__releases(lock)
 {
diff --git a/include/linux/spinlock_api_up.h b/include/linux/spinlock_api_up.h
index a9d5c7c66e03..d03d3065ee04 100644
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
 
@@ -61,6 +64,9 @@
 #define __UNLOCK_IRQRESTORE(lock, flags, ...) \
   do { local_irq_restore(flags); __UNLOCK(lock, ##__VA_ARGS__); } while (0)
 
+#define __UNLOCK_IRQ_ENABLE(lock, ...) \
+  do { __UNLOCK(lock, ##__VA_ARGS__); local_interrupt_enable(); } while (0)
+
 #define _raw_spin_lock(lock)			__LOCK(lock)
 #define _raw_spin_lock_nested(lock, subclass)	__LOCK(lock)
 #define _raw_read_lock(lock)			__LOCK(lock, shared)
@@ -70,6 +76,7 @@
 #define _raw_read_lock_bh(lock)			__LOCK_BH(lock, shared)
 #define _raw_write_lock_bh(lock)		__LOCK_BH(lock)
 #define _raw_spin_lock_irq(lock)		__LOCK_IRQ(lock)
+#define _raw_spin_lock_irq_disable(lock)	__LOCK_IRQ_DISABLE(lock)
 #define _raw_read_lock_irq(lock)		__LOCK_IRQ(lock, shared)
 #define _raw_write_lock_irq(lock)		__LOCK_IRQ(lock)
 #define _raw_spin_lock_irqsave(lock, flags)	__LOCK_IRQSAVE(lock, flags)
@@ -97,6 +104,13 @@ static __always_inline int _raw_spin_trylock_irq(raw_spinlock_t *lock)
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
@@ -132,6 +146,7 @@ static __always_inline int _raw_write_trylock_irqsave(rwlock_t *lock, unsigned l
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
index b42d293da38b..83a17eaf5717 100644
--- a/kernel/locking/spinlock.c
+++ b/kernel/locking/spinlock.c
@@ -129,6 +129,21 @@ static void __lockfunc __raw_##op##_lock_bh(locktype##_t *lock)		\
  */
 BUILD_LOCK_OPS(spin, raw_spinlock, __acquires);
 
+/* No rwlock_t variants for now, so just build this function by hand */
+static void __lockfunc __raw_spin_lock_irq_disable(raw_spinlock_t *lock)
+{
+	for (;;) {
+		preempt_disable();
+		local_interrupt_disable();
+		if (likely(do_raw_spin_trylock(lock)))
+			break;
+		local_interrupt_enable();
+		preempt_enable();
+
+		arch_spin_relax(&lock->raw_lock);
+	}
+}
+
 #ifndef CONFIG_PREEMPT_RT
 BUILD_LOCK_OPS(read, rwlock, __acquires_shared);
 BUILD_LOCK_OPS(write, rwlock, __acquires);
@@ -176,6 +191,14 @@ noinline void __lockfunc _raw_spin_lock_irq(raw_spinlock_t *lock)
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
@@ -208,6 +231,14 @@ noinline void __lockfunc _raw_spin_unlock_irq(raw_spinlock_t *lock)
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
index 10af5ed859e7..0c9b2269a8d6 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#define INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
 #include <linux/export.h>
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
@@ -88,6 +89,20 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
 EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 #endif
 
+DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
+
+void _local_interrupt_disable(void)
+{
+	__local_interrupt_disable();
+}
+EXPORT_SYMBOL(_local_interrupt_disable);
+
+void _local_interrupt_enable(void)
+{
+	__local_interrupt_enable();
+}
+EXPORT_SYMBOL(_local_interrupt_enable);
+
 DEFINE_PER_CPU(unsigned int, nmi_nesting);
 
 /*
@@ -728,10 +743,19 @@ static inline void __irq_exit_rcu(void)
 #endif
 	account_hardirq_exit(current);
 	preempt_count_sub(HARDIRQ_OFFSET);
-	if (!in_interrupt() && local_softirq_pending()) {
+	/*
+	 * Interrupts may happen between hardirq_disable_enter() and
+	 * local_irq_save() in local_interrupt_disable(), if irq_exit() invokes
+	 * softirq here, we may have a softirq handler calling
+	 * local_interrupt_disable() but it won't disable the IRQ because
+	 * hardirq disabling count is already 1, hence we need to prevent
+	 * invoking softirq when a local_interrupt_disable() is ongoing.
+	 */
+	if (!in_interrupt() && !hardirq_disable_count() &&
+	    local_softirq_pending()) {
 		/*
 		 * If we left hrtimers unarmed, make sure to arm them now,
-		 * before enabling interrupts to run SoftIRQ.
+		 * before enabling interrupts to run softirq.
 		 */
 		hrtimer_rearm_deferred();
 		invoke_softirq();
-- 
2.50.1 (Apple Git-155)

