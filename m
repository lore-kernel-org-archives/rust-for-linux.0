Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5D425CC7
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 22:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035202; cv=none; b=vEIBUHLzPkvLB20IFew/MuMUX3YMrRGPzsUQE97OQP30/tHkR+b8XDaK25IJwEf4jdEh8yvt/+HD8CVPNtR6fwQij0Od6NnMMOpn4QdTUeHTpQkhK3xrIF1LdToQW/mjpA3zlwIyu7TS7YuQJYRS7Qrxn2Xfo263/IUGWp9iaGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035202; c=relaxed/simple;
	bh=48G9xqOXV57Oy+k2JwPiHRne5g206vVfiCdeK17vZBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SMsDK45/guXg923aV3xVyv9iiHm/gwiQsBYW/ZtW9diODOPrzsxj1k8zPAS8O7m8stinHd6VF/aj2ULANGzLE+HZeWoH0hFgDx7HyCceXBdXkuxm2XPHuJ8hgxNbA4Aa9IW5qYp8irnJATtFfUjubv0fIbH4INo7TjKX03DqTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e9H5V9HX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e9H5V9HX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769035198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+g/Ln72mkiKVwakis3o6rmU/vAjhet1axeMu1VCTZ6k=;
	b=e9H5V9HXxaPfmuEfOtUEhyxQ0vpf2slv4KYyJVr3sWAmqpk7ypa7LqqRdq7+U31eeGtygQ
	3YnLEY7mMFP2BoMpzZ1lDedsa6peY0ukU7PAuWR9WJeSIRlTyDBABNHpA3X0IXLG/QvjEI
	XvOGN6U6CTCMQjfkwqabf4Pw555Rk+Y=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-m5sLFJQyPrOeYYDgU3xeqQ-1; Wed,
 21 Jan 2026 17:39:55 -0500
X-MC-Unique: m5sLFJQyPrOeYYDgU3xeqQ-1
X-Mimecast-MFC-AGG-ID: m5sLFJQyPrOeYYDgU3xeqQ_1769035193
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2D201956053;
	Wed, 21 Jan 2026 22:39:52 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 57AF41955F43;
	Wed, 21 Jan 2026 22:39:49 +0000 (UTC)
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
Subject: [PATCH v17 00/16] Refcounted interrupts, SpinLockIrq for rust
Date: Wed, 21 Jan 2026 17:39:03 -0500
Message-ID: <20260121223933.1568682-1-lyude@redhat.com>
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

https://lkml.org/lkml/2025/12/15/1190

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

FULL CHANGELOG BELOW

Boqun Feng (5):
  preempt: Introduce HARDIRQ_DISABLE_BITS
  preempt: Introduce __preempt_count_{sub, add}_return()
  irq & spin_lock: Add counted interrupt disabling/enabling
  rust: helper: Add spin_{un,}lock_irq_{enable,disable}() helpers
  locking: Switch to _irq_{disable,enable}() variants in cleanup guards

Joel Fernandes (1):
  preempt: Track NMI nesting to separate per-CPU counter

Lyude Paul (10):
  openrisc: Include <linux/cpumask.h> in smp.h
  irq: Add KUnit test for refcounted interrupt enable/disable
  rust: Introduce interrupt module
  rust: sync: Add SpinLockIrq
  rust: sync: Introduce lock::Lock::lock_with() and friends
  rust: sync: Expose lock::Backend
  rust: sync: lock/global: Rename B to G in trait bounds
  rust: sync: Add a lifetime parameter to lock::global::GlobalGuard
  rust: sync: lock/global: Add Backend parameter to GlobalGuard
  rust: sync: lock/global: Add ContextualBackend support to GlobalLock

--- Changelog ---

Series-wide:
  V15:
    * Added a patch for fixing build erors introduced on OpenRISC
  V17:
    * Squash:
      - "rust: sync: Introduce lock::Backend::Context"
      - "rust: sync: lock: Add `Backend::BackendInContext`"
      With BackendWithContext being a separate trait, it no longer makes
      sense for these patches to be separate.

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
* openrisc: Include <linux/cpumask.h> in smp.h
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
  V15:
    * Fix build error on CONFIG_SMP=n reported by Kernel CI

* irq: Add KUnit test for refcounted interrupt enable/disable
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
* rust: sync: Introduce lock::Lock::lock_with() and friends
  V10:
    * Fix typos - Dirk
  V17:
    * Introduce `BackendWithContext`, move context-related bits into there and
      out of `Backend`.
    * Add missing #[must_use = …] for try_lock_with()
    * Remove all unsafe code from lock_with() and try_lock_with():
      Somehow I never noticed that literally none of the unsafe code in these
      two functions is needed with as_lock_in_context()...
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

 arch/arm64/include/asm/preempt.h     |  18 ++
 arch/openrisc/include/asm/smp.h      |   2 +
 arch/s390/include/asm/preempt.h      |  10 +
 arch/x86/include/asm/preempt.h       |  10 +
 include/asm-generic/preempt.h        |  14 ++
 include/linux/hardirq.h              |  16 +-
 include/linux/interrupt_rc.h         |  63 ++++++
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
 rust/kernel/sync/lock.rs             |  71 ++++++-
 rust/kernel/sync/lock/global.rs      |  95 +++++----
 rust/kernel/sync/lock/spinlock.rs    | 275 +++++++++++++++++++++++++++
 26 files changed, 917 insertions(+), 56 deletions(-)
 create mode 100644 include/linux/interrupt_rc.h
 create mode 100644 kernel/irq/refcount_interrupt_test.c
 create mode 100644 rust/helpers/interrupt.c
 create mode 100644 rust/kernel/interrupt.rs


base-commit: 2ad6c5cdc89acfefb01b84afa5e55262c40d6fec
-- 
2.52.0

