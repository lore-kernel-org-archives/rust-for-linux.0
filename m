Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8629383994;
	Fri, 31 Jul 2026 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529861; cv=none; b=iRvsmdPYFaDU2wtqwI9LqxzYYEhe7VJhMpdjcc7y12fxmTCxqxu5fj3Lq8ZqVlZwtpogx/axbvAar6XDKdktrMKU8ZT8mrK1Q3z3kYEo4pnzm04debiyxepcNxqy99Ym/emyORvHdkAdmqH49EEk8Y6TX7GXCBdKmGOg8y6PQNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529861; c=relaxed/simple;
	bh=VVUEAuv0knUbJ18uPwAHlKSyW+OJF8lfXoMGXU2hiFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vp+lGysYlNrCYwl3KDr/gKcH/5wr+phdK1wiMYwZN7CFcUn1T+n7M+WlqZRHfloKBahNxWGojzel5mmoPThnjTp10WjSwDmqrLne6fpwpZb5Lz8l9kdjPeJ3RAhP+0X+AN/XmDymogoJ4yPIjjzJei9pp5KUvyK0H4b29i/7bYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfKUXJj5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfKUXJj5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6931F00AC4;
	Fri, 31 Jul 2026 20:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529859;
	bh=r3ggz2ubbYMxXvgwctlCQHM16FI4AcWSFWoEFEQ90fI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YfKUXJj5Dj+nZptsxE30sKDPB+LmBKwUp3/t8e8wxOCK3akju2yx95Qtnf94/Bd2E
	 vFCaSVPUHqGUGG8vUedOxHyjcbA9VVJl9s3Uwx5fXanxkiVwxnLsl64Te9jcCKUiqv
	 7eSJtthUbUoUrThV3xXbc0jv2BhkH2cgpHVSFE+q+MVIePTa4k/ikwv8WoGoCdB6Mk
	 hkEaKhuLECaDHFcF6n3llb+PIjX8+wx8x3OklPCXGWaaVVsbQxMEO/HKfSoUN9lI12
	 Jvc8UifJaApJpoMpvD4jiowj5PDcnJi0XWyhg8qKzI3waui1SHc19tetmiXrE52ML3
	 nqyirdxLRSxRQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8F642F4007A;
	Fri, 31 Jul 2026 16:30:58 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 31 Jul 2026 16:30:58 -0400
X-ME-Sender: <xms:AgZtasTEIsPFJzgnPQs_7rYQE8dEwSm2AcdHpxmcZG82pnE2V6KEpA>
    <xme:AgZtau8mxt-ACK30etfRMFqcgKQvq1QZdvnCrCZqEVrB4TH-PtHJ7AIDJ2Uq490Hx
    CP8JrAfVFzBniZ3ipvH8NkOkH6qz99II_831LYLiN183b7hDqSg5w>
X-ME-Received: <xmr:AgZtatPVF5QReYEEz05YVi79ODRr9fo2KC-62mj_ai88aiXyjaWbCVpSs-K2VGtHJADRhY-APCDxgF1C23vBj3hRmYR3KhDd>
X-ME-Proxy-Cause: dmFkZTFIC2VVTLK13uDkALWshPgkkwS9DC5Q8ljHaA42IPRnmgkrxQSeK5HYsDRhN4GhLk
    6Lg9dLbHgT0DH+qVaNoW+UUFxptAXHUIdqGwEJPczm0ywmTmF9/CSNIQrGZfaA0/SYDXt9
    FCHeSX4ZePBeVl3Top6EjJd42yXsFqp+L0LPuLnabUXIo8fT3yX5hMg5WmOramFVWkXrXb
    dtjJi0qTpjt7TXVawGUwOyoJ/Q6jP1wNaVQH+6xYGS7UXVpHVglHDWcX7SjmpbiByeHS7C
    oLMM3JHkGXdP7WkAt31sGvl3IAmYfCODupTHvovIO6+oDBZmEBw2YefLw5AUKyninHXIng
    ttqFP0fUYb8AmIHQT5N5eED5S04aSy11dx3DqVX6Kij9bVSlz1RplV3HnpWZfKbZYyKTEK
    Qcb4g9+wE6Vw6aTEeGnmBpNyRpfw7+iYVYmP/OejSvPLzF9DQMgeHyEoTFUEp6ZUB6US2l
    ruYDrl0LDy0kjiHqyijbiEUw1CjwyrXBFNZXb7zQB84L8X+Jlbl3rs7QI/MKq5Z47XXhXS
    0nuZlTfdmcGiEdUMOJkycPTToZoQ9B/yuHOANP6J5q8IsuI8Co3kuqu+kEWl6r+ogf0D8D
    lPgUjx17C5DUXIsoBUi3xWMS7D8nZgKop/aWNuOqxsbEWr3wp3FxjflaG/gg
X-ME-Proxy: <xmx:AgZtavjb4y4pGpJeDyWAwaT-3xl_BNdCc6qRvagf4LZ7yAzZdZXfTA>
    <xmx:AgZtagkMwWm5wM0uEJlaPKHw9_l4l9wmAAfXE-fPIZlRtC6ZKOR5ZQ>
    <xmx:AgZtasO1Lp9KGJ1rm5-dnV0P9DaflCbs5yl9Z7uFgYjEkNrJ0gh1vw>
    <xmx:AgZtajEnsKovC4Z7_bb27QJVStvMkadZAg-5UdaPFrqVHgUKBbFBSg>
    <xmx:AgZtaqvKlxZ_w2a10hpMw0Sfs4Cx_Nfx5qy8Pz2aXhY7xsR9wBl-9yhb>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:57 -0400 (EDT)
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
Subject: [PATCH 13/24] irq: Optimize reschedule check in local_interrupt_enable()
Date: Fri, 31 Jul 2026 13:30:14 -0700
Message-ID: <20260731203031.13679-14-boqun@kernel.org>
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

In local_interrupt_enable(), we could avoid re-reading preempt count
because of should_resched() by using the result from
hardirq_disable_exit(), however this means __preempt_count_add_return()
and __preempt_count_sub_return() need to return all the preempt count
bits (including the PREEMPT_NEED_RESCHED bit), since the only user of
__preempt_count_{add,sub}_return() is hardirq_disable_{enter,exit}(),
hence make them return "unsigned long" to optimize this.

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 arch/arm64/include/asm/preempt.h | 12 ++++++------
 arch/s390/include/asm/preempt.h  |  4 ++--
 arch/x86/include/asm/preempt.h   |  4 ++--
 include/asm-generic/preempt.h    |  4 ++--
 include/linux/interrupt_rc.h     | 31 ++++++++++++++++++++-----------
 5 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 0dd8221d1bef..e9f597d87413 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -55,20 +55,20 @@ static inline void __preempt_count_sub(int val)
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline int __preempt_count_add_return(int val)
+static inline unsigned long __preempt_count_add_return(int val)
 {
-	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
+	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
 	pc += val;
-	WRITE_ONCE(current_thread_info()->preempt.count, pc);
+	WRITE_ONCE(current_thread_info()->preempt_count, pc);
 
 	return pc;
 }
 
-static inline int __preempt_count_sub_return(int val)
+static inline unsigned long __preempt_count_sub_return(int val)
 {
-	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
+	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
 	pc -= val;
-	WRITE_ONCE(current_thread_info()->preempt.count, pc);
+	WRITE_ONCE(current_thread_info()->preempt_count, pc);
 
 	return pc;
 }
diff --git a/arch/s390/include/asm/preempt.h b/arch/s390/include/asm/preempt.h
index 1d5e4d7e9e1b..d0021b979a5d 100644
--- a/arch/s390/include/asm/preempt.h
+++ b/arch/s390/include/asm/preempt.h
@@ -136,12 +136,12 @@ static __always_inline bool should_resched(int preempt_offset)
 	return unlikely(READ_ONCE(get_lowcore()->preempt_count) == preempt_offset);
 }
 
-static __always_inline int __preempt_count_add_return(int val)
+static __always_inline unsigned long __preempt_count_add_return(int val)
 {
 	return val + __atomic64_add(val, (long *)&get_lowcore()->preempt_count);
 }
 
-static __always_inline int __preempt_count_sub_return(int val)
+static __always_inline unsigned long __preempt_count_sub_return(int val)
 {
 	return __preempt_count_add_return(-val);
 }
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index 12353eeebc52..fc1a2799990a 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -103,12 +103,12 @@ static __always_inline void __preempt_count_sub(int val)
 	__pc_op(add, __preempt_count, -val);
 }
 
-static __always_inline int __preempt_count_add_return(int val)
+static __always_inline unsigned long __preempt_count_add_return(int val)
 {
 	return __pc_op(add_return, __preempt_count, val);
 }
 
-static __always_inline int __preempt_count_sub_return(int val)
+static __always_inline unsigned long __preempt_count_sub_return(int val)
 {
 	return __pc_op(add_return, __preempt_count, -val);
 }
diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index c8683c046615..7629e23102d1 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -59,14 +59,14 @@ static __always_inline void __preempt_count_sub(int val)
 	*preempt_count_ptr() -= val;
 }
 
-static __always_inline int __preempt_count_add_return(int val)
+static __always_inline unsigned long __preempt_count_add_return(int val)
 {
 	*preempt_count_ptr() += val;
 
 	return *preempt_count_ptr();
 }
 
-static __always_inline int __preempt_count_sub_return(int val)
+static __always_inline unsigned long __preempt_count_sub_return(int val)
 {
 	*preempt_count_ptr() -= val;
 
diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
index dd4444c61330..c044dc395452 100644
--- a/include/linux/interrupt_rc.h
+++ b/include/linux/interrupt_rc.h
@@ -27,7 +27,7 @@ DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
 static inline void local_interrupt_disable(void)
 {
 	unsigned long flags;
-	int new_count;
+	unsigned long new_count;
 
 	WARN_ON_ONCE(in_nmi());
 
@@ -41,9 +41,25 @@ static inline void local_interrupt_disable(void)
 	}
 }
 
+#ifdef CONFIG_PREEMPTION
+static inline void local_interrupt_enable_reched(unsigned long pc)
+{
+	if (pc)
+		return;
+	/* No PREEMPT_NEED_RESCHED bit? Check tif_need_resched() */
+#ifndef PREEMPT_NEED_RESCHED
+	if (!tif_need_resched())
+		return;
+#endif
+	__preempt_schedule();
+}
+#else
+static inline void local_interrupt_enable_reched(unsigned long pc) {}
+#endif
+
 static inline void local_interrupt_enable(void)
 {
-	int new_count;
+	unsigned long new_count;
 
 	new_count = hardirq_disable_exit();
 
@@ -52,15 +68,8 @@ static inline void local_interrupt_enable(void)
 
 		flags = raw_cpu_read(local_interrupt_disable_state.flags);
 		local_irq_restore(flags);
-		/*
-		 * TODO: re-read preempt count can be avoided, but it needs
-		 * should_resched() taking another parameter as the current
-		 * preempt count
-		 */
-#ifdef CONFIG_PREEMPTION
-		if (should_resched(0))
-			__preempt_schedule();
-#endif
+
+		local_interrupt_enable_reched(new_count);
 	}
 }
 
-- 
2.50.1 (Apple Git-155)

