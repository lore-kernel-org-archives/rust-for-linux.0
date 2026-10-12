Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094BD3CF963;
	Mon, 12 Oct 2026 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800861; cv=none; b=eU91kGAeCgbeX3pJQ4UW4Jc9X1D6y/J8OXfOZnUAMlp0nCWg9aEiqy7T72GQPLpeejgkA7LG1Eoo8ijvwKURy6qbdGMbFraPLbLEC3DuE0pjONrljmm6R7AfuIkuW1XX9knLBoJZqekXG67oJoLXM/VnGiaUP1vhVyjWotRf7Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800861; c=relaxed/simple;
	bh=dgMz3nPnrNOx/1VfDTKQ6jRvZ4kKUWbZkvhpGHS0IlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IeJXSnpKnMNZc/528M2eLtb42zwHpx2b0HAqslkfEjXf4y0vK+VkPhiVJuAGNaUMm3e0IXRij8lTPa/0BfPkJjIjP1cjMY21sr7c8knrJ5G6rhVdF0cLBceCuX6BU9cGnp7nP94AK1gMW1CEbWAQVCYUqa2u6gzFFnOZh6Vm3L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=bl8n8W5J; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="bl8n8W5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791800846; x=1792060046;
	bh=sSzEDFwo1wxDw1YgeO/QFIRZPpKHW/eyhVfRXWZL61Q=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bl8n8W5Jd8RJ7O4iC6lvtD3EPZ7/vJXGfRnHrdixZywLY7OrP5KqsQUG0voNIAmsc
	 A4K9RI7CtFJ4688BSMe2DG4aRxuyHbHNXn5KBSI82IoXpTO2HmDfut+Nbr5DPoqK/B
	 0mflauFuQQntZvbGVC3TfXXRWenEMGMZUhdX4K//S9x85KS0AmfsbAbZwVRL+xKwxl
	 18OQ7giuz0t9LPMzj1pMvy1p0fp3yxJRHsTCNNwhRomjrFQYxx2MQuR8UNZBKfaGEI
	 54+CmmXAVc8fndSiHlzuzSZQA2Avj9fIQeZOqjFkSy8Zqb0aGkkkDggDIXQVbE9CRf
	 43Gi4uK+XQAuQ==
X-Pm-Submission-Id: 4j3DDW2kkxz2ScX3
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/6] rust: add ww_mutex support
Date: Mon, 12 Oct 2026 13:26:27 +0300
Message-ID: <cover.1791799751.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds Rust abstractions for ww_mutex, including Class, Mutex,
AcquireCtx and MutexGuard. LockSet handles deadlock recovery for callers
that need to acquire multiple locks.

Changes in v12 (sashiko fixes):
  - Give Rust-defined classes separate _acquire and _mutex lockdep names
    to match the C initializer.
  - Correct the Class Sync safety comment and add an invariant comment
    when constructing MutexGuard.
  - Add #[inline] to Class::from_raw(), Mutex::is_locked(),
    AcquireCtx::done(), MutexGuard::drop() and RawGuard::drop().

Built x86_64 kernels with and without PREEMPT_RT. rustfmtcheck, Clippy and
rustdoc passed. All 14 ww_mutex/LockSet KUnit tests passed on both builds
with CONFIG_PROVE_LOCKING and CONFIG_DEBUG_WW_MUTEX_SLOWPATH enabled.

Previous version:
https://lore.kernel.org/all/cover.1791743500.git.work@onurozkan.dev/

Onur Özkan (6):
  rust: add C wrappers for ww_mutex inline functions
  ww_mutex: add ww_class field unconditionally
  rust: implement Class for ww_class support
  rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
  rust: ww_mutex: implement LockSet
  MAINTAINERS: add Onur Özkan as WW MUTEX maintainer

 MAINTAINERS                                   |   2 +
 include/linux/ww_mutex.h                      |   8 +-
 rust/helpers/helpers.c                        |   1 +
 rust/helpers/ww_mutex.c                       |  33 ++
 rust/kernel/sync/lock.rs                      |   1 +
 rust/kernel/sync/lock/ww_mutex.rs             | 447 +++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 149 ++++++
 rust/kernel/sync/lock/ww_mutex/class.rs       | 151 ++++++
 rust/kernel/sync/lock/ww_mutex/lock_set.rs    | 449 ++++++++++++++++++
 9 files changed, 1235 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/ww_mutex.c
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs

Range-diff against v11:
1:  4942155a8873e = 1:  4942155a8873e rust: add C wrappers for ww_mutex inline functions
2:  168394bb52a6c = 2:  168394bb52a6c ww_mutex: add ww_class field unconditionally
3:  003bc88697dc8 ! 3:  ba8ea8e2e2b50 rust: implement Class for ww_class support
    @@ rust/kernel/sync/lock/ww_mutex/class.rs (new)
     +            // SAFETY: This is `static`, so address is fixed and won't move.
     +            unsafe {
     +                $crate::sync::lock::ww_mutex::Class::new_unpinned(
    -+                    $crate::c_str!(::core::stringify!($name)),
    ++                    $crate::c_str!(::core::concat!(::core::stringify!($name), "_acquire")),
    ++                    $crate::c_str!(::core::concat!(::core::stringify!($name), "_mutex")),
     +                    false,
     +                )
     +            };
    @@ rust/kernel/sync/lock/ww_mutex/class.rs (new)
     +            // SAFETY: This is `static`, so address is fixed and won't move.
     +            unsafe {
     +                $crate::sync::lock::ww_mutex::Class::new_unpinned(
    -+                    $crate::c_str!(::core::stringify!($name)),
    ++                    $crate::c_str!(::core::concat!(::core::stringify!($name), "_acquire")),
    ++                    $crate::c_str!(::core::concat!(::core::stringify!($name), "_mutex")),
     +                    true,
     +                )
     +            };
    @@ rust/kernel/sync/lock/ww_mutex/class.rs (new)
     +    ///
     +    /// Caller must guarantee that the returned value must be pinned before
     +    /// its first use.
    -+    pub const unsafe fn new_unpinned(name: &'static CStr, is_wait_die: bool) -> Self {
    ++    pub const unsafe fn new_unpinned(
    ++        acquire_name: &'static CStr,
    ++        mutex_name: &'static CStr,
    ++        is_wait_die: bool,
    ++    ) -> Self {
     +        Class {
     +            inner: Opaque::new(bindings::ww_class {
     +                stamp: bindings::atomic_long_t { counter: 0 },
    -+                acquire_name: crate::str::as_char_ptr_in_const_context(name),
    -+                mutex_name: crate::str::as_char_ptr_in_const_context(name),
    ++                acquire_name: crate::str::as_char_ptr_in_const_context(acquire_name),
    ++                mutex_name: crate::str::as_char_ptr_in_const_context(mutex_name),
     +                is_wait_die: is_wait_die as u32,
     +                // TODO: Replace with `bindings::lock_class_key::default()` once
     +                // stabilized for `const`.
    @@ rust/kernel/sync/lock/ww_mutex/class.rs (new)
     +    ///
     +    /// The caller must ensure that `ptr` points to the `inner` field of
     +    /// [`Class`] and that it remains valid for the lifetime `'a`.
    ++    #[inline]
     +    pub const unsafe fn from_raw<'a>(ptr: *mut bindings::ww_class) -> &'a Self {
     +        // SAFETY: By the safety contract, `ptr` is valid to construct `Class`.
     +        unsafe { &*ptr.cast() }
     +    }
     +}
     +
    -+// SAFETY: [`Class`] is set up once and never modified. It's fine to share it across threads.
    ++// SAFETY: [`Class`] is immutable except for its atomic stamp. It's fine to share it across threads.
     +unsafe impl Sync for Class {}
     +// SAFETY: Doesn't hold anything thread-specific. It's safe to send to other threads.
     +unsafe impl Send for Class {}
4:  293fbbc0bcc0f ! 4:  36bddd73ca296 rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
    @@ rust/kernel/sync/lock/ww_mutex.rs
     +    ///
     +    /// The returned value is racy as another thread can acquire
     +    /// or release the lock immediately after this call returns.
    ++    #[inline]
     +    pub fn is_locked(&self) -> bool {
     +        // SAFETY: It's safe to call `ww_mutex_is_locked` on
     +        // a valid mutex.
    @@ rust/kernel/sync/lock/ww_mutex.rs
     +    fn new(mutex: &'a Mutex<'a, T>) -> Self {
     +        assert!(mutex.is_locked());
     +
    ++        // INVARIANT: `lock_common` and `from_raw` ensure that the current task holds the mutex
    ++        // and transfer sole responsibility for unlocking it to this guard.
     +        Self {
     +            mutex,
     +            _not_send: NotThreadSafe,
    @@ rust/kernel/sync/lock/ww_mutex.rs
     +}
     +
     +impl<T: ?Sized> Drop for MutexGuard<'_, T> {
    ++    #[inline]
     +    fn drop(&mut self) {
     +        // SAFETY: self.mutex is locked and are about to release it.
     +        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };
    @@ rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs (new)
     +    ///
     +    /// After calling this function, no more mutexes can be acquired with
     +    /// this context.
    ++    #[inline]
     +    pub fn done(&self) {
     +        // SAFETY: `self.inner` contains a valid, initialized acquire context.
     +        unsafe { bindings::ww_acquire_done(self.inner.get()) };
5:  d085c15ba9da4 ! 5:  8a3e94391fcee rust: ww_mutex: implement LockSet
    @@ rust/kernel/sync/lock/ww_mutex/lock_set.rs (new)
     +}
     +
     +impl Drop for RawGuard {
    ++    #[inline]
     +    fn drop(&mut self) {
     +        // SAFETY: `mutex_ptr` originates from a locked `Mutex` and remains
     +        // valid for the lifetime of this guard, so unlocking here is sound.
6:  8f0e93bd1781e = 6:  2b7b779f72f77 MAINTAINERS: add Onur Özkan as WW MUTEX maintainer

base-commit: 47324d3a5b3abd781295044d01d92d09f184e872
-- 
2.51.2

