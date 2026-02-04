Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FC24218AA
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220259; cv=none; b=JgbkyaaoEHVztfrIW8EmTfe64pa0tPf1RG5m/SC/5+wl4/kwSFacE5tm2nViZSleDrdskMsU9wTH2LDPYLLY7DdcPGL/uZKu7GHC411T3RDdU96KHWz/0CP3a0cZMo1w2+AXU54t9Y63wWV0FyFYs8hu6F/kZGSCB+Zupad8ZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220259; c=relaxed/simple;
	bh=loMiS3d+EznbDCgp38avNhwcRx8n7oZGHw2JqevnF5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+Jg93gxi/byuVJeU3i3TtxNDpGXTy0q/ft0aelyLGYEg41M2k/bOpkZupKFWYplyNCBhZ7MSKPmfY+3MTXOV2XRg0Kq9aYmltLpQWwTp86jRJRlSf1alOfoK6ftHHyBRtJRsF/uYvtXxP1SPvvX2LnuIExvbReGohF87CS6W4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ebYlBKql; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ebYlBKql"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso8080645e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 07:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770220258; x=1770825058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbqi2lUxamrBUmUgflwxoYXGoL4Y0kJLYTqAWHLN0gI=;
        b=ebYlBKql7uQNGIzObcyKaH73bMv4eCMFuWpeSO1EUkEaFvgOZqUy4Hd3D7vqZE5I9x
         QGQ5WxCv3e/g1fXbnTIl2VHLQeLsgR18Yu0h/2zWuTKbVvw0rVK3Q5VUNQPqUvAJgf9D
         7R9dyavvynGiPaC1wg6KLdJDFIUzdCO6ErYYR2jam27/fXhFCjOM+E7gayzyekAwhqLY
         2xJd7Yq6lQxuL2WEGL86CPvz2Wm/pdeLlhctOtEwypRiek5AWE7Z5ramEfH6/oLQjRmj
         scatfSiiyM0BL/WELYgk2uK3YdISIpxUThNseRWxl8lInjxDS0MuZYYKvQyFxCoJ6AWo
         yssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770220258; x=1770825058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbqi2lUxamrBUmUgflwxoYXGoL4Y0kJLYTqAWHLN0gI=;
        b=uWVR0AwGJtZrYxZgdf8c5sPlA4N1D42Ak200h8kufKGu0NhNtbqG3FyFWQnV599Ib8
         4EHcZjzXwBiiEffwpjH3JQT7yAsTd9f7sarZu5rp0yhBtqLBdDX29GDAxoo5Bw4tcBEZ
         3Bts0HhAW7VUWhxWztb6ykWwR8TfuzQQ+cQhmQCikAwxyRNCoQnQn2nGY0OneS6Ml7z1
         L3Ehz8WrhvuhJlv/VTrPQciKnfolLNA0of3YyV++PctXHjoRrK3SByLqt4vKyoKyoFOu
         aKERdYIJ5JhmZmbtTaw3L5/V8hw5gBoYhUshLnW0XREFQ/guiGZdcoJwqXMQU58OKiXZ
         6UJA==
X-Forwarded-Encrypted: i=1; AJvYcCUz6ZMYblvaMYz97eEwQCWoBX1u+gjttvxQHfmwB7CTSO3nDV3VrYD6Cdn6kKQ/XROWJi1F4TQ4sEv/JvE/bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykdsNTxCmkf3pE/1R51J86VBiaNMMQjuNP3c+iiaPMXOGKXttj
	EFyBpd0f+m2zlUzAS0C3bJduiw6NygExIFBKsbM20eBd+NEf9W8bg4p6vZcf6HG/tpw=
X-Gm-Gg: AZuq6aKA6ogZNE0XvzgdgTaliah/i+0qXRyVipGGfL6Nw6J51VOxeTJAQrFX9r4c4vL
	Ip0qt56Uf/kpKPAEw08chxCA05oA1Er02ejjSgGeQOzmKZJhNsDqdhqWKrrpxLpHYFsstS1WA9m
	FJvnbsZJVg11BcLfz4HKXl3r1w/5b/GDJRuXhyxw8DsLtZpWzTx57EJTK+580jCLWQd3MpyNhQi
	zb0FSiK+7ERGIn8Bn6cvdj1zM+PNhPOgOSI/rJFpluIcGWVIITowvPPfn6cHw46oOnB2bO03dPj
	u3M9w02Iq0SgbdtMdkpp10qTkWyEd0g4b1SpUbOmg5IM2Shk7or51CkrNuQusLsMb/Dhb3NYNqy
	opnx3QbCUhxDD3B7onRq4XkBUSYaw4tghxU/Z+16IpK1vqGoI4hshGhnvIbgC3gRbz2+d8FqH/a
	kCIrUfAg3tQoZ1
X-Received: by 2002:a05:600c:6994:b0:480:4d39:84b3 with SMTP id 5b1f17b1804b1-4830e9262c8mr50063645e9.6.1770220257746;
        Wed, 04 Feb 2026 07:50:57 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483107e62d6sm51879535e9.0.2026.02.04.07.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:50:57 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v5 2/2] rust: add system_percpu() and per-cpu enqueue functions
Date: Wed,  4 Feb 2026 16:50:37 +0100
Message-ID: <20260204155037.325482-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204155037.325482-1-marco.crivellari@suse.com>
References: <20260204155037.325482-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
respectively the futures replacement for system_wq and system_unbound_wq.

This change introduce system_percpu(), that use the new system_percpu_wq.

In order to enqueue on a specific CPU, two new functions have been added
to the Queue implementation:

  enqueue_cpu()		- that receive a u32 CPU id as 2nd argument
  enqueue_delayed_cpu()	- that receive a u32 CPU id as 3rd argument

system_wq (and so workqueue::system()) will be removed in a future
release cycle and should not be used.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 rust/kernel/sync/completion.rs |  2 +-
 rust/kernel/workqueue.rs       | 96 +++++++++++++++++++++++++++++++---
 2 files changed, 91 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index c50012a940a3..ee6aa8f18507 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -38,7 +38,7 @@
 ///             done <- Completion::new(),
 ///         }), GFP_KERNEL)?;
 ///
-///         let _ = workqueue::system().enqueue(this.clone());
+///         let _ = workqueue::system_percpu().enqueue(this.clone());
 ///
 ///         Ok(this)
 ///     }
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index adbecdb2b3a9..fd28fc74d5b7 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -67,7 +67,7 @@
 //! /// This method will enqueue the struct for execution on the system workqueue, where its value
 //! /// will be printed.
 //! fn print_later(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system().enqueue(val);
+//!     let _ = workqueue::system_percpu().enqueue(val);
 //! }
 //! # print_later(MyStruct::new(42).unwrap());
 //! ```
@@ -121,11 +121,11 @@
 //! }
 //!
 //! fn print_1_later(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 1>(val);
+//!     let _ = workqueue::system_percpu().enqueue::<Arc<MyStruct>, 1>(val);
 //! }
 //!
 //! fn print_2_later(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system().enqueue::<Arc<MyStruct>, 2>(val);
+//!     let _ = workqueue::system_percpu().enqueue::<Arc<MyStruct>, 2>(val);
 //! }
 //! # print_1_later(MyStruct::new(24, 25).unwrap());
 //! # print_2_later(MyStruct::new(41, 42).unwrap());
@@ -171,13 +171,13 @@
 //! /// This method will enqueue the struct for execution on the system workqueue, where its value
 //! /// will be printed 12 jiffies later.
 //! fn print_later(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system().enqueue_delayed(val, 12);
+//!     let _ = workqueue::system_percpu().enqueue_delayed(val, 12);
 //! }
 //!
 //! /// It is also possible to use the ordinary `enqueue` method together with `DelayedWork`. This
 //! /// is equivalent to calling `enqueue_delayed` with a delay of zero.
 //! fn print_now(val: Arc<MyStruct>) {
-//!     let _ = workqueue::system().enqueue(val);
+//!     let _ = workqueue::system_percpu().enqueue(val);
 //! }
 //! # print_later(MyStruct::new(42).unwrap());
 //! # print_now(MyStruct::new(42).unwrap());
@@ -292,6 +292,39 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
         }
     }
 
+    /// Enqueues a work item on a specific CPU.
+    ///
+    /// This may fail if the work item is already enqueued in a workqueue.
+    ///
+    /// The work item will be submitted on cpu_id.
+    pub fn enqueue_cpu<W, const ID: u64>(&self, w: W, cpu_id: u32) -> W::EnqueueOutput
+    where
+        W: RawWorkItem<ID> + Send + 'static,
+    {
+        let queue_ptr = self.0.get();
+
+        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
+        // `__enqueue` requirements are not relevant since `W` is `Send` and static.
+        //
+        // The call to `bindings::queue_work_on` will dereference the provided raw pointer, which
+        // is ok because `__enqueue` guarantees that the pointer is valid for the duration of this
+        // closure.
+        //
+        // Furthermore, if the C workqueue code accesses the pointer after this call to
+        // `__enqueue`, then the work item was successfully enqueued, and `bindings::queue_work_on`
+        // will have returned true. In this case, `__enqueue` promises that the raw pointer will
+        // stay valid until we call the function pointer in the `work_struct`, so the access is ok.
+        unsafe {
+            w.__enqueue(move |work_ptr| {
+                bindings::queue_work_on(
+                    cpu_id as ffi::c_int,
+                    queue_ptr,
+                    work_ptr,
+                )
+            })
+        }
+    }
+
     /// Enqueues a delayed work item.
     ///
     /// This may fail if the work item is already enqueued in a workqueue.
@@ -328,6 +361,42 @@ pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::Enqu
         }
     }
 
+    /// Enqueues a delayed work item on a specific CPU.
+    ///
+    /// This may fail if the work item is already enqueued in a workqueue.
+    ///
+    /// The work item will be submitted on cpu_id.
+    pub fn enqueue_delayed_cpu<W, const ID: u64>(&self, w: W, delay: Jiffies, cpu_id: u32) -> W::EnqueueOutput
+    where
+        W: RawDelayedWorkItem<ID> + Send + 'static,
+    {
+        let queue_ptr = self.0.get();
+
+        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
+        // `__enqueue` requirements are not relevant since `W` is `Send` and static.
+        //
+        // The call to `bindings::queue_delayed_work_on` will dereference the provided raw pointer,
+        // which is ok because `__enqueue` guarantees that the pointer is valid for the duration of
+        // this closure, and the safety requirements of `RawDelayedWorkItem` expands this
+        // requirement to apply to the entire `delayed_work`.
+        //
+        // Furthermore, if the C workqueue code accesses the pointer after this call to
+        // `__enqueue`, then the work item was successfully enqueued, and
+        // `bindings::queue_delayed_work_on` will have returned true. In this case, `__enqueue`
+        // promises that the raw pointer will stay valid until we call the function pointer in the
+        // `work_struct`, so the access is ok.
+        unsafe {
+            w.__enqueue(move |work_ptr| {
+                bindings::queue_delayed_work_on(
+                    cpu_id as ffi::c_int,
+                    queue_ptr,
+                    container_of!(work_ptr, bindings::delayed_work, work),
+                    delay,
+                )
+            })
+        }
+    }
+
     /// Tries to spawn the given function or closure as a work item.
     ///
     /// This method can fail because it allocates memory to store the work item.
@@ -934,17 +1003,32 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Pin<KBox<T>>
 {
 }
 
-/// Returns the system work queue (`system_wq`).
+/// Returns the per-cpu system work queue (`system_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are
 /// users which expect relatively short queue flush time.
 ///
 /// Callers shouldn't queue work items which can run for too long.
+///
+/// Note: `system_wq` will be removed in a future release cycle. Use `system_percpu_wq` instead.
 pub fn system() -> &'static Queue {
     // SAFETY: `system_wq` is a C global, always available.
     unsafe { Queue::from_raw(bindings::system_wq) }
 }
 
+/// Returns the per-cpu system work queue (`system_percpu_wq`).
+///
+/// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are
+/// users which expect relatively short queue flush time.
+///
+/// Callers shouldn't queue work items which can run for too long.
+///
+/// Note: `system_percpu_wq` will replace `system_wq` in a future release cycle.
+pub fn system_percpu() -> &'static Queue {
+    // SAFETY: `system_percpu_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_percpu_wq) }
+}
+
 /// Returns the system high-priority work queue (`system_highpri_wq`).
 ///
 /// It is similar to the one returned by [`system`] but for work items which require higher
-- 
2.52.0

