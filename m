Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D807413D531
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721946525; cv=none; b=RLw08sG/pYE5kEkyWBvxauRXzLzvM3of46veGqbU9bUS5k4kxfI/T/71JdlWdRUXLHHTM3br6DQ9CAsDWhoa7oqlocp3engz9iWBPLEn5FpywtF/hf3NOSzFCzFRIWeBz9Z9IznAixryT6usFzFa19TinaxFz/Za6zrUM3tkT6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721946525; c=relaxed/simple;
	bh=xdUVqp45h/RDYCfdUlCpzH/yT0P0TOE6YgUxU4uaRss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JTi/YDpEGYPU0cY6dpEklAa8q2idHPuKj9jP95ZRxdd9kCcPvSYjQgSbC+KogmBuS7EEcPYFvDuGvY0D1/GZWtpCKM1h3/DO7QPl4T62EKEMei2daUWHEKZGLB3VWltedTkbdOGc82rqfveaU6T7CCyq7j8AvTW4k5p0tvvwnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RF9kV8pe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RF9kV8pe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721946523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hdKsXNMA2o0K9hnniQ8PqiKtKZuKw1Oh2DZlGcvD6kg=;
	b=RF9kV8peCjq96jX8Nzm3RTa1RNIad2DbZlQjl1L9s9y3PowLN2f2PtftuAT1so+ROttWBZ
	9CFtnSiPF+14JSZi9oGMfS2DI0lF3APDSXHCdH4BuCt2lGuFCTVJUNJ2Y8tWQ3TX8OoYTT
	XKRWph1qfplXk4vuIsx8rOkQuimAgRM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-2cuRMt-VNRGuygArlYEDDg-1; Thu,
 25 Jul 2024 18:28:38 -0400
X-MC-Unique: 2cuRMt-VNRGuygArlYEDDg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E2E81955D45;
	Thu, 25 Jul 2024 22:28:36 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.33.21])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C83443000197;
	Thu, 25 Jul 2024 22:28:31 +0000 (UTC)
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
Subject: [PATCH 0/3] rust: Add irq abstraction, IrqSpinLock
Date: Thu, 25 Jul 2024 18:27:49 -0400
Message-ID: <20240725222822.1784931-1-lyude@redhat.com>
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

Lyude Paul (3):
  rust: Introduce irq module
  rust: sync: Introduce LockContainer trait
  rust: sync: Add IrqSpinLock

 rust/helpers.c                    |  14 +++++
 rust/kernel/irq.rs                |  74 ++++++++++++++++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   3 +-
 rust/kernel/sync/lock.rs          |  20 ++++++
 rust/kernel/sync/lock/spinlock.rs | 101 ++++++++++++++++++++++++++++++
 rust/kernel/sync/locked_by.rs     |  11 +++-
 7 files changed, 221 insertions(+), 3 deletions(-)
 create mode 100644 rust/kernel/irq.rs

-- 
2.45.2

