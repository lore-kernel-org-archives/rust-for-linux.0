Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B71C480331;
	Fri, 22 May 2026 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779469998; cv=none; b=qouVzOeU+T1QzW+7szfrlOrvhX/D0/ecHYvn7R9IDG63vbD90skXIFCA2NyWNh2vZdXgLuGCQ9HzfFrv6zDcyxrFcCUl+Ks/LuKGryXk/eKiDdvb1MFkDpYUv2iRFl0d1BlEn1AppjsEiXtI7N6Yg80TNshIllvsqMzHcLWkVQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779469998; c=relaxed/simple;
	bh=ZABJEDgLiRrJk4lGGLErV+wQXs7IYcWC3GGwG0961z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8VL/XXwoki3LwqAXiXEChfVLhu/JL9V84izZA2/cdG183MiT8KS/gZcD+vPmjFJSmFTPM8lyUn3OGm1H4/xPgFTiyBb9p+sznakUr1oXV461Res9rkMc3ynxCPUkF890v1FRGV9/9DULjZtw1lHNCutpaooUWCkgUNmm2eCgh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxVUg+gt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxVUg+gt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D15E1F00A3F;
	Fri, 22 May 2026 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779469996;
	bh=JuZneZp60TIeiwZglXELuNSz9vuAuig9ocPn9+aAtpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SxVUg+gtbGxqNWq/5qvrgfw6LEyx9MXgmAxOffeUav2cq37LGtqSeI3x1KkzqVORp
	 CqlStJt5Fgqh6f/NugR0BrPHQs2WPonqsuvSCPq+onUpgBEBbdBi/W2iL0gm49SzDR
	 fC0Fx98z5SD+iKj1wTmId1aAqEMqRtHQ0UkV4DiawJHP4P3aFP9yKEEvvXL2htHU7w
	 hCIO0aaDofmTW2dYndHa3IJtaFmA0P66SJh2z8zPQxDEJh4AiK/XhEh1g2rSusdEVk
	 t59nSML+YQPcgMYqfEnB4EdRZxwb+mQp5ApgYwva28/deDfaVXiA0crrruodWpHVpP
	 93IV10vWPaKgw==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 22 May 2026 19:12:50 +0200
Subject: [PATCH 5/6] rust: binder: enable `clippy::as_underscore`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-binder-strict-provenance-v1-5-3d6e9406e864@kernel.org>
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
In-Reply-To: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13025; i=tamird@kernel.org;
 h=from:subject:message-id; bh=ZABJEDgLiRrJk4lGGLErV+wQXs7IYcWC3GGwG0961z8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFkCfdPDDiwIvqE3N7/z7N3SuWxfFESvTLBLeJtVILvh5
 N5VtU76HRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKa6JJWRoePirYrUSwY1xa9PGMU1XFSY9EI2KDXLwcdF58WWaeWP9jMyXOiTZ7/
 ctj6/dfI79da+386c05uMxb1EvrglOy93MPDhAAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

In Rust 1.63.0, Clippy introduced the `as_underscore` lint [1]:

> The conversion might include lossy conversion or a dangerous cast that
> might go undetected due to the type being inferred.
>
> The lint is allowed by default as using `_` is less wordy than always
> specifying the type.

Always specifying the type is especially helpful in function call
contexts where the inferred type may change at a distance. Specifying
the type also allows Clippy to spot more cases of `useless_conversion`.

While this does not eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize. It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint in the Binder Rust driver -- no functional
change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore [1]
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/allocation.rs       |  4 ++--
 drivers/android/binder/defs.rs             |  2 +-
 drivers/android/binder/node.rs             | 10 +++++-----
 drivers/android/binder/node/wrapper.rs     |  2 +-
 drivers/android/binder/process.rs          |  6 +++---
 drivers/android/binder/rust_binder_main.rs |  4 ++--
 drivers/android/binder/thread.rs           | 24 +++++++++++++-----------
 drivers/android/binder/transaction.rs      | 12 ++++++------
 8 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 0cab959e4b7e..4ac42bb7216b 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -376,8 +376,8 @@ pub(crate) fn transfer_binder_object(
                 BINDER_TYPE_WEAK_BINDER
             };
             newobj.flags = obj.flags;
-            newobj.__bindgen_anon_1.binder = ptr as _;
-            newobj.cookie = cookie as _;
+            newobj.__bindgen_anon_1.binder = ptr;
+            newobj.cookie = cookie;
             self.write(offset, &newobj)?;
             // Increment the user ref count on the node. It will be decremented as part of the
             // destruction of the buffer, when we see a binder or weak-binder object.
diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
index fd0ef3f9ebd1..a9682eb6d984 100644
--- a/drivers/android/binder/defs.rs
+++ b/drivers/android/binder/defs.rs
@@ -146,7 +146,7 @@ fn default() -> Self {
 impl BinderVersion {
     pub(crate) fn current() -> Self {
         Self(MaybeUninit::new(uapi::binder_version {
-            protocol_version: BINDER_CURRENT_PROTOCOL_VERSION as _,
+            protocol_version: BINDER_CURRENT_PROTOCOL_VERSION as i32,
         }))
     }
 }
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index a4a3ddda6ac9..8f5307c03b1a 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -464,7 +464,7 @@ pub(crate) fn incr_refcount_allow_zero2one_with_wrapper(
         owner_inner: &mut ProcessInner,
     ) -> Option<DLArc<dyn DeliverToRead>> {
         match self.incr_refcount_allow_zero2one(strong, owner_inner) {
-            Ok(Some(node)) => Some(node as _),
+            Ok(Some(node)) => Some(node as DLArc<dyn DeliverToRead>),
             Ok(None) => None,
             Err(CouldNotDeliverCriticalIncrement) => {
                 assert!(strong);
@@ -489,8 +489,8 @@ pub(crate) fn populate_counts(
         guard: &Guard<'_, ProcessInner, SpinLockBackend>,
     ) {
         let inner = self.inner.access(guard);
-        out.strong_count = inner.strong.count as _;
-        out.weak_count = inner.weak.count as _;
+        out.strong_count = inner.strong.count as u32;
+        out.weak_count = inner.weak.count as u32;
     }
 
     pub(crate) fn populate_debug_info(
@@ -498,8 +498,8 @@ pub(crate) fn populate_debug_info(
         out: &mut BinderNodeDebugInfo,
         guard: &Guard<'_, ProcessInner, SpinLockBackend>,
     ) {
-        out.ptr = self.ptr as _;
-        out.cookie = self.cookie as _;
+        out.ptr = self.ptr;
+        out.cookie = self.cookie;
         let inner = self.inner.access(guard);
         if inner.strong.has_count {
             out.has_strong_ref = 1;
diff --git a/drivers/android/binder/node/wrapper.rs b/drivers/android/binder/node/wrapper.rs
index 43294c050502..6e4ca01c941a 100644
--- a/drivers/android/binder/node/wrapper.rs
+++ b/drivers/android/binder/node/wrapper.rs
@@ -21,7 +21,7 @@ pub(crate) fn new() -> Result<Self> {
 
     pub(super) fn init(self, node: DArc<Node>) -> DLArc<dyn DeliverToRead> {
         match self.inner.pin_init_with(DTRWrap::new(NodeWrapper { node })) {
-            Ok(initialized) => ListArc::from(initialized) as _,
+            Ok(initialized) => ListArc::from(initialized) as DLArc<dyn DeliverToRead>,
             Err(err) => match err {},
         }
     }
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 820cbd541435..3a22260eb9b4 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -259,7 +259,7 @@ pub(crate) fn new_node_ref_with_thread(
         let push = match wrapper {
             None => node
                 .incr_refcount_allow_zero2one(strong, self)?
-                .map(|node| node as _),
+                .map(|node| node as DLArc<dyn DeliverToRead>),
             Some(wrapper) => node.incr_refcount_allow_zero2one_with_wrapper(strong, wrapper, self),
         };
         if let Some(node) = push {
@@ -741,7 +741,7 @@ fn set_as_manager(
         } else {
             (0, 0, 0)
         };
-        let node_ref = self.get_node(ptr, cookie, flags as _, true, thread)?;
+        let node_ref = self.get_node(ptr, cookie, flags, true, thread)?;
         let node = node_ref.node.clone();
         self.ctx.set_manager_node(node_ref)?;
         self.inner.lock().is_manager = true;
@@ -1517,7 +1517,7 @@ fn get_frozen_status(data: UserSlice) -> Result {
 
     for ctx in crate::context::get_all_contexts()? {
         ctx.for_each_proc(|proc| {
-            if proc.task.pid() == info.pid as _ {
+            if proc.task.pid() == info.pid as i32 {
                 found = true;
                 let inner = proc.inner.lock();
                 let txns_pending = inner.txns_pending_locked();
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 88da29413e16..2c10a8cd3d88 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -6,7 +6,7 @@
 
 #![crate_name = "rust_binder"]
 #![recursion_limit = "256"]
-#![allow(clippy::as_underscore, clippy::cast_lossless)]
+#![allow(clippy::cast_lossless)]
 
 use kernel::{
     bindings::{self, seq_file},
@@ -412,7 +412,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
     // SAFETY: We previously set `private_data` in `rust_binder_open`.
     let f = unsafe { Arc::<Process>::borrow((*file).private_data) };
     // SAFETY: The caller ensures that the file is valid.
-    match Process::ioctl(f, unsafe { File::from_raw_file(file) }, cmd as _, arg as _) {
+    match Process::ioctl(f, unsafe { File::from_raw_file(file) }, cmd, arg) {
         Ok(()) => 0,
         Err(err) => err.to_errno() as isize,
     }
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 97d5f31e8fe3..87298a8c597d 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -666,9 +666,9 @@ fn translate_object(
                 let strong = obj.hdr.type_ == BINDER_TYPE_BINDER;
                 // SAFETY: `binder` is a `binder_uintptr_t`; any bit pattern is a valid
                 // representation.
-                let ptr = unsafe { obj.__bindgen_anon_1.binder } as _;
-                let cookie = obj.cookie as _;
-                let flags = obj.flags as _;
+                let ptr = unsafe { obj.__bindgen_anon_1.binder };
+                let cookie = obj.cookie;
+                let flags = obj.flags;
                 let node = self
                     .process
                     .as_arc_borrow()
@@ -679,7 +679,7 @@ fn translate_object(
             BinderObjectRef::Handle(obj) => {
                 let strong = obj.hdr.type_ == BINDER_TYPE_HANDLE;
                 // SAFETY: `handle` is a `u32`; any bit pattern is a valid representation.
-                let handle = unsafe { obj.__bindgen_anon_1.handle } as _;
+                let handle = unsafe { obj.__bindgen_anon_1.handle };
                 let node = self.process.get_node_from_handle(handle, strong)?;
                 security::binder_transfer_binder(&self.process.cred, &view.alloc.process.cred)?;
                 view.transfer_binder_object(offset, obj, strong, node)?;
@@ -736,7 +736,7 @@ fn translate_object(
                     ScatterGatherEntry {
                         obj_index,
                         offset: alloc_offset,
-                        sender_uaddr: obj.buffer as _,
+                        sender_uaddr: obj.buffer as usize,
                         length: obj_length,
                         pointer_fixups: KVec::new(),
                         fixup_min_offset: 0,
@@ -843,7 +843,7 @@ fn translate_object(
                     .ok_or(EINVAL)?;
 
                 let mut fda_bytes = KVec::new();
-                UserSlice::new(UserPtr::from_addr(fda_uaddr as _), fds_len)
+                UserSlice::new(UserPtr::from_addr(fda_uaddr as usize), fds_len)
                     .read_all(&mut fda_bytes, GFP_KERNEL)?;
 
                 if fds_len != fda_bytes.len() {
@@ -1365,7 +1365,7 @@ fn write(self: &Arc<Self>, req: &mut BinderWriteRead) -> Result {
         let write_start = req.write_buffer.wrapping_add(req.write_consumed);
         let write_len = req.write_size.saturating_sub(req.write_consumed);
         let mut reader =
-            UserSlice::new(UserPtr::from_addr(write_start as _), write_len as _).reader();
+            UserSlice::new(UserPtr::from_addr(write_start as usize), write_len as usize).reader();
 
         while reader.len() >= size_of::<u32>() && self.inner.lock().return_work.is_unused() {
             let before = reader.len();
@@ -1436,7 +1436,7 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
         let read_start = req.read_buffer.wrapping_add(req.read_consumed);
         let read_len = req.read_size.saturating_sub(req.read_consumed);
         let mut writer = BinderReturnWriter::new(
-            UserSlice::new(UserPtr::from_addr(read_start as _), read_len as _).writer(),
+            UserSlice::new(UserPtr::from_addr(read_start as usize), read_len as usize).writer(),
             self,
         );
         let (in_pool, has_transaction, thread_todo, use_proc_queue) = {
@@ -1500,9 +1500,11 @@ fn read(self: &Arc<Self>, req: &mut BinderWriteRead, wait: bool) -> Result {
 
         // Write BR_SPAWN_LOOPER if the process needs more threads for its pool.
         if has_noop_placeholder && in_pool && self.process.needs_thread() {
-            let mut writer =
-                UserSlice::new(UserPtr::from_addr(req.read_buffer as _), req.read_size as _)
-                    .writer();
+            let mut writer = UserSlice::new(
+                UserPtr::from_addr(req.read_buffer as usize),
+                req.read_size as usize,
+            )
+            .writer();
             writer.write(&BR_SPAWN_LOOPER)?;
         }
         Ok(())
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 47d5e4d88b07..6edd19461785 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -402,16 +402,16 @@ fn do_work(
         let tr = tr_sec.tr_data();
         if let Some(target_node) = &self.target_node {
             let (ptr, cookie) = target_node.get_id();
-            tr.target.ptr = ptr as _;
-            tr.cookie = cookie as _;
+            tr.target.ptr = ptr;
+            tr.cookie = cookie;
         };
         tr.code = self.code;
         tr.flags = self.flags;
-        tr.data_size = self.data_size as _;
-        tr.data.ptr.buffer = self.data_address as _;
-        tr.offsets_size = self.offsets_size as _;
+        tr.data_size = self.data_size as u64;
+        tr.data.ptr.buffer = self.data_address as u64;
+        tr.offsets_size = self.offsets_size as u64;
         if tr.offsets_size > 0 {
-            tr.data.ptr.offsets = (self.data_address + ptr_align(self.data_size).unwrap()) as _;
+            tr.data.ptr.offsets = (self.data_address + ptr_align(self.data_size).unwrap()) as u64;
         }
         tr.sender_euid = self.sender_euid.into_uid_in_current_ns();
         tr.sender_pid = 0;

-- 
2.54.0

