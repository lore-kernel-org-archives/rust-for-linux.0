Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36B744DB69;
	Wed, 27 May 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903700; cv=none; b=fJRbTdiVTIWlPto5A0RZj2jlp4mhYAYPtVZqYREfjq2ARK8QBUQrFFd6lz6dm3OMejXZSCjpvs286m4i4M5wO9MMxYdm6vDd3s6Nbl+aPLMIjKse7zCaLCWazlaIyziRdeSPbDlB4dSB/HQd3h2ZVoO7iwfiA7lBzTZmIcfjBtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903700; c=relaxed/simple;
	bh=4jNvNrbzfTwzJjLwSjHboOQERe+1rglIxn+MEh/dkKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BdNUHD32OrDcrZn3h07uWuh7ff05lPUgGdz9ErtdIFZ2UFxYGfraqDOPURygDnKbs90DOrUtR2SgPBPgtyYogp8vGasMkAK5O9lokZlhplDevuBcFMsQJSEoxdpsd9LFUg36Y7QMu5WaREwCAhicBms0giG5VH9HeA7u1wLDwzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=n8TN5khM; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="n8TN5khM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779903690; x=1780162890;
	bh=KCC4Lc7DPH4rf7fGK9T09hSlzakl84CnCP2v22rvbnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=n8TN5khMwMKPivH12GzkakaQHd/6QhxDLUctQWkq+HMjW6dw4GE2Kb1NTaHgKI5rh
	 GKg7i5OQHPshk9jVBuvR+MP2Px2SZ634PiJcfLWzxVPCFL3tgaorYGZLNMnpwyhV7E
	 Cb+eKesAxhXnfWedG1Q40ypIdyBRbUFS9W2Yatio4VBD9yApAuNNYRKxtiiVYXxmzy
	 rFImw0wSOtL5pUwTwADo4uXzUo0DDLHKGpAHx2co3+IKL3rFgFdFRBpta90tqBMuhk
	 kCp3ZALOVJwCT/3zON809bt7Y39gknwi1TcYN08+wcayP/TiCyg/6VAF7u+s9wkuD1
	 JMZ0OrWnuKLFw==
X-Pm-Submission-Id: 4gQcP41xnxz1DDs2
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rcu@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org,
	jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v5 2/4] srcu: expose srcu_readers_active()
Date: Wed, 27 May 2026 20:40:43 +0300
Message-ID: <20260527174120.510447-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260527174120.510447-1-work@onurozkan.dev>
References: <20260527174120.510447-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move srcu_readers_active() from kernel/rcu/srcutree.c into
include/linux/srcu.h so it can be reused by Rust SRCU helpers.

Provide a CONFIG_TINY_SRCU implementation in the header as well
so the helper is available regardless of the selected SRCU backend.

This is needed by rust/helpers/srcu.c which now adds
rust_helper_srcu_readers_active() as a wrapper around the SRCU helper
for Rust callers.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 include/linux/srcu.h  | 29 +++++++++++++++++++++++++++++
 kernel/rcu/srcutiny.c |  2 +-
 kernel/rcu/srcutree.c | 25 -------------------------
 rust/helpers/srcu.c   |  5 +++++
 4 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index 81b1938512d5..5ca35efb4536 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -92,6 +92,35 @@ void call_srcu(struct srcu_struct *ssp, struct rcu_head *head,
 void cleanup_srcu_struct(struct srcu_struct *ssp);
 void synchronize_srcu(struct srcu_struct *ssp);
 
+/**
+ * srcu_readers_active - returns true if there are readers, and false otherwise
+ * @ssp: which srcu_struct to count active readers (holding srcu_read_lock).
+ *
+ * Note that this is not an atomic primitive, and can therefore suffer
+ * severe errors when invoked on an active srcu_struct. That said, it can be
+ * useful as an error check at cleanup time.
+ */
+static inline bool srcu_readers_active(struct srcu_struct *ssp)
+{
+#ifdef CONFIG_TINY_SRCU
+	return READ_ONCE(ssp->srcu_lock_nesting[0]) || READ_ONCE(ssp->srcu_lock_nesting[1]);
+#else
+	int cpu;
+	unsigned long sum = 0;
+
+	for_each_possible_cpu(cpu) {
+		struct srcu_data *sdp = per_cpu_ptr(ssp->sda, cpu);
+
+		sum += atomic_long_read(&sdp->srcu_ctrs[0].srcu_locks);
+		sum += atomic_long_read(&sdp->srcu_ctrs[1].srcu_locks);
+		sum -= atomic_long_read(&sdp->srcu_ctrs[0].srcu_unlocks);
+		sum -= atomic_long_read(&sdp->srcu_ctrs[1].srcu_unlocks);
+	}
+
+	return sum;
+#endif
+}
+
 #define SRCU_GET_STATE_COMPLETED 0x1
 
 /**
diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index a2e2d516e51b..5dc26af604bf 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -85,7 +85,7 @@ EXPORT_SYMBOL_GPL(init_srcu_struct);
  */
 void cleanup_srcu_struct(struct srcu_struct *ssp)
 {
-	WARN_ON(ssp->srcu_lock_nesting[0] || ssp->srcu_lock_nesting[1]);
+	WARN_ON(srcu_readers_active(ssp));
 	irq_work_sync(&ssp->srcu_irq_work);
 	flush_work(&ssp->srcu_work);
 	WARN_ON(ssp->srcu_gp_running);
diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 0d01cd8c4b4a..b1e97ba2e53f 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -598,31 +598,6 @@ static bool srcu_readers_active_idx_check(struct srcu_struct *ssp, int idx)
 	return srcu_readers_lock_idx(ssp, idx, did_gp, unlocks);
 }
 
-/**
- * srcu_readers_active - returns true if there are readers. and false
- *                       otherwise
- * @ssp: which srcu_struct to count active readers (holding srcu_read_lock).
- *
- * Note that this is not an atomic primitive, and can therefore suffer
- * severe errors when invoked on an active srcu_struct.  That said, it
- * can be useful as an error check at cleanup time.
- */
-static bool srcu_readers_active(struct srcu_struct *ssp)
-{
-	int cpu;
-	unsigned long sum = 0;
-
-	for_each_possible_cpu(cpu) {
-		struct srcu_data *sdp = per_cpu_ptr(ssp->sda, cpu);
-
-		sum += atomic_long_read(&sdp->srcu_ctrs[0].srcu_locks);
-		sum += atomic_long_read(&sdp->srcu_ctrs[1].srcu_locks);
-		sum -= atomic_long_read(&sdp->srcu_ctrs[0].srcu_unlocks);
-		sum -= atomic_long_read(&sdp->srcu_ctrs[1].srcu_unlocks);
-	}
-	return sum;
-}
-
 /*
  * We use an adaptive strategy for synchronize_srcu() and especially for
  * synchronize_srcu_expedited().  We spin for a fixed time period
diff --git a/rust/helpers/srcu.c b/rust/helpers/srcu.c
index 79dd24a104ef..fa4b5879dda5 100644
--- a/rust/helpers/srcu.c
+++ b/rust/helpers/srcu.c
@@ -13,6 +13,11 @@ __rust_helper int rust_helper_init_srcu_struct_with_key(struct srcu_struct *ssp,
 #endif /* CONFIG_DEBUG_LOCK_ALLOC */
 }
 
+__rust_helper bool rust_helper_srcu_readers_active(struct srcu_struct *ssp)
+{
+	return srcu_readers_active(ssp);
+}
+
 __rust_helper int rust_helper_srcu_read_lock(struct srcu_struct *ssp)
 {
 	return srcu_read_lock(ssp);
-- 
2.51.2

