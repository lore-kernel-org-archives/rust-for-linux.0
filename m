Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB75D4F4D03
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776630; cv=none; b=L53bfgfwwg0bn5AsJnJpKm/EmuF7Z8JeTYXZgTS874nA3EMHmxQQKuzYw3sFWl/57Q38L3gq5tlMQNSB2CXLS2LTth2JKNQP9A0WoVDQWa2UKWaNEcPAoMdp6Tvk/Kz0fW3r108Givcjq63z27oZh37vPewXSQF6YeoJyIgt500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776630; c=relaxed/simple;
	bh=mQcn1blEgn8GudfR88P5mUNcbMfrX13uHxrMv6dbRdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o6/YGwhkFerT/+km+mpm8ZFogkmP9OXrVLmt5S0Ry1feIpFjgxFCoJJqcMHD5K8JziDG9fv5lRAEZgQYhecgfBE4R6WNPJMR6u+MsSYB6SUjhCdWdSYPtyvBRiZGJvL4ifWxo9LjWw57SwiUNFMrMQ4qwOhcWWvhwe1zPIZ9eRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wlfA7g16; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wlfA7g16"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6862e924so44294575e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790776611; x=1791381411; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2P93zpo4R+tZWipHNAa6lmpas8ZKaEzb8MOrGLfDWjw=;
        b=wlfA7g16N1Flo4NaCZjGAugDeD7aB/Ky9r6samNKIbOYjWpnCOPYleW3k+Q35DiKR4
         GCv58+I1sL6qsp9aIixgPDA7NWbXl8XTjO02zMX6tdMdKKLivudJhJ1WDpJiXc6ElqqA
         r/4f98rQN7cltbJ+j6bf7PQSat3WKTY+MnCfrXDHlsRYPG8q411EKvvoWawFlQ8CDBBM
         YiIJ8gjhAKO1SLEKYyIEISISDTmuw6UX7OTNHikFcA6Sll5E4Etu1xMpettIcugYSRIj
         xSx8HSZi1dAQl0cxdYjUHoLmQRkY/pbc80lJ5t+sYQXm7tNwjuEdvtXgR/SmH/bXRdxD
         WBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776611; x=1791381411;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P93zpo4R+tZWipHNAa6lmpas8ZKaEzb8MOrGLfDWjw=;
        b=yT71YWxMx5ZO/soPgOGwX/i7GawnliPHRTu/suoHB7oewItTZF/cNwZ8JAuoeOos9D
         wrrOq0KA0eQ9zgDtyv+sZS+q/GwlH2mfJGYsls0JjWJr6M04Mump1b5cX7DRhdU+X9cz
         1/aQ5MRsP7rMZKW0mF34roImPV+lrzi9YvMvK6sMzyxowamcRgetbpmmkr1f81LtxB6T
         URpyz2ZcdmU9M+7WR+r/+VCFAlpz6JyRB8JQk/ds/n8fH8DWKCO6+NL4SJbBGFNHRtGJ
         vKgURcu6xwZVUxxdMx7f+A3M4trwkZnPj/gJOB39JEOgXivuCRhU28GHbkozQ2OVgpzQ
         rq0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxe5ZkpPNlxuDoqH8oXxoFJs6illXOQasFvcWGBm2H7t8BeIuhw/MFbQ72kbTAUD+aq6+ab0LpF7+yn0qoSbQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kzG5kK9YjCkflfJu+bB9BJAz8/08YNZb57K2+T7kHhxpjpzCEd
	yxRVfnRMuyZUNahS1zzhW/9bg1RZ6R1Odkc6YmNRH5akwNz0i7cieAX9NxPUe+FArhBJfx8q6EB
	udN6jL6oCA0PgWH4dVw==
X-Received: from wmhx21.prod.google.com ([2002:a05:600c:4215:b0:4a0:2c4:6d40])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc3:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a01ab4e607mr26279895e9.0.1790776610995;
 Wed, 30 Sep 2026 06:56:50 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:56:38 +0000
In-Reply-To: <20260930-binder-transaction-log-v2-0-8a15e9b8cae3@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930-binder-transaction-log-v2-0-8a15e9b8cae3@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=16734; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=mQcn1blEgn8GudfR88P5mUNcbMfrX13uHxrMv6dbRdU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvRUdXkTSNBQQ8AEsWeD5wQ9VLV+abCbeo59SI
 M8Cg00hXqiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar0VHQAKCRAEWL7uWMY5
 RtwPD/91KTCzT8Wnh3MAOMyS9nhvogLLKDIpvZ6fJ13qG672eeXWRwXr/ooX719WR3Mb+VOIjxv
 IlgqvKqB3b3KxMG/liDk12U7cKm5bp3sZZNPen2hUYlzNmYOVQBjoUnoJkGZCMUgkXiYhWWAlVG
 Bkcpu0zmsWI0I4TRY8fGNY0Gh44ENurUQGnshO0W6qHECB+hAcTJbc1O3zHtczYsMHf5ngL4u7+
 IS2RJ0sDaPAPE2pxdyAn6exHvoG0Q1GIvIFWKMNS3i1fUqNa2MCxEKqefJ8eZrjzyGyYAyGvD+I
 NZHSd9MP0Oe3XmDwhZg1rWErR0RBniAnEQ1lvpHV7zEzIgo7gfEb4mckkleOdReRDmU2yWr8GKA
 KwRSgmKpazWS97iDjzwZLLk0E41W+le1XhBH5GlN1tAeyxeNi1pZjx1MPTO9ssL22yv+YrxCdJK
 9jRsPscQUtos2VmD6xbr5OG2qysAE0lPQuSkMr9q5U1hjg9lzCKXEVBxcOCHJWH2IEiHOZJ7PRN
 COp/+xsQNV+/fvuCUU5Iulf/7iSnp4/NVA1zQN8uuJPHKxU204Lim9IIoW6QUKrUoK8X2hD0yoG
 hhTVOzJTFupjPGf4SvEDKFfTPQT0K6Ov8lEZ1exVgZ4Nc5wHeJUWNUe4d+ooZh88UtG83QbPSzj to7oXpjJYbmMQ3w==
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v2-3-8a15e9b8cae3@google.com>
Subject: [PATCH v2 3/3] rust_binder: add transaction_log and failed_transaction_log
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

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
 drivers/android/binder/rust_binder_internal.h |   1 +
 drivers/android/binder/rust_binder_main.rs    |  24 ++++
 drivers/android/binder/rust_binderfs.c        |  19 +++
 drivers/android/binder/thread.rs              |   7 +
 drivers/android/binder/transaction.rs         | 197 +++++++++++++++++++++++++-
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
index bd26ef96fefb..dd168a932d7a 100644
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
 fn rust_binder_transactions_show_impl(m: &SeqFile) -> Result<()> {
     seq_print!(m, "binder transactions:\n");
     let contexts = context::get_all_contexts()?;
diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
index 300cc65562d1..ef83d5a502af 100644
--- a/drivers/android/binder/rust_binderfs.c
+++ b/drivers/android/binder/rust_binderfs.c
@@ -46,6 +46,7 @@
 DEFINE_SHOW_ATTRIBUTE(rust_binder_stats);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_state);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_transactions);
+DEFINE_SHOW_ATTRIBUTE(rust_binder_transaction_log);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_proc);
 
 char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
@@ -603,6 +604,24 @@ static int init_binder_logs(struct super_block *sb)
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
index 0891a36e9cbd..875daaef5f53 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1299,6 +1299,7 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             self.push_return_work(err.reply);
             if err.reply != BR_TRANSACTION_COMPLETE {
                 info.reply = err.reply;
+                info.error_line = Some(err.line);
                 if let Some(source) = &err.source {
                     info.errno = source.to_errno();
 
@@ -1330,6 +1331,8 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
             }
         }
 
+        info.write_log(&self.process.ctx);
+
         if info.oneway_spam_suspect {
             // If this is both a oneway spam suspect and a failure, we report it twice. This is
             // useful in case the transaction failed with BR_TRANSACTION_PENDING_FROZEN.
@@ -1345,6 +1348,7 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
     fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
         let node_ref = self.process.get_transaction_node(info.target_handle)?;
         info.to_pid = node_ref.node.owner.task.pid();
+        info.to_node_debug_id = node_ref.node.debug_id;
         security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
         // TODO: We need to ensure that there isn't a pending transaction in the work queue. How
         // could this happen?
@@ -1431,6 +1435,8 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
             orig.from
                 .deliver_reply(Err(BR_FAILED_REPLY), &orig, Some(ee));
             info.reply = BR_FAILED_REPLY;
+            info.errno = param;
+            info.error_line = Some(err.line);
             err.reply = BR_TRANSACTION_COMPLETE;
             err
         });
@@ -1441,6 +1447,7 @@ fn reply_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
     fn oneway_transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResult {
         let node_ref = self.process.get_transaction_node(info.target_handle)?;
         info.to_pid = node_ref.node.owner.task.pid();
+        info.to_node_debug_id = node_ref.node.debug_id;
         security::binder_transaction(&self.process.cred, &node_ref.node.owner.cred)?;
         let transaction = Transaction::new(node_ref, None, self, info)?;
         let code = if self.process.is_oneway_spam_detection_enabled() && info.oneway_spam_suspect {
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 245f1556b5db..693644ef0b70 100644
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
@@ -54,12 +55,195 @@ pub(crate) fn is_oneway(self) -> bool {
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
+    pub(crate) fn init(&self) -> Result<()> {
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
@@ -70,6 +254,7 @@ pub(crate) struct TransactionInfo {
     pub(crate) target_handle: u32,
     pub(crate) errno: i32,
     pub(crate) reply: u32,
+    pub(crate) error_line: Option<ErrorLocation>,
     pub(crate) oneway_spam_suspect: bool,
     pub(crate) is_reply: bool,
     pub(crate) debug_id: usize,
@@ -81,6 +266,14 @@ pub(crate) fn is_oneway(&self) -> bool {
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

