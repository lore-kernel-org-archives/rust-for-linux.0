Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AAB34DB79
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368043; cv=none; b=XLjdv17ksN26U8n2xhgKSKfuBFMyJV5RcwAMGQE9n/bsOI2wHRry9454XKlvdrml2hJCP82icOIS9x8dDV/uXKZcc5nnHVLtN9RqZVhsal/Jz0Jogd3Ijh9UYsOYCQmKA65JXspeMUhw6prRoRdJtC00GWyTDLJwsa5eiaIR/hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368043; c=relaxed/simple;
	bh=tZ4Eid0tnk1urzHKrFGGLzj+Uno6preRVsDOAT7qBt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uz19fQG4gMlffQamTAKQDOMoPCPFsh5Hm1qlC32Ysp89kSeDfpkTC62YKV65FVISaTAQYjvmR9vI+nBNqrjjzZT+TkJeAxt18SN4fw5DbIhdAOF9iH5T0PezgvGrP2OpwtmNURZ82UghHsLTY7/OWKBDsCvL0kdrKUCGCg7ck8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 6 Feb 2026 17:54:00 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.57)
	by 156.147.1.121 with ESMTP; 6 Feb 2026 17:54:00 +0900
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
Subject: [PATCH v4 1/3] binder: fix PID namespace collision for freeze operation
Date: Fri,  6 Feb 2026 17:53:34 +0900
Message-Id: <20260206085336.32819-2-jongan.kim@lge.com>
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

From: JongAn Kim <jongan.kim@lge.com>

Currently, when a freeze is attempted from a non-init PID namespace,
there is a possibility that the wrong process in the init namespace
may be frozen due to PID collision across namespaces.

For example, if a container with PID namespace has a process with
PID 100 (which maps to PID 5000 in init namespace), attempting to
freeze PID 100 from the container could incorrectly match a different
process with PID 100 in the init namespace.

This patch fixes the issue by:
1. Using find_get_task_by_vpid() to get task_struct from caller's namespace
2. Comparing task_struct pointers directly instead of PID values
3. This ensures we match the exact task regardless of PID namespace

This change ensures correct PID handling when binder freeze occurs in
non-init PID namespace.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/lkml/aXs5Y3xAFKyZr6nd@google.com/
Signed-off-by: JongAn Kim <jongan.kim@lge.com>
---
v3 -> v4 :
- change subject name more clearly
- comapre task_struct pointers directly instead of PID

v2 -> v3 : change to use task->tgid instead of task_tgid_nr_ns()

 drivers/android/binder.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 535fc881c8da..6d68f98a18db 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5717,13 +5717,18 @@ static int binder_ioctl_get_freezer_info(
 	struct binder_proc *target_proc;
 	bool found = false;
 	__u32 txns_pending;
+	struct task_struct *task;
 
 	info->sync_recv = 0;
 	info->async_recv = 0;
 
+	task = find_get_task_by_vpid(info->pid);
+	if (!task)
+		return -ESRCH;
+
 	mutex_lock(&binder_procs_lock);
 	hlist_for_each_entry(target_proc, &binder_procs, proc_node) {
-		if (target_proc->pid == info->pid) {
+		if (target_proc->tsk == task) {
 			found = true;
 			binder_inner_proc_lock(target_proc);
 			txns_pending = binder_txns_pending_ilocked(target_proc);
@@ -5734,6 +5739,7 @@ static int binder_ioctl_get_freezer_info(
 		}
 	}
 	mutex_unlock(&binder_procs_lock);
+	put_task_struct(task);
 
 	if (!found)
 		return -EINVAL;
@@ -5869,6 +5875,7 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		struct binder_freeze_info info;
 		struct binder_proc **target_procs = NULL, *target_proc;
 		int target_procs_count = 0, i = 0;
+		struct task_struct *task;
 
 		ret = 0;
 
@@ -5877,14 +5884,21 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			goto err;
 		}
 
+		task = find_get_task_by_vpid(info.pid);
+		if (!task) {
+			ret = -ESRCH;
+			goto err;
+		}
+
 		mutex_lock(&binder_procs_lock);
 		hlist_for_each_entry(target_proc, &binder_procs, proc_node) {
-			if (target_proc->pid == info.pid)
+			if (target_proc->tsk == task)
 				target_procs_count++;
 		}
 
 		if (target_procs_count == 0) {
 			mutex_unlock(&binder_procs_lock);
+			put_task_struct(task);
 			ret = -EINVAL;
 			goto err;
 		}
@@ -5895,12 +5909,13 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 
 		if (!target_procs) {
 			mutex_unlock(&binder_procs_lock);
+			put_task_struct(task);
 			ret = -ENOMEM;
 			goto err;
 		}
 
 		hlist_for_each_entry(target_proc, &binder_procs, proc_node) {
-			if (target_proc->pid != info.pid)
+			if (target_proc->tsk != task)
 				continue;
 
 			binder_inner_proc_lock(target_proc);
@@ -5910,6 +5925,7 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			target_procs[i++] = target_proc;
 		}
 		mutex_unlock(&binder_procs_lock);
+		put_task_struct(task);
 
 		for (i = 0; i < target_procs_count; i++) {
 			if (ret >= 0)
-- 
2.25.1

