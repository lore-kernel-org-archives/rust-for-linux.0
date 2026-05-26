Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577C426699;
	Tue, 26 May 2026 18:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820766; cv=none; b=cD80UYX7CeM6Y3fnzmAf90/2kzX63QbjNlzdrUn0XbafaD22TBD0vlQzX9lqbOuVCTvu6kaDo8N6FIoRauGDDEZwOtrkO3OG98pU3WKwDLF3qBbLFVrQXSgW0FuEqJWD45FaZP8JrMdJOTMhyiY+3vI8MSh6KbcKgr/AE2xMiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820766; c=relaxed/simple;
	bh=hDDPWOs/safUlJLPOV9TbsGKzlNTkzgW9WcBwV8On6Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XhwQ0XdyZ/Ai3kx3iZl+xN/N9panjJG3ec4x/M3qJfZA33B2WXs4HjpQWptHLh48Bwk5D4hht4wIJ8yws14ew7ZXFlwNRl6BQV+MKRub/nK315B93tEDUCOm/cfhRM9Ie+TH+6GVWN1kNrQCB1zpt5RuyNvQO8wAsx2Lb4lIXuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6zYGWXm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6zYGWXm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F0E1F01558;
	Tue, 26 May 2026 18:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820761;
	bh=xN3ds+X8QR47mPHuy8CP8Eh10MqiacB5ujNAN8JQUPo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Y6zYGWXmkMzMgRnHjipQshI5fJGYs/TuE+2Nu4RU/TJ2JW/iKtR4SUNUfVoxNAUwL
	 1/nADxYKTb+Jv16+DbWzyl/2rDFdQtVvm/wOYxf8Vizd8rzExDiclDV3y8vE8dWrn7
	 V22MArrcoqbUgjhgYs+odJhE9QBGIwJJQAhDn/2tY+ra6maPg1ZlnStN0IASw7S6Hz
	 FpCSsBetihxK5REgQRx4G9MyCdmPfKUE18Z5wXODwZNIZZiNerZtZQjPYoSOkhUnKo
	 ImDkX621nDWxogkYzzYegTUrHojnPNFqLHBec6TSQoDCuKr2LTTjsLm9eydFdy+qCC
	 K+e20uE69kKIA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 14:39:10 -0400
Subject: [PATCH v2 4/5] rust: binder: enable `clippy::as_underscore`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-binder-strict-provenance-v2-4-a41d89c29bc5@kernel.org>
References: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
In-Reply-To: <20260526-binder-strict-provenance-v2-0-a41d89c29bc5@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=14342; i=tamird@kernel.org;
 h=from:subject:message-id; bh=hDDPWOs/safUlJLPOV9TbsGKzlNTkzgW9WcBwV8On6Q=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiLy7c51TfJaNjcVyhtJvhj8mVF/tdA87Pv6C3LSjX8
 4qj0/32joksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFOtasfIsELn6903gnuVfv/j2v3oeogy55agJs8zxfyCTw193CcuXs3IsH6yRfu
 v8kcL173feSxm8895iwSjFX4zzd2/hH9li+2rUm4A
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

Several inferred conversions from `binder_uintptr_t` to the driver's
internal `u64` node identifiers are identity conversions. Although the
UAPI header retains `BINDER_IPC_32BIT` for userspace building against
older kernels, commit 1190b4e38f97 ("ANDROID: binder: remove 32-bit
binder interface.") removed kernel support for selecting that protocol.
Rust Binder therefore uses the 64-bit Binder protocol on every supported
architecture.

While this does not eliminate unchecked `as` conversions, it makes such
conversions easier to scrutinize. It also has the slight benefit of
removing a degree of freedom on which to bikeshed. Thus apply the
changes and enable the lint in the Binder Rust driver -- no functional
change intended.

Link: https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore [1]
Assisted-by: Codex:gpt-5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 drivers/android/binder/allocation.rs       |  4 ++--
 drivers/android/binder/defs.rs             |  2 +-
 drivers/android/binder/node.rs             | 11 ++++++-----
 drivers/android/binder/node/wrapper.rs     |  2 +-
 drivers/android/binder/process.rs          |  8 ++++----
 drivers/android/binder/rust_binder_main.rs |  4 ++--
 drivers/android/binder/thread.rs           | 24 +++++++++++++-----------
 drivers/android/binder/transaction.rs      | 14 ++++++++------
 8 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 0cab959e4b7e..61fc08bcd6be 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -376,8 +376,8 @@ pub(crate) fn transfer_binder_object(
                 BINDER_TYPE_WEAK_BINDER
             };
             newobj.flags = obj.flags;
-            newobj.__bindgen_anon_1.binder = ptr as _;
-            newobj.cookie = cookie as _;
+            newobj.__bindgen_anon_1.binder = ptr as uapi::binder_uintptr_t;
+            newobj.cookie = cookie as uapi::binder_uintptr_t;
             self.write(offset, &newobj)?;
             // Increment the user ref count on the node. It will be decremented as part of the
             // destruction of the buffer, when we see a binder or weak-binder object.
diff --git a/drivers/android/binder/defs.rs b/drivers/android/binder/defs.rs
index e697c2c13e29..8ac9bdd7a499 100644
--- a/drivers/android/binder/defs.rs
+++ b/drivers/android/binder/defs.rs
@@ -148,7 +148,7 @@ fn default() -> Self {
 impl BinderVersion {
     pub(crate) fn current() -> Self {
         Self(MaybeUninit::new(uapi::binder_version {
-            protocol_version: BINDER_CURRENT_PROTOCOL_VERSION as _,
+            protocol_version: BINDER_CURRENT_PROTOCOL_VERSION as i32,
         }))
     }
 }
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 3d96738dee66..4e75f58bf0db 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -9,6 +9,7 @@
     seq_print,
     sync::lock::{spinlock::SpinLockBackend, Guard},
     sync::{Arc, LockedBy, SpinLock},
+    uapi,
 };
 
 use crate::{
@@ -465,7 +466,7 @@ pub(crate) fn incr_refcount_allow_zero2one_with_wrapper(
         owner_inner: &mut ProcessInner,
     ) -> Option<DLArc<dyn DeliverToRead>> {
         match self.incr_refcount_allow_zero2one(strong, owner_inner) {
-            Ok(Some(node)) => Some(node as _),
+            Ok(Some(node)) => Some(node as DLArc<dyn DeliverToRead>),
             Ok(None) => None,
             Err(CouldNotDeliverCriticalIncrement) => {
                 assert!(strong);
@@ -490,8 +491,8 @@ pub(crate) fn populate_counts(
         guard: &Guard<'_, ProcessInner, SpinLockBackend>,
     ) {
         let inner = self.inner.access(guard);
-        out.strong_count = inner.strong.count as _;
-        out.weak_count = inner.weak.count as _;
+        out.strong_count = inner.strong.count as u32;
+        out.weak_count = inner.weak.count as u32;
     }
 
     pub(crate) fn populate_debug_info(
@@ -499,8 +500,8 @@ pub(crate) fn populate_debug_info(
         out: &mut BinderNodeDebugInfo,
         guard: &Guard<'_, ProcessInner, SpinLockBackend>,
     ) {
-        out.ptr = self.ptr as _;
-        out.cookie = self.cookie as _;
+        out.ptr = self.ptr as uapi::binder_uintptr_t;
+        out.cookie = self.cookie as uapi::binder_uintptr_t;
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
index 820cbd541435..935f04eb2981 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -32,7 +32,7 @@
         lock::{spinlock::SpinLockBackend, Guard},
         Arc, ArcBorrow, CondVar, CondVarTimeoutResult, Mutex, SpinLock, UniqueArc,
     },
-    task::Task,
+    task::{Pid, Task},
     uaccess::{UserSlice, UserSliceReader},
     uapi,
     workqueue::{self, Work},
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
+            if proc.task.pid() == info.pid as Pid {
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
index 47d5e4d88b07..e6cc4d403b99 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -11,6 +11,7 @@
     task::{Kuid, Pid},
     time::{Instant, Monotonic},
     types::ScopeGuard,
+    uapi,
 };
 
 use crate::{
@@ -402,16 +403,17 @@ fn do_work(
         let tr = tr_sec.tr_data();
         if let Some(target_node) = &self.target_node {
             let (ptr, cookie) = target_node.get_id();
-            tr.target.ptr = ptr as _;
-            tr.cookie = cookie as _;
+            tr.target.ptr = ptr as uapi::binder_uintptr_t;
+            tr.cookie = cookie as uapi::binder_uintptr_t;
         };
         tr.code = self.code;
         tr.flags = self.flags;
-        tr.data_size = self.data_size as _;
-        tr.data.ptr.buffer = self.data_address as _;
-        tr.offsets_size = self.offsets_size as _;
+        tr.data_size = self.data_size as uapi::binder_size_t;
+        tr.data.ptr.buffer = self.data_address as uapi::binder_uintptr_t;
+        tr.offsets_size = self.offsets_size as uapi::binder_size_t;
         if tr.offsets_size > 0 {
-            tr.data.ptr.offsets = (self.data_address + ptr_align(self.data_size).unwrap()) as _;
+            tr.data.ptr.offsets =
+                (self.data_address + ptr_align(self.data_size).unwrap()) as uapi::binder_uintptr_t;
         }
         tr.sender_euid = self.sender_euid.into_uid_in_current_ns();
         tr.sender_pid = 0;

-- 
2.54.0

