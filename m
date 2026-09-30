Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A24DAF8A
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772550; cv=none; b=QKDbTru7aKLq9mREeinLrJ8YKoAtr4mGKpOqVn399XYtxhsBRyuYWyWJ8XyyRJ1AXIjUoKRMjwCd7iSrmyC1Deu/ohsm6khafPJe/dQfTV3fFdRXH5F2G7WuBnbPB+420lssmYoDFiiln/P3n9j7QfbLknXD+lc4aQhTSzvzNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772550; c=relaxed/simple;
	bh=c0Rz2eRVsXpMvVGSlDbwIxAqZRv3BpZsbT3Lytw4JXM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ghSFhL3rqIc5xWL0/0TqiPgDqKE2CttVkt917hhjRpsJXrhq/Mr6m4XKtbDQrKi1jBmMe2H4mDJpRiHbcDnkApjmHAlzJBNtfDRZg/q6BDcJwaF6CW8JqoSEPjFCqAul/IqCoRDv/0OxJT5x3SllegBB29/CQaioIHU3ERir2aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wLq2pDBw; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wLq2pDBw"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso752015e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 05:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790772541; x=1791377341; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssRP6gDUVQOtAFNGAdghlnou+ollHAM9jBemA6bx8uQ=;
        b=wLq2pDBwVPg3c69W7qOcMnUqDLyWhq7RIMckevYtUcjHTTgktd6dryYJjlsaFCs6ph
         yeIj0aMoPtHE2l8CcsPFM3bOywIMGgoVOJgAGpjneMsIk0euYBU9jUm8MBrG5wXNmIXS
         lo1VPO6uitfEUBouey2oIdOb+pAQrktWp8H3vxT51CARAmiPtMECigPVwPMTjFXEZjYU
         34m80LDsvwGXGJwcL8Hy2VtewA1JVpWgbAmQQyhJIfuwn7AKCOWjFMymgMwyE0VNAUdm
         aFH9XVi+tTl3Wc4JnaIKmV7qCTPQf1MFxqf6GT6tCf7auJyyH22o2zKGw0q5C+BVkgo4
         p4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790772541; x=1791377341;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssRP6gDUVQOtAFNGAdghlnou+ollHAM9jBemA6bx8uQ=;
        b=d2nyWx9/E/wLAeRiuyg0/C3UqKtXE0soyQFPwmEiIjDlUktW5sa5w0zCO20xvYw4ig
         Jb7pXi3V9oVVxDdEgY7i4liid3hqAP3467Qw9jE1yk5RGeOdqV3SuG2FellJ0Mwiuzh9
         cE3BUZwpvRQcouNtCIIllZM+mPRoryS0VAUQC1R7pK/0kDsdFO93L9XFNxI+6PZPz70i
         kcwxd483Zi2shBIe5nb1hfXNh9tntLfxZWvnGdi6/vj2WdsGti0X14hRJMXN/QBcynaq
         HsxEa1nsvZBGm0RDn7jxxsY8h6Q2ooKB2sxily3SqNKOg+K5o25UaGsIyyKjAGr5jz7v
         St+w==
X-Forwarded-Encrypted: i=1; AKwUvBwYQckpAr6+IfgfFO0B6xul1lB8lhQSAHpfLIIxVMMXSAgzbAgw/Rnn9qqbUyt4q5ha689AoEN+qw1dUT8vnA==@vger.kernel.org
X-Gm-Message-State: AFuF++mkHsrQwPJp3a48iR5aLZkRpnMhJmviZp0/H/F3v4vBPuXYqruj
	MMy5Mcdp9JBFoiGP3wW3HCYBiH9c5hG7tlaElzuu/0BMFpVqOY4muVtZNGyvxO4a1nnEXK0g+XQ
	fHiuC96Ul+cjcYfeQqA==
X-Received: from wrbcs7.prod.google.com ([2002:a05:6000:887:b0:48b:513:128c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:4446:20b0:49c:fc6e:8cb1 with SMTP id 5b1f17b1804b1-4a01b121075mr17456195e9.21.1790772540821;
 Wed, 30 Sep 2026 05:49:00 -0700 (PDT)
Date: Wed, 30 Sep 2026 12:48:44 +0000
In-Reply-To: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930-binder-transaction-log-v1-0-3d832fb30388@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=16424; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=c0Rz2eRVsXpMvVGSlDbwIxAqZRv3BpZsbT3Lytw4JXM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqvQU2M7ZQdV2MCSWIWCOKo6sgUuSQDM/JsZTtu
 xgoW5asUFaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCar0FNgAKCRAEWL7uWMY5
 RhjvD/47bK1zFRDgmIIGsu0e6APdqksa21Fk2ZkLLoYKkJ97E0NM10hDAZuHPrZMBFm3IKgbFvw
 JKUPiAhBWKdcnTDzDI7lnEp6+Ru0KdbssYnsgDVKZGTgooiQ2I8QzCDPwJjuSOSdqiRAV5V9iNL
 aub33t2VHQtJ1eyUYK7hFgi0WJYk+HXrTkSc2usL/idJDOcGHfv4WR40udx1Ny6ms0GexpjqoS8
 opDzbOGDqN8s9XGZtf8/BRftk34NKApC+s1LdmFH7+rJWK+UUc5UIzHvNdzYCNHzEIuK9Ji7N5p
 NjFDGu2NgKPc1+pq4aPfUN80gpo6O7TMm2RJlWWlWnnsdePB2tl7IvZlQLXkHStufC7M/EJ/4rn
 jw3yuQYo9IkyFRDoJKxWhH4N5/1hK8PWi+8XJlhIyxBYYO2XXliGFw4xmSfezbKU0GAhOPQDMtn
 vtoQ/6Sxaux9/RWBDKvJ8xPMvrqNt0vT1yh/+gpENi6iHP0cp9SBfAEXfyTrY4J5cIVINeq4f7e
 IKzvyf278xGmhyTCk5xsuTfUN3nif5KbydJwJzj/S/FQ9dOpgXWvKOWSzKSGQ2XSIX9w03Tp92X
 RmwU7JzCYMcbTVEXme+QvFBaFL94meqGRF9Fdw3kuPzA8QO8kw63TJC5dsKDr5Fq1htBAUC5mOR r2+IabU74TqjWkQ==
X-Mailer: b4 0.14.3
Message-ID: <20260930-binder-transaction-log-v1-3-3d832fb30388@google.com>
Subject: [PATCH 3/3] rust_binder: add transaction_log and failed_transaction_log
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
 drivers/android/binder/transaction.rs         | 193 +++++++++++++++++++++++++-
 5 files changed, 242 insertions(+), 2 deletions(-)

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
index e360df991d51..32f189fed0aa 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -305,6 +305,9 @@ fn init(_module: &'static kernel::ThisModule) -> Result<Self> {
         // SAFETY: The module initializer never runs twice, so we only call this once.
         unsafe { crate::context::CONTEXTS.init() };
 
+        crate::transaction::TRANSACTION_LOG.init()?;
+        crate::transaction::FAILED_TRANSACTION_LOG.init()?;
+
         let netlink = crate::netlink::BINDER_NL_FAMILY.register()?;
         BINDER_SHRINKER.register(c"android-binder")?;
 
@@ -545,6 +548,27 @@ unsafe impl<T> Sync for AssertSync<T> {}
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
index 245f1556b5db..f1608651c636 100644
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
@@ -54,12 +55,191 @@ pub(crate) fn is_oneway(self) -> bool {
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
+        if slot.debug_id < entry.debug_id {
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
@@ -70,6 +250,7 @@ pub(crate) struct TransactionInfo {
     pub(crate) target_handle: u32,
     pub(crate) errno: i32,
     pub(crate) reply: u32,
+    pub(crate) error_line: Option<ErrorLocation>,
     pub(crate) oneway_spam_suspect: bool,
     pub(crate) is_reply: bool,
     pub(crate) debug_id: usize,
@@ -81,6 +262,14 @@ pub(crate) fn is_oneway(&self) -> bool {
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

