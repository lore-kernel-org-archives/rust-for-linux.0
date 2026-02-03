Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756A38F25B
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 06:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770102000; cv=none; b=Rlw/LdEnLorptTaZMWh5SxHEwPsEEiKYHhKAK+bD/w+gdIgQhAH3HZT8OtqLtu/B3+UuyXrPX4gP2LafEQjWvu3QTXWwiuWUtWqPXOeUS5FxVhJST3ruxpIou40gq85dVCnE5alvMVfWXBt5rHnCR5EJjSSBXadexVYH+Kk7NlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770102000; c=relaxed/simple;
	bh=P7WjAbVVqWcwENynMn8xN4GwbSfceckV/AKNtt70Es8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I4EMYQ03QWH2GAHyblX1Y7MLQalH4vSTJzRjLMTbY864fbnzcjyFgmYpmQr+Ws/i5lqOo/98puXfyKkr/DqatoHNEifx/4P/37iDQ82moVkTtJvb3zNojdZq4et20NbJlj6e5GUZ+hZGWTK3zLhOBK0g/3kDFmEr3YtNTs4sO+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 3 Feb 2026 15:59:48 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jongan.kim@lge.com
Received: from unknown (HELO jongan-kim-nissan-cdc.bee-live.svc.cluster.local) (10.159.44.48)
	by 156.147.1.121 with ESMTP; 3 Feb 2026 15:59:48 +0900
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
Subject: [PATCH v3 1/3] binder: handle PID namespace conversion for freeze operation
Date: Tue,  3 Feb 2026 15:59:26 +0900
Message-Id: <20260203065928.4736-2-jongan.kim@lge.com>
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

From: JongAn Kim <jongan.kim@lge.com>

Currently, when a freeze is attempted from a non-init PID namespace,
there is a possibility that the wrong process in the init namespace
may be frozen due to PID collision across namespaces.

For example, if a container with PID namespace has a process with
PID 100 (which maps to PID 5000 in init namespace), attempting to
freeze PID 100 from the container could incorrectly match a different
process with PID 100 in the init namespace.

This patch fixes the issue by:
1. Converting the caller's PID from their namespace to init namespace
2. Matching against binder_proc->pid (which stores init namespace TGID)
3. Returning -EINVAL for invalid PIDs and -ESRCH for not-found processes

This change ensures correct PID handling when binder freeze occurs in
non-init PID namespace.

Signed-off-by: JongAn Kim <jongan.kim@lge.com>
---
v2 -> v3 : change to use task->tgid instead of task_tgid_nr_ns()

 drivers/android/binder.c | 53 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 535fc881c8da..4c4366089ecb 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5609,6 +5609,41 @@ static bool binder_txns_pending_ilocked(struct binder_proc *proc)
 	return false;
 }
 
+/**
+ * binder_convert_to_init_ns_tgid() - Convert pid to global pid(init namespace)
+ * @pid:    pid from user space
+ *
+ * Converts a process ID (TGID) from the caller's PID namespace to the
+ * corresponding TGID in the init namespace.
+ *
+ * Return: On success, returns TGID in init namespace (positive value).
+ *         On error, returns -EINVAL if pid <= 0, or -ESRCH if process
+ *         not found or not visible in init namespace.
+ */
+static int binder_convert_to_init_ns_tgid(u32 pid)
+{
+	struct task_struct *task;
+	int init_ns_pid = 0;
+
+	/* already in init namespace */
+	if (task_is_in_init_pid_ns(current))
+		return pid;
+
+	if (pid == 0)
+		return -EINVAL;
+
+	rcu_read_lock();
+	task = pid_task(find_vpid(pid), PIDTYPE_PID);
+	if (task)
+		init_ns_pid = task->tgid;
+	rcu_read_unlock();
+
+	if (!init_ns_pid)
+		return -ESRCH;
+
+	return init_ns_pid;
+}
+
 static void binder_add_freeze_work(struct binder_proc *proc, bool is_frozen)
 {
 	struct binder_node *prev = NULL;
@@ -5717,13 +5752,18 @@ static int binder_ioctl_get_freezer_info(
 	struct binder_proc *target_proc;
 	bool found = false;
 	__u32 txns_pending;
+	int init_ns_pid = 0;
 
 	info->sync_recv = 0;
 	info->async_recv = 0;
 
+	init_ns_pid = binder_convert_to_init_ns_tgid(info->pid);
+	if (init_ns_pid < 0)
+		return init_ns_pid;
+
 	mutex_lock(&binder_procs_lock);
 	hlist_for_each_entry(target_proc, &binder_procs, proc_node) {
-		if (target_proc->pid == info->pid) {
+		if (target_proc->pid == init_ns_pid) {
 			found = true;
 			binder_inner_proc_lock(target_proc);
 			txns_pending = binder_txns_pending_ilocked(target_proc);
@@ -5869,6 +5909,7 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		struct binder_freeze_info info;
 		struct binder_proc **target_procs = NULL, *target_proc;
 		int target_procs_count = 0, i = 0;
+		int init_ns_pid = 0;
 
 		ret = 0;
 
@@ -5877,9 +5918,15 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			goto err;
 		}
 
+		init_ns_pid = binder_convert_to_init_ns_tgid(info.pid);
+		if (init_ns_pid < 0) {
+			ret = init_ns_pid;
+			goto err;
+		}
+
 		mutex_lock(&binder_procs_lock);
 		hlist_for_each_entry(target_proc, &binder_procs, proc_node) {
-			if (target_proc->pid == info.pid)
+			if (target_proc->pid == init_ns_pid)
 				target_procs_count++;
 		}
 
@@ -5900,7 +5947,7 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		}
 
 		hlist_for_each_entry(target_proc, &binder_procs, proc_node) {
-			if (target_proc->pid != info.pid)
+			if (target_proc->pid != init_ns_pid)
 				continue;
 
 			binder_inner_proc_lock(target_proc);
-- 
2.25.1

