Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2021BFDE1
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726167960; cv=none; b=YGoO4RhkX7gCBhXieV7Q0O2jm3slE4XGPX0kzvaxmaO8YVdGoSAsPB6UoLxIHbr6GC725fVHj5rhcFO6iRaWQiAHRIy/qHQCvraWAuMm0OrG31AWg7mEtAjjHbhjWQ6uwhJyqMrPEh19bilQMo9iUjJHKDtMEP5uf6k+zmS4Rmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726167960; c=relaxed/simple;
	bh=VfaMiIS5RxZ9UB/21o7R1PvT3d0SygcNS3bRhwEr9pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aC3g4LaYxbX8HOF3Pd1O5/4bxatt/omOWPReqjZjYlBaRTUBo3velKQ6oKBCfOQyKHfSajYSJLHr3liHS5PIomhruD3e1s1cHl0gLRRwA/ShoMcUxyMWEcnJ9v10PZvVcpeJvLp9CWo2PcJK0v9ZK/6Sp8NZpsqCnTmWRnhge10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YojC6ciZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YojC6ciZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726167956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EwVLaLubjdnZCJqXiNxARcoN6AAuDs5JpsmiUe8KUMU=;
	b=YojC6ciZ0adqE5333oEoemji5ZCUEuwCcSu1aeWbYj2EQtvCpB82YR8hAlWMk1x9OL5Sn1
	+2Yn3M5/pQqTRY95h3gaYmPJwrqQSkJ66RXMg2xmHZ1kGgeC9vmOmf9Oq3JUcn40ibw2wC
	6tk5eKSl6S5WNVuBpfmqV2ZUcLnwULA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-NfRcNIMaPBihghQMenYo8A-1; Thu,
 12 Sep 2024 15:05:53 -0400
X-MC-Unique: NfRcNIMaPBihghQMenYo8A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A53A19560A7;
	Thu, 12 Sep 2024 19:05:49 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.9.159])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9B58219560B5;
	Thu, 12 Sep 2024 19:05:43 +0000 (UTC)
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
Subject: [PATCH v5 0/3] rust: Add irq abstraction, SpinLockIrq
Date: Thu, 12 Sep 2024 15:04:15 -0400
Message-ID: <20240912190540.53221-1-lyude@redhat.com>
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

Lyude Paul (3):
  rust: Introduce irq module
  rust: sync: Introduce lock::Backend::Context
  rust: sync: Add SpinLockIrq

 rust/helpers/helpers.c            |   1 +
 rust/helpers/irq.c                |  22 +++++++
 rust/kernel/irq.rs                |  90 +++++++++++++++++++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   2 +-
 rust/kernel/sync/lock.rs          |  17 ++++-
 rust/kernel/sync/lock/mutex.rs    |   1 +
 rust/kernel/sync/lock/spinlock.rs | 105 ++++++++++++++++++++++++++++++
 8 files changed, 236 insertions(+), 3 deletions(-)
 create mode 100644 rust/helpers/irq.c
 create mode 100644 rust/kernel/irq.rs


base-commit: 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2
-- 
2.46.0

