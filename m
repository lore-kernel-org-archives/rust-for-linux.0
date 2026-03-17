Received: from outbound.pv.icloud.com (p-west1-cluster6-host11-snip4-10.eps.apple.com [57.103.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346A93E867C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759031; cv=none; b=gIypdOhIge9l9jmfT1xK4NTGwTQkqkBbNSuBU0JxGCoQ3gZtUMCtgVUGvQRv4v+fmG5WjzlQlViZDV2DYdyajgWQIbC9USm+bicCIKWgua4VImCeMf6nYEXW+8jsYLFQ90bvoREaEJcOeTHF8MAhh9lVexmNKZ0e3s9BHEXELyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759031; c=relaxed/simple;
	bh=Ufd27E/w023CbcsK9unZtdTj58IEkiQWwrkpWVCkpO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyETgSMlwMZAjjzmPSzXg2Fv9D5pvvqHMusWSllrBr1H9D+nU71HxCPm7kD+EeTvJuBrM0WK3J8tjypm7VwYfwbqtmR45MnrduaYiG2HmJ8UPQN1SbABfCSI+gQKPq0wn7yf2nvSUp13ydSLJyDEHPmGRP6PMwmhciPzJN+/xqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=KdirNtPO; arc=none smtp.client-ip=57.103.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="KdirNtPO"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id 651CE1800118;
	Tue, 17 Mar 2026 14:50:26 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773759029; x=1776351029; bh=5BrcoQ7R4KH3Vp94QqZwz7zmQGWW0dMOlFj/ol/THg0=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=KdirNtPO1QqV+r5vlImmBEYJQb2q3fRXYseZFflvhKBjMdrCAsCnUab7rVcYX2zYkScz6URuLbA1F5U4m8bpMQ6LB1TtW/WpOWM3zfutwKS75troxS9pkCBSfMBXl6nxS7HAxc/BkWL57+sPCDQOj+t7wmgy9Cdugs4FVnvcoXvjF9hqb3rdp6mecYDhKk6ccKN86eBUf6iAtrKDA4DQFIX1eG2k4XslYmmq68Il7NawgIh74vCYVhISnCYOlO9CuW6qgTi0mzMmKFGNuNpFuSj+rqy4YXj85HO+PYJFO10UP80IkR9gyXBvGQIRyJQZoIc9C8kQNAqVogBK035jzw==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id 870391800099;
	Tue, 17 Mar 2026 14:50:21 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Tue, 17 Mar 2026 17:49:46 +0300
Subject: [PATCH v3 5/6] rust_binder: add fd translation tracepoints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rust-binder-trace-v3-5-6fae4fbcf637@sdhn.cc>
References: <20260317-rust-binder-trace-v3-0-6fae4fbcf637@sdhn.cc>
In-Reply-To: <20260317-rust-binder-trace-v3-0-6fae4fbcf637@sdhn.cc>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5146; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=Ufd27E/w023CbcsK9unZtdTj58IEkiQWwrkpWVCkpO8=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJk7s8SWvjub3jt3WcZ/MaZHNwIfajkFClz/fDuJ1dt11
 6qpCstaOkpZGMS4GGTFFFmen/c+evDHDbMz5/eegpnDygQyhIGLUwAmIniDkeH3Dovl5QHfdeoq
 nu8OkCvw+25mccfp4+GUy0GHIvw3V91g+J+2X/x97qypc8/N3/Be7fIZjmWXlj+f5WBqec181oV
 Zc3IYAQ==
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfX4Uh4zvKxNOIL
 LAy45kpjt2wG6l7otyx2t4jBA2+DHy4LHfsroIvEVDoTlYfrZHwpX5oVXc2hcsmHnlxhBO+Dxtj
 IOK+jFwhuR7M54gcXx7omUxz0nD4yhDkex9IU53KdAIENj5M9PYcmfaCnjEX3EC0GAki7Wi/Z50
 QYusYgLF+fDUQRb7Yk/K3w628/X+zEqsA4H97jaWapztNqx/Ok3bqkbIoa7V9wWicf6w9nqa8vv
 v4Z5FEsEX0M8vwbTb+Ix8xVP4wusLsdGoJ6av425e5eZ2r68briZiiBjZCM0CdB6G3Xeoqo6jka
 O1ppWczWiLyYWTBzjR7kl1r5Iv0ArdgIpu2uVbrqqrBn6lX2HfkhToUuc4FznE=
X-Authority-Info-Out: v=2.4 cv=K6Mv3iWI c=1 sm=1 tr=0 ts=69b96a34
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ARmr7P9M_ubLem6nxnMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ilByIYBr00OjB2UdofX2k-VnZ1r-y_xA
X-Proofpoint-ORIG-GUID: ilByIYBr00OjB2UdofX2k-VnZ1r-y_xA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=924 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1030 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170131

Add Rust Binder tracepoint declarations for both `transaction_fd_send`
and `transaction_fd_recv`. Also, wire in the corresponding trace calls
where fd objects are serialised/deserialised.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/allocation.rs        |  1 +
 drivers/android/binder/rust_binder.h        |  5 +++++
 drivers/android/binder/rust_binder_events.h | 34 +++++++++++++++++++++++++++++
 drivers/android/binder/thread.rs            |  1 +
 drivers/android/binder/trace.rs             | 13 +++++++++++
 5 files changed, 54 insertions(+)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 7f65a9c3a..8c0f94463 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -208,6 +208,7 @@ pub(crate) fn translate_fds(&mut self) -> Result<TranslatedFds> {
             let res = FileDescriptorReservation::get_unused_fd_flags(bindings::O_CLOEXEC)?;
             let fd = res.reserved_fd();
             self.write::<u32>(file_info.buffer_offset, &fd)?;
+            crate::trace::trace_transaction_fd_recv(self.debug_id, fd, file_info.buffer_offset);
 
             reservations.push(
                 Reservation {
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
index 8a0b72bf0..572a4bf7d 100644
--- a/drivers/android/binder/rust_binder_events.h
+++ b/drivers/android/binder/rust_binder_events.h
@@ -111,6 +111,40 @@ TRACE_EVENT(binder_transaction_received,
 	TP_printk("transaction=%d", __entry->debug_id)
 );
 
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
 #endif /* _RUST_BINDER_TRACE_H */
 
 /* This part must be outside protection */
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 15657d6e9..7301fc26d 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -706,6 +706,7 @@ fn translate_object(
                     core::mem::offset_of!(uapi::binder_fd_object, __bindgen_anon_1.fd);
 
                 let field_offset = offset + FD_FIELD_OFFSET;
+                crate::trace::trace_transaction_fd_send(view.alloc.debug_id, fd, field_offset);
 
                 view.alloc.info_add_fd(file, field_offset, false)?;
             }
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
index d96afdb79..c6f39d833 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -18,6 +18,8 @@
     unsafe fn binder_wait_for_work(proc_work: bool, transaction_stack: bool, thread_todo: bool);
     unsafe fn binder_transaction(reply: bool, t: rust_binder_transaction, thread: *mut task_struct);
     unsafe fn binder_transaction_received(t: rust_binder_transaction);
+    unsafe fn binder_transaction_fd_send(t_debug_id: c_int, fd: c_int, offset: usize);
+    unsafe fn binder_transaction_fd_recv(t_debug_id: c_int, fd: c_int, offset: usize);
 }
 
 #[inline]
@@ -77,3 +79,14 @@ pub(crate) fn trace_transaction_received(t: &Transaction) {
     // SAFETY: The raw transaction is valid for the duration of this call.
     unsafe { binder_transaction_received(raw_transaction(t)) }
 }
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

-- 
2.52.0

