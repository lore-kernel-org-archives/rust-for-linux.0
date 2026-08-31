Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1595439A061
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 22:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788215353; cv=none; b=tWCn3GPQc5VPcDtpeKLt7blciW/XwkmEGz8lxyC6Mliy7Fqbsyqa6W+630nXutAnywIiZJdARgYhb9/9W8cGN5Yn9MaUBGP47s3DYpFIKaBw2PUy2dBIRv2Qi2VYEubdieeH+Rt54TN/xWLaabDjFFre6e5DBH/02GAOtjhOHCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788215353; c=relaxed/simple;
	bh=o9QPZGSAc+R9OGC6IuZRWp/Ch4425nWI9BIe6fWHVxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t0JZariZF0l5MZuqlz9e7jbeSCyVIEA/P1fDe0S7tNq43gYeoYdCiY4eYfEF25/IvlHTMvsnY6JNuDPSXvS2+mpoGKHE6VRCLuspCI5ZXv0gaagQwjHZBI+2iDJDMmmEU1O1gBV6C5ZSg4D6VfTgl9hRahVlhGrqwEogXEZJEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxlWyZOA; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxlWyZOA"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8615bb9d857so2411267b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 15:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788215349; x=1788820149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBH1mR8xlaHE++naXpqrsrQoRhbZMi3+JpUgsYGfEdc=;
        b=gxlWyZOAB1wRpD2qq9CokYHMtWrTdYwOmHdAA5kwrG9uUTgI8GSqN1diQm7A7FwGiB
         hHvBh1150srLJLEcZV9R/tel7mrdkoWHr5n73l2oAQQD53lYvmOKlsoeUBC4jxXUpN+S
         aDa/CAsC3mPxz0AZytvsSS/Of25u2oUPS4qw5WS4hDFlvJHfDYj7jnTLvSEtxJ5E5CNF
         I0B1HYnShiEmX1GZDCVXgLQYyRxa27meLLbQkNHykRwMfhCjvWcdx8iy+r+zeiFfAggY
         VPAcvEmoHBtMhd7hm85g1MBQhzab+oGHR9EgF+4TpdCtpWiTgR1FbEIBLeXFzWokLfsF
         9WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788215349; x=1788820149;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KBH1mR8xlaHE++naXpqrsrQoRhbZMi3+JpUgsYGfEdc=;
        b=PUb49NNZ75K/XhFnnMtzOXkhWKBH2GyWFDdgOuo26de+Ql3qXs/62k6/PXTP0qP0JR
         BLHq/7ne6ickYPmheQTEbpsFCOUKogLjcniG+aShPwYL2GpYXWkbbRx6u6DGU1JPpTaS
         PDTTpbp/O7QwfKUDcrrX/4plnDEPxIvZjDtc6tpwwQKIr1VUzm1UREpGWgBeJzqjkQNe
         mUOCszYCHF7KLxmH45lsGfeJ/+s9uv6wnk9jQwr/PzwNYTMxI+8D3QdXgRblrhdnkUHO
         MdtFGd4a/p7icSvYf6RFQU7CtN8NmbeisgRoDsnT6rJBlaKpB+iZzBW4QtiFygKW4VGY
         JlrA==
X-Forwarded-Encrypted: i=1; AKwUvBxJOdX0vSxgKSTL9FImUVAAVU25hS6TSsEU4pAdPMxZQEVyA1lMk78fOqVLYRc78k2zB7CAAh2ZELv30iajcA==@vger.kernel.org
X-Gm-Message-State: AFuF++ngnGssS8/VlndzLwUwyToyycPjDyBkFym9K+yFPmKrXe/Wb6Ai
	RSoRBexm8xkS5QLNohYlR0Y8jFGq8ImduU7rmob4m39q43NgvftL9ds=
X-Gm-Gg: AYBFou0l4CK1cq7sV9M4LydVXS4oVs5LscmuLMu7rwDZZBgbiofAcYhrzAzYwkYBcBh
	gR4m4lgKCj/hVIOE+sz3qWRL8o+fZvNNyczxKTDMXPVavV+HKiwemfRKAhjCTPwHkGRn+gpZaFh
	wUskA2+RrelL57tv2lKrxC7xLzPOZeTDyXro6xAgX9157kniiRvd6bjIlrbu6vdAUZfAxgbH7wc
	oYGBAvjvOkxxk6/2PkXMpKfEBOP9CMfWSGEhR0OI/9CtXEI8e379+spv9aIXybcRqxH5SXr8J18
	uoyeEu5Bv+QwoGQn6gbnalb0ufYI4fqsZ2bFwzGo0S61Endr4tw8UFETPZHxXGEnqC1nZij1VsS
	LB+rgMYi1BsUW7b0iLFZb9FDCPaCEi4GWuJdNUrOIfvLo47XO2TQ28W0Xw9k8PZvOUxCo6pCH/i
	GTNYoePB24GDKhLORcTaNsRxYZ3dk6Nz2v5sE+Tm/bEv2r0sxX79bEuSfuV5WfTxUKxApAzWF1B
	fI/5scBvPQ3U8WO7wB/EDuCRciWoAiPODuVRT8=
X-Received: by 2002:a05:690c:288:b0:867:fb81:7d23 with SMTP id 00721157ae682-867fb818e6cmr24032427b3.3.1788215348842;
        Mon, 31 Aug 2026 15:29:08 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm62255577b3.0.2026.08.31.15.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:29:08 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] rust_binder: simplify Result<()> uses
Date: Mon, 31 Aug 2026 19:27:10 -0300
Message-ID: <20260831222857.1402608-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`kernel::error::Result<T = (), E = Error>` is a type alias for
`core::result::Result<T, E>` with `()` as the default type argument
for T. Explicitly specifying `Result<()>` is redundant.

This change makes all usages of `Result` consistent across the driver.

Link: https://github.com/Rust-for-Linux/linux/issues/1128
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 drivers/android/binder/allocation.rs        |  2 +-
 drivers/android/binder/freeze.rs            | 11 ++++-------
 drivers/android/binder/node.rs              | 10 +++-------
 drivers/android/binder/node/wrapper.rs      |  2 +-
 drivers/android/binder/page_range.rs        |  6 +++---
 drivers/android/binder/process.rs           |  4 ++--
 drivers/android/binder/range_alloc/array.rs |  2 +-
 drivers/android/binder/range_alloc/mod.rs   |  2 +-
 drivers/android/binder/range_alloc/tree.rs  |  2 +-
 drivers/android/binder/rust_binder_main.rs  | 12 ++++++------
 drivers/android/binder/thread.rs            |  8 ++++----
 drivers/android/binder/transaction.rs       |  2 +-
 12 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 165cb797eb1e..4896ba4b444c 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -503,7 +503,7 @@ pub(crate) fn read_from(reader: &mut UserSliceReader) -> Result<BinderObject> {
     /// The closure should write the bytes for the object into the provided slice.
     pub(crate) fn read_from_inner<R>(reader: R) -> Result<BinderObject>
     where
-        R: FnOnce(&mut [u8; size_of::<BinderObject>()]) -> Result<()>,
+        R: FnOnce(&mut [u8; size_of::<BinderObject>()]) -> Result,
     {
         let mut obj = MaybeUninit::<BinderObject>::zeroed();

diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
index 66912b4cb527..ea2450f3f16f 100644
--- a/drivers/android/binder/freeze.rs
+++ b/drivers/android/binder/freeze.rs
@@ -155,7 +155,7 @@ fn should_sync_wakeup(&self) -> bool {
     }

     #[inline(never)]
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result<()> {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
         seq_print!(m, "{}has frozen binder\n", prefix);
         Ok(())
     }
@@ -177,10 +177,7 @@ pub(crate) fn on_process_cleanup(&self, proc: &Process) -> KVVec<Arc<Process>> {
 }

 impl Process {
-    pub(crate) fn request_freeze_notif(
-        self: &Arc<Self>,
-        reader: &mut UserSliceReader,
-    ) -> Result<()> {
+    pub(crate) fn request_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader) -> Result {
         let hc = reader.read::<BinderHandleCookie>()?;
         let handle = hc.handle;
         let cookie = FreezeCookie(hc.cookie);
@@ -272,7 +269,7 @@ pub(crate) fn request_freeze_notif(
         Ok(())
     }

-    pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader) -> Result<()> {
+    pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader) -> Result {
         let cookie = FreezeCookie(reader.read()?);
         let alloc = FreezeMessage::new(GFP_KERNEL)?;
         let mut node_refs_guard = self.node_refs.lock();
@@ -313,7 +310,7 @@ pub(crate) fn freeze_notif_done(self: &Arc<Self>, reader: &mut UserSliceReader)
         Ok(())
     }

-    pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader) -> Result<()> {
+    pub(crate) fn clear_freeze_notif(self: &Arc<Self>, reader: &mut UserSliceReader) -> Result {
         let hc = reader.read::<BinderHandleCookie>()?;
         let handle = hc.handle;
         let cookie = FreezeCookie(hc.cookie);
diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index 0a82af14cda3..b71b423c56bd 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -255,11 +255,7 @@ pub(crate) fn has_oneway_transaction(&self, owner_inner: &mut ProcessInner) -> b
     }

     #[inline(never)]
-    pub(crate) fn full_debug_print(
-        &self,
-        m: &SeqFile,
-        owner_inner: &mut ProcessInner,
-    ) -> Result<()> {
+    pub(crate) fn full_debug_print(&self, m: &SeqFile, owner_inner: &mut ProcessInner) -> Result {
         let inner = self.inner.access_mut(owner_inner);
         seq_print!(
             m,
@@ -745,7 +741,7 @@ fn should_sync_wakeup(&self) -> bool {
     }

     #[inline(never)]
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result<()> {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
         seq_print!(
             m,
             "{}node work {}: u{:016x} c{:016x}\n",
@@ -1140,7 +1136,7 @@ fn should_sync_wakeup(&self) -> bool {
     }

     #[inline(never)]
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result<()> {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
         let inner = self.inner.lock();

         let dead_binder = inner.dead && !inner.notification_done;
diff --git a/drivers/android/binder/node/wrapper.rs b/drivers/android/binder/node/wrapper.rs
index 6e4ca01c941a..828a331f5d99 100644
--- a/drivers/android/binder/node/wrapper.rs
+++ b/drivers/android/binder/node/wrapper.rs
@@ -64,7 +64,7 @@ fn should_sync_wakeup(&self) -> bool {
     }

     #[inline(never)]
-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result<()> {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
         seq_print!(
             m,
             "{}node work {}: u{:016x} c{:016x}\n",
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 52ffbf3504e7..047cdf1722cf 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -66,7 +66,7 @@ impl Shrinker {
     }

     /// Register this shrinker with the kernel.
-    pub(crate) fn register(&'static self, name: &CStr) -> Result<()> {
+    pub(crate) fn register(&'static self, name: &CStr) -> Result {
         // SAFETY: These fields are not yet used, so it's okay to zero them.
         unsafe {
             self.inner.get().write(ptr::null_mut());
@@ -352,7 +352,7 @@ pub(crate) fn register_with_vma(&self, vma: &virt::VmaNew) -> Result<usize> {
     /// Make sure that the given pages are allocated and mapped.
     ///
     /// Must not be called from an atomic context.
-    pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
+    pub(crate) fn use_range(&self, start: usize, end: usize) -> Result {
         if start >= end {
             return Ok(());
         }
@@ -398,7 +398,7 @@ pub(crate) fn use_range(&self, start: usize, end: usize) -> Result<()> {
     ///
     /// Assumes that `i` is in bounds.
     #[cold]
-    unsafe fn use_page_slow(&self, i: usize) -> Result<()> {
+    unsafe fn use_page_slow(&self, i: usize) -> Result {
         let new_page = Page::alloc_page(GFP_KERNEL | __GFP_HIGHMEM | __GFP_ZERO)?;

         let mm_mutex = self.mm_lock.lock();
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd93b3..124ac221d27a 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -548,7 +548,7 @@ pub(crate) fn pid_in_current_ns(&self) -> kernel::task::Pid {
     }

     #[inline(never)]
-    pub(crate) fn debug_print_stats(&self, m: &SeqFile, ctx: &Context) -> Result<()> {
+    pub(crate) fn debug_print_stats(&self, m: &SeqFile, ctx: &Context) -> Result {
         seq_print!(m, "proc {}\n", self.pid_in_current_ns());
         seq_print!(m, "context {}\n", &*ctx.name);

@@ -596,7 +596,7 @@ pub(crate) fn debug_print_stats(&self, m: &SeqFile, ctx: &Context) -> Result<()>
     }

     #[inline(never)]
-    pub(crate) fn debug_print(&self, m: &SeqFile, ctx: &Context, print_all: bool) -> Result<()> {
+    pub(crate) fn debug_print(&self, m: &SeqFile, ctx: &Context, print_all: bool) -> Result {
         seq_print!(m, "proc {}\n", self.pid_in_current_ns());
         seq_print!(m, "context {}\n", &*ctx.name);

diff --git a/drivers/android/binder/range_alloc/array.rs b/drivers/android/binder/range_alloc/array.rs
index 081d19b09d4b..71bf49f9db0d 100644
--- a/drivers/android/binder/range_alloc/array.rs
+++ b/drivers/android/binder/range_alloc/array.rs
@@ -61,7 +61,7 @@ pub(crate) fn is_full(&self) -> bool {
         self.ranges.len() == self.ranges.capacity()
     }

-    pub(crate) fn debug_print(&self, m: &SeqFile) -> Result<()> {
+    pub(crate) fn debug_print(&self, m: &SeqFile) -> Result {
         for range in &self.ranges {
             seq_print!(
                 m,
diff --git a/drivers/android/binder/range_alloc/mod.rs b/drivers/android/binder/range_alloc/mod.rs
index 1f4734468ff1..bb6e0ec9650e 100644
--- a/drivers/android/binder/range_alloc/mod.rs
+++ b/drivers/android/binder/range_alloc/mod.rs
@@ -141,7 +141,7 @@ pub(crate) fn count_buffers(&self) -> usize {
         }
     }

-    pub(crate) fn debug_print(&self, m: &SeqFile) -> Result<()> {
+    pub(crate) fn debug_print(&self, m: &SeqFile) -> Result {
         match &self.inner {
             Impl::Empty(_size) => Ok(()),
             Impl::Array(array) => array.debug_print(m),
diff --git a/drivers/android/binder/range_alloc/tree.rs b/drivers/android/binder/range_alloc/tree.rs
index 48796fcdb362..058ff7498fa5 100644
--- a/drivers/android/binder/range_alloc/tree.rs
+++ b/drivers/android/binder/range_alloc/tree.rs
@@ -111,7 +111,7 @@ pub(crate) fn count_buffers(&self) -> usize {
             .count()
     }

-    pub(crate) fn debug_print(&self, m: &SeqFile) -> Result<()> {
+    pub(crate) fn debug_print(&self, m: &SeqFile) -> Result {
         for desc in self.tree.values() {
             let state = match &desc.state {
                 Some(state) => &state.0,
diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index 955c4c348f73..aa109663caae 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -158,7 +158,7 @@ fn do_work(
     /// Generally only set to true for non-oneway transactions.
     fn should_sync_wakeup(&self) -> bool;

-    fn debug_print(&self, m: &SeqFile, prefix: &str, transaction_prefix: &str) -> Result<()>;
+    fn debug_print(&self, m: &SeqFile, prefix: &str, transaction_prefix: &str) -> Result;
 }

 // Wrapper around a `DeliverToRead` with linked list links.
@@ -274,7 +274,7 @@ fn should_sync_wakeup(&self) -> bool {
         false
     }

-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result<()> {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
         seq_print!(m, "{}", prefix);
         if self.skip.load(Relaxed) {
             seq_print!(m, "(skipped) ");
@@ -545,7 +545,7 @@ unsafe impl<T> Sync for AssertSync<T> {}
     0
 }

-fn rust_binder_transactions_show_impl(m: &SeqFile) -> Result<()> {
+fn rust_binder_transactions_show_impl(m: &SeqFile) -> Result {
     seq_print!(m, "binder transactions:\n");
     let contexts = context::get_all_contexts()?;
     for ctx in contexts {
@@ -558,7 +558,7 @@ fn rust_binder_transactions_show_impl(m: &SeqFile) -> Result<()> {
     Ok(())
 }

-fn rust_binder_stats_show_impl(m: &SeqFile) -> Result<()> {
+fn rust_binder_stats_show_impl(m: &SeqFile) -> Result {
     seq_print!(m, "binder stats:\n");
     stats::GLOBAL_STATS.debug_print("", m);
     let contexts = context::get_all_contexts()?;
@@ -572,7 +572,7 @@ fn rust_binder_stats_show_impl(m: &SeqFile) -> Result<()> {
     Ok(())
 }

-fn rust_binder_state_show_impl(m: &SeqFile) -> Result<()> {
+fn rust_binder_state_show_impl(m: &SeqFile) -> Result {
     seq_print!(m, "binder state:\n");
     let contexts = context::get_all_contexts()?;
     for ctx in contexts {
@@ -585,7 +585,7 @@ fn rust_binder_state_show_impl(m: &SeqFile) -> Result<()> {
     Ok(())
 }

-fn rust_binder_proc_show_impl(m: &SeqFile, pid: Pid) -> Result<()> {
+fn rust_binder_proc_show_impl(m: &SeqFile, pid: Pid) -> Result {
     seq_print!(m, "binder proc state:\n");
     let contexts = context::get_all_contexts()?;
     for ctx in contexts {
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 18a14aa8a835..3e898be5ac31 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -481,7 +481,7 @@ pub(crate) fn new(id: i32, process: Arc<Process>) -> Result<Arc<Self>> {
     }

     #[inline(never)]
-    pub(crate) fn debug_print(self: &Arc<Self>, m: &SeqFile, print_all: bool) -> Result<()> {
+    pub(crate) fn debug_print(self: &Arc<Self>, m: &SeqFile, print_all: bool) -> Result {
         let inner = self.inner.lock();

         if print_all || inner.current_transaction.is_some() || !inner.work_list.is_empty() {
@@ -1250,7 +1250,7 @@ fn read_transaction_info(
         cmd: u32,
         reader: &mut UserSliceReader,
         info: &mut TransactionInfo,
-    ) -> Result<()> {
+    ) -> Result {
         let td = match cmd {
             BC_TRANSACTION | BC_REPLY => {
                 reader.read::<BinderTransactionData>()?.with_buffers_size(0)
@@ -1281,7 +1281,7 @@ fn read_transaction_info(
     }

     #[inline(never)]
-    fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Result<()> {
+    fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Result {
         let mut info = TransactionInfo::zeroed();
         self.read_transaction_info(cmd, reader, &mut info)?;

@@ -1738,7 +1738,7 @@ fn should_sync_wakeup(&self) -> bool {
         false
     }

-    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result<()> {
+    fn debug_print(&self, m: &SeqFile, prefix: &str, _tprefix: &str) -> Result {
         seq_print!(
             m,
             "{}transaction error: {}\n",
diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index 245f1556b5db..f6a0707bb4b3 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -576,7 +576,7 @@ fn should_sync_wakeup(&self) -> bool {
         !self.flags.is_oneway()
     }

-    fn debug_print(&self, m: &SeqFile, _prefix: &str, tprefix: &str) -> Result<()> {
+    fn debug_print(&self, m: &SeqFile, _prefix: &str, tprefix: &str) -> Result {
         self.debug_print_inner(m, tprefix);
         Ok(())
     }
--
2.47.3

