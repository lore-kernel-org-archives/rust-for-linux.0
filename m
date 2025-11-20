Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C836D519
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675234; cv=none; b=fukKeiO+NkMdw8gS74WuWqaXYyc3xkd/wTYJgvfa+PcWnQfNeTPW86DbnYvLEhAsu2ucdLjXJvflD83J6Cnw+M3JQLepSMZR4KZt7in9yZATArW8RMapVPkZz5PxLGqrykvaHNgIx4f08EfK2Hgj0A1LPjftKQTE4NbqBh04RlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675234; c=relaxed/simple;
	bh=6G49fIqf/kTTaptL5nfnunhtXZOrEnQSnnPmaOkk/X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JRZcn/7sSL1yR93r/c6YM1lUEoCZhVR7fWo0G8+EZG2zKFVmnQD4dDEfWYuU5J58JCl/cibwpFmiukrotN0RGBv858Fl1fxgZ1aTB7TBm7Axw/FyyxdsK+8kTek3l/vB6yT5+NVovM1cRR9DuPAJ4NpLsP6EspFwcem726hCvu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QTLRgDGA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QTLRgDGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763675231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CBUjnQnMX04EHn3LJ/j3RuEsmsVxSSb/9639FBaV9SE=;
	b=QTLRgDGAX5b8xqR16uCjgJJ+0mtUQSHpPETCrDMEN33+b3mQnlCmGkDISsJT8K+vkTtUU5
	VejEFXPMoqdw4V8CwbUdKPpir3g57gXehYydRf3S44s5NLX3Otw+dDbUjut3gKtInrYqOW
	IUs7mEhWG4bxmjZaoOFqQfUoGqtvxOs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-1842FRbrMriC--lgPeus2Q-1; Thu,
 20 Nov 2025 16:47:09 -0500
X-MC-Unique: 1842FRbrMriC--lgPeus2Q-1
X-Mimecast-MFC-AGG-ID: 1842FRbrMriC--lgPeus2Q_1763675226
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 656AF1956094;
	Thu, 20 Nov 2025 21:47:05 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.52])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9CE7B1940E8F;
	Thu, 20 Nov 2025 21:47:00 +0000 (UTC)
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
Subject: [PATCH v14 00/16] Refcounted interrupts, SpinLockIrq for rust
Date: Thu, 20 Nov 2025 16:45:52 -0500
Message-ID: <20251120214616.14386-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

This is the latest patch series for adding rust bindings for controlling
local processor interrupts, adding support for spinlocks in rust that
are acquired with local processor interrupts disabled, and implementing
local interrupt controls through refcounting in the kernel.

The previous version of this patch series can be found here:

https://lkml.org/lkml/2025/10/13/1155

This patch series applies on top of the rust-next branch.

There's a few big changes from the last time. Mainly that we've
addressed all(?) of the open questions on this patch series:

* Thanks to Joel Fernandes, we now have a seperate per-CPU counter for
  tracking NMI nesting - which ensures that we don't have to sacrifice
  NMI nest level bits in order to store a counter for refcounted IRQs.
  These patches have been included at the start of the series.
* We've been able to prove that being able to convert the kernel over to
  this new interface is indeed possible, more on this below.
* Also thank to Joel, we also now have actual benchmarks for how this
  affects performance:
  https://lore.kernel.org/rust-for-linux/20250619175335.2905836-1-joelagnelf@nvidia.com/
* Also some small changes to the kunit test I added, mainly just making
  sure I don't forget to include a MODULE_DESCRIPTION or MODULE_LICENSE.

Regarding the conversion plan: we've had some success at getting kernels
to boot after attempting to convert the entire kernel from the
non-refcounted API to the new refcounted API. It will definitely take
quite a lot of work to get this right though, at least in the kernel
core side of things. To give readers an idea of what I mean, here's a
few of the issues that we ended up running into:

On my end, I tried running a number of coccinelle conversions for this.
At first I did actually try simply rewiring
local_irq_disable()/local_irq_enable() to
local_interrupt_enable()/local_interrupt_disable(). This wasn't really
workable though, as it causes the kernel to crash very early on in a
number of ways that I haven't fully untangled. Doing this with
coccinelle on the other hand allowed me to convert individual files at a
time, along with specific usage patterns of the old API, and as a result
this ended up giving me a pretty good idea of where our issues are
coming from. This coccinelle script, while still leaving most of the
kernel unconverted, was at least able to be run on almost all of kernel/
while still allowing us to boot on x86_64

@depends on patch && !report@
@@
- local_irq_disable();
+ local_interrupt_disable();
...
- local_irq_enable();
+ local_interrupt_enable();

There were two files in kernel/ that were exceptions to this:

* kernel/softirq.c
* kernel/main.c (I figured out at least one fix to an issue here)

The reason this worked is because it seems like the vast majority of the
issues we're seeing come from "unbalanced"/"misordered" usages of the
old irq API. And there seems to be a few reasons for this:

* The first simple reason: occasionally the enable/disable was split
  across a function, which this script didn't handle.
* The second more complicated reason: some portions of the kernel core
  end up calling processor instructions that modify the processor's
  local interrupt flags independently of the kernel. In x86_64's case, I
  believe we came to the conclusion the iret instruction (interrupt
  return) was modifying the interrupt flag state. There's possibly a few
  more instances like this elsewhere.

Boqun also took a stab at this on aarch64, and ended up having similar
findings. In their case, they discovered one of the culprits being
raw_spin_rq_unlock_irq(). Here the reason is that on aarch64
preempt_count is per-thread and not just per-cpu, and when context
switching you generally disable interrupts from one task and restore it
in the other task. So in order to fix it, we'll need to make some
modifications to the aarch64 context-switching code.

So - with this being said, we decided that the best way of converting it
is likely to just leave us with 3 APIs for the time being - and have new
drivers and code use the new API while we go through and convert the
rest of the kernel.

Full changelog below

Boqun Feng (6):
  preempt: Introduce HARDIRQ_DISABLE_BITS
  preempt: Introduce __preempt_count_{sub, add}_return()
  irq & spin_lock: Add counted interrupt disabling/enabling
  rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
  rust: sync: lock: Add `Backend::BackendInContext`
  locking: Switch to _irq_{disable,enable}() variants in cleanup guards

Joel Fernandes (1):
  preempt: Track NMI nesting to separate per-CPU counter

Lyude Paul (9):
  irq: Add KUnit test for refcounted interrupt enable/disable
  rust: Introduce interrupt module
  rust: sync: Add SpinLockIrq
  rust: sync: Introduce lock::Backend::Context
  rust: sync: lock/global: Rename B to G in trait bounds
  rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
  rust: sync: Expose lock::Backend
  rust: sync: lock/global: Add Backend parameter to GlobalGuard
  rust: sync: lock/global: Add BackendInContext support to GlobalLock

                               --- Changelog ---

* preempt: Introduce HARDIRQ_DISABLE_BITS
  V14:
    * Fix HARDIRQ_DISABLE_MASK definition

* preempt: Track NMI nesting to separate per-CPU counter
* preempt: Introduce __preempt_count_{sub, add}_return()
  V10:
    * Add commit message I forgot
    * Rebase against latest pcpu_hot changes
  V11:
    * Remove CONFIG_PROFILE_ALL_BRANCHES workaround from
      __preempt_count_add_return()

* irq & spin_lock: Add counted interrupt disabling/enabling
  V10:
    * Add missing __raw_spin_lock_irq_disable() definition in spinlock.c
  V11:
    * Move definition of spin_trylock_irq_disable() into this commit
    * Get rid of leftover space
    * Remove unneeded preempt_disable()/preempt_enable()
  V12:
    * Move local_interrupt_enable()/local_interrupt_disable() out of
      include/linux/spinlock.h, into include/linux/irqflags.h
  V14:
    * Move local_interrupt_enable()/disable() again, this time into its own
      header, interrupt_rc.h, in order to fix a hexagon-specific build issue
      caught by the CKI bot.
      The reason this is needed is because on most architectures, irqflags.h
      ends up including <arch/smp.h>. This provides a definition for the
      raw_smp_processor_id() function which we depend on like so:

                                 <linux/percpu-defs.h>    <arch/smp.h>
        local_interrupt_disable() → raw_cpu_write() → raw_smp_processor_id()

      Unfortunately, hexagon appears to be one such architecture which does
      not pull in <arch/smp.h> by default here - causing kernel builds to
      fail and claim that raw_smp_processor_id() is undefined:

         In file included from kernel/sched/rq-offsets.c:5:
         In file included from kernel/sched/sched.h:8:
         In file included from include/linux/sched/affinity.h:1:
         In file included from include/linux/sched.h:37:
         In file included from include/linux/spinlock.h:59:
      >> include/linux/irqflags.h:277:3: error: call to undeclared function
         'raw_smp_processor_id'; ISO C99 and later do not support implicit
         function declarations [-Wimplicit-function-declaration]
           277 |   raw_cpu_write(local_interrupt_disable_state.flags, flags);
               |   ^
         include/linux/percpu-defs.h:413:34: note: expanded from macro
         'raw_cpu_write'

      While including <arch/smp.h> in <linux/irqflags.h> does fix the build
      on hexagon, it ends up breaking the build on x86_64:

        In file included from kernel/sched/rq-offsets.c:5:
        In file included from kernel/sched/sched.h:8:
        In file included from ./include/linux/sched/affinity.h:1:
        In file included from ./include/linux/sched.h:13:
        In file included from ./arch/x86/include/asm/processor.h:25:
        In file included from ./arch/x86/include/asm/special_insns.h:10:
        In file included from ./include/linux/irqflags.h:22:
        In file included from ./arch/x86/include/asm/smp.h:6:
        In file included from ./include/linux/thread_info.h:60:
        In file included from ./arch/x86/include/asm/thread_info.h:59:
        ./arch/x86/include/asm/cpufeature.h:110:40: error: use of undeclared
        identifier 'boot_cpu_data'

          [cap_byte] "i" (&((const char *)boot_cpu_data.x86_capability)[bit >> 3])
                                          ^
      While boot_cpu_data is defined in <asm/processor.h>, it's not possible
      for us to include that header in irqflags.h because we're already
      inside of <asm/processor.h>.

      As a result, I just concluded there's no reasonable way of having these
      functions in <linux/irqflags.h> because of how many low level ASM
      headers depend on it. So, we go with the solution of simply giving
      ourselves our own header file.

* rust: Introduce interrupt module
  V10:
    * Fix documentation typos
  V11:
    * Get rid of unneeded `use bindings;`
    * Move ASSUME_DISABLED into assume_disabled()
    * Confirm using lockdep_assert_irqs_disabled() that local interrupts are in
      fact disabled when LocalInterruptDisabled::assume_disabled() is called.

* rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
* rust: sync: Add SpinLockIrq
  V10:
    * Also add support to GlobalLock
    * Documentation fixes from Dirk
  V11:
    * Add unit test requested by Daniel Almeida
  V14:
    * Improve rustdoc for SpinLockIrqBackend

* rust: sync: Introduce lock::Backend::Context
  V10:
    * Fix typos - Dirk

* rust: sync: lock: Add `Backend::BackendInContext`
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
* rust: sync: Expose lock::Backend
* rust: sync: lock/global: Add Backend parameter to GlobalGuard
* rust: sync: lock/global: Add BackendInContext support to GlobalLock
* locking: Switch to _irq_{disable,enable}() variants in cleanup guards
  V10:
    * Add PREEMPT_RT build fix from Guangbo Cui

 arch/arm64/include/asm/preempt.h     |  18 ++
 arch/s390/include/asm/preempt.h      |  10 +
 arch/x86/include/asm/preempt.h       |  10 +
 include/asm-generic/preempt.h        |  14 ++
 include/linux/hardirq.h              |  16 +-
 include/linux/interrupt_rc.h         |  61 ++++++
 include/linux/preempt.h              |  23 ++-
 include/linux/spinlock.h             |  51 +++--
 include/linux/spinlock_api_smp.h     |  27 +++
 include/linux/spinlock_api_up.h      |   8 +
 include/linux/spinlock_rt.h          |  15 ++
 kernel/irq/Makefile                  |   1 +
 kernel/irq/refcount_interrupt_test.c | 109 +++++++++++
 kernel/locking/spinlock.c            |  29 +++
 kernel/softirq.c                     |   5 +
 rust/helpers/helpers.c               |   1 +
 rust/helpers/interrupt.c             |  18 ++
 rust/helpers/spinlock.c              |  15 ++
 rust/helpers/sync.c                  |   5 +
 rust/kernel/interrupt.rs             |  86 +++++++++
 rust/kernel/lib.rs                   |   1 +
 rust/kernel/sync.rs                  |   5 +-
 rust/kernel/sync/lock.rs             |  69 ++++++-
 rust/kernel/sync/lock/global.rs      |  91 ++++++---
 rust/kernel/sync/lock/mutex.rs       |   2 +
 rust/kernel/sync/lock/spinlock.rs    | 272 +++++++++++++++++++++++++++
 26 files changed, 908 insertions(+), 54 deletions(-)
 create mode 100644 include/linux/interrupt_rc.h
 create mode 100644 kernel/irq/refcount_interrupt_test.c
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs


base-commit: e5d330e13f67d574f683c052c9a342814fd8fa39
-- 
2.51.1

