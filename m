Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E422DF14A
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700118; cv=none; b=h4xpSgscOJu/sO4qdu5hIq0ptqefjOXJTVnb0w0iR+HjV+cpYfG9xkQjbxisH6L9iww79dN1UmEbbP5AS0KQQgeuWBFVOXojw1pLQkF5RqcYA+oeu6Dz7326sJORst5uHFdp4HTLeUhoV8nATAyhzt+qfNcdWd9JxLpUkeFFqcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700118; c=relaxed/simple;
	bh=2W4clTK2M34eskJ0i4cUqdPwuUWHM0hpuVGJ5OjSCdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJuBU0b61QUeKaXolDxZy6noRUgy4Bv23teVvJG3ADcypdrf3KvMzKNAXO7GmitrvQZWAw3CpQo50tcYmvpfshAUp/E9oIoScOizZ/fkB43dnofT0Nnvzi+HjFcj0k/RrjA/2r5IeDA2KHRBrSMxlxogleNEtYu+E7j7g7O3F9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RxNkJDQT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RxNkJDQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764700116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JIAjWCkKsIEZSb5fVKVynfXsWMHwW8pCG5bQYm4J3DU=;
	b=RxNkJDQT4zEFZ0LKC6XYweuF+Z5x7sfDfSud5tUcOGNzdQnc9+Xd1Rgfvh4s7ntc/hzXWj
	YE8IT2a9XKgULf6CpmG31UKraDEc2yiKVJa8z3hG/AIEM3/qWGmjFs0AGQlwMN6aiLD4Gm
	ehNAGUf4rg/euWxXIGSzVQe9t5mN7RA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-507-lrG3O0hpPUKbzhdA4O-D6w-1; Tue,
 02 Dec 2025 13:28:33 -0500
X-MC-Unique: lrG3O0hpPUKbzhdA4O-D6w-1
X-Mimecast-MFC-AGG-ID: lrG3O0hpPUKbzhdA4O-D6w_1764700110
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7686619560A7;
	Tue,  2 Dec 2025 18:28:30 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.80.109])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D9F2019560A7;
	Tue,  2 Dec 2025 18:28:25 +0000 (UTC)
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
	Waiman Long <longman@redhat.com>
Subject: [PATCH v15 16/16] locking: Switch to _irq_{disable,enable}() variants in cleanup guards
Date: Tue,  2 Dec 2025 13:24:24 -0500
Message-ID: <20251202182720.125884-17-lyude@redhat.com>
In-Reply-To: <20251202182720.125884-1-lyude@redhat.com>
References: <20251202182720.125884-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Boqun Feng <boqun.feng@gmail.com>

The semantics of various irq disabling guards match what
*_irq_{disable,enable}() provide, i.e. the interrupt disabling is
properly nested, therefore it's OK to switch to use
*_irq_{disable,enable}() primitives.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

---
V10:
* Add PREEMPT_RT build fix from Guangbo Cui

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 include/linux/spinlock.h | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index bbbee61c6f5df..72bb6ae5319c7 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -568,10 +568,10 @@ DEFINE_LOCK_GUARD_1(raw_spinlock_nested, raw_spinlock_t,
 		    raw_spin_unlock(_T->lock))
 
 DEFINE_LOCK_GUARD_1(raw_spinlock_irq, raw_spinlock_t,
-		    raw_spin_lock_irq(_T->lock),
-		    raw_spin_unlock_irq(_T->lock))
+		    raw_spin_lock_irq_disable(_T->lock),
+		    raw_spin_unlock_irq_enable(_T->lock))
 
-DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq(_T->lock))
+DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irq, _try, raw_spin_trylock_irq_disable(_T->lock))
 
 DEFINE_LOCK_GUARD_1(raw_spinlock_bh, raw_spinlock_t,
 		    raw_spin_lock_bh(_T->lock),
@@ -580,12 +580,11 @@ DEFINE_LOCK_GUARD_1(raw_spinlock_bh, raw_spinlock_t,
 DEFINE_LOCK_GUARD_1_COND(raw_spinlock_bh, _try, raw_spin_trylock_bh(_T->lock))
 
 DEFINE_LOCK_GUARD_1(raw_spinlock_irqsave, raw_spinlock_t,
-		    raw_spin_lock_irqsave(_T->lock, _T->flags),
-		    raw_spin_unlock_irqrestore(_T->lock, _T->flags),
-		    unsigned long flags)
+		    raw_spin_lock_irq_disable(_T->lock),
+		    raw_spin_unlock_irq_enable(_T->lock))
 
 DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
-			 raw_spin_trylock_irqsave(_T->lock, _T->flags))
+			 raw_spin_trylock_irq_disable(_T->lock))
 
 DEFINE_LOCK_GUARD_1(spinlock, spinlock_t,
 		    spin_lock(_T->lock),
@@ -594,11 +593,11 @@ DEFINE_LOCK_GUARD_1(spinlock, spinlock_t,
 DEFINE_LOCK_GUARD_1_COND(spinlock, _try, spin_trylock(_T->lock))
 
 DEFINE_LOCK_GUARD_1(spinlock_irq, spinlock_t,
-		    spin_lock_irq(_T->lock),
-		    spin_unlock_irq(_T->lock))
+		    spin_lock_irq_disable(_T->lock),
+		    spin_unlock_irq_enable(_T->lock))
 
 DEFINE_LOCK_GUARD_1_COND(spinlock_irq, _try,
-			 spin_trylock_irq(_T->lock))
+			 spin_trylock_irq_disable(_T->lock))
 
 DEFINE_LOCK_GUARD_1(spinlock_bh, spinlock_t,
 		    spin_lock_bh(_T->lock),
@@ -608,12 +607,11 @@ DEFINE_LOCK_GUARD_1_COND(spinlock_bh, _try,
 			 spin_trylock_bh(_T->lock))
 
 DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
-		    spin_lock_irqsave(_T->lock, _T->flags),
-		    spin_unlock_irqrestore(_T->lock, _T->flags),
-		    unsigned long flags)
+		    spin_lock_irq_disable(_T->lock),
+		    spin_unlock_irq_enable(_T->lock))
 
 DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _try,
-			 spin_trylock_irqsave(_T->lock, _T->flags))
+			 spin_trylock_irq_disable(_T->lock))
 
 DEFINE_LOCK_GUARD_1(read_lock, rwlock_t,
 		    read_lock(_T->lock),
-- 
2.52.0

