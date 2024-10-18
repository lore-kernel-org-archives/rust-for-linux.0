Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80FA190661
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Oct 2024 23:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729293804; cv=none; b=bK3OBdlpBpeAtIEYIRexjD9HEAmLQAaqdEv7yneU+vxKYoFl/Sg5ne7/68uCwVpZGk9+8Mtqz4cF2KlNiC5Ft18A1MY3oP4OhQ6w+VAvyxKI1pqQjUo6TrbatPt0u9gQ9gLerhU/t23H89lD7FkPAu7W3p/RcRx9rqCYWzHij9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729293804; c=relaxed/simple;
	bh=jkQ5oVMFESfYOiFvRn91EuQksYVygfld3FSvumY5Frw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jv0D2vB/3UzIZ7m7irhsMCSDuKtTXA0IZbInKJRK35ilQF7sgrtd3C6Yz1cmcHvDQL0DUTbw7bBGJ/b6g9wlRhr9Nhm1LFR0/KNjQ2e7U7tn7tPOffCPI9aaUlTqyrNfg+PmacLEGM7qRey5XdCJhGNlO6Lb8BrhyPzqGFI+ZQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCj2hhnj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCj2hhnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729293801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2B6acW4tTnIG6zQB3rXrmD1k8+xNnpYCn36VFU/vUO8=;
	b=WCj2hhnjmGFeTb5PmPrJ5CHc+BRvvp7lW5FeKRQELn8R2nVwy5CblQKgQBRaQF50cQph4h
	Vr83C9DPPpBSGSYvuyu4nQaybgaG37bV3rWbVb2TGhjPy2rUMre64SjIAYD2Gyg50/TO2m
	Z7cwuq2ZRmAYiGM8pS75yQJiD0nNqck=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-mzE70CnSNT6mlQi0BnTMaQ-1; Fri,
 18 Oct 2024 19:23:16 -0400
X-MC-Unique: mzE70CnSNT6mlQi0BnTMaQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 154811956080;
	Fri, 18 Oct 2024 23:23:14 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.65.88])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8E13319560A2;
	Fri, 18 Oct 2024 23:23:09 +0000 (UTC)
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
Subject: [PATCH v8 0/3] rust: Add local_irq abstraction, SpinLockIrq
Date: Fri, 18 Oct 2024 19:22:24 -0400
Message-ID: <20241018232306.476664-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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
 rust/kernel/local_irq.rs          |  56 +++++++++++
 rust/kernel/sync.rs               |   2 +-
 rust/kernel/sync/lock.rs          | 118 ++++++++++++++++++++++-
 rust/kernel/sync/lock/mutex.rs    |   1 +
 rust/kernel/sync/lock/spinlock.rs | 150 ++++++++++++++++++++++++++++++
 9 files changed, 345 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/irq.c
 create mode 100644 rust/kernel/local_irq.rs


base-commit: 6ce162a002657910104c7a07fb50017681bc476c
prerequisite-patch-id: 4e3cfb97c9dc94e99912e67f383497848ac6f81d
-- 
2.47.0

