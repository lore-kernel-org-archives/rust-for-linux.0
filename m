Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744333955D2
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086152; cv=none; b=bIWa40+1bVK2a5F2fKJTbrQoAp3gk12JQGdnQmv60swDuoEwAxddnOaZbSoq4Amw7WnVrayAFwchkmc1f9bcUJEs2FmpX8GXsnqHEzLz/CI9uNs/9PCzPub6Wtw4c3QdVv7KMPIk29fOnFURvodJlRrQiV52p/aWcHX3zTVGq28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086152; c=relaxed/simple;
	bh=ZdmP9HCAd2oDU8aGybcrgEt64oPFu3q8ZuAOXbDuT/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQ+/HF1bb11RGfvDDLqPSMRDwT0vA4LRmD3v+rOqKsrcsqzeA8A03Rrwrbt3v8fwV/lZq/xHDh+j5805LCKYamseraapo27YU+2G3IgVDRQcRdXtWTUHAFyr30FSqtywf24DEmr0NLXm8M2eklcH5/Y+/XoOIlWSQa3wJvaVYw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Np8sEcY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Np8sEcY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850C61F00A3D;
	Fri,  7 Aug 2026 07:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086151;
	bh=4/3Q4RbdeBoEcapTLQLRtJHDgKIOcLItV3asUF3+BOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Np8sEcY4ZDzBl03bhMcGs0D4dixG36SCyzIvLvudXi97D37PI+mv5cdBIhc72fIb2
	 /SGJpsTolQW4vjYMp/bB4pxXdpvAG1kuBG8IpP7UqfP56fpl1SxBapADRkaoCJdzb6
	 eySO2J+FZ9jLBuW+CNnaCCL+TBm9QpVpBEWxYOZOvgW9D5XT8qpnuvxxvuiDhW3v3Z
	 AALULd8L1ToF7dCEGnX8jCJVa868QhIvAqr1za9Em5UsxNp0aLv/ypJT3hpCb3RogO
	 QAZTGAf1iyGI0ZsX1S2PfdCa34tVM2ZWru3wFA1Al0wLQlLuRUtSy6N3AYd5/h2lOp
	 F6D3bCr0G64TQ==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9B536F40067;
	Fri,  7 Aug 2026 03:02:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 07 Aug 2026 03:02:29 -0400
X-ME-Sender: <xms:BYN1ah_3NA6bbVkn54a7RbnZrPXjCViK6dhoyz5s-7GN8Xup26J0AQ>
    <xme:BYN1anGpQbdU2hgOmFoK0ZneNFNV1n3c2XlKNOH7DSOxUOQ_lkUtxZPKq-23JLHkd
    onJZUQLLDXBokF-q_tdMl4VACs_Z7j8IXVVXh2pFuuqqAxx5z3Ltbw>
X-ME-Received: <xmr:BYN1aoRqE9NxMH5TgDkON9i0za-ZTmzQxid1RiiIyKSxA26YC5QP7NlrW6NQa5ZMMkaeFW1VSKb82tmtQfYk1twoHLAIDd2U>
X-ME-Proxy-Cause: dmFkZTGymVtxh0AmopRY+TfTfXYPCmloL5eVBz8w4y+3KFrHM+Bwv6o50auh1636bSBYkE
    H90J+8ZvDwGP+GEnsL03hmghhkCvgcLvZRJlD0Z0K6idzeBe96fVCfVF90zAumgR10DH6A
    dzrkds6t6yssM5k8WnRKyJY7PoN9yPTJEd8yclKHhKcjgA77IEZ54Ob7IjTR0RbJw1Jd/H
    MAKXnEz1+HSwhiWHnu3/dGxtHg6i6x+jlrZPffCsJNEQERYySXee/h/1gQg2z905mRcC4Y
    mB/oQJoiVpI6TFSRaftlL1E+wAZyQH5fXLMWv+6L12SLyEAsyE0kkUaQtsxqspvPUOq9Dg
    i49SfvrWIX/QS8rpDl7olpqYaPYYioefeVoSw6nr0ibiHzViZMB6HA0ao5Z2T9HFRzl3Fk
    rylAAaFQ+8yMbU+thtcnsWamiAlUp7atxU73NAtXVpXfW7hIagKa7jPxqc6ILyElp9CLkM
    4wK1WGoAHeLiOwiif2ii82XWuI8Qyjcx603f6Gi1C18cmlxIIgpRVLQmYU9rTGDxjd1ZyW
    8hF4NjlwKZ2MRjm9RMdM5aowqQ3stc5AuybFvyvEde9KblUG5xQ4DW79W3LTICfkDhWhUs
    Ft5r2DdAJIr3FlF9ZmHw7ELzzyhd8qcnvWdXSqhtn97WstkMcuC3u+pcnrjg
X-ME-Proxy: <xmx:BYN1atuonf5jQLpYioyDx9oQ8iSDtutgiwajMw3CM9MbkGUyI3PJCg>
    <xmx:BYN1atCwX7i-ypInXNDM2qWBmOIVl7zboEwSwMZ1tAyfV9bf0Mx4fA>
    <xmx:BYN1aieGPO6JOgw-c9SwpV8humx6TIexVz-3FM8JkkHLMWTXpLTEZw>
    <xmx:BYN1atp6LwC4-VuNfM5lIlu2cE1Bnm2t1ynKfi2_hm2z-fLo545RpQ>
    <xmx:BYN1au5iRS5920Nt6RjGqNyhS4qFQnODHnw27T36hDVkZtJEAJyiksWq>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:29 -0400 (EDT)
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
	Heiko Carstens <hca@linux.ibm.com>
Subject: [PATCH v5 03/18] preempt: Introduce __preempt_count_{sub,add}_return()
Date: Fri,  7 Aug 2026 00:02:00 -0700
Message-ID: <20260807070218.27144-4-boqun@kernel.org>
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

In order to use preempt_count() to track the interrupt disable nesting
level, __preempt_count_{add,sub}_return() are introduced, as their names
suggest, these primitives return the new value of the preempt_count()
after changing it. The following example shows the usage of it in
local_interrupt_disable():

	// increase the HARDIRQ_DISABLE bit
	new_count = __preempt_count_add_return(HARDIRQ_DISABLE_OFFSET);

	// if it's the first-time increment, then disable the interrupt
	// at hardware level.
	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
		local_irq_save(flags);
		raw_cpu_write(local_interrupt_disable_state, flags);
	}

Having these primitives will avoid a read of preempt_count() after
changing preempt_count() on certain architectures.

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 arch/arm64/include/asm/preempt.h | 20 ++++++++++++++++++++
 arch/s390/include/asm/preempt.h  | 10 ++++++++++
 arch/x86/include/asm/preempt.h   | 10 ++++++++++
 include/asm-generic/preempt.h    | 14 ++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 932ea4b62042..9ecc2766a9f2 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -55,6 +55,26 @@ static inline void __preempt_count_sub(int val)
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
+static inline int __preempt_count_add_return(int val)
+{
+	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
+
+	pc += val;
+	WRITE_ONCE(current_thread_info()->preempt.count, pc);
+
+	return pc;
+}
+
+static inline int __preempt_count_sub_return(int val)
+{
+	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
+
+	pc -= val;
+	WRITE_ONCE(current_thread_info()->preempt.count, pc);
+
+	return pc;
+}
+
 static inline bool __preempt_count_dec_and_test(void)
 {
 	struct thread_info *ti = current_thread_info();
diff --git a/arch/s390/include/asm/preempt.h b/arch/s390/include/asm/preempt.h
index 6e5821bb047e..0a25d4648b4c 100644
--- a/arch/s390/include/asm/preempt.h
+++ b/arch/s390/include/asm/preempt.h
@@ -139,6 +139,16 @@ static __always_inline bool should_resched(int preempt_offset)
 	return unlikely(READ_ONCE(get_lowcore()->preempt_count) == preempt_offset);
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	return val + __atomic_add(val, &get_lowcore()->preempt_count);
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	return __preempt_count_add_return(-val);
+}
+
 #define init_task_preempt_count(p)	do { } while (0)
 /* Deferred to CPU bringup time */
 #define init_idle_preempt_count(p, cpu)	do { } while (0)
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index 578441db09f0..1220656f3370 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -85,6 +85,16 @@ static __always_inline void __preempt_count_sub(int val)
 	raw_cpu_add_4(__preempt_count, -val);
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	return raw_cpu_add_return_4(__preempt_count, val);
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	return raw_cpu_add_return_4(__preempt_count, -val);
+}
+
 /*
  * Because we keep PREEMPT_NEED_RESCHED set when we do _not_ need to reschedule
  * a decrement which hits zero means we have no preempt_count and should
diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index 51f8f3881523..c8683c046615 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -59,6 +59,20 @@ static __always_inline void __preempt_count_sub(int val)
 	*preempt_count_ptr() -= val;
 }
 
+static __always_inline int __preempt_count_add_return(int val)
+{
+	*preempt_count_ptr() += val;
+
+	return *preempt_count_ptr();
+}
+
+static __always_inline int __preempt_count_sub_return(int val)
+{
+	*preempt_count_ptr() -= val;
+
+	return *preempt_count_ptr();
+}
+
 static __always_inline bool __preempt_count_dec_and_test(void)
 {
 	/*
-- 
2.50.1 (Apple Git-155)

