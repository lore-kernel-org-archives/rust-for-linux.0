Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229535F165
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Oct 2026 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565617; cv=none; b=j+ebiPj+fARGGU9a7SViSQ1yuS4bPvmJAz0YLUnQKGyLzUIVyj6CzoAuwuHpaTy+RU5CEBhfl5MwseflG4I/8nHChzO+WGVBFf/QUCd9u3Qo9OEg7Shm0nheUSAMKNj8SlJ42MVBmpICQcTD9jdZJsuy4ARiS4iAmuSI9JBdDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565617; c=relaxed/simple;
	bh=iNLOmu2LmpKZwgdfiGlxqSDAP4fbyBaHVZy6CJ3/fSA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=k4zpqw7RhsIkBJSZsTm67h5CQP/0ii/toUHJdZ95oBGywPHTVZb1131W5+0d3nS7gZdOUoErGXGvoaiFqXnUt1RD0+fDfJ+7pkuo1vO8CqptfS9V1N9DPprGVlGGeCHzKeqbxTrbrhcAYVRb0ID04HyTX0OvTzSpSc45cogbBz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wnX85CP8; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wnX85CP8"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3515266f6eeso4543071eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Oct 2026 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791565614; x=1792170414; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5KasiH5+KHZYBmSfRWkuCJtGiHL9IQdSlo5h/9ywTs=;
        b=wnX85CP8H/pMPaOsNoXP0GTEvTN6hnMfpxYyYc1d9FtZZjT6qhnjJqUWSARyO835v3
         IqT8whmo98BcdlAQby2PPACiAPXTv5asdr/l7fhWiJazc1LJgSq2yCz4FYHZZTv37nr7
         /X5kU+m9GKAtbe1SYSj2KXl7l91zpneP9kQUZ4GFP3b8zP41KVR7OtL1bF+x5m+znyp/
         ZoRR+k/9VBrWtXhpPZIT9zSGx6+2VeivgdK0860+/nfeRZKh9msyKStSwDcs8Uq0RKi/
         SyjBvOtyA98AtTjhvNF5pI3shSiXaLqwuNtjqSGrgy+urBPo5kizfuKcvWViM5DfP6zF
         n9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565614; x=1792170414;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5KasiH5+KHZYBmSfRWkuCJtGiHL9IQdSlo5h/9ywTs=;
        b=Iyiu+Uvd24uAwZP/7Rdx2QqOYfISPWzrTZhdYySa+jp/k8J0ed2H6qoLl6C47Xhq9P
         NWsXmNsu8b4QTL4lx/IwMJI/7mf7bTb+9vf4OzUhpdG3Jats2OHU7hBhB0zVFhtB/Wex
         aUp333uRWOvSl5rrkFcFriUPdnL1yPqz1hg1VEnWlXy/bOYoPH8+W4M/rAZcsjq22Nb+
         QE20x3uXMhLOhrsWCPV9HxDuvegOfdM0ch0/9mlneMWH5t/6Gvu5lbmEpGj30trTolvX
         d58UMwXtmg246+MrC60a3wdyIHFTIz+bbK8UgXPXRH3iV++nIInC3l1MHmnMJmvqVrs0
         0Bqg==
X-Forwarded-Encrypted: i=1; AKwUvBzq8xSUV/DdSsCRAPoRG2a3RV3cvpr/VDRrFX7Kx1DnaQrBeHbjI7B5vN3LbNa7Z0c8tCeqW8w/mNYOcSchOg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJSuLx8Hj78VZxdsysfH9VySuZ30zOL82Uzs0oKc2pORsquP5xs
	UF95rL3H2pN7rCWl0EyxrTlpHBxnWPD8SI1De8r1gTcIlw6Fduo2rrdAVlTGuu9Y5MSSUXlpXww
	WmI8gik/0++gkUg==
X-Received: from dybmt5.prod.google.com ([2002:a05:7300:d585:b0:351:4806:4ae4])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4b0f:b0:350:4fc1:f22a with SMTP id 5a478bee46e88-3537e0ba5bfmr3349219eec.21.1791565613330;
 Fri, 09 Oct 2026 10:06:53 -0700 (PDT)
Date: Fri,  9 Oct 2026 17:06:27 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009170627.3075594-1-cmllamas@google.com>
Subject: [PATCH] rust_binder: add state_hashed and transactions_hashed files
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"

The 'state' and 'transactions' binderfs files print the userspace ptr
and cookie of each node as raw values, which leaks the userspace memory
layout and forces access to these files to be heavily restricted. Add
hashed versions of these files, as done for the C driver in commit
57483a362741 ("binder: Create safe versions of binder log files"), so
that access to them can be granted more broadly.

Pass a 'hashed' flag down the debug_print() chain and print the ptr and
cookie through a new MaybeHashed helper, which either prints the raw
value or hashes it like {:p} does. Everything else in the files remains
unchanged:

  $ grep "node 2:" /dev/binderfs/binder_logs/state*
  state:        node 2: u000000003cf2c740 c0000000000000000 hs true ...
  state_hashed: node 2: u00000000abab9b6d c0000000000000000 hs true ...

Assisted-by: LLM
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---

Notes:
  The output of the hashed values depends on this {:p} fix:
  https://lore.kernel.org/all/20261006183857.396710-1-cmllamas@google.com/  
  Without it, the patch still builds and works, but an odd "0x" prefix
  is added to the hashed values, e.g. "u0x00000000abab9b6d".

 drivers/android/binder/freeze.rs              |  2 +-
 drivers/android/binder/node.rs                | 39 ++++++++++----
 drivers/android/binder/node/wrapper.rs        | 14 +++--
 drivers/android/binder/process.rs             | 14 +++--
 drivers/android/binder/rust_binder_internal.h |  2 +
 drivers/android/binder/rust_binder_main.rs    | 52 +++++++++++++++----
 drivers/android/binder/rust_binderfs.c        | 18 +++++++
 drivers/android/binder/thread.rs              | 11 ++--
 drivers/android/binder/transaction.rs         |  2 +-
 9 files changed, 122 insertions(+), 32 deletions(-)

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 38faa8c63af9..1d225c5c6a0b 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -153,7 +153,7 @@ fn should_sync_wakeup(&self) -> bool {
     }
 
     #[inline(never)]
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str, _hashed: bool) -> Result {
         seq_print!(m, "{}has frozen binder\n", prefix);
         Ok(())
     }
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index b16ea0ff9ed9..1784d73dedc7 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -3,6 +3,7 @@
 // Copyright (C) 2025 Google LLC.
 
 use kernel::{
+    fmt,
     list::{AtomicTracker, List, ListArc, ListLinks, TryNewListArc},
     prelude::*,
     seq_file::SeqFile,
@@ -213,6 +214,21 @@ impl ListItem<0> for DTRWrap<Transaction> {
     }
 }
 
+/// Formats the userspace `ptr` or `cookie` of a [`Node`] in full, or hashed like `%p` if the
+/// flag is set, as done for the `*_hashed` binder_logs files.
+struct MaybeHashed(u64, bool);
+
+impl fmt::Display for MaybeHashed {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        let Self(value, hashed) = *self;
+        if hashed {
+            fmt::Pointer::fmt(&ptr::without_provenance::<()>(value as usize), f)
+        } else {
+            write!(f, "{value:016x}")
+        }
+    }
+}
+
 impl Node {
     pub(crate) fn new(
         ptr: u64,
@@ -255,14 +271,19 @@ pub(crate) fn has_oneway_transaction(&self, owner_inner: &mut ProcessInner) -> b
     }
 
     #[inline(never)]
-    pub(crate) fn full_debug_print(&self, m: &SeqFile, owner_inner: &mut ProcessInner) -> Result {
+    pub(crate) fn full_debug_print(
+        &self,
+        m: &SeqFile,
+        owner_inner: &mut ProcessInner,
+        hashed: bool,
+    ) -> Result {
         let inner = self.inner.access_mut(owner_inner);
         seq_print!(
             m,
-            "  node {}: u{:016x} c{:016x} hs {} hw {} cs {} cw {}",
+            "  node {}: u{} c{} hs {} hw {} cs {} cw {}",
             self.debug_id,
-            self.ptr,
-            self.cookie,
+            MaybeHashed(self.ptr, hashed),
+            MaybeHashed(self.cookie, hashed),
             inner.strong.has_count,
             inner.weak.has_count,
             inner.strong.count,
@@ -755,14 +776,14 @@ fn should_sync_wakeup(&self) -> bool {
     }
 
     #[inline(never)]
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str, hashed: bool) -> Result {
         seq_print!(
             m,
-            "{}node work {}: u{:016x} c{:016x}\n",
+            "{}node work {}: u{} c{}\n",
             prefix,
             self.debug_id,
-            self.ptr,
-            self.cookie,
+            MaybeHashed(self.ptr, hashed),
+            MaybeHashed(self.cookie, hashed),
         );
         Ok(())
     }
@@ -1150,7 +1171,7 @@ fn should_sync_wakeup(&self) -> bool {
     }
 
     #[inline(never)]
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str, _hashed: bool) -> Result {
         let inner = self.inner.lock();
 
         let dead_binder = inner.dead && !inner.notification_done;
diff --git a/drivers/android/binder/node/wrapper.rs b/drivers/android/binder/node/wrapper.rs
index edfbccf6e6da..c861ac0e7660 100644
--- a/drivers/android/binder/node/wrapper.rs
+++ b/drivers/android/binder/node/wrapper.rs
@@ -4,7 +4,11 @@
 
 use kernel::{list::ListArc, prelude::*, seq_file::SeqFile, seq_print, sync::UniqueArc};
 
-use crate::{node::Node, thread::Thread, BinderReturnWriter, DArc, DLArc, DTRWrap, DeliverToRead};
+use crate::{
+    node::{MaybeHashed, Node},
+    thread::Thread,
+    BinderReturnWriter, DArc, DLArc, DTRWrap, DeliverToRead,
+};
 
 use core::mem::MaybeUninit;
 
@@ -94,14 +98,14 @@ fn should_sync_wakeup(&self) -> bool {
     }
 
     #[inline(never)]
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str, hashed: bool) -> Result {
         seq_print!(
             m,
-            "{}node work {}: u{:016x} c{:016x}\n",
+            "{}node work {}: u{} c{}\n",
             prefix,
             self.node.debug_id,
-            self.node.ptr,
-            self.node.cookie,
+            MaybeHashed(self.node.ptr, hashed),
+            MaybeHashed(self.node.cookie, hashed),
         );
         Ok(())
     }
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 64960857bcdc..b19280d224e8 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -596,7 +596,13 @@ pub(crate) fn debug_print_stats(&self, m: &SeqFile, ctx: &Context) -> Result {
     }
 
     #[inline(never)]
-    pub(crate) fn debug_print(&self, m: &SeqFile, ctx: &Context, print_all: bool) -> Result {
+    pub(crate) fn debug_print(
+        &self,
+        m: &SeqFile,
+        ctx: &Context,
+        print_all: bool,
+        hashed: bool,
+    ) -> Result {
         seq_print!(m, "proc {}\n", self.pid_in_current_ns());
         seq_print!(m, "context {}\n", &*ctx.name);
 
@@ -628,13 +634,13 @@ pub(crate) fn debug_print(&self, m: &SeqFile, ctx: &Context, print_all: bool) ->
         }
 
         for thread in all_threads {
-            thread.debug_print(m, print_all)?;
+            thread.debug_print(m, print_all, hashed)?;
         }
 
         let mut inner = self.inner.lock();
         for node in all_nodes {
             if print_all || node.has_oneway_transaction(&mut inner) {
-                node.full_debug_print(m, &mut inner)?;
+                node.full_debug_print(m, &mut inner, hashed)?;
             }
         }
         drop(inner);
@@ -659,7 +665,7 @@ pub(crate) fn debug_print(&self, m: &SeqFile, ctx: &Context, print_all: bool) ->
 
         let inner = self.inner.lock();
         for work in &inner.work {
-            work.debug_print(m, "  ", "  pending transaction ")?;
+            work.debug_print(m, "  ", "  pending transaction ", hashed)?;
         }
         for _death in &inner.delivered_deaths {
             seq_print!(m, "  has delivered dead binder\n");
diff --git a/drivers/android/binder/rust_binder_internal.h b/drivers/android/binder/rust_binder_internal.h
index 50a50df14c77..3c4f9a8330bf 100644
--- a/drivers/android/binder/rust_binder_internal.h
+++ b/drivers/android/binder/rust_binder_internal.h
@@ -43,7 +43,9 @@ struct binder_device {
 
 int rust_binder_stats_show(struct seq_file *m, void *unused);
 int rust_binder_state_show(struct seq_file *m, void *unused);
+int rust_binder_state_hashed_show(struct seq_file *m, void *unused);
 int rust_binder_transactions_show(struct seq_file *m, void *unused);
+int rust_binder_transactions_hashed_show(struct seq_file *m, void *unused);
 int rust_binder_transaction_log_show(struct seq_file *m, void *unused);
 int rust_binder_proc_show(struct seq_file *m, void *pid);
 
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 56c786475237..9070c1c46a5f 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -163,7 +163,9 @@ fn do_work(
     /// Generally only set to true for non-oneway transactions.
     fn should_sync_wakeup(&self) -> bool;
 
-    fn debug_print(&self, m: &SeqFile, prefix: &str, transaction_prefix: &str) -> Result;
+    /// Prints this work item for the binder_logs files, hashing userspace pointers like `%p` when
+    /// `hashed` is set.
+    fn debug_print(&self, m: &SeqFile, prefix: &str, tprefix: &str, hashed: bool) -> Result;
 }
 
 // Wrapper around a `DeliverToRead` with linked list links.
@@ -279,7 +281,7 @@ fn should_sync_wakeup(&self) -> bool {
         false
     }
 
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str, _hashed: bool) -> Result {
         seq_print!(m, "{}", prefix);
         if self.skip.load(Relaxed) {
             seq_print!(m, "(skipped) ");
@@ -513,7 +515,23 @@ unsafe impl<T> Sync for AssertSync<T> {}
     // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
     // this method is called.
     let m = unsafe { SeqFile::from_raw(ptr) };
-    if let Err(err) = rust_binder_state_show_impl(m) {
+    if let Err(err) = rust_binder_state_show_impl(m, false) {
+        seq_print!(m, "failed to generate state: {:?}\n", err);
+    }
+    0
+}
+
+/// # Safety
+/// Only called by binderfs.
+#[no_mangle]
+unsafe extern "C" fn rust_binder_state_hashed_show(
+    ptr: *mut seq_file,
+    _: *mut kernel::ffi::c_void,
+) -> kernel::ffi::c_int {
+    // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
+    // this method is called.
+    let m = unsafe { SeqFile::from_raw(ptr) };
+    if let Err(err) = rust_binder_state_show_impl(m, true) {
         seq_print!(m, "failed to generate state: {:?}\n", err);
     }
     0
@@ -547,7 +565,23 @@ unsafe impl<T> Sync for AssertSync<T> {}
     // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
     // this method is called.
     let m = unsafe { SeqFile::from_raw(ptr) };
-    if let Err(err) = rust_binder_transactions_show_impl(m) {
+    if let Err(err) = rust_binder_transactions_show_impl(m, false) {
+        seq_print!(m, "failed to generate state: {:?}\n", err);
+    }
+    0
+}
+
+/// # Safety
+/// Only called by binderfs.
+#[no_mangle]
+unsafe extern "C" fn rust_binder_transactions_hashed_show(
+    ptr: *mut seq_file,
+    _: *mut kernel::ffi::c_void,
+) -> kernel::ffi::c_int {
+    // SAFETY: The caller ensures that the pointer is valid and exclusive for the duration in which
+    // this method is called.
+    let m = unsafe { SeqFile::from_raw(ptr) };
+    if let Err(err) = rust_binder_transactions_show_impl(m, true) {
         seq_print!(m, "failed to generate state: {:?}\n", err);
     }
     0
@@ -574,13 +608,13 @@ unsafe impl<T> Sync for AssertSync<T> {}
     0
 }
 
-fn rust_binder_transactions_show_impl(m: &SeqFile) -> Result {
+fn rust_binder_transactions_show_impl(m: &SeqFile, hashed: bool) -> Result {
     seq_print!(m, "binder transactions:\n");
     let contexts = context::get_all_contexts()?;
     for ctx in contexts {
         let procs = ctx.get_all_procs()?;
         for proc in procs {
-            proc.debug_print(m, &ctx, false)?;
+            proc.debug_print(m, &ctx, false, hashed)?;
             seq_print!(m, "\n");
         }
     }
@@ -601,13 +635,13 @@ fn rust_binder_stats_show_impl(m: &SeqFile) -> Result {
     Ok(())
 }
 
-fn rust_binder_state_show_impl(m: &SeqFile) -> Result {
+fn rust_binder_state_show_impl(m: &SeqFile, hashed: bool) -> Result {
     seq_print!(m, "binder state:\n");
     let contexts = context::get_all_contexts()?;
     for ctx in contexts {
         let procs = ctx.get_all_procs()?;
         for proc in procs {
-            proc.debug_print(m, &ctx, true)?;
+            proc.debug_print(m, &ctx, true, hashed)?;
             seq_print!(m, "\n");
         }
     }
@@ -620,7 +654,7 @@ fn rust_binder_proc_show_impl(m: &SeqFile, pid: Pid) -> Result {
     for ctx in contexts {
         let procs = ctx.get_procs_with_pid(pid)?;
         for proc in procs {
-            proc.debug_print(m, &ctx, true)?;
+            proc.debug_print(m, &ctx, true, false)?;
             seq_print!(m, "\n");
         }
     }
diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
index 25dc54ab45e9..4defc8fa51ee 100644
--- a/drivers/android/binder/rust_binderfs.c
+++ b/drivers/android/binder/rust_binderfs.c
@@ -45,7 +45,9 @@
 
 DEFINE_SHOW_ATTRIBUTE(rust_binder_stats);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_state);
+DEFINE_SHOW_ATTRIBUTE(rust_binder_state_hashed);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_transactions);
+DEFINE_SHOW_ATTRIBUTE(rust_binder_transactions_hashed);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_transaction_log);
 DEFINE_SHOW_ATTRIBUTE(rust_binder_proc);
 
@@ -605,6 +607,13 @@ static int init_binder_logs(struct super_block *sb)
 		goto out;
 	}
 
+	dentry = rust_binderfs_create_file(binder_logs_root_dir, "state_hashed",
+				      &rust_binder_state_hashed_fops, NULL);
+	if (IS_ERR(dentry)) {
+		ret = PTR_ERR(dentry);
+		goto out;
+	}
+
 	dentry = rust_binderfs_create_file(binder_logs_root_dir, "transactions",
 				      &rust_binder_transactions_fops, NULL);
 	if (IS_ERR(dentry)) {
@@ -612,6 +621,15 @@ static int init_binder_logs(struct super_block *sb)
 		goto out;
 	}
 
+	dentry = rust_binderfs_create_file(binder_logs_root_dir,
+				      "transactions_hashed",
+				      &rust_binder_transactions_hashed_fops,
+				      NULL);
+	if (IS_ERR(dentry)) {
+		ret = PTR_ERR(dentry);
+		goto out;
+	}
+
 	dentry = rust_binderfs_create_file(binder_logs_root_dir,
 				      "transaction_log",
 				      &rust_binder_transaction_log_fops,
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index e5ae3b0e56c5..5da1c4513fc7 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -482,7 +482,12 @@ pub(crate) fn new(id: i32, process: Arc<Process>) -> Result<Arc<Self>> {
     }
 
     #[inline(never)]
-    pub(crate) fn debug_print(self: &Arc<Self>, m: &SeqFile, print_all: bool) -> Result {
+    pub(crate) fn debug_print(
+        self: &Arc<Self>,
+        m: &SeqFile,
+        print_all: bool,
+        hashed: bool,
+    ) -> Result {
         let inner = self.inner.lock();
 
         if print_all || inner.current_transaction.is_some() || !inner.work_list.is_empty() {
@@ -510,7 +515,7 @@ pub(crate) fn debug_print(self: &Arc<Self>, m: &SeqFile, print_all: bool) -> Res
         }
 
         for work in &inner.work_list {
-            work.debug_print(m, "    ", "    pending transaction ")?;
+            work.debug_print(m, "    ", "    pending transaction ", hashed)?;
         }
         Ok(())
     }
@@ -1788,7 +1793,7 @@ fn should_sync_wakeup(&self) -> bool {
         false
     }
 
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str, _hashed: bool) -> Result {
         seq_print!(
             m,
             "{}transaction error: {}\n",
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index e627522141b8..e5ad49c9e180 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -772,7 +772,7 @@ fn should_sync_wakeup(&self) -> bool {
         !self.flags.is_oneway()
     }
 
-    fn debug_print(&self, m: &SeqFile, _prefix: &str, tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, _prefix: &str, tprefix: &str, _hashed: bool) -> Result {
         self.debug_print_inner(m, tprefix);
         Ok(())
     }

base-commit: c26cc979e28f5193310e4379e14aa6417375c565
prerequisite-patch-id: 4aaa9c816eb12666d45b37e79fd4eb54d68399f8
-- 
2.56.0.385.gd3acb90ef8-goog

