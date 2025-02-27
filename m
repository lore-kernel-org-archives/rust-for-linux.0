Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A32A225775
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Feb 2025 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740694815; cv=none; b=q9U9gY7bc0JCygWxt51SrKMv0Oixj1PSEJMipnezPF2gm9wCGcSiTYcfZH8jzyVWB5YJAdSfEv8HPlixNXXoWDZK+GthzsuRJ6FS/fUrQGh+XhuybE52O+d4Z0b5tAnI796kPf8krk6vQaTQHzHscxsvww0QE/lWYIISCUKGZp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740694815; c=relaxed/simple;
	bh=7H663JeKa5r78qQVaU7rzYmxhSF5vyn48cAo7qmNdP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=iRbY64wJVPJ0A7c46vPNC4TEpIswPvLY7CaXcjG71EFcvhGwlEwgIShzelmC2oKtNwQ3aJk6eqCNFyPYu/kvkOwCZeeXmLzxElKOJgX7LbGxWLI6MIZWUgAbuNxeYc0Du/MtDtiq4DwlM+1wNWifzaXFpJXxe+D66PUmQ76GmJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BRvnI/fd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BRvnI/fd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740694812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AlFt6zLWOlPPsttjaMZ3J3hTR4vkNSzZ0cM6HPMcuJk=;
	b=BRvnI/fdhVQPXE8HpC54YnhBsKDwc1X4Cgt7U4bQ2AMlwT5736HtfXwQwV3WQ/cmoFV4Ms
	jMoZ4TYfDbcRdTC5lV+R5b616U1JNx6ZRE7awYCR6DQidcMoo1a2mLgksdbOEHfC9tWCS6
	rPEZUeaEzGH6VLkH/GNcvBuYQz/9HTc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-ZAe31hN2NXWNYXCkS5se8g-1; Thu,
 27 Feb 2025 17:20:09 -0500
X-MC-Unique: ZAe31hN2NXWNYXCkS5se8g-1
X-Mimecast-MFC-AGG-ID: ZAe31hN2NXWNYXCkS5se8g_1740694807
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D76F18011CE;
	Thu, 27 Feb 2025 22:19:58 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.89.128])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 866F61944D02;
	Thu, 27 Feb 2025 22:19:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v9 0/9] Refcounted interrupts, SpinLockIrq for rust
Date: Thu, 27 Feb 2025 17:10:11 -0500
Message-ID: <20250227221924.265259-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B30DEgR0BwA8IZZiK35KXQFRQTol8gEdxweW2yCp8JI_1740694807
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Before going into this series, take note that there are still
unresolved performance issues with the ref-counted *spin_lock_irq_*
functions that are unresolved - we could definitely use some assistance
with this. Details here:

https://lore.kernel.org/rust-for-linux/ZxrCrlg1XvaTtJ1I@boqun-archlinux/

It's been a while! This is the latest version of the SpinLockIrq patch
series we've been working on - now with some new refcounted interrupt
disable functions that Boqun came up with. The main changes:

* Add a SpinLockIrqGuard type alias
* Get rid of the closure interface that we were using, SpinLockIrqGuards
  are now refcounted
* Renames
* Rewrite documentation/examples to match
* Addition of local_interrupts_disable() on the rust side

On the C side of things, this patch series introduces the refcounted
spin_lock_irq_disable() and spin_unlock_irq_enable() functions - along
with the rest of the related refcounted variants for this.

The previous version of this patch series is available at:

https://lkml.org/lkml/2024/10/18/1692

The local_interrupts_disable() was suggested by Boqun, though given
tglx's comments I have mixed feelings on having this in our bindings at
all - so I'm not totally opposed to us dropping this if it's decided we
don't want it. I also was careful to make sure that the documentation
generally discourages its use, and also link back to some of the LWN
documentation regarding interrupts that was linked in the discussion
threads previously. At the moment it's at least useful for verifying the
examples we have at least :)

Boqun Feng (6):
  preempt: Introduce HARDIRQ_DISABLE_BITS
  preempt: Introduce __preempt_count_{sub, add}_return()
  irq & spin_lock: Add counted interrupt disabling/enabling
  rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
  rust: sync: lock: Add `Backend::BackendInContext`
  locking: Switch to _irq_{disable,enable}() variants in cleanup guards

Lyude Paul (3):
  rust: Introduce interrupt module
  rust: sync: Add SpinLockIrq
  rust: sync: Introduce lock::Backend::Context

 arch/arm64/include/asm/preempt.h  |  18 +++
 arch/s390/include/asm/preempt.h   |  19 +++
 arch/x86/include/asm/preempt.h    |  10 ++
 include/asm-generic/preempt.h     |  14 +++
 include/linux/irqflags.h          |   1 -
 include/linux/irqflags_types.h    |   6 +
 include/linux/preempt.h           |  20 +++-
 include/linux/spinlock.h          |  88 +++++++++++---
 include/linux/spinlock_api_smp.h  |  27 +++++
 include/linux/spinlock_api_up.h   |   8 ++
 include/linux/spinlock_rt.h       |  10 ++
 kernel/locking/spinlock.c         |  16 +++
 kernel/softirq.c                  |   3 +
 rust/helpers/helpers.c            |   1 +
 rust/helpers/interrupt.c          |  18 +++
 rust/helpers/spinlock.c           |  15 +++
 rust/kernel/interrupt.rs          |  83 ++++++++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   4 +-
 rust/kernel/sync/lock.rs          |  34 +++++-
 rust/kernel/sync/lock/mutex.rs    |   2 +
 rust/kernel/sync/lock/spinlock.rs | 185 ++++++++++++++++++++++++++++++
 22 files changed, 561 insertions(+), 22 deletions(-)
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1

