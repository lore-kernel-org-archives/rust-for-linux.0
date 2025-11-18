Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F007B355050;
	Tue, 18 Nov 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472458; cv=none; b=f/MmK+0ob/Bh5bNqsQdHupxLm9RObl4cGGir2sNKU6JfmdlEb5hVSYm7UDrhOhJp/pSZKPL3xXjyxVyZO8A3k/5Kjp5XJZzzs+0A2+73jBVTzMsYj+qY6pv2vCzxuEYFuSMyi9TXhWElk5NQ5kWejB7Q07orUBoKgMRRK1mMFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472458; c=relaxed/simple;
	bh=OVR6mVP21sm9fzL9r2vnhG2F6BDvIoURwGoNLywV05I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3MEkPNJJkry28gyDZLiafcHe1ppYzQ3aWP12PfiJ2SqZG1Wmr3QPmzhrwdqDEv1dD0ueevuLMOuQV1+HxefASE9WRbJsV82zCt0yFOrHZrIRpNsXs+50sx9V439Dm1FGcVRscDdv+wrdSsiCtqjmUwp1jpSpTkQwX1d6HV7tG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opNF97Ly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opNF97Ly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A12C19422;
	Tue, 18 Nov 2025 13:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763472457;
	bh=OVR6mVP21sm9fzL9r2vnhG2F6BDvIoURwGoNLywV05I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=opNF97LycH4qRrTqaRnRp0Vk/GF1X2inv1r8Pcv/2Fu9k8ZdInvbYxy5W954/WOr+
	 tf+2tni3OjZM5horerJPtfQ91PYONH60LPb3tK8goNFJUaeDc/OSntvPB6ZgoOdmuG
	 2FtJPRtPE9okl3GYhE6Uad2HUqUzf4q5528gLv/17xaKA3jmhAiMlNbgvzgvU1XMZb
	 tA2HHFlWzozAr/w9bqyblrBB0DYX8D2HnJiCJOllaQ5P9aVfVbwjPqP7m4narcSQJ8
	 qLPHc57N6Ot1hXbM4eCvbXLiRKShUQ/GDK8cJOoToSInenyCIdjajiVyrqQqo0e0CQ
	 OGnvedCON4Rpw==
From: Philipp Stanner <phasta@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Dave Airlie <airlied@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Peter Colberg <pcolberg@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [RFC WIP 3/3] rust/drm: Add initial jobqueue sceleton
Date: Tue, 18 Nov 2025 14:25:19 +0100
Message-ID: <20251118132520.266179-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251118132520.266179-2-phasta@kernel.org>
References: <20251118132520.266179-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRM jobqueue is intended to become a load balancer, dependency manager
and timeout handler for GPU drivers with firmware scheduling.

The presented code shall give the reader an overview over the intended
architecture, notably over the API functions, DmaFence callbacks, job
lists and job control flow.

This code compiles (with warnings) but is incomplete. Notable missing
features are:
- Actually registering the fence callbacks
- workqueue
- timeout handling
- actually calling the driver callback for job submissions

Moreover, the implementation of the waiting_jobs and running_jobs lists
is currently not operational because I've got trouble with getting it to
work with generic Job data. Verifyable by commenting in the push_job()
call in the submit_job() function.

Some WIP code is commented out, but is probably worth reading
nevertheless since it completes the picture.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/drm/jq.rs  | 398 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs |   2 +
 2 files changed, 400 insertions(+)
 create mode 100644 rust/kernel/drm/jq.rs

diff --git a/rust/kernel/drm/jq.rs b/rust/kernel/drm/jq.rs
new file mode 100644
index 000000000000..b3f7ab4655cf
--- /dev/null
+++ b/rust/kernel/drm/jq.rs
@@ -0,0 +1,398 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2025 Red Hat Inc.:
+//   - Philipp Stanner <pstanner@redhat.com>
+//   - Danilo Krummrich <dakr@redhat.com>
+//   - David Airlie <airlied@redhat.com>
+
+//! DrmJobqueue. A load balancer, dependency manager and timeout handler for
+//! GPU job submissions.
+
+use crate::{
+    prelude::*,
+    types::ARef,
+};
+use kernel::sync::{Arc, SpinLock, new_spinlock, DmaFence, DmaFenceCtx, DmaFenceCb, DmaFenceCbFunc};
+use kernel::list::*;
+use kernel::revocable::Revocable;
+
+
+#[pin_data]
+pub struct Job<T: ?Sized> {
+    credits: u32,
+//    dependencies: List, // TODO implement dependency list
+    #[pin]
+    data: T,
+}
+
+impl<T> Job<T> {
+    /// Create a new job that can be submitted to [`Jobqueue`].
+    ///
+    /// Jobs contain driver data that will later be made available to the driver's
+    /// run_job() callback in which the job gets pushed to the GPU.
+    pub fn new(credits: u32, data: impl PinInit<T>) -> Result<Pin<KBox<Self>>> {
+        let job = pin_init!(Self {
+            credits,
+            data <- data,
+        });
+
+        KBox::pin_init(job, GFP_KERNEL)
+    }
+
+    /// Add a callback to the job. When the job gets submitted, all added callbacks will be
+    /// registered on the [`DmaFence`] the jobqueue returns for that job.
+    pub fn add_callback() -> Result {
+        Ok(())
+    }
+
+    /// Add a [`DmaFence`] or a [`DoneFence`] as this job's dependency. The job
+    /// will only be executed after that dependency has been finished.
+    pub fn add_dependency() -> Result {
+        // TODO: Enqueue passed DmaFence into the job's dependency list.
+        Ok(())
+    }
+
+    /// Check if there are dependencies for this job. Register the jobqueue
+    /// waker if yes.
+    fn arm_deps() -> Result {
+        // TODO: Register DependencyWaker here if applicable.
+        Ok(())
+    }
+}
+
+// Dummy trait for the linked list.
+trait JobData {
+    fn access_data(&self) -> i32;
+}
+
+#[pin_data]
+struct EnqueuedJob<T: ?Sized> {
+    inner: Pin<KBox<Job<T>>>,
+    #[pin]
+    links: ListLinksSelfPtr<EnqueuedJob<dyn JobData>>,
+    done_fence: ARef<DmaFence<i32>>, // i32 is just dummy data. TODO: allow for replacing with `()`
+    // The hardware_fence can by definition only be set at an unknown point in
+    // time.
+    // TODO: Think about replacing this with a `struct RunningJob` which consumes
+    // an `EnqueuedJob`.
+    hardware_fence: Option<ARef<DmaFence<i32>>>, // i32 is dummy data until there's DmaFence
+                                                 // without data.
+    nr_of_deps: u32,
+}
+
+impl<T> EnqueuedJob<T> {
+    fn new(inner: Pin<KBox<Job<T>>>, fctx: &Arc<DmaFenceCtx>) -> Result<ListArc<Self>> {
+        let pseudo_data: i32 = 42;
+        let done_fence = fctx.as_arc_borrow().new_fence(pseudo_data)?;
+
+        ListArc::pin_init(try_pin_init!(Self {
+            inner,
+            links <- ListLinksSelfPtr::new(),
+            done_fence,
+            hardware_fence: None,
+            nr_of_deps: 0, // TODO implement
+        }), GFP_KERNEL)
+    }
+}
+
+impl_list_arc_safe! {
+    impl{T: ?Sized} ListArcSafe<0> for EnqueuedJob<T> { untracked; }
+}
+
+impl_list_item! {
+    impl ListItem<0> for EnqueuedJob<dyn JobData> { using ListLinksSelfPtr { self.links }; }
+}
+
+// Callback item for the hardware fences to wake / progress the jobqueue.
+struct HwFenceWaker<T> {
+    jobq: Arc<Revocable<SpinLock<InnerJobqueue>>>,
+    job: ListArc<EnqueuedJob<T>>,
+}
+
+impl<T> DmaFenceCbFunc for HwFenceWaker<T> {
+     fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized {
+         // This prevents against deadlock. See Jobqueue's drop() for details.
+         let jq_guard = cb.data.jobq.try_access();
+         if jq_guard.is_none() {
+             return;
+         }
+         let jq_guard = jq_guard.unwrap();
+
+         // Take Jobqueue lock.
+         let jq = jq_guard.lock();
+         // Remove job from running list.
+         //let _ = unsafe { cb.data.job.remove() };
+         // Signal done_fence.
+         // TODO: It's more robust if the JQ makes sure that fences get signalled
+         // in order, even if the driver should signal them chaotically.
+         let _ = cb.data.job.done_fence.signal();
+         // Run more ready jobs if there's capacity.
+         //jq.start_submit_worker();
+     }
+}
+
+// Callback item for the dependency fences to wake / progress the jobqueue.
+struct DependencyWaker<T> {
+    jobq: Arc<Revocable<SpinLock<InnerJobqueue>>>,
+    job: ListArc<EnqueuedJob<T>>,
+}
+
+impl<T> DmaFenceCbFunc for DependencyWaker<T> {
+    fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized {
+        // This prevents against deadlock. See Jobqueue's drop() for details.
+        let jq_guard = cb.data.jobq.try_access();
+        if jq_guard.is_none() {
+            return;
+        }
+        let jq_guard = jq_guard.unwrap();
+
+        // Take Jobqueue lock.
+        let jq = jq_guard.lock();
+
+        // TODO: Lock Contention
+        //
+        // Alright, so the Jobqueue is currently designed around a big central
+        // lock, which also protects the jobs. submit_job(), the JQ's cb on the
+        // hw_fences and its cbs on the (external) dependency fences compete for
+        // the lock. The first two should ever only run sequentially, so likely
+        // aren't a problem.
+        //
+        // Dependency callbacks, however, could be registered and then signalled
+        // by the thousands and then all compete for the lock possibly for nothing.
+        //
+        // That can likely be improved. Maybe by just making the nr_of_deps
+        // counter atomic?
+
+        // Decrement dep counter.
+        // cb.data.job.nr_of_deps -= 1; // TODO needs to be DerefMut
+        // If counter == 0, a new job somewhere in the queue just got ready.
+        // Check if it was the head job and if yes, run all jobs possible.
+        if cb.data.job.nr_of_deps == 0 {
+//            jq.start_submit_worker();
+        }
+    }
+}
+
+struct InnerJobqueue {
+    capacity: u32,
+    waiting_jobs: List<EnqueuedJob<dyn JobData>>,
+    running_jobs: List<EnqueuedJob<dyn JobData>>,
+    submit_worker_active: bool,
+}
+
+impl InnerJobqueue {
+    fn new(capacity: u32) -> Self {
+        let waiting_jobs = List::<EnqueuedJob<dyn JobData>>::new();
+        let running_jobs = List::<EnqueuedJob<dyn JobData>>::new();
+
+        Self {
+            capacity,
+            waiting_jobs,
+            running_jobs,
+            submit_worker_active: false,
+        }
+    }
+
+    fn has_waiting_jobs(&self) -> bool {
+        !self.waiting_jobs.is_empty()
+    }
+
+    fn has_capacity_left(&self, cost: u32) -> bool {
+        let cost = cost as i64;
+        let capacity = self.capacity as i64;
+
+        if capacity - cost >= 0 {
+            return true;
+        }
+
+        false
+    }
+
+    fn update_capacity(&mut self, cost: u32) {
+        self.capacity -= cost;
+    }
+
+
+    // Called by the hw_fence callbacks, dependency callbacks, and submit_job().
+    // TODO: does submit_job() ever have to call it?
+    fn start_submit_worker(&mut self) {
+        if self.submit_worker_active {
+            return;
+        }
+
+        // TODO run submit work item
+
+        self.submit_worker_active = true;
+    }
+
+    /*
+
+    /// Push a job immediately.
+    ///
+    /// Returns true if the job ran immediately, false otherwise.
+    fn run_job(&mut self, job: &EnqueuedJob) -> bool {
+        // TODO remove job from waiting list.
+
+        // TODO Call the driver's run_job() callback.
+        let hardware_fence = run_job(&job);
+        job.hardware_fence = Some(hardware_fence);
+
+        // TODO check whether hardware_fence raced and is already signalled.
+
+        self.running_jobs.push_back(job);
+
+        // TODO Register HwFenceWaker on the hw_fence.
+    }
+
+    // Submits all ready jobs as long as there's capacity.
+    fn run_all_ready_jobs(&mut self) {
+        for job in self.waiting_jobs.reverse() {
+            if job.nr_of_deps > 0 {
+                return;
+            }
+
+            if self.has_capacity_left(job.credits) {
+                if !self.run_job(&job) {
+                    // run_job() didn't run the job immediately (because the
+                    // hw_fence did not race). Subtract the credits.
+                    self.update_capacity(job.credits);
+                }
+            } else {
+                return;
+            }
+        }
+    }
+    */
+}
+
+//#[pin_data]
+pub struct Jobqueue {
+    inner: Arc<Revocable<SpinLock<InnerJobqueue>>>,
+    fctx: Arc<DmaFenceCtx>, // TODO currently has a separate lock shared with fences
+//    #[pin]
+//    data: T,
+}
+
+impl Jobqueue {
+    /// Create a new [`Jobqueue`] with `capacity` space for jobs. `run_job` is
+    /// your driver's callback which the jobqueue will call to push a submitted
+    /// job to the hardware.
+    pub fn new<T, V>(capacity: u32, _run_job: fn(&Pin<KBox<Job<T>>>) -> ARef<DmaFence<V>>) -> Result<Self> {
+        let inner = Arc::pin_init(Revocable::new(new_spinlock!(InnerJobqueue::new(capacity))), GFP_KERNEL)?;
+        let fctx = DmaFenceCtx::new()?;
+
+        Ok (Self {
+            inner,
+            fctx,
+        })
+    }
+
+    /// Submit a job to the jobqueue.
+    ///
+    /// The jobqueue takes ownership over the job and later passes it back to the
+    /// driver by reference through the driver's run_job callback. Jobs are
+    /// passed back by reference instead of by value partially to allow for later
+    /// adding a job resubmission mechanism to be added to [`Jobqueue`].
+    ///
+    /// Jobs get run and their done_fences get signalled in submission order.
+    ///
+    /// Returns the "done_fence" on success, which gets signalled once the
+    /// hardware has completed the job and once the jobqueue is done with a job.
+    pub fn submit_job<U>(&self, job: Pin<KBox<Job<U>>>) -> Result<ARef<DmaFence<i32>>> {
+        let job_cost = job.credits;
+        // TODO: It would be nice if the done_fence's seqno actually matches the
+        // submission order. To do that, however, we'd need to protect job
+        // creation with InnerJobqueue's spinlock. Is that worth it?
+        let enq = EnqueuedJob::new(job, &self.fctx)?;
+        let done_fence = enq.done_fence.clone(); // Get the fence for the user.
+
+        // TODO register job's callbacks on done_fence.
+
+        let guard = self.inner.try_access();
+        if guard.is_none() {
+            // Can never happen. JQ gets only revoked when it drops.
+            return Err(ENODEV);
+        }
+        let jobq = guard.unwrap();
+
+        let jobq = jobq.lock();
+
+        // Check if there are dependencies and, if yes, register rewake
+        // callbacks on their fences. Must be done under the JQ lock's protection
+        // since the callbacks will access JQ data.
+        //job.arm_deps();
+        //jobq.waiting_jobs.push_back(job);
+
+        if jobq.has_waiting_jobs() {
+            // Jobs waiting means that there is either currently no capacity
+            // for more jobs, or the jobqueue is blocked by a job with
+            // unfullfilled dependencies. Either the hardware fences' callbacks
+            // or those of the dependency fences will pull in more jobs once
+            // there is capacity.
+            return Ok(done_fence);
+        } else if !jobq.submit_worker_active && jobq.has_capacity_left(job_cost) {
+            // This is the first waiting job. No one (i.e., no hw_fence) has
+            // woken the worker yet, but there is space. Awake it manually.
+            //jobq.start_submit_worker();
+        }
+
+        // If there was no capacity for the job, the callbacks registered on the
+        // already running jobs' hardware fences will check if there's space for
+        // the next job, guaranteeing progress.
+        //
+        // If no jobs were running, there was by definition still space and the
+        // job will get pushed by the worker.
+        //
+        // If a job couldn't be pushed because there were unfinished dependencies,
+        // then the hardware fences' callbacks mentioned above will detect that
+        // and not yet push the job.
+        //
+        // Each dependency's fence has its own callback which checks:
+        //   a) whether all other callbacks are fullfilled and if yes:
+        //   b) whether there is now enough credits available.
+        //
+        // If a) and b) are fullfilled, the job gets pushed.
+        //
+        // If there are no jobs currently running, credits must be available by
+        // definition.
+
+        Ok(done_fence)
+
+    }
+}
+
+impl Drop for Jobqueue {
+    fn drop(&mut self) {
+        // The hardware fences might outlive the jobqueue. So hw_fence callbacks
+        // could very well still call into job queue code, resulting in
+        // data UAF or, should the jobqueue code be unloaded, even code UAF.
+        //
+        // Thus, the jobqueue needs to be cleanly decoupled from the hardware
+        // fences when it drops, in other words, it needs to deregister all its
+        // hw_fence callbacks.
+        //
+        // This, however, could easily deadlock when a hw_fence signals:
+        //
+        // Step     |   Jobqueue step               |   hw_fence step
+        // ------------------------------------------------------------------
+        // 1        |   JQ starts drop              |   fence signals
+        // 2        |   JQ lock taken               |   fence lock taken
+        // 3        |   Tries to take fence lock    |   Tries to take JQ lock
+        // 4        |   ***DEADLOCK***              |   ***DEADLOCK***
+        //
+        // In order to prevent deadlock, we first have to revoke access to the
+        // JQ so that all fence callbacks can't try to take the lock anymore,
+        // and then deregister all JQ callbacks.
+        self.inner.revoke();
+
+        /*
+        let guard = self.inner.lock();
+        for job in self.inner.waiting_jobs {
+            job.deregister_dep_fences();
+        }
+        for job in self.inner.running_jobs {
+            job.deregister_hw_fence();
+        }
+        */
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf..803bed36231b 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -7,12 +7,14 @@
 pub mod file;
 pub mod gem;
 pub mod ioctl;
+pub mod jq;
 
 pub use self::device::Device;
 pub use self::driver::Driver;
 pub use self::driver::DriverInfo;
 pub use self::driver::Registration;
 pub use self::file::File;
+pub use self::jq::Jobqueue;
 
 pub(crate) mod private {
     pub trait Sealed {}
-- 
2.49.0

