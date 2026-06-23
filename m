Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8DA309EF2
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229102; cv=none; b=mdNGBt6X0ConNyrXQ8MucneQw6NiSZfS1T6Po55mTUQCneQ8BGiO3RYaLaN+ckEoOA4MyBnwirxRvkQ7ZGeOccXbGl1z+Ph/e3cVHWRzQg980Nz0XTwkEFNXAp+tWQAVP3vMMblc0xsF1xX/BrPHe5DWDO7MjKPejkQ6Wm0OE3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229102; c=relaxed/simple;
	bh=iMeTO9E8CnFHyNRXXjSzsmxutMytQcN7KYSXF/1cEU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zowah/r+9cKFHVqZRnbgS/4UOR9QmfD37afuChS2p+anpoX+uOfCpTTvkV+T25z7HG5V2Kql4QhdvUZ85pCkv0fIcJQ10itVzJAEny8JAlJaSx9KCs7SNtoUQfcvnC24yyFiCDXlMFDj0/z5q/Ft8pErB3iJkhNidlQ5fNS42hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3WZrJbE; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q3WZrJbE"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-697d28fa023so1924244a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 08:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782229098; x=1782833898; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cb8SEaN18x5+uVxchKZ+1TpNYnUc8q1VWmay+BZHD50=;
        b=Q3WZrJbELAXA3FETuZR5x+KOk2k0jYkxsfENbDZ6oQ31KvM+lK1C32EGFK+VApT8eV
         fWqwQkZBgHMfjT61nBP+3Fc/bTQ1/FLDM6WF6vronFX6xuwbJR6wc9qirFIyj+VIfIFo
         XPVt8lEHvLiYw3WiXh/u2KQ1QiSaga6Uuhw/3U9vtuOVrFjYfDwwMpmOSnNPyanEBOK2
         C8cdzGrkSewKZB2Ru55NgytINO5RCerYB5l2Uj83GSGeDaE9CnvdoisHLIxxDHpUol+r
         a072MSJrdY8pjg2oB+Gm9VWg5rg1IZUCYRF5o7tOTxEbs36s7w2CfhjEdQZ9HbPel8CO
         mRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229098; x=1782833898;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cb8SEaN18x5+uVxchKZ+1TpNYnUc8q1VWmay+BZHD50=;
        b=pJvi1IaAaVXPuULWM3gwEbJpdgZhRBIDFzrtR4u38xuxOPKcKjahXjQfk2YCU1G/hG
         k7zkUU6DhNEOOZn1UN8PP3afJceDGYkOy4l1H0Ti1lBvCp+wdyHya1QXakdNaTH6BU7K
         cXCJfGDv9NRuhpu0tn1env1clnY6DM8zix7cyocJ5qGdlcfELomI77GQ8L2+umbM6Siq
         dC/rtmpF3D0yxAlAdcAHUWI9/1BDoV6fUn+fpsCWQijohou4zEb33R/1VT0294q20SPl
         1CkGHLxC5eKgEXB6IUnww6XZWinyo8bDEa/5uZjP0ByqS835qBdRZPmeVjKcLa58i4Jk
         6Ncw==
X-Forwarded-Encrypted: i=1; AFNElJ9z4PcN6VT0uHUQJFVElFUJcy+Y4IJ17TALT1JtI5akqSK/wqZO/7HFhPe/5VWb3874nhAy5hcyClA9YGgf6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdP5l+/EK2s4b5N42L1BZbmm7hnCVqNBm0THG9PXZG8Cx1pQxf
	6BNqyZ3D1+GBG5aGOWN9mUY1kr8HlfzABmeIW75FmNqvzmy+PJMHAk3yTjom96dd3Z87Po2myd7
	H7idxPKDni/w9cXPsUA==
X-Received: from edyc3.prod.google.com ([2002:aa7:df03:0:b0:696:89fa:9a4b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2696:b0:697:d3b9:46c8 with SMTP id 4fb4d7f45d1cf-697d3b94799mr3268925a12.15.1782229097533;
 Tue, 23 Jun 2026 08:38:17 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:38:08 +0000
In-Reply-To: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=33690; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=iMeTO9E8CnFHyNRXXjSzsmxutMytQcN7KYSXF/1cEU4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqOqhgU2L0Aid7zvVJHf48guYkhkiksZDxHZo22
 U0LJA15QiuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCajqoYAAKCRAEWL7uWMY5
 RisLD/9SXQxom+UfW8WhbLZaRtYDPA/EDtqxN1f66v0/uTGbHBurgaKK3JtCXk1ZBqthuv523WV
 VGDx11BEj9Y7hdCJ2n9HDeJRBIXFjLRDDkfkT9PB9EWfgzHGjPVubAvjimNzNZSxof6fv5eJR72
 YoU2Jt7EyGC6PRoSeEgqQhXiXgNqWFIGpAKlUC+AAdGSPr+aPtwa6WJ9J7rvr5LewXAkT8EHLYr
 sjEhQw25NF1qZDF2haN89o+r4YOtH7MuwxdTKh6FIC19TBHTsnYH7V6HUO1rlnzPCOeP54O/nn2
 /xgkKDQ1hkPukLQ+6tgJwrmUYHrMz0uhghHPJo/d5mY8Bu+FhX7agiq6828vkTRtWiQKvxMivib
 jZd7pn2AGL0yuLKm907718Mqn5KglezOu6Lj8oY9Ojjpc8tzMwvKcBWbjOrRoi2vmqL9TEJlseo
 xuOIDiplPVQFM7YIeRBhkxIJ6l8zCN3t5JuUzMygiQeJHaPLr03tmrZ8XRGImNfye7/jk1rfp1e
 iirrx1nPxq62PsUEsgnvIrw1KYoZYtwuItkB9uSWzHw0KyYtQJzIDdyaUokxbGG1mhez2PsyCKG
 0Ebf/Q5CW0mjhAxtH74iY7lpCUa6iy2vA/rC8ViigoObyrlGGlDNV4w1F0rB/f/KDRzm0Rlqssi gAMbvaFHSDevDig==
X-Mailer: b4 0.14.3
Message-ID: <20260623-pr-ratelimited-v1-5-cc922f544dc0@google.com>
Subject: [PATCH 5/5] rust_binder: use pr_*_ratelimited! for printing
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
limited. While we're at it, fix the missing newlines at the end of
several println statements.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/allocation.rs  |  4 +-
 drivers/android/binder/context.rs     |  6 +--
 drivers/android/binder/freeze.rs      | 22 +++++-----
 drivers/android/binder/node.rs        |  8 ++--
 drivers/android/binder/page_range.rs  | 12 +++---
 drivers/android/binder/process.rs     | 36 +++++++++--------
 drivers/android/binder/thread.rs      | 76 +++++++++++++++++++----------------
 drivers/android/binder/transaction.rs |  4 +-
 8 files changed, 90 insertions(+), 78 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index b7b05e72970a..ed5f6c253c92 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -261,7 +261,7 @@ fn drop(&mut self) {
                 let view = AllocationView::new(self, offsets.start);
                 for i in offsets.step_by(size_of::<usize>()) {
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
diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 20041689e98d..d721a58453b5 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -183,12 +183,12 @@ pub(crate) fn request_freeze_notif(
             info = match node_refs.by_handle.get_mut(&handle) {
                 Some(info) => info,
                 None => {
-                    pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION invalid ref {}\n", handle);
+                    pr_warn_ratelimited!("BC_REQUEST_FREEZE_NOTIFICATION invalid ref {}\n", handle);
                     return Err(EINVAL);
                 }
             };
             if info.freeze().is_some() {
-                pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION already set\n");
+                pr_warn_ratelimited!("BC_REQUEST_FREEZE_NOTIFICATION already set\n");
                 return Err(EINVAL);
             }
             let node_ref = info.node_ref();
@@ -197,7 +197,7 @@ pub(crate) fn request_freeze_notif(
 
             if let rbtree::Entry::Occupied(ref dupe) = freeze_entry {
                 if !dupe.get().allow_duplicate(&node_ref.node) {
-                    pr_warn!("BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie\n");
+                    pr_warn_ratelimited!("BC_REQUEST_FREEZE_NOTIFICATION duplicate cookie\n");
                     return Err(EINVAL);
                 }
             }
@@ -262,7 +262,7 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
         let Some(freeze) = node_refs.freeze_listeners.get_mut(&cookie) else {
-            pr_warn!("BC_FREEZE_NOTIFICATION_DONE {:016x} not found\n", cookie.0);
+            pr_warn_ratelimited!("BC_FREEZE_NOTIFICATION_DONE {:016x} not found\n", cookie.0);
             return Err(EINVAL);
         };
         let mut clear_msg = None;
@@ -272,7 +272,7 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
             freeze.num_cleared_duplicates += 1;
         } else {
             if !freeze.is_pending {
-                pr_warn!(
+                pr_warn_ratelimited!(
                     "BC_FREEZE_NOTIFICATION_DONE {:016x} not pending\n",
                     cookie.0
                 );
@@ -302,19 +302,21 @@ pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader)
         let mut node_refs_guard = self.node_refs.lock();
         let node_refs = &mut *node_refs_guard;
         let Some(info) = node_refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION invalid ref {}\n", handle);
+            pr_warn_ratelimited!("BC_CLEAR_FREEZE_NOTIFICATION invalid ref {}\n", handle);
             return Err(EINVAL);
         };
         let Some(info_cookie) = info.freeze() else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION freeze notification not active\n");
+            pr_warn_ratelimited!("BC_CLEAR_FREEZE_NOTIFICATION freeze notification not active\n");
             return Err(EINVAL);
         };
         if *info_cookie != cookie {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION freeze notification cookie mismatch\n");
+            pr_warn_ratelimited!(
+                "BC_CLEAR_FREEZE_NOTIFICATION freeze notification cookie mismatch\n"
+            );
             return Err(EINVAL);
         }
         let Some(listener) = node_refs.freeze_listeners.get_mut(&cookie) else {
-            pr_warn!("BC_CLEAR_FREEZE_NOTIFICATION invalid cookie {}\n", handle);
+            pr_warn_ratelimited!("BC_CLEAR_FREEZE_NOTIFICATION invalid cookie {}\n", handle);
             return Err(EINVAL);
         };
         listener.is_clearing = true;
@@ -379,7 +381,7 @@ fn find_freeze_recipients(&self) -> Result<KVVec<(DArc<Node>, Arc<Process>)>, Al
                 recipients
                     .push_within_capacity(node_proc_pair)
                     .map_err(|_| {
-                        pr_err!(
+                        pr_err_ratelimited!(
                             "push_within_capacity failed even though we checked the capacity\n"
                         );
                         AllocError
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 8041677908fd..350b6a6a7c83 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -343,7 +343,7 @@ pub(crate) fn inc_ref_done_locked(
     ) -> Option<DLArc<Node>> {
         let inner = self.inner.access_mut(owner_inner);
         if inner.active_inc_refs == 0 {
-            pr_err!("inc_ref_done called when no active inc_refs");
+            pr_err_ratelimited!("inc_ref_done called when no active inc_refs\n");
             return None;
         }
 
@@ -399,7 +399,7 @@ pub(crate) fn update_refcount_locked(
             !is_dead && !state.has_count
         } else {
             if state.count < count {
-                pr_err!("Failure: refcount underflow!");
+                pr_err_ratelimited!("Failure: refcount underflow!\n");
                 return None;
             }
             state.count -= count;
@@ -693,7 +693,7 @@ pub(crate) fn remove_freeze_listener(&self, p: &Arc<Process>) -> KVVec<Arc<Proce
         let len = inner.freeze_list.len();
         inner.freeze_list.retain(|proc| !Arc::ptr_eq(proc, p));
         if len == inner.freeze_list.len() {
-            pr_warn!(
+            pr_warn_ratelimited!(
                 "Could not remove freeze listener for {}\n",
                 p.pid_in_current_ns()
             );
@@ -865,7 +865,7 @@ pub(crate) fn update(&mut self, inc: bool, strong: bool) -> bool {
             *count += 1;
         } else {
             if *count == 0 {
-                pr_warn!(
+                pr_warn_ratelimited!(
                     "pid {} performed invalid decrement on ref\n",
                     kernel::current!().pid()
                 );
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index e82a5523804f..18ff80d05479 100644
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
index fd09e177f7e8..aeec16284956 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -314,7 +314,7 @@ pub(crate) fn death_delivered(&mut self, death: DArc<NodeDeath>) {
         if let Some(death) = ListArc::try_from_arc_or_drop(death) {
             self.delivered_deaths.push_back(death);
         } else {
-            pr_warn!("Notification added to `delivered_deaths` twice.");
+            pr_warn_ratelimited!("Notification added to `delivered_deaths` twice.\n");
         }
     }
 
@@ -691,7 +691,7 @@ fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
         let id = {
             let current = kernel::current!();
             if self.task != current.group_leader() {
-                pr_err!("get_current_thread was called from the wrong process.");
+                pr_err_ratelimited!("get_current_thread was called from the wrong process.\n");
                 return Err(EINVAL);
             }
             current.pid()
@@ -715,7 +715,7 @@ fn get_current_thread(self: ArcBorrow<'_, Self>) -> Result<Arc<Thread>> {
                 Ok(ta)
             }
             rbtree::Entry::Occupied(_entry) => {
-                pr_err!("Cannot create two threads with the same id.");
+                pr_err_ratelimited!("Cannot create two threads with the same id.\n");
                 Err(EINVAL)
             }
         }
@@ -851,7 +851,9 @@ pub(crate) fn insert_or_update_handle(
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
@@ -991,7 +993,7 @@ pub(crate) fn update_ref(
         } else {
             // All refs are cleared in process exit, so this warning is expected in that case.
             if !self.inner.lock().is_dead {
-                pr_warn!("{}: no such ref {handle}\n", self.pid_in_current_ns());
+                pr_warn_ratelimited!("{}: no such ref {handle}\n", self.pid_in_current_ns());
             }
         }
         Ok(())
@@ -1071,7 +1073,7 @@ pub(crate) fn buffer_alloc(
         ) {
             Ok(()) => {}
             Err(err) => {
-                pr_warn!("use_range failure {:?}", err);
+                pr_warn_ratelimited!("use_range failure {:?}\n", err);
                 return Err(err.into());
             }
         }
@@ -1102,7 +1104,7 @@ pub(crate) fn buffer_raw_free(&self, ptr: usize) {
             let freed_range = match mapping.alloc.reservation_abort(offset) {
                 Ok(freed_range) => freed_range,
                 Err(_) => {
-                    pr_warn!(
+                    pr_warn_ratelimited!(
                         "Pointer {:x} failed to free, base = {:x}\n",
                         ptr,
                         mapping.address
@@ -1124,7 +1126,7 @@ pub(crate) fn buffer_make_freeable(&self, offset: usize, mut data: Option<Alloca
         let mut inner = self.inner.lock();
         if let Some(ref mut mapping) = &mut inner.mapping {
             if mapping.alloc.reservation_commit(offset, &mut data).is_err() {
-                pr_warn!("Offset {} failed to be marked freeable\n", offset);
+                pr_warn_ratelimited!("Offset {} failed to be marked freeable\n", offset);
             }
         }
     }
@@ -1244,13 +1246,13 @@ pub(crate) fn request_death(
         })?;
         let mut refs = self.node_refs.lock();
         let Some(info) = refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_REQUEST_DEATH_NOTIFICATION invalid ref {handle}\n");
+            pr_warn_ratelimited!("BC_REQUEST_DEATH_NOTIFICATION invalid ref {handle}\n");
             return Ok(());
         };
 
         // Nothing to do if there is already a death notification request for this handle.
         if info.death().is_some() {
-            pr_warn!("BC_REQUEST_DEATH_NOTIFICATION death notification already set\n");
+            pr_warn_ratelimited!("BC_REQUEST_DEATH_NOTIFICATION death notification already set\n");
             return Ok(());
         }
 
@@ -1287,17 +1289,19 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
 
         let mut refs = self.node_refs.lock();
         let Some(info) = refs.by_handle.get_mut(&handle) else {
-            pr_warn!("BC_CLEAR_DEATH_NOTIFICATION invalid ref {handle}\n");
+            pr_warn_ratelimited!("BC_CLEAR_DEATH_NOTIFICATION invalid ref {handle}\n");
             return Ok(());
         };
 
         let Some(death) = info.death().take() else {
-            pr_warn!("BC_CLEAR_DEATH_NOTIFICATION death notification not active\n");
+            pr_warn_ratelimited!("BC_CLEAR_DEATH_NOTIFICATION death notification not active\n");
             return Ok(());
         };
         if death.cookie != cookie {
             *info.death() = Some(death);
-            pr_warn!("BC_CLEAR_DEATH_NOTIFICATION death notification cookie mismatch\n");
+            pr_warn_ratelimited!(
+                "BC_CLEAR_DEATH_NOTIFICATION death notification cookie mismatch\n"
+            );
             return Ok(());
         }
 
@@ -1454,7 +1458,7 @@ pub(crate) fn drop_outstanding_txn(&self) {
         let wake = {
             let mut inner = self.inner.lock();
             if inner.outstanding_txns == 0 {
-                pr_err!("outstanding_txns underflow");
+                pr_err_ratelimited!("outstanding_txns underflow\n");
                 return;
             }
             inner.outstanding_txns -= 1;
@@ -1768,7 +1772,7 @@ fn new(thread: &'a Arc<Thread>, guard: &mut Guard<'_, ProcessInner, SpinLockBack
             // It is an error to hit this branch, and it should not be reachable. We try to do
             // something reasonable when the failure path happens. Most likely, the thread in
             // question will sleep forever.
-            pr_err!("Same thread registered with `ready_threads` twice.");
+            pr_err_ratelimited!("Same thread registered with `ready_threads` twice.\n");
         }
         Self { thread }
     }
@@ -1793,7 +1797,7 @@ impl Drop for WithNodes<'_> {
     fn drop(&mut self) {
         core::mem::swap(&mut self.nodes, &mut self.inner.nodes);
         if self.nodes.iter().next().is_some() {
-            pr_err!("nodes array was modified while using lock_with_nodes\n");
+            pr_err_ratelimited!("nodes array was modified while using lock_with_nodes\n");
         }
     }
 }
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index a5b038877747..34950d86854c 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -159,8 +159,8 @@ fn validate_parent_fixup(
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
@@ -169,8 +169,8 @@ fn validate_parent_fixup(
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
@@ -178,8 +178,8 @@ fn validate_parent_fixup(
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
@@ -328,7 +328,7 @@ fn push_reply_work(&mut self, code: u32) -> PushWorkRes {
             work.set_error_code(code);
             self.push_work(work)
         } else {
-            pr_warn!("Thread reply work is already in use.");
+            pr_warn_ratelimited!("Thread reply work is already in use.\n");
             PushWorkRes::Ok
         }
     }
@@ -339,7 +339,7 @@ fn push_return_work(&mut self, reply: u32) {
             // Not notifying: Reply to current thread.
             let _ = self.push_work(work);
         } else {
-            pr_warn!("Thread return work is already in use.");
+            pr_warn_ratelimited!("Thread return work is already in use.\n");
         }
     }
 
@@ -743,8 +743,8 @@ fn translate_object(
                 let alloc_offset = match sg_state.unused_buffer_space.claim_next(obj_length) {
                     Ok(alloc_offset) => alloc_offset,
                     Err(err) => {
-                        pr_warn!(
-                            "Failed to claim space for a BINDER_TYPE_PTR. (offset: {}, limit: {}, size: {})",
+                        pr_warn_ratelimited!(
+                            "Failed to claim space for a BINDER_TYPE_PTR. (offset: {}, limit: {}, size: {})\n",
                             sg_state.unused_buffer_space.offset,
                             sg_state.unused_buffer_space.limit,
                             obj_length,
@@ -790,8 +790,8 @@ fn translate_object(
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
@@ -836,8 +836,8 @@ fn translate_object(
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
@@ -869,7 +869,9 @@ fn translate_object(
                     .read_all(&mut fda_bytes, GFP_KERNEL)?;
 
                 if fds_len != fda_bytes.len() {
-                    pr_err!("UserSlice::read_all returned wrong length in BINDER_TYPE_FDA");
+                    pr_err_ratelimited!(
+                        "UserSlice::read_all returned wrong length in BINDER_TYPE_FDA\n"
+                    );
                     return Err(EINVAL.into());
                 }
 
@@ -927,8 +929,8 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
 
                 let target_offset_end = fixup_offset.checked_add(fixup_len).ok_or(EINVAL)?;
                 if fixup_offset < end_of_previous_fixup || offset_end < target_offset_end {
-                    pr_warn!(
-                        "Fixups oob {} {} {} {}",
+                    pr_warn_ratelimited!(
+                        "Fixups oob {} {} {} {}\n",
                         fixup_offset,
                         end_of_previous_fixup,
                         offset_end,
@@ -940,18 +942,18 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
                 let copy_off = end_of_previous_fixup;
                 let copy_len = fixup_offset - end_of_previous_fixup;
                 if let Err(err) = alloc.copy_into(&mut reader, copy_off, copy_len) {
-                    pr_warn!("Failed copying into alloc: {:?}", err);
+                    pr_warn_ratelimited!("Failed copying into alloc: {:?}\n", err);
                     return Err(err.into());
                 }
                 if let PointerFixupEntry::Fixup { pointer_value, .. } = fixup {
                     let res = alloc.write::<u64>(fixup_offset, pointer_value);
                     if let Err(err) = res {
-                        pr_warn!("Failed copying ptr into alloc: {:?}", err);
+                        pr_warn_ratelimited!("Failed copying ptr into alloc: {:?}\n", err);
                         return Err(err.into());
                     }
                 }
                 if let Err(err) = reader.skip(fixup_len) {
-                    pr_warn!("Failed skipping {} from reader: {:?}", fixup_len, err);
+                    pr_warn_ratelimited!("Failed skipping {} from reader: {:?}\n", fixup_len, err);
                     return Err(err.into());
                 }
                 end_of_previous_fixup = target_offset_end;
@@ -959,7 +961,7 @@ fn apply_sg(&self, alloc: &mut Allocation, sg_state: &mut ScatterGatherState) ->
             let copy_off = end_of_previous_fixup;
             let copy_len = offset_end - end_of_previous_fixup;
             if let Err(err) = alloc.copy_into(&mut reader, copy_off, copy_len) {
-                pr_warn!("Failed copying remainder into alloc: {:?}", err);
+                pr_warn_ratelimited!("Failed copying remainder into alloc: {:?}\n", err);
                 return Err(err.into());
             }
         }
@@ -984,7 +986,11 @@ pub(crate) fn copy_transaction_data(
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
@@ -1054,7 +1060,7 @@ pub(crate) fn copy_transaction_data(
                 let offset: usize = offset.try_into().map_err(|_| EINVAL)?;
 
                 if offset < end_of_previous_object || !is_aligned(offset, size_of::<u32>()) {
-                    pr_warn!("Got transaction with invalid offset.");
+                    pr_warn_ratelimited!("Got transaction with invalid offset.\n");
                     return Err(EINVAL.into());
                 }
 
@@ -1079,7 +1085,7 @@ pub(crate) fn copy_transaction_data(
                 ) {
                     Ok(()) => end_of_previous_object = offset + object.size(),
                     Err(err) => {
-                        pr_warn!("Error while translating object.");
+                        pr_warn_ratelimited!("Error while translating object.\n");
                         return Err(err);
                     }
                 }
@@ -1100,14 +1106,14 @@ pub(crate) fn copy_transaction_data(
 
         if let Some(sg_state) = sg_state.as_mut() {
             if let Err(err) = self.apply_sg(&mut alloc, sg_state) {
-                pr_warn!("Failure in apply_sg: {:?}", err);
+                pr_warn_ratelimited!("Failure in apply_sg: {:?}\n", err);
                 return Err(err);
             }
         }
 
         if let Some((off_out, secctx)) = secctx.as_mut() {
             if let Err(err) = alloc.write(secctx_off, secctx.as_bytes()) {
-                pr_warn!("Failed to write security context: {:?}", err);
+                pr_warn_ratelimited!("Failed to write security context: {:?}\n", err);
                 return Err(err.into());
             }
             **off_out = secctx_off;
@@ -1206,7 +1212,7 @@ fn top_of_transaction_stack(&self) -> Result<Option<DArc<Transaction>>> {
         let inner = self.inner.lock();
         if let Some(cur) = &inner.current_transaction {
             if core::ptr::eq(self, cur.from.as_ref()) {
-                pr_warn!("got new transaction with bad transaction stack");
+                pr_warn_ratelimited!("got new transaction with bad transaction stack\n");
                 return Err(EINVAL);
             }
             Ok(Some(cur.clone()))
@@ -1308,7 +1314,7 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                 reply: info.reply,
                 source: Error::try_from_errno(info.errno),
             };
-            pr_warn!(
+            pr_warn_ratelimited!(
                 "{}:{} {} to {} failed: {err:?}, {} bytes\n",
                 info.from_pid,
                 info.from_tid,
@@ -1343,7 +1349,7 @@ fn transaction_inner(self: &Arc<Self>, info: &mut TransactionInfo) -> BinderResu
         {
             let mut inner = self.inner.lock();
             if !transaction.is_stacked_on(&inner.current_transaction) {
-                pr_warn!("Transaction stack changed during transaction!");
+                pr_warn_ratelimited!("Transaction stack changed during transaction!\n");
                 return Err(EINVAL.into());
             }
             inner.current_transaction = Some(transaction.clone_arc());
@@ -1525,7 +1531,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
         let mut has_noop_placeholder = false;
         if req.read_consumed == 0 {
             if let Err(err) = writer.write_code(BR_NOOP) {
-                pr_warn!("Failure when writing BR_NOOP at beginning of buffer.");
+                pr_warn_ratelimited!("Failure when writing BR_NOOP at beginning of buffer.\n");
                 return Err(err);
             }
             has_noop_placeholder = true;
@@ -1548,7 +1554,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
                 Err(err) => {
                     // Propagate the error if we haven't written anything else.
                     if err != EINTR && err != EAGAIN {
-                        pr_warn!("Failure in work getter: {:?}", err);
+                        pr_warn_ratelimited!("Failure in work getter: {:?}\n", err);
                     }
                     if initial_len == writer.len() {
                         return Err(err);
@@ -1581,8 +1587,8 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
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
@@ -1598,8 +1604,8 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlice, wait: bool) -> Resul
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
index 316627e5f9ac..bfbd02671b37 100644
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
2.55.0.rc0.799.gd6f94ed593-goog

