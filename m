Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C940E8FF;
	Fri,  5 Jun 2026 13:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666081; cv=none; b=AFP0gD+3FlzfuWjZWWDZjCbMQsjfws6XSLx8TkVElQfkox7sw1CBO+L3bUwA/dy2n0SZ4r/gvQnQ6EheCws2Kfaq23GD35TpVwIYO0sZcc/iw8Bp+WbTJ3XEYQ3hzVk/6pgnxc3cTQx0TSkeRpKxn/TIGHlBO70Ry/p5cqurMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666081; c=relaxed/simple;
	bh=fu96CL7CFllm65V5uP9SDCGOyAYmq+CjGDfd+DvVaeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R2ygMT+zsLTvokjKGGzIcwLdN2rXys8spcaeMhT+plGR0ACOgrF2iEzrFY5yeQfVxNvSdXvo6k65lOZrYVBuUS2RuQ7+d9W30oa+vWj5RkNclyLavddyXkxAKuDD1zhZ+ZOg9q3FHhEj97+FrO2SDIbMR1wqdzrlZ41wpGGQ5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRf1A9u3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRf1A9u3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA24F1F00893;
	Fri,  5 Jun 2026 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666079;
	bh=90pak0t50tWmXxe6PlCS5DKpr5DmS1Y0ZWy+22BhQJk=;
	h=From:Date:Subject:To:Cc;
	b=KRf1A9u3StjM4VM5cVfSTEjAsi8GooOzQCSNvcZ3IvxybvH1QJkkI71wA/wYEuxKh
	 xKcO/EYh5wYl14nclVHvNGOxtiUrKAWe8hpOMf6yoBcqjAmr3SJ9ERyvUYPXuadHzw
	 Ut+NmCtg61eq4uqjd4SRL6Ew237BCMCc2Vz+i1zaQoof8vS5EgFYC/8Fat80g17U1A
	 3Q6NFf+ZUxdXgdOH1PD9Etft4ILoo1kf0MoB7mne9js7S6+ZdqnYjqKTI335U8FB4v
	 geabZgRmzcBoKQqaKb/REUhF8W0rLcDPga79gAN5rUXLNIGWRs9YRuJZZt9D+eNyB6
	 ITrNcePreCgqg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 15:27:48 +0200
Subject: [PATCH v2] fault-inject: rust: add a Rust API for fault-injection
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-rust-fault-inject-v2-1-aaf978883cc2@kernel.org>
X-B4-Tracking: v=1; b=H4sIANPOImoC/32PQU7DMBBFrxJ5zVSxkxjIinugLuzJODW0dhk7F
 lWVu9ckgiXLN9L/789dJGJPSYzNXTAVn3wMFdRTI/Bkwkzgp8pCtUq3Sg7AS8rgzHLO4MMHYQa
 LWjnZvnRDq0TNXZmc/9463487M30ttTrvR2FNIsB4ufg8NuX5IIFxi/4p64JfIcbg/OwSIEy0i
 2eOyzWBnWxr+l53ndFjUeJHdvIpR75t/xS52f6ZXiRI0IT98Ip2QLRvn8SBzofIsziu6/oA7PI
 +mCABAAA=
X-Change-ID: 20260215-rust-fault-inject-bc62f1083502
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6869; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=fu96CL7CFllm65V5uP9SDCGOyAYmq+CjGDfd+DvVaeQ=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIs7UICYBJrsbg1Q+mDk+PNF3dm5gJoq9lEfqE
 /NB12oJNnCJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLO1AAKCRD6UCkIqsW9
 0MHBD/4tkoAlOSgmDmQj/PDoFPK2Kz26UWJgRCL3O5i5FOH6O9EhnXpzOjUIV65cFYD7WSVEfq9
 nFHWM2QwPa0lC53SsMpEsRmQy2m4LjTpIey34OsAt89QKAzXwDMOeuumxaB4rYfwu/RhXUsSBmX
 RA2XL1/OkpQUxxrNbQQxa2r90vq/GxY4g4MfWlXqu+71L974x/FUvfVy0qRTifaaxOKeIA/cEwz
 L4sRNuyUDSMXZh0biOvrbrwuN7RG3Be2e8D3GaHyqu0Wus+gmvW0hDLnkD09+yKqVp1DafBwc0Y
 bo+mr4NgXOheX2Cl/z1gs3oPoDiXQIYwdI/MlvjRDB3/1T7L4mK5MckyWCAA/0mtofH5s6QrG/N
 ow3jFXdEMXhjHAevKz7/1zmxU01I9hz5plp0NjWRaoQpm82XZ4wnNlVikwMABLlUuYdS0KlGp4v
 3aNGJ9ZI6f240DlXXRk201wROFesrupZ21v2ZxPJxa9yTlPfyhYTiA29FIPZRVpt72Xc+Lm2zF0
 rGejizgc7xRgaI2vGiOczXR2Y58X/qHbEBvarECqcHUvhf4yN+UiHEshSmppqX9xy1dQqO11s2R
 E3n9sc/HCaRnJ7NwX7aN7OrLXMd8RM2ufyotRaCJtiB0Td+jtTY0CADuL89F9zBpPMxK0hMu/L/
 vV3JKowl6HmKSQg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a way for Rust code to create fault-injection control points. The
control points can be attached to a configfs tree as default groups and
controlled from user space. On the kernel side, provide a `should_fail`
method to query if an operation should fail.

Cc: Akinobu Mita <akinobu.mita@gmail.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
This patch is a dependency for the rust null block driver fault
injection feature.
---
Changes in v2:
- Mark `should_fail` as `#[inline]` (Gary).
- Expand `should_fail` rustdoc to describe the `size` parameter,
  including the negative-`size` replenish semantics, and link to the
  fault injection documentation (Gary).
- Link to v1: https://msgid.link/20260215-rust-fault-inject-v1-1-6ec459cb5ccb@kernel.org

To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/fault_injection.rs  | 101 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 104 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 446dbeaf0866..bfa5153d2ce8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -57,6 +57,7 @@
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/fdtable.h>
+#include <linux/fault-inject.h>
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
diff --git a/rust/kernel/fault_injection.rs b/rust/kernel/fault_injection.rs
new file mode 100644
index 000000000000..4a9468536767
--- /dev/null
+++ b/rust/kernel/fault_injection.rs
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Fault injection capabilities infrastructure.
+//!
+//! This module provides a Rust API for the kernel fault injection framework.
+//! Fault injection allows simulation of failures in kernel code paths to test
+//! error handling.
+//!
+//! [`FaultConfig`] represents a fault injection control point that can be:
+//!
+//! - Attached to a configfs tree as a default group, allowing userspace control
+//!   of fault injection parameters.
+//! - Queried via [`FaultConfig::should_fail`] to determine if an operation
+//!   should be simulated as failing.
+//!
+//! Please see the [fault injection documentation] for details on configuring
+//! and using fault injection from userspace.
+//!
+//! C header: [`include/linux/fault-inject.h`](srctree/include/linux/fault-inject.h)
+//!
+//! [fault injection documentation]: srctree/Documentation/fault-injection/fault-injection.rst
+
+use crate::{prelude::*, types::Opaque};
+
+/// A fault injection control point.
+///
+/// This type wraps a `struct fault_config` from the C fault injection
+/// framework. It provides a way to create controllable fault injection points
+/// that can be configured via configfs.
+///
+/// When attached to a configfs subsystem as a default group, userspace can
+/// configure fault injection parameters through the configfs interface. The
+/// kernel code can then query [`FaultConfig::should_fail`] to determine
+/// whether to simulate a failure.
+///
+/// # Invariants
+///
+/// - `self.inner` is always a valid `struct fault_config`.
+#[pin_data]
+pub struct FaultConfig {
+    #[pin]
+    inner: Opaque<bindings::fault_config>,
+}
+
+impl FaultConfig {
+    /// Create a new [`FaultConfig`].
+    ///
+    /// If attached to a configfs group, this [`FaultConfig`] will appear as a directory named
+    /// `name`.
+    pub fn new(name: &CStr) -> impl PinInit<Self> + use<'_> {
+        pin_init!(Self {
+            // INVARIANT: `self.inner` is initialized in ffi_init.
+            inner <- Opaque::zeroed().chain(|inner| {
+                let ptr = inner.get();
+                // SAFETY: `ptr` points to a zeroed allocation and the second argument is null
+                // terminated string.
+                unsafe { bindings::fault_config_init( ptr, name.as_char_ptr()) };
+                Ok(())
+            }),
+        })
+    }
+}
+
+impl kernel::configfs::CDefaultGroup for FaultConfig {
+    fn group_ptr(&self) -> *mut bindings::config_group {
+        // SAFETY: By type invariant, `self.inner` is valid.
+        unsafe { &raw mut (*self.inner.get()).group }
+    }
+}
+
+impl FaultConfig {
+    /// Query for failure.
+    ///
+    /// Returns `true` if the operation should fail.
+    ///
+    /// `size` is the amount of the resource consumed by the operation. It is subtracted from the
+    /// configured `space` budget on each call, and failure injection is suppressed while `space` is
+    /// greater than `size`. For allocation-style users this is typically the number of bytes; users
+    /// that inject based on the number of operations performed pass `1`. A negative `size`
+    /// replenishes the `space` budget by `-size` (i.e. grows the budget) and suppresses the failure
+    /// for that call.
+    ///
+    /// See the `space` field in the [fault injection documentation] for
+    /// details.
+    ///
+    /// [fault injection documentation]: srctree/Documentation/fault-injection/fault-injection.rst
+    #[inline]
+    pub fn should_fail(&self, size: isize) -> bool {
+        // SAFETY: By type invariant, self is always valid.
+        let attr = unsafe { &raw const (*self.inner.get()).attr };
+
+        // SAFETY: By type invariant, self is always valid.
+        unsafe { bindings::should_fail(attr.cast_mut(), size) }
+    }
+}
+
+// SAFETY: FaultConfig can be used from any task.
+unsafe impl Send for FaultConfig {}
+
+// SAFETY: FaultConfig applies internal synchronization.
+unsafe impl Sync for FaultConfig {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b72b2fbe046d..8ba0083139b6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -67,6 +67,8 @@
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
 pub mod error;
+#[cfg(all(CONFIG_FAULT_INJECTION, CONFIG_FAULT_INJECTION_CONFIGFS))]
+pub mod fault_injection;
 pub mod faux;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;

---
base-commit: 9e0898f1c0f134c6bad146ca8578f73c3e40ac0a
change-id: 20260215-rust-fault-inject-bc62f1083502
prerequisite-change-id: 20260215-configfs-c-default-groups-bdb0a44633a6:v2
prerequisite-patch-id: 03b8e71b79be89a73946f3c1f7248671c28ccd42

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


