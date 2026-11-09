Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220672;
	b=CApqymCbrnSLrVhZuRzwqDggSCOTVi5A1bK2vq+UB4ws1/f9NrhqpWor9XlNwCy3HoBN
	 yuJwxxgtfx0zWAlE890I6vZtRah7QveMgawyuPBgaXpU9VIFtIc8voqciEOjxEpCN6sWj
	 zlTjkv4WsqX5ZDztSNxRP7zSPi/FPXxLuamCTDcQ1/3mQQbcgeuJYBMQ8/LxHjOEtfCL7
	 xSoS4xNyWEWlEYP0UsdFBnPIYasEqIKul+d6fs1fi1ehwJERnaslbMjvm8YlhR+F2SdBQ
	 O/CBHu5E+GFM9fyu+1encFdDdY6FMn7Jv9hPcBY7gqohDaRIyBuiBokQK+jcTnipXQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220672;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=xbcNo0/rnuBM5wJGfNyGdFehZhggjUnSXRwxKOG4DmI=;
	b=DYYJxqhgept5k8zgv17k22amGZTcmlDtQiYpexXWrJgU7hiJx4vRgMJOvDxPyJcKOIgS
	 1q1hcOk93ShyJz6mnxYYH3gXRSTUkiJH2eihurNySnhZhY1wyKSJqLNZjuuLJuglr/S+n
	 ceG4Dh3kIi2+hOQGXKZEMktPldcnXVzCGgR0qJEp/F40Z+wZG0S/CVy3O9klx+u09pVww
	 JO96+vfXHYAeWftS66JBsh9B1p+3CBJxD5u6+kH0qOfQMXNmABpUmoxt3VS9uoygoGlkI
	 XbVjl0d4xZHTUkYkMjeMjyJ5+aqC+x40s9hkCZz5nKljDDCmlDds+dKjhLISxzjJp+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvS4nq9a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C067E606A321;
	Mon,  9 Nov 2026 10:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MvS4nq9a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F411F0089F;
	Mon,  9 Nov 2026 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794220671;
	bh=xbcNo0/rnuBM5wJGfNyGdFehZhggjUnSXRwxKOG4DmI=;
	h=From:Date:Subject:To:Cc;
	b=MvS4nq9adYoeb3uCN6ZcoLJVKfwaHzWxe8sIxWHx5ilhIwQfdunxwLL8LQucnbD89
	 b3IM1CI2KN/mGqjXffn0gM6dX8g9SM5TnYpAautoAgBBLYiKMEPkOBCdYpNMBVW7nN
	 Ma012yfiD4/bjd/ncO3hursNR1V40b0JRe7iBaTm+nwFxSDAL6lu6LEEod7byFTW7V
	 gELc3n77l/7YqnGA/8/7/uSdaoZrr0CdxIoJGur5YW2kwmaxqfaip4RyAZ3DwMKs7/
	 kPlyu9WRV9/gjUHGfOtVpTkZjeXS/g8b3JSu6DucvTjJ0XU/spc6n2DJSvrlIIethh
	 BAhbb/1XuCMPw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Nov 2026 11:37:34 +0100
Subject: [PATCH v3] rust: alloc: add per-task memalloc scope abstractions
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
Message-Id: <20261109-gfp-noio-v3-1-a573e7be9c44@kernel.org>
X-B4-Tracking: v=1; b=H4sIAG6i8WoC/22MQQ7CIBQFr9KwFgMfSqgr72FcUPppiQYaMETT9
 O7SbtTE5by8mYVkTB4zOTULSVh89jFUEIeG2MmEEakfKhNgoBgHTUc30xB9pK4fJEcuWqY1qfc
 5ofPPPXW5Vp58fsT02suFb+ufSOGU085opp2VXS/l+YYp4P0Y00i2SoGPqVj7ZUI1rTOAIJQFI
 37MdV3fDUcSX9sAAAA=
X-Change-ID: 20260128-gfp-noio-fbd41e135088
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10687;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=GVUMMKcMgO+0fxm2krAWZCqkuajC/zbi6NUIv9Z/JWw=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq8aJv3oYVuuUTkfkrY+oHrQ2Agd9XvcfEnUXuF
 tMhWGhuyACJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavGibwAKCRD6UCkIqsW9
 0M0SD/wPBU2bcbArdaKdrOF0DXOgv1DPpBtLeU2wPQKCAusc1Viyn0zm9C2m9rYNUUqTsd1X8OD
 tvG1GQQcTZL9m4khjaI+uknDvgizHCK/ASWyXCVdc7FSSacWEvF0tq2zI4pLavNgtaI+36CLgMJ
 pkRPe7RxCsOp/hJNMBtBrIaEHlaAm3ihonW1LGTk1mHFQ7gp2W/auOTOG4itcyV+nRaZXYFM8cv
 sse6BOk2dstgN6uuNySr25xzJpNGYR14Vutojltm9fXqhDs1BtnJLWSYCOjSrHl6jG42goefWdK
 wDUfWwYu5A2qUD6B7BJ3FAnalFi1+rksxJLzHubreDcUEifVc3fZ2Uf+mjXkGPFgXI4KLSeBTTG
 XLwKgp3rr+ujNnt7gi8IGA6v+MiDPFIpy6zRCVBZ8kCznEgKgcQbZC6riT2n1H4HyHFeTjKEK4G
 zKg2VwR8d+25qeX2rNyk1zncdU2rn4Rg+Zzsyuvjqz+rhjAzitcaAkJ9AZCCOPTQxsAY2NYi8Mq
 Sc7IqpV43TrenEsSpFD+2h2+aIYyleBqF8oY2CVdIGBLDlbTHgJQA5DHD1CaMBED0DpEYANvsRy
 LKV5sm4OJfuP96CHfPh9nzFhYA9x167OYFyZUK4em+AyFE6/DTWPWNhZ05lZ4ssbWc3nz6DMSEd
 07yoWxO4Xa0/VwQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an abstraction for the per-task allocation policies exposed by
the kernel through paired save/restore helpers in `linux/sched/mm.h`:
`memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
`memalloc_pin`. Each pair sets a bit in `current->flags` and returns
the bits it added, which the restore call clears again. The pairing
assumes strict LIFO nesting; restoring out of order corrupts the
per-task state.

Expose each pair as an implementation of a `ScopeKind` trait on the
tag types `NoIo`, `NoFs`, `NoReclaim` and `MemallocPin`. The trait's
provided `with` method saves the policy, runs a closure and restores
the policy before returning.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v3:
- Rebase on v7.4-rc1.
- Replace the pinned `Scope` guard and `memalloc_scope!` macro with a
  closure-based `ScopeKind::with` entry point (Alice, Gary).
- Make the doctests compile and run under KUnit instead of `ignore`.
- Document that `NoReclaim` has no effect in hard interrupt context.
- Link to v2: https://msgid.link/20260605-gfp-noio-v2-1-cfa2e236c2a3@kernel.org

Changes in v2:
- Rewrite the patch to use scoped allocation flags instead of exposing
  a `GFP_NOIO` flag constant.
- Link to v1: https://lore.kernel.org/r/20260128-gfp-noio-v1-1-9a808fc49b44@kernel.org
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/mm.c               |  40 ++++++++++
 rust/kernel/alloc.rs            |   1 +
 rust/kernel/alloc/scoped.rs     | 171 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 213 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..df21b5b129a4 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -86,6 +86,7 @@
 #include <linux/refcount.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched.h>
+#include <linux/sched/mm.h>
 #include <linux/security.h>
 #include <linux/serdev.h>
 #include <linux/slab.h>
diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index b5540997bd20..1e490b57057e 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -48,3 +48,43 @@ __rust_helper void rust_helper_vma_end_read(struct vm_area_struct *vma)
 {
 	vma_end_read(vma);
 }
+
+__rust_helper unsigned int rust_helper_memalloc_noio_save(void)
+{
+	return memalloc_noio_save();
+}
+
+__rust_helper void rust_helper_memalloc_noio_restore(unsigned int flags)
+{
+	memalloc_noio_restore(flags);
+}
+
+__rust_helper unsigned int rust_helper_memalloc_nofs_save(void)
+{
+	return memalloc_nofs_save();
+}
+
+__rust_helper void rust_helper_memalloc_nofs_restore(unsigned int flags)
+{
+	memalloc_nofs_restore(flags);
+}
+
+__rust_helper unsigned int rust_helper_memalloc_noreclaim_save(void)
+{
+	return memalloc_noreclaim_save();
+}
+
+__rust_helper void rust_helper_memalloc_noreclaim_restore(unsigned int flags)
+{
+	memalloc_noreclaim_restore(flags);
+}
+
+__rust_helper unsigned int rust_helper_memalloc_pin_save(void)
+{
+	return memalloc_pin_save();
+}
+
+__rust_helper void rust_helper_memalloc_pin_restore(unsigned int flags)
+{
+	memalloc_pin_restore(flags);
+}
diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 68d80f3fa6c8..5e4c142b5682 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -6,6 +6,7 @@
 pub mod kbox;
 pub mod kvec;
 pub mod layout;
+pub mod scoped;
 
 pub use self::kbox::Box;
 pub use self::kbox::KBox;
diff --git a/rust/kernel/alloc/scoped.rs b/rust/kernel/alloc/scoped.rs
new file mode 100644
index 000000000000..6745c06d6725
--- /dev/null
+++ b/rust/kernel/alloc/scoped.rs
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Scoped allocation policies for the current task.
+//!
+//! The kernel exposes several per-task allocation policies through save/restore pairs in
+//! [`include/linux/sched/mm.h`]: `memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
+//! `memalloc_pin`. Each pair sets a bit in `current->flags` and returns the bits it added, which a
+//! later call clears again. The save/restore APIs assume strict LIFO nesting; restoring out of
+//! order corrupts the per-task state.
+//!
+//! This module exposes each policy as a [`ScopeKind`] implementation. [`ScopeKind::with`] saves
+//! the policy, runs a closure and restores the policy before returning.
+//!
+//! [`include/linux/sched/mm.h`]: srctree/include/linux/sched/mm.h
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::alloc::scoped::{NoIo, ScopeKind};
+//!
+//! // Every allocation inside the closure behaves as if `GFP_NOIO` were set, even though the call
+//! // site passes `GFP_KERNEL`.
+//! let b = NoIo::with(|| KBox::new(42_u32, GFP_KERNEL))?;
+//! assert_eq!(*b, 42);
+//! # Ok::<(), Error>(())
+//! ```
+// # Implementation details
+//
+// Since the closure used in this API is synchronous it cannot contain a suspension point, so the
+// save and restore always execute in the same call frame, on the same task, and nested scopes
+// restore in LIFO order.
+use crate::ffi::c_uint;
+
+/// A per-task allocation policy with a `memalloc_*` save/restore pair.
+///
+/// Implemented by the uninhabited types [`NoIo`], [`NoFs`], [`NoReclaim`] and [`MemallocPin`]. Use
+/// [`ScopeKind::with`] to run code under the policy.
+pub trait ScopeKind {
+    /// Begin a scope on the current task and return the flags added to `current->flags`.
+    ///
+    /// Every call must be paired with a [`restore`] call on the same task, in LIFO order with
+    /// respect to other scopes. Prefer [`with`], which arranges this automatically.
+    ///
+    /// [`restore`]: ScopeKind::restore
+    /// [`with`]: ScopeKind::with
+    fn save() -> c_uint;
+
+    /// End a scope on the current task.
+    ///
+    /// # Safety
+    ///
+    /// `prev` must be the value returned by the matching [`save`] call, the call must execute on
+    /// the same task that ran [`save`], and no scope begun after the matching [`save`] may still be
+    /// active.
+    ///
+    /// [`save`]: ScopeKind::save
+    unsafe fn restore(prev: c_uint);
+
+    /// Run `f` with this policy applied.
+    ///
+    /// The current policy is saved before `f` runs and restored when `f` returns.
+    fn with<R>(f: impl FnOnce() -> R) -> R {
+        let prev = Self::save();
+        let ret = f();
+        // SAFETY: `prev` was produced by the `save` above on this task. `f` is a synchronous
+        // closure, so it has already returned and any scope it began has already been restored.
+        unsafe { Self::restore(prev) };
+        ret
+    }
+}
+
+/// `GFP_NOIO` scope.
+///
+/// Inside [`NoIo::with`], allocations on the current task behave as if `GFP_NOIO` were set, making
+/// them safe to issue from the IO completion path.
+///
+/// Corresponds to `memalloc_noio_save` / `memalloc_noio_restore` in
+/// [`include/linux/sched/mm.h`](srctree/include/linux/sched/mm.h).
+///
+/// [`NoIo::with`]: ScopeKind::with
+pub enum NoIo {}
+
+impl ScopeKind for NoIo {
+    fn save() -> c_uint {
+        // SAFETY: Updates a per-task flag and is documented as safe from any context.
+        unsafe { bindings::memalloc_noio_save() }
+    }
+
+    unsafe fn restore(prev: c_uint) {
+        // SAFETY: Per the trait contract, `prev` is the value returned by the matching `save`, on
+        // the same task.
+        unsafe { bindings::memalloc_noio_restore(prev) };
+    }
+}
+
+/// `GFP_NOFS` scope.
+///
+/// Inside [`NoFs::with`], allocations on the current task behave as if `GFP_NOFS` were set, making
+/// them safe to issue from a filesystem critical section.
+///
+/// Corresponds to `memalloc_nofs_save` / `memalloc_nofs_restore` in
+/// [`include/linux/sched/mm.h`](srctree/include/linux/sched/mm.h).
+///
+/// [`NoFs::with`]: ScopeKind::with
+pub enum NoFs {}
+
+impl ScopeKind for NoFs {
+    fn save() -> c_uint {
+        // SAFETY: Updates a per-task flag and is documented as safe from any context.
+        unsafe { bindings::memalloc_nofs_save() }
+    }
+
+    unsafe fn restore(prev: c_uint) {
+        // SAFETY: Per the trait contract, `prev` is the value returned by the matching `save`, on
+        // the same task.
+        unsafe { bindings::memalloc_nofs_restore(prev) };
+    }
+}
+
+/// No-reclaim scope.
+///
+/// Inside [`NoReclaim::with`], allocations on the current task may dip into the memory reserves.
+/// Callers must be sure their allocations will help free more memory shortly; see the kernel C
+/// documentation for the full contract.
+///
+/// The scope has no effect in hard interrupt context, where `PF_MEMALLOC` does not grant access to
+/// the reserves; see `__gfp_pfmemalloc_flags()` in [`mm/page_alloc.c`](srctree/mm/page_alloc.c).
+///
+/// Corresponds to `memalloc_noreclaim_save` / `memalloc_noreclaim_restore` in
+/// [`include/linux/sched/mm.h`](srctree/include/linux/sched/mm.h).
+///
+/// [`NoReclaim::with`]: ScopeKind::with
+pub enum NoReclaim {}
+
+impl ScopeKind for NoReclaim {
+    fn save() -> c_uint {
+        // SAFETY: Updates a per-task flag. In hard interrupt context the flag is ignored rather
+        // than misinterpreted, so the call is sound from any context.
+        unsafe { bindings::memalloc_noreclaim_save() }
+    }
+
+    unsafe fn restore(prev: c_uint) {
+        // SAFETY: Per the trait contract, `prev` is the value returned by the matching `save`, on
+        // the same task.
+        unsafe { bindings::memalloc_noreclaim_restore(prev) };
+    }
+}
+
+/// Long-term pin scope.
+///
+/// Inside [`MemallocPin::with`], allocations on the current task are restricted to zones that
+/// allow long-term pinning.
+///
+/// Corresponds to `memalloc_pin_save` / `memalloc_pin_restore` in
+/// [`include/linux/sched/mm.h`](srctree/include/linux/sched/mm.h).
+///
+/// [`MemallocPin::with`]: ScopeKind::with
+pub enum MemallocPin {}
+
+impl ScopeKind for MemallocPin {
+    fn save() -> c_uint {
+        // SAFETY: Updates a per-task flag and is documented as safe from any context.
+        unsafe { bindings::memalloc_pin_save() }
+    }
+
+    unsafe fn restore(prev: c_uint) {
+        // SAFETY: Per the trait contract, `prev` is the value returned by the matching `save`, on
+        // the same task.
+        unsafe { bindings::memalloc_pin_restore(prev) };
+    }
+}

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260128-gfp-noio-fbd41e135088

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


