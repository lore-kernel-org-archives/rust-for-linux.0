Received: from mx0a-00641c01.pphosted.com (mx0a-00641c01.pphosted.com [205.220.165.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8BF15FA81;
	Mon,  7 Sep 2026 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771180; cv=none; b=g2g7w9Wraslo3HZisgyWut3NJzyy2crdrt13gUCKEW+/rpv+dN88hMdSqaQrK6uU6N7OY1/vkI0mpCaTDneEwydAY8w+l4XYWoSsGOLTRdb5LqRCFI5PZdPtYb+NQWFirZzHzoy+vvMtruc2HwXkUb/B68spgoKzLsjkFe/RDcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771180; c=relaxed/simple;
	bh=HArkahUBkRsmYbLxBJx6vXqz9gnFThygyG/y/jl1ofA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PhLcNqjlSDqA8Ygjf1YVBlOWtxjWfPVi1jH5iYshPMRnqf46+TdoEkFpLuHIwlcvCv9g0it8HQE7SQ0m0a5lZ/vdJbM40Xkh+sdZyxrbH+/Piz1kuRO2xS6UCc6FvE1/Ps8LfgqseAZidd1jGnwlNqWOV+5qzTYIrH8rX9G43Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uw.edu; spf=pass smtp.mailfrom=uw.edu; dkim=pass (2048-bit key) header.d=uw.edu header.i=@uw.edu header.b=b2fbuoNQ; arc=none smtp.client-ip=205.220.165.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uw.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uw.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uw.edu header.i=@uw.edu header.b="b2fbuoNQ"
Received: from pps.filterd (m0247475.ppops.net [127.0.0.1])
	by mx0a-00641c01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6878gLiQ745451;
	Mon, 7 Sep 2026 08:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uw.edu; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=Jan2024; bh=Q0Fwyvon/Ebohmfi/TF/umN/z5dQZcOyk2ffc
	hsKWy8=; b=b2fbuoNQyKRzUdj8XBZKGKOnribur6PoFAwz/XYA21+HHhyeYWLXL
	SFdYinjQADCFo86yBstiQUUvMp365bExVIRDjbOHKjH0kkCKRu6PCgzvdEYBM4Hm
	JIOetbCcUtUZNdAcftmbAVlcxFZ5NnE89SaRzpXu+mNnC1zK7rvGfU2/T+8+qOCk
	IykXKAd34tXzTqqbz07a29f8bSsvFNTg4vdXxlOnVjXnkNZyM2YYDjhSJAqfB/It
	rA+5/xMdy3DWv1i9zRX1tQbWg6/GMVrcSke0ogTmfymixHwl937i1n7CdHF2yLDc
	2wEq66etBuLTTvIfDb3qfok2X5VvwJGZw==
Received: from mxout32.s.uw.edu (mxout32.s.uw.edu [128.208.61.12])
	by mx0a-00641c01.pphosted.com (PPS) with ESMTPS id 4ghfv3hymg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 08:52:45 +0000 (GMT)
Received: from smtp.washington.edu (smtp.washington.edu [128.208.60.132])
	by mxout32.s.uw.edu (8.16.1+UW24.12/8.14.4+UW24.02) with ESMTPS id 6878qjUD008027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Sep 2026 01:52:45 -0700
X-Auth-Received: from promaxgb10-6c88.manee-noodlefish.ts.net (c-73-42-166-56.hsd1.wa.comcast.net [73.42.166.56])
	(authenticated authid=advaiv2)
	by smtp.washington.edu (8.16.1+UW24.12/8.14.4+UW24.02) with ESMTPSA id 6878qIgL023143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Sep 2026 01:52:44 -0700
X-UW-Orig-Sender: advaiv2@smtp.washington.edu
From: Advaith Vecham <advaiv2@uw.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
        Christian Brauner <brauner@kernel.org>,
        =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>, linux-kernel@vger.kernel.org,
        rust-for-linux@vger.kernel.org, Advaith Vecham <advaiv2@uw.edu>
Subject: [PATCH] rust_binder: add missing newlines to log messages
Date: Mon,  7 Sep 2026 08:51:39 +0000
Message-ID: <20260907085139.65576-1-advaiv2@uw.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX5xueidsbJ/Wg
 Zt5C0GJ/k/nDXB0RWIpNAg6d943lJzrmIDV/kl33Eiiz9zvVTqJAp4766OE0noDvD0+SRaMhsJq
 bvgJDtFZVq/tkNAyic3J9KC3mXFSBZR+PUjLni/fyTg7crMpWXC+zG9vhGjdxcUsxSN2+n/tqGk
 1+rRgtwBlGLfrK/otHV26LXq0zleHVsYAdmQ9BCOtKza1x4LP4UI2VA83POrXQFD9Z2OThnBWYa
 +rFP/VEZOxAqahN+eSM9MgmTM37yqkZPBmfvFSaflb3wh6H1MSNFpIuErBmiDaJIT+BXYcHQMvU
 +59+H0r5NuYKBnY6Ir2YjRcqpX4dwyYwxjL22ZmbcrKr5sjBnSC/rwU6CL/HR+qM2HJAvviR0Ka
 TcxWm8DVd45lSgYzQkL1ffN9ZTciQtUiyIl3+skLTzusJqCbU/QQ50Rs3sk8LKF9m75+QwL7DnF
 DX5qv4yEUg2da2DCnVg==
X-Proofpoint-ORIG-GUID: oprCEjqqWyVLOqQFz-xQuWl-JSWFczEB
X-Authority-Analysis: v=2.4 cv=eZ0NubEH c=1 sm=1 tr=0 ts=6a9e7b5e cx=c_pps
 a=L+to+3NMTQJ4N3HQ1s2NBA==:117 a=L+to+3NMTQJ4N3HQ1s2NBA==:17
 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zXh4U7bod0xlW8uCmBq_:22 a=Y1F7kAEhTqD7p_ZpfYTa:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=NuLZf8eL0ao_53MxyzkA:9
X-Proofpoint-GUID: mcbcmx4zcYnAlhq8546tcfj4WBhKRVvH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX6RLlSMgA7RMW
 i2BvA84uhw9g/bv57ef6sVhMxGD89+H0ooWCSnEjqI3CTNBU3LGjOe11/pnX2p9ACMOP9DhmB4O
 pSfMLuSUMHWqZaNDa2hFGQCN1/rRdqMAuUDd4WU73ENRSQQIvxSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070096

The kernel printing macros don't append a newline automatically (with
the way pr_*!() works), so the error message gets concatenated onto the
next line in the kernel log during these warnings, errors, etc. Add
'\n' to the end of error, warning, and debug messages.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Advaith Vecham <advaiv2@uw.edu>
---
 drivers/android/binder/allocation.rs       |  2 +-
 drivers/android/binder/context.rs          |  6 +++---
 drivers/android/binder/node.rs             |  2 +-
 drivers/android/binder/page_range.rs       | 12 ++++++------
 drivers/android/binder/process.rs          | 14 +++++++-------
 drivers/android/binder/range_alloc/tree.rs |  2 +-
 drivers/android/binder/thread.rs           | 14 +++++++-------
 drivers/android/binder/transaction.rs      |  8 ++++----
 8 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 165cb797e..3eb656eaf 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -286,7 +286,7 @@ fn drop(&mut self) {
 
             if info.clear_on_free {
                 if let Err(e) = self.fill_zero() {
-                    pr_warn!("Failed to clear data on free: {:?}", e);
+                    pr_warn!("Failed to clear data on free: {:?}\n", e);
                 }
             }
         }
diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index ddddb66b3..7fdad5368 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -80,7 +80,7 @@ pub(crate) fn deregister(self: &Arc<Self>) {
 
     pub(crate) fn register_process(self: &Arc<Self>, proc: Arc<Process>) -> Result {
         if !Arc::ptr_eq(self, &proc.ctx) {
-            pr_err!("Context::register_process called on the wrong context.");
+            pr_err!("Context::register_process called on the wrong context.\n");
             return Err(EINVAL);
         }
         self.manager.lock().all_procs.push(proc, GFP_KERNEL)?;
@@ -89,7 +89,7 @@ pub(crate) fn register_process(self: &Arc<Self>, proc: Arc<Process>) -> Result {
 
     pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
         if !Arc::ptr_eq(self, &proc.ctx) {
-            pr_err!("Context::deregister_process called on the wrong context.");
+            pr_err!("Context::deregister_process called on the wrong context.\n");
             return;
         }
         let mut manager = self.manager.lock();
@@ -110,7 +110,7 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {
         let mut manager = self.manager.lock();
         if manager.node.is_some() {
-            pr_warn!("BINDER_SET_CONTEXT_MGR already set");
+            pr_warn!("BINDER_SET_CONTEXT_MGR already set\n");
             return Err(EBUSY);
         }
         security::binder_set_context_mgr(&node_ref.node.owner.cred)?;
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 0a82af14c..0f70ea2d1 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -405,7 +405,7 @@ pub(crate) fn update_refcount_locked(
             !is_dead && !state.has_count
         } else {
             if state.count < count {
-                pr_err!("Failure: refcount underflow!");
+                pr_err!("Failure: refcount underflow!\n");
                 return None;
             }
             state.count -= count;
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 52ffbf350..531d4444d 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -212,7 +212,7 @@ unsafe fn set_page(me: *mut PageInfo, page: Page) {
 
         // SAFETY: The pointer is valid for writing, so also valid for reading.
         if unsafe { (*ptr).is_some() } {
-            pr_err!("set_page called when there is already a page");
+            pr_err!("set_page called when there is already a page\n");
             // SAFETY: We will initialize the page again below.
             unsafe { ptr::drop_in_place(ptr) };
         }
@@ -300,11 +300,11 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
         let num_pages = num_bytes >> PAGE_SHIFT;
 
         if !ptr::eq::<Mm>(&*self.mm, &**vma.mm()) {
-            pr_debug!("Failed to register with vma: invalid vma->vm_mm");
+            pr_debug!("Failed to register with vma: invalid vma->vm_mm\n");
             return Err(EINVAL);
         }
         if num_pages == 0 {
-            pr_debug!("Failed to register with vma: size zero");
+            pr_debug!("Failed to register with vma: size zero\n");
             return Err(EINVAL);
         }
 
@@ -325,7 +325,7 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
 
         let mut inner = self.lock.lock();
         if inner.size > 0 {
-            pr_debug!("Failed to register with vma: already registered");
+            pr_debug!("Failed to register with vma: already registered\n");
             drop(inner);
             return Err(EBUSY);
         }
@@ -380,7 +380,7 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
                 match unsafe { self.use_page_slow(i) } {
                     Ok(()) => {}
                     Err(err) => {
-                        pr_warn!("Error in use_page_slow: {:?}", err);
+                        pr_warn!("Error in use_page_slow: {:?}\n", err);
                         return Err(err);
                     }
                 }
@@ -529,7 +529,7 @@ unsafe fn iterate<T>(&self, mut offset: usize, mut size: usize, mut cb: T) -> Re
             // duration of this call to `iterate`, so nobody will change the page.
             let page = unsafe { PageInfo::get_page(page_info) };
             if page.is_none() {
-                pr_warn!("Page is null!");
+                pr_warn!("Page is null!\n");
             }
             let page = page.ok_or(EFAULT)?;
             cb(page, offset, available)?;
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd9..5e2984bf1 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -324,7 +324,7 @@ pub(crate) fn death_delivered(&mut self, death: DArc<NodeDeath>) {
         if let Some(death) = ListArc::try_from_arc_or_drop(death) {
             self.delivered_deaths.push_back(death);
         } else {
-            pr_warn!("Notification added to `delivered_deaths` twice.");
+            pr_warn!("Notification added to `delivered_deaths` twice.\n");
         }
     }
 
@@ -701,7 +701,7 @@ fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
         let id = {
             let current = kernel::current!();
             if self.task != current.group_leader() {
-                pr_err!("get_current_thread was called from the wrong process.");
+                pr_err!("get_current_thread was called from the wrong process.\n");
                 return Err(EINVAL);
             }
             current.pid()
@@ -725,7 +725,7 @@ fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
                 Ok(ta)
             }
             rbtree::Entry::Occupied(_entry) => {
-                pr_err!("Cannot create two threads with the same id.");
+                pr_err!("Cannot create two threads with the same id.\n");
                 Err(EINVAL)
             }
         }
@@ -861,7 +861,7 @@ pub(crate) fn insert_or_update_handle(
                 match refs.by_handle.entry(res.as_u32()) {
                     rbtree::Entry::Vacant(entry) => break (res, entry),
                     rbtree::Entry::Occupied(_) => {
-                        pr_err!("Detected mismatch between handle_is_present and by_handle");
+                        pr_err!("Detected mismatch between handle_is_present and by_handle\n");
                         res.acquire();
                         kernel::warn_on!(true);
                         return Err(EINVAL);
@@ -1101,7 +1101,7 @@ pub(crate) fn buffer_alloc(
         ) {
             Ok(()) => {}
             Err(err) => {
-                pr_warn!("use_range failure {:?}", err);
+                pr_warn!("use_range failure {:?}\n", err);
                 return Err(err.into());
             }
         }
@@ -1516,7 +1516,7 @@ pub(crate) fn drop_outstanding_txn(&self) {
         let wake = {
             let mut inner = self.inner.lock();
             if inner.outstanding_txns == 0 {
-                pr_err!("outstanding_txns underflow");
+                pr_err!("outstanding_txns underflow\n");
                 return;
             }
             inner.outstanding_txns -= 1;
@@ -1836,7 +1836,7 @@ fn new(thread: &'a Arc<Thread>, guard: &mut Guard<'_, ProcessInner, SpinLockBack
             // It is an error to hit this branch, and it should not be reachable. We try to do
             // something reasonable when the failure path happens. Most likely, the thread in
             // question will sleep forever.
-            pr_err!("Same thread registered with `ready_threads` twice.");
+            pr_err!("Same thread registered with `ready_threads` twice.\n");
         }
         Self { thread }
     }
diff --git a/drivers/android/binder/range_alloc/tree.rs b/drivers/android/binder/range_alloc/tree.rs
index 48796fcdb..6f4fda66d 100644
--- a/drivers/android/binder/range_alloc/tree.rs
+++ b/drivers/android/binder/range_alloc/tree.rs
@@ -166,7 +166,7 @@ pub(crate) fn reserve_new(
 
         let (found_size, found_off, tree_node, free_tree_node) = match self.find_best_match(size) {
             None => {
-                pr_warn!("ENOSPC from range_alloc.reserve_new - size: {}", size);
+                pr_warn!("ENOSPC from range_alloc.reserve_new - size: {}\n", size);
                 return Err(ENOSPC);
             }
             Some(desc) => {
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 18a14aa8a..155970253 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -339,7 +339,7 @@ fn push_reply_work(&mut self, code: u32) -> PushWorkRes {
             work.set_error_code(code);
             self.push_work(work)
         } else {
-            pr_warn!("Thread reply work is already in use.");
+            pr_warn!("Thread reply work is already in use.\n");
             PushWorkRes::Ok
         }
     }
@@ -350,7 +350,7 @@ fn push_return_work(&mut self, reply: u32) {
             // Not notifying: Reply to current thread.
             let _ = self.push_work(work);
         } else {
-            pr_warn!("Thread return work is already in use.");
+            pr_warn!("Thread return work is already in use.\n");
         }
     }
 
@@ -884,7 +884,7 @@ fn translate_object(
                     .read_all(&mut fda_bytes, GFP_KERNEL)?;
 
                 if fds_len != fda_bytes.len() {
-                    pr_err!("UserSlice::read_all returned wrong length in BINDER_TYPE_FDA");
+                    pr_err!("UserSlice::read_all returned wrong length in BINDER_TYPE_FDA\n");
                     return Err(EINVAL.into());
                 }
 
@@ -999,7 +999,7 @@ pub(crate) fn copy_transaction_data(
             let ctx = match security::SecurityCtx::from_secid(secid) {
                 Ok(ctx) => ctx,
                 Err(err) => {
-                    pr_warn!("Failed to get security ctx for id {}: {:?}", secid, err);
+                    pr_warn!("Failed to get security ctx for id {}: {:?}\n", secid, err);
                     return Err(err.into());
                 }
             };
@@ -1233,7 +1233,7 @@ fn top_of_transaction_stack(&self) -> Result<Option<DArc<Transaction>>> {
         let inner = self.inner.lock();
         if let Some(cur) = &inner.current_transaction {
             if core::ptr::eq(self, cur.from.as_ref()) {
-                pr_warn!("got new transaction with bad transaction stack");
+                pr_warn!("got new transaction with bad transaction stack\n");
                 return Err(EINVAL);
             }
             Ok(Some(cur.clone()))
@@ -1562,7 +1562,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
         let mut has_noop_placeholder = false;
         if req.read_consumed == 0 {
             if let Err(err) = writer.write_code(BR_NOOP) {
-                pr_warn!("Failure when writing BR_NOOP at beginning of buffer.");
+                pr_warn!("Failure when writing BR_NOOP at beginning of buffer.\n");
                 return Err(err);
             }
             has_noop_placeholder = true;
@@ -1585,7 +1585,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
                 Err(err) => {
                     // Propagate the error if we haven't written anything else.
                     if err != EINTR && err != EAGAIN {
-                        pr_warn!("Failure in work getter: {:?}", err);
+                        pr_warn!("Failure in work getter: {:?}\n", err);
                     }
                     if initial_len == writer.len() {
                         return Err(err);
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 245f1556b..b90051aec 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -176,14 +176,14 @@ pub(crate) fn new(
             Ok(alloc) => alloc,
             Err(err) => {
                 if !err.is_dead() {
-                    pr_warn!("Failure in copy_transaction_data: {:?}", err);
+                    pr_warn!("Failure in copy_transaction_data: {:?}\n", err);
                 }
                 return Err(err);
             }
         };
         if info.is_oneway() {
             if from_parent.is_some() {
-                pr_warn!("Oneway transaction should not be in a transaction stack.");
+                pr_warn!("Oneway transaction should not be in a transaction stack.\n");
                 return Err(EINVAL.into());
             }
             alloc.set_info_oneway_node(node_ref.node.clone());
@@ -224,7 +224,7 @@ pub(crate) fn new_reply(
             match from.copy_transaction_data(to.clone(), info, info.debug_id, allow_fds, None) {
                 Ok(alloc) => alloc,
                 Err(err) => {
-                    pr_warn!("Failure in copy_transaction_data: {:?}", err);
+                    pr_warn!("Failure in copy_transaction_data: {:?}\n", err);
                     return Err(err);
                 }
             };
@@ -384,7 +384,7 @@ pub(crate) fn submit(self: DLArc<Self>, info: &mut TransactionInfo) -> BinderRes
                     return Ok(());
                 }
             } else {
-                pr_err!("Failed to submit oneway transaction to node.");
+                pr_err!("Failed to submit oneway transaction to node.\n");
             }
         }
 
-- 
2.43.0

