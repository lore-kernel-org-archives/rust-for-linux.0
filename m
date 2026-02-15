Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6182386331;
	Sun, 15 Feb 2026 21:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771191041; cv=none; b=sq5kCt92FFkLmRgFa5WCsVLb/k2qCq0u5j04Dsrarrkp1V2tDGPU+l0OdQJx7H2pAQUkrwvM8LuPa0Ppf2dOs333GFxIih9iRqB7rlijRDaYyWbdMRxyu8BmOtcx+HkybXh4xmwn7VImbiA+35bIWCK+tdb+epne0YoXxoMVggY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771191041; c=relaxed/simple;
	bh=/sHvRvae+p0dPT4sqnZh5zctCPyR7N5Q8o/npXE3YCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nnX86VCEbAkcLE3uxL8FEvkc9cTyFdtq8hPYwTSBpxHbGtnfgokaMl/G4IdPYYbbdTh170d6uTwrJH2JzO3ffp0DSAnW8nHNySOCcRwdrWdGzKaBCnFVTdmykBoyhBDSWlMaDfdRaF5/DZDjR49Fz6f4QWJuUWLzMG8h5eC8cN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwD8U0aX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwD8U0aX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DF1C4CEF7;
	Sun, 15 Feb 2026 21:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771191041;
	bh=/sHvRvae+p0dPT4sqnZh5zctCPyR7N5Q8o/npXE3YCM=;
	h=From:Date:Subject:To:Cc:From;
	b=MwD8U0aX0ncCrlx76jH7nrq92F03iZf5KLRGGe0a6GRY884TDikZTUucjAWDkpvOY
	 qEWxoJ/iCsVur1KmVZkeJ4kosKC7BsJaLWIJBDyBjy2W4t2628Z8nolYwEz63g5Sut
	 XDYC8ymj55LWPy3lAyo6ReOEFWmrYIfGyRvBk4Atm1ITKYjN29/ZQ1N4gLEzhWePUT
	 lvXtLmjM/drEM6ESvy/OjsI8NoglI+LBHSXUyLAVNQ/uoJ+8AAivdX3Pyf7aRfQcD6
	 Z7CMKfNhf0wiNkg224OvOjU+tymv80/VGovJpIOAbRnqHTPHFAG1QsiajvZq/xiCsM
	 E22I9CTAgfVHQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 22:30:16 +0100
Subject: [PATCH] fault-inject: rust: add a Rust API for fault-injection
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-rust-fault-inject-v1-1-6ec459cb5ccb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOc6kmkC/02NywqDMBBFf0Vm3SlJ1ND6K8VFjBM7pT6ahxTEf
 2+oULo8F+45GwTyTAGaYgNPKweepwzyVIC9m2kg5D4zKKG0ULJGn0JEZ9IzIk8PshE7q5WT4lL
 WQkH+LZ4cv7/OW3uwp1fK6niM0JlAaOdx5NgUqz7LK/z3muJXs/PkeHABLfZ0VAc/pyVg13fCV
 JUuS6ObVUK77x8rd/OZzQAAAA==
X-Change-ID: 20260215-rust-fault-inject-bc62f1083502
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=/sHvRvae+p0dPT4sqnZh5zctCPyR7N5Q8o/npXE3YCM=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkjrosTQqJ8hZP17r9kiNxTRFZ+orlOsXPN301
 XXDtGJUDRWJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZI66AAKCRDhuBo+eShj
 d9rhEAC1dZqrsUhCremdZMeeKCUdE/Nbs6LGc70KVrpzwKLW0dV3aGQnB3PXwpB/j0Fc3yYAA2n
 RnyEQAwqOYm2FVcNghCzUyTFvbiHqPJQ9fZZZlpr5PtTbld/SHf6HMJGAEib0sE0Z60gxxrN0AK
 3xyp/zj8Wi9mMyxB2bhzkOSdYXR0BGs5Wj08AuSvD76D7aamp9dDs2aGpCsXjbxz5e72iOX6COy
 NX+MO++oD64uJsyTYbMOjBdorKr5mkJ7EAaGZgBI+3WJZYkIAbnW/MvEjr9KoS0yr5jrrWwIsSi
 8p26V3q0HERprsnQx9yJSAfcjfonSpDyPb8j4VwIUelTA69WEdgTKJevDiW0Ofr48J1STEsb6w6
 AlzECviy59ZTXrhKrnRNDW4DjVf/FsLhZufbRq6P3YXz2uR6rvQGxNoEE6j34LX85g+PvGs7PZX
 oUPtxuoAkbePG4uSoK+xvXUXjrpnNbqVhY6k8marb1HYEyec/By5v5G8kyjn9/WIx6aH1AukNxx
 Z5dhE3fUeDy/0m/hrK8ChsQ+CqDQcoan7g4FPObv3SiouklKid7bu3yKxK5xdSasxtEpC0IePjb
 D4SbcMpefQYba/R9EEQS3yx7OAIem4+EFj/FvcUsXlnm0Jn7e+K2RE4mRfH8H1wK7fvxuNvSXye
 sjNpJWlyN8KFNcQ==
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
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/fault_injection.rs  | 88 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  2 +
 3 files changed, 91 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422..87cbaf69d330e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -54,6 +54,7 @@
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/fdtable.h>
+#include <linux/fault-inject.h>
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
diff --git a/rust/kernel/fault_injection.rs b/rust/kernel/fault_injection.rs
new file mode 100644
index 0000000000000..e9afa3ca6cf31
--- /dev/null
+++ b/rust/kernel/fault_injection.rs
@@ -0,0 +1,88 @@
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
+                unsafe { bindings::fault_config_init( ptr, name.as_ptr().cast()) };
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
+    /// Returns true if the operation should fail.
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
index f812cf1200428..1b8f1a216a268 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -92,6 +92,8 @@
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
 pub mod error;
+#[cfg(all(CONFIG_FAULT_INJECTION, CONFIG_FAULT_INJECTION_CONFIGFS))]
+pub mod fault_injection;
 pub mod faux;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;

---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260215-rust-fault-inject-bc62f1083502
prerequisite-change-id: 20260215-configfs-c-default-groups-bdb0a44633a6:v1
prerequisite-patch-id: 5c82dc0deb0768531d2cdb24ac5e92857c9e76a7

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


