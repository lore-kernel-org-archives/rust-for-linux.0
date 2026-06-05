Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021BF41363E;
	Fri,  5 Jun 2026 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780656896; cv=none; b=N+1XgIEiy0o1wuZtJJVHhED+B8IsBNKa/hqehCDg8F8k+ZZzTKJLCM6J7oOhRwf24BFBKfRI5IRG6ZouGfjTJ22fiemHToYFeRGOXIUyRS+MhgRz9qYa9j7CM9kpWN+UHkfh7Y9G8C4a3xwbljwUX9cnuTFxzbHiuQS6m0cSPS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780656896; c=relaxed/simple;
	bh=CUjYW/9FwZWAZgTnb2SrR9Ka7U+reP5ZumzvbhdTFm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qAUUsarxMGU2387WAcC3IqIb7eFntelZ4hXgIM/vacVK1hGz7d5aQTSPUexshpPdtL8iNfpEaptBF/2SJlEU+u/y2Eqd/PoZVKlgsEfRf1sCs4Osh17ybwQ1xrhkgcyvH2zOqoKjNhDP3ig0wCYnMyRZ1kf2eJQU0tjx7KG7RdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrB79w6Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrB79w6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BF91F00893;
	Fri,  5 Jun 2026 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780656894;
	bh=/ySj8GIA4lhAt7ViwLme/WzVh84VfLjeXK3EUx/ivHg=;
	h=From:Date:Subject:To:Cc;
	b=YrB79w6Y5UzCmU3PFi8CW3Ol1Zzqeu61lfDcEAMP6Y9ac1vYf/0PrmAejMF0443Yj
	 TZdXZ2YcMuwmR+6QKlNivFUI0BnDTOdVjnOTg5CkFLHy0OTM5zVXYZoE1fcXqialTB
	 vb7CmSQGqc6j8zJKcfbw/2mdK81hzmhH0gTJSPdCivSbVzMa+vvjlQIX305VIaIrYT
	 vOiCeXh94mA4ob63mTgwYUdeG/1dMManwPGnb4tOzhFKj1b/HOfs/swevV4cGhSUK5
	 IvOM55+r5qZcL+Uo1L24OeZbYUtZVoRkrlEqBNGyWTZROlHCOhSKUxXAEqHEaJa3jN
	 fVcasbrJTLKfA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 12:54:41 +0200
Subject: [PATCH v2] rust: alloc: add per-task memalloc scope abstractions
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-gfp-noio-v2-1-cfa2e236c2a3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPCqImoC/23MywrCMBCF4Vcps3YkiVFSV76HdNHLJB2UpEykK
 CXvbuza5X84fBtkEqYM12YDoZUzp1jDHBoY5z4GQp5qg1HmorRxGPyCMXFCP0xWkz6dlXNQ74u
 Q5/dO3bvaM+dXks8ur/q3/kFWjRrb3innR9sO1t4eJJGexyQBulLKFzai8EShAAAA
X-Change-ID: 20260128-gfp-noio-fbd41e135088
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12308;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=CUjYW/9FwZWAZgTnb2SrR9Ka7U+reP5ZumzvbhdTFm4=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIqrxPTV5m7kRKo+B12Qag2hZXR/FLiM0EmKvP
 Az6xIGmVeWJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiKq8QAKCRD6UCkIqsW9
 0F4SD/4uO6pxwTWgUs+FRQI2+VxQXgmlFaRyDnQJBLDEilIIOkkLe8YB9g+sND540snZwPK9U0K
 bGH5BgbSNRDLSCNaz3uGlSnMP+u3OMc4UNrB3WfL1ho7RiTQ4xGNQr90EJXwdIMSOXvZtXS+QoH
 f4dpiFq+w1vUlt0pDq/HQzIola6P5Kahn/J9CHej4w0Ks77DZ8yE/1zi9IxlStfu9KIBCYYrRRz
 aMjNerTEhxlBzavChfv9byiJFApRo3glL15opufAEsdiyfxyaS0FrYc75FBKTsIMHJDtuRFenR+
 Meu04crvSPcIg1foyfkxc8Id4imTSW561UZhZEKDYMt0mSwBAs+l2Sv/RFCqR10oSwIERvmCTv6
 1FdB/qZVaumZ+NyUXQFCcLtjTww4UkzGo9YfZeudBkkZa9NGwkBYg7uWzFBJeg3rtyHsAa5Ph9e
 cQdPfVjn1TwaiJbMenYPvvsWfRJZiXun5UTHHT+Ysdx3zMoOs2sa0m+jU1rBHOwQqZcUJsycH4i
 jSE4oY1vjpti2+NhxeeBa5S0kYMdRSYA61KnAsoKgpMyKbN1LV8oMM/bhBOJSo862mPPE8w0U4E
 Lx1j0UBmG79kaWXq1aisgmIqXmedszEFfLdrjSv1DqR7g/IkzduJJxn89KQLZyOV19WIqYQUFDZ
 CZH6kOerFXqcHVQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an abstraction for the per-task allocation policies exposed by
the kernel through paired save/restore helpers in `linux/sched/mm.h`:
`memalloc_noio`, `memalloc_nofs`, `memalloc_noreclaim` and
`memalloc_pin`. Each pair toggles a bit in `current->flags` and
returns the prior state for a later restore. The pairing assumes
strict LIFO nesting; restoring out of order corrupts the per-task
state.

Wrap the four pairs as a generic `Scope<K>` guard with a sealed
`ScopeKind` trait. Tag types `NoIo`, `NoFs`, `NoReclaim` and
`MemallocPin` select the underlying save/restore pair. `Scope` is
`!Unpin`, `!Send` and `!Sync`, and is only constructed through the
`memalloc_scope!` macro, which binds it via `core::pin::pin!` to a
hidden stack slot and hands out a `Pin<&Scope<K>>`. Safe code
therefore cannot move the guard across tasks, drop it ahead of its
lexical scope or otherwise violate the LIFO save/restore discipline.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Rewrite the patch to use scoped allocation flags instead of exposing
  a `GFP_NOIO` flag constant.
- Link to v1: https://lore.kernel.org/r/20260128-gfp-noio-v1-1-9a808fc49b44@kernel.org

To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-mm@kvack.org
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/mm.c               |  40 +++++++
 rust/kernel/alloc.rs            |   1 +
 rust/kernel/alloc/scoped.rs     | 231 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 446dbeaf0866..1931b131345f 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -83,6 +83,7 @@
 #include <linux/refcount.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched.h>
+#include <linux/sched/mm.h>
 #include <linux/security.h>
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index b5540997bd20..b8e7492512e8 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -48,3 +48,43 @@ __rust_helper void rust_helper_vma_end_read(struct vm_area_struct *vma)
 {
 	vma_end_read(vma);
 }
+
+unsigned int rust_helper_memalloc_noio_save(void)
+{
+	return memalloc_noio_save();
+}
+
+void rust_helper_memalloc_noio_restore(unsigned int flags)
+{
+	memalloc_noio_restore(flags);
+}
+
+unsigned int rust_helper_memalloc_nofs_save(void)
+{
+	return memalloc_nofs_save();
+}
+
+void rust_helper_memalloc_nofs_restore(unsigned int flags)
+{
+	memalloc_nofs_restore(flags);
+}
+
+unsigned int rust_helper_memalloc_noreclaim_save(void)
+{
+	return memalloc_noreclaim_save();
+}
+
+void rust_helper_memalloc_noreclaim_restore(unsigned int flags)
+{
+	memalloc_noreclaim_restore(flags);
+}
+
+unsigned int rust_helper_memalloc_pin_save(void)
+{
+	return memalloc_pin_save();
+}
+
+void rust_helper_memalloc_pin_restore(unsigned int flags)
+{
+	memalloc_pin_restore(flags);
+}
diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index e38720349dcf..8ebb8c9f3e67 100644
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
index 000000000000..0251792c9f3c
--- /dev/null
+++ b/rust/kernel/alloc/scoped.rs
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Scoped allocation policies for the current task.
+//!
+//! The kernel exposes several per-task allocation policies through
+//! save/restore pairs in [`include/linux/sched/mm.h`]: `memalloc_noio`,
+//! `memalloc_nofs`, `memalloc_noreclaim` and `memalloc_pin`. Each pair
+//! sets a bit in `current->flags` and returns the prior state, which a
+//! later call restores. The save/restore APIs assume strict LIFO
+//! nesting; restoring out of order corrupts the per-task state.
+//!
+//! This module exposes the policies as a generic [`Scope<K>`] guard,
+//! parameterized over a [`ScopeKind`] tag. The type is `!Unpin` and
+//! constructed only through the [`memalloc_scope!`] macro, which binds
+//! it to a hidden stack slot via [`core::pin::pin!`] and rebinds the
+//! handle as a shared pinned reference. Safe code therefore has no path
+//! to either move the guard or drop it ahead of its lexical scope, so
+//! nested scopes always restore in LIFO order.
+//!
+//! [`include/linux/sched/mm.h`]: srctree/include/linux/sched/mm.h
+//!
+//! # Examples
+//!
+//! ```ignore
+//! use kernel::memalloc_scope;
+//! use kernel::alloc::scoped::NoIo;
+//!
+//! fn process_io_request() {
+//!     memalloc_scope!(let _noio: NoIo);
+//!     // Every allocation in this scope behaves as if `GFP_NOIO` were
+//!     // set, even when the call site passes `GFP_KERNEL`.
+//! }
+//! ```
+
+use core::{
+    ffi::c_uint,
+    marker::{
+        PhantomData,
+        PhantomPinned, //
+    },
+};
+
+use crate::types::NotThreadSafe;
+
+pub use crate::memalloc_scope;
+
+mod private {
+    pub trait Sealed {}
+}
+
+/// Selects which `memalloc_*` save/restore pair a [`Scope`] wraps.
+///
+/// Implemented only by the zero-sized tag types in this module
+/// ([`NoIo`], [`NoFs`], [`NoReclaim`], [`MemallocPin`]). The trait is
+/// sealed.
+pub trait ScopeKind: private::Sealed {
+    /// Begin a scope on the current task and return the prior state.
+    #[doc(hidden)]
+    fn save() -> c_uint;
+
+    /// End a scope on the current task.
+    ///
+    /// # Safety
+    ///
+    /// `prev` must be the value returned by the matching [`save`] call,
+    /// and the call must execute on the same task that ran [`save`].
+    ///
+    /// [`save`]: ScopeKind::save
+    #[doc(hidden)]
+    unsafe fn restore(prev: c_uint);
+}
+
+/// A scope that imposes an allocation policy on the current task while
+/// it is live.
+///
+/// Construct one with [`memalloc_scope!`]. `Scope` is `!Unpin` and its
+/// constructor is hidden, so a `Scope` only ever exists pinned to a
+/// stack slot owned by the construction macro; safe code cannot drop
+/// it out of order or send it across tasks. The C-side state is
+/// restored in [`Drop`], which runs when the stack slot goes out of
+/// scope.
+pub struct Scope<K: ScopeKind> {
+    prev: c_uint,
+    _kind: PhantomData<K>,
+    _pin: PhantomPinned,
+    _not_thread_safe: NotThreadSafe,
+}
+
+impl<K: ScopeKind> Scope<K> {
+    /// Begin a scope of kind `K` on the current task.
+    ///
+    /// # Safety
+    ///
+    /// The returned value must be pinned to the stack frame that calls
+    /// this function and dropped on the same task. In practice, only
+    /// [`memalloc_scope!`] should call this — the macro arranges both.
+    #[doc(hidden)]
+    pub unsafe fn new() -> Self {
+        Self {
+            prev: K::save(),
+            _kind: PhantomData,
+            _pin: PhantomPinned,
+            _not_thread_safe: NotThreadSafe,
+        }
+    }
+}
+
+impl<K: ScopeKind> Drop for Scope<K> {
+    fn drop(&mut self) {
+        // SAFETY: `self.prev` was produced by `K::save` in `Self::new`.
+        // The caller of `new` upheld the contract that the value
+        // remains pinned to its construction stack frame, so this drop
+        // runs on the same task as the matching save.
+        unsafe { K::restore(self.prev) };
+    }
+}
+
+macro_rules! define_kind {
+    (
+        $(#[$meta:meta])*
+        $name:ident, $save:ident, $restore:ident $(,)?
+    ) => {
+        $(#[$meta])*
+        pub struct $name;
+
+        impl private::Sealed for $name {}
+
+        impl ScopeKind for $name {
+            fn save() -> c_uint {
+                // SAFETY: Updates a per-task flag and is documented as
+                // safe from any context.
+                unsafe { bindings::$save() }
+            }
+
+            unsafe fn restore(prev: c_uint) {
+                // SAFETY: Per the trait contract, `prev` is the value
+                // returned by the matching `save`, on the same task.
+                unsafe { bindings::$restore(prev) };
+            }
+        }
+    };
+}
+
+define_kind!(
+    /// `GFP_NOIO` scope.
+    ///
+    /// While a `Scope<NoIo>` is live, allocations on the current task
+    /// behave as if `GFP_NOIO` were set, making them safe to issue from
+    /// the IO completion path.
+    ///
+    /// Corresponds to `memalloc_noio_save` / `memalloc_noio_restore` in
+    /// `include/linux/sched/mm.h`.
+    NoIo,
+    memalloc_noio_save,
+    memalloc_noio_restore,
+);
+
+define_kind!(
+    /// `GFP_NOFS` scope.
+    ///
+    /// While a `Scope<NoFs>` is live, allocations on the current task
+    /// behave as if `GFP_NOFS` were set, making them safe to issue from
+    /// a filesystem critical section.
+    ///
+    /// Corresponds to `memalloc_nofs_save` / `memalloc_nofs_restore` in
+    /// `include/linux/sched/mm.h`.
+    NoFs,
+    memalloc_nofs_save,
+    memalloc_nofs_restore,
+);
+
+define_kind!(
+    /// No-reclaim scope.
+    ///
+    /// While a `Scope<NoReclaim>` is live, allocations on the current
+    /// task may dip into the memory reserves. Callers must be sure their
+    /// allocations will help free more memory shortly; see the kernel C
+    /// documentation for the full contract.
+    ///
+    /// Corresponds to `memalloc_noreclaim_save` /
+    /// `memalloc_noreclaim_restore` in `include/linux/sched/mm.h`.
+    NoReclaim,
+    memalloc_noreclaim_save,
+    memalloc_noreclaim_restore,
+);
+
+define_kind!(
+    /// Long-term pin scope.
+    ///
+    /// While a `Scope<MemallocPin>` is live, allocations on the current
+    /// task are restricted to zones that allow long-term pinning.
+    ///
+    /// Corresponds to `memalloc_pin_save` / `memalloc_pin_restore` in
+    /// `include/linux/sched/mm.h`.
+    MemallocPin,
+    memalloc_pin_save,
+    memalloc_pin_restore,
+);
+
+/// Bind a [`Scope`] of the given kind to the current stack frame.
+///
+/// `$kind` must name one of the zero-sized tag types defined in this
+/// module: [`NoIo`], [`NoFs`], [`NoReclaim`], [`MemallocPin`]. The
+/// macro shadows `$name` first with the owning pinned slot and then
+/// with a shared pinned reference, so the value lives until the end of
+/// the enclosing block and cannot be dropped early by safe code.
+///
+/// # Examples
+///
+/// ```ignore
+/// use kernel::memalloc_scope;
+/// use kernel::alloc::scoped::NoIo;
+///
+/// memalloc_scope!(let _scope: NoIo);
+/// // ... allocations here behave as if `GFP_NOIO` were set.
+/// ```
+#[macro_export]
+macro_rules! memalloc_scope {
+    (let $name:ident : $kind:ident) => {
+        // SAFETY: `pin!` places the value in a hidden stack slot and
+        // returns a `Pin<&mut _>`; combined with `Scope: !Unpin`, safe
+        // code can neither extract ownership nor reorder its drop
+        // relative to nested scopes, so the save/restore discipline of
+        // the underlying C API is preserved.
+        let $name = ::core::pin::pin!(unsafe {
+            $crate::alloc::scoped::Scope::<$crate::alloc::scoped::$kind>::new()
+        });
+        let $name: ::core::pin::Pin<&$crate::alloc::scoped::Scope<$crate::alloc::scoped::$kind>> =
+            $name.as_ref();
+    };
+}

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260128-gfp-noio-fbd41e135088

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


