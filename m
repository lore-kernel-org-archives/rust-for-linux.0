Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6761F31B833
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 17:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361408; cv=none; b=WrqnQPZwCoqTmsWMCLGVjCOVRT+xnrzLi4E3mS3wB6rw4hs/klHHuRBtdoLAzjP59HfCy+cJRTbW827VtHtn4AU4Xs0KWgkGqRDLcSp5P8iXFaGCELa+tr8/JaW6WVNVGjZXb3Mjh8ZFX6FJSUW9jfHS+tgoHYmWXHQSYAXrEoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361408; c=relaxed/simple;
	bh=sal4yMiAc+eT7vJjdvwQ7GQkLASexEB9wg1620xfgT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L0wb+cSEdd7yiyNzWffe6oGYOyi1+lkB3F5zo4SrMr/MeW+tIIiJceWP7HkR1s0yS5Deud49N38RcqqqMONnINWn2as479iHZao0JEJ7CgJmmcm89irtrzUa668zb2rnYXc1IvO+J2KS4uSXKLOBtpmZSHYVINlxVejDqN+V2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=sdZBXX32; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="sdZBXX32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1776361401; x=1776620601;
	bh=kOb3PZxaEkgAoIkp3O/NYJ+mJCTYGE92nRe9BIXjXqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sdZBXX328ErNCXAjGJbOanZj3qi3E1lC2+bGzo194thTItikHOKSgGQiEJUReEHqC
	 +sTcFWQOdAhuJrJ4iL7QR+YfzwMua2qETwK3l3EkjTPCIoAd0aU+sIJUiwRqfIyvBL
	 gzx30nMfhvpCaLGbIxlbUm0eLkY8MVrTG03FqDVTXsf3Zw3sModtvljvHIabfNOp0j
	 3yfTYL56WpYaRbd3+Wne6JYCANSONQTWr33oLDTPg10RLXQyAUuOnUqNdCT/o0dA/M
	 7mlZpl3YFEuQjg5KPj/iM0ByQgi7H5jkwauD3gye1rypI8wQyJMFaBH5bK92RYhFUs
	 fgDlG/geqURyg==
X-Pm-Submission-Id: 4fxQN45KRMz2ScCq
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 RESEND 1/4] rust: add SRCU abstraction
Date: Thu, 16 Apr 2026 20:43:07 +0300
Message-ID: <20260416174308.221235-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260416171728.205141-1-work@onurozkan.dev>
References: <20260416171728.205141-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a Rust abstraction for sleepable RCU (SRCU), backed by
srcu_struct. Provide FFI helpers and a safe wrapper with a
guard-based API for read-side critical sections.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/helpers/helpers.c   |   1 +
 rust/helpers/srcu.c      |  18 +++++++
 rust/kernel/sync.rs      |   2 +
 rust/kernel/sync/srcu.rs | 109 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 rust/helpers/srcu.c
 create mode 100644 rust/kernel/sync/srcu.rs

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 875a9788ad40..052fef89d5f0 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -60,6 +60,7 @@
 #include "signal.c"
 #include "slab.c"
 #include "spinlock.c"
+#include "srcu.c"
 #include "sync.c"
 #include "task.c"
 #include "time.c"
diff --git a/rust/helpers/srcu.c b/rust/helpers/srcu.c
new file mode 100644
index 000000000000..b372b733eb89
--- /dev/null
+++ b/rust/helpers/srcu.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/srcu.h>
+
+__rust_helper int rust_helper_init_srcu_struct(struct srcu_struct *ssp)
+{
+	return init_srcu_struct(ssp);
+}
+
+__rust_helper int rust_helper_srcu_read_lock(struct srcu_struct *ssp)
+{
+	return srcu_read_lock(ssp);
+}
+
+__rust_helper void rust_helper_srcu_read_unlock(struct srcu_struct *ssp, int idx)
+{
+	srcu_read_unlock(ssp, idx);
+}
\ No newline at end of file
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e..0d6a5f1300c3 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -21,6 +21,7 @@
 pub mod rcu;
 mod refcount;
 mod set_once;
+pub mod srcu;
 
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use completion::Completion;
@@ -31,6 +32,7 @@
 pub use locked_by::LockedBy;
 pub use refcount::Refcount;
 pub use set_once::SetOnce;
+pub use srcu::Srcu;
 
 /// Represents a lockdep class.
 ///
diff --git a/rust/kernel/sync/srcu.rs b/rust/kernel/sync/srcu.rs
new file mode 100644
index 000000000000..cf0c16248ea3
--- /dev/null
+++ b/rust/kernel/sync/srcu.rs
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Sleepable read-copy update (SRCU) abstraction.
+//!
+//! C header: [`include/linux/srcu.h`](srctree/include/linux/srcu.h)
+
+use crate::{
+    bindings,
+    error::to_result,
+    prelude::*,
+    types::{
+        NotThreadSafe,
+        Opaque, //
+    },
+};
+
+use pin_init::pin_data;
+
+/// Creates an [`Srcu`] initialiser.
+#[macro_export]
+macro_rules! new_srcu {
+    () => {
+        $crate::sync::Srcu::new()
+    };
+}
+
+/// Sleepable read-copy update primitive.
+///
+/// SRCU readers may sleep while holding the read-side guard.
+#[repr(transparent)]
+#[pin_data(PinnedDrop)]
+pub struct Srcu {
+    #[pin]
+    inner: Opaque<bindings::srcu_struct>,
+}
+
+impl Srcu {
+    /// Creates a new SRCU instance.
+    pub fn new() -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            inner <- Opaque::try_ffi_init(|ptr: *mut bindings::srcu_struct| {
+                // SAFETY: `ptr` points to valid uninitialised memory for a `srcu_struct`.
+                to_result(unsafe { bindings::init_srcu_struct(ptr) })
+            }),
+        })
+    }
+
+    /// Enters an SRCU read-side critical section.
+    pub fn read_lock(&self) -> Guard<'_> {
+        // SAFETY: By the type invariants, `self.inner.get()` is a valid initialized `srcu_struct`.
+        let idx = unsafe { bindings::srcu_read_lock(self.inner.get()) };
+
+        Guard {
+            srcu: self,
+            idx,
+            _nts: NotThreadSafe,
+        }
+    }
+
+    /// Waits until all pre-existing SRCU readers have completed.
+    pub fn synchronize(&self) {
+        // SAFETY: By the type invariants, `self.inner.get()` is a valid initialized `srcu_struct`.
+        unsafe { bindings::synchronize_srcu(self.inner.get()) };
+    }
+
+    /// Waits until all pre-existing SRCU readers have completed, expedited.
+    ///
+    /// This requests a lower-latency grace period than [`Srcu::synchronize`] typically
+    /// at the cost of higher system-wide overhead. Prefer [`Srcu::synchronize`] by default
+    /// and use this variant only when reducing reset or teardown latency is more important
+    /// than the extra cost.
+    pub fn synchronize_expedited(&self) {
+        // SAFETY: By the type invariants, `self.inner.get()` is a valid initialized `srcu_struct`.
+        unsafe { bindings::synchronize_srcu_expedited(self.inner.get()) };
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for Srcu {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: `self` is pinned and `inner` contains a valid initialized `srcu_struct`.
+        unsafe { bindings::cleanup_srcu_struct(self.as_ref().get_ref().inner.get()) };
+    }
+}
+
+// SAFETY: `srcu_struct` may be shared and used across threads.
+unsafe impl Send for Srcu {}
+// SAFETY: `srcu_struct` may be shared and used concurrently.
+unsafe impl Sync for Srcu {}
+
+/// Guard for an active SRCU read-side critical section on a particular [`Srcu`].
+pub struct Guard<'a> {
+    srcu: &'a Srcu,
+    idx: core::ffi::c_int,
+    _nts: NotThreadSafe,
+}
+
+impl Guard<'_> {
+    /// Explicitly exits the SRCU read-side critical section.
+    pub fn unlock(self) {}
+}
+
+impl Drop for Guard<'_> {
+    fn drop(&mut self) {
+        // SAFETY: `Guard` is only constructible through `Srcu::read_lock()`,
+        // which returns a valid index for the SRCU instance.
+        unsafe { bindings::srcu_read_unlock(self.srcu.inner.get(), self.idx) };
+    }
+}
-- 
2.51.2

