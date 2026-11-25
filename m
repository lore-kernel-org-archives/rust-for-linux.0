Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633840;
	b=GqCWthEnU/OXMcAi2nM3UuFxpn5l0E/2wzSb4zIaOw66plcOTAy7WHQ1FjolaJ2dw08b
	 iO0Zo+V0OM4483g8aHPy2pLPE4iRRR+wVGBWEtJVlvkGAxTLoFURmUwTYEyenphRTgMt5
	 TlwIMmKRH+LWL9SLX7VfLcODu7zkt6RXL83XnF8BAbLmXJCEB5c/ihcEDJXBwOB47nJTX
	 h97M+OZtcd33eEXaL6cz3hikLAS9Ua+ZMfz6B8H8jtYOJ8IaOJ/OdBvG8IvTu/jMHWsLj
	 d6wgmoRToj4Ygh9Y2/zedO5qasNxxTv24DV1h8qiQjNUgIs2mYPTxsRNQajUoHhLCIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633840;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=gdJT2ccAmvh0rOqxKnPGiTdo4RGbeB5XvNplqFwpnbA=;
	b=4QnOL+HBn6xJ/HxCWnp3nHgqPzMKLA8zzMm33yUhPI2rXQD+TF6NXJWCoT71zBHgCQYo
	 +EK52NhPjaahb24lWPqtNS+HB+gpdnUGh/0FDnKzqm2O+Z7QVzds9ej77K5Jcl3s+FIXG
	 FAZRYHnZg3uIiDl7kINKR+qFjI6YQabTGOvTIaEw7YhFxMQnlodrQ/iSEhcah0rwkMo2Z
	 8irjBc53VTJNgbOkGc6Ou/OOqiM5bWt8p2tOFP8lngyjComF727Riz+DjZgPumV0dghmz
	 Uw0jodhpef4r0sA8ay+pmjbEslxq6ul3HeBYtquHzEtJM3vb9XDj2Dbig0y12GlFGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nb2PMwHa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA9606A31E;
	Wed, 25 Nov 2026 19:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nb2PMwHa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5AE1F000C0;
	Wed, 25 Nov 2026 19:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795633840;
	bh=gdJT2ccAmvh0rOqxKnPGiTdo4RGbeB5XvNplqFwpnbA=;
	h=From:Date:Subject:To:Cc;
	b=nb2PMwHaKL2ly+Ltwwy1U5Gzjyv+RAE8sNl/e6s6Mt8D1RST8Ps8U1Fl6HI70fFwV
	 kPGhOwFmIL1kSaEM5K0/mCTn1jgP5hoQNvkV8jxTEB35wr9kW6kLSWEppBTi9Ai/H/
	 oPAy71k3Qh3W1y5A1N2DuDqbdKV1TrQuD0HSgsiMsoTo7zZ8Lx/lDX6a9Vztbg6BQA
	 arbmN8lcHFZNAdOyNQvdj9QyEeqVNMXVhYAPEhZaVrW9yMZq/J8IKjuBcFatUYUeN5
	 XvTHWU/kI5hTcHEok0MLosHMWcxZtlbidvbJMvdHczQKha1OxSxxGCXuFFzSActlY0
	 I2HnaKo/IL4Bw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 25 Nov 2026 20:10:08 +0100
Subject: [PATCH v4] rust: alloc: add per-task memalloc scope abstractions
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
Message-Id: <20261125-gfp-noio-v4-1-0f67ab9895ab@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI8yB2sC/23NTQ7CIBRG0a0YxmL4awuO3IdxQOmjJRpowBBN0
 71LO9BGHX4vnMuEEkQHCR13E4qQXXLBlyH2O2QG7XvArisbMcJqQpnEvR2xDy5g23aCAuUVkRK
 V52ME6x5r6nwpe3DpHuJzLWe6XP9EMsUUKy2JtEaoVojTFaKH2yHEHi2VzD6yJtVGsiKN1QwYr
 w3T/Efyt6SUqI3kReqq4dC0oMzXn/M8vwAmVIzkFQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9565; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=0YRhhuKoy9a8ZWo6v32rODo4LhAbhlvxZN1lEYkVOw8=;
 b=kA0DAAoB+lApCKrFvdAByyZiAGsHMpaj80yAAtDs2/HBL2/2iD6q8ROCtcVTm1LX5MyAqVdUY
 IkCMwQAAQoAHRYhBFeK2cjZZnYmKsBqhvpQKQiqxb3QBQJrBzKWAAoJEPpQKQiqxb3QlTAP/jS0
 MAELtG5ofjnYaNxy3Zg4S6rkf1bzZqmQWh0LhRjU8lnlCSpWaRwHQ9NHjE0GYShtZ+pdtKfdhM4
 UCzm4UcwFaL6JZujqUBBe9NsEZzrYsWkLmDzE8bY0Q10XqYd1d5PzjJFozIeWbL2GKvC60WktZc
 26miCJc2hvSlN7nrK6oVMeNOIPInSIGh9rJMEBqTfPVqucBFxaGDONUOix5pRFoehTb/HNKQ0L7
 5sLh0P/pOtkmD3qjwNTP3OTcMkXnWeZYuZVCeYQAJFbxEl+6juzRX8vP0C0Z3XAgNNcontLJuI5
 ACetC5iqfwZ1y4lw25ADlJKahTIZLGcWjIBKM+Kke47HFabgVpy3ugRtHosX3cM3Y4gHRXt1L0N
 BdfwZvzZy4PLi+q0+Q89Ks07T4uqkg2v1XGAakdH5dZ4tthG1CeN9f2RHADb1FJ0FH5GBQnQAAd
 IwkN3iCPlhRCF1b8P9uC/qfF0HrpK1pyPq8dGRNmIAvm7WqN8o+ujrE5Qe03nlezM7fv8c5DVWn
 7q/vl7vA+Pa5jUcMRNfC1Pff0N4BeEyd6JhDd98VM3X1JTMNmMLRePiPILpSzilLfih3QRM5Xt2
 5wAuSIO5+t+z/v2ClX3mcky9WNcdl2c9R/6dlWRTNOES3A0xZ3Ci8ygIjy+cMTZci68kt0wd8/A
 w2ple
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an abstraction for the per-task allocation policies exposed by
the kernel through paired save/restore helpers in `linux/sched/mm.h`:
`memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
`memalloc_pin`. Each pair wraps `memalloc_flags_save` and
`memalloc_flags_restore`. The save call sets bits in `current->flags`
and returns the bits it added, which the restore call clears again. The
pairing assumes strict LIFO nesting; restoring out of order corrupts
the per-task state.

Expose each policy as a variant of the `ScopeFlag` enum, with
`ScopeFlags` as the corresponding set type, both generated by
`impl_flags!`. Add `alloc_scope`, which applies a set of policies, runs
a closure and restores the previous policies before returning. The save
and restore operations are not exposed on their own, so safe code
cannot leave a scope open or restore out of order.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v4:
- Replace the `ScopeKind` trait and its tag types with an `alloc_scope()`
  function taking `ScopeFlags` built with `impl_flags!` (Gary).
- Replace the per-policy C helpers with a single `memalloc_flags_save()`
  and `memalloc_flags_restore()` helper pair.
- Do not expose a safe/restore functions public (Sashiko).
- Mark `alloc_scope()` as `#[inline]` (Sashiko).
- Link to v3: https://msgid.link/20261109-gfp-noio-v3-1-a573e7be9c44@kernel.org

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
 rust/helpers/mm.c               |  10 +++
 rust/kernel/alloc.rs            |   1 +
 rust/kernel/alloc/scoped.rs     | 134 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 146 insertions(+)

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
index b5540997bd20..42424583e7b3 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -48,3 +48,13 @@ __rust_helper void rust_helper_vma_end_read(struct vm_area_struct *vma)
 {
 	vma_end_read(vma);
 }
+
+__rust_helper unsigned int rust_helper_memalloc_flags_save(unsigned int flags)
+{
+	return memalloc_flags_save(flags);
+}
+
+__rust_helper void rust_helper_memalloc_flags_restore(unsigned int flags)
+{
+	memalloc_flags_restore(flags);
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
index 000000000000..7fec1c974192
--- /dev/null
+++ b/rust/kernel/alloc/scoped.rs
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Scoped allocation policies for the current task.
+//!
+//! The kernel exposes several per-task allocation policies through save/restore pairs in
+//! [`include/linux/sched/mm.h`]: `memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
+//! `memalloc_pin`. Each pair is a wrapper around `memalloc_flags_save` and
+//! `memalloc_flags_restore`. The save call sets bits in `current->flags` and returns the bits it
+//! added, which the restore call clears again. The save/restore APIs assume strict LIFO nesting;
+//! restoring out of order corrupts the per-task state.
+//!
+//! This module exposes each policy as a [`ScopeFlag`]. [`alloc_scope`] applies a set of policies,
+//! runs a closure and restores the previous policies before returning.
+//!
+//! [`include/linux/sched/mm.h`]: srctree/include/linux/sched/mm.h
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::alloc::scoped::{
+//!     alloc_scope,
+//!     ScopeFlag, //
+//! };
+//!
+//! // Every allocation inside the closure behaves as if `GFP_NOIO` were set, even though the call
+//! // site passes `GFP_KERNEL`.
+//! let b = alloc_scope(ScopeFlag::NoIo, || KBox::new(42_u32, GFP_KERNEL))?;
+//! assert_eq!(*b, 42);
+//!
+//! // Policies can be combined with the bitwise OR (`|`) operator.
+//! let b = alloc_scope(ScopeFlag::NoIo | ScopeFlag::Pin, || KBox::new(42_u32, GFP_KERNEL))?;
+//! assert_eq!(*b, 42);
+//! # Ok::<(), Error>(())
+//! ```
+// # Implementation details
+//
+// Since the closure used in this API is synchronous it cannot contain a suspension point, so the
+// save and restore always execute in the same call frame, on the same task, and nested scopes
+// restore in LIFO order. The save and restore operations are not exposed on their own, so safe
+// code cannot begin a scope without ending it.
+use crate::impl_flags;
+
+impl_flags!(
+    /// A set of per-task allocation policies.
+    ///
+    /// Build a set by combining [`ScopeFlag`] values with the bitwise operators, then pass it to
+    /// [`alloc_scope`] to run code under the policies.
+    ///
+    /// # Invariants
+    ///
+    /// Only bits that correspond to a [`ScopeFlag`] are set.
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    pub struct ScopeFlags(u32);
+
+    /// A per-task allocation policy.
+    ///
+    /// Each policy corresponds to a `memalloc_*_save` / `memalloc_*_restore` pair in
+    /// [`include/linux/sched/mm.h`](srctree/include/linux/sched/mm.h).
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    pub enum ScopeFlag {
+        /// `GFP_NOIO` scope.
+        ///
+        /// Allocations on the current task behave as if `GFP_NOIO` were set, making them safe to
+        /// issue from the IO completion path.
+        ///
+        /// Corresponds to `memalloc_noio_save` / `memalloc_noio_restore`.
+        NoIo = bindings::PF_MEMALLOC_NOIO,
+
+        /// `GFP_NOFS` scope.
+        ///
+        /// Allocations on the current task behave as if `GFP_NOFS` were set, making them safe to
+        /// issue from a filesystem critical section.
+        ///
+        /// Corresponds to `memalloc_nofs_save` / `memalloc_nofs_restore`.
+        NoFs = bindings::PF_MEMALLOC_NOFS,
+
+        /// No-reclaim scope.
+        ///
+        /// Allocations on the current task may dip into the memory reserves. Callers must be sure
+        /// their allocations will help free more memory shortly; see the kernel C documentation
+        /// for the full contract.
+        ///
+        /// The scope has no effect in hard interrupt context, where `PF_MEMALLOC` does not grant
+        /// access to the reserves; see `__gfp_pfmemalloc_flags()` in
+        /// [`mm/page_alloc.c`](srctree/mm/page_alloc.c).
+        ///
+        /// Corresponds to `memalloc_noreclaim_save` / `memalloc_noreclaim_restore`.
+        NoReclaim = bindings::PF_MEMALLOC,
+
+        /// Long-term pin scope.
+        ///
+        /// Allocations on the current task are restricted to zones that allow long-term pinning.
+        ///
+        /// Corresponds to `memalloc_pin_save` / `memalloc_pin_restore`.
+        Pin = bindings::PF_MEMALLOC_PIN,
+    }
+);
+
+/// Run `f` with the allocation policies in `flags` applied to the current task.
+///
+/// The policies in `flags` are applied before `f` runs. When `f` returns, the policies that were
+/// not already in effect before the call are removed again. `flags` can be a single [`ScopeFlag`]
+/// or a [`ScopeFlags`] set.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::alloc::scoped::{
+///     alloc_scope,
+///     ScopeFlag, //
+/// };
+///
+/// let b = alloc_scope(ScopeFlag::NoFs, || KBox::new(42_u32, GFP_KERNEL))?;
+/// assert_eq!(*b, 42);
+/// # Ok::<(), Error>(())
+/// ```
+#[inline]
+pub fn alloc_scope<R>(flags: impl Into<ScopeFlags>, f: impl FnOnce() -> R) -> R {
+    let flags: ScopeFlags = flags.into();
+
+    // SAFETY: By the type invariant of `ScopeFlags`, `flags` only contains `PF_MEMALLOC*` bits.
+    // Setting these on the current task is sound from any context. In hard interrupt context
+    // `PF_MEMALLOC` is ignored rather than misinterpreted.
+    let added_flags = unsafe { bindings::memalloc_flags_save(flags.into()) };
+
+    let ret = f();
+
+    // SAFETY: `added_flags` was produced by the `memalloc_flags_save` call above on this task. `f`
+    // is a synchronous closure, so it has already returned and any scope it began has already
+    // been restored.
+    unsafe { bindings::memalloc_flags_restore(added_flags) };
+
+    ret
+}

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260128-gfp-noio-fbd41e135088

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


