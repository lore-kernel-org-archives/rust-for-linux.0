Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B087451120F
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863894; cv=none; b=V7MWJaHITD+NMWbqeu9UF96us/94iLF5DdSSmmkDiSkwVaRppY54CG9a9hlMi2vYguQ5SK2BDSIRKHatoUXAiKXjUmz921dgwwljQVnaosGA5YL4fg+6jM13K5bGCKBlCDvCe0i0WdY4VzVtKjlq97BwBspitjtvebMU4FENLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863894; c=relaxed/simple;
	bh=L9PSzxz9ow7tEiq89TuGLX4WX3jI9sVO+PIlfEUclLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A7N8rAqwC1/+JXmlV4WsKdEoHkhj5M6SY8xrvYlFQJ5EeT0KgITLEffw65Ie1jBt8k98FxaGaRizCxXmHkhUbB42MATBhleSTA99iLMr2zISNKCZeeTRAgkqpXh64FfFBuUsyA+xQriIrrZZDKZUFh8PFSqCTMKU8Mm717Nm1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wUx1bHJI; arc=none smtp.client-ip=209.85.167.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wUx1bHJI"
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5ba3483e2edso689490e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790863890; x=1791468690; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=486XmBvd/hdxqC0Yn+wHgxFrwoJGrB0vH9oLIuJX/p4=;
        b=wUx1bHJILApJhKuspMSCDhqHvAqzippmWW+XELFbP7pzJNcVL9hnzG11flI0oaYpSj
         W9gi1Q0nAHAi2oUTB1lK146qTrVtDpCWUK3i5vduJZcSCxuGQrRzA1FCHNHVat9oo33q
         rvlaKx/Teal2h2L9hjzOrAVtVLMqMvEWkSVg6iovEt8+fxAmG79GuMOjJr5fOirKkYm1
         7Uxk1bc9wmooccxFO4b2q7mcZ6Ix5uboGiAhxG211zjy42KBjB9DL5TKYefZwn+AUJvf
         OQyc9K+d2wi+35CJpS1g/zPAV20CNhzLpQb8+V/frPWrdLkErgdcmU1+Ni/nTj38mjfW
         9mTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863890; x=1791468690;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=486XmBvd/hdxqC0Yn+wHgxFrwoJGrB0vH9oLIuJX/p4=;
        b=wUCSXmEFXm4D3zVIbdqjivyhfXMeULek9895kGMsm0Yr+7TnCLn28TYoxj+Lvf+nqW
         j4RizkOG19ovplahXm3RR8pQV4XjqZlDGzHIosOMlvX+IEl1svFVVG8aKZt+RQwj+KxG
         JqKf6nng100kb6zhkEQQWCtfBFvpbyGK2Y9aJv2xNwDN8tX689o2HaJe4nBM2VHVp733
         sBVPJ44CVeYCjOi8ycLt8ZbXvqgnyuWd12p3G7WAhotF2HW7REbi9luWb6GW3iBNntOY
         5FNSfyI9WRGYrfftJ3jJLBeSLc/mksfsEtadK3rLWPhEWV+/8LO5w0wSGR8th37pOZo6
         sD0A==
X-Forwarded-Encrypted: i=1; AKwUvBzDlsfQH/Cm2v0fNk64ae/RP8uGC/pBFNSgnoLeHjE1hq4jbXwDyo4IN0505h1WRorwyxSXieozAfjzs8Vj+A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZPS7qm7dAQpSOGxng2A66irqFavWYWR5xl2zp0JFFAlAVT1R/
	70TDxHodbcsSfnBzDL9E5o/WqeF0IE3vnnHaZKTmFmQmDI51Zw6ONneep/n8G1DItGiyD+YbRYd
	zEoz0/V+YJShps35fEg==
X-Received: from ejcex16.prod.google.com ([2002:a17:907:9550:b0:c2d:c0b7:97f5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c205:b0:c2e:20ab:daee with SMTP id a640c23a62f3a-c2e34063e6emr256987166b.27.1790863877231;
 Thu, 01 Oct 2026 07:11:17 -0700 (PDT)
Date: Thu,  1 Oct 2026 14:11:14 +0000
In-Reply-To: <2026100136-immerse-wildlife-6d7e@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2026100136-immerse-wildlife-6d7e@gregkh>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=16758; i=aliceryhl@google.com;
 h=from:subject; bh=L9PSzxz9ow7tEiq89TuGLX4WX3jI9sVO+PIlfEUclLU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvmnPWXBc3EKaafIx5hrYMs3OU7yK/AO90Myio
 M7GHq+4RE+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar5pzwAKCRAEWL7uWMY5
 RgOND/96xCYmF8q1QhPARzCHU/dDA20j/pahcod24HYdiJQuk94j6sVZmcPFP1S37BI1LAN4cfz
 4WP97436tjSDoPeC9KNdee7+7ljUP0domcdP8dGAu3K2fDLuaDiPSQPh7w9TqjkuUeVdHTXX/Wf
 cfnymJZhx3cLL9Po89j3//hp2Z3q9aZ50lrGvAmzU9LXD1fJFobFQIU/E4clz3L9f13Yv9QJN/h
 urHB6pooaYVYjVpTtyz8FRwbQsbc3YhsYldWu4Wewk9g6hKYhIdcL86Jc+/3UVtml4wFvPGIv6w
 +/7iFHRLwOYF1gjJOnRxVq6xVCtik9dkI8RD4Sbx2OSgGdnvUtUgM6hDEb8kbwcF1wzgdygBJTF
 pEGoTwMX9LKj3oh4LSBPdzmdmWilUnIn93tAITM1T6iqSPwdtiDvIppKtwLHN3w7zuz1H8jqVlh
 CPo610l4MLEkW0a/mWr41DP5m6XcvaRTGtw+jcWiUVr8cwrfjLPYVCMnCgwYOCn0SXSoaOzCfz0
 o6mrtO8ncT4jMKkOebIT+tJ/JVISaBK9kSzdMDKvz4vtOJVsLZW0sD00kCkBRPc+21JL5q5RL6Q
 aU5is2iiX8z1y60X84kAqbqZzbvhYeLLJ16+/sSFfPBLqZfCnHe+EzUi50YxvOqk/F6Pbwm4Gjw 6ESD/a8gLjjgL8Q==
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001141114.2731136-1-aliceryhl@google.com>
Subject: [PATCH v2 3/3 rebased] rust_binder: add transaction_log and failed_transaction_log
From: Alice Ryhl <aliceryhl@google.com>
To: gregkh@linuxfoundation.org
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, cmllamas@google.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"

Implement the binder_logs/transaction_log and
binder_logs/failed_transaction_log binderfs files in Rust Binder,
matching the circular 32-entry transaction logs in C Binder.

Example output from /dev/binderfs/binder_logs/transaction_log:

  261251: call  from 6157:6171 to 391:0 context binder node 170 handle 34 size 256:0 ret 0/0 l=0
  261254: async from 606:783 to 669:0 context binder node 2048 handle 2 size 144:0 ret 0/0 l=0
  261255: reply from 391:552 to 6157:6171 context binder node 0 handle -1 size 2436:8 ret 0/0 l=0

Example output from /dev/binderfs/binder_logs/failed_transaction_log:

  194556: async from 6646:6853 to 7452:0 context binder node 177682 handle 450 size 160:0 ret 29189/0 l=process.rs:1081
  194846: reply from 6646:6775 to 7452:7544 context binder node 0 handle -1 size 8:0 ret 29201/0 l=process.rs:1081
  201573: call  from 7771:7793 to 6646:0 context binder node 198883 handle 28 size 0:0 ret 29189/0 l=process.rs:1081

Unlike C Binder, which writes to log entries without a lock using memory
barriers (smp_wmb/smp_rmb) and a debug_id_done field, each
TransactionLog uses an atomic index cursor with 32 cacheline-aligned
SpinLock<TransactionLogEntry> slots initialized in BinderModule::init
via SetOnce<_>. Using a SpinLock per slot avoids data races (such as
tearing when the ring buffer wraps around while an entry is being
printed) without requiring atomic accesses for every field, and has very
low risk of contention: concurrent transactions are spread across 32
separate cacheline-aligned locks, each lock is only held briefly for a
fixed-size copy, and two writers only contend on a slot if 32
transactions occur before a single copy completes.

Assisted-by: LLM
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3: minor conflict resolution

 drivers/android/binder/rust_binder_internal.h |   1 +
 drivers/android/binder/rust_binder_main.rs    |  24 +++
 drivers/android/binder/rust_binderfs.c        |  19 ++
 drivers/android/binder/thread.rs              |   7 +
 drivers/android/binder/transaction.rs         | 197 +++++++++++++++++-
 5 files changed, 246 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/rust_binder_internal.h b/drivers/android/binder/rust_binder_internal.h
index 78288fe7964d..50a50df14c77 100644
--- a/drivers/android/binder/rust_binder_internal.h
+++ b/drivers/android/binder/rust_binder_internal.h
@@ -44,6 +44,7 @@ struct binder_device {
 int rust_binder_stats_show(struct seq_file *m, void *unused);
 int rust_binder_state_show(struct seq_file *m, void *unused);
 int rust_binder_transactions_show(struct seq_file *m, void *unused);
+int rust_binder_transaction_log_show(struct seq_file *m, void *unused);
 int rust_binder_proc_show(struct seq_file *m, void *pid);
 
 extern const struct file_operations rust_binder_fops;
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 89add66c0483..56c786475237 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -310,6 +310,9 @@ fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
         // SAFETY: The module initializer never runs twice, so we only call this once.
         unsafe { crate::context::CONTEXTS.init() };
 
+        crate::transaction::TRANSACTION_LOG.init()?;
+        crate::transaction::FAILED_TRANSACTION_LOG.init()?;
+
         let netlink = crate::netlink::BINDER_NL_FAMILY.register()?;
         BINDER_SHRINKER.register(c"android-binder")?;
 
@@ -550,6 +553,27 @@ unsafe impl<T> Sync for AssertSync<T> {}
     0
 }
 
+/// # Safety
+/// Only called by binderfs.
+#[no_mangle]
+unsafe extern "C" fn rust_binder_transaction_log_show(
+    ptr: *mut seq_file,
+    _: *mut kernel::ffi::c_void,
+) -> kernel::ffi::c_int {
+    // SAFETY: Accessing the private field of `seq_file` is okay.
+    let is_failed = !unsafe { (*ptr).private }.is_null();
+    // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
+    // this method is called.
+    let m = unsafe { SeqFile::from_raw(ptr) };
+    let log = if is_failed {
+        &transaction::FAILED_TRANSACTION_LOG
+    } else {
+        &transaction::TRANSACTION_LOG
+    };
+    log.debug_print(m);
+    0
+}
+
 fn rust_binder_transactions_show_impl(m: &SeqFile) -> Result {
     seq_print!(m, "binder transactions:\n");
     let contexts = context::get_all_contexts()?;
diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
index acc83a179f38..25dc54ab45e9 100644
--- a/drivers/android/binder/rust_binderfs.c
+++ b/drivers/android/binder/rust_binderfs.c
@@ -46,6 +46,7 @@
 DEFINE_SHOW_ATTRIBUTE(rust_binder_stats);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_state);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_transactions);
+DEFINE_SHOW_ATTRIBUTE(rust_binder_transaction_log);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_proc);
 
 char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
@@ -611,6 +612,24 @@ static int init_binder_logs(struct super_block *sb)
 		goto out;
 	}
 
+	dentry = rust_binderfs_create_file(binder_logs_root_dir,
+				      "transaction_log",
+				      &rust_binder_transaction_log_fops,
+				      (void *)0);
+	if (IS_ERR(dentry)) {
+		ret = PTR_ERR(dentry);
+		goto out;
+	}
+
+	dentry = rust_binderfs_create_file(binder_logs_root_dir,
+				      "failed_transaction_log",
+				      &rust_binder_transaction_log_fops,
+				      (void *)1);
+	if (IS_ERR(dentry)) {
+		ret = PTR_ERR(dentry);
+		goto out;
+	}
+
 	proc_log_dir = binderfs_create_dir(binder_logs_root_dir, "proc");
 	if (IS_ERR(proc_log_dir)) {
 		ret = PTR_ERR(proc_log_dir);
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index c91c885c1292..4df006b98ebf 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1332,6 +1332,7 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             self.push_return_work(err.reply);
             if err.reply != BR_TRANSACTION_COMPLETE {
                 info.reply = err.reply;
+                info.error_line = Some(err.line);
                 if let Some(source) = &err.source {
                     info.errno = source.to_errno();
 
@@ -1363,6 +1364,8 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             }
         }
 
+        info.write_log(&self.process.ctx);
+
         if info.oneway_spam_suspect {
             // If this is both a oneway spam suspect and a failure, we report it twice. This is
             // useful in case the transaction failed with BR_TRANSACTION_PENDING_FROZEN.
@@ -1378,6 +1381,7 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
     fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
         let node_ref = self.process.get_transaction_node(info.target_handle)?;
         info.to_pid = node_ref.node.owner.task.pid();
+        info.to_node_debug_id = node_ref.node.debug_id;
         security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
         // TODO: We need to ensure that there isn't a pending transaction in the work queue. How
         // could this happen?
@@ -1472,6 +1476,8 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             orig.from
                 .deliver_reply(Err(BR_FAILED_REPLY), &orig, Some(ee));
             info.reply = BR_FAILED_REPLY;
+            info.errno = param;
+            info.error_line = Some(err.line);
             err.reply = BR_TRANSACTION_COMPLETE;
             err
         });
@@ -1482,6 +1488,7 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
     fn oneway_transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
         let node_ref = self.process.get_transaction_node(info.target_handle)?;
         info.to_pid = node_ref.node.owner.task.pid();
+        info.to_node_debug_id = node_ref.node.debug_id;
         security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
         let transaction = Transaction::new(node_ref, None, self, info)?;
         let code = if self.process.is_oneway_spam_detection_enabled() && info.oneway_spam_suspect {
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index e56272b00be4..e627522141b8 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -7,8 +7,9 @@
     prelude::*,
     seq_file::SeqFile,
     seq_print,
+    str::BStr,
     sync::atomic::{ordering::Relaxed, Atomic},
-    sync::{Arc, SpinLock},
+    sync::{Arc, SetOnce, SpinLock},
     task::{Kuid, Pid},
     time::{Instant, Monotonic},
     types::ScopeGuard,
@@ -18,7 +19,7 @@
 use crate::{
     allocation::{Allocation, TranslatedFds},
     defs::*,
-    error::{BinderError, BinderResult},
+    error::{BinderError, BinderResult, ErrorLocation},
     netlink::Report,
     node::{Node, NodeRef},
     process::{Process, ProcessInner},
@@ -56,12 +57,195 @@ pub(crate) fn is_oneway(self) -> bool {
     }
 }
 
+const LOG_SIZE: usize = 32;
+
+pub(crate) static TRANSACTION_LOG: TransactionLog = TransactionLog::new();
+pub(crate) static FAILED_TRANSACTION_LOG: TransactionLog = TransactionLog::new();
+
+#[derive(Copy, Clone)]
+enum CallType {
+    Call,
+    Async,
+    Reply,
+}
+
+#[derive(Copy, Clone)]
+pub(crate) struct TransactionLogEntry {
+    debug_id: usize,
+    call_type: CallType,
+    from_proc: Pid,
+    from_thread: Pid,
+    // The kernel ignores `target.handle` on replies (where `libbinder` passes `-1` / `0xffffffff`),
+    // and C Binder stores and prints this field as a signed `int` (`%d`).
+    target_handle: i32,
+    to_proc: Pid,
+    to_thread: Pid,
+    to_node: usize,
+    data_size: usize,
+    offsets_size: usize,
+    return_error_line: Option<ErrorLocation>,
+    return_error: u32,
+    return_error_param: i32,
+    context_name: [u8; 16],
+}
+
+impl TransactionLogEntry {
+    const fn empty() -> Self {
+        Self {
+            debug_id: 0,
+            call_type: CallType::Call,
+            from_proc: 0,
+            from_thread: 0,
+            target_handle: 0,
+            to_proc: 0,
+            to_thread: 0,
+            to_node: 0,
+            data_size: 0,
+            offsets_size: 0,
+            return_error_line: None,
+            return_error: 0,
+            return_error_param: 0,
+            context_name: [0; 16],
+        }
+    }
+
+    fn new(info: &TransactionInfo, ctx: &crate::Context) -> Self {
+        let call_type = if info.is_reply {
+            CallType::Reply
+        } else if info.is_oneway() {
+            CallType::Async
+        } else {
+            CallType::Call
+        };
+        let name_bytes = ctx.name.to_bytes();
+        let mut context_name = [0u8; 16];
+        let len = usize::min(name_bytes.len(), context_name.len());
+        context_name[..len].copy_from_slice(&name_bytes[..len]);
+
+        let failed = info.reply != 0 && info.reply != BR_TRANSACTION_PENDING_FROZEN;
+        Self {
+            debug_id: info.debug_id,
+            call_type,
+            from_proc: info.from_pid,
+            from_thread: info.from_tid,
+            target_handle: info.target_handle as i32,
+            to_proc: info.to_pid,
+            to_thread: info.to_tid,
+            to_node: info.to_node_debug_id,
+            data_size: info.data_size,
+            offsets_size: info.offsets_size,
+            return_error_line: if failed { info.error_line } else { None },
+            return_error: if failed { info.reply } else { 0 },
+            return_error_param: if failed { info.errno } else { 0 },
+            context_name,
+        }
+    }
+}
+
+#[pin_data]
+#[repr(align(64))]
+struct TransactionLogSlot {
+    #[pin]
+    entry: SpinLock<TransactionLogEntry>,
+}
+
+pub(crate) struct TransactionLog {
+    cur: Atomic<usize>,
+    entries: SetOnce<Pin<KBox<[TransactionLogSlot; LOG_SIZE]>>>,
+}
+
+impl TransactionLog {
+    const fn new() -> Self {
+        Self {
+            cur: Atomic::new(0),
+            entries: SetOnce::new(),
+        }
+    }
+
+    pub(crate) fn init(&self) -> Result {
+        let entries = KBox::pin_init(
+            pin_init::pin_init_array_from_fn(|_| {
+                pin_init!(TransactionLogSlot {
+                    entry <- kernel::new_spinlock!(
+                        TransactionLogEntry::empty(),
+                        "TransactionLog::entries"
+                    ),
+                })
+            }),
+            GFP_KERNEL,
+        )?;
+        self.entries.populate(entries);
+        Ok(())
+    }
+
+    fn add(&self, entry: &TransactionLogEntry) {
+        let Some(entries) = self.entries.as_ref() else {
+            return;
+        };
+        let idx = self.cur.fetch_add(1, Relaxed) % LOG_SIZE;
+        let mut slot = entries[idx].entry.lock();
+        // Avoid overwriting a newer entry if the ring buffer wraps around between `fetch_add` and
+        // acquiring the lock.
+        // CAST: Overflowing behavior of this cast is intentional to handle `debug_id` wrap-around.
+        let diff = slot.debug_id.wrapping_sub(entry.debug_id) as isize;
+        if slot.debug_id == 0 || diff < 0 {
+            *slot = *entry;
+        }
+    }
+
+    pub(crate) fn debug_print(&self, m: &SeqFile) {
+        let Some(entries) = self.entries.as_ref() else {
+            return;
+        };
+        let cur = self.cur.load(Relaxed);
+        for i in 0..LOG_SIZE {
+            let idx = cur.wrapping_add(i) % LOG_SIZE;
+            let entry = *entries[idx].entry.lock();
+            if entry.debug_id == 0 {
+                continue;
+            }
+            let call_type = match entry.call_type {
+                CallType::Call => "call ",
+                CallType::Async => "async",
+                CallType::Reply => "reply",
+            };
+            let ctx_name = match CStr::from_bytes_until_nul(&entry.context_name) {
+                Ok(cstr) => BStr::from_bytes(cstr.to_bytes()),
+                Err(_) => BStr::from_bytes(&entry.context_name),
+            };
+            let return_error_line: &dyn kernel::fmt::Display = match &entry.return_error_line {
+                Some(line) => line,
+                None => &0,
+            };
+            seq_print!(
+                m,
+                "{}: {} from {}:{} to {}:{} context {} node {} handle {} size {}:{} ret {}/{} l={}\n",
+                entry.debug_id,
+                call_type,
+                entry.from_proc,
+                entry.from_thread,
+                entry.to_proc,
+                entry.to_thread,
+                ctx_name,
+                entry.to_node,
+                entry.target_handle,
+                entry.data_size,
+                entry.offsets_size,
+                entry.return_error,
+                entry.return_error_param,
+                return_error_line,
+            );
+        }
+    }
+}
+
 #[derive(Zeroable)]
 pub(crate) struct TransactionInfo {
     pub(crate) from_pid: Pid,
     pub(crate) from_tid: Pid,
     pub(crate) to_pid: Pid,
     pub(crate) to_tid: Pid,
+    pub(crate) to_node_debug_id: usize,
     pub(crate) code: u32,
     pub(crate) flags: TransactionFlags,
     pub(crate) data_ptr: UserPtr,
@@ -72,6 +256,7 @@ pub(crate) struct TransactionInfo {
     pub(crate) target_handle: u32,
     pub(crate) errno: i32,
     pub(crate) reply: u32,
+    pub(crate) error_line: Option<ErrorLocation>,
     pub(crate) oneway_spam_suspect: bool,
     pub(crate) is_reply: bool,
     pub(crate) debug_id: usize,
@@ -83,6 +268,14 @@ pub(crate) fn is_oneway(&self) -> bool {
         self.flags.is_oneway()
     }
 
+    pub(crate) fn write_log(&self, ctx: &crate::Context) {
+        let entry = TransactionLogEntry::new(self, ctx);
+        TRANSACTION_LOG.add(&entry);
+        if self.reply != 0 && self.reply != BR_TRANSACTION_PENDING_FROZEN {
+            FAILED_TRANSACTION_LOG.add(&entry);
+        }
+    }
+
     pub(crate) fn report_netlink(&self, reply: u32, ctx: &crate::Context) {
         if let Err(err) = self.report_netlink_inner(reply, ctx) {
             pr_warn!(
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

