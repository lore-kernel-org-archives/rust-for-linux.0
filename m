Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C29768E1
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Oct 2024 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729293433; cv=none; b=A9PKJWxYdmqW9B8nd6/9A+8cjHG3Xobw5bXcjNJS9rVyqzdJ+y2sHswM/dEss0Nn6NTYoa3T9P/bzPmrAMS5s5ZuibrbRQMiz6/kqr7+c0guTtoGy6BmPbWb2PE6KE884519broUpbOHMjF9Tg/gT3jiarCXX32d772SVzVTj9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729293433; c=relaxed/simple;
	bh=EKFz18dTqTZQNFFtuezUAHUlyCwgEgoHQ8k/pFQxMCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MMKG7G9YShF+mqXSvCW6dTdh6T+5kvhZpGJKNFinPfcHeGbcDyXzvQe58Co1AWBVcaJ68sfs42QPhgCj9AMJnASNnDA4O9UCDn6/5Czj+K+Y4uXpEUW4Y9zzphUyf6HgKQRwQMd7iW4IP+POKyJtpLxyDFOBY44xvxdL6wiGfIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gRtZvI3o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gRtZvI3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729293429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CLMUyNHQiaCv4zwkoRVVWYMA0GThuwsF5UrHKm3NvKg=;
	b=gRtZvI3op21vYpqUo07EyYWNYgPF/ixxp7MUQlWa20Z3C7fYsGCZflKPqGO6CdQwHvXkZa
	k0/0ErO7LeqsDCotGhYZvlElMq+A/8bNMki2CqSkQ2s6JdbrFK030PXAtNmR2u+bdv/gQa
	LKmkL3j0BjqU8P2OZwDWYN2iy8/dWWM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-u6R2lIYdN3SdYMs2BvI5Kw-1; Fri,
 18 Oct 2024 19:17:06 -0400
X-MC-Unique: u6R2lIYdN3SdYMs2BvI5Kw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A4C3195608D;
	Fri, 18 Oct 2024 23:17:04 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.65.88])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A0C91956086;
	Fri, 18 Oct 2024 23:16:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@redhat.com>,
	airlied@redhat.com,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v7 0/3] rust: Add local_irq abstraction, SpinLockIrq
Date: Fri, 18 Oct 2024 19:13:49 -0400
Message-ID: <20241018231621.474601-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

This adds a token for annotating contexts where IRQs may be disabled on
non-PREEMPT_RT kernels, a way to use these tokens with Lock types, and
introduces bindings for spin_lock_irqsave() and
spin_unlock_irqrestore().

This patch series depends on the NotThreadSafe type from Alice:

https://lore.kernel.org/rust-for-linux/20240808-alice-file-v9-1-2cb7b934e0e1@google.com/

(Please re-review, since there's been some changes here!)

Lyude Paul (3):
  rust: Introduce local_irq module
  rust: sync: Introduce lock::Backend::Context and
    lock::BackendWithContext
  rust: sync: Add SpinLockIrq

 rust/helpers/helpers.c            |   1 +
 rust/helpers/irq.c                |   8 ++
 rust/helpers/spinlock.c           |  14 +++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/local_irq.rs          |  56 ++++++++++++
 rust/kernel/sync.rs               |   2 +-
 rust/kernel/sync/lock.rs          | 118 +++++++++++++++++++++++-
 rust/kernel/sync/lock/mutex.rs    |   1 +
 rust/kernel/sync/lock/spinlock.rs | 146 ++++++++++++++++++++++++++++++
 9 files changed, 341 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/irq.c
 create mode 100644 rust/kernel/local_irq.rs


base-commit: 6ce162a002657910104c7a07fb50017681bc476c
prerequisite-patch-id: 4e3cfb97c9dc94e99912e67f383497848ac6f81d
-- 
2.47.0

