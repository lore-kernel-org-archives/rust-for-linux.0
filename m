Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395FF32549A
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 20:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770324444; cv=none; b=oxiotCL6q3SVjp27NqBDyB6GWxmGai2aUjFcePO2/fy802vDYJpfQwVcGUUX+WWfws/hclJqKSXSoQT3n5KdG3N9STz9zyRZ5V+Ot2HAfARw1fjrlHi982usbLdZ3hV/+wsjqIa6TQmyaeW6Bh7hzKRiLopTmVU+Kk1p4hw5kA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770324444; c=relaxed/simple;
	bh=Ma0T30di0RA7ur4n05oEk18sOGf6UZh7NzQHEdI9TYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ABLeIxH8q6JgbZXDwI5SxmRehnIrQB9TMoqmCfhnc3ay+AaGRBnlf583i6nJ18poEfgg/GMHmjdyt4gwk9l2ICUNBQBcWYvdu5Kb4y0TMJfJ2GzeqJuNsxE9sDlEoK1U4IU4FiOGG9W+fJr+g1MAhs3vFjkx7/1bwyqAj8tIoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFip8JIJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFip8JIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770324443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eTBHCHOjQvnz3/U27BfpDFLcEjs+UPKBR+ZNiBo6LKg=;
	b=aFip8JIJ6UNxlVb0s2V/XmSbXEWSqD9F26fCuMUxJLJ2ZyMMHEPZ7hGF9Ft8+l5MJgZmWK
	Hk7HjtQZLCEDQjKqF3OuwVaxsiInHDziHCi4Q1UNwoFyRs0gHtumnXxaV9JkHzjzFu8KW6
	upnXJoESuldHo3lDSDm8LjMMiXBlsdU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553--27iCD0hOlaIl_IvQKDQpg-1; Thu,
 05 Feb 2026 15:47:17 -0500
X-MC-Unique: -27iCD0hOlaIl_IvQKDQpg-1
X-Mimecast-MFC-AGG-ID: -27iCD0hOlaIl_IvQKDQpg_1770324435
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0A2341956094;
	Thu,  5 Feb 2026 20:47:15 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.82.65])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1B21219560A7;
	Thu,  5 Feb 2026 20:47:10 +0000 (UTC)
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
Subject: [PATCH v18 0/5] SpinLockIrq for rust
Date: Thu,  5 Feb 2026 15:44:26 -0500
Message-ID: <20260205204709.528234-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: GwVy1OeVID868vAv3dsjm71K6oA137qY4p3jsjYRTuY_1770324435
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the latest patch series for adding rust bindings for controlling
local processor interrupts, adding support for spinlocks in rust that
are acquired with local processor interrupts disabled, and implementing
local interrupt controls through refcounting in the kernel.

The previous version of this patch series can be found here:

  https://lore.kernel.org/all/20260121223933.1568682-1-lyude@redhat.com/

This patch series applies on top of boqun's rust-sync branch:

  https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/?h=rust-sync

Now that we've gotten the C-side of these changes in, this patch series
is now exclusively concerned with the rust side of these changes. For
more information on how we came to the design for the C side of the API,
see the explanation in the previous version of the patch series.

Boqun Feng (1):
  rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers

Lyude Paul (4):
  rust: Introduce interrupt module
  rust: sync: use super::* in spinlock.rs
  rust: sync: Add SpinLockIrq
  rust: sync: Introduce SpinLockIrq::lock_with() and friends

			    FULL CHANGELOG:

Series-wide:
  V15:
    * Added a patch for fixing build erors introduced on OpenRISC
  V17:
    * Squash:
      - "rust: sync: Introduce lock::Backend::Context"
      - "rust: sync: lock: Add `Backend::BackendInContext`"
      With BackendWithContext being a separate trait, it no longer makes
      sense for these patches to be separate.
  V18:
    * Add "rust: sync: use super::* in spinlock.rs"

Patch-specific:
  * rust: Introduce interrupt module
    V10:
      * Fix documentation typos
    V11:
      * Get rid of unneeded `use bindings;`
      * Move ASSUME_DISABLED into assume_disabled()
      * Confirm using lockdep_assert_irqs_disabled() that local interrupts are
        in fact disabled when LocalInterruptDisabled::assume_disabled() is called.
  * rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
    V18:
      * Add missing __rust_helper annotations
  * rust: sync: Add SpinLockIrq
    V10:
      * Also add support to GlobalLock
      * Documentation fixes from Dirk
    V11:
      * Add unit test requested by Daniel Almeida
    V14:
      * Improve rustdoc for SpinLockIrqBackend
    V18:
      * Add missing __rust_helper annotations
  * rust: sync: Introduce SpinLockIrq::lock_with() and friends
    V10:
      * Fix typos - Dirk
    V17:
      * Introduce `BackendWithContext`, move context-related bits into there and
        out of `Backend`.
      * Add missing #[must_use = …] for try_lock_with()
      * Remove all unsafe code from lock_with() and try_lock_with():
        Somehow I never noticed that literally none of the unsafe code in these
        two functions is needed with as_lock_in_context()...
    V18:
      * Drop the traits, just implement this on SpinLockIrq
  * rust: sync: Expose lock::Backend
    V10:
      * Fix typos - Dirk/Lyude
      * Since we're adding support for context locks to GlobalLock as well, let's
        also make sure to cover try_lock while we're at it and add try_lock_with
      * Add a private function as_lock_in_context() for handling casting from a
        Lock<T, B> to Lock<T, B::BackendInContext> so we don't have to duplicate
        safety comments
    V11:
      * Fix clippy::ref_as_ptr error in Lock::as_lock_in_context()
    V14:
      * Add benchmark results, rewrite commit message
  * rust: sync: lock/global: Rename B to G in trait bounds
  * rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
  * rust: sync: lock/global: Add Backend parameter to GlobalGuard
    V17:
      * Add default parameter for generic `B` to `GlobalGuard`
  * rust: sync: lock/global: Add ContextualBackend support to GlobalLock
  * locking: Switch to _irq_{disable,enable}() variants in cleanup guards
    V10:
      * Add PREEMPT_RT build fix from Guangbo Cui

 rust/helpers/helpers.c            |   1 +
 rust/helpers/interrupt.c          |  18 ++
 rust/helpers/spinlock.c           |  15 ++
 rust/helpers/sync.c               |   5 +
 rust/kernel/interrupt.rs          |  86 ++++++++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/sync.rs               |   4 +-
 rust/kernel/sync/lock/global.rs   |   3 +
 rust/kernel/sync/lock/spinlock.rs | 313 +++++++++++++++++++++++++++++-
 9 files changed, 440 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs



base-commit: de718b2ca866e10e2a26c259ab0493a5af411879
-- 
2.53.0

