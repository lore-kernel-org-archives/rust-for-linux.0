Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E072134E743
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368044; cv=none; b=A2sNiUYSs1OprjAHx/oiByltXh5VM/0J8ENkXHijySdEh+OIgexPwMG4WzEkKKFKfvDcGUf295aWwrj3t6Y2aq6cT4ZGe2DcpECs/MDpuoOS4Zgc1MpZvNI4I3uHxmtGncFl5AUByIctghhYL6czcFS0q4TlPq5vEovTSSyyp+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368044; c=relaxed/simple;
	bh=mtCZJUO/R6b7KZ3hjZajoGvgJPMHeo/lMbvQKPTceho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q2vtfFmE61EegISl4Ei8YRDyoZMFVtnx8X+GiOacnux/f/Kd05T2/Y8CiBiWgJwu7lxcI7iQeU2sGdm3p0b8ebJSc7IJGNgalxHob9Tq63bxUVXxdnzxHV7NzeQ523ssB86KyFy8wR/pFdfiUA/we5P+VbqwFkSZAtWYVOBkYC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 6 Feb 2026 17:54:02 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.57)
	by 156.147.1.121 with ESMTP; 6 Feb 2026 17:54:02 +0900
X-Original-SENDERIP: 10.159.44.57
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: aliceryhl@google.com,
	a.hindborg@kernel.org,
	arve@android.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	cmllamas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	tamird@gmail.com,
	tkjos@android.com,
	tmgross@umich.edu,
	viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se,
	yury.norov@gmail.com,
	ojeda@kernel.org,
	lossin@kernel.org
Cc: heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jongan.kim@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com
Subject: [PATCH v4 2/3] rust: pid: add Pid abstraction and init_ns helper
Date: Fri,  6 Feb 2026 17:53:35 +0900
Message-Id: <20260206085336.32819-3-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260206085336.32819-1-jongan.kim@lge.com>
References: <20260206085336.32819-1-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HeeSu Kim <heesu0025.kim@lge.com>

Add a new Pid abstraction in rust/kernel/pid.rs that wraps the
kernel's struct pid and provides safe Rust interfaces for:
- find_vpid: Find a pid by number under RCU protection
- pid_task: Get the task associated with a pid under RCU protection

Also add init_ns() associated function to PidNamespace to get
a reference to the init PID namespace.

These abstractions use lifetime-bounded references tied to RCU guards
to ensure memory safety when accessing RCU-protected data structures.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/lkml/aXs3OjlGzQVABAwR@google.com/
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/lkml/DG15B78C8IK4.ITL5HKRZ1QKP@garyguo.net/
Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
---
v3 -> v4:
- Add __rust_helper annotation to rust_helper_get_pid

v2 -> v3:
- Add Send/Sync traits for Pid
- Add AlwaysRefCounted for Pid with rust_helper_get_pid
- Add from_raw() constructor to Pid and Task
- Rename find_vpid_with_guard -> find_vpid
- Rename pid_task_with_guard -> pid_task
- Convert init_pid_ns() to PidNamespace::init_ns()
- Add PartialEq/Eq for PidNamespace
- Add rust/helpers/pid.c for get_pid() wrapper

 rust/helpers/helpers.c       |   1 +
 rust/helpers/pid.c           |  13 ++++
 rust/kernel/lib.rs           |   1 +
 rust/kernel/pid.rs           | 138 +++++++++++++++++++++++++++++++++++
 rust/kernel/pid_namespace.rs |  17 +++++
 rust/kernel/task.rs          |  13 ++++
 6 files changed, 183 insertions(+)
 create mode 100644 rust/helpers/pid.c
 create mode 100644 rust/kernel/pid.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c..3138b88df24f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -38,6 +38,7 @@
 #include "of.c"
 #include "page.c"
 #include "pci.c"
+#include "pid.c"
 #include "pid_namespace.c"
 #include "platform.c"
 #include "poll.c"
diff --git a/rust/helpers/pid.c b/rust/helpers/pid.c
new file mode 100644
index 000000000000..1fb1502da819
--- /dev/null
+++ b/rust/helpers/pid.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/pid.h>
+
+#ifndef __rust_helper
+#define __rust_helper
+#endif
+
+/* Get a reference on a struct pid. */
+__rust_helper struct pid *rust_helper_get_pid(struct pid *pid)
+{
+	return get_pid(pid);
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf120042..60a518d65d0e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -122,6 +122,7 @@
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
+pub mod pid;
 pub mod pid_namespace;
 pub mod platform;
 pub mod prelude;
diff --git a/rust/kernel/pid.rs b/rust/kernel/pid.rs
new file mode 100644
index 000000000000..253dbf689383
--- /dev/null
+++ b/rust/kernel/pid.rs
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Process identifiers (PIDs).
+//!
+//! C header: [`include/linux/pid.h`](srctree/include/linux/pid.h)
+
+use crate::{
+    bindings,
+    sync::{aref::AlwaysRefCounted, rcu},
+    task::Task,
+    types::Opaque,
+};
+use core::ptr::NonNull;
+
+/// Wraps the kernel's `struct pid`.
+///
+/// This structure represents the Rust abstraction for a C `struct pid`.
+/// A `Pid` represents a process identifier that can be looked up in different
+/// PID namespaces.
+#[repr(transparent)]
+pub struct Pid {
+    inner: Opaque<bindings::pid>,
+}
+
+// SAFETY: `struct pid` is safely accessible from any thread.
+unsafe impl Send for Pid {}
+
+// SAFETY: `struct pid` is safely accessible from any thread.
+unsafe impl Sync for Pid {}
+
+impl Pid {
+    /// Returns a raw pointer to the inner C struct.
+    #[inline]
+    pub fn as_ptr(&self) -> *mut bindings::pid {
+        self.inner.get()
+    }
+
+    /// Creates a reference to a [`Pid`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`Pid`] reference.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::pid) -> &'a Self {
+        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
+        // `Pid` type being transparent makes the cast ok.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Finds a `struct pid` by its pid number within the current task's PID namespace.
+    ///
+    /// Returns `None` if no such pid exists.
+    ///
+    /// The returned reference is only valid for the duration of the RCU read-side
+    /// critical section represented by the `rcu::Guard`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::pid::Pid;
+    /// use kernel::sync::rcu;
+    ///
+    /// let guard = rcu::read_lock();
+    /// if let Some(pid) = Pid::find_vpid(1, &guard) {
+    ///     pr_info!("Found pid 1\n");
+    /// }
+    /// ```
+    ///
+    /// Returns `None` for non-existent PIDs:
+    ///
+    /// ```
+    /// use kernel::pid::Pid;
+    /// use kernel::sync::rcu;
+    ///
+    /// let guard = rcu::read_lock();
+    /// // PID 0 (swapper/idle) is not visible via find_vpid.
+    /// assert!(Pid::find_vpid(0, &guard).is_none());
+    /// ```
+    #[inline]
+    pub fn find_vpid<'a>(nr: i32, _rcu_guard: &'a rcu::Guard) -> Option<&'a Self> {
+        // SAFETY: Called under RCU protection as guaranteed by the Guard reference.
+        let ptr = unsafe { bindings::find_vpid(nr) };
+        if ptr.is_null() {
+            None
+        } else {
+            // SAFETY: `find_vpid` returns a valid pointer under RCU protection.
+            Some(unsafe { Self::from_raw(ptr) })
+        }
+    }
+
+    /// Gets the task associated with this PID.
+    ///
+    /// Returns `None` if no task is associated with this PID.
+    ///
+    /// The returned reference is only valid for the duration of the RCU read-side
+    /// critical section represented by the `rcu::Guard`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::pid::Pid;
+    /// use kernel::sync::rcu;
+    ///
+    /// let guard = rcu::read_lock();
+    /// if let Some(pid) = Pid::find_vpid(1, &guard) {
+    ///     if let Some(task) = pid.pid_task(&guard) {
+    ///         pr_info!("Found task for pid 1\n");
+    ///     }
+    /// }
+    /// ```
+    #[inline]
+    pub fn pid_task<'a>(&'a self, _rcu_guard: &'a rcu::Guard) -> Option<&'a Task> {
+        // SAFETY: Called under RCU protection as guaranteed by the Guard reference.
+        let task_ptr = unsafe { bindings::pid_task(self.as_ptr(), bindings::pid_type_PIDTYPE_PID) };
+        if task_ptr.is_null() {
+            None
+        } else {
+            // SAFETY: `pid_task` returns a valid pointer under RCU protection.
+            Some(unsafe { Task::from_raw(task_ptr) })
+        }
+    }
+}
+
+// SAFETY: The type invariants guarantee that `Pid` is always refcounted.
+unsafe impl AlwaysRefCounted for Pid {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
+        unsafe { bindings::get_pid(self.as_ptr()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
+        unsafe { bindings::put_pid(obj.cast().as_ptr()) }
+    }
+}
diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
index 979a9718f153..fc815945d614 100644
--- a/rust/kernel/pid_namespace.rs
+++ b/rust/kernel/pid_namespace.rs
@@ -38,6 +38,15 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::pid_namespace) -> &'a Self {
         // `PidNamespace` type being transparent makes the cast ok.
         unsafe { &*ptr.cast() }
     }
+
+    /// Returns a reference to the init PID namespace.
+    ///
+    /// This is the root PID namespace that exists throughout the lifetime of the kernel.
+    #[inline]
+    pub fn init_ns() -> &'static Self {
+        // SAFETY: `init_pid_ns` is a global static that is valid for the lifetime of the kernel.
+        unsafe { Self::from_ptr(&raw const bindings::init_pid_ns) }
+    }
 }
 
 // SAFETY: Instances of `PidNamespace` are always reference-counted.
@@ -63,3 +72,11 @@ unsafe impl Send for PidNamespace {}
 // SAFETY: It's OK to access `PidNamespace` through shared references from other threads because
 // we're either accessing properties that don't change or that are properly synchronised by C code.
 unsafe impl Sync for PidNamespace {}
+
+impl PartialEq for PidNamespace {
+    fn eq(&self, other: &Self) -> bool {
+        self.as_ptr() == other.as_ptr()
+    }
+}
+
+impl Eq for PidNamespace {}
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 49fad6de0674..92a7d27ac3b3 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -204,6 +204,19 @@ pub fn as_ptr(&self) -> *mut bindings::task_struct {
         self.0.get()
     }
 
+    /// Creates a reference to a [`Task`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`Task`] reference.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::task_struct) -> &'a Self {
+        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
+        // `Task` type being transparent makes the cast ok.
+        unsafe { &*ptr.cast() }
+    }
+
     /// Returns the group leader of the given task.
     pub fn group_leader(&self) -> &Task {
         // SAFETY: The group leader of a task never changes after initialization, so reading this
-- 
2.25.1

