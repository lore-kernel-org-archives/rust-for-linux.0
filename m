Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4021420467
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205297; cv=none; b=lM05rK3WJCie6U6qwuIm7v9rD3l2+VgxY691lkggrNxF9iYY0qtHowSPcLlfobvmRFlMir27a3WLacWsJnmwhq/RXRPzVvAUj4zdMTmovtt9QlzqvHajWd4ePqVxH3A39LtRFXhhswBYniUJqYW7xrNYMSlvu5BsIwjcgsyqW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205297; c=relaxed/simple;
	bh=gOZzMQXUm49K1zkiCV6cQcshoBw9zQOkaGum7c57ims=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TbqV/uHSJ5AcBcXMyhoiz5J5gt0rQwlhyDYM3mizwCuk71C0WluAvrYNrcudCUMYPVC0t5QBnE+vL/lB2ZytPSoFxghIjv3rFzbphcUFi5wiHs+sZ2zFa+7/U7YeEruWv646ZyIGNfIdXSYbW3bpWI9+NGqG90b3ovj3WUVJb0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cRShq+Bd; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cRShq+Bd"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493e94719e7so43693405e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784205292; x=1784810092; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ez9u7FHcyrWFxwgzWCw/hykgM5JZmopGs7v+M7ddZh0=;
        b=cRShq+BdkB38ANO93uxZ9Nd7LT4roPo6e2oRdLrmZrH3NGZ9NFDV6tVXvFW1Nyc3Pi
         +cNiZtHNMPFUV5L0opSSx5WfnlD8UXuXR9n7nvUnNPVEbps9pO+u/yAHijpXIsya9h/X
         mEu1NKvP7pniDrniISoIfmPTFqPfca0cginmflIrvZSA5qAjYtoYE/lcbpVWdgrSspd0
         XGxlx8tFZ6g2eNWKjcXZNCYuwj/mHHE+IJgjUen/iS4n31DqQK62FVC0xkndfcRglnJ5
         OO/psI6tvFBcgC5BMXLD1Fc/mokbEvJs4oQrzccnP9Md23MAGQXAxc0iv+oI5Vn7NTDw
         heNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205292; x=1784810092;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ez9u7FHcyrWFxwgzWCw/hykgM5JZmopGs7v+M7ddZh0=;
        b=rK/6gBaD7bdjVzBg/7KayWeEgDrgmTdLYh0hlLcepxDouBiTK29LIpYrmYOwLQV1Y2
         kIL8ilqMupOAXW5AEAtsTj54jfxNNcp3pQQlyLqi+r4PVdVllI80LcfMFlMQG6J7orqc
         0x2SiYzKSVQA31w27Z1VH+J83BsGSvlehj3YIppH5s8K0ESQIWLfBL6yT7Kqq8Ssi5wa
         1TD3h/YbtCGs5ZlfBNFsJhRzX7e6RNaRpUt0WiDqeY3zPLs3IFPF/RrbFla0+dxoJx3D
         UQ57TJam+byKfyLun2z1jgVwIVxFtpjugV3kkrsLNZO6nblqptH3+3WeNYEar35uBz5y
         0zdg==
X-Forwarded-Encrypted: i=1; AHgh+RrmB3Y9z6YGEMesRSIL0bsd5/JmdNYpj8/epvAu1F71w5uhDTekC50geQ+7ly9a9pOfSOq0rIT31LLnkJUEog==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKw2l8H4QAVF0g8YAqwC5hGem2sMogi7jAh9c/vv4OtQfyCpKn
	sCzrv1OtGP5BVrcEouAcUmg70iGQMrQDbshJWNhZm10lTjftYTqfBZ4qZ52vja1dDi1d0gowDL7
	10C1gRZkWgDOCElr7vQ==
X-Received: from wmbhb19.prod.google.com ([2002:a05:600c:8693:b0:493:b2c0:5a0d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6207:b0:493:e504:cbef with SMTP id 5b1f17b1804b1-495389731b5mr122208845e9.0.1784205292019;
 Thu, 16 Jul 2026 05:34:52 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:34:29 +0000
In-Reply-To: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=22368; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gOZzMQXUm49K1zkiCV6cQcshoBw9zQOkaGum7c57ims=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqWM/isbtV1txqkyn8m4qtLJRr/y/1AeamP8HiQ
 oUHUx0i16iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaljP4gAKCRAEWL7uWMY5
 RuQaD/9OVFOzm4Fxc6T+3POcuIYaw5Slkg8BKD4h76L66XxgEcoQsz3y4xwufg4zD/GAywS/3Oy
 SsbuDuI6Rn+BB3DlI5AL3OscXzV2vAZHdw8wjORKPZSniunfvfJn4dwPDUpeMmffK1Z6o2aaCDq
 8bqC8DOt8rg/hwyB06W2Dh/peXnwLMMXQmxtBvi3YkLfRxvbQ0P+RDOPXKSKgl9whi0OEFMPk2S
 XDE1O64bWqwqomOEpMkRXwYziru7hqCOgOXcp//6FVtnZKT/tD0fbgyTHFBQicWbul1IUgoJZ6w
 UBCCg45KPwi2ZiQQRBS2tl8YPVY3PB5jEV+vNCQi3Qz8qPj/8oeTp6kr1iYRm0cg/nNvt31kV9B
 Nx4eEUomDP0GPxg2IhBv4aac9FT0l+3BVXeMj/X0SkcjZVrd1gz9QZNHW1AgzzaQzbCP4LzoLRs
 0P0ahBRMVNThB7NEBphFbHLKgVVkuPXx2lXaKFEJPBQxz3dR9gKQyRQ+bo5WPM2yYNAYM8Yn6bE
 y9YZvTPw5DKh1HVUesFMpMkG3TU69ORbFaZqMvwDy3cX6tdfIwhfeEaEi/s6TFQXFvJFMgrIdg8
 JyAN1D6bguwa8kJh9tW+w+yUsfQXZP+gyKEdTbKS2J3kAldk8Bjdq3TylrtO6Z961vtvtc+IIHu wAu86943q73Ubsg==
X-Mailer: b4 0.14.3
Message-ID: <20260716-pr-ratelimited-v2-5-31c27a4543d2@google.com>
Subject: [PATCH v2 5/5] rust_binder: use pr_*_ratelimited! for printing
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To avoid DoS from printing too much, make printing in Binder rate
limited.

A big portion of these print statements have been updated to use
binder_debug!, but some still remain to be converted. For now, just
update them to use pr_*_ratelimted! until we get around to converting
them to use binder_debug! too. While we're at it, fix the missing
newlines at the end of some of those println statements.

Acked-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/allocation.rs  |  4 +--
 drivers/android/binder/context.rs     |  6 ++---
 drivers/android/binder/debug.rs       |  4 +--
 drivers/android/binder/freeze.rs      |  2 +-
 drivers/android/binder/node.rs        |  4 +--
 drivers/android/binder/page_range.rs  | 12 ++++-----
 drivers/android/binder/process.rs     | 22 ++++++++--------
 drivers/android/binder/thread.rs      | 48 ++++++++++++++++++++---------------
 drivers/android/binder/transaction.rs |  4 +--
 9 files changed, 57 insertions(+), 49 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 165cb797eb1e..8151ba3ea7f4 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -261,7 +261,7 @@ fn drop(&mut self) {
                 let view = AllocationView::new(self, offsets.start);
                 for i in offsets.step_by(size_of::<u64>()) {
                     if view.cleanup_object(i).is_err() {
-                        pr_warn!("Error cleaning up object at offset {}\n", i)
+                        pr_warn_ratelimited!("Error cleaning up object at offset {}\n", i)
                     }
                 }
             }
@@ -286,7 +286,7 @@ fn drop(&mut self) {
 
             if info.clear_on_free {
                 if let Err(e) = self.fill_zero() {
-                    pr_warn!("Failed to clear data on free: {:?}", e);
+                    pr_warn_ratelimited!("Failed to clear data on free: {:?}\n", e);
                 }
             }
         }
diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
index ddddb66b3557..431d6007a9b1 100644
--- a/drivers/android/binder/context.rs
+++ b/drivers/android/binder/context.rs
@@ -80,7 +80,7 @@ pub(crate) fn deregister(self: &Arc<Self>) {
 
     pub(crate) fn register_process(self: &Arc<Self>, proc: Arc<Process>) -> Result {
         if !Arc::ptr_eq(self, &proc.ctx) {
-            pr_err!("Context::register_process called on the wrong context.");
+            pr_err_ratelimited!("Context::register_process called on the wrong context.\n");
             return Err(EINVAL);
         }
         self.manager.lock().all_procs.push(proc, GFP_KERNEL)?;
@@ -89,7 +89,7 @@ pub(crate) fn register_process(self: &Arc<Self>, proc: Arc<Process>) -> Result {
 
     pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
         if !Arc::ptr_eq(self, &proc.ctx) {
-            pr_err!("Context::deregister_process called on the wrong context.");
+            pr_err_ratelimited!("Context::deregister_process called on the wrong context.\n");
             return;
         }
         let mut manager = self.manager.lock();
@@ -110,7 +110,7 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
     pub(crate) fn set_manager_node(&self, node_ref: NodeRef) -> Result {
         let mut manager = self.manager.lock();
         if manager.node.is_some() {
-            pr_warn!("BINDER_SET_CONTEXT_MGR already set");
+            pr_warn_ratelimited!("BINDER_SET_CONTEXT_MGR already set\n");
             return Err(EBUSY);
         }
         security::binder_set_context_mgr(&node_ref.node.owner.cred)?;
diff --git a/drivers/android/binder/debug.rs b/drivers/android/binder/debug.rs
index 824b10c004c3..6d8dcddf4619 100644
--- a/drivers/android/binder/debug.rs
+++ b/drivers/android/binder/debug.rs
@@ -53,7 +53,7 @@ macro_rules! binder_debug {
     // Rule to explicitly specify a PID (used in kworkers).
     (pid=$pid:expr, $mask:ident, $($arg:tt)*) => {
         if $crate::debug::debug_mask_enabled($crate::debug::DebugMask::$mask) {
-            kernel::pr_info!(
+            kernel::pr_info_ratelimited!(
                 "{}: {}\n",
                 $pid,
                 kernel::prelude::fmt!($($arg)*)
@@ -65,7 +65,7 @@ macro_rules! binder_debug {
     ($mask:ident, $($arg:tt)*) => {
         if $crate::debug::debug_mask_enabled($crate::debug::DebugMask::$mask) {
             let thread = kernel::current!();
-            kernel::pr_info!(
+            kernel::pr_info_ratelimited!(
                 "{}:{} {}\n",
                 thread.tgid(),
                 thread.pid(),
diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 66912b4cb527..7fbde3345ced 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -412,7 +412,7 @@ fn find_freeze_recipients(&self) -> Result<KVVec<(DArc<Node>, Arc<Process>)>, Al
                 recipients
                     .push_within_capacity(node_proc_pair)
                     .map_err(|_| {
-                        pr_err!(
+                        pr_err_ratelimited!(
                             "push_within_capacity failed even though we checked the capacity\n"
                         );
                         AllocError
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index c73cdf82100f..d23f29e51631 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -401,7 +401,7 @@ pub(crate) fn update_refcount_locked(
             !is_dead && !state.has_count
         } else {
             if state.count < count {
-                pr_err!("Failure: refcount underflow!");
+                pr_err_ratelimited!("Failure: refcount underflow!\n");
                 return None;
             }
             state.count -= count;
@@ -689,7 +689,7 @@ pub(crate) fn remove_freeze_listener(&self, p: &Process) -> KVVec<Arc<Process>>
             .freeze_list
             .retain(|proc| !core::ptr::eq::<Process>(&**proc, p));
         if len == inner.freeze_list.len() {
-            pr_warn!(
+            pr_warn_ratelimited!(
                 "Could not remove freeze listener for {}\n",
                 p.pid_in_current_ns()
             );
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 52ffbf3504e7..c1f4f635c2c0 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -212,7 +212,7 @@ unsafe fn set_page(me: *mut PageInfo, page: Page) {
 
         // SAFETY: The pointer is valid for writing, so also valid for reading.
         if unsafe { (*ptr).is_some() } {
-            pr_err!("set_page called when there is already a page");
+            pr_err_ratelimited!("set_page called when there is already a page\n");
             // SAFETY: We will initialize the page again below.
             unsafe { ptr::drop_in_place(ptr) };
         }
@@ -300,11 +300,11 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
         let num_pages = num_bytes >> PAGE_SHIFT;
 
         if !ptr::eq::<Mm>(&*self.mm, &**vma.mm()) {
-            pr_debug!("Failed to register with vma: invalid vma->vm_mm");
+            pr_debug_ratelimited!("Failed to register with vma: invalid vma->vm_mm\n");
             return Err(EINVAL);
         }
         if num_pages == 0 {
-            pr_debug!("Failed to register with vma: size zero");
+            pr_debug_ratelimited!("Failed to register with vma: size zero\n");
             return Err(EINVAL);
         }
 
@@ -325,7 +325,7 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
 
         let mut inner = self.lock.lock();
         if inner.size > 0 {
-            pr_debug!("Failed to register with vma: already registered");
+            pr_debug_ratelimited!("Failed to register with vma: already registered\n");
             drop(inner);
             return Err(EBUSY);
         }
@@ -380,7 +380,7 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
                 match unsafe { self.use_page_slow(i) } {
                     Ok(()) => {}
                     Err(err) => {
-                        pr_warn!("Error in use_page_slow: {:?}", err);
+                        pr_warn_ratelimited!("Error in use_page_slow: {:?}\n", err);
                         return Err(err);
                     }
                 }
@@ -529,7 +529,7 @@ unsafe fn iterate<T>(&self, mut offset: usize, mut size: usize, mut cb: T) -> Re
             // duration of this call to `iterate`, so nobody will change the page.
             let page = unsafe { PageInfo::get_page(page_info) };
             if page.is_none() {
-                pr_warn!("Page is null!");
+                pr_warn_ratelimited!("Page is null!\n");
             }
             let page = page.ok_or(EFAULT)?;
             cb(page, offset, available)?;
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index eb2f08bec655..c405a7ef81db 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -313,7 +313,7 @@ pub(crate) fn death_delivered(&mut self, death: DArc<NodeDeath>) {
         if let Some(death) = ListArc::try_from_arc_or_drop(death) {
             self.delivered_deaths.push_back(death);
         } else {
-            pr_warn!("Notification added to `delivered_deaths` twice.");
+            pr_warn_ratelimited!("Notification added to `delivered_deaths` twice.\n");
         }
     }
 
@@ -683,7 +683,7 @@ fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
         let id = {
             let current = kernel::current!();
             if self.task != current.group_leader() {
-                pr_err!("get_current_thread was called from the wrong process.");
+                pr_err_ratelimited!("get_current_thread was called from the wrong process.\n");
                 return Err(EINVAL);
             }
             current.pid()
@@ -707,7 +707,7 @@ fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
                 Ok(ta)
             }
             rbtree::Entry::Occupied(_entry) => {
-                pr_err!("Cannot create two threads with the same id.");
+                pr_err_ratelimited!("Cannot create two threads with the same id.\n");
                 Err(EINVAL)
             }
         }
@@ -843,7 +843,9 @@ pub(crate) fn insert_or_update_handle(
                 match refs.by_handle.entry(res.as_u32()) {
                     rbtree::Entry::Vacant(entry) => break (res, entry),
                     rbtree::Entry::Occupied(_) => {
-                        pr_err!("Detected mismatch between handle_is_present and by_handle");
+                        pr_err_ratelimited!(
+                            "Detected mismatch between handle_is_present and by_handle\n"
+                        );
                         res.acquire();
                         kernel::warn_on!(true);
                         return Err(EINVAL);
@@ -1083,7 +1085,7 @@ pub(crate) fn buffer_alloc(
         ) {
             Ok(()) => {}
             Err(err) => {
-                pr_warn!("use_range failure {:?}", err);
+                pr_warn_ratelimited!("use_range failure {:?}\n", err);
                 return Err(err.into());
             }
         }
@@ -1114,7 +1116,7 @@ pub(crate) fn buffer_raw_free(&self, ptr: usize) {
             let freed_range = match mapping.alloc.reservation_abort(offset) {
                 Ok(freed_range) => freed_range,
                 Err(_) => {
-                    pr_warn!(
+                    pr_warn_ratelimited!(
                         "Pointer {:x} failed to free, base = {:x}\n",
                         ptr,
                         mapping.address
@@ -1136,7 +1138,7 @@ pub(crate) fn buffer_make_freeable(&self, offset: usize, mut data: Option<Alloca
         let mut inner = self.inner.lock();
         if let Some(ref mut mapping) = &mut inner.mapping {
             if mapping.alloc.reservation_commit(offset, &mut data).is_err() {
-                pr_warn!("Offset {} failed to be marked freeable\n", offset);
+                pr_warn_ratelimited!("Offset {} failed to be marked freeable\n", offset);
             }
         }
     }
@@ -1498,7 +1500,7 @@ pub(crate) fn drop_outstanding_txn(&self) {
         let wake = {
             let mut inner = self.inner.lock();
             if inner.outstanding_txns == 0 {
-                pr_err!("outstanding_txns underflow");
+                pr_err_ratelimited!("outstanding_txns underflow\n");
                 return;
             }
             inner.outstanding_txns -= 1;
@@ -1791,7 +1793,7 @@ fn new(thread: &'a Arc<Thread>, guard: &mut Guard<'_, ProcessInner, SpinLockBack
             // It is an error to hit this branch, and it should not be reachable. We try to do
             // something reasonable when the failure path happens. Most likely, the thread in
             // question will sleep forever.
-            pr_err!("Same thread registered with `ready_threads` twice.");
+            pr_err_ratelimited!("Same thread registered with `ready_threads` twice.\n");
         }
         Self { thread }
     }
@@ -1816,7 +1818,7 @@ impl Drop for WithNodes<'_> {
     fn drop(&mut self) {
         core::mem::swap(&mut self.nodes, &mut self.inner.nodes);
         if self.nodes.iter().next().is_some() {
-            pr_err!("nodes array was modified while using lock_with_nodes\n");
+            pr_err_ratelimited!("nodes array was modified while using lock_with_nodes\n");
         }
     }
 }
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index bcdf0adfaaff..01b851e0b3df 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -160,8 +160,8 @@ fn validate_parent_fixup(
         let sg_entry = match self.sg_entries.get(sg_idx) {
             Some(sg_entry) => sg_entry,
             None => {
-                pr_err!(
-                    "self.ancestors[{}] is {}, but self.sg_entries.len() is {}",
+                pr_err_ratelimited!(
+                    "self.ancestors[{}] is {}, but self.sg_entries.len() is {}\n",
                     ancestors_i,
                     sg_idx,
                     self.sg_entries.len()
@@ -170,8 +170,8 @@ fn validate_parent_fixup(
             }
         };
         if sg_entry.fixup_min_offset > parent_offset {
-            pr_warn!(
-                "validate_parent_fixup: fixup_min_offset={}, parent_offset={}",
+            pr_warn_ratelimited!(
+                "validate_parent_fixup: fixup_min_offset={}, parent_offset={}\n",
                 sg_entry.fixup_min_offset,
                 parent_offset
             );
@@ -179,8 +179,8 @@ fn validate_parent_fixup(
         }
         let new_min_offset = parent_offset.checked_add(length).ok_or(EINVAL)?;
         if new_min_offset > sg_entry.length {
-            pr_warn!(
-                "validate_parent_fixup: new_min_offset={}, sg_entry.length={}",
+            pr_warn_ratelimited!(
+                "validate_parent_fixup: new_min_offset={}, sg_entry.length={}\n",
                 new_min_offset,
                 sg_entry.length
             );
@@ -323,7 +323,7 @@ fn push_reply_work(&mut self, code: u32) {
             work.set_error_code(code);
             self.push_work(work);
         } else {
-            pr_warn!("Thread reply work is already in use.");
+            pr_warn_ratelimited!("Thread reply work is already in use.\n");
         }
     }
 
@@ -332,7 +332,7 @@ fn push_return_work(&mut self, reply: u32) {
             work.set_error_code(reply);
             self.push_work(work);
         } else {
-            pr_warn!("Thread return work is already in use.");
+            pr_warn_ratelimited!("Thread return work is already in use.\n");
         }
     }
 
@@ -776,8 +776,8 @@ fn translate_object(
                     let parent_entry = match sg_state.sg_entries.get_mut(info.parent_sg_index) {
                         Some(parent_entry) => parent_entry,
                         None => {
-                            pr_err!(
-                                "validate_parent_fixup returned index out of bounds for sg.entries"
+                            pr_err_ratelimited!(
+                                "validate_parent_fixup returned index out of bounds for sg.entries\n"
                             );
                             return Err(EINVAL.into());
                         }
@@ -823,8 +823,8 @@ fn translate_object(
                 let parent_entry = match sg_state.sg_entries.get_mut(info.parent_sg_index) {
                     Some(parent_entry) => parent_entry,
                     None => {
-                        pr_err!(
-                            "validate_parent_fixup returned index out of bounds for sg.entries"
+                        pr_err_ratelimited!(
+                            "validate_parent_fixup returned index out of bounds for sg.entries\n"
                         );
                         return Err(EINVAL.into());
                     }
@@ -857,7 +857,9 @@ fn translate_object(
                     .read_all(&mut fda_bytes, GFP_KERNEL)?;
 
                 if fds_len != fda_bytes.len() {
-                    pr_err!("UserSlice::read_all returned wrong length in BINDER_TYPE_FDA");
+                    pr_err_ratelimited!(
+                        "UserSlice::read_all returned wrong length in BINDER_TYPE_FDA\n"
+                    );
                     return Err(EINVAL.into());
                 }
 
@@ -972,7 +974,11 @@ pub(crate) fn copy_transaction_data(
             let ctx = match security::SecurityCtx::from_secid(secid) {
                 Ok(ctx) => ctx,
                 Err(err) => {
-                    pr_warn!("Failed to get security ctx for id {}: {:?}", secid, err);
+                    pr_warn_ratelimited!(
+                        "Failed to get security ctx for id {}: {:?}\n",
+                        secid,
+                        err
+                    );
                     return Err(err.into());
                 }
             };
@@ -1195,7 +1201,7 @@ fn top_of_transaction_stack(&self) -> Result<Option<DArc<Transaction>>> {
         let inner = self.inner.lock();
         if let Some(cur) = &inner.current_transaction {
             if core::ptr::eq(self, cur.from.as_ref()) {
-                pr_warn!("got new transaction with bad transaction stack");
+                pr_warn_ratelimited!("got new transaction with bad transaction stack\n");
                 return Err(EINVAL);
             }
             Ok(Some(cur.clone()))
@@ -1521,7 +1527,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
         let mut has_noop_placeholder = false;
         if req.read_consumed == 0 {
             if let Err(err) = writer.write_code(BR_NOOP) {
-                pr_warn!("Failure when writing BR_NOOP at beginning of buffer.");
+                pr_warn_ratelimited!("Failure when writing BR_NOOP at beginning of buffer.\n");
                 return Err(err);
             }
             has_noop_placeholder = true;
@@ -1544,7 +1550,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
                 Err(err) => {
                     // Propagate the error if we haven't written anything else.
                     if err != EINTR && err != EAGAIN {
-                        pr_warn!("Failure in work getter: {:?}", err);
+                        pr_warn_ratelimited!("Failure in work getter: {:?}\n", err);
                     }
                     if initial_len == writer.len() {
                         return Err(err);
@@ -1579,8 +1585,8 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
             ret = self.write(&mut req);
             crate::trace::trace_write_done(ret);
             if let Err(err) = ret {
-                pr_warn!(
-                    "Write failure {:?} in pid:{}",
+                pr_warn_ratelimited!(
+                    "Write failure {:?} in pid:{}\n",
                     err,
                     self.process.pid_in_current_ns()
                 );
@@ -1596,8 +1602,8 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
             ret = self.read(&mut req, wait);
             crate::trace::trace_read_done(ret);
             if ret.is_err() && ret != Err(EINTR) {
-                pr_warn!(
-                    "Read failure {:?} in pid:{}",
+                pr_warn_ratelimited!(
+                    "Read failure {:?} in pid:{}\n",
                     ret,
                     self.process.pid_in_current_ns()
                 );
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 19ad37b0b294..971679b9b620 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -148,7 +148,7 @@ pub(crate) fn new(
         )?;
         if info.is_oneway() {
             if from_parent.is_some() {
-                pr_warn!("Oneway transaction should not be in a transaction stack.");
+                pr_warn_ratelimited!("Oneway transaction should not be in a transaction stack.\n");
                 return Err(EINVAL.into());
             }
             alloc.set_info_oneway_node(node_ref.node.clone());
@@ -343,7 +343,7 @@ pub(crate) fn submit(self: DLArc<Self>, info: &mut TransactionInfo) -> BinderRes
                     return Ok(());
                 }
             } else {
-                pr_err!("Failed to submit oneway transaction to node.");
+                pr_err_ratelimited!("Failed to submit oneway transaction to node.\n");
             }
         }
 

-- 
2.55.0.229.g6434b31f56-goog

