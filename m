Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43EF16D4DE
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 22:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722465644; cv=none; b=WWEOVmboxlS1wNoMMd2iaa0G5JxbV/8vootf34ILSMzyMsRsREThmWkRmYIcY/gNH1YZ0LKW4uGzSkXXitJx6+Ov/jvBa8t9BjKcp869Xl3dV/ijUzMhnyv76FXT/XPIjzpoE1BO9POerF0pRybPwGsQoJBDBDr7j1XKEJCtCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722465644; c=relaxed/simple;
	bh=AjhSFidBPRZq1Srw9h68NIR9oigsS/ykp0wCVDeUi8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M8LYeChNqbd/1Z1CiWTUUmeU6ibsAbjBSEwj6n1LrTEnBtSEl5g31lUmHQIXZ+0/ulN1PZKXGVZ5UF0EPUbInxWmmJ2ZgVvZ1uTUjqwa8rBnDHIb17YHfO5rUQKf1tq5t/64mP2O6a6h1gIhSrh2mGcSkvIA+GI5Hw1sF+cLw6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eI2W6odo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eI2W6odo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722465641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=feV3unDPWffzca1QgmoxOQtP/5IiMxNzOuHte1VHh6c=;
	b=eI2W6odozhyHa9bkcInosUdCzE8cErEKJ6Vhl4mWxbSZhT9WQayR6vRwSI9ApvXLX/oNBR
	/buZpizNxwo7jdxRbvCnRAgCkZCqT1HDor6Y9Qi6Oy5x37UHjDfG+cAItzwAFpHcVFJ6gi
	8mIHh5kvWBqx5+jFSGGBdbq7h0F2w8g=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-9ltlB9XHPMGy27AhbSyuXg-1; Wed,
 31 Jul 2024 18:40:36 -0400
X-MC-Unique: 9ltlB9XHPMGy27AhbSyuXg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7157A1955D47;
	Wed, 31 Jul 2024 22:40:34 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.16.173])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44009300018D;
	Wed, 31 Jul 2024 22:40:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@redhat.com>,
	airlied@redhat.com,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v2 0/3] rust: Add irq abstraction, SpinLockIrq
Date: Wed, 31 Jul 2024 18:35:38 -0400
Message-ID: <20240731224027.232642-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This adds a simple interface for disabling and enabling CPUs, along with
the ability to mark a function as expecting interrupts be disabled -
along with adding bindings for spin_lock_irqsave/spin_lock_irqrestore().

Current example usecase (very much WIP driver) in rvkms:

https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms-example-07312024

specifically drivers/gpu/drm/rvkms/crtc.rs

(The kunit tests also compile)

Lyude Paul (3):
  rust: Introduce irq module
  rust: sync: Introduce lock::Backend::Context
  rust: sync: Add SpinLockIrq

 rust/helpers.c                    |  22 +++++++
 rust/kernel/irq.rs                |  87 ++++++++++++++++++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   2 +-
 rust/kernel/sync/lock.rs          |  17 ++++-
 rust/kernel/sync/lock/mutex.rs    |   3 +
 rust/kernel/sync/lock/spinlock.rs | 106 ++++++++++++++++++++++++++++++
 7 files changed, 235 insertions(+), 3 deletions(-)
 create mode 100644 rust/kernel/irq.rs

-- 
2.45.2

