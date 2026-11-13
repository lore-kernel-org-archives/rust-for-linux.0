Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580426;
	b=zR9lqm34ynenqEg1kAe9dZnTnhJRxWlAeAzJ5jZ9XefjHn5YobFF5dF90j+L1pnluu2S
	 7ulf1ptV8eS73cZAZFm0KbuiSMNc95fqZDgl2NCaOct9inyJE7IRjk5KXtDBYHNN5BI+i
	 KFokYO7f2J5sdClVrxJxEWjbHRnFiKAxvAW3xD++LR9qhaS3cX7zSFKl5x3MjwGmcgGHp
	 MUYLQ7MnE1XmJWHlUAQFVIbsPDDWrmJlRi4bZTOUxLzoZoaO6V+nTT/tGlZvZW/rqShAR
	 GGuofMtHrSVopVmEH9FNieF+2kO9v56gQ/cBWwo6f9PV9EGR7dby4NH/aIB/GbwpPaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580426;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=k0T2Lc6Sr5hzKs1mLEzVbNR2mHsTP4yzCdeEAUV8XqM=;
	b=TUeCz6FRIIv6etABIaXxODgQUiZ9bgByMv95f0OBy8yxeE+YrAwSdL/GNodri62gGVHP
	 dz7vMk1u/TAB6E4I9iEKSJMQ7LuVrsY+Ref/tOVKwEhuynHh5IHIKJmftT6lawH8QRkLD
	 IV1zg0txtt5HU9E4p1yZfFYZ8cheZqbagZR0OHCBrqMcj29A7ODj5S2a4trcRdP2yQQNm
	 85J3yQmzxhMPnZDMGeerwo2vU0FM+uUqZxr5HchEPGtmNufA+/WKSutkjQ5SMlNe2YWnL
	 p0BD9WGHqkjSxJwLGhV9FbRuJJekuZmOF9ghsA2a2sb3ykbBpaL14a4Q5tr7yY7GEww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCoxRQ4u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D3460A3814;
	Fri, 13 Nov 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCoxRQ4u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB221F000C4;
	Fri, 13 Nov 2026 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794580425;
	bh=k0T2Lc6Sr5hzKs1mLEzVbNR2mHsTP4yzCdeEAUV8XqM=;
	h=From:Date:Subject:To:Cc;
	b=fCoxRQ4ufHptrQ6sZINRlRspiLS7xO9UtBVzT7naiKzhMzDvG2SwDBnFNhu7ZZjYk
	 l/qRtL6itj1P+e+AdkSQ+rrVkXssxC6lGJ8q6hNJVRISHMYzR0W5mQpstPsCf5gOeD
	 NzLz36moX4UVlxtQmWQ7OzVhWnFltzb42dKG2LUQ4bI74J/8hYQhjCp58E/BqLAeGu
	 fIhFCPudbMsUZ+PIwMQy1usCwZNXH4W0Kowl/wvaPEEN05m+bGrfMCL/cbe31akzaO
	 CivSd7Mo5/97xwUQKw+HEVB4rTB3enxx6TxJtvcZ0BRIkGWgJ0lD1ogwibQ9B1jZgp
	 0n+YAwSyAI/bw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 13 Nov 2026 15:33:20 +0100
Subject: [PATCH v3] fault-inject: rust: add a Rust API for fault-injection
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-rust-fault-inject-v3-1-d8bd240f22dc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAK8f92oC/32PQW7DIBBFr2Kx7kQYY+J4lXtUWcB4cGgTkwJGq
 SLfvS6WUlWquvxf+u/NPFik4CiyvnqwQNlF56c1NC8Vw7OeRgI3rJkJLhQXdQthjgmsni8J3PR
 GmMCgErbmXdNywdbdLZB198J8PW050Me8otNWMqMjAfrr1aW+yvudhIBl+lT21VOIfrJutBEQB
 trEY/DzLYIZDNdSqqbRqs+SfcvOLiYfPss/uS62f07PNdSgCGV7QNMimuM7hYkuOx/GgsviB6H
 4nwixIrS2h33XdQ2i+IVYluULV9fyLGMBAAA=
X-Change-ID: 20260215-rust-fault-inject-bc62f1083502
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10673;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=sJoapAZau0HZb8zEeaYt2COHHQ3lrbJIF2CsHwFvMUM=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq9x+xkXO2QETVczxS1475tcq9x1rDmbGWIzDgL
 NnB7mAlGK6JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavcfsQAKCRD6UCkIqsW9
 0NRrD/4y0B/o4HzQ3gss4CDP5zpQ1J3assh1i7HkQ6s8e1YbnvaoQfsHaKQDPYzfNYoB5z62dOS
 fZPlEvdKOOlshKRguJND1yebdn6tQeleuHOqzR3WAogfMYAdod96kke5mVaw+FCjswXnmRMPuVc
 t17hzlNvMKE7JaGiLlvqDO3ajHPkPN6LJr1JtuxRj8sTVaO+8GQvU7vhWYCcGQjIuFqS8Nqx0WT
 sdLgonnrCs+LOR6D38vyPLq4gPFeexi/gR5WWZqypMgPP6OOAGqFsSifjwnZWWIs1HZbqe+M3EH
 FTOe7YDtdT6rm//rn8eTr6tavv1r1Dmu94VjD8ATHHMLdVQ0q37/EtzBqPlWnyBbg+6LsQLX+GD
 bFyvWl2UjZPNNAw1QnpCRojRXk/G+h1jzkSoVr2D2UdyPd0I+1mM45rbOcPcb9ob19J00A2ieK1
 gVRJbJaGaKHBxLVrt8ZXKxZy4Hb+MB0HhWCVh9fIppccO5UuppTIvZNky6dcV6K7Ya/kItqrjfq
 ZqzNKOv+Dy4ceggki48TA60wthnP2/FI37kSPsmldKmHHIJQVX7kF5nyweU2BNuvbnZ95xOQPdT
 zSOzsMsuYzGY5ybNHDsMkmFf429G/nLXyq5iNVuuSDWjqILXajFWXCeKUM5qNVnj+YvRK60eW3d
 NAAr+ltKALUYvqQ==
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
Changes in v3:
- Sort the `fault-inject.h` include in `bindings_helper.h` (Miguel).
- Use backticks for `FaultConfig` and `self` in code comments (Miguel).
- Link to [`true`] in the `should_fail` rustdoc (Miguel).
- Replace the stale `INVARIANT` comment that referred to a no longer
  existing `ffi_init` call (Miguel).
- Add a `PinnedDrop` for `FaultConfig` that releases the reference on the
  embedded `struct config_item` acquired by `fault_config_init`. Nothing
  released it before, so creating a `FaultConfig` and dropping it leaked
  the resources configfs associated with the item, including the name
  allocation for names of 20 bytes or more.
- Implement `CDefaultGroup` as an unsafe trait, following the configfs
  change, and document why `FaultConfig` meets the requirements.
- Document the remaining `CDefaultGroup` safety requirement, that
  the implementer never attaches the group itself.
- Say what the `Send` and `Sync` impls rely on instead of claiming
  that `struct fault_attr` applies internal synchronization.
- Add an example for the module.
- Link the module documentation to `UnattachedGroup` and
  `Group::new`.
- Gate the module on `FAULT_INJECTION_CONFIGFS` alone, merge the
  two `impl FaultConfig` blocks and drop a `cast_mut`.
- Link to v2: https://msgid.link/20260605-rust-fault-inject-v2-1-aaf978883cc2@kernel.org

Changes in v2:
- Mark `should_fail` as `#[inline]` (Gary).
- Expand `should_fail` rustdoc to describe the `size` parameter,
  including the negative-`size` replenish semantics, and link to the
  fault injection documentation (Gary).
- Link to v1: https://msgid.link/20260215-rust-fault-inject-v1-1-6ec459cb5ccb@kernel.org
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/fault_injection.rs  | 144 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 147 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..08a10a7214b0 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -58,6 +58,7 @@
 #include <linux/dma-resv.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
+#include <linux/fault-inject.h>
 #include <linux/fdtable.h>
 #include <linux/file.h>
 #include <linux/firmware.h>
diff --git a/rust/kernel/fault_injection.rs b/rust/kernel/fault_injection.rs
new file mode 100644
index 000000000000..a7d30451fd71
--- /dev/null
+++ b/rust/kernel/fault_injection.rs
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Fault injection capabilities infrastructure.
+//!
+//! This module provides a Rust API for the kernel fault injection framework. Fault injection allows
+//! simulation of failures in kernel code paths to test error handling.
+//!
+//! [`FaultConfig`] represents a fault injection control point that can be:
+//!
+//! - Attached to a configfs tree as a default group, allowing userspace control of fault injection
+//!   parameters. Wrap it in an [`UnattachedGroup`] and pass that to [`Group::new`].
+//! - Queried via [`FaultConfig::should_fail`] to determine if an operation should be simulated as
+//!   failing.
+//!
+//! Please see the [fault injection documentation] for details on configuring and using fault
+//! injection from userspace.
+//!
+//! C header: [`include/linux/fault-inject.h`](srctree/include/linux/fault-inject.h)
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::configfs::UnattachedGroup;
+//! use kernel::fault_injection::FaultConfig;
+//!
+//! // The token grants permission to attach the control point to a `configfs::Group` as a
+//! // default group. Pass it to `configfs::Group::new`.
+//! let control_point = UnattachedGroup::new(FaultConfig::new(c"timeout_inject"), GFP_KERNEL)?;
+//!
+//! // Keep a handle for querying the control point from the code path under test.
+//! let timeout_inject = control_point.clone_arc();
+//!
+//! // A control point does not inject failures until userspace sets a non-zero probability.
+//! assert!(!timeout_inject.should_fail(1));
+//! # Ok::<(), Error>(())
+//! ```
+//!
+//! [fault injection documentation]: srctree/Documentation/fault-injection/fault-injection.rst
+//! [`UnattachedGroup`]: kernel::configfs::UnattachedGroup
+//! [`Group::new`]: kernel::configfs::Group::new
+
+use crate::{prelude::*, types::Opaque};
+
+/// A fault injection control point.
+///
+/// This type wraps a `struct fault_config` from the C fault injection framework. It provides a way
+/// to create controllable fault injection points that can be configured via configfs.
+///
+/// When attached to a configfs subsystem as a default group, userspace can configure fault
+/// injection parameters through the configfs interface. The kernel code can then query
+/// [`FaultConfig::should_fail`] to determine whether to simulate a failure.
+///
+/// # Invariants
+///
+/// - `self.inner` is always a valid `struct fault_config`.
+/// - `self` owns the reference on the `struct config_item` embedded in `self.inner.group` that
+///   `fault_config_init` acquired.
+#[pin_data(PinnedDrop)]
+pub struct FaultConfig {
+    #[pin]
+    inner: Opaque<bindings::fault_config>,
+}
+
+#[pinned_drop]
+impl PinnedDrop for FaultConfig {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: By type invariant, `self.inner` is a valid `struct fault_config`, so the embedded
+        // `struct config_item` is initialized, and `self` owns the reference that
+        // `fault_config_init` acquired on it.
+        //
+        // `fault_config_type` does not install a `release` operation, so this does not free the
+        // allocation backing `self`. It only releases the resources that configfs associated with
+        // the item.
+        unsafe { bindings::config_item_put(&raw mut (*self.inner.get()).group.cg_item) };
+    }
+}
+
+impl FaultConfig {
+    /// Create a new [`FaultConfig`].
+    ///
+    /// If attached to a configfs group, this [`FaultConfig`] will appear as a directory named
+    /// `name`.
+    pub fn new(name: &CStr) -> impl PinInit<Self> + use<'_> {
+        pin_init!(Self {
+            // INVARIANT: The allocation is zeroed and `fault_config_init` initializes the
+            // embedded `struct config_group`, so `self.inner` is a valid `struct fault_config`.
+            inner <- Opaque::zeroed().chain(|inner| {
+                let ptr = inner.get();
+                // SAFETY: `ptr` points to a zeroed allocation and the second argument is null
+                // terminated string.
+                unsafe { bindings::fault_config_init(ptr, name.as_char_ptr()) };
+                Ok(())
+            }),
+        })
+    }
+
+    /// Query for failure.
+    ///
+    /// Returns [`true`] if the operation should fail.
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
+        // SAFETY: By type invariant, `self` is always valid.
+        let attr = unsafe { &raw mut (*self.inner.get()).attr };
+
+        // SAFETY: By type invariant, `self` is always valid.
+        unsafe { bindings::should_fail(attr, size) }
+    }
+}
+
+// SAFETY: `fault_config_init` initializes the embedded `struct config_group` with
+// `config_group_init_type_name`, and by type invariant `self.inner` stays a valid `struct
+// fault_config` in place for as long as `self` is live. `group_ptr` returns a pointer to a field of
+// `self.inner`, so it returns the same pointer on every call. By type invariant, `self` owns the
+// reference on the embedded `struct config_item` and releases it when dropped. No method of
+// `FaultConfig` adds the group as a default group of any group.
+unsafe impl kernel::configfs::CDefaultGroup for FaultConfig {
+    fn group_ptr(&self) -> *mut bindings::config_group {
+        // SAFETY: By type invariant, `self.inner` is valid.
+        unsafe { &raw mut (*self.inner.get()).group }
+    }
+}
+
+// SAFETY: `FaultConfig` has no task affinity. The only operation it performs outside of
+// `should_fail` is the `config_item_put` in `PinnedDrop`, which may run in any task.
+unsafe impl Send for FaultConfig {}
+
+// SAFETY: The only method taking `&self` is `should_fail`, which the C fault injection framework
+// supports calling concurrently from any task. The `times` and `space` counters it updates are
+// atomics, and the verbose reporting path is serialized by `attr.ratelimit_state`. The remaining
+// fields of `struct fault_attr` are plain integers that C races against concurrent configfs
+// stores by design: they are statistical knobs and an inexact call counter.
+unsafe impl Sync for FaultConfig {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1ab41129d557..156074709ed1 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -73,6 +73,8 @@
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
 pub mod error;
+#[cfg(CONFIG_FAULT_INJECTION_CONFIGFS)]
+pub mod fault_injection;
 pub mod faux;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;

---
base-commit: fd9230005e85472b81c1c7c16afe93dd878996b1
change-id: 20260215-rust-fault-inject-bc62f1083502
prerequisite-change-id: 20260215-configfs-c-default-groups-bdb0a44633a6:v4
prerequisite-patch-id: 54d13c089786f6c33633e3df846ae2a573542dd6

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


