Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0264E36B07E
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529842; cv=none; b=P+VeDjIR/0wkFQNIMg6Ct96Dld7li+R/x2KA4M6M4o8h3enc3QUT8stouTAdXwOpQeQI/iWERPop9+vO0SMcSw++OHX9Ne0M0EypyL02zH2N0HJPcJWI5X7CNxxhPgExiPwdBkoGUx8Sqm0wqcJroEtNkrZMstSx5VcPSxdjIck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529842; c=relaxed/simple;
	bh=4BkVH0/j/Gwh34+8M3f7Tf2d6QCZi99x/X2fObTdrXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HGNf7ulc9Mhn3Um1L0rAbbysE7LUlHaY803wP3L56ifcULEjphXDQrX1DWuaSUDahyw474fCATpufv0Oy2kYcCBtHzbGM3EO0prT3cNBeQ5+wD6eslhlvS0PXhM3yXP7JM3GJ097YRQS0mD6COcTGfAABb6K0lXHMu6oMwR1/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmE5Y5nb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmE5Y5nb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C09C1F00ACF;
	Fri, 31 Jul 2026 20:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529840;
	bh=fQ4AaC8H0CX0x0IrCa68P6L0DHE1akOk2IAMbYKQ2xI=;
	h=From:To:Cc:Subject:Date;
	b=WmE5Y5nbjMS4lZ+NQnVUkN4qJMqHRdNBCokV1Gh48zoNFACdD1Tv186SsL8eyK7Mb
	 O75uiEwEk0Knd8BDnzDDk5z9HvAU6iv9XChQoD7JTKHMpFF0d6bqC9p74WYz9TEwkN
	 TRCvi+hEmUK/qCeFbeulRPfq3VaNgTr2VsytDfmBO1INwNV3PvST/uPpETchmVoBn3
	 G7cVc22o3paS3IPICkPnBolSnGQL7gnlYjPNbFknsXmQDCgwaa313mcG3GzFtoMbC1
	 IHQ0YwAZlTQl+zUasJAQTbvQ3MA8HoRAv2w+2Vo1tWC/rW+BbRy4Sk+W8UziselNP/
	 uMDICUZGs/Ilg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5174AF40077;
	Fri, 31 Jul 2026 16:30:39 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 31 Jul 2026 16:30:39 -0400
X-ME-Sender: <xms:7wVtaqgBAgxBpg_ywiOymi5irlRB-WAcsNaJj9Z791bR-xuP_JsW2w>
    <xme:7wVtagPst1GiIVziMgXPH2zbUR8k0Ce3mdHbF8-MBJp6ySmNiMAC9BSi1W5hXG0SP
    yBC6DBsKObGREyWHNq6-RJXc2qdiiJEpyFsHM1Ogjr5Nj97PLhZFw>
X-ME-Received: <xmr:7wVtale3iFW74MTca0H5aYq617WfKntbcrMdXtBkn6jO4KkYnMXbCJe7SneTVCntiSnRD2NmwNsGkYbuDBFpjd4eW10pHI_o>
X-ME-Proxy-Cause: dmFkZTEd4/pmsDuZlwvEyfWP1meg6cHnYCF2dXuUGa6l8w8IY0R74pPF6Ji56vm7lwMe4e
    wc755Qkaf/+LUMByk+RmBGNqoNJy820EjsB/M03QpZO9FyNJMZweSomkoCieWs4nqP+2IU
    kOu8y1079cg+uga0ZazhoCnF+S5ezHTwnwZG2L7YP6iA3k+Rou9onwUeMZ4heXpUoyhmgu
    qjvRZWRZE3pMEjRplJfD72B+py/OGAmQPpXsuav8wVU+8D0AkT2G+/dPMoePYojg19VOJb
    58VUcUkiVZrVY97rDl1jKSehuh7PfWsovWTFd2OgW+me6gGLKTgxolf5geP/sYQo1I0eMg
    VdYAIwopldjeWgA5wQUW+ZpHFJf6oT24HfAPEXt1XHdRca5I0PXdDgNBMBNYVefwUtIivy
    N3WymnetCcu8G4exL1jPUJOmRLbZyeO7Vpuk5iqUUM1g4IhMgNVNaaPDM1WojKajN4aKT8
    MXeLEOQ8BX0UZBdJPCfnNr87neoNZA2HjRwuEptWH+r8HtxkfguJ2gLVbTR8epHd0u0ki2
    0Obxzok6969HZzurmj/U7bPj6FErfPpvQXALqBZosr0pw2m8tq1ZdmClL4zAGB6Vjptt9K
    NMXOy9UXcOwOw1CcepyFtg1ZCRSrIG4iwDP6GEfyW0RZaAoThUnQNpSOBI3g
X-ME-Proxy: <xmx:7wVtaix5QFR0TFYL4PI_oy-RZU0NHhxNB_MvekR_z_RtQSxYBszOlA>
    <xmx:7wVtai2zXItB06FMh9pJJXrolFIGtsHu9PLZKLUn8VnfQdzrVrFwrA>
    <xmx:7wVtahc4zxMF7lZkAWLRXUisnXXPFJaeq7XC0O2e6uLHOfDWuyPI5g>
    <xmx:7wVtavUcj4XgRYAYfXbLmDhEfj7jfbUC2j5lavHrb7hWMLJdLbd3iQ>
    <xmx:7wVtah-HBCE3fw_2DvGddtLEtT6IlAPHSaYIlbkxdIPWpoVhye8X0oqw>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:30:38 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [GIT PULL] [PATCH 00/24] Rust synchronization changes for v7.3
Date: Fri, 31 Jul 2026 13:30:01 -0700
Message-ID: <20260731203031.13679-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Peter,

Please pull this Rust synchronization changes for v7.3 into tip.

The major changes are the introduction of preempt_count backed interrupt
disabling level tracking, i.e. the local_interrupt_{enable, disable}(),
along with the user (the Rust SpinLockIrq). This should unblock a few
drivers in Rust. For other changes, please refer the following change
log.

The following changes since commit 5e601ab3615c86be7c4068ce992f94654693a032:

  futex: Optimise the size check get_futex_key() (2026-07-29 13:17:52 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sync.20260731a

for you to fetch changes up to 93ff5657a5f1d0d8577b58e66bc116a1e0f38a87:

  rust: revocable: Use LKMM atomics instead of Rust atomics (2026-07-30 13:38:53 -0700)

----------------------------------------------------------------
Rust synchronization changes for v7.3:

* Safe SpinLockIrq
  - Introduce refcounted interrupt disabling and corresponding spinlock
    primitives, which tracks the interrupt disabling "level" in
    preempt_count, as a result, this set of primitives can automatically
    restore the interrupt disabling status when the outermost critical
    section exits.

  - Based on the above, a SpinLockIrq is introduced on the Rust side,
    the guard of which will automatically restore the interrupt
    disabling status when dropped. This avoid playing unsafe games when
    using irq disabled spinlocks.

* Add synchronize_rcu() safe abstraction.

* Generic memory barrier: this extends our Rust barrier primitives to
  include more barriers for DMA as well.

* Replace the atomic usage in Revocable with LKMM atomics.
-----BEGIN PGP SIGNATURE-----

iQFhBAABCABLFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmptA2MbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMCwzERxib3F1bkBrZXJuZWwub3JnAAoJEEl56MO1B/q4
UBAH/108a8dCkDaK3MUuS0SeuqY57EPwLCTE/k4gJK35XlF0fCpEPfFtqfEs6xkG
E0rMhSx3bDmtfccEo16LOkmbcrSx3NSsc9KlSRiYRywptT+CRld5FPqmJqDd2nCh
mYYUsNppEXFd4rUiGfKAcVeLHD+PCio0/ElNN7X3TCfQgtWUuDp4pcB23m9t6ste
Re4idhKoTmqeKTX3N8AuQ0QMsr1FNNLu0ESpUv1n6/DrEB1g8XevF1J2PKYr9fxt
aahCMk2qQF3vDCi4Ydh9o9AWqSkinU2yIW64ZBWRC2S7QBVRIrPAEtX4V/n7d/n+
2irbb1ZuVu5zFD0/CyNkgyQM/og=
=DzLT
-----END PGP SIGNATURE-----


Regards,
Boqun

----------------------------------------------------------------
Boqun Feng (10):
      preempt: Introduce HARDIRQ_DISABLE_BITS
      preempt: Introduce __preempt_count_{sub, add}_return()
      irq & spin_lock: Add counted interrupt disabling/enabling
      locking: Switch to _irq_{disable,enable}() variants in cleanup guards
      sched: Remove the unused preempt_offset parameter of __cant_sleep()
      sched: Avoid signed comparison of preempt_count() in __cant_migrate()
      preempt: Introduce HAS_SEPARATE_PREEMPT_RESCHED_BITS
      arm64: sched/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
      irq: Optimize reschedule check in local_interrupt_enable()
      rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers

Gary Guo (3):
      rust: sync: Add helpers for mb, dma_mb and friends
      rust: sync: Add generic memory barriers
      rust: revocable: Use LKMM atomics instead of Rust atomics

Heiko Carstens (1):
      s390/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS

Joel Fernandes (1):
      preempt: Track NMI nesting to separate per-CPU counter

Lyude Paul (6):
      openrisc: Include <linux/cpumask.h> in smp.h
      irq: Add KUnit test for refcounted interrupt enable/disable
      rust: Introduce interrupt module
      rust: sync: use super::* in spinlock.rs
      rust: sync: Add SpinLockIrq
      rust: sync: Introduce SpinLockIrq::lock_with() and friends

Philipp Stanner (3):
      rust: sync: Add abstraction for synchronize_rcu()
      rust: revocable: Use safe synchronize_rcu() abstraction
      rust: sync: Use safe synchronize_rcu() abstraction in poll

 arch/arm64/Kconfig                             |   1 +
 arch/arm64/include/asm/preempt.h               |  18 ++
 arch/openrisc/include/asm/smp.h                |   2 +
 arch/s390/Kconfig                              |   1 +
 arch/s390/include/asm/lowcore.h                |  13 +-
 arch/s390/include/asm/preempt.h                |  49 ++--
 arch/x86/Kconfig                               |   1 +
 arch/x86/include/asm/preempt.h                 |  61 +++--
 arch/x86/kernel/cpu/common.c                   |   2 +-
 include/asm-generic/preempt.h                  |  14 ++
 include/linux/hardirq.h                        |  41 ++-
 include/linux/interrupt_rc.h                   |  76 ++++++
 include/linux/kernel.h                         |   4 +-
 include/linux/preempt.h                        |  35 ++-
 include/linux/spinlock.h                       |  35 ++-
 include/linux/spinlock_api_smp.h               |  41 +++
 include/linux/spinlock_api_up.h                |  16 ++
 include/linux/spinlock_rt.h                    |  18 ++
 kernel/Kconfig.preempt                         |   4 +
 kernel/irq/Makefile                            |   1 +
 kernel/irq/refcount_interrupt_test.c           | 109 ++++++++
 kernel/locking/spinlock.c                      |  29 +++
 kernel/sched/core.c                            |  18 +-
 kernel/softirq.c                               |  22 +-
 lib/locking-selftest.c                         |   2 +-
 rust/helpers/barrier.c                         |  30 +++
 rust/helpers/helpers.c                         |   1 +
 rust/helpers/interrupt.c                       |  18 ++
 rust/helpers/spinlock.c                        |  15 ++
 rust/helpers/sync.c                            |   5 +
 rust/kernel/interrupt.rs                       |  89 +++++++
 rust/kernel/lib.rs                             |   1 +
 rust/kernel/revocable.rs                       |  28 ++-
 rust/kernel/sync.rs                            |   9 +-
 rust/kernel/sync/atomic/ordering.rs            |   2 +-
 rust/kernel/sync/barrier.rs                    | 127 +++++++---
 rust/kernel/sync/lock/global.rs                |   3 +
 rust/kernel/sync/lock/spinlock.rs              | 331 ++++++++++++++++++++++++-
 rust/kernel/sync/poll.rs                       |  10 +-
 rust/kernel/sync/rcu.rs                        |  16 ++
 tools/testing/selftests/bpf/bpf_experimental.h |   7 +-
 41 files changed, 1184 insertions(+), 121 deletions(-)
 create mode 100644 include/linux/interrupt_rc.h
 create mode 100644 kernel/irq/refcount_interrupt_test.c
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs
