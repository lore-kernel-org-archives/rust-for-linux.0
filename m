Received: from outbound.pv.icloud.com (p-west1-cluster2-host3-snip4-1.eps.apple.com [57.103.64.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04686250BF2
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 01:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772933174; cv=none; b=n2Q0qHsbFmJXu+9Y5CLjpCM+W+wzABbTn7tot/cBMolv5UHbTdlR94eDS5as5J14fnxughJ3s5E0hxLy8nu3wFEpI/T1Il5FabcwvJJ/YwifYO4opi6fRKF/GoonglkmRJ0/CrVI+AmU7Ej9C5sNueo3udJld9J7rVqjWo5toAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772933174; c=relaxed/simple;
	bh=DqypF3Sy33qTYdmfEG2YtjBufra49mHQVtOVhw5H9nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1ND6pncvlkucr3cFlD9sFctBoygOoShRqhALMq09HmKcDSvVxKBWDkmG7g+B134Kx5nTQcaOs/Lk7X2+cHjtPedfEYfIuOduiTwQPR5NhZC1J2gPkAOxWbV6HgIK4iKQR4F2TgCeidoJOgGKSLxSwF4nYWam7ErrExvBFFgUjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=pbvNeJfu; arc=none smtp.client-ip=57.103.64.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="pbvNeJfu"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-15 (Postfix) with ESMTPS id C8435180009D;
	Sun,  8 Mar 2026 01:26:00 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772933162; x=1775525162; bh=6FRYIU22hrDWHinjngzx8OKYcZUq9ZSqBuZEM7NraoM=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=pbvNeJfuMUugIr2GK2yYP9oCF7EndNIFFP7vuSCz8FCfLXDordeoPY4PnbnI5/35evzEdwxLOiK5MpRalp0WZ5ErOTTaqEiDqx8DxkxlQubFh3njUbnj7JHbO0I5jX+OeQDWGeaznCBpzBXr+4fNFfEHhtLPBhLipXorgP+meJjXxLS1fTlTxSNm8lkSMh/yY6J2XSmPWUoA+umRWYg9kLPHsGEX8V0BZEng5tURQeRyAWwfVbaBHrDfc046aeJfZD7u9EcMUM5qJn/BZOMf80mw8bTAGXnA+/6JOs4lwg0gwOtQouL78L8KjsQbC/GFu702ABXplE86Kd+vFut6qg==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-15 (Postfix) with ESMTPSA id 7AA64180024A;
	Sun,  8 Mar 2026 01:25:56 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Sun, 08 Mar 2026 04:24:35 +0300
Subject: [PATCH v2 2/3] rust_binder: add Rust binder tracepoints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-rust-binder-trace-v2-2-9e38637a2193@sdhn.cc>
References: <20260308-rust-binder-trace-v2-0-9e38637a2193@sdhn.cc>
In-Reply-To: <20260308-rust-binder-trace-v2-0-9e38637a2193@sdhn.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Mohamad Alsadhan <mo@sdhn.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11966; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=DqypF3Sy33qTYdmfEG2YtjBufra49mHQVtOVhw5H9nU=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJlrLkj/Cvhrzbi4o1dF+tjOrP9nytO3567WEc8OOB6Ts
 cRPuOlnRykLgxgXg6yYIsvz895HD/64YXbm/N5TMHNYmUCGMHBxCsBELtQzMhy0rFnCo3aTZVXL
 KwGLjfxqFiz13x4fyW/ccUHO6Jf33iRGhsVWpaLlmjyLXvzoeX2k5uLev1N2FNdeeOyx2t90Hqe
 vICMA
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Authority-Info-Out: v=2.4 cv=Uo5u9uwB c=1 sm=1 tr=0 ts=69acd029
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=1XWaLZrsAAAA:8 a=yrdkZQJbEJeQb0U9HD0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDAxMSBTYWx0ZWRfX6MNFS7d6oDIT
 HNljIUeBufXWYSDLVyrCNbPcm/lLZHErdu7uZKaJyozya3G3cYKf8LlMvp4Es99cgTl0b+xABFL
 ZVP0Pghaoo3hEnR4vEQiGavWWKpj3xzWWnrqkShJ9TQvH8rnIzxl5K8ukRPJLRPsA5ePIQvbtOQ
 dS5D5svx/CzfmmOo3v63GP2LxFCdU8RATdC0tfz80Ug6BDGwTRjwRXjS/Fo2V3uhuG5rPI174ZJ
 tmVBsl5zFl/Z06mh/Da4wdLG8r181fP7JZHNo3WTB3C2PPCu1dyymYHB40M9X+0XIbfqq6TGVtp
 lvDiGlTcwWwOFpeDTUsUYQTu9uFb1z9/M0u64YQTuzBM4C5IbyBWxRnq5qoL04=
X-Proofpoint-ORIG-GUID: uJzht-3TQbCvuiu8nr8pHi43zkrJmujE
X-Proofpoint-GUID: uJzht-3TQbCvuiu8nr8pHi43zkrJmujE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_08,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0 clxscore=1030 lowpriorityscore=0 spamscore=0
 malwarescore=0 mlxlogscore=993 bulkscore=0 suspectscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603080011

New tracepoints: `{ioctl,read,write}_done`, `wait_for_work`,
`transaction_received`, `transaction_fd_{send,recv}`,
`{alloc,free}_lru_{start,end}`, `alloc_page_{start,end}`,
`unmap_{user,kernel}_{start,end}`, `command` and `return`.

Link: https://github.com/Rust-for-Linux/linux/issues/1226
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/rust_binder.h        |   5 +
 drivers/android/binder/rust_binder_events.h | 172 ++++++++++++++++++++++++++++
 drivers/android/binder/trace.rs             | 109 +++++++++++++++++-
 3 files changed, 284 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/rust_binder.h b/drivers/android/binder/rust_binder.h
index d2284726c..3936b9d0b 100644
--- a/drivers/android/binder/rust_binder.h
+++ b/drivers/android/binder/rust_binder.h
@@ -99,4 +99,9 @@ static inline size_t rust_binder_node_debug_id(rust_binder_node t)
 	return *(size_t *) (t + RUST_BINDER_LAYOUT.n.debug_id);
 }
 
+static inline binder_uintptr_t rust_binder_node_ptr(rust_binder_node t)
+{
+	return *(binder_uintptr_t *) (t + RUST_BINDER_LAYOUT.n.ptr);
+}
+
 #endif
diff --git a/drivers/android/binder/rust_binder_events.h b/drivers/android/binder/rust_binder_events.h
index e3adfb931..6725453f5 100644
--- a/drivers/android/binder/rust_binder_events.h
+++ b/drivers/android/binder/rust_binder_events.h
@@ -30,6 +30,45 @@ TRACE_EVENT(binder_ioctl,
 	TP_printk("cmd=0x%x arg=0x%lx", __entry->cmd, __entry->arg)
 );
 
+DECLARE_EVENT_CLASS(binder_function_return_class,
+	TP_PROTO(int ret),
+	TP_ARGS(ret),
+	TP_STRUCT__entry(
+		__field(int, ret)
+	),
+	TP_fast_assign(
+		__entry->ret = ret;
+	),
+	TP_printk("ret=%d", __entry->ret)
+);
+
+#define DEFINE_RBINDER_FUNCTION_RETURN_EVENT(name)	\
+DEFINE_EVENT(binder_function_return_class, name,	\
+	TP_PROTO(int ret), \
+	TP_ARGS(ret))
+
+DEFINE_RBINDER_FUNCTION_RETURN_EVENT(binder_ioctl_done);
+DEFINE_RBINDER_FUNCTION_RETURN_EVENT(binder_read_done);
+DEFINE_RBINDER_FUNCTION_RETURN_EVENT(binder_write_done);
+
+TRACE_EVENT(binder_wait_for_work,
+	TP_PROTO(bool proc_work, bool transaction_stack, bool thread_todo),
+	TP_ARGS(proc_work, transaction_stack, thread_todo),
+	TP_STRUCT__entry(
+		__field(bool, proc_work)
+		__field(bool, transaction_stack)
+		__field(bool, thread_todo)
+	),
+	TP_fast_assign(
+		__entry->proc_work = proc_work;
+		__entry->transaction_stack = transaction_stack;
+		__entry->thread_todo = thread_todo;
+	),
+	TP_printk("proc_work=%d transaction_stack=%d thread_todo=%d",
+		  __entry->proc_work, __entry->transaction_stack,
+		  __entry->thread_todo)
+);
+
 TRACE_EVENT(binder_transaction,
 	TP_PROTO(bool reply, rust_binder_transaction t, struct task_struct *thread),
 	TP_ARGS(reply, t, thread),
@@ -60,6 +99,139 @@ TRACE_EVENT(binder_transaction,
 		  __entry->reply, __entry->flags, __entry->code)
 );
 
+TRACE_EVENT(binder_transaction_received,
+	TP_PROTO(rust_binder_transaction t),
+	TP_ARGS(t),
+	TP_STRUCT__entry(
+		__field(int, debug_id)
+	),
+	TP_fast_assign(
+		__entry->debug_id = rust_binder_transaction_debug_id(t);
+	),
+	TP_printk("transaction=%d", __entry->debug_id)
+);
+
+TRACE_EVENT(binder_transaction_fd_send,
+	TP_PROTO(int t_debug_id, int fd, size_t offset),
+	TP_ARGS(t_debug_id, fd, offset),
+	TP_STRUCT__entry(
+		__field(int, debug_id)
+		__field(int, fd)
+		__field(size_t, offset)
+	),
+	TP_fast_assign(
+		__entry->debug_id = t_debug_id;
+		__entry->fd = fd;
+		__entry->offset = offset;
+	),
+	TP_printk("transaction=%d src_fd=%d offset=%zu",
+		  __entry->debug_id, __entry->fd, __entry->offset)
+);
+
+TRACE_EVENT(binder_transaction_fd_recv,
+	TP_PROTO(int t_debug_id, int fd, size_t offset),
+	TP_ARGS(t_debug_id, fd, offset),
+	TP_STRUCT__entry(
+		__field(int, debug_id)
+		__field(int, fd)
+		__field(size_t, offset)
+	),
+	TP_fast_assign(
+		__entry->debug_id = t_debug_id;
+		__entry->fd = fd;
+		__entry->offset = offset;
+	),
+	TP_printk("transaction=%d dest_fd=%d offset=%zu",
+		  __entry->debug_id, __entry->fd, __entry->offset)
+);
+
+DECLARE_EVENT_CLASS(binder_lru_page_class,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index),
+	TP_STRUCT__entry(
+		__field(int, proc)
+		__field(size_t, page_index)
+	),
+	TP_fast_assign(
+		__entry->proc = pid;
+		__entry->page_index = page_index;
+	),
+	TP_printk("proc=%d page_index=%zu",
+		  __entry->proc, __entry->page_index)
+);
+
+DEFINE_EVENT(binder_lru_page_class, binder_alloc_lru_start,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_alloc_lru_end,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_free_lru_start,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_free_lru_end,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_alloc_page_start,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_alloc_page_end,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_unmap_user_start,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_unmap_user_end,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_unmap_kernel_start,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+DEFINE_EVENT(binder_lru_page_class, binder_unmap_kernel_end,
+	TP_PROTO(int pid, size_t page_index),
+	TP_ARGS(pid, page_index));
+
+TRACE_EVENT(binder_command,
+	TP_PROTO(uint32_t cmd),
+	TP_ARGS(cmd),
+	TP_STRUCT__entry(
+		__field(uint32_t, cmd)
+	),
+	TP_fast_assign(
+		__entry->cmd = cmd;
+	),
+	TP_printk("cmd=0x%x %s",
+		  __entry->cmd,
+		  _IOC_NR(__entry->cmd) < ARRAY_SIZE(binder_command_strings) ?
+			  binder_command_strings[_IOC_NR(__entry->cmd)] :
+			  "unknown")
+);
+
+TRACE_EVENT(binder_return,
+	TP_PROTO(uint32_t cmd),
+	TP_ARGS(cmd),
+	TP_STRUCT__entry(
+		__field(uint32_t, cmd)
+	),
+	TP_fast_assign(
+		__entry->cmd = cmd;
+	),
+	TP_printk("cmd=0x%x %s",
+		  __entry->cmd,
+		  _IOC_NR(__entry->cmd) < ARRAY_SIZE(binder_return_strings) ?
+			  binder_return_strings[_IOC_NR(__entry->cmd)] :
+			  "unknown")
+);
+
 #endif /* _RUST_BINDER_TRACE_H */
 
 /* This part must be outside protection */
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
index d54b18ab7..8bfe7f882 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -5,13 +5,33 @@
 use crate::transaction::Transaction;
 
 use kernel::bindings::{rust_binder_transaction, task_struct};
-use kernel::ffi::{c_uint, c_ulong};
-use kernel::task::Task;
+use kernel::error::Result;
+use kernel::ffi::{c_int, c_uint, c_ulong};
+use kernel::task::{Pid, Task};
 use kernel::tracepoint::declare_trace;
 
 declare_trace! {
     unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
+    unsafe fn binder_ioctl_done(ret: c_int);
+    unsafe fn binder_read_done(ret: c_int);
+    unsafe fn binder_write_done(ret: c_int);
+    unsafe fn binder_wait_for_work(proc_work: bool, transaction_stack: bool, thread_todo: bool);
     unsafe fn binder_transaction(reply: bool, t: rust_binder_transaction, thread: *mut task_struct);
+    unsafe fn binder_transaction_received(t: rust_binder_transaction);
+    unsafe fn binder_transaction_fd_send(t_debug_id: c_int, fd: c_int, offset: usize);
+    unsafe fn binder_transaction_fd_recv(t_debug_id: c_int, fd: c_int, offset: usize);
+    unsafe fn binder_alloc_lru_start(pid: c_int, page_index: usize);
+    unsafe fn binder_alloc_lru_end(pid: c_int, page_index: usize);
+    unsafe fn binder_free_lru_start(pid: c_int, page_index: usize);
+    unsafe fn binder_free_lru_end(pid: c_int, page_index: usize);
+    unsafe fn binder_alloc_page_start(pid: c_int, page_index: usize);
+    unsafe fn binder_alloc_page_end(pid: c_int, page_index: usize);
+    unsafe fn binder_unmap_user_start(pid: c_int, page_index: usize);
+    unsafe fn binder_unmap_user_end(pid: c_int, page_index: usize);
+    unsafe fn binder_unmap_kernel_start(pid: c_int, page_index: usize);
+    unsafe fn binder_unmap_kernel_end(pid: c_int, page_index: usize);
+    unsafe fn binder_command(cmd: u32);
+    unsafe fn binder_return(ret: u32);
 }
 
 #[inline]
@@ -19,12 +39,42 @@ fn raw_transaction(t: &Transaction) -> rust_binder_transaction {
     t as *const Transaction as rust_binder_transaction
 }
 
+#[inline]
+fn to_errno(ret: Result) -> i32 {
+    match ret {
+        Ok(()) => 0,
+        Err(err) => err.to_errno(),
+    }
+}
+
 #[inline]
 pub(crate) fn trace_ioctl(cmd: u32, arg: usize) {
     // SAFETY: Always safe to call.
     unsafe { binder_ioctl(cmd, arg as c_ulong) }
 }
 
+#[inline]
+pub(crate) fn trace_ioctl_done(ret: Result) {
+    // SAFETY: Always safe to call.
+    unsafe { binder_ioctl_done(to_errno(ret)) }
+}
+#[inline]
+pub(crate) fn trace_read_done(ret: Result) {
+    // SAFETY: Always safe to call.
+    unsafe { binder_read_done(to_errno(ret)) }
+}
+#[inline]
+pub(crate) fn trace_write_done(ret: Result) {
+    // SAFETY: Always safe to call.
+    unsafe { binder_write_done(to_errno(ret)) }
+}
+
+#[inline]
+pub(crate) fn trace_wait_for_work(proc_work: bool, transaction_stack: bool, thread_todo: bool) {
+    // SAFETY: Always safe to call.
+    unsafe { binder_wait_for_work(proc_work, transaction_stack, thread_todo) }
+}
+
 #[inline]
 pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Task>) {
     let thread = match thread {
@@ -35,3 +85,58 @@ pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Ta
     // valid or null.
     unsafe { binder_transaction(reply, raw_transaction(t), thread) }
 }
+
+#[inline]
+pub(crate) fn trace_transaction_received(t: &Transaction) {
+    // SAFETY: The raw transaction is valid for the duration of this call.
+    unsafe { binder_transaction_received(raw_transaction(t)) }
+}
+
+#[inline]
+pub(crate) fn trace_transaction_fd_send(t_debug_id: usize, fd: u32, offset: usize) {
+    // SAFETY: This function is always safe to call.
+    unsafe { binder_transaction_fd_send(t_debug_id as c_int, fd as c_int, offset) }
+}
+#[inline]
+pub(crate) fn trace_transaction_fd_recv(t_debug_id: usize, fd: u32, offset: usize) {
+    // SAFETY: This function is always safe to call.
+    unsafe { binder_transaction_fd_recv(t_debug_id as c_int, fd as c_int, offset) }
+}
+
+macro_rules! define_wrapper_lru_page_class {
+    ($($name:ident),* $(,)?) => {
+        $(
+            kernel::macros::paste! {
+                #[inline]
+                pub(crate) fn [<trace_ $name>](pid: Pid, page_index: usize) {
+                    // SAFETY: Always safe to call.
+                    unsafe { [<binder_ $name>](pid as c_int, page_index) }
+                }
+            }
+        )*
+    };
+}
+
+define_wrapper_lru_page_class!(
+    alloc_lru_start,
+    alloc_lru_end,
+    free_lru_start,
+    free_lru_end,
+    alloc_page_start,
+    alloc_page_end,
+    unmap_user_start,
+    unmap_user_end,
+    unmap_kernel_start,
+    unmap_kernel_end,
+);
+
+#[inline]
+pub(crate) fn trace_command(cmd: u32) {
+    // SAFETY: This function is always safe to call.
+    unsafe { binder_command(cmd) }
+}
+#[inline]
+pub(crate) fn trace_return(ret: u32) {
+    // SAFETY: This function is always safe to call.
+    unsafe { binder_return(ret) }
+}

-- 
2.52.0

