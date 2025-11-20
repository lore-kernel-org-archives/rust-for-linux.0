Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A60371A1F
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675294; cv=none; b=e3qR3iHaZHj/V9pizJDqjg5D6Jc/95dvSkA7/fFtjP5ll1vUDBftwXT52xobM2CX9nFJDZC3CTkIxJ+IJyv2ZnmorRBL4Tm3TefKwXOog6LYWBn3Dc6TmIwIo2YtoEcUNfTq5mBE97C8/JlPHzscMJRMk21UPgIYnyXsVI1039E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675294; c=relaxed/simple;
	bh=uMkEtMnQ6zlmLZzDZUzo+KLVfWer7HpYfdsvLjiaTks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmdkoSOcKfqUpI03Rx7h9ZKaMGCjPL+7o5/XhcrjQiIsSoeXaTN3Bb2u0l0MJV8BaBiuV856HbkE8BFbtgVTRFQT5FB/VBoanAKdRNv/hscb/Q66KdxdMC2BYdwdoSoXU+VVLZTEIe5bAsYK6I8hmkopSCdGQLvyBg1hW6KJwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zc0VgY2T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zc0VgY2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763675292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xk75JXJ2JvKvXHUt45UhqSRNqEuyBdxoE1MFDorCiNU=;
	b=Zc0VgY2T+4qbfH0all7Sg8Vui+hKEeqChQDw4XAJmrJLC99eeeMturD4qcVu8bRPPsOiIg
	aBx2FuP7ZzBSI6jFMbv8nKjja417QudfzB20q7n0FYNyMPlkaBEXq1gDoyToV9XLHD7Bxk
	bl/KNkOQXtwvwG/Bo7LxFbDhK/4uSYs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-FlQKiXW0P-WW1uhWAp0EcA-1; Thu,
 20 Nov 2025 16:48:07 -0500
X-MC-Unique: FlQKiXW0P-WW1uhWAp0EcA-1
X-Mimecast-MFC-AGG-ID: FlQKiXW0P-WW1uhWAp0EcA_1763675285
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 665AA19560A7;
	Thu, 20 Nov 2025 21:48:05 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.52])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BEAA31940E88;
	Thu, 20 Nov 2025 21:48:00 +0000 (UTC)
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
Subject: [PATCH v14 13/16] rust: sync: Expose lock::Backend
Date: Thu, 20 Nov 2025 16:46:05 -0500
Message-ID: <20251120214616.14386-14-lyude@redhat.com>
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

Due to the addition of sync::lock::Backend::Context, lock guards can be
returned with a different Backend than their respective lock. Since we'll
be adding a trait bound for Backend to GlobalGuard in order to support
this, users will need to be able to directly refer to Backend so that they
can use it in trait bounds.

So, let's make this easier for users and expose Backend in sync.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index f293bbe13e855..795cbf3fc10f7 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -29,6 +29,7 @@
 pub use lock::spinlock::{
     new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq, SpinLockIrqGuard,
 };
+pub use lock::Backend;
 pub use locked_by::LockedBy;
 pub use refcount::Refcount;
 
-- 
2.51.1

