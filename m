Received: from outbound.mr.icloud.com (p-west2-cluster4-host2-snip4-6.eps.apple.com [57.103.69.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCAD3242D9
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 05:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.69.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772862161; cv=none; b=ALYT4rXSEpy9usOIpkdqm8/ltObXVyzN3mdG1ry2QgJV49fGmOpatmW/V/vg8JscG9YzWF6rsYemsEHuaJqdJAqwAiK11aVFXykNuAvD3WXDEd18O380s2n5TOqUh+/khqsLnmKv6+KCN0qmpgpDUqq4ygfMXFVe9Pou/dKbjSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772862161; c=relaxed/simple;
	bh=ZSjmcrdV34bzKXpWd6cHEsF5+ig9nZV5X885Ax1Wnmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sb5Ln2hJo+GFytphXvQn+Rl9y0+jqXEi/a7LONXsLSBbHpSeaIOQ1sZUvC7GaRCE9fyYFR3rYCSkCrllVQL9qXZo/0nSHJTRf9xXnAZZA9yrXBfYipasPWTIEc0PA86c0deJhK6PKA3bseIppN7EzvHLAF83ydn+X55GEVtj9bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=vbHUWKX3; arc=none smtp.client-ip=57.103.69.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="vbHUWKX3"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-9 (Postfix) with ESMTPS id B65D01800185;
	Sat,  7 Mar 2026 05:42:37 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772862159; x=1775454159; bh=KssQoUW/on33937pJ9+KEqYfwRqQfvvxPh/DLlwy+no=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=vbHUWKX3WuObe8XcgdavxkUK/y5FQb8Sn4yreV32ycXZ4JLCnmfxDbu/qrvsqMdZanSmNmABdcPrMLbZ1nQU46TBAsKhWp7ESOtGPwEslGcZZ1TvRD7AgK8hNWIuY1SxTqwqUjmbrrh95u/1IShXVOTIuk5+iGt3Pdmu04wd+7cP7wypNEQt8D5QCwP9Er4h/zcxfQEKQtOcYhp55Oq6sSXHg9zmdhX7kGvluAL74/AZBIgpVAIPtFiamvmbr2LzORkfdNulqtHdKJtLz830loSyYp9/7BuHYQcdRPS+kuz+SoQDCZ9AWuR+Ux26ZHOJK0QPDIR98ZcRQaUfEjYhqg==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-9 (Postfix) with ESMTPSA id 1935718000AB;
	Sat,  7 Mar 2026 05:42:32 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Sat, 07 Mar 2026 08:41:22 +0300
Subject: [PATCH 2/3] rust_binder: add Rust binder tracepoints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-rust-binder-trace-v1-2-5e03283c6e53@sdhn.cc>
References: <20260307-rust-binder-trace-v1-0-5e03283c6e53@sdhn.cc>
In-Reply-To: <20260307-rust-binder-trace-v1-0-5e03283c6e53@sdhn.cc>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13805; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=ZSjmcrdV34bzKXpWd6cHEsF5+ig9nZV5X885Ax1Wnmo=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJmrd+03K1xxhM/Q8eau/Oe/L73YMsHfOjF/6aMvm8Sff
 HoZ2+3k0FHKwiDGxSArpsjy/Lz30YM/bpidOb/3FMwcViaQIQxcnAIwkUJZhn+2vNMc/8xfyXNO
 K3lmw7uVMull0nM5/zY8a/Py3jdbpViM4SejpsEhvuymkDM//JU2Keye9K1V56vzQv01WisXsiQ
 9zeEAAA==
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDA0OSBTYWx0ZWRfX6/e6AJcF9u9B
 G1FqH7gypmn8tvj3TPmeN81f/kcgOKBIoIwTZlX5BDTOge9/PXExvwMMi0YlyT0zwidp5QNdPxP
 2W12hyLNEdTUfv/HYewbxAfLqSqYEuX+F755rlljHRUeC3c1X3JAxnJrBrmHQ8nwXXVW0ixES/E
 xBHS8vRMFlIxvzJFp9A6WWfgx17PNe4R/AuOUg7qzpaV0tb2O8MYFYFithcQLKC4sGUPYmdDgoq
 dbqsTmIo2G7AXbkL6jq0delB7GM6ONIRaKLlvwOaoxTv6sBT0lcfRDhu3SGPI3In0eiL6+e0Htg
 mC9mN/7sqi4/gssr5T0LSX2ZkTyW70pC81sXrrcAVA0N464Pwe05xE07VosFRw=
X-Authority-Info-Out: v=2.4 cv=E97AZKdl c=1 sm=1 tr=0 ts=69abbacf
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=1XWaLZrsAAAA:8 a=GLZNLDFE_iTv8WvtVSgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1rFqbj5kQ4B482NOkpuHg7sXYZa8_ykL
X-Proofpoint-ORIG-GUID: 1rFqbj5kQ4B482NOkpuHg7sXYZa8_ykL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 clxscore=1030 phishscore=0 adultscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2603070049
X-JNJ: AAAAAAABI1dkXKzm58p362nc13O7HdXWNBZAT8T+ineSqm32jJXVpNN7Usc960NgoSNTMfUj8paYZ1cAtYMLpogWGThiS91uqHGM61mU+0XOY2EOCIq0UtlBYHvfhjE73HGPGHsTho1cW8R1aO38vdAjw48Tu6QWtcvccE88LtoCp+ij3ANQE6vF/Qnq3F101N9u9SQX87LJehLnMcp1OceZ9lrDqsFgGZVbOysPgjhd4DncHeNMxsrwk7e1ByjKIe0VLgRjjGNzMG2PlnGBsQ4SYzv4a+vsAPvDwcV4mpZAqbtzegaMH3dWgVRxh4sKCXCJQf+N3xFDLFqcvnI1PR7/zqSQp9y9z0jVX3lhbBKl7hYgZ2meBcJLFhAX9Qvmj8oj6U3NK6BjS5y+7tAtKQd/DZpHkTJFixhqZuYbTSDRU587iUqRxJp3Fm80SyJznv7dSNZImvKx23KiNDa2fNDveIchvwdbs+wDeLP2hk1i6y9Zz8HUfezQ1budeAlosAYFzvRzMYgRxW65w+matMtqj2sDJN9WVGEUuPYOAFzJO+0jL3t/gFJ9qqxfWsyTJNWko4hHQRojEszrlWxCn0jR8x3UE0wIwSxx57TT/1qOGOSo0gH3C7mS55CvoZzoJP2yxMmD57+8w5411iTysxQAXgPk8tpfcVh8Wvgp6eeSUGbYXYLI33mEq/sTV0FhP79j9FOO3xUooPU2dUS7cBNcqhx11wAvM74lJ28UsaWoQTE5XvZ41tOMD1zr0ZBzCROPe16X46scqFYlr5kNX7gL6EFh62PRnz8VtY9D8muFAhTpRtkK

New tracepoints: `{ioctl,read,write}_done`, `wait_for_work`,
`transaction_received`, `transaction_fd_{send,recv}`,
`{alloc,free}_lru_{start,end}`, `alloc_page_{start,end}`,
`unmap_{user,kernel}_{start,end}`, `command` and `return`.

Link: https://github.com/Rust-for-Linux/linux/issues/1226
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/rust_binder.h        |  28 +++--
 drivers/android/binder/rust_binder_events.h | 172 ++++++++++++++++++++++++++++
 drivers/android/binder/trace.rs             | 111 +++++++++++++++++-
 3 files changed, 299 insertions(+), 12 deletions(-)

diff --git a/drivers/android/binder/rust_binder.h b/drivers/android/binder/rust_binder.h
index d2284726c..b27283fc9 100644
--- a/drivers/android/binder/rust_binder.h
+++ b/drivers/android/binder/rust_binder.h
@@ -59,44 +59,52 @@ extern const struct rust_binder_layout RUST_BINDER_LAYOUT;
 
 static inline size_t rust_binder_transaction_debug_id(rust_binder_transaction t)
 {
-	return *(size_t *) (t + RUST_BINDER_LAYOUT.t.debug_id);
+	return *(size_t *)(t + RUST_BINDER_LAYOUT.t.debug_id);
 }
 
 static inline u32 rust_binder_transaction_code(rust_binder_transaction t)
 {
-	return *(u32 *) (t + RUST_BINDER_LAYOUT.t.code);
+	return *(u32 *)(t + RUST_BINDER_LAYOUT.t.code);
 }
 
 static inline u32 rust_binder_transaction_flags(rust_binder_transaction t)
 {
-	return *(u32 *) (t + RUST_BINDER_LAYOUT.t.flags);
+	return *(u32 *)(t + RUST_BINDER_LAYOUT.t.flags);
 }
 
 // Nullable!
-static inline rust_binder_node rust_binder_transaction_target_node(rust_binder_transaction t)
+static inline rust_binder_node
+rust_binder_transaction_target_node(rust_binder_transaction t)
 {
-	void *p = *(void **) (t + RUST_BINDER_LAYOUT.t.target_node);
+	void *p = *(void **)(t + RUST_BINDER_LAYOUT.t.target_node);
 
 	if (p)
 		p = p + RUST_BINDER_LAYOUT.n.arc_offset;
 	return p;
 }
 
-static inline rust_binder_process rust_binder_transaction_to_proc(rust_binder_transaction t)
+static inline rust_binder_process
+rust_binder_transaction_to_proc(rust_binder_transaction t)
 {
-	void *p = *(void **) (t + RUST_BINDER_LAYOUT.t.to_proc);
+	void *p = *(void **)(t + RUST_BINDER_LAYOUT.t.to_proc);
 
 	return p + RUST_BINDER_LAYOUT.p.arc_offset;
 }
 
-static inline struct task_struct *rust_binder_process_task(rust_binder_process t)
+static inline struct task_struct *
+rust_binder_process_task(rust_binder_process t)
 {
-	return *(struct task_struct **) (t + RUST_BINDER_LAYOUT.p.task);
+	return *(struct task_struct **)(t + RUST_BINDER_LAYOUT.p.task);
 }
 
 static inline size_t rust_binder_node_debug_id(rust_binder_node t)
 {
-	return *(size_t *) (t + RUST_BINDER_LAYOUT.n.debug_id);
+	return *(size_t *)(t + RUST_BINDER_LAYOUT.n.debug_id);
+}
+
+static inline binder_uintptr_t rust_binder_node_ptr(rust_binder_node t)
+{
+	return *(binder_uintptr_t *)(t + RUST_BINDER_LAYOUT.n.ptr);
 }
 
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
index d54b18ab7..e270d08a5 100644
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
@@ -19,12 +39,44 @@ fn raw_transaction(t: &Transaction) -> rust_binder_transaction {
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
+
+
 #[inline]
 pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Task>) {
     let thread = match thread {
@@ -35,3 +87,58 @@ pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Ta
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

