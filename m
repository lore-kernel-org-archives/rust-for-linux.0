Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C3F336EC3
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676615; cv=none; b=JkRHr2Tmzz3b+Moi7jckwOHA+t5MKTeQ4EXQtqrRHzof+sOCDnJo0JRg+764H/017yf+seWsl/m95xXKmveDpzOwiMQeKEX7JeAGhojz90IF+pEr51Qswg/mxOk7Gr+dyh5Hp5zwq3AD4Vt5aYGOk+Dte34TuwldhkUhq2v5Ut8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676615; c=relaxed/simple;
	bh=B6BX9LAqKeH96zCaktFruwWYpyDs6u+KS/1irGHdG1k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ihNaY+YSyNILj4Fcf9c1QUh4sq3ZNMBFm0c8EOv57GPbFefr6/VAgR73+VU3RUUsNpWwmxyaxvI+fHQraka/4uz85L1QnAUtGJdPV+ludWhA0q9NKhSohuHoVzciL0CXbLOyUqcZQ3hixT1YL56FDRFGH/Q8MtPEaDW6geqCook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 29 Jan 2026 17:41:21 +0900
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
Subject: [PATCH v2 3/3] rust_binder: handle PID namespace conversion for freeze operation
Date: Thu, 29 Jan 2026 17:41:19 +0900
Message-Id: <20260129084119.32994-4-jongan.kim@lge.com>
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

Port PID namespace conversion logic from C binder to the Rust
implementation.

Without namespace conversion, freeze operations from non-init namespaces
can match wrong processes due to PID collision. This adds proper
conversion to ensure freeze operations target the correct process.

Signed-off-by: HeeSu Kim <heesu0025.kim@lge.com>
---
 drivers/android/binder/process.rs | 40 ++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 132055b4790f..41b89accea6a 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -22,6 +22,8 @@
     id_pool::IdPool,
     list::{List, ListArc, ListArcField, ListLinks},
     mm,
+    pid::Pid,
+    pid_namespace::init_pid_ns,
     prelude::*,
     rbtree::{self, RBTree, RBTreeNode, RBTreeNodeReservation},
     seq_file::SeqFile,
@@ -29,7 +31,7 @@
     sync::poll::PollTable,
     sync::{
         lock::{spinlock::SpinLockBackend, Guard},
-        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
+        Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, rcu, SpinLock, UniqueArc,
     },
     task::Task,
     types::ARef,
@@ -1498,17 +1500,47 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
     }
 }
 
+/// Convert a PID from the current namespace to the global (init) namespace.
+fn convert_to_init_ns_tgid(pid: u32) -> Result<i32> {
+    let current = kernel::current!();
+    let init_ns = init_pid_ns();
+
+    if current.active_pid_ns().map(|ns| ns.as_ptr()) == Some(init_ns.as_ptr()) {
+        // Already in init namespace.
+        return Ok(pid as i32);
+    }
+
+    if pid == 0 {
+        return Err(EINVAL);
+    }
+
+    let rcu_guard = rcu::read_lock();
+
+    let pid_struct = Pid::find_vpid_with_guard(pid as i32, &rcu_guard).ok_or(ESRCH)?;
+    let task = pid_struct.pid_task_with_guard(&rcu_guard).ok_or(ESRCH)?;
+    let init_ns_pid = task.tgid_nr_ns(Some(init_ns));
+
+    if init_ns_pid == 0 {
+        return Err(ESRCH);
+    }
+
+    Ok(init_ns_pid)
+}
+
 fn get_frozen_status(data: UserSlice) -> Result {
     let (mut reader, mut writer) = data.reader_writer();
 
     let mut info = reader.read::<BinderFrozenStatusInfo>()?;
+
+    let init_ns_pid = convert_to_init_ns_tgid(info.pid)?;
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
@@ -1530,13 +1562,15 @@ fn get_frozen_status(data: UserSlice) -> Result {
 fn ioctl_freeze(reader: &mut UserSliceReader) -> Result {
     let info = reader.read::<BinderFreezeInfo>()?;
 
+    let init_ns_pid = convert_to_init_ns_tgid(info.pid)?;
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

