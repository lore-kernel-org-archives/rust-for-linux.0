Received: from outbound.pv.icloud.com (p-west1-cluster6-host12-snip4-9.eps.apple.com [57.103.67.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2623E8C7F
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759040; cv=none; b=P/bLfv/sWmvJ17idsP4v3rafdtFUvTYDEoOBbCA+C1hrK0pvoAavVoq1VJ1xDUDk54I4QoUsZnaAbOL/AWKA4Y0chxBLDIxYdjuZHGfHnRv9TNcGwQTjNMbBYHnByrmIYJQsstELWmCo7n2A5QLhWMCU20zH5rmkJpPt1sFzLk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759040; c=relaxed/simple;
	bh=lkB1cONJcYWK2pz8dnnJqwTyDVKxcbl+6T8fBGvDhDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/NMc4V3PAcgf4qPQPpS/bcl3oww5vS8LqK+PF+5tfobQzzNZGP1yjdxVgw9jV15mzqpRuQ0D6h6lmQgWeU/tAOr75SGyI6Wz3eoCvrx6D6zb/NGnlP6h978Cy+h8q5qRchSq8KTziIebTIIVsimbfCQ3+i6tARHS2LMYQ/ML2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=1Kk2nMAV; arc=none smtp.client-ip=57.103.67.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="1Kk2nMAV"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPS id 0579F180010C;
	Tue, 17 Mar 2026 14:50:30 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1773759038; x=1776351038; bh=5Af5R8AxBDtH7s4zwcQPN/pEvlnEtehUL32N393YgMM=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=1Kk2nMAV7+GxandBBg7j5MtewITVAjII2tIDgjOEkSeOnpnljg/36jB3I20O5tWOlAhX2/7oIppu47HRuLsRpKlsXP2yVHPS8CCfZN5NaTDmjcbVLYzPLd7JqhC5rrutaxmFgFloIWF218MmkO4Dzp9Mnm9p310l0f9sBhc18s4mg06FhwVyrZ9eEKXghMg0A+kZZPrriRrl+8k8iFQsE7mAqw9+QQxrnMWS5HmptTOc/CEsbQu4/lBUqtno6So4sL2K7Qzog1X+PXMbfI6oDitmzsWLyxCXYeCEfwsiQpbBMhbJ4AQgkP8mTRvNkU9wol6JIAuvOsVWNq8WoXajYw==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-4 (Postfix) with ESMTPSA id 0699818000B1;
	Tue, 17 Mar 2026 14:50:25 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Tue, 17 Mar 2026 17:49:47 +0300
Subject: [PATCH v3 6/6] rust_binder: add `command`/`return` tracepoints
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rust-binder-trace-v3-6-6fae4fbcf637@sdhn.cc>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4138; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=lkB1cONJcYWK2pz8dnnJqwTyDVKxcbl+6T8fBGvDhDY=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJk7s8S2x33VWdt/I+DY0+vbAnnElUU55BvObb6wx21zw
 r9T85/YdJSyMIhxMciKKbI8P+999OCPG2Znzu89BTOHlQlkCAMXpwBM5OoDhv/1tVOjzMzOa0U8
 aGi/mn/g8jGps1ONjX5Vh17mu5F4wo2D4X+UR01iwsfpRxe9W7es0710TRLnCZawPdsenSz8zm3
 ArMYLAA==
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMSBTYWx0ZWRfX5h0fZFkHh6AS
 2VgxMq5PuRYdBDUi9IH2cZI+MuQ1Ldwc8uVnjdQ3JnaJoisPs7l1h1vMqRGiNh5FlXnWVNIhF2l
 X7FWIZGOq9/fDmi8E5Oq2BKW+UvVQXXQEkZoKCxQyYvaWUIhkTG/owW3HnefSTeYrO+jF5pyrLy
 of9ROC2guaq7j70+j3cy859jRvZzBIKEvaqqFFJwlz+WUESQMDTnf1UiXNBqfoE+8XaH4faoIlT
 xcdj3Zs/gQj6T9e6pJWoB1293/r8vqQyxu6NQ/OoQvjXi9rl7HTMERQkIYODJE3up5Q+c5rebph
 ostx8WrS2qdcwKNkFSGXx1dixEkP/EHPbBBoa8/wQwr+gFbB45Z7yr4OpCP/J8=
X-Authority-Info-Out: v=2.4 cv=Xb2EDY55 c=1 sm=1 tr=0 ts=69b96a39
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=36TEhVjZt8-RUwybJdwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Whv-eyvqe4c0CUTHkH-atgsxhk0wi9qm
X-Proofpoint-ORIG-GUID: Whv-eyvqe4c0CUTHkH-atgsxhk0wi9qm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 clxscore=1030 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=772 spamscore=0 mlxscore=0 suspectscore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603170131

Add Rust Binder `command` and `return` tracepoint declarations and
wire them in where BC commands are parsed and BR return codes are
emitted to userspace.

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/rust_binder_events.h | 32 +++++++++++++++++++++++++++++
 drivers/android/binder/rust_binder_main.rs  |  1 +
 drivers/android/binder/thread.rs            |  1 +
 drivers/android/binder/trace.rs             | 13 ++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/drivers/android/binder/rust_binder_events.h b/drivers/android/binder/rust_binder_events.h
index 572a4bf7d..1a446787c 100644
--- a/drivers/android/binder/rust_binder_events.h
+++ b/drivers/android/binder/rust_binder_events.h
@@ -145,6 +145,38 @@ TRACE_EVENT(binder_transaction_fd_recv,
 		  __entry->debug_id, __entry->fd, __entry->offset)
 );
 
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
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index aa5f2a75a..1028e0a8a 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -116,6 +116,7 @@ fn new(writer: UserSliceWriter, thread: &'a Thread) -> Self {
     /// Write a return code back to user space.
     /// Should be a `BR_` constant from [`defs`] e.g. [`defs::BR_TRANSACTION_COMPLETE`].
     fn write_code(&mut self, code: u32) -> Result {
+        crate::trace::trace_return(code);
         stats::GLOBAL_STATS.inc_br(code);
         self.thread.process.stats.inc_br(code);
         self.writer.write(&code)
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 7301fc26d..ef7fba700 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1324,6 +1324,7 @@ fn write(self: &Arc<Self>, req: &mut BinderWriteRead) -> Result {
         while reader.len() >= size_of::<u32>() && self.inner.lock().return_work.is_unused() {
             let before = reader.len();
             let cmd = reader.read::<u32>()?;
+            crate::trace::trace_command(cmd);
             GLOBAL_STATS.inc_bc(cmd);
             self.process.stats.inc_bc(cmd);
             match cmd {
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace.rs
index c6f39d833..5539672d7 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -20,6 +20,8 @@
     unsafe fn binder_transaction_received(t: rust_binder_transaction);
     unsafe fn binder_transaction_fd_send(t_debug_id: c_int, fd: c_int, offset: usize);
     unsafe fn binder_transaction_fd_recv(t_debug_id: c_int, fd: c_int, offset: usize);
+    unsafe fn binder_command(cmd: u32);
+    unsafe fn binder_return(ret: u32);
 }
 
 #[inline]
@@ -90,3 +92,14 @@ pub(crate) fn trace_transaction_fd_recv(t_debug_id: usize, fd: u32, offset: usiz
     // SAFETY: This function is always safe to call.
     unsafe { binder_transaction_fd_recv(t_debug_id as c_int, fd as c_int, offset) }
 }
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

