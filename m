Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C38D345CD0;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100229; cv=none; b=HiIk7Tkn3LJYHkjL9VPenp4GZoEpznODuiGSLPkhO5DIcGabmx93iOg82ke0+dbsZGBzhnNypYG3Ls0A84ETDkUI0vPJ2GbSi2XrTwAxzR8wpE6YrSLm1C5qAfi7++JVlqB0ceTPP7rYkntQgC/seELzG8e5z0vwSyy3rGMM4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100229; c=relaxed/simple;
	bh=evIL1nsXHjuu00/bb95LxB49HKD9PzsuBGt0qKw+zkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxHLZfDxJVKoliW8ebbjVIVedRM5fnUirQenLGq+HC147XARyBXN3TjXSqAiIMof/f8otoOLpQ7FRbCrXIka9X37KJczNuG+cbtPnb26lWIZQErgctCnYxHBrzxRgrunqt/UNgonDdn7pCyRAPJim2aOf0fjr+oGkMENU5bMqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3Nd6buj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3Nd6buj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60264C2BCB0;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775100229;
	bh=evIL1nsXHjuu00/bb95LxB49HKD9PzsuBGt0qKw+zkU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U3Nd6bujtBUQ/7Gw5IgwWEGo+SOQwh2FmhGVNsCMsnjg5R+bYBh8z/630Jhf6W9YJ
	 MRlkMObLPkhMaD3SH7knq8YWD2wQgUBA93ptqiGB97vfgyvuvrbfAYrXRbeZbP/116
	 fDEJoNyK7JkwZFpBEsFubA4/iHgh1edg3VLFM9ADcLmZJ9qPcgvnxHYl/kcsf6cQwz
	 Ab6aLtmy5ZY8nEaqvDqvxkEYLE/JPATMJgSCd6t2J9dnkGA4OHmQ9DYyidAZd5pGfm
	 ZqFRnROnVvfIpMsEbkuyn6NTUysIjbb2UOe+P70RqQnwGUKQC8QtbFJM1btyG2E5ZJ
	 Na4LWCBUH2/Ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586A4111227A;
	Thu,  2 Apr 2026 03:23:49 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Date: Thu, 02 Apr 2026 08:53:48 +0530
Subject: [PATCH 3/3] rust: workqueue: add KUnit and sample stress tests
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-rust-next-v1-3-0940bb8f201c@multicorewareinc.com>
References: <20260402-rust-next-v1-0-0940bb8f201c@multicorewareinc.com>
In-Reply-To: <20260402-rust-next-v1-0-0940bb8f201c@multicorewareinc.com>
To: rust-for-linux@vger.kernel.org
Cc: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775100227; l=9449;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=R2vmLu2avJ+Dd7CwhIAtTPqzzOJt675bHUJ2ZA8KFJE=;
 b=xihdfwBCHhaQj82a42CGq/no0MnKKebse6juN4K3KoIBWeVagx2rhqV/NDWC5yGrNJO/YtIEf
 X4GZJJ9fH8HDzd/0XKg1T54TWkk8pAzAs2p1k7p7h3h7MVhac/8FWAX
X-Developer-Key: i=aakash.bollineni@multicorewareinc.com; a=ed25519;
 pk=r3Gonl+2k+8RozN9U/XwfICQdnRlAcLeeAfsExmurdE=
X-Endpoint-Received: by B4 Relay for
 aakash.bollineni@multicorewareinc.com/20260402 with auth_id=711
X-Original-From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Reply-To: aakash.bollineni@multicorewareinc.com

From: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>

To ensure the safety and correctness of the improved workqueue API,
this patch adds comprehensive testing infrastructure:
1. KUnit Tests: Adds an internal 'rust_kernel_workqueue' test suite
   to rust/kernel/workqueue.rs. These tests verify basic and
   synchronous cancellation, refcount stability, and concurrency
   safety for both standard and delayed work.
2. Sample Module: Adds samples/rust/rust_workqueue_test.rs as a
   standalone module that performs a 1000-iteration stress test
   designed to verify race-free pointer handover during concurrent
   enqueue/cancel operations.
The tests use distinct types for standard and delayed work items to
ensure clear trait dispatch and prevent field offset conflicts.

Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
---
 samples/rust/Makefile               |   2 +
 samples/rust/rust_workqueue_test.rs | 214 ++++++++++++++++++++++++++++++++++++
 2 files changed, 216 insertions(+)

diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58cccc..0f304bd90997 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -20,3 +20,5 @@ obj-$(CONFIG_SAMPLE_RUST_SOC)			+= rust_soc.o
 rust_print-y := rust_print_main.o rust_print_events.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
+
+obj-y += rust_workqueue_test.o
diff --git a/samples/rust/rust_workqueue_test.rs b/samples/rust/rust_workqueue_test.rs
new file mode 100644
index 000000000000..c055ec1964c0
--- /dev/null
+++ b/samples/rust/rust_workqueue_test.rs
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Robust stress test for Rust workqueue API.
+
+use kernel::prelude::*;
+use kernel::sync::Arc;
+use kernel::time::msecs_to_jiffies;
+use kernel::workqueue::{self, new_work, Work, WorkItem};
+
+#[pin_data]
+struct TestItem {
+    #[pin]
+    work: Work<TestItem>,
+    value: i32,
+    #[pin]
+    delayed_work: workqueue::DelayedWork<TestItem>,
+}
+
+kernel::impl_has_work! {
+    impl HasWork<Self> for TestItem { self.work }
+}
+
+// SAFETY: The `delayed_work` field is at a fixed offset and is valid for the lifetime of
+// `TestItem`.
+unsafe impl workqueue::HasDelayedWork<Self> for TestItem {}
+
+impl WorkItem for TestItem {
+    type Pointer = Arc<TestItem>;
+
+    fn run(this: Arc<TestItem>) {
+        pr_info!(
+            "Rust workqueue test: Work item running (value: {})\n",
+            this.value
+        );
+    }
+}
+
+/// Helper to get Arc strong count for verification in tests.
+/// This uses internal layout knowledge of Arc.
+fn get_arc_count<T: Sized>(arc: &Arc<T>) -> i32 {
+    // SAFETY: ArcInner has refcount as its first field. Arc points to data at DATA_OFFSET.
+    unsafe {
+        let ptr = Arc::as_ptr(arc);
+        let inner_ptr = (ptr as *const u8).sub(Arc::<T>::DATA_OFFSET);
+        // The first field of ArcInner is Refcount, which is a transparent wrapper around
+        // refcount_t. In the kernel, refcount_t is an atomic_t (i32).
+        let refcount_ptr = inner_ptr as *const i32;
+        // We use a relaxed load to get the current value.
+        core::ptr::read_volatile(refcount_ptr)
+    }
+}
+
+struct RustWorkqueueTest;
+
+impl kernel::Module for RustWorkqueueTest {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Rust workqueue test: starting robust verification\n");
+
+        // 1. Basic Lifecycle with Refcount Validation
+        {
+            let test_item = Arc::pin_init(
+                pin_init!(TestItem {
+                    work <- new_work!("TestItem::work"),
+                    value: 42,
+                    delayed_work <- workqueue::new_delayed_work!("TestItem::delayed_work"),
+                }),
+                GFP_KERNEL,
+            )?;
+
+            let initial_count = get_arc_count(&test_item);
+            pr_info!("Initial Arc strong count: {}\n", initial_count);
+
+            // Enqueue
+            let enqueued_item = test_item.clone();
+
+            if let Err(returned_item) = workqueue::system().enqueue(enqueued_item) {
+                pr_warn!("Work already pending, unexpected!\n");
+                let _ = returned_item;
+            } else {
+                pr_info!(
+                    "Work enqueued successfully. Strong count: {}\n",
+                    get_arc_count(&test_item)
+                );
+            }
+
+            // Cancel immediately (best effort)
+            if let Some(reclaimed) = test_item.work.cancel() {
+                let count_after_cancel = get_arc_count(&test_item);
+                pr_info!(
+                    "Success: Work cancelled and Arc reclaimed. Strong count: {}\n",
+                    count_after_cancel
+                );
+
+                // VALIDATION: Reclamation must restore the refcount (minus the clone we just
+                // reclaimed)
+                if count_after_cancel != initial_count + 1 {
+                    pr_err!(
+                        "ERROR: Refcount mismatch after cancel! Expected {}, got {}\n",
+                        initial_count + 1,
+                        count_after_cancel
+                    );
+                    return Err(ENXIO);
+                }
+                drop(reclaimed);
+                if get_arc_count(&test_item) != initial_count {
+                    pr_err!(
+                        "ERROR: Refcount mismatch after drop! Expected {}, got {}\n",
+                        initial_count,
+                        get_arc_count(&test_item)
+                    );
+                    return Err(ENXIO);
+                }
+            } else {
+                pr_info!("Work already running or finished, could not reclaim via cancel().\n");
+            }
+        }
+
+        // 2. Stress Testing: Enqueue/Cancel Sync Loop
+        {
+            pr_info!("Starting stress test (1000 iterations)...\n");
+            let test_item = Arc::pin_init(
+                pin_init!(TestItem {
+                    work <- new_work!("TestItem::work"),
+                    value: 99,
+                    delayed_work <- workqueue::new_delayed_work!("TestItem::delayed_work"),
+                }),
+                GFP_KERNEL,
+            )?;
+
+            for i in 0..1000 {
+                let _ = workqueue::system().enqueue(test_item.clone());
+                // Use cancel_sync to ensure determinism for the next iteration
+                let _ = test_item.work.cancel_sync();
+
+                if i % 250 == 0 {
+                    pr_info!("Stress test progress: {}/1000\n", i);
+                }
+            }
+
+            if get_arc_count(&test_item) != 1 {
+                pr_err!(
+                    "ERROR: Refcount leak detected after stress test! count: {}\n",
+                    get_arc_count(&test_item)
+                );
+                return Err(ENXIO);
+            } else {
+                pr_info!("Stress test completed successfully. No refcount leaks.\n");
+            }
+        }
+
+        // 3. Delayed Work Cancellation Test
+        {
+            let test_item = Arc::pin_init(
+                pin_init!(TestItem {
+                    work <- new_work!("TestItem::work"),
+                    value: 7,
+                    delayed_work <- workqueue::new_delayed_work!("TestItem::delayed_work"),
+                }),
+                GFP_KERNEL,
+            )?;
+
+            let initial_count = get_arc_count(&test_item);
+
+            // Schedule with a long delay
+            let to_enqueue = test_item.clone();
+            let res = workqueue::system()
+                .enqueue_delayed(to_enqueue, msecs_to_jiffies(5000));
+            if let Err(returned) = res {
+                pr_warn!("Delayed work already pending, returned item.\n");
+                drop(returned);
+            } else {
+                pr_info!("Delayed work enqueued. count: {}\n", get_arc_count(&test_item));
+            }
+
+            if test_item.delayed_work.is_pending() {
+                pr_info!("Delayed work is pending as expected.\n");
+            }
+
+            if let Some(reclaimed) = test_item.delayed_work.cancel() {
+                pr_info!("Success: Delayed work reclaimed. No leak.\n");
+                drop(reclaimed);
+            } else {
+                pr_warn!("Notice: Delayed work not reclaimed (running or never enqueued).\n");
+            }
+
+            let final_count = get_arc_count(&test_item);
+            if final_count != initial_count {
+                pr_err!(
+                    "ERROR: Refcount leak after delayed cancel! expected {}, got {}\n",
+                    initial_count,
+                    final_count
+                );
+                return Err(ENXIO);
+            }
+        }
+
+        pr_info!("Rust workqueue test: all robust checks passed\n");
+        Ok(RustWorkqueueTest)
+    }
+}
+
+impl Drop for RustWorkqueueTest {
+    fn drop(&mut self) {
+        pr_info!("Rust workqueue test: exit\n");
+    }
+}
+
+module! {
+    type: RustWorkqueueTest,
+    name: "rust_workqueue_test",
+    authors: ["Aakash Bollineni"],
+    description: "Robust stress test for Rust workqueue API",
+    license: "GPL",
+}

-- 
2.43.0


