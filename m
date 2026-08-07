Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559BE374E55
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086148; cv=none; b=N12O7plMplx8TgzVTE5Au6YFzcLUlHeB1yDS9xMCbnuQDM2ceSEKxE+rkXJ1CjSjvaK/dOH7YQnWXuMQoera58xmQvJeQzLzos83I0i/oWWo9/gArPt4MOQtKSxlJUAGVABUjVcAdnVxh8ty/LgspqJumv4sNVD8U3yzGZOhI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086148; c=relaxed/simple;
	bh=XiYvlL+3YsG4Pz8qLbnWm6xB+AOdirNHYkYyinfhrJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qETWW9ZS9YeGPmwCExHAx2H2bO0ywEmPtakZRRApv/vUHmwrUIRZjnhzJ2jRwJWlua00GC5t2o91YjSxexilZ3taJz2bQrqzvDmQyo9XoM7XOf6qp3ESKYSgr637dYGombRPRRXGzYEe+KkrVITrVFIquxQg2mCxtxffMYBpGq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OvqsBwXE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvqsBwXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A94A1F000E9;
	Fri,  7 Aug 2026 07:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086147;
	bh=GdnOMvH9f85lZXsyRG17szJzvIKuxS2kyIrsr+IjmFI=;
	h=From:To:Cc:Subject:Date;
	b=OvqsBwXE3L4zHMQhhRACfT1Ne/srVP9rq1HaFPaaTmQX0CkMD1ZwbWtDYt8qOQKN+
	 qgCzexYdnSUPqJRWz18L2AIf4aNJdcYzwKXUKAaZKlnrfGvOpcYNSWgt1wRI6AAUCh
	 9ow8dZ/1ngZOcLLoG2KH39n3ibwP88mmSdVIijnuWp+wZnESHbExnNsGFOUL/I8gRx
	 vR4teody2/1Kaqy+AW4eti8LvMYZNBBqKJKl7z+nLz06jjsbEUcioSeO7fuPfUKbdb
	 opMstu797GDLbWD6P2rE6Jt9iAjpb4Sw/zx5UrTuHKcM2SPYL2ypRn1ERuMefyWMoe
	 UtTf2/5zMPCWw==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3E77DF40067;
	Fri,  7 Aug 2026 03:02:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 07 Aug 2026 03:02:25 -0400
X-ME-Sender: <xms:AYN1aox6ffQ2q1EDHDNj7djJVjOuXKRo1rQOisUHw7tqT2UHlHgIQQ>
    <xme:AYN1aom_GORNPPZ6K_WNJiFOHRxv7Cq11Kp6nfGdi4FGCBvvx5Ptjqmzj4x1aq0lT
    L4AQHdd1hlfDPFq66U_EaYrvmAVvNga3e5fEM0gZoPhcD5bzIHwQw>
X-ME-Received: <xmr:AYN1ar9F4HRpjlWe7uC-MblHZf9vVs-8_6tG0KK5YtNpQ-18r87CWKxf1bTaickIaknE5_WNS6FFVxDeH74CS39zb9sW34Pn>
X-ME-Proxy-Cause: dmFkZTGiCFnxEBj26xF9PNEuGqJJyQp4vDUolWHp1o32Kspf5VgIMibBrjCipLPBxV1WSE
    RE1NDWjjHD2VRqLVSe95m9z2UH3Ljo3BG6WZGFgQGUWRjiY1kofF7F5agTT16DReLjfO7X
    hP6HBG/sC1PgiGEjNuUjvI9hLEeteOcn80bonzwHD8sXu0R5juonQ0vxRiSx50BY+fMvJD
    soa/dEDGN1mcPs8NChN6Gb4Wwit8ehF6URrljghIvCCFVU0WULEbUwPN6syI6YYVQInatO
    c2yF8CKfgjg+Rq1UKQE8MusiRdrAu/lM6UP66kOHbdR6SmlNrxe1/AJdNcKTNh8CNjBLK9
    EF2+JBbjb9gEl+HwqwBcH6/FBXPk2t+UUagWkJ4FJU+R00X0sb3Jg8SEq7gKu8qbSnYpJd
    5HBaKpoq8rVpu5rPHw2luPCaWuwFlC92be2xXVgl+d6QGoCpuSvCxSt3q369JVb+vs4Qjj
    HlAO62ICK5RPUEwwQBgtW90lSx8tebfh079N+4dVSl6v+Uu2k5x752rPc5hPkFH3kWgolK
    kM2tiB+eX6chjCoK6bb5L7C854Fdlrbh1dLOy+WwXFPHRqNx9DOeG8YuoPpNR3HiQCuYIV
    FEdr3cGSZ/IaEiKSbCyVbxrRmB+99o6AzSWGNrMxe66ay/QBOCYesAm9ImCw
X-ME-Proxy: <xmx:AYN1ajoLgHl-T1YVHxn3gEy-wnVA3pW0MmoR6qdO10MXtieYcyHRyQ>
    <xmx:AYN1avJ_9C27TLmaqpkWJNUTlXFNpnzsdbFRncgr6R-QeERwRGMAQg>
    <xmx:AYN1at2-yy3OLlJNnCcKRxWFs7XbE-FE51pf6s0mwutJOqRx6kl3tg>
    <xmx:AYN1auWEtjOV6qJcvlcZo4CXDl8OV7aiMEdkldnJZBrE2T_lFOmvuQ>
    <xmx:AYN1ajXvYLZjy22nISGOrTpQeLI16WYlueKgHeOsBlicfEsHL7esIEf7>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:24 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v5 00/18] Refcounted interrupt disable and SpinLockIrq for Rust
Date: Fri,  7 Aug 2026 00:01:57 -0700
Message-ID: <20260807070218.27144-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter & Ingo,

Please take a look at this updated series for SpinLockIrq.

Changes since v4:

* Addressed SoB issues spotted by Peter.
* Added underflow/overflow checking for interrupt disabling counter as
  suggested by Shrikanth.
* Added a max nesting level per suggestion from Shrikanth.
* Document/comment updates.

v4: https://lore.kernel.org/lkml/20260804161447.84806-1-boqun@kernel.org/

Regards,
Boqun

Boqun Feng (10):
  preempt: Introduce HARDIRQ_DISABLE_BITS
  preempt: Introduce __preempt_count_{sub,add}_return()
  irq & spin_lock: Add counted interrupt disabling/enabling
  irq: Add max local_interrupt_disable() nesting level kunit test case
  locking: Switch to _irq_{disable,enable}() variants in cleanup guards
  sched: Remove the unused preempt_offset parameter of __cant_sleep()
  sched: Avoid signed comparison of preempt_count() in __cant_migrate()
  preempt: Introduce HAS_SEPARATE_PREEMPT_RESCHED_BITS
  arm64: sched/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS
  rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers

Heiko Carstens (1):
  s390/preempt: Enable HAS_SEPARATE_PREEMPT_RESCHED_BITS

Joel Fernandes (1):
  preempt: Track NMI nesting to separate per-CPU counter

Lyude Paul (6):
  openrisc: Include <linux/cpumask.h> in smp.h
  irq: Add KUnit test for refcounted interrupt enable/disable
  rust: Introduce interrupt module
  rust: sync: Use super::* in spinlock.rs
  rust: sync: Add SpinLockIrq
  rust: sync: Introduce SpinLockIrq::lock_with() and friends

 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/preempt.h              |  20 ++
 arch/openrisc/include/asm/smp.h               |   2 +
 arch/s390/Kconfig                             |   1 +
 arch/s390/include/asm/lowcore.h               |  13 +-
 arch/s390/include/asm/preempt.h               |  51 +--
 arch/x86/Kconfig                              |   1 +
 arch/x86/include/asm/preempt.h                |  61 +++-
 arch/x86/kernel/cpu/common.c                  |   2 +-
 include/asm-generic/preempt.h                 |  14 +
 include/linux/hardirq.h                       |  40 ++-
 include/linux/interrupt_rc.h                  |  95 +++++
 include/linux/kernel.h                        |   4 +-
 include/linux/preempt.h                       |  44 ++-
 include/linux/spinlock.h                      |  49 ++-
 include/linux/spinlock_api_smp.h              |  41 +++
 include/linux/spinlock_api_up.h               |  15 +
 include/linux/spinlock_rt.h                   |  18 +
 kernel/Kconfig.preempt                        |   4 +
 kernel/irq/Makefile                           |   1 +
 kernel/irq/refcount_interrupt_test.c          | 131 +++++++
 kernel/locking/spinlock.c                     |  31 ++
 kernel/sched/core.c                           |  18 +-
 kernel/sched/fair.c                           |  12 +-
 kernel/softirq.c                              |  36 +-
 rust/helpers/helpers.c                        |   1 +
 rust/helpers/interrupt.c                      |  18 +
 rust/helpers/spinlock.c                       |  15 +
 rust/helpers/sync.c                           |   5 +
 rust/kernel/interrupt.rs                      |  89 +++++
 rust/kernel/lib.rs                            |   1 +
 rust/kernel/sync.rs                           |   9 +-
 rust/kernel/sync/lock/global.rs               |   3 +
 rust/kernel/sync/lock/spinlock.rs             | 329 +++++++++++++++++-
 .../testing/selftests/bpf/bpf_experimental.h  |   7 +-
 35 files changed, 1092 insertions(+), 90 deletions(-)
 create mode 100644 include/linux/interrupt_rc.h
 create mode 100644 kernel/irq/refcount_interrupt_test.c
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs

-- 
2.50.1 (Apple Git-155)

