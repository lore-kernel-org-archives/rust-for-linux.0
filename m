Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F63822AA;
	Fri, 31 Jul 2026 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529860; cv=none; b=WT972sDmNabxBqIWW3CU/hVOn3ieEj1ynee/79IGsAdNGzzb8yY00UHOxaQR/ozLXJPsvtcM5fnTVn/oJW4DxATLQbGyZ8dO8GDLMUzP1qiGLGE/hnAHnxTA5i86NWOVyfDKd/kcG3VGWVsgmQgVZ0FmyiwCFcpmFgY7yUQ0Nw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529860; c=relaxed/simple;
	bh=raWQqz9gQpyQdZeeG6jtU2j//DLg/OLByTkuNHS7FRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPOAuPBMT5zVm9PhddnpsjgiLui6BUYPHaT1oy3ZQEzlR+UlkLtthmKQS/gsNtgPRYjsArbbdd4R7Obn8rIzGrPUDAzScCpcj1wIPL1r9gVi1Fa0wBcKLTYBXhYYYW5t3TJQ+kzIEnbCyPNitTAszM29OfrRE7d/PD15P53oMkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnnDe5el; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnnDe5el"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5201F00ACF;
	Fri, 31 Jul 2026 20:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529858;
	bh=gPacRWUE8d9BStFdwgFA5J4tq/QViHyWDEzGTjWCNxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HnnDe5elH0H6FsXTKSqHqpXL39HuCasqI0BUcDBIKpT3FKWLhlvydva+KAw+dmY4X
	 3/GFSI8HuN3GAcN5xhYIW14HVs845w73TGhdNqKRptxkVADOG0QRwnUDIE05Brpxz7
	 4M+Jbh18YAbpHVqJRixztj38x2h1wCPqsA04oovxzArecfyDJten4R1P9zyyxksGxe
	 MIALSxxPSKvA92mZnZcBsOQEHioXfpeX62rZZCOLi09QF3etxFwQQvULbVGA/o7pQd
	 +9S5cVIw3aVN8AvFrs8vIkaAoWIGl2CIZLKf8ujzHh7XQk6o5gG48XimSMOfbo1+uj
	 7z2nl/uou+OWA==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 17BC6F40077;
	Fri, 31 Jul 2026 16:30:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 31 Jul 2026 16:30:57 -0400
X-ME-Sender: <xms:AQZtatQITeIQzeeQ1-sqpWRZcJwoySOW_9SPkZJZ_B0bHNjok8ffMw>
    <xme:AQZtamNekqcSwrtwqkhgtF0j7Nya2qbBjZBaFTIRfQM72lUjjGOCOLw7cSGSxlFJN
    IXzjZ7ohb1ozGvaWN4BE7_r3tE8rSJOrVk_wrguwT-pnaocN0TriA>
X-ME-Received: <xmr:AQZtaj4njkt00wQZyR0kwN9ZvIIDIjq5-3etGyfwhhUe0NpDsCbK_EU_SrEMgxXjbu9B4FgquX7TnrsCIjvOJNaP9T74C72B>
X-ME-Proxy-Cause: dmFkZTFdRdBIF8ZH/aPs2g1lRw7GATpB3kPZdHQ9SRq3TCfYELIaqSZraFLrXlLQvfZ+Zw
    L2FnPfSJd952oWr+y28mIfAsYcvh2g32U0J8iwTV49f0k9Q8hXOe/2BgVhInUEnjhmC2lX
    03vYTAlN0bq9NjF03uLbRgPGL4766SVn/XbgM9h+YDdXpmZY+TYoTPsYcygLFMbtetKCiX
    MKKxau189OoX/tBJGac9kkLntk5lYAb6ORV5iOKO0UE2KpFdBfn5cZVhjAZINCJF+DQAjd
    IJX9TqJvKbTOKjLKBWundtWMSfFqKbkgkDYizysOgKGZkbbhOs1gMmPcuy0Gf54a13j8l7
    7gCw/KYUbI4D9PNQkOz6D7Cds5w/Kng7H6GTcf7i1M4HyhTC/n43N+aJ9bqxSGYASrFjZE
    vRjX0J3uIxYM68WkNnFTHr648ylqW/1DqCHb74Nb/fCLMMoONWrkiP3YZ5P0EUyy0Or5BP
    7pAQdiexdo98vGTYLhBdWNOXOYjewm3c9o+H/sEssZmK1zLAZYZDXtp7J7h4SHYUHlR6TI
    Zd4wBtuvHHhqGGfOAdIjux71buWJkJDul1ZHznPa7CjLM/n4pyc3LQtaD7Q0byQABRc5Lu
    eJmRdljxBP6rQUI+Gah8DtbWaAsxAzwchKsQ2llp+ugKzKfiFXH/870EpnXg
X-ME-Proxy: <xmx:AQZtapXcmgcjE4KK6urm3exVSPtPGvwPJ1JScQpnlAPTl3qzBn-jPw>
    <xmx:AQZtaqM5XU_C8-FQL92S7f_ecnLkr4W2N2ImJL2m3fn6yGJabQp8XQ>
    <xmx:AQZtagjMT19Ik5cFFWVk_TGX5jbfRgdMRya2k00LRTJKUh0BKaMdPw>
    <xmx:AQZtag4aVGjs0kgW19xF3e1PLT9Ta_kLIgiLyEoOqHNsm38TJW6VHA>
    <xmx:AQZtancL09fMbYZEGtYSwQTWgNaMy9ciu76vO2n-eZU1dV3Y9sXbaqfC>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:56 -0400 (EDT)
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
Subject: [PATCH 12/24] s390/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
Date: Fri, 31 Jul 2026 13:30:13 -0700
Message-ID: <20260731203031.13679-13-boqun@kernel.org>
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

From: Heiko Carstens <hca@linux.ibm.com>

Convert s390's preempt_count to 64 bit, and change the preempt
primitives accordingly.

Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260509181249.16281C67-hca@linux.ibm.com
---
 arch/s390/Kconfig               |  1 +
 arch/s390/include/asm/lowcore.h | 13 +++++++----
 arch/s390/include/asm/preempt.h | 41 +++++++++++++++------------------
 3 files changed, 29 insertions(+), 26 deletions(-)

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
index 0a25d4648b4c..1d5e4d7e9e1b 100644
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
+	lc_preempt = offsetof(struct lowcore, preempt.count);
 	/* READ_ONCE(get_lowcore()->preempt_count) & ~PREEMPT_NEED_RESCHED */
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

