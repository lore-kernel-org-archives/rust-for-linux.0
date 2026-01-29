Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D13803C7
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677888; cv=none; b=F7C3A/NyYBXuM+HsUN5jx8oguYs8AIpuoltFncCx/eyszKHKjife/gR2NlJmYiAYkgkQVVBJ5ZwsHq8fDHHkOGCScFKChArdGV08jFMcAp6BePhruLQlt0O6x/kUbh714fETn78sjpDe6CeKt2ZPCosX619rE95t/erzqJYSFTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677888; c=relaxed/simple;
	bh=oidqWeDXFJh9vIZTJJ/F/UAlYmkMB0+bEY8za2Ydd6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UbYyLt9F6y70TrzCyBnuv4C8NEhQB0/I9jFtYyqoTXt1sMU1nWGZO5B1aaZsQEu6V+pVPp6SPQN0LqQCdkW50bZeUAJnqnma18gtjpCATNygdAgKycuDyI4EGlXsEtMGnFMf1tDJYedHCel2GZB2AoBkaU7/2Qy0UhT/8C6jNzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 29 Jan 2026 17:41:21 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.48)
	by 156.147.1.127 with ESMTP; 29 Jan 2026 17:41:21 +0900
X-Original-SENDERIP: 10.159.44.48
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: aliceryhl@google.com,
	arve@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org,
	tkjos@android.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	yury.norov@gmail.com,
	vitaly.wool@konsulko.se,
	tamird@gmail.com,
	viresh.kumar@linaro.org,
	daniel.almeida@collabora.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	jongan.kim@lge.com,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com
Subject: [PATCH v2 2/3] rust: pid: add Pid abstraction and init_pid_ns helper
Date: Thu, 29 Jan 2026 17:41:18 +0900
Message-Id: <20260129084119.32994-3-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260129084119.32994-1-jongan.kim@lge.com>
References: <20260129084119.32994-1-jongan.kim@lge.com>
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
- find_vpid_with_guard: Find a pid by number under RCU protection
- pid_task_with_guard: Get the task associated with a pid under RCU
  protection

Also add init_pid_ns() helper function to pid_namespace.rs to get
a reference to the init PID namespace.

These abstractions use lifetime-bounded references tied to RCU guards
to ensure memory safety when accessing RCU-protected data structures.

Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
---
 rust/kernel/lib.rs           |   1 +
 rust/kernel/pid.rs           | 100 +++++++++++++++++++++++++++++++++++
 rust/kernel/pid_namespace.rs |   9 ++++
 3 files changed, 110 insertions(+)
 create mode 100644 rust/kernel/pid.rs

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
index 000000000000..00989b953c23
--- /dev/null
+++ b/rust/kernel/pid.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Process identifiers (PIDs).
+//!
+//! C header: [`include/linux/pid.h`](srctree/include/linux/pid.h)
+
+use crate::{bindings, ffi::c_int, sync::rcu, task::Task, types::Opaque};
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
+impl Pid {
+    /// Returns a raw pointer to the inner C struct.
+    #[inline]
+    pub fn as_ptr(&self) -> *mut bindings::pid {
+        self.inner.get()
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
+    /// if let Some(pid) = Pid::find_vpid_with_guard(1, &guard) {
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
+    /// assert!(Pid::find_vpid_with_guard(0, &guard).is_none());
+    /// ```
+    #[inline]
+    pub fn find_vpid_with_guard<'a>(nr: i32, _rcu_guard: &'a rcu::Guard) -> Option<&'a Self> {
+        // SAFETY: Called under RCU protection as guaranteed by the Guard reference.
+        let ptr = unsafe { bindings::find_vpid(nr as c_int) };
+        if ptr.is_null() {
+            None
+        } else {
+            // SAFETY: `find_vpid` returns a valid pointer under RCU protection,
+            // and `Pid` is `#[repr(transparent)]` over `bindings::pid`.
+            Some(unsafe { &*(ptr as *const Self) })
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
+    /// if let Some(pid) = Pid::find_vpid_with_guard(1, &guard) {
+    ///     if let Some(task) = pid.pid_task_with_guard(&guard) {
+    ///         pr_info!("Found task for pid 1\n");
+    ///     }
+    /// }
+    /// ```
+    #[inline]
+    pub fn pid_task_with_guard<'a>(&'a self, _rcu_guard: &'a rcu::Guard) -> Option<&'a Task> {
+        // SAFETY: Called under RCU protection as guaranteed by the Guard reference.
+        let task_ptr = unsafe { bindings::pid_task(self.as_ptr(), bindings::pid_type_PIDTYPE_PID) };
+        if task_ptr.is_null() {
+            None
+        } else {
+            // SAFETY: `pid_task` returns a valid pointer under RCU protection,
+            // and `Task` is `#[repr(transparent)]` over `bindings::task_struct`.
+            Some(unsafe { &*task_ptr.cast() })
+        }
+    }
+}
diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
index 979a9718f153..6029e3e120d0 100644
--- a/rust/kernel/pid_namespace.rs
+++ b/rust/kernel/pid_namespace.rs
@@ -63,3 +63,12 @@ unsafe impl Send for PidNamespace {}
 // SAFETY: It's OK to access `PidNamespace` through shared references from other threads because
 // we're either accessing properties that don't change or that are properly synchronised by C code.
 unsafe impl Sync for PidNamespace {}
+
+/// Returns a reference to the init PID namespace.
+///
+/// This is the root PID namespace that exists throughout the lifetime of the kernel.
+#[inline]
+pub fn init_pid_ns() -> &'static PidNamespace {
+    // SAFETY: `init_pid_ns` is a global static that is valid for the lifetime of the kernel.
+    unsafe { PidNamespace::from_ptr(core::ptr::addr_of!(bindings::init_pid_ns)) }
+}
-- 
2.25.1

