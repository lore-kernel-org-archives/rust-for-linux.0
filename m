Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE4239448B;
	Tue,  3 Feb 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106495; cv=none; b=H9yyNOUuPzo87UZx8HD5HCuTfMItk3JPudFlcG/2tDJHqRPbGIzHmIChHBJlxATxDc9/TcVQchla9DMVsfCh1fF4EAbu+SpmXhwWl7Qt3N0szBLTutkRSDQo8rC8chWqLE3c2UtUnRZ5Vy3/HW4gqNJqHeEfX4h9Sf4t/cT/WkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106495; c=relaxed/simple;
	bh=awtL86U6XqX/kvHZstMumWgEZU5Qs0bhnkawIWJ9XUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2h7CuOD38WcvFaYlGa8X8HrAlKBcybunm+ma5KvOBjM+MJmy0w+RFgscnsH3qobW/2F0JM6rJ76ebKKKFRBV5b0q2mX4AN0NgywH384o/lWYb1emeik6gyOq6IUjVcpY060RfZO3vFEMzwzHIc+ncpwU1at/ZAiqs1yaYHmM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWJdZrKp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWJdZrKp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0287C116D0;
	Tue,  3 Feb 2026 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770106494;
	bh=awtL86U6XqX/kvHZstMumWgEZU5Qs0bhnkawIWJ9XUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hWJdZrKp9NFjFL7eBR4eXM/oDnjsBw3t6/GDl3o2rkMQ8NldRV+fCR3kyZ3iGI0cp
	 oShZK3GuD0kLP+9OrhooGnb31Cl4BFzvHJaDwgPvllay1XaJStGN49x1A3U/FZUBuG
	 RpmY+oq/NGqidMJs7gMxHwzF3Nur3euIpq82FrrcAJm1fXM9JyDvzGQ+ssp7PnKKMW
	 JUv+7Kusq3LAuTNphJoSNwRUBhv+YWQ6k+FUdlhSJ3j4NV3QlZw7vZatZ2FB4LtCsk
	 2RqL3hZ1i2043OHyWUydPJIsdLumDJRlF08o8CdATtTmCuYqs+o4iDHZAwZoXK/6Ns
	 RzgRb4Y5VqCrQ==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [RFC PATCH 4/4] samples: rust: Add jobqueue tester
Date: Tue,  3 Feb 2026 09:14:03 +0100
Message-ID: <20260203081403.68733-6-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203081403.68733-2-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DRM Jobqueue is a new piece of (highly asynchronous) infrastructure
for submitting jobs to graphics processing units (GPUs).

It is difficult to test such a mechanism purely with unit tests. Thus,
provide this driver solely for testing drm::Jobqueue.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 samples/rust/Kconfig                 |  11 ++
 samples/rust/Makefile                |   1 +
 samples/rust/rust_jobqueue_tester.rs | 180 +++++++++++++++++++++++++++
 3 files changed, 192 insertions(+)
 create mode 100644 samples/rust/rust_jobqueue_tester.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c376eb899b7a..a9a3a671bb0b 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -145,4 +145,15 @@ config SAMPLE_RUST_HOSTPROGS
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_JOBQUEUE_TESTER
+	tristate "Jobqueue Tester"
+	select JOBQUEUE_TESTER
+	help
+	  This option builds the Rust Jobqueue Tester.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_jobqueue_tester.
+
+	  If unsure, say N.
+
 endif # SAMPLES_RUST
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index cf8422f8f219..9cc1f021dc39 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
 obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
+obj-$(CONFIG_SAMPLE_RUST_JOBQUEUE_TESTER)	+= rust_jobqueue_tester.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
 
diff --git a/samples/rust/rust_jobqueue_tester.rs b/samples/rust/rust_jobqueue_tester.rs
new file mode 100644
index 000000000000..c2590a1b4f8a
--- /dev/null
+++ b/samples/rust/rust_jobqueue_tester.rs
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Small example demonstrating how to use [`drm::Jobqueue`].
+
+use kernel::prelude::*;
+use kernel::sync::{DmaFenceCtx, DmaFence, Arc};
+use kernel::drm::jq::{Job, Jobqueue};
+use kernel::types::{ARef};
+use kernel::time::{delay::fsleep, Delta};
+use kernel::workqueue::{self, impl_has_work, new_work, Work, WorkItem};
+
+module! {
+    type: RustJobqueueTester,
+    name: "rust_jobqueue_tester",
+    authors: ["Philipp Stanner"],
+    description: "Rust minimal sample",
+    license: "GPL",
+}
+
+#[pin_data]
+struct GPUWorker {
+    hw_fence: ARef<DmaFence<i32>>,
+    #[pin]
+    work: Work<GPUWorker>,
+}
+
+impl GPUWorker {
+    fn new(
+        hw_fence: ARef<DmaFence<i32>>,
+    ) -> Result<Arc<Self>> {
+        Arc::pin_init(
+            pin_init!(Self {hw_fence, work <- new_work!("Jobqueue::GPUWorker")}),
+            GFP_KERNEL,
+        )
+    }
+}
+
+impl_has_work! {
+    impl HasWork<Self> for GPUWorker { self.work }
+}
+
+impl WorkItem for GPUWorker {
+    type Pointer = Arc<GPUWorker>;
+
+    fn run(this: Arc<GPUWorker>) {
+        fsleep(Delta::from_secs(1));
+        this.hw_fence.signal().unwrap();
+    }
+}
+
+fn run_job(job: &Pin<&mut Job<Arc<DmaFenceCtx>>>) -> ARef<DmaFence<i32>> {
+    let fence = job.data.as_arc_borrow().new_fence(42 as i32).unwrap();
+
+    let gpu_worker = GPUWorker::new(fence.clone()).unwrap();
+    let _ = workqueue::system().enqueue(gpu_worker);
+
+    fence
+}
+
+struct RustJobqueueTester { }
+
+impl kernel::Module for RustJobqueueTester {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Rust Jobqueue Tester (init)\n");
+        pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
+
+        let dep_fctx = DmaFenceCtx::new()?;
+        let hw_fctx = DmaFenceCtx::new()?;
+        let jq = Jobqueue::new(1_000_000, run_job)?;
+
+
+        pr_info!("Test 1: Test submitting two jobs without dependencies.\n");
+        let job1 = Job::new(1, hw_fctx.clone())?;
+        let job2 = Job::new(1, hw_fctx.clone())?;
+
+        let fence1 = jq.submit_job(job1)?;
+        let fence2 = jq.submit_job(job2)?;
+
+        while !fence1.is_signaled() || !fence2.is_signaled() {
+            fsleep(Delta::from_secs(2));
+        }
+        pr_info!("Test 1 succeeded.\n");
+
+
+        pr_info!("Test 2: Test submitting a job with already-fullfilled dependency.\n");
+        let mut job3 = Job::new(1, hw_fctx.clone())?;
+        job3.add_dependency(fence1)?;
+
+        let fence3 = jq.submit_job(job3)?;
+        fsleep(Delta::from_secs(2));
+        if !fence3.is_signaled() {
+            pr_info!("Test 2 failed.\n");
+            return Err(EAGAIN);
+        }
+        pr_info!("Test 2 succeeded.\n");
+
+
+        pr_info!("Test 3: Test that a job with unfullfilled dependency gets never run.\n");
+        let unsignaled_fence = dep_fctx.as_arc_borrow().new_fence(9001 as i32)?;
+
+        let mut job4 = Job::new(1, hw_fctx.clone())?;
+        job4.add_dependency(unsignaled_fence.clone())?;
+
+        let blocked_job_fence = jq.submit_job(job4)?;
+        fsleep(Delta::from_secs(2));
+        if blocked_job_fence.is_signaled() {
+            pr_info!("Test 3 failed.\n");
+            return Err(EAGAIN);
+        }
+        pr_info!("Test 3 succeeded.\n");
+
+
+        pr_info!("Test 4: Test whether Test 3's blocked job can be unblocked.\n");
+        unsignaled_fence.signal()?;
+        while !blocked_job_fence.is_signaled() {
+            fsleep(Delta::from_secs(2));
+        }
+        pr_info!("Test 4 succeeded.\n");
+
+
+        pr_info!("Test 5: Submit a bunch of unblocked jobs, then a blocked one, then an unblocked one.\n");
+        let job1 = Job::new(1, hw_fctx.clone())?;
+        let job2 = Job::new(1, hw_fctx.clone())?;
+        let mut job3 = Job::new(1, hw_fctx.clone())?;
+        let job4 = Job::new(1, hw_fctx.clone())?;
+        let job5 = Job::new(1, hw_fctx.clone())?;
+
+        let unsignaled_fence1 = dep_fctx.as_arc_borrow().new_fence(9001 as i32)?;
+        let unsignaled_fence2 = dep_fctx.as_arc_borrow().new_fence(9001 as i32)?;
+        let unsignaled_fence3 = dep_fctx.as_arc_borrow().new_fence(9001 as i32)?;
+        job3.add_dependency(unsignaled_fence1.clone())?;
+        job3.add_dependency(unsignaled_fence2.clone())?;
+        job3.add_dependency(unsignaled_fence3.clone())?;
+
+        let fence1 = jq.submit_job(job1)?;
+        let fence2 = jq.submit_job(job2)?;
+        let fence3 = jq.submit_job(job3)?;
+
+        fsleep(Delta::from_secs(2));
+        if fence3.is_signaled() || !fence1.is_signaled() || !fence2.is_signaled() {
+            pr_info!("Test 5 failed.\n");
+            return Err(EAGAIN);
+        }
+
+        unsignaled_fence1.signal()?;
+        unsignaled_fence3.signal()?;
+        fsleep(Delta::from_secs(2));
+        if fence3.is_signaled() {
+            pr_info!("Test 5 failed.\n");
+            return Err(EAGAIN);
+        }
+
+        unsignaled_fence2.signal()?;
+        fsleep(Delta::from_secs(2));
+        if !fence3.is_signaled() {
+            pr_info!("Test 5 failed.\n");
+            return Err(EAGAIN);
+        }
+
+        let fence4 = jq.submit_job(job4)?;
+        let fence5 = jq.submit_job(job5)?;
+
+        fsleep(Delta::from_secs(2));
+
+        if !fence4.is_signaled() || !fence5.is_signaled() {
+            pr_info!("Test 5 failed.\n");
+            return Err(EAGAIN);
+        }
+        pr_info!("Test 5 succeeded.\n");
+
+
+        Ok(RustJobqueueTester { })
+    }
+}
+
+impl Drop for RustJobqueueTester {
+    fn drop(&mut self) {
+        pr_info!("Rust Jobqueue Tester (exit)\n");
+    }
+}
-- 
2.49.0

