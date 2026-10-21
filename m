Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792553582;
	b=ri5Tfhrl1jKz2l5/vZTmR84KIRpUqK/HPPaWCuID+sOLstQF9G1whg9ORZ8fRiGs0FPg
	 /FIw3nrmGDWLkms4gXvAXR2MiVjyMd9NUPxYB/Ga7Ynd3LFo6OkuA4pLMTm5SWPASNTq6
	 nrS8dKxcEssfrNydow2Px7krTDCh10SkomS1xTEDZBqH1+jROm8AJI5c1vPC78ko1Kh13
	 MNGGg+GOvBdjx/IGdfHwKbAqHd1DYT9xiXXvbloac9p2f4a6+qJ69Kp++rQHXUNbq1aEe
	 dfd7747to/rTZvbaqTyNkgWopSMRF4K7u7qgilGVvBFfVonQsORgfbACbIunHYANuiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lPUBV2VSz3noIbPBUsFZgtwOePwLQM9bSPf6CBF5oU8=;
	b=usUhdVjXybbEAE91PAWEteO/Ztlo1RpBAMEUC/nV5im62EJVEi4hpn5ccHSk/1QpDTNX
	 VyFng3NqA0Pjwaa5MUQIzmkbsLRbEytT+yRPLIA5iRgXOYFt/e8Zewuc/7arABG+Iid05
	 iPTr5TmfX7EUN4hFLscvbv3YMoWBViAlOFByemaoeP+II/qHdCoIuAnovO00C5lr5lgNp
	 PGp3qYtNm/w+zkcrU70pehLDdztMHuM3hIxAkXA5q+R2Ozq3Qm5x5L/2HlBb2G4jp2P4c
	 V/1g/As5nNGFo7203rQi4rgj4BncLpV/oUYcK4/FOxElR5OXrEQU362Kzz08tXtrPAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cniKQEhP;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC3606A319
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 03:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FC3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cniKQEhP
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso435663eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 20:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792553581; x=1793158381; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPUBV2VSz3noIbPBUsFZgtwOePwLQM9bSPf6CBF5oU8=;
        b=cniKQEhPAgOZ+LGbodzTGi+z8je7H9B8ui28VVzkZAPvMC1jMe+ceSq/iDRWAtyAY7
         uz4pf84Ue7Lti3iz+eGKgsklmYBOe5i98LQDNQGDDm/dC3K+Ufc8O1UNTRn1dwZi/Z83
         vj+8Bz2fOij1M3Mc53fyrYVpIVsniNaM8DTO30XyzMQWrMOjpmINI2eFpsVn+n1O6qCL
         MxguqULvAAaRI3MTHzxVzPkoED2m62WiqG/Y7uA1b4ZimeIs26sIw8MupMo/2abzbCjn
         oYD9Jojv5FcRRtxgJRPzlAOXR4+r/XvYOAfh/B14PS8m1k4oCdZgaAPSh+9NW5tq0dKt
         rq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553581; x=1793158381;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPUBV2VSz3noIbPBUsFZgtwOePwLQM9bSPf6CBF5oU8=;
        b=KrBy0DRUl2IJw4OiH+VsBjfw7kYNRfDy19C1hIodfztCYQ3bWxTYULNkLSLP37x14J
         4ci5SSDI1CBHg2sutovCPt4DAzqRlOaQLf4HRmfYMDHuo8aQh2KJwXObwNBKT9F6aUzG
         x0swHha8Z1+CQTleIVp1p5XoIq6/HBjwmqW8TaaSVc7VaxQz8lgFupwS/TO0NdXINQOp
         OnRApJ31d6lmZjHBxzFP8vGYDWltXMxspm1M2OehVhqTJwuhW7xRh0sH9nZjS3r3Jn1B
         e3ssuFXv4fHNKU6uykSqrt9lgYJHeHhC+H1wZcZAixD4ryzX1M1weHpdDO7UOquVRGbB
         B8Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxAaOhpxAs0kAM64vxdR5Rm2l/lgmvaeFE/XxESPjd+gk1bUIbqYUFfvNBCOVVel4mDVFW2tGpxcq4u0EOdyg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+B+HnvZfZEDcFYHT/SHM2w9slJ66KafMNDZSKg+spVjn/n7Sf
	tSyuoYtfkLh7slYF1TMYWJYPd/zwdWNZ/aoAAw/o/z5P+ZaZIRim1oW/QyogMkyqSYeK+uI9RRm
	YXsDy9zD1CFiVXQ==
X-Received: from dybur1.prod.google.com ([2002:a05:7301:e001:b0:35b:a6b8:4806])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:faf:b0:35b:9bd:1435 with SMTP id 5a478bee46e88-3674a51682fmr1675621eec.2.1792553580125;
 Tue, 20 Oct 2026 20:33:00 -0700 (PDT)
Date: Wed, 21 Oct 2026 03:32:57 +0000
In-Reply-To: <2026101318-stingy-crescent-b47e@gregkh>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <2026101318-stingy-crescent-b47e@gregkh>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021033257.1359428-1-cmllamas@google.com>
Subject: [PATCH v2] rust_binder: add state_hashed and transactions_hashed files
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Carlos Llamas <cmllamas@google.com>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The 'state' and 'transactions' binderfs files print the userspace ptr
and cookie of each node as raw values, which leaks the userspace memory
layout and forces access to these files to be heavily restricted. Add
hashed versions of these files, as done for the C driver in commit
57483a362741 ("binder: Create safe versions of binder log files"), so
that access to them can be granted more broadly.

Pass a 'hashed' flag down the debug_print() chain and print the ptr and
cookie through a new MaybeHashed helper, which either prints the raw
value or hashes it like %p does. Everything else in the files remains
unchanged:

  $ grep "node 2:" /dev/binderfs/binder_logs/state*
  state:        node 2: u000000003cf2c740 c0000000000000000 hs true ...
  state_hashed: node 2: u00000000abab9b6d c0000000000000000 hs true ...

Assisted-by: LLM
Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
v2: open-code the %p behavior in MaybeHashed: No "0x" prefix.

v1:
https://lore.kernel.org/all/20261009170627.3075594-1-cmllamas@google.com/

 drivers/android/binder/freeze.rs              |  2 +-
 drivers/android/binder/node.rs                | 46 ++++++++++++----
 drivers/android/binder/node/wrapper.rs        | 14 +++--
 drivers/android/binder/process.rs             | 14 +++--
 drivers/android/binder/rust_binder_internal.h |  2 +
 drivers/android/binder/rust_binder_main.rs    | 52 +++++++++++++++----
 drivers/android/binder/rust_binderfs.c        | 18 +++++++
 drivers/android/binder/thread.rs              | 11 ++--
 drivers/android/binder/transaction.rs         |  2 +-
 9 files changed, 129 insertions(+), 32 deletions(-)

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
index b16ea0ff9ed9..7b03cccd607c 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -3,6 +3,7 @@
 // Copyright (C) 2025 Google LLC.
 
 use kernel::{
+    fmt,
     list::{AtomicTracker, List, ListArc, ListLinks, TryNewListArc},
     prelude::*,
     seq_file::SeqFile,
@@ -213,6 +214,28 @@ impl ListItem<0> for DTRWrap<Transaction> {
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
+            // Hash like `{:p}` does, but drop its `0x` prefix since `%p` doesn't print one.
+            let mut buf = [0u8; 32];
+            let mut w = kernel::str::Formatter::new(&mut buf);
+            let p = ptr::without_provenance::<()>(value as usize);
+            fmt::Write::write_fmt(&mut w, fmt!("{p:p}"))?;
+            let len = w.bytes_written();
+            let s = core::str::from_utf8(&buf[..len]).map_err(|_| fmt::Error)?;
+            f.write_str(s.strip_prefix("0x").unwrap_or(s))
+        } else {
+            write!(f, "{value:016x}")
+        }
+    }
+}
+
 impl Node {
     pub(crate) fn new(
         ptr: u64,
@@ -255,14 +278,19 @@ pub(crate) fn has_oneway_transaction(&self, owner_inner: &mut ProcessInner) -> b
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
@@ -755,14 +783,14 @@ fn should_sync_wakeup(&self) -> bool {
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
@@ -1150,7 +1178,7 @@ fn should_sync_wakeup(&self) -> bool {
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
index 75e1c1b3e454..219b48296781 100644
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
index 177e90a1e5a3..f4c6b1b5bc44 100644
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
@@ -1792,7 +1797,7 @@ fn should_sync_wakeup(&self) -> bool {
         false
     }
 
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str, _hashed: bool) -> Result {
         seq_print!(
             m,
             "{}transaction error: {}\n",
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 22558bdeef16..dbb32be25d7a 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -762,7 +762,7 @@ fn should_sync_wakeup(&self) -> bool {
         !self.flags.is_oneway()
     }
 
-    fn debug_print(&self, m: &SeqFile, _prefix: &str, tprefix: &str) -> Result {
+    fn debug_print(&self, m: &SeqFile, _prefix: &str, tprefix: &str, _hashed: bool) -> Result {
         self.debug_print_inner(m, tprefix);
         Ok(())
     }

base-commit: 985955d8e6b2b15cfd65b7ac6893e3a5a90c5870
-- 
2.56.0.212.g129ede20d9-goog

