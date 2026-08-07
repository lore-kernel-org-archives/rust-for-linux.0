Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA5E3B71C7;
	Fri,  7 Aug 2026 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086167; cv=none; b=KLc6h8UO+fHFsjdMzFL+umfJ3n5ThSFxjNj49wojtWyLry+pgbE9YpS30qvUMIBNHSa2pb4LELsmAAiksNwhnmWQuStStz+dN6D59EDob7cr97L04TpRs9fY9UY0NTDxJ7mSwI5uOBTyS7LLQawdEiMVLzt3UEHg6eoAqkYYvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086167; c=relaxed/simple;
	bh=kLeRiC95t1IZBu689qepS3f7brPx8OxG9N0foKAWud8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=naY2I7raf/h/iMsKp4eSb7X5GdTz89ZBC+stznmeF+7Vg1Gst0mWm7BUSZ7qKWLbIaqy0pOP5O4QYo4JtU5Ot5CSrQe0QP/b4VlPiieWnSrvsshJW072ISZy00WV1NHl06kAaoEdY6gQIXKUzv274fdr2bRg3E9xf6C1UknPFXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WB7d6uM8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WB7d6uM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140D41F00A3D;
	Fri,  7 Aug 2026 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086166;
	bh=fj0vODnnkGxYzHO4JCnC/iMb/acZG7slJd0L06VbQoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WB7d6uM8putVq2O74TzVgUM2ZGvr/nnqmCwhX089PFF3q3kpBC/Nm50gzJ2jaiNaS
	 foMQ9yMdj8c5dBtQIRHJ4pHPpDYPYNjNJ3+3AoGtY0eKc9SZQ+ehgE6VMi1FT51l7G
	 VB9/9FIkfDyLjG6jeDzUqRDk3GZ0hdnLhGYC9d1SMMCgodu9wFJCJoefRayZIt6TXY
	 POqan+8ryB09hcmgmI091fix+DX5Zf3DP0B8jID6gVosESa+TusJYxmeuPqVQDl1yD
	 WtQXT8coTVFdSNILVcgNg/dI7eW0SesOJc2XjbLcqIxCF4o2/7VlYcD/08YoadLqHh
	 /tqC8+eXzdCOg==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2B5F1F40067;
	Fri,  7 Aug 2026 03:02:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 07 Aug 2026 03:02:44 -0400
X-ME-Sender: <xms:FIN1alvZX5nE_bMgV3pq3RK5kAvJ573ZoqazRKTnf8sgBAAz-PW-HQ>
    <xme:FIN1av3kFRdYe2YP_db9rEE-0sncqhNHUThBusvgIqS5_ws-6LGsPL2DVft1MNrqH
    2L4XqYcDJPP9ZiDjWeqQBVYNf57nUZ_1_WyW7otERizspElfjpgaQ>
X-ME-Received: <xmr:FIN1aiCNAJuS6ngep8qV931Ma75Juu1pZRS5FXysCfVPE1phlC45gWkxEely_QGGiVobHpaxorv97mdLoRCFwMAyEvWOtaGF>
X-ME-Proxy-Cause: dmFkZTGymVtxh0AmopRY+TfTfXYPCmloL5eVBz8w4y+3KFrHM+Bwv6o50auh1636bSBYkE
    H90J+8ZvDwGP+GEnsL03hmghhkCvgcLvZRJlD0Z0K6idzeBe96fVCfVF90zAumgR10DH6A
    dzrkds6t6yssM5k8WnRKyJY7PoN9yPTJEd8yclKHhKcjgA77IEZ54Ob7IjTR0RbJw1Jd/H
    MAKXnEz1+HSwhiWHnu3/dGxtHg6i6x+jlrZPffCsJNEQERYySXee/h/1gQg2z905mRcC4Y
    mB/oQJoiVpI6TFSRaftlL1E+wAZyQH5fXLMWv+6L12SLyEAsyE0kkUaQtsxqspvPUOq9Ew
    q4mx01rO3hjejbMwbhxCthduMeu3N9aDgo913iixAVTe3XN0h6jyPu6pwjCQAx80rEJOUr
    74UR8acqG594NYmFqzMNJ9vyIELj5sl5ikUeQUz7GfTrpV1jB3QnB2Rdb18UcoTG1xLS8o
    EOqHF9FaXuK39wNUmpPPMUY3zXRmmNGkAVv3+QW8GKuHJg6kdBGTGSrz6dRhFwJ+cw9h4Z
    wlGenI5YMv301MEMYJD0kqa8bLUiKJc1VRTAmY4kiJNr7WawQ6CUoHkniXaDEH5KQBwsPn
    2pwfpjNbmkhVko6vbQxAXiY8VQjT/7m+/frsJRwh8qDoz+IhaDyvVn0WWxeQ
X-ME-Proxy: <xmx:FIN1akeNfVuXVR-0tzvmoPz7qDVWaPCfCDT6twJTUynMEe95dWeywg>
    <xmx:FIN1asz6fKbetBxHMwex1hfJwKzB-uY6NblPg6ok37sVqMH-HQsnbg>
    <xmx:FIN1anNufV1Bgu3bsP4_6iavHG0hqKOp3WWBRHYrIziuQMqSImhoPw>
    <xmx:FIN1ajarlr0sIQelqHw-99DbM9aOXYEQ85uyos1zvdSM462p9kM6_g>
    <xmx:FIN1ahqid-WH2L2zWVRvjQSoGSyptIq_V1UeD7W6yyaoGjrITM7hrHbJ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:43 -0400 (EDT)
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
Subject: [PATCH v5 13/18] s390/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Fri,  7 Aug 2026 00:02:10 -0700
Message-ID: <20260807070218.27144-14-boqun@kernel.org>
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

From: Heiko Carstens <hca@linux.ibm.com>

Convert s390's preempt_count to 64 bit, and change the preempt
primitives accordingly.

Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
[boqun: Apply the corrected comment for asm block]
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 arch/s390/Kconfig               |  1 +
 arch/s390/include/asm/lowcore.h | 13 +++++++---
 arch/s390/include/asm/preempt.h | 43 +++++++++++++++------------------
 3 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 84404e6778d5..378fcd2b6181 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -273,6 +273,7 @@ config S390
 	select PCI_MSI			if PCI
 	select PCI_MSI_ARCH_FALLBACKS	if PCI_MSI
 	select PCI_QUIRKS		if PCI
+	select HAS_SEPARATE_PREEMPT_RESCHED_BITS
 	select SPARSE_IRQ
 	select SWIOTLB
 	select SYSCTL_EXCEPTION_TRACE
diff --git a/arch/s390/include/asm/lowcore.h b/arch/s390/include/asm/lowcore.h
index 3b3ecc647993..5cef215d30e7 100644
--- a/arch/s390/include/asm/lowcore.h
+++ b/arch/s390/include/asm/lowcore.h
@@ -160,10 +160,15 @@ struct lowcore {
 	/* SMP info area */
 	__u32	cpu_nr;				/* 0x03a0 */
 	__u32	softirq_pending;		/* 0x03a4 */
-	__s32	preempt_count;			/* 0x03a8 */
-	__u32	spinlock_lockval;		/* 0x03ac */
-	__u32	spinlock_index;			/* 0x03b0 */
-	__u8	pad_0x03b4[0x03b8-0x03b4];	/* 0x03b4 */
+	union {
+		struct {
+			__u32	need_resched;	/* 0x03a8 */
+			__u32	count;		/* 0x03ac */
+		} preempt;
+		__u64	preempt_count;		/* 0x03a8 */
+	};
+	__u32	spinlock_lockval;		/* 0x03b0 */
+	__u32	spinlock_index;			/* 0x03b4 */
 	__u64	percpu_offset;			/* 0x03b8 */
 	__u8	percpu_register;		/* 0x03c0 */
 	__u8	pad_0x03c1[0x0400-0x03c1];	/* 0x03c1 */
diff --git a/arch/s390/include/asm/preempt.h b/arch/s390/include/asm/preempt.h
index 0a25d4648b4c..5560d5fca2a3 100644
--- a/arch/s390/include/asm/preempt.h
+++ b/arch/s390/include/asm/preempt.h
@@ -8,11 +8,8 @@
 #include <asm/cmpxchg.h>
 #include <asm/march.h>
 
-/*
- * Use MSB so it is possible to read preempt_count with LLGT which
- * reads the least significant 31 bits with a single instruction.
- */
-#define PREEMPT_NEED_RESCHED	0x80000000
+/* Use MSB for PREEMPT_NEED_RESCHED mostly because it is available. */
+#define PREEMPT_NEED_RESCHED	0x8000000000000000UL
 
 /*
  * We use the PREEMPT_NEED_RESCHED bit as an inverted NEED_RESCHED such
@@ -26,25 +23,25 @@
  */
 static __always_inline int preempt_count(void)
 {
-	unsigned long lc_preempt, count;
+	unsigned long lc_preempt;
+	int count;
 
-	BUILD_BUG_ON(sizeof_field(struct lowcore, preempt_count) != sizeof(int));
-	lc_preempt = offsetof(struct lowcore, preempt_count);
-	/* READ_ONCE(get_lowcore()->preempt_count) & ~PREEMPT_NEED_RESCHED */
+	lc_preempt = offsetof(struct lowcore, preempt.count);
+	/* READ_ONCE(get_lowcore()->preempt.count) (without PREEMPT_NEED_RESCHED) */
 	asm_inline(
-		ALTERNATIVE("llgt	%[count],%[offzero](%%r0)\n",
-			    "llgt	%[count],%[offalt](%%r0)\n",
+		ALTERNATIVE("ly		%[count],%[offzero](%%r0)\n",
+			    "ly		%[count],%[offalt](%%r0)\n",
 			    ALT_FEATURE(MFEATURE_LOWCORE))
 		: [count] "=d" (count)
 		: [offzero] "i" (lc_preempt),
 		  [offalt] "i" (lc_preempt + LOWCORE_ALT_ADDRESS),
-		  "m" (((struct lowcore *)0)->preempt_count));
+		  "m" (((struct lowcore *)0)->preempt.count));
 	return count;
 }
 
-static __always_inline void preempt_count_set(int pc)
+static __always_inline void preempt_count_set(unsigned long pc)
 {
-	int old, new;
+	unsigned long old, new;
 
 	old = READ_ONCE(get_lowcore()->preempt_count);
 	do {
@@ -63,12 +60,12 @@ static __always_inline void preempt_count_set(int pc)
 
 static __always_inline void set_preempt_need_resched(void)
 {
-	__atomic_and(~PREEMPT_NEED_RESCHED, &get_lowcore()->preempt_count);
+	__atomic64_and(~PREEMPT_NEED_RESCHED, (long *)&get_lowcore()->preempt_count);
 }
 
 static __always_inline void clear_preempt_need_resched(void)
 {
-	__atomic_or(PREEMPT_NEED_RESCHED, &get_lowcore()->preempt_count);
+	__atomic64_or(PREEMPT_NEED_RESCHED, (long *)&get_lowcore()->preempt_count);
 }
 
 static __always_inline bool test_preempt_need_resched(void)
@@ -88,8 +85,8 @@ static __always_inline void __preempt_count_add(int val)
 
 			lc_preempt = offsetof(struct lowcore, preempt_count);
 			asm_inline(
-				ALTERNATIVE("asi	%[offzero](%%r0),%[val]\n",
-					    "asi	%[offalt](%%r0),%[val]\n",
+				ALTERNATIVE("agsi	%[offzero](%%r0),%[val]\n",
+					    "agsi	%[offalt](%%r0),%[val]\n",
 					    ALT_FEATURE(MFEATURE_LOWCORE))
 				: "+m" (((struct lowcore *)0)->preempt_count)
 				: [offzero] "i" (lc_preempt), [val] "i" (val),
@@ -98,7 +95,7 @@ static __always_inline void __preempt_count_add(int val)
 			return;
 		}
 	}
-	__atomic_add(val, &get_lowcore()->preempt_count);
+	__atomic64_add(val, (long *)&get_lowcore()->preempt_count);
 }
 
 static __always_inline void __preempt_count_sub(int val)
@@ -119,15 +116,15 @@ static __always_inline bool __preempt_count_dec_and_test(void)
 
 	lc_preempt = offsetof(struct lowcore, preempt_count);
 	asm_inline(
-		ALTERNATIVE("alsi	%[offzero](%%r0),%[val]\n",
-			    "alsi	%[offalt](%%r0),%[val]\n",
+		ALTERNATIVE("algsi	%[offzero](%%r0),%[val]\n",
+			    "algsi	%[offalt](%%r0),%[val]\n",
 			    ALT_FEATURE(MFEATURE_LOWCORE))
 		: "=@cc" (cc), "+m" (((struct lowcore *)0)->preempt_count)
 		: [offzero] "i" (lc_preempt), [val] "i" (-1),
 		[offalt] "i" (lc_preempt + LOWCORE_ALT_ADDRESS));
 	return (cc == 0) || (cc == 2);
 #else
-	return __atomic_add_const_and_test(-1, &get_lowcore()->preempt_count);
+	return __atomic64_add_const_and_test(-1, (long *)&get_lowcore()->preempt_count);
 #endif
 }
 
@@ -141,7 +138,7 @@ static __always_inline bool should_resched(int preempt_offset)
 
 static __always_inline int __preempt_count_add_return(int val)
 {
-	return val + __atomic_add(val, &get_lowcore()->preempt_count);
+	return val + __atomic64_add(val, (long *)&get_lowcore()->preempt_count);
 }
 
 static __always_inline int __preempt_count_sub_return(int val)
-- 
2.50.1 (Apple Git-155)

