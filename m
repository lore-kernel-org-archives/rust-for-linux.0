Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FF33B8D4C
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132515; cv=none; b=kkTo3xvv0g0d94zXDG9jBDfOdIUk8IbZuAgeJpx4HL4Yvh5S+E1a81SA4vha2U+PmNVmvNncoinRsrlVWI4r5qzGpKlR8bmKTIWdDllsOwtU1wPU6SDYiTAAma9S4jomxK7E2IaQqHmSPDQ0ss0bft0RBhuiOEa7IfTn9SckR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132515; c=relaxed/simple;
	bh=5P1OoHaY7/L+xB5tVS0KbkGK2mda/BzFZpi996e8uBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLKBaJhB5E8BkrWWMA1lezL1y8IQPGdDLZGJlVcu4lgh9SpTByBpDsPURLkYjDyetcU9ob4Jm3DW7cEW8/E3PMaUgGRJGLUga9PypZJDVDuvKCb0t2TBM2QWHuYaFSrbGVVzoNy8s6X/Tx1UY/wM+LMpcvWc08KE6f6HtdrwfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QGqUT2Jj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QGqUT2Jj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so77246365e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770132512; x=1770737312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evrCydrxXcTH9gOn4p6qQgFP3yUlzzT31yKuNCq7gFI=;
        b=QGqUT2JjSRP2MnPdieFrHUlek9tf0zS1nu9yej/oxpVIp3WjoFbnlzy4MkxJc5IMFo
         p6dJ5GoQ9oST3zu0qMz1JwDQF3kNuqmdkod3UGEVxASbiWCM0H1bU4RMuesQDRd4ADSD
         VYJqAzrC4mKLCXZXMEXHQ/DXudw2zxyjU9MDQNpnli55Ls68lLlwarRD9xYwgI6q++FX
         WkdNdAxLMGVCO3Qqao/OD5H4NyK6TUK9Kn4KVzoM960RhSH575VWpJh3i7fYNeUVYuk4
         jI2jCGY/2zGwy92LoV9LLUCHmiswjz9Z1mH9Ejly4xco/94XVnM7yhqYAHUZ9dNfFh/L
         vMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770132512; x=1770737312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=evrCydrxXcTH9gOn4p6qQgFP3yUlzzT31yKuNCq7gFI=;
        b=M1KRmsbXzB6iTiVhu4fxQ+lZ+YB1/d7QnjnLRKVkD7u9xZeGAB7GaB8Z9g9c0/JLLD
         lORS+5QQ98HbQ8AMX8P+14+jtMWLGzAwrizxyrCh7txO10AdB8NLSPNeR9qK3bO+II+D
         BmnfeJTFcAL8QI+zj9RIqZqr16lRxEp9WA1PpEBj7gDz7X23dek7SDVwlDfYKhssylst
         /btyz+3pNcPGsIbEI8JFStNLKzINmogjMNqhXGKxpWksELjT5wMxv7/hil8UJFlawoMw
         ZMp1PEpogeaa2NnTnACgCK9LzsmNYh/msY0g9JNLFMDrjC59Gg2bYVgAfrSq4wtho4va
         H1tw==
X-Forwarded-Encrypted: i=1; AJvYcCUfOa4yB9R+N73UVnpVC46gCeQjXPCc0/E7hvEJb02h+9pm5SH7bRyR/RzLyDWdt+ybXFF+lhZn4d45mmk/gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMUeMdNPkZf2rRmenGmbgEweMMLlZrFeHg+kzY0Kp9/nOIteEy
	gWDei56VgIajW8QMT5uVnWyNZGaYfZMRI75+OrMOP9c/Wq/7g/CpSPLprAii5gI4Ucw=
X-Gm-Gg: AZuq6aKMdJ3T6FflRstG2VS+0Saj9BzyVmNwYDFhqCjRHFaxef2uLZqiQnsQeEy9pQm
	Ah68IylDGIvpzWAwcEwYdAXzByT7zLM8FZVXwTBMgnymJi4P0R5Yt69j1jlpWqBVhgivUx7lvIg
	nIhmQQbA6Wx9UgACiGO7WvwagwuXPSVJkK+M2GzVpbUaBc1Qi1iLsTM50ggzOr5VYtSU6EN4hhO
	HCpf3WbCIdiGp/iq6JvSOH1cb4qSGzzgPHBo3QnyYxY2BeB/W0EWl4R6lk169CoJhLV2ErJY/+H
	oi3gbViiwnIzRcF8sonxh5VXaFrl5mb5JPar/Wn7+i/Pr7G3mKVnZ3E2OkAHGLsXsXLs02MTKln
	1e7oSCum2404JYyITaVihsKdTE2L1QamHJ7NYhKfcv3DjoThdYhkdzhaStwuqbFiQJiNcna27an
	VhkYTuBOmsRIc30rWpBKByp6BB5A==
X-Received: by 2002:a05:600c:1e1d:b0:47d:73a4:45a7 with SMTP id 5b1f17b1804b1-4830e966bb1mr163915e9.24.1770132512356;
        Tue, 03 Feb 2026 07:28:32 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483050dd79fsm71316005e9.0.2026.02.03.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:28:32 -0800 (PST)
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
Subject: [PATCH v4 2/2] rust: add system_percpu() and per-cpu enqueue functions
Date: Tue,  3 Feb 2026 16:28:17 +0100
Message-ID: <20260203152818.317806-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203152818.317806-1-marco.crivellari@suse.com>
References: <20260203152818.317806-1-marco.crivellari@suse.com>
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

    enqueue_cpu()         - that receive a u32 CPU id as 2nd argument
    enqueue_delayed_cpu() - that receive a u32 CPU id as 3rd argument

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
index 300cc2bfe012..81a68d5062b7 100644
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
+/// Note: `system_wq` will be removed in a future release cycle. Use [`system_percpu_wq`] instead.
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

