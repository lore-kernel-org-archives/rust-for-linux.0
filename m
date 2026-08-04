Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097D04746BD
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860114; cv=none; b=aNzK9JLuz2HnKnkZWKolOcUnrY/RXXozlFeRBXbXKdJOmgq5MeQu5PtRZ1sYwaArvYQp8opn+pnMb7eD0qqCrl0vevErPnQ7Obxq2BgpCcjrULq3mb1XmkNo/ZRfq/SxYINcLtcDR7BD3vs30ZKCGxFCP4gUJmM8d5y7cFQw6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860114; c=relaxed/simple;
	bh=ZdmP9HCAd2oDU8aGybcrgEt64oPFu3q8ZuAOXbDuT/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZIQZmSu40QyrjELoR+isOyX5HQlfDe2AuO/5+fQm9pOlFHofXvHjy3b1znstauLwEZ4csD3bH8zF5UdcmdFvekjr3zySEwv8463d1dz2trX+3Z6N+U0Jf7j09Ca2m78ACEq3hLLprIO2w4h35p+lKYO850dxAqkW1r+pmWZ+jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+dHwV53; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+dHwV53"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD281F00ADE;
	Tue,  4 Aug 2026 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860101;
	bh=4/3Q4RbdeBoEcapTLQLRtJHDgKIOcLItV3asUF3+BOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L+dHwV53qP3k4wqLoSjUkrebLPJGSMNKOhTywAQQ76uECjB9szMD30Fck+oG19BQr
	 vYFOU8xOUhiA3cVrRiA7OXhQvtzqYGMHRpMDBTFfzSMxFcdl+0RDCO6etVU6iTPQrP
	 T/Bxvrxk5mz82p3Pfpn6J6Vszci/sWc89Ye1DtAUe6dCDnFuqk9Qh4AHDfX6sN0voA
	 s0iu432/ah2rvpTk91k7WL9lBpZvBFecycd19POrbWL7yU8pk7pSOM6rbWl9qkjYxd
	 +b2shnkLbbQJJJF+9mwiJPa/G/yp6a+Xaqr5P9b1zL6ASGq2XLPj8nlNynXg55D/2R
	 CsIyERxBD5jDQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id E9FDCF40066;
	Tue,  4 Aug 2026 12:14:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 04 Aug 2026 12:14:59 -0400
X-ME-Sender: <xms:AxByal_8tBTyF8Rd4TDabOBMNGZmkzgCxPil8QLf3i_X21bkDyIv5A>
    <xme:AxByaorTiwkaQauPLegkyncohfzDh9bXi2YZgCa0s-cQwUL5qcm5wHwFLmtDO4Mod
    5KfGpq9IKZ7OluVS0bxHdGVJpdRdLKTZeuIpiflP7BUTdCU5zTwuik>
X-ME-Received: <xmr:AxByavGAeZO3DtvwhunlMBq1VCeLe4OLy_mcjHIjf5C7ul1X16h0cpOAT-_IKuXduE67hWuxWKsB-FTM5SuJdr2kk_DYRMu5>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbXq
    8UWtW5wdOgo9aU+rtxQ2MCFvpZ1+bx4h2YQzeYk5x0rFmmR478XZgVEan5718CRZzA7cJT
    RnYvxUiw3FBCFcKLF2ObIgX5tCyLTffdBvXgpfd+ITNATyzuAOQjd2N7q6QQrhazVXBuQ0
    BOeytv+jFZQRffaNB2xUY8b3dffI+MBCzSsfVl7RL8OrRxgsLZ42l9oG/k+CZG9SKM1euD
    oLOt+3vFBxammBZr9RVXSajzGnXVlKJ4w1X2c3v/RI0Amg5PnYNtD7xpOsjyGHf3LWXSoS
    Oqb68hADFB8Akot3opT/e9JRdvh79gPT8zgMBkNQb93oLl3h6L9XkT20cf5g
X-ME-Proxy: <xmx:AxByas_cozEdoj3u8n8Ar9grztRIMNKbH44l7yZRqh2LNJrNkMhlLw>
    <xmx:AxByasTNjMLE-mDqn0sE_a-ddujmjoO1Q3HpFWtBp1RNQHNf14zu4A>
    <xmx:AxByahq_LBoGU5RUo0FkJOtV4L7Hlmz1w4DO6yEpVCPEMkFtM2jF8g>
    <xmx:AxByapMZasT4mf9ieFkBnPkLm5g2FYRN-ewWRbgsnqeibqNu_zex6w>
    <xmx:AxByanx9_BVWJqG-VlS4LvFLFRtGzjkvOG123yq7SCjHYBQA_wh2NuwD>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:14:59 -0400 (EDT)
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
Subject: [PATCH v4 03/17] preempt: Introduce __preempt_count_{sub,add}_return()
Date: Tue,  4 Aug 2026 09:14:25 -0700
Message-ID: <20260804161447.84806-4-boqun@kernel.org>
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

