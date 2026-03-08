Received: from outbound.pv.icloud.com (p-west1-cluster2-host7-snip4-6.eps.apple.com [57.103.64.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33AB23B632
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Mar 2026 01:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772933174; cv=none; b=qUJlldxLbnXYO0n0CZJGbhiQ7YLABSWfrkztkuWLfTuBC9Kv6yG9kwBXYNDvhF4EjBlvHFI+zjsA6MeqK56Wg7C4BEt3BbF72q78/g/g+OPv/FKU3GZCO2+T473ZOtU+39ZyH1Zo8swubtXejPUlTg3rdg9wZPRHkfD4UEuG0SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772933174; c=relaxed/simple;
	bh=1urO3W+tXQpxz7/cygxJHgwN7ArPo0nOtZjl1ZP95Z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZdNsAYDvpYKY6KRaoFHn9F2HCVc6kNNOolJBuQfffHsd+ADW9zdczUH45elWO+Cxsxwef0MuQKEdVQPf8bIHauVrHoXWkpi7/QyfvsvJZNwEx0+zgNUJ0UYq0ozKqBIpEsO7ZTv9b5lMTWufFQHQGMypBzmQbUvca5t1Loeqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=SlKrFJhF; arc=none smtp.client-ip=57.103.64.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="SlKrFJhF"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-15 (Postfix) with ESMTPS id 26BE718002D8;
	Sun,  8 Mar 2026 01:26:05 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1772933172; x=1775525172; bh=XdHlyaAEEcdA5hKeorywmqGd2sIe7DLH+uuYf9TpebA=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=SlKrFJhFFn7lnUcGhNdcphc01dTQVKvqD11/LmAPddtMVCWZY3pYcj0uP8I7QSYCVj7fiStyDeNuthiZnTnVCCu5YcBsPT9Z3g8NBOtEaFgCij3riyuyiGprLH0Wh+0O6HBG4Ryvz5yb7zzw5N2pprjTJN6cEmBsMNcneu6OB2g1Je/CXQGLxzQzIKWmgrnzsVLwPjSLx4O3U7m3zimk76NNJgAiKtiSPFuwW5G2XKliUvf/Ojji3fJVb9FcoD0j15Rhtq/XFXm6sRaFWUAaV8P69E+xJzsgrSL0QDCSwfesIl2Pnj6ezt3GuUDfvT95XxaDl0ORlVfaTL+pYiddNA==
mail-alias-created-date: 1772007648188
Received: from [127.0.0.1] (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-15 (Postfix) with ESMTPSA id E798218000A4;
	Sun,  8 Mar 2026 01:26:00 +0000 (UTC)
From: Mohamad Alsadhan <mo@sdhn.cc>
Date: Sun, 08 Mar 2026 04:24:36 +0300
Subject: [PATCH v2 3/3] rust_binder: add in the new tracepoint calls
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-rust-binder-trace-v2-3-9e38637a2193@sdhn.cc>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10445; i=mo@sdhn.cc;
 h=from:subject:message-id; bh=1urO3W+tXQpxz7/cygxJHgwN7ArPo0nOtZjl1ZP95Z4=;
 b=owGbwMvMwCV2WSbwWIGm61bG02pJDJlrLkg/XN1S8dnCxodnSqUHz0drtqZd9zUalX5sCd6oL
 n1BN/JTRykLgxgXg6yYIsvz895HD/64YXbm/N5TMHNYmUCGMHBxCsBE7Kcx/LPpYMmLKsr7/WO9
 QO6F+gVcN2tqJF3SOc4y+fZ/FWy/s4DhNyunlrPAhq/lcUdS3DkNQmfnvVUMCj+0btNyhvcc5yq
 z2QE=
X-Developer-Key: i=mo@sdhn.cc; a=openpgp;
 fpr=E7CF4BC5C1F8D836CCCFBDCAD31C51C6702945B5
X-Proofpoint-GUID: CpN1_YRrx-cTn2sf5QqXZSDzagSwSK58
X-Proofpoint-ORIG-GUID: CpN1_YRrx-cTn2sf5QqXZSDzagSwSK58
X-Authority-Info-Out: v=2.4 cv=TZObdBQh c=1 sm=1 tr=0 ts=69acd031
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=IkcTkHD0fZMA:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zAWbjIijrVrU-cM0pgIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDAxMSBTYWx0ZWRfX4y4DYj/GxE45
 T0y4mIKPrYBt4J/hkKPmSYwLguGIugrsGqfH7BKFe6b95B8ETs1eJ8yEjel70NLcDCOdEblpj+k
 ovdIkcyZRGOcx47vJKPm/WYvxHC8ixYJnZje3wS9O45QF0hISB5MoBTMNuZGu+dP4iIjwtQQuw3
 gDnLzIILdXV6NSQYvoOQGtaskxkOhq614vYusY0qbkrW5bJQYwYidnQtjofJJLITVcxbbHQNer2
 lpRUyjnK/aLyPkgaardnj6Pk/qpoI3U+9gXrZRUGMiYicc2y4JBvbGNzhgRaQL+c7/bkQkCIJJe
 RhxoLOVaThSuASkWptBr9319QJP4Hf2vANZp1kyL+kLQb4YifFnqtVGA10Iha8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_08,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1030
 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2603080011

Wire the new Rust Binder tracepoints into live execution paths.

Hook trace calls into:

- ioctl entry/exit (`binder_ioctl`, `binder_ioctl_done`)
- command parsing and return writes (`binder_command`,
  `binder_return`)
- read/write completion (`binder_read_done`, `binder_write_done`)
- wait (`binder_wait_for_work`)
- transaction (`binder_transaction_received`)
- fd translation (`binder_transaction_fd_{send,recv}`)
- buffer/page lifecycle (`binder_alloc_*`, `binder_free_*`,
  `binder_unmap_*`)

Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
---
 drivers/android/binder/allocation.rs       |  1 +
 drivers/android/binder/page_range.rs       | 17 +++++++++++++++++
 drivers/android/binder/process.rs          |  7 +++++--
 drivers/android/binder/rust_binder_main.rs |  1 +
 drivers/android/binder/thread.rs           | 15 +++++++++++++--
 drivers/android/binder/transaction.rs      |  2 ++
 6 files changed, 39 insertions(+), 4 deletions(-)

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
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index fdd97112e..43fe23907 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -327,6 +327,8 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
 
             // SAFETY: The pointer is valid, and we hold the lock so reading from the page is okay.
             if let Some(page) = unsafe { PageInfo::get_page(page_info) } {
+                crate::trace::trace_alloc_lru_start(self.pid, i);
+
                 // Since we're going to use the page, we should remove it from the lru list so that
                 // the shrinker will not free it.
                 //
@@ -335,9 +337,12 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
                 // The shrinker can't free the page between the check and this call to
                 // `list_lru_del` because we hold the lock.
                 unsafe { PageInfo::list_lru_del(page_info, page.nid(), self.shrinker) };
+
+                crate::trace::trace_alloc_lru_end(self.pid, i);
             } else {
                 // We have to allocate a new page. Use the slow path.
                 drop(inner);
+                crate::trace::trace_alloc_page_start(self.pid, i);
                 // SAFETY: `i < end <= inner.size` so `i` is in bounds.
                 match unsafe { self.use_page_slow(i) } {
                     Ok(()) => {}
@@ -346,6 +351,7 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
                         return Err(err);
                     }
                 }
+                crate::trace::trace_alloc_page_end(self.pid, i);
                 inner = self.lock.lock();
             }
         }
@@ -448,8 +454,12 @@ pub(crate) fn stop_using_range(&self, start: usize, end: usize) {
 
             // SAFETY: Okay for reading since we have the lock.
             if let Some(page) = unsafe { PageInfo::get_page(page_info) } {
+                crate::trace::trace_free_lru_start(self.pid, i);
+
                 // SAFETY: The pointer is valid, and it's the right shrinker.
                 unsafe { PageInfo::list_lru_add(page_info, page.nid(), self.shrinker) };
+
+                crate::trace::trace_free_lru_end(self.pid, i);
             }
         }
     }
@@ -667,6 +677,7 @@ fn drop(self: Pin<&mut Self>) {
     let mmap_read;
     let mm_mutex;
     let vma_addr;
+    let pid;
 
     {
         // CAST: The `list_head` field is first in `PageInfo`.
@@ -700,7 +711,9 @@ fn drop(self: Pin<&mut Self>) {
 
         // SAFETY: Both pointers are in bounds of the same allocation.
         page_index = unsafe { info.offset_from(inner.pages) } as usize;
+        pid = range.pid;
 
+        crate::trace::trace_unmap_kernel_start(pid, page_index);
         // SAFETY: We hold the spinlock, so we can take the page.
         //
         // This sets the page pointer to zero before we unmap it from the vma. However, we call
@@ -709,6 +722,8 @@ fn drop(self: Pin<&mut Self>) {
         page = unsafe { PageInfo::take_page(info) };
         vma_addr = inner.vma_addr;
 
+        crate::trace::trace_unmap_kernel_end(pid, page_index);
+
         // From this point on, we don't access this PageInfo or ShrinkablePageRange again, because
         // they can be freed at any point after we unlock `lru_lock`. This is with the exception of
         // `mm_mutex` which is kept alive by holding the lock.
@@ -719,7 +734,9 @@ fn drop(self: Pin<&mut Self>) {
 
     if let Some(vma) = mmap_read.vma_lookup(vma_addr) {
         let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
+        crate::trace::trace_unmap_user_start(pid, page_index);
         vma.zap_page_range_single(user_page_addr, PAGE_SIZE);
+        crate::trace::trace_unmap_user_end(pid, page_index);
     }
 
     drop(mmap_read);
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
index 0b62d24b2..ef7fba700 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -706,6 +706,7 @@ fn translate_object(
                     core::mem::offset_of!(uapi::binder_fd_object, __bindgen_anon_1.fd);
 
                 let field_offset = offset + FD_FIELD_OFFSET;
+                crate::trace::trace_transaction_fd_send(view.alloc.debug_id, fd, field_offset);
 
                 view.alloc.info_add_fd(file, field_offset, false)?;
             }
@@ -1323,6 +1324,7 @@ fn write(self: &Arc<Self>, req: &mut BinderWriteRead) -> Result {
         while reader.len() >= size_of::<u32>() && self.inner.lock().return_work.is_unused() {
             let before = reader.len();
             let cmd = reader.read::<u32>()?;
+            crate::trace::trace_command(cmd);
             GLOBAL_STATS.inc_bc(cmd);
             self.process.stats.inc_bc(cmd);
             match cmd {
@@ -1412,11 +1414,18 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
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
@@ -1482,6 +1491,7 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
         let mut ret = Ok(());
         if req.write_size > 0 {
             ret = self.write(&mut req);
+            crate::trace::trace_write_done(ret);
             if let Err(err) = ret {
                 pr_warn!(
                     "Write failure {:?} in pid:{}",
@@ -1498,6 +1508,7 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
         // Go through the work queue.
         if req.read_size > 0 {
             ret = self.read(&mut req, wait);
+            crate::trace::trace_read_done(ret);
             if ret.is_err() && ret != Err(EINTR) {
                 pr_warn!(
                     "Read failure {:?} in pid:{}",
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 75e6f5fba..c43846bb7 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -430,6 +430,8 @@ fn do_work(
 
         self.drop_outstanding_txn();
 
+        crate::trace::trace_transaction_received(&self);
+
         // When this is not a reply and not a oneway transaction, update `current_transaction`. If
         // it's a reply, `current_transaction` has already been updated appropriately.
         if self.target_node.is_some() && tr_sec.transaction_data.flags & TF_ONE_WAY == 0 {

-- 
2.52.0

