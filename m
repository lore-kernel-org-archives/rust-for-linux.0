Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC43A7F46;
	Tue,  7 Apr 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558282; cv=none; b=T9govRjFdBNVHvTqsEpGDMb90+7UScpsGiKOn7tW1OlNydIqC0OPHyegKzIM15dOZb+WPmWFjX6nPKa5sE3l0hGEn0nStMkvPwRavu9zxMeJSK3yz2oFf1v57Pf1dDftH27CkY8uN10kaobVd72xo7LQlbiH0+6YFELpW6/KV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558282; c=relaxed/simple;
	bh=/9k+6onDDMDi3QEezO5k7YfJTT5rkI3BeapXVLByvbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ovl8Plt6KLnfnk1bN9xUXOfNHFdE+GR+Fr3bnAM9YVFpeBa6zJV7TA8JsRyUgNVNhPVlKkNA5LrzG/vBE+0/rXdbvpArBLn8JIEcxAyDY7H5Suodmz/fouOCTcECsLnIaWmfs7uCUKpe3fwe/L2vO7jLqWdeZvuri4L1CJpvABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1yEouAh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1yEouAh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EDA8C2BCB2;
	Tue,  7 Apr 2026 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558282;
	bh=/9k+6onDDMDi3QEezO5k7YfJTT5rkI3BeapXVLByvbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M1yEouAhjA+SWj0nxmqtk7Pk72phogBMLCT4fC1F158bMMXCMToR6JGIWxRe6c/9Q
	 hiULoh0U+hBue7+FV+OThchxgK6SSFJI63XLIofItrl2+tAqz6iNJcxDI9S16L1j/y
	 Lg7zHoMHR8NfJK36rEGyVAXQu45ybRT5fCoX6pllE4cobp0sTtWoMDWdbJVVoohlXo
	 2GqquUy909CFIYxc86phF5MgpZkWbYdyxdgaeZvetRwAHPV3HTXHUd742TpIWW0VEI
	 1nH5pjHxLN6bP1ALQQHE5tUgLRjfoqQNy51lr3RKY7vCXIatWqsqy7h2gse6zUA61X
	 CvZ9a4yYvujew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B42EDB7F6;
	Tue,  7 Apr 2026 10:38:02 +0000 (UTC)
From: Aakash Bollineni via B4 Relay <devnull+aakash.bollineni.multicorewareinc.com@kernel.org>
Date: Tue, 07 Apr 2026 16:07:52 +0530
Subject: [PATCH v4 3/3] rust: workqueue: add KUnit and sample stress tests
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-workqueue-v3-final-v4-3-c27da7e5f175@multicorewareinc.com>
References: <20260407-workqueue-v3-final-v4-0-c27da7e5f175@multicorewareinc.com>
In-Reply-To: <20260407-workqueue-v3-final-v4-0-c27da7e5f175@multicorewareinc.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn.roy.baron@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aakash Bollineni <aakash.bollineni@multicorewareinc.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775558278; l=12592;
 i=aakash.bollineni@multicorewareinc.com; s=20260402;
 h=from:subject:message-id;
 bh=8AEmcEeh6WDrhhTL0z1p/9bqh2sG1YHRoh3/Ue89E7o=;
 b=hfW3jgvTSqnu0LXdRoD07zFZ5b+SCWL3VFTef14RBwRJ5rj8/Al9q/fZi8c3gpv6G8ws/uF+p
 04FhAXkaxcdBWd70dNwkwKuPsOTB6rmgKYi3C8zO5lx7aT75iLArV5w
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
   to rust/kernel/workqueue.rs.
2. Sample Module: Updates samples/rust/rust_workqueue_test.rs for
   stress verification.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604071427.209bk.JHO@intel.com/
v4: Fixed rustfmt and build errors in samples/rust/rust_workqueue_test.rs.
Signed-off-by: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
---
 rust/kernel/workqueue.rs            | 130 ++++++++++++++++++++++++
 samples/rust/Kconfig                |  10 ++
 samples/rust/Makefile               |   2 +
 samples/rust/rust_workqueue_test.rs | 192 ++++++++++++++++++++++++++++++++++++
 4 files changed, 334 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 94a52c278776..d25e0fa9d44c 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -1285,3 +1285,133 @@ pub fn system_bh_highpri() -> &'static Queue {
 ///
 /// This is intended for use in KUnit tests and sample modules ONLY.
 #[cfg(CONFIG_KUNIT)]
+
+#[macros::kunit_tests(rust_kernel_workqueue)]
+mod tests {
+    use super::*;
+    use crate::sync::Arc;
+
+    #[pin_data]
+    struct TestWorkItem {
+        #[pin]
+        work: Work<TestWorkItem>,
+        value: i32,
+    }
+
+    impl_has_work! {
+        impl HasWork<Self> for TestWorkItem { self.work }
+    }
+
+    impl WorkItem for TestWorkItem {
+        type Pointer = Arc<Self>;
+        fn run(_this: Arc<Self>) {}
+    }
+
+    #[pin_data]
+    struct TestDelayedWorkItem {
+        #[pin]
+        delayed_work: DelayedWork<TestDelayedWorkItem>,
+        value: i32,
+    }
+
+    impl_has_delayed_work! {
+        impl HasDelayedWork<Self> for TestDelayedWorkItem { self.delayed_work }
+    }
+
+    impl WorkItem for TestDelayedWorkItem {
+        type Pointer = Arc<Self>;
+        fn run(_this: Arc<Self>) {}
+    }
+
+    #[test]
+    fn test_work_cancel_reclaim() {
+        let item = Arc::pin_init(
+            pin_init!(TestWorkItem {
+                work <- new_work!("TestWorkItem::work"),
+                value: 42,
+            }),
+            GFP_KERNEL,
+        )
+        .expect("Failed to allocate TestWorkItem");
+
+        let initial_count = arc_count(&item);
+
+        // Enqueue
+        let _ = system().enqueue(item.clone());
+
+        // Cancel and Reclaim (if it was pending)
+        if let Some(reclaimed) = item.work.cancel() {
+            assert!(arc_count(&item) == initial_count + 1);
+            drop(reclaimed);
+            assert!(arc_count(&item) == initial_count);
+        }
+    }
+
+    #[test]
+    fn test_work_cancel_sync_reclaim() {
+        let item = Arc::pin_init(
+            pin_init!(TestWorkItem {
+                work <- new_work!("TestWorkItem::work"),
+                value: 42,
+            }),
+            GFP_KERNEL,
+        )
+        .expect("Failed to allocate TestWorkItem");
+
+        let initial_count = arc_count(&item);
+
+        // Enqueue
+        let _ = system().enqueue(item.clone());
+
+        // Cancel Sync and Reclaim
+        if let Some(reclaimed) = item.work.cancel_sync() {
+            assert!(arc_count(&item) == initial_count + 1);
+            drop(reclaimed);
+            assert!(arc_count(&item) == initial_count);
+        }
+    }
+
+    #[test]
+    fn test_work_stress_enqueue_cancel() {
+        let item = Arc::pin_init(
+            pin_init!(TestWorkItem {
+                work <- new_work!("TestWorkItem::work"),
+                value: 42,
+            }),
+            GFP_KERNEL,
+        )
+        .expect("Failed to allocate TestWorkItem");
+
+        for _ in 0..100 {
+            if let Ok(_) = system().enqueue(item.clone()) {
+                let _ = item.work.cancel_sync();
+            }
+        }
+
+        assert_eq!(arc_count(&item), 1);
+    }
+
+    #[test]
+    fn test_delayed_work_cancel_reclaim() {
+        let item = Arc::pin_init(
+            pin_init!(TestDelayedWorkItem {
+                delayed_work <- new_delayed_work!("TestDelayedWorkItem::delayed_work"),
+                value: 42,
+            }),
+            GFP_KERNEL,
+        )
+        .expect("Failed to allocate TestDelayedWorkItem");
+
+        let initial_count = arc_count(&item);
+
+        // Enqueue delayed (use a longer delay to ensure it stays pending)
+        let _ = system().enqueue_delayed(item.clone(), 1000);
+
+        // Cancel and Reclaim
+        if let Some(reclaimed) = item.delayed_work.cancel() {
+            assert!(arc_count(&item) == initial_count + 1);
+            drop(reclaimed);
+            assert!(arc_count(&item) == initial_count);
+        }
+    }
+}
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c49ab9106345..b3f078f77ca2 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -172,6 +172,16 @@ config SAMPLE_RUST_SOC
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_WORKQUEUE
+	tristate "Workqueue"
+	help
+	  This option builds the Rust workqueue robust stress test sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_workqueue_test.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58cccc..261aa67b6502 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -20,3 +20,5 @@ obj-$(CONFIG_SAMPLE_RUST_SOC)			+= rust_soc.o
 rust_print-y := rust_print_main.o rust_print_events.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
+
+obj-$(CONFIG_SAMPLE_RUST_WORKQUEUE)		+= rust_workqueue_test.o
diff --git a/samples/rust/rust_workqueue_test.rs b/samples/rust/rust_workqueue_test.rs
new file mode 100644
index 000000000000..e21296fdb34d
--- /dev/null
+++ b/samples/rust/rust_workqueue_test.rs
@@ -0,0 +1,192 @@
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
+struct TestWorkItem {
+    #[pin]
+    work: Work<TestWorkItem>,
+    value: i32,
+}
+
+kernel::impl_has_work! {
+    impl HasWork<Self> for TestWorkItem { self.work }
+}
+
+impl WorkItem for TestWorkItem {
+    type Pointer = Arc<TestWorkItem>;
+
+    fn run(this: Arc<TestWorkItem>) {
+        pr_info!(
+            "Rust workqueue test: Work item running (value: {})\n",
+            this.value
+        );
+    }
+}
+
+#[pin_data]
+struct TestDelayedWorkItem {
+    #[pin]
+    delayed_work: workqueue::DelayedWork<TestDelayedWorkItem>,
+    value: i32,
+}
+
+// SAFETY: The `delayed_work` field is at a fixed offset and is valid for the lifetime of
+// `TestDelayedWorkItem`.
+unsafe impl workqueue::HasDelayedWork<Self> for TestDelayedWorkItem {}
+
+impl WorkItem for TestDelayedWorkItem {
+    type Pointer = Arc<TestDelayedWorkItem>;
+
+    fn run(this: Arc<TestDelayedWorkItem>) {
+        pr_info!(
+            "Rust workqueue test: Delayed work item running (value: {})\n",
+            this.value
+        );
+    }
+}
+
+struct RustWorkqueueTest;
+
+impl kernel::Module for RustWorkqueueTest {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Rust workqueue test: starting robust verification (v4)\n");
+
+        // 1. Basic Lifecycle with Refcount Validation (Standard Work)
+        {
+            let work_item = Arc::pin_init(
+                pin_init!(TestWorkItem {
+                    work <- new_work!("TestWorkItem::work"),
+                    value: 42,
+                }),
+                GFP_KERNEL,
+            )?;
+
+            let initial_count = workqueue::arc_count(&work_item);
+            pr_info!("Initial Arc strong count: {}\n", initial_count);
+
+            // Enqueue
+            let enqueued_item = work_item.clone();
+
+            if let Err(returned_item) = workqueue::system().enqueue(enqueued_item) {
+                pr_warn!("Work already pending, unexpected!\n");
+                let _ = returned_item;
+            } else {
+                pr_info!(
+                    "Work enqueued successfully. Strong count: {}\n",
+                    workqueue::arc_count(&work_item)
+                );
+            }
+
+            // Cancel immediately
+            if let Some(reclaimed) = work_item.work.cancel() {
+                let count_after_cancel = workqueue::arc_count(&work_item);
+                pr_info!(
+                    "Success: Work cancelled and Arc reclaimed. Strong count: {}\n",
+                    count_after_cancel
+                );
+
+                if count_after_cancel != initial_count + 1 {
+                    pr_err!(
+                        "ERROR: Refcount mismatch after cancel! Expected {}, got {}\n",
+                        initial_count + 1,
+                        count_after_cancel
+                    );
+                    return Err(ENXIO);
+                }
+                drop(reclaimed);
+                if workqueue::arc_count(&work_item) != initial_count {
+                    pr_err!("ERROR: Refcount mismatch after drop!\n");
+                    return Err(ENXIO);
+                }
+            } else {
+                pr_info!("Work already running or finished.\n");
+            }
+        }
+
+        // 2. Stress Testing: Enqueue/Cancel Sync Loop
+        {
+            pr_info!("Starting stress test (1000 iterations)...\n");
+            let work_item = Arc::pin_init(
+                pin_init!(TestWorkItem {
+                    work <- new_work!("TestWorkItem::work"),
+                    value: 99,
+                }),
+                GFP_KERNEL,
+            )?;
+
+            for i in 0..1000 {
+                let _ = workqueue::system().enqueue(work_item.clone());
+                let _ = work_item.work.cancel_sync();
+                if i % 250 == 0 {
+                    pr_info!("Stress test progress: {}/1000\n", i);
+                }
+            }
+
+            if workqueue::arc_count(&work_item) != 1 {
+                pr_err!("ERROR: Refcount leak detected after stress test!\n");
+                return Err(ENXIO);
+            } else {
+                pr_info!("Stress test completed successfully.\n");
+            }
+        }
+
+        // 3. Delayed Work Cancellation Test
+        {
+            let delayed_item = Arc::pin_init(
+                pin_init!(TestDelayedWorkItem {
+                    delayed_work <-
+                    workqueue::new_delayed_work!("TestDelayedWorkItem::delayed_work"),
+                    value: 7,
+                }),
+                GFP_KERNEL,
+            )?;
+
+            let initial_count = workqueue::arc_count(&delayed_item);
+
+            // Schedule with a long delay (5 seconds)
+            if let Err(returned) =
+                workqueue::system().enqueue_delayed(delayed_item.clone(), msecs_to_jiffies(5000))
+            {
+                drop(returned);
+            } else {
+                pr_info!(
+                    "Delayed work enqueued. count: {}\n",
+                    workqueue::arc_count(&delayed_item)
+                );
+            }
+
+            if let Some(reclaimed) = delayed_item.delayed_work.cancel() {
+                pr_info!("Success: Delayed work reclaimed. No leak.\n");
+                drop(reclaimed);
+            }
+
+            if workqueue::arc_count(&delayed_item) != initial_count {
+                pr_err!("ERROR: Refcount leak after delayed cancel!\n");
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


