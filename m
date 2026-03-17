Received: from outbound.pv.icloud.com (p-west1-cluster6-host1-snip4-5.eps.apple.com [57.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E983EAC62
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759022; cv=none; b=aSVqG0b0ZE77UPVsbt3QBO+GjBZ5n6PE508X775W6px1qEK6fnOBcq3hMr8To/37yQs1GBwKqoQI9QldDAd7rCNRkJI4qvx0Bs3BkMHWgduSBnvsba9/RiPUcSxmgkLb8TUfc1sU7jaCuygLzvN5k34FsF0Ol1mmxqD6ruEtU7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759022; c=relaxed/simple;
	bh=b3sKiA3I2UPrO7DFxlsM9gt3rNS2y+IjIW3zFRGLlgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JwSa6kS70n57qfYpJCuDEBv2sP0/FTPIKAXtdQs7akQkUOdgkIpz2UVtO5DHh8Pfky/hiwqwNWe8DPN532n2UWz5aOIiI12E9POWGUlx2/bz6gBXGVGn0XMAtkepA8v5OHUchk/uHH/ouN9t4QumgxxG+p9w6KXx40J5vf9XrDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=whDnnoUq; arc=none smtp.client-ip=57.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="whDnnoUq"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id 56E7D180026C;
	Tue, 17 Mar 2026 14:50:17 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773759020; x=1776351020; bh=qJVh9GgUDfmmBe+voBK0cst60oUO4R21Zh7R7K3Vfco=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=whDnnoUqz9t1UxefLJ8OsZOO8ja3EmOwik7fvVJt6LpLaC2lG8jFmFcBByTLLUxKAw6zsLRQ1uCaZVgYgcZAByP7pmU6/1DbpKBUOzHJPmGFtNVAPVRjYVo2IaKpZDsduDuSdxOQ6h/JKcOZu97418ZZuIENAcBlFdVc1ZY23pmDwt4avOZw4Rjtqv8CYriHmjOBOb5Gag5uNa1En5x/Dz+Qnnj7DIF4tpR5fsrJTWZkKGQFv7pwg/56R8kbgA3RANdPt68hI+TIU3I8wxVj65U5/5y6iqDBW0JpmAXENfE62+ThwRNhU0bvMhAt6x13I2TvRaqssDZlf+akjzRgqg==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id 9EF291800324;
	Tue, 17 Mar 2026 14:50:12 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Tue, 17 Mar 2026 17:49:44 +0300
Subject: [PATCH v3 3/6] rust_binder: add `wait_for_work` tracepoint
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rust-binder-trace-v3-3-6fae4fbcf637@sdhn.cc>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3767; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=b3sKiA3I2UPrO7DFxlsM9gt3rNS2y+IjIW3zFRGLlgY=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJk7s8SmuEyeOnfhjI5aT4dOGYGKB8H9S65c5r7r8HTvB
 YuiO65OHaUsDGJcDLJiiizPz3sfPfjjhtmZ83tPwcxhZQIZwsDFKQATebyO4X9utEnNZZlmCW0Z
 Pb263Rv4P+47fHCnfmWJ7599vEy5f8IY/rs6yF6stol/PXNdy8u0ACHT9wzpDyKY9zE+SWz6fSg
 mmw0A
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Authority-Info-Out: v=2.4 cv=Wp4m8Nfv c=1 sm=1 tr=0 ts=69b96a2b
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jL07GuSrIXuna8Q43BAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfX1HZj2JpKXXza
 DH/CvzgCV5XKMBaC45Sm3EwjaQ3Si0NgHG8PQQaZ+RU4su9qGeEDtfObKcYY87mckt59o6K5Sc+
 yVg48YaUaQrnUgBAZjMarniQgej6kjDi0tN+grimxiBChinnh1THiAWKGUQga62lU8nlDLNeMu2
 ivC0BRz6AALwufoR7RYMB3MCE3fyVZgsq09rg5LsB9DCzW++8z2lDBM7iYoBfdn7WSC5oO95Xzu
 U+tdDxtNVHvs6iPZqzYafw5fSMAbkw/0VxXhZp3yLFzR79C5xF4WJyA1rhJfdv8patVfeX/c6Cx
 mkj6RJmNBEezdhCK/0B53caB6A/c9vUKv1fLyCtNiBbw9maTQd2Vs3I3pT1O4s=
X-Proofpoint-ORIG-GUID: j0qkV-2h2s56BqRdMZ9aERvHMnBBeCnS
X-Proofpoint-GUID: j0qkV-2h2s56BqRdMZ9aERvHMnBBeCnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1030
 mlxlogscore=980 spamscore=0 bulkscore=0 mlxscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170131

Add the Rust Binder `wait_for_work` tracepoint declaration and wire
it into the thread read path before selecting the work source.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/rust_binder_events.h | 18 ++++++++++++++++++
 drivers/android/binder/thread.rs            | 11 +++++++++--
 drivers/android/binder/trace.rs             |  7 +++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/rust_binder_events.h b/drivers/android/binder/rust_binder_events.h
index 4fda8576c..62b587c7c 100644
--- a/drivers/android/binder/rust_binder_events.h
+++ b/drivers/android/binder/rust_binder_events.h
@@ -51,6 +51,24 @@ DEFINE_RBINDER_FUNCTION_RETURN_EVENT(binder_ioctl_done);
 DEFINE_RBINDER_FUNCTION_RETURN_EVENT(binder_read_done);
 DEFINE_RBINDER_FUNCTION_RETURN_EVENT(binder_write_done);
 
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
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index bb36c5228..15657d6e9 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1412,11 +1412,18 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
             UserSlice::new(UserPtr::from_addr(read_start as _), read_len as _).writer(),
             self,
         );
-        let (in_pool, use_proc_queue) = {
+        let (in_pool, has_transaction, thread_todo, use_proc_queue) = {
             let inner = self.inner.lock();
-            (inner.is_looper(), inner.should_use_process_work_queue())
+            (
+                inner.is_looper(),
+                inner.current_transaction.is_some(),
+                !inner.work_list.is_empty(),
+                inner.should_use_process_work_queue(),
+            )
         };
 
+        crate::trace::trace_wait_for_work(use_proc_queue, has_transaction, thread_todo);
+
         let getter = if use_proc_queue {
             Self::get_work
         } else {
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
index 3b0458e27..1f62b2276 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -15,6 +15,7 @@
     unsafe fn binder_ioctl_done(ret: c_int);
     unsafe fn binder_read_done(ret: c_int);
     unsafe fn binder_write_done(ret: c_int);
+    unsafe fn binder_wait_for_work(proc_work: bool, transaction_stack: bool, thread_todo: bool);
     unsafe fn binder_transaction(reply: bool, t: rust_binder_transaction, thread: *mut task_struct);
 }
 
@@ -53,6 +54,12 @@ pub(crate) fn trace_write_done(ret: Result) {
     unsafe { binder_write_done(to_errno(ret)) }
 }
 
+#[inline]
+pub(crate) fn trace_wait_for_work(proc_work: bool, transaction_stack: bool, thread_todo: bool) {
+    // SAFETY: Always safe to call.
+    unsafe { binder_wait_for_work(proc_work, transaction_stack, thread_todo) }
+}
+
 #[inline]
 pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Task>) {
     let thread = match thread {

-- 
2.52.0

