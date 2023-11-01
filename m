Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C48718E0C
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 18:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y2g9gJf5"
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3246410F
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 11:02:34 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a828bdcfbaso1465507b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Nov 2023 11:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698861753; x=1699466553; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=np4dzLTdX7nbpsOC9rtdyhQZ+PyAXv4r1ilV9zFPSOg=;
        b=Y2g9gJf55WF0NrRG8xnxNOnghNOAs8RCUv8NIeq+TZcDgfA70TDpICsyawLDW//7WD
         qmSIfAa7MOh9dGZ+oqcYwEkNNVq2ALpRpjCPEMXRvOjRMkrM/1ZxIT7Jq9d/nmnzhBm4
         czc2TrHvCv3h8sxzl6vW40NhJ7KUJ6aSPnIKL1RrwOo/6R3QMDZ3nIJvUIslJFhuPROG
         X4VQRJCYYT7CHRuQv1+L9b/ic/c+SqW+Jl9qLlNyRkhe2/qYF/7fzZhC54JKNg85pann
         PsuM9uZIeBSH9+UPv+OueMAfCOzIkhlnOp7QDVe//VBBXhJmAFKAD3zFs9S0XMUTG0PX
         3n+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698861753; x=1699466553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=np4dzLTdX7nbpsOC9rtdyhQZ+PyAXv4r1ilV9zFPSOg=;
        b=s1Oc5S4toqQ21R7716lqVSkPsiPikSvnHTqyV5lzMI72cy6U2XOurE1IEKYOdqIT+u
         nfXySe7uXWJS5R6+94D9n2qoKZ27Qvr5ddiDPpwFaYPgYrmqc+OpDTx/95u9g5LZaQV5
         ee8mP/K4iI6MkWcTLdoBmQlRWx5LbzRYAIC24pXd6JpBnlCG9bh3nBl6MvJA7mTnSGlZ
         KTw9+1WzEqeLOtveVokXcwWQhVwLBg3CRIzS0wMLHhCmVU5BI+NrEQ2z7M72nQ1GH1dl
         2SLxZQJzHWzvOLTHFlYQsE2NPdRZugpZ4AkQYZXGmiFt0PkGF+ja5Vt1yuRVWlsKaxzO
         wKCw==
X-Gm-Message-State: AOJu0YxtvMZJCFUz0aVoLc1MsGM2/4wZ0TcW78A8k7ZhuCZ4x/NgFZGp
	v8qg7SuIM6/JRv+USwctF+iX6VSg6EhH3UA=
X-Google-Smtp-Source: AGHT+IE13OgDXBiWGnr5BcaHNTYnB7YCOaDq680rZsxJj6h1lI2Pn70FXonQDkvmc8tjNFfgG2bCWdylFlXmC6I=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:e082:0:b0:d9a:ec95:9687 with SMTP id
 x124-20020a25e082000000b00d9aec959687mr330827ybg.11.1698861753440; Wed, 01
 Nov 2023 11:02:33 -0700 (PDT)
Date: Wed, 01 Nov 2023 18:01:37 +0000
In-Reply-To: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
X-Mailer: b4 0.13-dev-26615
Message-ID: <20231101-rust-binder-v1-7-08ba9197f637@google.com>
Subject: [PATCH RFC 07/20] rust_binder: add epoll support
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matt Gilbride <mattgilbride@google.com>, 
	Jeffrey Vander Stoep <jeffv@google.com>, Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Wedson Almeida Filho <wedsonaf@gmail.com>

This adds epoll integration, allowing you to get an epoll notification
when an incoming transaction arrives.

Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/process.rs | 21 +++++++++++++++++----
 drivers/android/thread.rs  | 39 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/drivers/android/process.rs b/drivers/android/process.rs
index 26dd9309fbee..2e8b0fc07756 100644
--- a/drivers/android/process.rs
+++ b/drivers/android/process.rs
@@ -122,8 +122,16 @@ pub(crate) fn push_work(
         } else if self.is_dead {
             Err((BinderError::new_dead(), work))
         } else {
+            let sync = work.should_sync_wakeup();
+
             // There are no ready threads. Push work to process queue.
             self.work.push_back(work);
+
+            // Wake up polling threads, if any.
+            for thread in self.threads.values() {
+                thread.notify_if_poll_ready(sync);
+            }
+
             Ok(())
         }
     }
@@ -897,11 +905,16 @@ pub(crate) fn mmap(
     }
 
     pub(crate) fn poll(
-        _this: ArcBorrow<'_, Process>,
-        _file: &File,
-        _table: &mut PollTable,
+        this: ArcBorrow<'_, Process>,
+        file: &File,
+        table: &mut PollTable,
     ) -> Result<u32> {
-        Err(EINVAL)
+        let thread = this.get_thread(kernel::current!().pid())?;
+        let (from_proc, mut mask) = thread.poll(file, table);
+        if mask == 0 && from_proc && !this.inner.lock().work.is_empty() {
+            mask |= bindings::POLLIN;
+        }
+        Ok(mask)
     }
 }
 
diff --git a/drivers/android/thread.rs b/drivers/android/thread.rs
index f34de7ad6e6f..159beebbd23e 100644
--- a/drivers/android/thread.rs
+++ b/drivers/android/thread.rs
@@ -7,6 +7,7 @@
 
 use kernel::{
     bindings,
+    file::{File, PollCondVar, PollTable},
     io_buffer::{IoBufferReader, IoBufferWriter},
     list::{
         AtomicListArcTracker, HasListLinks, List, ListArc, ListArcSafe, ListItem, ListLinks,
@@ -14,7 +15,7 @@
     },
     prelude::*,
     security,
-    sync::{Arc, CondVar, SpinLock},
+    sync::{Arc, SpinLock},
     types::Either,
     user_ptr::{UserSlicePtr, UserSlicePtrWriter},
 };
@@ -75,6 +76,7 @@ struct InnerThread {
 const LOOPER_INVALID: u32 = 0x08;
 const LOOPER_WAITING: u32 = 0x10;
 const LOOPER_WAITING_PROC: u32 = 0x20;
+const LOOPER_POLL: u32 = 0x40;
 
 impl InnerThread {
     fn new() -> Result<Self> {
@@ -159,6 +161,15 @@ fn is_looper(&self) -> bool {
     fn should_use_process_work_queue(&self) -> bool {
         !self.process_work_list && self.is_looper()
     }
+
+    fn poll(&mut self) -> u32 {
+        self.looper_flags |= LOOPER_POLL;
+        if self.process_work_list || self.looper_need_return {
+            bindings::POLLIN
+        } else {
+            0
+        }
+    }
 }
 
 /// This represents a thread that's used with binder.
@@ -169,7 +180,7 @@ pub(crate) struct Thread {
     #[pin]
     inner: SpinLock<InnerThread>,
     #[pin]
-    work_condvar: CondVar,
+    work_condvar: PollCondVar,
     /// Used to insert this thread into the process' `ready_threads` list.
     ///
     /// INVARIANT: May never be used for any other list than the `self.process.ready_threads`.
@@ -201,7 +212,7 @@ pub(crate) fn new(id: i32, process: Arc<Process>) -> Result<Arc<Self>> {
             id,
             process,
             inner <- kernel::new_spinlock!(inner, "Thread::inner"),
-            work_condvar <- kernel::new_condvar!("Thread::work_condvar"),
+            work_condvar <- kernel::new_poll_condvar!("Thread::work_condvar"),
             links <- ListLinks::new(),
             links_track <- AtomicListArcTracker::new(),
         }))
@@ -590,6 +601,12 @@ pub(crate) fn write_read(self: &Arc<Self>, data: UserSlicePtr, wait: bool) -> Re
         ret
     }
 
+    pub(crate) fn poll(&self, file: &File, table: &mut PollTable) -> (bool, u32) {
+        table.register_wait(file, &self.work_condvar);
+        let mut inner = self.inner.lock();
+        (inner.should_use_process_work_queue(), inner.poll())
+    }
+
     /// Make the call to `get_work` or `get_work_local` return immediately, if any.
     pub(crate) fn exit_looper(&self) {
         let mut inner = self.inner.lock();
@@ -604,6 +621,22 @@ pub(crate) fn exit_looper(&self) {
         }
     }
 
+    pub(crate) fn notify_if_poll_ready(&self, sync: bool) {
+        // Determine if we need to notify. This requires the lock.
+        let inner = self.inner.lock();
+        let notify = inner.looper_flags & LOOPER_POLL != 0 && inner.should_use_process_work_queue();
+        drop(inner);
+
+        // Now that the lock is no longer held, notify the waiters if we have to.
+        if notify {
+            if sync {
+                self.work_condvar.notify_sync();
+            } else {
+                self.work_condvar.notify_one();
+            }
+        }
+    }
+
     pub(crate) fn release(self: &Arc<Self>) {
         self.inner.lock().is_dead = true;
 

-- 
2.42.0.820.g83a721a137-goog

