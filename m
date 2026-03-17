Received: from outbound.pv.icloud.com (pv-2001d-snip4-11.eps.apple.com [57.103.64.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1166F3E9F92
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759016; cv=none; b=ADjNZBPYNEUwo1VAxcgXZbbecmF32YvSVVoj6Oenl45R5aZdw67bd7sa+hp1FV3Z5if7j1xrpYgC+Q+dVjyIf0Fi8xSFAYKHsRunNkOFFHesmlMfsK+HMUA/sWJh2wFINneBlcCt+LqxQwoHK/1Qdzi1c23UeLv/hSM6aRg3VUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759016; c=relaxed/simple;
	bh=rZ5vmLfwmAILf4BW/mDo5iQH52qia9nO5WjD7vk/frQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0/GLOFQCpIX6smmPMNVWwZmoya1d3KNsK7qGQWB1vPCVxxXt1fuLiuka1FjN5PO3DRsNGrp0MgNF8vFACowy2aM4fuGAOiRpEdovFoJ0ecoctFJEfFcqA+HpKyEKF2JwNLWnUCowbfQxpR/qxumky0IvR0GhBuCBJt3WgrE+M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=H7OnABFs; arc=none smtp.client-ip=57.103.64.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="H7OnABFs"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id A5646180032C;
	Tue, 17 Mar 2026 14:50:12 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773759014; x=1776351014; bh=4aiSl+Rr7WuyZ37AduFnlgEdsISQgjhqsxKN6FfXFbI=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=H7OnABFsK63hfycDYNhEcQmN3wnp61FoIehghIGJTOWAfeoUSQijrYcgMYosT+yQuzgSHr4G0S3EbmUKGWLk8Ed3dRxIPpyJZQPTjQ0aHWzbqQZZVae3ffvy9lsAmJYQk5mmFd37JLtXcbH3YQUt9XlbjOhkD5sl85Qj7JoiXu1HA+RLo0Qf/JGYMA20lGqzoOidaRZTkve1qNWk983K+bANxedpGln6x/s9xfJzSale1Bxk7NrzhHPJ4tHrUS1/rIps4w7qr7OjtZ4Zg76gh2imBCQjAfgag37jDScjWatzRQWWubP3D8HCk4r4MFr+Q2DCSqraTta6m+OgHZMglg==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id 2BA6B18000B7;
	Tue, 17 Mar 2026 14:50:07 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Tue, 17 Mar 2026 17:49:43 +0300
Subject: [PATCH v3 2/6] rust_binder: add ioctl/read/write done tracepoints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rust-binder-trace-v3-2-6fae4fbcf637@sdhn.cc>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5411; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=rZ5vmLfwmAILf4BW/mDo5iQH52qia9nO5WjD7vk/frQ=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJk7s8Q2d93kYdz08M50joLimRUT2qJazj/5cTnfW712p
 XC9e9ShjlIWBjEuBlkxRZbn572PHvxxw+zM+b2nYOawMoEMYeDiFICJ7FnNyPDH7DPT3R8Cl4vf
 zD/o6bPqg92uvgMeVU5sh1cp3A9tqLZiZDj0bpZWqeyp8G/9r1YfsYt8d/z4tKNK+TNvMLOc3sd
 ev4gLAA==
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-ORIG-GUID: WuAH2WXJLwNQIWLbLamneFRJfvBLrWHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfXwh0W3tJw/tkQ
 LNDuVfBQkIzeGGTggUcLm4gccBRYJJrWIMOrIUl8WkMVsTQrzaIQj39SUjzAUJXbCigr5+6cgbI
 uuRfKCGMe//fE51Hde8nR27ZXXE2hByYj8RosSBBTesmknhfgV0Mqc9hyr5BFpV4niUkscwlMV0
 jNIdESQP5KTBGhjlT7MrC42XJeeybZ/lzUGfU5+/MWY7QcNI0jNH9BQyT0p026H+++L0jzBlFAd
 s2Bup5FGootOsevz9eCxUt7kxAudmRUkTR82DF6WIqugjaARqsliMAh8e8PmquDXfSj6nzegm4w
 E0qiHyBR+B5o4k+jFXxT6c2w1PP2cn5nQXUwE14rpbL6pPLcbWC5A/8hcdSGhY=
X-Authority-Info-Out: v=2.4 cv=d+34CBjE c=1 sm=1 tr=0 ts=69b96a25
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mWTqjtZJWV9exWTXMMAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: WuAH2WXJLwNQIWLbLamneFRJfvBLrWHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 adultscore=0 clxscore=1030 mlxlogscore=999 spamscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170131

Add Rust Binder tracepoints declarations for `ioctl_done`,
`read_done` and `write_done`.

Additionally, wire in the new tracepoints into the corresponding
Binder call sites.

Note that the new tracepoints report final errno-style return values,
matching the existing C model for operation completion.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/process.rs           |  7 +++++--
 drivers/android/binder/rust_binder_events.h | 21 ++++++++++++++++++++
 drivers/android/binder/thread.rs            |  2 ++
 drivers/android/binder/trace.rs             | 30 ++++++++++++++++++++++++++++-
 4 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 41de55931..4d7b165e7 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1656,11 +1656,14 @@ pub(crate) fn ioctl(this: ArcBorrow<'_, Process>, file: &File, cmd: u32, arg: us
 
         const _IOC_READ_WRITE: u32 = _IOC_READ | _IOC_WRITE;
 
-        match _IOC_DIR(cmd) {
+        let res = match _IOC_DIR(cmd) {
             _IOC_WRITE => Self::ioctl_write_only(this, file, cmd, &mut user_slice.reader()),
             _IOC_READ_WRITE => Self::ioctl_write_read(this, file, cmd, user_slice),
             _ => Err(EINVAL),
-        }
+        };
+
+        crate::trace::trace_ioctl_done(res);
+        res
     }
 
     pub(crate) fn mmap(
diff --git a/drivers/android/binder/rust_binder_events.h b/drivers/android/binder/rust_binder_events.h
index e3adfb931..4fda8576c 100644
--- a/drivers/android/binder/rust_binder_events.h
+++ b/drivers/android/binder/rust_binder_events.h
@@ -30,6 +30,27 @@ TRACE_EVENT(binder_ioctl,
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
 TRACE_EVENT(binder_transaction,
 	TP_PROTO(bool reply, rust_binder_transaction t, struct task_struct *thread),
 	TP_ARGS(reply, t, thread),
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 0b62d24b2..bb36c5228 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1482,6 +1482,7 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
         let mut ret = Ok(());
         if req.write_size > 0 {
             ret = self.write(&mut req);
+            crate::trace::trace_write_done(ret);
             if let Err(err) = ret {
                 pr_warn!(
                     "Write failure {:?} in pid:{}",
@@ -1498,6 +1499,7 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
         // Go through the work queue.
         if req.read_size > 0 {
             ret = self.read(&mut req, wait);
+            crate::trace::trace_read_done(ret);
             if ret.is_err() && ret != Err(EINTR) {
                 pr_warn!(
                     "Read failure {:?} in pid:{}",
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
index d54b18ab7..3b0458e27 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -5,12 +5,16 @@
 use crate::transaction::Transaction;
 
 use kernel::bindings::{rust_binder_transaction, task_struct};
-use kernel::ffi::{c_uint, c_ulong};
+use kernel::error::Result;
+use kernel::ffi::{c_int, c_uint, c_ulong};
 use kernel::task::Task;
 use kernel::tracepoint::declare_trace;
 
 declare_trace! {
     unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
+    unsafe fn binder_ioctl_done(ret: c_int);
+    unsafe fn binder_read_done(ret: c_int);
+    unsafe fn binder_write_done(ret: c_int);
     unsafe fn binder_transaction(reply: bool, t: rust_binder_transaction, thread: *mut task_struct);
 }
 
@@ -19,12 +23,36 @@ fn raw_transaction(t: &Transaction) -> rust_binder_transaction {
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
 #[inline]
 pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Task>) {
     let thread = match thread {

-- 
2.52.0

