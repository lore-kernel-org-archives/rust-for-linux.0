Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E764B203E
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383442; cv=none; b=KNaKjgwqLVhaKb2vRXpoB1wA66hPNw6ZFU67tVSl1l4A11othZZSlatpT2A43eAjVetEqO0szmlPNj8R/Muemh8E4PlubG86BSqh2l8QeQ962nc3MBDFkAqEc/pScS3ugXCQlyoFCnJDpU6rAOx+HH2ukOZamGX5kn/MN28ID+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383442; c=relaxed/simple;
	bh=MoRjxpD+JyV+rVqti2R9GxB9P6mZVjH3OM2LR2hkBDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FoJklrZazaNBUsS/wBvsQBWwBGJ0+K2Qz5Tv6vFDYEZyO3Ie4SgaDoEWp5MdfZbT+xWNXuYWhi/vYFwo1hlCYbxkeypUOyJv9dKEmtcs/rtN47erGlzHvnlcROY0/AMPsoWw2I7hJjOR41PZZWsthJiM3UjyunxHM5ZdAo6FHfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L0Zkvh7e; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L0Zkvh7e"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48b0a199b20so3686926f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383428; x=1791988228; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEemuqOoLAg1GJyV0hVnEXTws7WgG2Lzqw7NkIPeP7A=;
        b=L0Zkvh7eB/9N9Y6Ct1v3E/WwqWg8VJeWk7tPhSFbyINT9pxclpzPNocV+Hch5OavrT
         xCgEVKp1H8k5kojpcI8oMTxq2tE0BzmSzYIFb1LZ3zA/z3Zyv0rbN1rIiEHQcbgQnXFZ
         jGZxT2LAl6U0vMkacvuMFYRZyqz+Cww1TbYwtoDg/nxTkrEjlsBFq5Q+pPExfpSXdCzX
         +LuNWB++z14oYWis6PZJnXv1CsyJ8X1hWmOXx9mHJsQleMFhlX69FRF8H7lhetG8kIkr
         Ffz95owGO4fteW0DEdFlh4/TXNKN1f96IUOF9AbGVUcO0T2OXsZZIsFA4z230PV0jJe/
         zCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383428; x=1791988228;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEemuqOoLAg1GJyV0hVnEXTws7WgG2Lzqw7NkIPeP7A=;
        b=Y9kcU37H6fCO0Fcy9I2WbeUFcrurz3mO1n6oX1qw2gFoEbozGFGgBTciGEutjzdYRB
         h/LEsMr8SdJ5dO6jPXIggcd7xr4eYUK+uuNyPnZMy0U/+3SdRWvpsvcrh+vEv9Gk3j9z
         4G0Hn9AyINbzTtcZCHfW5S1mZOGUPEh2gwwgQU8D/9jrLlOGVcF+ExY16GI2rwPMlhG4
         37VE76zsdCfVHrpOET93wuFtqs/knSL5SdcOrlwIF5WpMHaZBk3jZ67vnUjbD5T/yTt0
         s9zcl0aDBn0dCTKKDNchSLG7+mAl6S2GgLttVhvhLNmaYAVeBKZuBNAfzhK/lu7Sg3js
         HT9A==
X-Forwarded-Encrypted: i=1; AKwUvBzk+Am/YOfkzWM3dKf/6wm9/bFD5viXxjP2nMI+C54bu/9Y/RfukWpraWDbhGacFR/SdPf4+GsTxHgjzFDeAg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKShPYIGrvtWH53RAi4qaT9gaVWY73+thwPQgkgu7Wogp89Mcmb
	3tNmdpGZebt25GwmBfh6G3fCAP2Zuj0x/P79I5dyY/3V9qe1eb9ZmdpKFkhXjbeysjmEvPH/+cO
	jd6WEUkbQTe4j1fSvcg==
X-Received: from wrwa1.prod.google.com ([2002:a5d:53c1:0:b0:48b:3f5:2676])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:61e:b0:48c:4d74:d7d2 with SMTP id ffacd0b85a97d-48c727797b7mr5015706f8f.12.1791383427604;
 Wed, 07 Oct 2026 07:30:27 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:30:04 +0000
In-Reply-To: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=26742; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=MoRjxpD+JyV+rVqti2R9GxB9P6mZVjH3OM2LR2hkBDc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxld32e6EC0afYkEm+adZwQMxWDK6j/viKSXM+
 5MODJGAN32JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZXdwAKCRAEWL7uWMY5
 Roh+D/0Sv6Qjgj9qPJjpC/LQmKUhQ8f38PB7SEma3Q3AH/3r1YjUCw4cCXFXeYAd1Hqmb/gFPjP
 ncHMsGMLrb7sBWWRqeoQbA2PQ2gS6DwwgqzzG8OQDLg525FJLzOYRa6sUkZ86nPKpjp6NREoM2+
 QGdH3lpsH3kRNJLsN3FpDuDHFTHwLbqp8L6snkCYNOjHM1tjNmT2JeF7+mH2m5xABnjpgfn92cV
 lIygsop4a3wd3dRTGBFJIWgy+oNdf8oiBhBN6TgXq/KWftn6Z9t0xJImoqQzXNbw28gpKGw6Iwe
 Tk2t9RzoJBUAEZO6bsSP5OV2qmgfFAuawNqIjWG0GYi8LNNE22UUYI8j/v20mDwyiNdsghcyfaC
 1C9pt+SG6m8rHX2afYP9tdl1L43tPUMMqiRFUCa0jJCBR4AojQ2ndN/uRfj7xLLsbYMKUYf+g4R
 kNTv10K9TglBMfuL4tflw1NE0Lh1cBBVtH8zwkzsnLbmewdj///iXA366nwRdp5vH1J7pCIzW5A
 mMrbeSMX5lEMc7PAr1A+wkZ4MMP3vRllHJzJpBnE2MZTT6F/mp8hPCi1oDpl/5wW1/fl8vkPE1M
 GXBVGUWpkQPmZ/GQ1UJb190/RGmHppIYvXvFNOffpeZ82Rqk8IQhoKpA1ltzyB85+iyqClsR62T J9ezA3Us9VEtQIg==
X-Mailer: b4 0.14.3
Message-ID: <20261007-pr-ratelimited-v6-4-f14accd4ea3b@google.com>
Subject: [PATCH v6 4/4] rust_binder: use pr_*_ratelimited! for printing
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
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
update them to use pr_*_ratelimited! until we get around to converting
them to use binder_debug! too. While we're at it, fix the missing
newlines at the end of some of those println statements.

Four transaction failure pr_warn! calls in thread.rs and transaction.rs
are not converted because they're being deleted by another patch
series.

Acked-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/allocation.rs       |  4 +--
 drivers/android/binder/context.rs          |  6 ++--
 drivers/android/binder/debug.rs            |  4 +--
 drivers/android/binder/freeze.rs           |  2 +-
 drivers/android/binder/node.rs             |  4 +--
 drivers/android/binder/page_range.rs       | 12 ++++----
 drivers/android/binder/process.rs          | 22 +++++++-------
 drivers/android/binder/range_alloc/tree.rs | 26 ++++++++--------
 drivers/android/binder/thread.rs           | 48 +++++++++++++++++-------------
 drivers/android/binder/transaction.rs      |  6 ++--
 10 files changed, 71 insertions(+), 63 deletions(-)

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
index 0a82af14cda3..69b36951dbbe 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -405,7 +405,7 @@ pub(crate) fn update_refcount_locked(
             !is_dead && !state.has_count
         } else {
             if state.count < count {
-                pr_err!("Failure: refcount underflow!");
+                pr_err_ratelimited!("Failure: refcount underflow!\n");
                 return None;
             }
             state.count -= count;
@@ -693,7 +693,7 @@ pub(crate) fn remove_freeze_listener(&self, p: &Process) -> KVVec<Arc<Process>>
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
index 5372bfbd93b3..65f719e46c3e 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -324,7 +324,7 @@ pub(crate) fn death_delivered(&mut self, death: DArc<NodeDeath>) {
         if let Some(death) = ListArc::try_from_arc_or_drop(death) {
             self.delivered_deaths.push_back(death);
         } else {
-            pr_warn!("Notification added to `delivered_deaths` twice.");
+            pr_warn_ratelimited!("Notification added to `delivered_deaths` twice.\n");
         }
     }
 
@@ -701,7 +701,7 @@ fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
         let id = {
             let current = kernel::current!();
             if self.task != current.group_leader() {
-                pr_err!("get_current_thread was called from the wrong process.");
+                pr_err_ratelimited!("get_current_thread was called from the wrong process.\n");
                 return Err(EINVAL);
             }
             current.pid()
@@ -725,7 +725,7 @@ fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
                 Ok(ta)
             }
             rbtree::Entry::Occupied(_entry) => {
-                pr_err!("Cannot create two threads with the same id.");
+                pr_err_ratelimited!("Cannot create two threads with the same id.\n");
                 Err(EINVAL)
             }
         }
@@ -861,7 +861,9 @@ pub(crate) fn insert_or_update_handle(
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
@@ -1101,7 +1103,7 @@ pub(crate) fn buffer_alloc(
         ) {
             Ok(()) => {}
             Err(err) => {
-                pr_warn!("use_range failure {:?}", err);
+                pr_warn_ratelimited!("use_range failure {:?}\n", err);
                 return Err(err.into());
             }
         }
@@ -1132,7 +1134,7 @@ pub(crate) fn buffer_raw_free(&self, ptr: usize) {
             let freed_range = match mapping.alloc.reservation_abort(offset) {
                 Ok(freed_range) => freed_range,
                 Err(_) => {
-                    pr_warn!(
+                    pr_warn_ratelimited!(
                         "Pointer {:x} failed to free, base = {:x}\n",
                         ptr,
                         mapping.address
@@ -1154,7 +1156,7 @@ pub(crate) fn buffer_make_freeable(&self, offset: usize, mut data: Option<Alloca
         let mut inner = self.inner.lock();
         if let Some(ref mut mapping) = &mut inner.mapping {
             if mapping.alloc.reservation_commit(offset, &mut data).is_err() {
-                pr_warn!("Offset {} failed to be marked freeable\n", offset);
+                pr_warn_ratelimited!("Offset {} failed to be marked freeable\n", offset);
             }
         }
     }
@@ -1516,7 +1518,7 @@ pub(crate) fn drop_outstanding_txn(&self) {
         let wake = {
             let mut inner = self.inner.lock();
             if inner.outstanding_txns == 0 {
-                pr_err!("outstanding_txns underflow");
+                pr_err_ratelimited!("outstanding_txns underflow\n");
                 return;
             }
             inner.outstanding_txns -= 1;
@@ -1836,7 +1838,7 @@ fn new(thread: &'a Arc<Thread>, guard: &mut Guard<'_, ProcessInner, SpinLockBack
             // It is an error to hit this branch, and it should not be reachable. We try to do
             // something reasonable when the failure path happens. Most likely, the thread in
             // question will sleep forever.
-            pr_err!("Same thread registered with `ready_threads` twice.");
+            pr_err_ratelimited!("Same thread registered with `ready_threads` twice.\n");
         }
         Self { thread }
     }
@@ -1861,7 +1863,7 @@ impl Drop for WithNodes<'_> {
     fn drop(&mut self) {
         core::mem::swap(&mut self.nodes, &mut self.inner.nodes);
         if self.nodes.iter().next().is_some() {
-            pr_err!("nodes array was modified while using lock_with_nodes\n");
+            pr_err_ratelimited!("nodes array was modified while using lock_with_nodes\n");
         }
     }
 }
diff --git a/drivers/android/binder/range_alloc/tree.rs b/drivers/android/binder/range_alloc/tree.rs
index 48796fcdb362..3e3b452909ed 100644
--- a/drivers/android/binder/range_alloc/tree.rs
+++ b/drivers/android/binder/range_alloc/tree.rs
@@ -166,7 +166,7 @@ pub(crate) fn reserve_new(
 
         let (found_size, found_off, tree_node, free_tree_node) = match self.find_best_match(size) {
             None => {
-                pr_warn!("ENOSPC from range_alloc.reserve_new - size: {}", size);
+                pr_warn_ratelimited!("ENOSPC from range_alloc.reserve_new - size: {}\n", size);
                 return Err(ENOSPC);
             }
             Some(desc) => {
@@ -208,8 +208,8 @@ pub(crate) fn reserve_new(
 
     pub(crate) fn reservation_abort(&mut self, offset: usize) -> Result<FreedRange> {
         let mut cursor = self.tree.cursor_lower_bound_mut(&offset).ok_or_else(|| {
-            pr_warn!(
-                "EINVAL from range_alloc.reservation_abort - offset: {}",
+            pr_warn_ratelimited!(
+                "EINVAL from range_alloc.reservation_abort - offset: {}\n",
                 offset
             );
             EINVAL
@@ -218,8 +218,8 @@ pub(crate) fn reservation_abort(&mut self, offset: usize) -> Result<FreedRange>
         let (_, desc) = cursor.current_mut();
 
         if desc.offset != offset {
-            pr_warn!(
-                "EINVAL from range_alloc.reservation_abort - offset: {}",
+            pr_warn_ratelimited!(
+                "EINVAL from range_alloc.reservation_abort - offset: {}\n",
                 offset
             );
             return Err(EINVAL);
@@ -230,15 +230,15 @@ pub(crate) fn reservation_abort(&mut self, offset: usize) -> Result<FreedRange>
                 (None, Ok((reservation, free_node_res)))
             }
             None => {
-                pr_warn!(
-                    "EINVAL from range_alloc.reservation_abort - offset: {}",
+                pr_warn_ratelimited!(
+                    "EINVAL from range_alloc.reservation_abort - offset: {}\n",
                     offset
                 );
                 (None, Err(EINVAL))
             }
             allocated => {
-                pr_warn!(
-                    "EPERM from range_alloc.reservation_abort - offset: {}",
+                pr_warn_ratelimited!(
+                    "EPERM from range_alloc.reservation_abort - offset: {}\n",
                     offset
                 );
                 (allocated, Err(EPERM))
@@ -327,8 +327,8 @@ pub(crate) fn reservation_commit(&mut self, offset: usize, data: &mut Option<T>)
     /// Returns the size of the existing entry and the data associated with it.
     pub(crate) fn reserve_existing(&mut self, offset: usize) -> Result<(usize, usize, Option<T>)> {
         let desc = self.tree.get_mut(&offset).ok_or_else(|| {
-            pr_warn!(
-                "ENOENT from range_alloc.reserve_existing - offset: {}",
+            pr_warn_ratelimited!(
+                "ENOENT from range_alloc.reserve_existing - offset: {}\n",
                 offset
             );
             ENOENT
@@ -344,8 +344,8 @@ pub(crate) fn reserve_existing(&mut self, offset: usize) -> Result<(usize, usize
                 )
             }
             other => {
-                pr_warn!(
-                    "ENOENT from range_alloc.reserve_existing - offset: {}",
+                pr_warn_ratelimited!(
+                    "ENOENT from range_alloc.reserve_existing - offset: {}\n",
                     offset
                 );
                 (other, Err(ENOENT))
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 18a14aa8a835..897c86188c96 100644
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
@@ -339,7 +339,7 @@ fn push_reply_work(&mut self, code: u32) -> PushWorkRes {
             work.set_error_code(code);
             self.push_work(work)
         } else {
-            pr_warn!("Thread reply work is already in use.");
+            pr_warn_ratelimited!("Thread reply work is already in use.\n");
             PushWorkRes::Ok
         }
     }
@@ -350,7 +350,7 @@ fn push_return_work(&mut self, reply: u32) {
             // Not notifying: Reply to current thread.
             let _ = self.push_work(work);
         } else {
-            pr_warn!("Thread return work is already in use.");
+            pr_warn_ratelimited!("Thread return work is already in use.\n");
         }
     }
 
@@ -803,8 +803,8 @@ fn translate_object(
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
@@ -850,8 +850,8 @@ fn translate_object(
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
@@ -884,7 +884,9 @@ fn translate_object(
                     .read_all(&mut fda_bytes, GFP_KERNEL)?;
 
                 if fds_len != fda_bytes.len() {
-                    pr_err!("UserSlice::read_all returned wrong length in BINDER_TYPE_FDA");
+                    pr_err_ratelimited!(
+                        "UserSlice::read_all returned wrong length in BINDER_TYPE_FDA\n"
+                    );
                     return Err(EINVAL.into());
                 }
 
@@ -999,7 +1001,11 @@ pub(crate) fn copy_transaction_data(
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
@@ -1233,7 +1239,7 @@ fn top_of_transaction_stack(&self) -> Result<Option<DArc<Transaction>>> {
         let inner = self.inner.lock();
         if let Some(cur) = &inner.current_transaction {
             if core::ptr::eq(self, cur.from.as_ref()) {
-                pr_warn!("got new transaction with bad transaction stack");
+                pr_warn_ratelimited!("got new transaction with bad transaction stack\n");
                 return Err(EINVAL);
             }
             Ok(Some(cur.clone()))
@@ -1562,7 +1568,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
         let mut has_noop_placeholder = false;
         if req.read_consumed == 0 {
             if let Err(err) = writer.write_code(BR_NOOP) {
-                pr_warn!("Failure when writing BR_NOOP at beginning of buffer.");
+                pr_warn_ratelimited!("Failure when writing BR_NOOP at beginning of buffer.\n");
                 return Err(err);
             }
             has_noop_placeholder = true;
@@ -1585,7 +1591,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
                 Err(err) => {
                     // Propagate the error if we haven't written anything else.
                     if err != EINTR && err != EAGAIN {
-                        pr_warn!("Failure in work getter: {:?}", err);
+                        pr_warn_ratelimited!("Failure in work getter: {:?}\n", err);
                     }
                     if initial_len == writer.len() {
                         return Err(err);
@@ -1620,8 +1626,8 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
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
@@ -1637,8 +1643,8 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
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
index 245f1556b5db..66045547c23a 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -83,7 +83,7 @@ pub(crate) fn is_oneway(&self) -> bool {
 
     pub(crate) fn report_netlink(&self, reply: u32, ctx: &crate::Context) {
         if let Err(err) = self.report_netlink_inner(reply, ctx) {
-            pr_warn!(
+            pr_warn_ratelimited!(
                 "{}:{} netlink report failed: {err:?}\n",
                 self.from_pid,
                 self.from_tid
@@ -183,7 +183,7 @@ pub(crate) fn new(
         };
         if info.is_oneway() {
             if from_parent.is_some() {
-                pr_warn!("Oneway transaction should not be in a transaction stack.");
+                pr_warn_ratelimited!("Oneway transaction should not be in a transaction stack.\n");
                 return Err(EINVAL.into());
             }
             alloc.set_info_oneway_node(node_ref.node.clone());
@@ -384,7 +384,7 @@ pub(crate) fn submit(self: DLArc<Self>, info: &mut TransactionInfo) -> BinderRes
                     return Ok(());
                 }
             } else {
-                pr_err!("Failed to submit oneway transaction to node.");
+                pr_err_ratelimited!("Failed to submit oneway transaction to node.\n");
             }
         }
 

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

