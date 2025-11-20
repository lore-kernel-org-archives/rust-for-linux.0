Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA7E313278
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 21:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675246; cv=none; b=VYWUyFYkYMtWvetUmxOQsvxg/HtNWlZYeOULjxcToiMYiT5DgKQVkxLhkH95eDXenCbGGN17ZnYfEfMs7CqFWH6iMKT/9io9cI7xo4z98kCpEtBjpuNHo7RIKjBQs4kgRIgCMvFZ4p5zvAYHlDSOkY6qaWNVoa4+9s6syig+P40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675246; c=relaxed/simple;
	bh=+7DH346Emdvh7ZhYWlqgiXm73E02VF+SA4fcWTXB+Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sE6xK8q9ZW1DxYog4yIqZtWoQDGmJBW2NaVaQwWcgDdWfRFsEfMv6aAzbV1CRrbMgyOp1VlcQJ/1/i39De2MIqVlUxzSVcodnP7GI3aHHy8QPppX3/R1Ijl/jKVu43VxYpCipeEqFJ7emzgcnty17EMPJbvogu81VnIuJLr+uko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UP3hWjYS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UP3hWjYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763675242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E4arHzj9Tmn4ww7n755Uf352k1Sb03UtgQvEaq69DZs=;
	b=UP3hWjYSJlghEzTIcxjddGw1MzCtVY+BG/utuhMHKtkV4CjQD79PF16UJQDo7WQ87YNk6l
	OjMXEBgqZvCW70a5+OsT7jxeOwneVSsWnn/1+vGCARD8qBRHjV+XYD1VVvkrTknB+BrtBU
	v7L1JfqtguIvlYEwRu5hC56a99un05E=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-eq2roTPTPpqhTLrCRLKpuQ-1; Thu,
 20 Nov 2025 16:47:18 -0500
X-MC-Unique: eq2roTPTPpqhTLrCRLKpuQ-1
X-Mimecast-MFC-AGG-ID: eq2roTPTPpqhTLrCRLKpuQ_1763675236
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D3761956058;
	Thu, 20 Nov 2025 21:47:15 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.52])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ACA611940E88;
	Thu, 20 Nov 2025 21:47:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v14 02/16] preempt: Track NMI nesting to separate per-CPU counter
Date: Thu, 20 Nov 2025 16:45:54 -0500
Message-ID: <20251120214616.14386-3-lyude@redhat.com>
In-Reply-To: <20251120214616.14386-1-lyude@redhat.com>
References: <20251120214616.14386-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Joel Fernandes <joelagnelf@nvidia.com>

Move NMI nesting tracking from the preempt_count bits to a separate per-CPU
counter (nmi_nesting). This is to free up the NMI bits in the preempt_count,
allowing those bits to be repurposed for other uses.  This also has the benefit
of tracking more than 16-levels deep if there is ever a need.

Reduce multiple bits in preempt_count for NMI tracking. Reduce NMI_BITS
from 3 to 1, using it only to detect if we're in an NMI.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Joel Fernandes <joelaf@google.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/linux/hardirq.h | 16 ++++++++++++----
 include/linux/preempt.h | 13 +++++++++----
 kernel/softirq.c        |  2 ++
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index d57cab4d4c06f..cc06bda52c3e5 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -10,6 +10,8 @@
 #include <linux/vtime.h>
 #include <asm/hardirq.h>
 
+DECLARE_PER_CPU(unsigned int, nmi_nesting);
+
 extern void synchronize_irq(unsigned int irq);
 extern bool synchronize_hardirq(unsigned int irq);
 
@@ -102,14 +104,16 @@ void irq_exit_rcu(void);
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
+		BUG_ON(__this_cpu_read(nmi_nesting) == UINT_MAX);	\
+		__this_cpu_inc(nmi_nesting);			\
+		__preempt_count_add(HARDIRQ_OFFSET);		\
+		preempt_count_set(preempt_count() | NMI_MASK);	\
 	} while (0)
 
 #define nmi_enter()						\
@@ -124,8 +128,12 @@ void irq_exit_rcu(void);
 
 #define __nmi_exit()						\
 	do {							\
+		unsigned int nesting;				\
 		BUG_ON(!in_nmi());				\
-		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
+		__preempt_count_sub(HARDIRQ_OFFSET);		\
+		nesting = __this_cpu_dec_return(nmi_nesting);	\
+		if (!nesting)					\
+			__preempt_count_sub(NMI_OFFSET);	\
 		arch_nmi_exit();				\
 		lockdep_on();					\
 	} while (0)
diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 94ebdd98b7a94..860769a717c10 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -18,6 +18,8 @@
  * - bits 0-7 are the preemption count (max preemption depth: 256)
  * - bits 8-15 are the softirq count (max # of softirqs: 256)
  * - bits 16-23 are the hardirq disable count (max # of hardirq disable: 256)
+ * - bits 24-27 are the hardirq count (max # of hardirqs: 16)
+ * - bit 28 is the NMI flag (no nesting count, tracked separately)
  *
  * The hardirq count could in theory be the same as the number of
  * interrupts in the system, but we run all interrupt handlers with
@@ -25,18 +27,21 @@
  * there are a few palaeontologic drivers which reenable interrupts in
  * the handler, so we need more than one bit here.
  *
+ * NMI nesting depth is tracked in a separate per-CPU variable
+ * (nmi_nesting) to save bits in preempt_count.
+ *
  *         PREEMPT_MASK:	0x000000ff
  *         SOFTIRQ_MASK:	0x0000ff00
  * HARDIRQ_DISABLE_MASK:	0x00ff0000
- *         HARDIRQ_MASK:	0x07000000
- *             NMI_MASK:	0x38000000
+ *         HARDIRQ_MASK:	0x0f000000
+ *             NMI_MASK:	0x10000000
  * PREEMPT_NEED_RESCHED:	0x80000000
  */
 #define PREEMPT_BITS	8
 #define SOFTIRQ_BITS	8
 #define HARDIRQ_DISABLE_BITS	8
-#define HARDIRQ_BITS	3
-#define NMI_BITS	3
+#define HARDIRQ_BITS	4
+#define NMI_BITS	1
 
 #define PREEMPT_SHIFT	0
 #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 77198911b8dd4..af47ea23aba3b 100644
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
-- 
2.51.1

