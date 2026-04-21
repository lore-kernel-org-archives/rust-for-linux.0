Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2747935F61A
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776753520; cv=none; b=Nj57AIjOzOoDA3pkNk/8iqJRCA1PWrmWsRYMz4nYgo1Tq+OlsfarIDpVYTDCipGUTX23fXIns2yqga4eFpHNvC6RgQ3mYbzrFVuLtOCumcVrKEzOmkSs1LZUfCrLv9O0mkztdUtuoufrs+b1ApdnNWzhq9myrcUHSfpNM6lnEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776753520; c=relaxed/simple;
	bh=xg/ZByNETLB0huMMbq+kZi2lpGoptgsURjwnYauWkK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IxlH7pP09R6g+buvQv6k9z5FuePN6e4wTYSUaEVc1bozta3ed3Ynj09FUsOYXyrZA2tOAMj7MBmvxTWfjiLrf3T++JVDwvXQQzyrM6FGSGJQPh4bCeP90FKItGcag1HFp4CJAWgYMLgPdz3kv68ZvAYuf9v/tr9T074OQsl5BAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fA9Hw4g/; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA9Hw4g/"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8ee9ec26edaso25042285a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Apr 2026 23:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776753518; x=1777358318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmwvOTrvTqLdfW0hMkYtXjjgzkWWT2XP1JL6i/qfBmI=;
        b=fA9Hw4g/+jat8cDQqltPP307VJB7Bh8xetrL5jtjdePjU8/w7dHH/e0+96bfrjX+bx
         mbTJSKXYyHIIn1S01oPpVWFZD5Z+XaR/C9lR4Za1RjamI3wAEfqo7z9n6N5OQQvUmyel
         SnzxE8sYB8rlP2aHaucQd229Njlk6aLrs9Ys85O2zGmNID3w3b6iBvlpX4LQLZlAnxF+
         2Vb2OPqVN4bXOHqajLQUa8kosjgyFum960dMgOw/RDtk+yy6mKF73NnuTNnc8pmpimz8
         YaONTAxxw6XRUB3FNmrmb+KpUlyG0qNvtFSCRkvEuUhVJuct1PTDroBVEdrRZ/wZI/D6
         Y1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776753518; x=1777358318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmwvOTrvTqLdfW0hMkYtXjjgzkWWT2XP1JL6i/qfBmI=;
        b=TSuD4slcYOtOnvlHkRMBmVv8HBCryQO4fPTKfM7zZ5CjWPXmkn/pPMfIXIdedBhlEE
         0mAzAp2qs01lkXaQ3SBhPUrBfTVKtQtna1Ujcvi0bZKAMSQVS7CgNmxXZR1F8Gk9EQPT
         mdKVgB+2ei9RfDakxeDqV1bMJTmAPtuluqxjhs92it7nFIlhI1AsseGfdTuj0OXE0fit
         3lHAfxNgmtaK0Q6pAu+IraSY45wjgjACJYcNm3JPMOgVlDBnm7hGk/XfaIFtw5nxYeWp
         FOorwcErcJHnveSPCBJxR7+ToMZLcea/TpH8vXN99OiWYfujqubQhSUMWFc/dl834OxD
         h2ww==
X-Forwarded-Encrypted: i=1; AFNElJ9Oo6+XLlwsal/NmwgRxiNWQAzHMJvwE12jVHCoCdm1TgivzO2Fhhh0Cd70t7Gvh9bvZLn9c9q+ZwdcVu0Tbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzytHloVbHBc+wWDwwm9N+KdVV2DLuxST/ZKa9ic/DgOIQ1xsU6
	EFQI1pX41gyArr8F3OPfdSrJK90vE1Q6WFdrD7b0nDo5unlL/GSoecGa
X-Gm-Gg: AeBDietnxmLpOBvWxg41SlzNbZ9X39Pmr79rM4YHU9TnatJWEp1bFE925s10z5AP2QD
	hSoJJ3H76snXy0eGR13yD+RpZ5fYhHHTVDbzRBlVQ7K1ypTNFBKiCWXKJBtsfaslCAG5XAZNuMM
	UhWO+H0qT2AfbBksM9cdh8or4rYPROsz+0YJvHFh+qk5XDcxeOG9WwoZ8anXGiiF0tonZUiwdNi
	JdYDECznGUqJKb27Gy28btDuFWL/KD2dI0wnSTD1p7BibfTvKer3jbMBC5fTA6VwYsbg3R8a3Ol
	/nWU9Dn/S1sqESY1bianvjCyTCYFIpTAptHFYKZwUZJ25e3KCYQEl/BJlRzccGGUPQq1NRbNyP2
	b8S2gT4dG3SWvvBUquEq6s+Z3fRFseGdqKQdoahBdDlSuDsEqECz9NxdkyNSGbmuFjRTrYBSj6/
	lloBPfVhDkdGoq8BfOz9e205mH5yQSkx8LCTZdbo7g5cDqXn6rGT9bQmDloy34cLKyOspBf/MUq
	nZgfS8MLgtVIeyBgr5nhAe76ZeLMbMHMDQw9XE=
X-Received: by 2002:a05:620a:198a:b0:8cd:d872:c2c9 with SMTP id af79cd13be357-8e791d8a342mr2215133185a.50.1776753518062;
        Mon, 20 Apr 2026 23:38:38 -0700 (PDT)
Received: from TDC4045031631.e0cglfehwr0e5gttmepj3hi3hf.ux.internal.cloudapp.net ([20.63.37.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe9800sm999108185a.5.2026.04.20.23.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:38:37 -0700 (PDT)
From: Ashutosh Desai <ashutoshdesai993@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Ashutosh Desai <ashutoshdesai993@gmail.com>
Subject: [PATCH] rust: add task_work abstraction
Date: Tue, 21 Apr 2026 06:38:36 +0000
Message-Id: <20260421063836.742965-1-ashutoshdesai993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel's task_work API (include/linux/task_work.h) allows any
kernel thread to queue a callback that runs on a specific task the
next time it returns to user space (or on exit). The C interface
requires manual lifetime management of the callback_head allocation
and careful ordering of init_task_work() and task_work_add().

Add a safe Rust abstraction consisting of:

 - TaskWork<T>: an owned, heap-allocated work item. Allocating
   with TaskWork::new() ties a user-supplied value T (bound by the
   new TaskWorkItem trait) to a callback_head. Scheduling with
   TaskWork::add() initializes the callback, transfers ownership to
   the kernel, and returns Err((ESRCH, data)) if the target task is
   already exiting, so callers can always recover the value.

 - TaskWorkItem: a trait for types that can be scheduled as a task
   work item. Implementors provide a run() method that receives the
   inner value by move when the callback fires.

 - NotifyMode: a type-safe enum wrapping task_work_notify_mode,
   covering TWA_NONE, TWA_RESUME, TWA_SIGNAL, TWA_SIGNAL_NO_IPI,
   and TWA_NMI_CURRENT.

The repr(C) layout of the internal TaskWorkInner<T> places
callback_head at offset 0, which lets the C callback pointer be
cast back to the full allocation. Option<T> in that struct permits
moving the data out before dropping the allocation without a Drop
impl on TaskWork<T>.

Signed-off-by: Ashutosh Desai <ashutoshdesai993@gmail.com>
---
 rust/kernel/lib.rs       |   1 +
 rust/kernel/task_work.rs | 158 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 rust/kernel/task_work.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index d93292d47420..22878fd73528 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -154,6 +154,7 @@
 pub mod str;
 pub mod sync;
 pub mod task;
+pub mod task_work;
 pub mod time;
 pub mod tracepoint;
 pub mod transmute;
diff --git a/rust/kernel/task_work.rs b/rust/kernel/task_work.rs
new file mode 100644
index 000000000000..59635d5fed13
--- /dev/null
+++ b/rust/kernel/task_work.rs
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Ashutosh Desai <ashutoshdesai993@gmail.com>
+
+//! Task work.
+//!
+//! Wraps the kernel's task work API, which lets you schedule a callback to run
+//! on a task the next time it returns to userspace.
+//!
+//! The entry point is [`TaskWork`]. Allocate one with [`TaskWork::new`] and
+//! schedule it with [`TaskWork::add`]. On success the kernel takes ownership
+//! and calls [`TaskWorkItem::run`] when the task returns to userspace.
+//!
+//! C header: [`include/linux/task_work.h`](srctree/include/linux/task_work.h)
+
+use crate::{
+    alloc::{AllocError, Flags, KBox},
+    bindings,
+    error::{code::ESRCH, Error},
+    task::Task,
+    types::Opaque,
+};
+
+/// Notification mode passed to [`TaskWork::add`].
+///
+/// Controls how the target task is woken after the work item is queued.
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub enum NotifyMode {
+    /// No extra wakeup; the work runs when the task returns to userspace naturally.
+    None,
+    /// Resume the task if it is sleeping in a restartable syscall.
+    Resume,
+    /// Send a signal to force the task out of the current syscall.
+    Signal,
+    /// Like [`NotifyMode::Signal`] but without an inter-processor interrupt when
+    /// the target is running on a remote CPU.
+    SignalNoIpi,
+    /// Run the work immediately on the current CPU from NMI context. Only valid
+    /// when scheduling on the current task from an NMI handler.
+    NmiCurrent,
+}
+
+impl NotifyMode {
+    fn as_raw(self) -> bindings::task_work_notify_mode {
+        match self {
+            NotifyMode::None => bindings::task_work_notify_mode_TWA_NONE,
+            NotifyMode::Resume => bindings::task_work_notify_mode_TWA_RESUME,
+            NotifyMode::Signal => bindings::task_work_notify_mode_TWA_SIGNAL,
+            NotifyMode::SignalNoIpi => bindings::task_work_notify_mode_TWA_SIGNAL_NO_IPI,
+            NotifyMode::NmiCurrent => bindings::task_work_notify_mode_TWA_NMI_CURRENT,
+        }
+    }
+}
+
+/// Implemented by types that can be scheduled as a task work item.
+///
+/// The implementing type is heap-allocated by [`TaskWork::new`] and passed by
+/// value to [`run`] when the target task returns to userspace. Implementors
+/// must be [`Send`] because the callback can run on any CPU.
+///
+/// [`run`]: TaskWorkItem::run
+pub trait TaskWorkItem: Sized + Send {
+    /// Called when the target task returns to userspace.
+    fn run(this: Self);
+}
+
+// The kernel's `struct callback_head` is the first field so that a
+// `*mut callback_head` handed back by the kernel can be cast directly to
+// `*mut TaskWorkInner<T>`.
+#[repr(C)]
+struct TaskWorkInner<T> {
+    callback_head: Opaque<bindings::callback_head>,
+    // Wrapped in Option so that we can move T out before the allocation is
+    // freed, without needing a Drop impl on TaskWork (which would block
+    // moving self.inner in add()).
+    data: Option<T>,
+}
+
+/// A heap-allocated task work item ready to be scheduled on a [`Task`].
+///
+/// Dropping this before calling [`add`] drops the inner value normally.
+///
+/// # C counterpart
+///
+/// Wraps `struct callback_head` from `<linux/task_work.h>`.
+///
+/// [`add`]: TaskWork::add
+#[doc(alias = "callback_head")]
+pub struct TaskWork<T: TaskWorkItem> {
+    inner: KBox<TaskWorkInner<T>>,
+}
+
+impl<T: TaskWorkItem> TaskWork<T> {
+    /// Allocates a new task work item wrapping `data`.
+    pub fn new(data: T, flags: Flags) -> Result<Self, AllocError> {
+        Ok(Self {
+            inner: KBox::new(
+                TaskWorkInner {
+                    callback_head: Opaque::uninit(),
+                    data: Some(data),
+                },
+                flags,
+            )?,
+        })
+    }
+
+    /// Schedules this item to run when `task` next returns to userspace.
+    ///
+    /// On success, ownership passes to the kernel and [`TaskWorkItem::run`] will
+    /// be called with the inner data when the task returns to userspace or exits.
+    ///
+    /// On failure (`ESRCH`), the task is exiting and the inner data is returned
+    /// so the caller can clean up.
+    pub fn add(self, task: &Task, mode: NotifyMode) -> Result<(), (Error, T)> {
+        let inner = KBox::into_raw(self.inner);
+
+        // SAFETY: We have exclusive access to the allocation and are writing
+        // the callback pointer before passing it to the kernel.
+        unsafe {
+            bindings::init_task_work(
+                Opaque::cast_into(core::ptr::addr_of!((*inner).callback_head)),
+                Some(run_callback::<T>),
+            );
+        }
+
+        // SAFETY: The callback_head is initialized above and sits at offset 0
+        // of the repr(C) TaskWorkInner<T>. On success the kernel owns the
+        // allocation until run_callback fires; on failure we reclaim it below.
+        let ret = unsafe {
+            bindings::task_work_add(
+                task.as_ptr(),
+                Opaque::cast_into(core::ptr::addr_of!((*inner).callback_head)),
+                mode.as_raw(),
+            )
+        };
+
+        if ret != 0 {
+            // SAFETY: task_work_add failed so we still own the allocation.
+            let mut boxed = unsafe { KBox::from_raw(inner) };
+            let data = boxed.data.take().expect("data present before add");
+            return Err((ESRCH, data));
+        }
+
+        Ok(())
+    }
+}
+
+// SAFETY: cb points at the callback_head field of a TaskWorkInner<T> allocated
+// by TaskWork::new and successfully handed to task_work_add. The kernel gives us
+// back exclusive ownership of the allocation here.
+unsafe extern "C" fn run_callback<T: TaskWorkItem>(cb: *mut bindings::callback_head) {
+    // SAFETY: callback_head is at offset 0 of the repr(C) TaskWorkInner<T> and
+    // Opaque<T> is repr(transparent), so the cast is valid.
+    let mut inner = unsafe { KBox::from_raw(cb.cast::<TaskWorkInner<T>>()) };
+    let data = inner.data.take().expect("data present in callback");
+    drop(inner);
+    T::run(data);
+}

base-commit: 7f87a5ea75f011d2c9bc8ac0167e5e2d1adb1594
prerequisite-patch-id: 161541863a5d4d8c2a41c6f5cfdf712463bf50c9
prerequisite-patch-id: 3b286037e1aeb5a942ff450ced7ec52048bfea7a
prerequisite-patch-id: 14ac8c330c1207cbba2096c4771e000ae82bb765
-- 
2.34.1

