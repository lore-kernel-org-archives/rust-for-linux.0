Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D9F46C848;
	Tue,  4 Aug 2026 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860105; cv=none; b=Ql+s9h0TQ7k8gGBm51uOYUky9X6eGAcMtPUyRSUVqTNmdA7rBNHk3gD7IXJxjuwGOW81ODem+6D0/izdcKtTsPJpp9YSpdC5Vpm2PikZpsys+VOcWW1MEL88w2pulsQR+Wqm6bNEPN9idYm2Nj+8b1+PX78HdkkEJGFxV5Sq5Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860105; c=relaxed/simple;
	bh=aiHijWNQm0YQ2K//WRkVXFStJF9o81GlXW3EAC/DKkk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=thGshhPhFs5WRDN9HDO4utpjDHyNtYhxYOdF8x5VgQbp8GVAHECYcoIuEMemEBZDrA9BYSlzK0+uG70eM8kuLWmdxxViA54v52ZAZmqIYZx2vQLG+sBZ5d/gyfuzBk5QXWCIQz99gEdr+IPijoQgiax9qH+bkfApOQA1a6spYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkwUHhXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkwUHhXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F32F1F00A3D;
	Tue,  4 Aug 2026 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860096;
	bh=L+PSkzfSlH4+/ohMeWS5xc5xrhRB7+qexjNxX1/DAZE=;
	h=From:To:Cc:Subject:Date;
	b=OkwUHhXX+diFU+fAYymTMumLSZzw0Ja1o0EHFYpGEByU/hJVvw2my4WcBSshpf3uA
	 Y3WXsz80CJAm2h8bfpr7nsa4Yncp81t+pUIpJdbleKgXgEzLjNIZk93F2H3KC21f6I
	 gTlhlqWM/3ZTOzAOZqjtQah1MiM8diZeSZylYZ8h9rsJTxWsnmh9J6slu/yjeNnBBT
	 0nI6FlfOLdu++ABYmh/9t6iXD6wLlNyWhEDy6/5OqQolwJ2j8aKAgpbOTHIwwSjw5S
	 a+QO0oVUee/TUuW4arfvP/74nzNHRbxEILsQpxbwe+GujyqGSBcTaUpMQ8mssOL1Oi
	 EEm5YqIbaGpPQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5A47FF40066;
	Tue,  4 Aug 2026 12:14:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 04 Aug 2026 12:14:55 -0400
X-ME-Sender: <xms:_w9yanBQy1XndJFV47e5W9KgsKiEuIHt2o3zBsW2xKrGWgdygBfIEw>
    <xme:_w9yaisnlqnWlnxtbedyMjNXU7T6GON-aE7S0qrImlkMtMoyLXHTr7G7ulya1leWA
    HOuetgKGm4OmRbVT5_-xvlHO8jr29RFzsEsztLR_BFr8GXKGh17aGk>
X-ME-Received: <xmr:_w9yal_XLaGTmSJ6xdXeD80Vxi_GVRpQI3ODty-NUNSDJwGkjP_IYF8qpWQ7LWTXrvJHS6NtvzTFsYM9vGs3la6smbeRaEKO>
X-ME-Proxy-Cause: dmFkZTEatUNGtY50+RUN6sNEeEQC8etDAdN2xmsDtZ3qIVVcd16vndR+ESBXkIhDZ/lmFZ
    PLJy5/h2tFrY5vrVHsuk+ZxdPR04rFlTxB8EjNRSVnMrTXR46isWdFc/c9/8oRnq3UG+1i
    RX+SJL6vsHC7fr0+elQHbKOkc4ZtIGlANyFcmKbme5pNvpqrml+WupFVT1GwQdEUuZQgFZ
    3mCE2s59V4JeB8RaYhdtUrwDYv489G8OWVZk3B6BwBqDzTY4U93mUB2QDEBw3P1MdXYZfr
    kCLtz67AVe08hhFyJ/f3EESAZH25HZCYqE8HomgW9hl4lTtFrowMphBFBQwfNB4rh0JkKZ
    oRu2MWJFg3oHJQ3MfNYxejG1AnV+5iL3/hH6EBln7kBw2PzYKI5KNUB1wR0u7aEmqBKWpU
    ybLSbVvZeggPDiNSnuE5epWRWTk7bk2tJQFpO9Usx8T4KYtkhUrt5CajhYHh7qt2BVYMpj
    KJX5qp1d1KdUIjtUtMZ6gfT2gU9aF6rICfjXDSaLmP64zZP1x/B1lwNXPfnOXPQyM8/enM
    ipJO6bD/+fxYQSvJYxXt1D2Wvlq/ltY77e0UqsCcTUYlC5V0s/AI2ytfySpas/QtfPtg3T
    panH1/KN3O+1TiauefEwVmpW/I2AaeqkUcFbX6FtOI4E62O2xoBoWDTNroyA
X-ME-Proxy: <xmx:_w9yapRMtls7HHlBYZsHRIaD1lbiIiYVGMBvXCccO7kyhN95AiYBWA>
    <xmx:_w9yanUmV6j_NvK-hsuwBasDlAySOIzhzgm-Va4CEiUKYrAq2LdvIQ>
    <xmx:_w9yar_9ZCS4b8Rs90ihy6VY5xcsKzCeLcSSz-lnVDJzlZbI5gFv1A>
    <xmx:_w9yan01yQtTzMYhowRvMI3gFlKQfpPDnE8JDW1DtuO3NhIh7FCXZA>
    <xmx:_w9yagcpKwflSoI9V7-2284lWsQ2CBn8LJdxX8SCOWACCSr213qCmuzu>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:14:54 -0400 (EDT)
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
Subject: [PATCH v4 00/17] Refcounted interrupt disable and SpinLockIrq for Rust
Date: Tue,  4 Aug 2026 09:14:22 -0700
Message-ID: <20260804161447.84806-1-boqun@kernel.org>
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

Changes since the PR attempt [1]:

* Removed the preempt_count check in local_interrupt_enable() per Peter.
* Simplified the local_interrupt_disable_state struct to avoid
  unnecessary wrapper (Thanks Peter).
* Adjusted the user side changes in do_sched_cfs_*_timer().
* Improved the documentation on the preempt_count layout regarding
  HAS_SEPARATE_PREEMPT_RESCHED_BITS
* Updated the asm block comment for s390 (Thanks Heiko!).
* SoB chain/typo/format fixes.

(Lyude, I dropped the Link tags of your original patchset, since I did
some significant changes and let's just use the new links).

[1]: https://lore.kernel.org/rust-for-linux/20260731203031.13679-1-boqun@kernel.org/

Thanks!

Regards,
Boqun

Boqun Feng (9):
  preempt: Introduce HARDIRQ_DISABLE_BITS
  preempt: Introduce __preempt_count_{sub,add}_return()
  irq & spin_lock: Add counted interrupt disabling/enabling
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
 include/linux/interrupt_rc.h                  |  82 +++++
 include/linux/kernel.h                        |   4 +-
 include/linux/preempt.h                       |  44 ++-
 include/linux/spinlock.h                      |  49 ++-
 include/linux/spinlock_api_smp.h              |  43 +++
 include/linux/spinlock_api_up.h               |  15 +
 include/linux/spinlock_rt.h                   |  18 +
 kernel/Kconfig.preempt                        |   4 +
 kernel/irq/Makefile                           |   1 +
 kernel/irq/refcount_interrupt_test.c          | 109 ++++++
 kernel/locking/spinlock.c                     |  31 ++
 kernel/sched/core.c                           |  18 +-
 kernel/sched/fair.c                           |  12 +-
 kernel/softirq.c                              |  36 +-
 lib/locking-selftest.c                        |   2 +-
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
 36 files changed, 1060 insertions(+), 91 deletions(-)
 create mode 100644 include/linux/interrupt_rc.h
 create mode 100644 kernel/irq/refcount_interrupt_test.c
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs

-- 
2.50.1 (Apple Git-155)

