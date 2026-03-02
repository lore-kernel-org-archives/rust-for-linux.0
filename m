Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2C747D949;
	Mon,  2 Mar 2026 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772480153; cv=none; b=j2qz92d8W7nz9jq9QTvh+lcfQXHfgpB0A1XzHZv38JTJpXQ/ParMAC/S6g0LIq4PViG42N030qh+Omfs+NVZ/KjrVV1eE/jSgTyDeP63MRxbcSDhfE0+BR7arIt8t2+0N9BBLBbyHd0j7GNIlN1HbDgxLvucBJxZIEPWoxdX3sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772480153; c=relaxed/simple;
	bh=LOEpeHFq8ZwI4bDN9wJt/MhsuDWNhfiJjUke0GI+WrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ax2Fz2IFV56eZNJjL+62LZ0ThUtLXmitvfCwBSTAii/oLIcnh++BU5azz1DrvWYTYKVgMcdNunZBlkPDJGOO7ocX0NaOtEzyFEd0AeL4Pt9qoCADmyHP1dhVtEYQgK4fNj8F7WJV0oRt/7BTVQXFr1nP940rIbkxCBMxTrBe0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=si0FSrW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="si0FSrW+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FF66C2BCAF;
	Mon,  2 Mar 2026 19:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772480153;
	bh=LOEpeHFq8ZwI4bDN9wJt/MhsuDWNhfiJjUke0GI+WrU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=si0FSrW+/ediKuSDulf5MHmoQ4LqhfIw6ijHZIz5TJrol3A6RiuEmYtQB1cDm56V0
	 kwyxihF/eNAhx8Ll0a0qHA4h7Lq0FPkDHOJgwZTRcVIVA9LCCbj+Iwl476xTyd/Ldp
	 wLTTnUZBFJiyXICAv9O8YwTbeKaalgGMI70sB+NIFyLcN+vQqDlCkAsrvVtJZaQE6y
	 81SJet1B4XwPTxynee5slgiOuDDnJjSfe4oS3fsOMLc9yeaSk7hhnuPPORxZ/QstKU
	 hN/R2DG1W4I1Ho2BYuyzXPyKIJ0DuuiXB6HVf6zO41fzXjxq0QeSO7ZF+eYjWc0JYo
	 56SScDpdACApQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B64EB3630;
	Mon,  2 Mar 2026 19:35:53 +0000 (UTC)
From: KaiserGranatapfel via B4 Relay <devnull+christopher.erleigh.gmail.com@kernel.org>
Date: Mon, 02 Mar 2026 21:35:52 +0200
Subject: [PATCH] rust_binder: replace is_aligned helper with is_multiple_of
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-rust-binder-is-multiple-of-v1-1-121149fbad30@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJfmpWkC/x3MwQqDMAwA0F+RnA3Ejq2wXxEPatMt0LWSqAzEf
 7d4fJd3gLEKG7ybA5R3MSm5omsbmL9j/jBKqAZH7kUPcqibrThJDqwohr8trbIkxhLRBf/0c6T
 RU4QaLMpR/nfeD+d5Ad+s7JBsAAAA
X-Change-ID: 20260302-rust-binder-is-multiple-of-2d757cf0a70f
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 "Christopher Erleigh (KaiserGranatapfel)" <christopher.erleigh@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772480152; l=6717;
 i=christopher.erleigh@gmail.com; s=20260302; h=from:subject:message-id;
 bh=fOidcYaaihE7zZbNNbcZCrfdpIehIfJhYQrMVhdoAxo=;
 b=NUrMm3jYOz7g4os7kWiHPgm5PGyuEOLpVo24XuoearRahnVjDc+7Ix6uaMxPgNOqvie0u6ofl
 gPCN26qRDmaBULvFpIgyTE3+3H7WRqPY4Pon7kSQ8RGdL26DcSMx/xQ
X-Developer-Key: i=christopher.erleigh@gmail.com; a=ed25519;
 pk=ssRgcSGlJJqsJZes+/kMp3dXpdxVrNCeibxatLC6J6o=
X-Endpoint-Received: by B4 Relay for christopher.erleigh@gmail.com/20260302
 with auth_id=656
X-Original-From: KaiserGranatapfel <christopher.erleigh@gmail.com>
Reply-To: christopher.erleigh@gmail.com

From: KaiserGranatapfel <christopher.erleigh@gmail.com>

Remove the local `is_aligned` helper from the binder thread module and
replace all call sites with `usize::is_multiple_of`, which is the
idiomatic Rust API for checking divisibility.

Since `is_multiple_of` was only stabilized in Rust 1.87.0 and the
kernel MSRV is currently 1.78.0, introduce a `UsizeExt` extension
trait in `rust/kernel/usize_ext.rs` as a polyfill. The trait is
conditionally compiled behind `CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF`
(set when rustc >= 1.87.0) and re-exported via the kernel prelude,
following the same pattern used for `AsFlattened` / `slice_flatten`.

The `offset % type_size == 0` expression in `rust/kernel/io.rs` is
intentionally left unchanged as it lives inside a `const fn` where
trait method calls are not permitted.

Link: https://github.com/Rust-for-Linux/linux/issues/1220
Signed-off-by: Christopher Erleigh (KaiserGranatapfel) <christopher.erleigh@gmail.com>
---
The recently landed patch "rust_binder: add additional alignment checks"
introduced a local `is_aligned` helper as a workaround for
`usize::is_multiple_of` not being available prior to Rust 1.87.0.

This patch replaces that helper with a `UsizeExt` extension trait that
provides `is_multiple_of` as a polyfill, following the same pattern used
for `AsFlattened` / `slice_flatten`. The trait is gated behind
`CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF` and will become a no-op once
the kernel MSRV reaches 1.87.0.

Note: the From: header uses my GitHub username "KaiserGranatapfel", as
this is tied to my Git and GitHub identity. My real name is Christopher
Erleigh, as reflected in the Signed-off-by trailer.
---
 drivers/android/binder/thread.rs | 14 +++++---------
 init/Kconfig                     |  3 +++
 rust/kernel/lib.rs               |  1 +
 rust/kernel/prelude.rs           |  3 +++
 rust/kernel/usize_ext.rs         | 30 ++++++++++++++++++++++++++++++
 5 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 0b62d24b2..25d499d05 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -36,10 +36,6 @@
 
 use core::mem::size_of;
 
-fn is_aligned(value: usize, to: usize) -> bool {
-    value % to == 0
-}
-
 /// Stores the layout of the scatter-gather entries. This is used during the `translate_objects`
 /// call and is discarded when it returns.
 struct ScatterGatherState {
@@ -796,7 +792,7 @@ fn translate_object(
                 let num_fds = usize::try_from(obj.num_fds).map_err(|_| EINVAL)?;
                 let fds_len = num_fds.checked_mul(size_of::<u32>()).ok_or(EINVAL)?;
 
-                if !is_aligned(parent_offset, size_of::<u32>()) {
+                if !parent_offset.is_multiple_of(size_of::<u32>()) {
                     return Err(EINVAL.into());
                 }
 
@@ -814,7 +810,7 @@ fn translate_object(
                     }
                 };
 
-                if !is_aligned(parent_entry.sender_uaddr, size_of::<u32>()) {
+                if !parent_entry.sender_uaddr.is_multiple_of(size_of::<u32>()) {
                     return Err(EINVAL.into());
                 }
 
@@ -975,10 +971,10 @@ pub(crate) fn copy_transaction_data(
             None => 0,
         };
 
-        if !is_aligned(offsets_size, size_of::<u64>()) {
+        if !offsets_size.is_multiple_of(size_of::<u64>()) {
             return Err(EINVAL.into());
         }
-        if !is_aligned(buffers_size, size_of::<u64>()) {
+        if !buffers_size.is_multiple_of(size_of::<u64>()) {
             return Err(EINVAL.into());
         }
 
@@ -1047,7 +1043,7 @@ pub(crate) fn copy_transaction_data(
                     .try_into()
                     .map_err(|_| EINVAL)?;
 
-                if offset < end_of_previous_object || !is_aligned(offset, size_of::<u32>()) {
+                if offset < end_of_previous_object || !offset.is_multiple_of(size_of::<u32>()) {
                     pr_warn!("Got transaction with invalid offset.");
                     return Err(EINVAL.into());
                 }
diff --git a/init/Kconfig b/init/Kconfig
index b55deae92..bd7493480 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -166,6 +166,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 config RUSTC_HAS_SLICE_AS_FLATTENED
 	def_bool RUSTC_VERSION >= 108000
 
+config RUSTC_HAS_USIZE_IS_MULTIPLE_OF
+	def_bool RUSTC_VERSION >= 108700
+
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f..59216912a 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -157,6 +157,7 @@
 pub mod uaccess;
 #[cfg(CONFIG_USB = "y")]
 pub mod usb;
+pub mod usize_ext;
 pub mod workqueue;
 pub mod xarray;
 
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 2877e3f7b..7e778a666 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -53,3 +53,6 @@
 
 #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
 pub use super::slice::AsFlattened;
+
+#[cfg(not(CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF))]
+pub use super::usize_ext::UsizeExt as _;
diff --git a/rust/kernel/usize_ext.rs b/rust/kernel/usize_ext.rs
new file mode 100644
index 000000000..690265bc0
--- /dev/null
+++ b/rust/kernel/usize_ext.rs
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Additional (and temporary) `usize` helpers.
+
+/// Extension trait providing a portable version of [`usize::is_multiple_of`].
+///
+/// `usize::is_multiple_of` was stabilized in Rust 1.87.0. This extension trait
+/// provides the same functionality for kernels built with older toolchains.
+///
+/// This trait can be removed once the MSRV passes 1.87.
+///
+/// [`usize::is_multiple_of`]: https://doc.rust-lang.org/std/primitive.usize.html#method.is_multiple_of
+#[cfg(not(CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF))]
+pub trait UsizeExt {
+    /// Returns `true` if `self` is a multiple of `rhs`.
+    ///
+    /// This is a portable layer on top of [`usize::is_multiple_of`]; see its documentation for
+    /// details.
+    ///
+    /// [`usize::is_multiple_of`]: https://doc.rust-lang.org/std/primitive.usize.html#method.is_multiple_of
+    fn is_multiple_of(self, rhs: usize) -> bool;
+}
+
+#[cfg(not(CONFIG_RUSTC_HAS_USIZE_IS_MULTIPLE_OF))]
+impl UsizeExt for usize {
+    #[inline]
+    fn is_multiple_of(self, rhs: usize) -> bool {
+        self % rhs == 0
+    }
+}

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260302-rust-binder-is-multiple-of-2d757cf0a70f

Best regards,
-- 
KaiserGranatapfel <christopher.erleigh@gmail.com>


