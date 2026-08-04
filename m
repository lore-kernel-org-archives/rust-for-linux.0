Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7096C472543;
	Tue,  4 Aug 2026 16:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860105; cv=none; b=odttlONdUWXgS7PR4f0Lb0Exq4KFsO5A+036KQ+caFv7GuBZGTXsnKtGdNebvTB+6gw9SSRLqVADc+7sTFGUv7Bs9r3T7Dren3vciCd+KnsKdGwS8vmAFlV9Ic4zBEDNrMGk4vjcWBeyfNgKAe23HVgNG8daCiiSu28bkfXGVsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860105; c=relaxed/simple;
	bh=6ESVuJjZ9ui3/4DwNjKV/PraMIkzSH0Vd92IDm2WfD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FGE8u7+ApkMXyACXYPeWJWif8MFm4wgeDuzcn9BN3lCfKgthb1v1xJPzDfsUkgG51u//E9anfk9CAuAp35B36n1SkkJ+z53dzMKilEVJM6Fly3QjgJ8A/ykpxiw/x570ZUyAFJ7jvITt0Thy2CBUQWPfSlbIWSEa6UynMI0EJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esgkY0E5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esgkY0E5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41881F00A3F;
	Tue,  4 Aug 2026 16:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860098;
	bh=3oQWJsZRvEwPxCRQ6qISEKyc40r/iISGRFtA3wGNP7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=esgkY0E59U9F3yWySHsx5Y/eZVguUjSKQJYcl1OMWUFiQd+MEWsnxNsw2BdJh2AvK
	 EgIM4sW27tDcCciC+XOEykR1xjTnbE1iLcbhkeurYDfECDOWQ8ChX6O0g+AhsBMkKl
	 aVzv8CN4lgFRU8+Kv3Y+wR96Awx0IbRKdhxUa+4S+uKsL4sCA8ThsxtcGT0+S4hBsQ
	 kruKvNwbsZa/GILRxFs8M5K3F63S4OyS5TD0o3e0SiDFPh8I2cZiPXJmGIbvEY6aS+
	 Fjne69qhQYZdJx3K5fbCYhQG/Y4Rj96AGSOwQfc2E036uEkX9z9uyyUlVRkyVDP2WQ
	 eFprVfCV1OnJw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id E7497F40067;
	Tue,  4 Aug 2026 12:14:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 04 Aug 2026 12:14:56 -0400
X-ME-Sender: <xms:ABByampdEv-bzaNBSWCJZWLTwtBrKGPQo3PvWlcmPxWTAoR7zPJ63Q>
    <xme:ABByavAWrKsxvHtQAKwOV3fD1chZ0cJW5gF_1AtTKvruzkXLeqoAaE0pQ__G10M62
    m8Q4ZjtMXmAK7Rcxd7M6x2EhBbOMNWk-ZLT8ki0WoezQkiqxg9HWQ0>
X-ME-Received: <xmr:ABByahUE6KZlZVQQArAV5fqliRvai3fUFOUekm6-Xs0Ur9DYkruL3Iqd807Q4spE3ze7rlmRvYt0gMu08KbrjRJe6EA77Z9r>
X-ME-Proxy-Cause: dmFkZTEjNALs/vHMOloma/FioWgq38LEDphqLbi/MDKjZ+skyek9CBm72qNR6fF0uZPdGp
    TNcnAR4AQwTabPyqXb4b8VVQVFCNoT48fsLJV/4jNEVJ0A9eFv0ovpeauV2dgztP0aY1Y0
    jIaZAzpZKJmSr5bjx5yubrqLJ++dH6uDgWLI4XXVkSa8jJqAXQgEQlXOv7WGccuHPTRlER
    Ylu8rJket0jbyQhGWZ+weYiCIeD4wr9LDagDzAHrKU27qzYbzXZIXOYWeFfQKFS5QVbMSU
    NlfDPJ2QDHkDrdBA1iUAq2dsmA2mOrsNEsIEQsqJKBWsANZHLO8XMG8BasrOULdBqAdbeX
    OOMahMIm/rhqoL6GY9fUxxQCI3Bldg4POHtkDT2cA3TduIwl8MK74pMhGV8iQEg2pGCmNA
    dAjUEvTz4fQkubJvXGnKSf1mCzRi0Ci9XwBw36OJS3H/BPlhLDp738aj7497fBQmHtEWSF
    keXMoIg33iJHc+mNBqrj7/HlSOJdbkpJ2w08tZ9wbZvv564XLx/G4N2BVXcIrJNyZoOJQD
    4MzhRAyje4qgb6BjVttB/5fTLsQw1tqfnLc/Bo4mMQvWcaxbbr7l1DGrCH+dpUJSaWYnoB
    GfX/2pkWszUtVSXzx0agoO5siO3/s7PspXuaIbjVEKxJbUbviICBUUTt54pg
X-ME-Proxy: <xmx:ABByahC_N5lGgYxlYRdt3hmQAkNtaBDUhIMMS-_I866h6wQwX8htvQ>
    <xmx:ABByaue-T-mYctlfmSi_ofQvZa5CCGBPRuK0WMqFRIIK4KGTwxqQDQ>
    <xmx:ABByaopFFn-UXN8DxlFbtERf-9KjfO5espBrQHzqgz1DBSQNyLuH_w>
    <xmx:ABByavQHEUfD01k7Ri4wJQGdSMO9tbDtMEqBIs9DmmqBsunxH1vvKQ>
    <xmx:ABByaoVq59JUYTCCT8bjtOCy1EO93oEGoX2w28iijHjOnu3b8SUSz5ho>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:14:56 -0400 (EDT)
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
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v4 01/17] preempt: Track NMI nesting to separate per-CPU counter
Date: Tue,  4 Aug 2026 09:14:23 -0700
Message-ID: <20260804161447.84806-2-boqun@kernel.org>
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Move NMI nesting tracking from the preempt_count bits to a separate
per-CPU counter (nmi_nesting). This is to free up the NMI bits in the
preempt_count, allowing those bits to be repurposed for other uses.

Reduce NMI_BITS from 4 to 1, using it only to detect if we're in an NMI.
The per-CPU counter currently caps nesting at 15.

[boqun: Address Steven Rostedt's comment on the BUG_ON() condition]
[boqun: Use preempt_count_set() in __nmi_exit() to avoid underflow]

Suggested-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 include/linux/hardirq.h                        | 17 +++++++++++++----
 include/linux/preempt.h                        |  9 +++++++--
 kernel/softirq.c                               |  2 ++
 tools/testing/selftests/bpf/bpf_experimental.h |  2 +-
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index d57cab4d4c06..8d4895531a45 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -10,6 +10,8 @@
 #include <linux/vtime.h>
 #include <asm/hardirq.h>
 
+DECLARE_PER_CPU(unsigned int, nmi_nesting);
+
 extern void synchronize_irq(unsigned int irq);
 extern bool synchronize_hardirq(unsigned int irq);
 
@@ -102,14 +104,17 @@ void irq_exit_rcu(void);
  */
 
 /*
- * nmi_enter() can nest up to 15 times; see NMI_BITS.
+ * nmi_enter() can nest - nesting is tracked in a per-CPU counter.
  */
 #define __nmi_enter()						\
 	do {							\
 		lockdep_off();					\
 		arch_nmi_enter();				\
-		BUG_ON(in_nmi() == NMI_MASK);			\
-		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
+		/* Maximum NMI nesting is 15. */		\
+		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
+		__this_cpu_inc(nmi_nesting);			\
+		__preempt_count_add(HARDIRQ_OFFSET);		\
+		preempt_count_set(preempt_count() | NMI_MASK);	\
 	} while (0)
 
 #define nmi_enter()						\
@@ -124,8 +129,12 @@ void irq_exit_rcu(void);
 
 #define __nmi_exit()						\
 	do {							\
+		unsigned int nesting;				\
 		BUG_ON(!in_nmi());				\
-		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
+		__preempt_count_sub(HARDIRQ_OFFSET);		\
+		nesting = __this_cpu_dec_return(nmi_nesting);	\
+		if (!nesting)					\
+			preempt_count_set(preempt_count() & ~NMI_MASK);	\
 		arch_nmi_exit();				\
 		lockdep_on();					\
 	} while (0)
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index d964f965c8ff..586f96688325 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -17,6 +17,8 @@
  *
  * - bits 0-7 are the preemption count (max preemption depth: 256)
  * - bits 8-15 are the softirq count (max # of softirqs: 256)
+ * - bits 16-19 are the hardirq count (max # of hardirqs: 16)
+ * - bit 20 is the NMI flag (no nesting count, tracked separately)
  *
  * The hardirq count could in theory be the same as the number of
  * interrupts in the system, but we run all interrupt handlers with
@@ -24,16 +26,19 @@
  * there are a few palaeontologic drivers which reenable interrupts in
  * the handler, so we need more than one bit here.
  *
+ * NMI nesting depth is tracked in a separate per-CPU variable
+ * (nmi_nesting) to save bits in preempt_count.
+ *
  *         PREEMPT_MASK:	0x000000ff
  *         SOFTIRQ_MASK:	0x0000ff00
  *         HARDIRQ_MASK:	0x000f0000
- *             NMI_MASK:	0x00f00000
+ *             NMI_MASK:	0x00100000
  * PREEMPT_NEED_RESCHED:	0x80000000
  */
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	4
+#define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 4425d8dce44b..10af5ed859e7 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -88,6 +88,8 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabled);
 EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
 #endif
 
+DEFINE_PER_CPU(unsigned int, nmi_nesting);
+
 /*
  * SOFTIRQ_OFFSET usage:
  *
diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 67ff7882299e..e4e12001fce9 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -367,7 +367,7 @@ extern int bpf_cgroup_read_xattr(struct cgroup *cgroup, const char *name__str,
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_BITS	4
-#define NMI_BITS	4
+#define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
-- 
2.50.1 (Apple Git-155)

