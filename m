Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A8E161901
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726522249; cv=none; b=Su67Wwy472+eJvr58sGe7fYwhT0uNlmuGljZOQ5U83L18A0R8ut7Di/xsu4usofu0mfm9Jsf/IzlSdwWJtkLyYkxITRMPbA3fndjem1mQvmxVS4vANpfIFMQZn1MqDu6tg2M/L0yc8alLV9BmYPZ0CBp/ph9D7ApHN8pW4Ridc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726522249; c=relaxed/simple;
	bh=cvT8oPVXSFus+rxmyrqEkFmFSc/qpnaFm1iPgXd45AM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nWk/t4jxU7lAQd7ioMlmAbBNeTWASugAnpyYI4HnH3BQ8WG8WyYUtIjFdC+oaWjxOWU0woUM9S8qtXPU+8JKHOvLS7B5MP6j929A0y3O9DIr+B/5eOsXI8l45eAl8g+pKRAaLHIoRR6di3LN5bfxjlGJRQOE0Uu2EnjhHyBuS+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JR/rr/h1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JR/rr/h1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726522246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pU3t4JrwYufwpS5HuhWn0DSSSe4d7X0QkwM0UPBPhlQ=;
	b=JR/rr/h1sY1LACqu7J5boLJC44+pkbAxEHCbXKYxZoPwqCNC40Rsq0wTRIwxwS1gg+WtL/
	vxHMJafwo9x1lzy7QwaocCyec5aWPhXO7a/uQAYRADABYUwld2iMMA88/E5YqC2ObWyczd
	32F1Eb6oIOBGGqeCdfFxTQ3hQ/VtETk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-141-UMN2-4upPsy9x3QmFKNh0w-1; Mon,
 16 Sep 2024 17:30:45 -0400
X-MC-Unique: UMN2-4upPsy9x3QmFKNh0w-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1CD2F19560A3;
	Mon, 16 Sep 2024 21:30:42 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.33.131])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1980E19560AA;
	Mon, 16 Sep 2024 21:30:34 +0000 (UTC)
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
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v6 0/3] rust: Add irq abstraction, SpinLockIrq
Date: Mon, 16 Sep 2024 17:28:03 -0400
Message-ID: <20240916213025.477225-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

This adds a simple interface for disabling and enabling CPUs, along with
the ability to mark a function as expecting interrupts be disabled -
along with adding bindings for spin_lock_irqsave/spin_lock_irqrestore().

Current example usecase (very much WIP driver) in rvkms:

https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms-example-08012024

specifically drivers/gpu/drm/rvkms/crtc.rs

This series depends on
https://lore.kernel.org/rust-for-linux/ZuKNszXSw-LbgW1e@boqun-archlinux/

Lyude Paul (3):
  rust: Introduce irq module
  rust: sync: Introduce lock::Backend::Context
  rust: sync: Add SpinLockIrq

 rust/helpers/helpers.c            |   1 +
 rust/helpers/irq.c                |  22 +++++++
 rust/kernel/irq.rs                |  96 +++++++++++++++++++++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   2 +-
 rust/kernel/sync/lock.rs          |  17 ++++-
 rust/kernel/sync/lock/mutex.rs    |   1 +
 rust/kernel/sync/lock/spinlock.rs | 105 ++++++++++++++++++++++++++++++
 8 files changed, 242 insertions(+), 3 deletions(-)
 create mode 100644 rust/helpers/irq.c
 create mode 100644 rust/kernel/irq.rs


base-commit: a2f11547052001bd448ccec81dd1e68409078fbb
prerequisite-patch-id: 926565461e47df321ce1bed92894cc1f265896ef
-- 
2.46.0

