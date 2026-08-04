Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DF14749C6
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860123; cv=none; b=IfV9L1Jmt+n/B+w0h197zIQxmvaQDN8Eo2EUK08zJKZcY1eM98HUVDWdJ4LMUYJB4mLYnDEDMSjhwhJ/1jY0bD+4p1IFV8SSwqNTF5tIbZkxHdzlcgd7Wmy888c6xVpVUZPGW3MbrHsLetUrPbC18nZM6csYqb+Ty/Tt00Th2b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860123; c=relaxed/simple;
	bh=kLeRiC95t1IZBu689qepS3f7brPx8OxG9N0foKAWud8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mu4ubMzYyO8a528V88X1ZGkct9Cv6pd9jNETqLAhnI7JvFawHcNGl+PFmGsU25CtZtIzApUy7XIY//dUC+nSCCrrZ5agyLI1MYTZxWwet240QHNvOIaceiWQRRufeiIKfE7Lkm7TXojEdJGV/AHmOld6NyIvsuLWIZSgUIu3+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg/Vfzhx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg/Vfzhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9B41F00A3A;
	Tue,  4 Aug 2026 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860116;
	bh=fj0vODnnkGxYzHO4JCnC/iMb/acZG7slJd0L06VbQoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tg/VfzhxL7mOxhQWfgk135JTuAp/akopIMRdZhsjgKDODR3/3rTB1l4W7TOqvoG82
	 PSCaCvR7jjlJFkK9bYqAo5YE1saa5NHv+96rfVc2MgJKsHYKHA0276C+l4WDw+nCxb
	 gwOCI68MFN5nFJ6vufIunfJjfigxWdswefJ7emqdNp9D560ty705RJ9J294I4eJwBD
	 iG4Xb+EK4zy12O99sk2cN7OIGD5BAXu4/Cwx+AqgpXrtBSI4wnspHDv1f9OXVxihE6
	 I0kJzPLmoi7o7hfdm4kzjsiNc4a0SIKKR7Xggp1rw0W1VTMCi7k87tHfjgT/G7XjGz
	 WelmnMps6TmyA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 87D75F40066;
	Tue,  4 Aug 2026 12:15:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 04 Aug 2026 12:15:15 -0400
X-ME-Sender: <xms:ExByaol66VUV-4UxhiO4hN8pyiZQUCNKGRRNtsIGVAyCRYMC7wDZig>
    <xme:ExByanRmMzhobTgVta3gLOt-v0kAR3tocPnhyIQNnYeAHKHE3P3um5PBcnG0JYErx
    5ka-2YuhqYZYoNO59oCyJMxeR5y8ZsRYXzvceYN18Y7RCJDw0ls5Bo>
X-ME-Received: <xmr:ExByanvcCbtHv1JonAZnVVgQ8bV_F8xkmQ7OrL4C6GxzL5DXrvaw0QEGJIcHeJS_BS2kBBnxQ2ud-uQjarlA9W-w2S3mDYi9>
X-ME-Proxy-Cause: dmFkZTFdfHSt+dGlSIgweIKZqd43ZIr2UVwMz+DLCV7Uxtqr2tWdjT0gNVbLG23y/ntMNr
    yg2u9xNueu4ZlCPesc7IGVMS6ZqisyNG2Hp2kDVIfbBL9QFp1F1pvbwsQcrNmamnsGJsZY
    AmMncETOYZEkhlG6T7JDS64AVGc7Ln4zXY6x3T0lHgb+OYvht9swwTIGsG7Xot0GJG9bWc
    fhVx9JgcfYh5ECBMh98FFx1XWl/VnjhK7S6I+ssCNmeXl+D6Do6MWM72zOvrRuLzi3YdIE
    +uwF6SMc7tQqt75yJIKNoQF+R4TbmXy2JAxyIWDxHsQYaXIqpYC7ilWb/r9+jjwAD2Jcjz
    28wF4sgDT2EH23Nebbu61ApdvxCjYbSdUHRXAsdG1yTtm8Y7k8SQqW1EetYOz5cxbv2b8B
    W8UZFUjttuZMD52p2U81KglKeO2B5sQc+lXj5tnlucVSj4MdbyB8iFmlbFKZ9rcRiglALw
    Nkaqs+jWRdY5op6mEq2/TalHs5nrdXvvjdMp3r8EPU9E2Miq1TDxI6BU7o3euyEZ9hQGQV
    8Jbo/QEsmRzjBOEoCuBNed3Evu1EqoMtAcIwQ8c/kEYxgbnUhFoTMR1SMX61AEE62eYnHj
    QnPU9CbKYNzN7FnRcxHs0qIqJWlAyOUqzJNKiMkxOTBSMSb9N3CStF4CLhpA
X-ME-Proxy: <xmx:ExByao7VV57C9luxJP4oGdpf72fKMyELbLitk0trj32VgsglW729Ag>
    <xmx:ExByaqjxDrk8lPqJyFfKyYoPSv651eMG-jH1SPG_infaU2b8-vwBbQ>
    <xmx:ExByaimk6wX5a-8MsDKlYScRj8auSi2myxoS7u11m38B1AHRoiQTpw>
    <xmx:ExByahvGSDkJCG6clMnSCwEfh9eJIWbPB7TSfwPg8wZBmMO_HZNJuA>
    <xmx:ExByagD7j4QQDU86XATUxiv7EbzB8DAqn78nZq7XPwZaPKK6ocm2ezjA>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:14 -0400 (EDT)
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
	Heiko Carstens <hca@linux.ibm.com>
Subject: [PATCH v4 12/17] s390/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Tue,  4 Aug 2026 09:14:34 -0700
Message-ID: <20260804161447.84806-13-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-1-boqun@kernel.org>
References: <20260804161447.84806-1-boqun@kernel.org>
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

