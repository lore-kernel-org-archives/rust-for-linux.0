Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9613A392814
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 07:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770103799; cv=none; b=NDWYglb1mcaMvAGL7Bl+n48p5eYx3kFuOlzj0pl4JCqwFMi6Y0L0j8uXBlzh9vx9srcz56e2Mhx3BuS6bPiOt0bi4Ba545q2hCeOZTZ9GYt83b01ENjqyf3Y2VRRNpQv038fU6rKo611mXX9wIErqTRoAkUM8tO5DNaj6Sx6Frc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770103799; c=relaxed/simple;
	bh=Xid4tLW5ESP9CW27QAff7kB+P1r8GH2qGjbcTdaDhUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ADgSZ4c4MLPSfVNP6fAJN96SVE9FI/gKcM0aK1Tlo1V0ZEAjYg4ZOsX3vLg2K2XZShsSXtFLFvlU2O+kgIp5UWjEouH7ZZ4gjqDV8iSitf9aT7mBvMpHtpzAA56lSXZ6bwHwspmdP6vXUZ18fhb+b/Ah0kGqNFEWbGR544cYkNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 3 Feb 2026 15:59:55 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.48)
	by 156.147.1.121 with ESMTP; 3 Feb 2026 15:59:55 +0900
X-Original-SENDERIP: 10.159.44.48
X-Original-MAILFROM: jongan.kim@lge.com
From: jongan.kim@lge.com
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
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
	lossin@kernel.org,
	ojeda@kernel.org
Cc: jongan.kim@lge.com,
	heesu0025.kim@lge.com,
	ht.hong@lge.com,
	jungsu.hwang@lge.com,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	sanghun.lee@lge.com,
	seulgi.lee@lge.com,
	sunghoon.kim@lge.com
Subject: [PATCH v3 3/3] rust_binder: handle PID namespace conversion for freeze operation
Date: Tue,  3 Feb 2026 15:59:28 +0900
Message-Id: <20260203065928.4736-4-jongan.kim@lge.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260203065928.4736-1-jongan.kim@lge.com>
References: <20260203065928.4736-1-jongan.kim@lge.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HeeSu Kim <heesu0025.kim@lge.com>

Port PID namespace conversion logic from C binder to the Rust
implementation.

Without namespace conversion, freeze operations from non-init namespaces
can match wrong processes due to PID collision. This adds proper
conversion to ensure freeze operations target the correct process.

Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
---
v2 -> v3:
- Use task::Pid typedef instead of u32/i32
- Use PidNamespace::init_ns() instead of init_pid_ns() 
- Compare PidNamespace directly with == instead of raw pointers
- Use Pid::find_vpid() and pid.pid_task() (dropped _with_guard suffix)
- Fix rustfmt import ordering (rcu before Arc)
- Rename TaskPid alias to PidT for clearer pid_t type indication
- Use task.group_leader().pid() instead of tgid_nr_ns() for consistency with C

 drivers/android/binder/process.rs | 37 +++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 132055b4790f..ea30bfac2e0b 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -22,6 +22,8 @@
     id_pool::IdPool,
     list::{List, ListArc, ListArcField, ListLinks},
     mm,
+    pid::Pid,
+    pid_namespace::PidNamespace,
     prelude::*,
     rbtree::{self, RBTree, RBTreeNode, RBTreeNodeReservation},
     seq_file::SeqFile,
@@ -29,9 +31,9 @@
     sync::poll::PollTable,
     sync::{
         lock::{spinlock::SpinLockBackend, Guard},
-        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
+        rcu, Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
     },
-    task::Task,
+    task::{Pid as PidT, Task},
     types::ARef,
     uaccess::{UserSlice, UserSliceReader},
     uapi,
@@ -1498,17 +1500,42 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
     }
 }
 
+/// Convert a PID from the current namespace to the global (init) namespace.
+fn convert_to_init_ns_tgid(pid: PidT) -> Result<PidT> {
+    let current = kernel::current!();
+    let init_ns = PidNamespace::init_ns();
+
+    if current.active_pid_ns() == Some(init_ns) {
+        // Already in init namespace.
+        return Ok(pid);
+    }
+
+    if pid == 0 {
+        return Err(EINVAL);
+    }
+
+    let rcu_guard = rcu::read_lock();
+
+    let pid_struct = Pid::find_vpid(pid, &rcu_guard).ok_or(ESRCH)?;
+    let task = pid_struct.pid_task(&rcu_guard).ok_or(ESRCH)?;
+
+    Ok(task.group_leader().pid())
+}
+
 fn get_frozen_status(data: UserSlice) -> Result {
     let (mut reader, mut writer) = data.reader_writer();
 
     let mut info = reader.read::<BinderFrozenStatusInfo>()?;
+
+    let init_ns_pid = convert_to_init_ns_tgid(info.pid as PidT)?;
+
     info.sync_recv = 0;
     info.async_recv = 0;
     let mut found = false;
 
     for ctx in crate::context::get_all_contexts()? {
         ctx.for_each_proc(|proc| {
-            if proc.task.pid() == info.pid as _ {
+            if proc.task.pid() == init_ns_pid as _ {
                 found = true;
                 let inner = proc.inner.lock();
                 let txns_pending = inner.txns_pending_locked();
@@ -1530,13 +1557,15 @@ fn get_frozen_status(data: UserSlice) -> Result {
 fn ioctl_freeze(reader: &mut UserSliceReader) -> Result {
     let info = reader.read::<BinderFreezeInfo>()?;
 
+    let init_ns_pid = convert_to_init_ns_tgid(info.pid as PidT)?;
+
     // Very unlikely for there to be more than 3, since a process normally uses at most binder and
     // hwbinder.
     let mut procs = KVec::with_capacity(3, GFP_KERNEL)?;
 
     let ctxs = crate::context::get_all_contexts()?;
     for ctx in ctxs {
-        for proc in ctx.get_procs_with_pid(info.pid as i32)? {
+        for proc in ctx.get_procs_with_pid(init_ns_pid)? {
             procs.push(proc, GFP_KERNEL)?;
         }
     }
-- 
2.25.1

