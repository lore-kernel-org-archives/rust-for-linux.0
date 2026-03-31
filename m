Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0533A3E96
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983960; cv=none; b=RoZkWhsqU2mZcryrFUPpt+2+eDNOZCBUV679z6cFX96ogdoqUCoBW+AZjtPW3rmeGqqF9LGSQ+d2hj9DLQ11WNYHaNHFa+ZNDOn0IBE1X70z5D/WL7yfuMSG3XPQPMhcJmaDCtlOwrXpMbTOap/jhARXIQnL9HNA85C16RKSgJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983960; c=relaxed/simple;
	bh=nq4AML9j2f9GtigoXzN90Um7eTIHjhBwnQRs8LWJeU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeDbva/su8t11E2MlYfdiJvHASHFOoBYXWT/kzHnTrEIEtXOagV5R5dexMj1AI4ZcA4ZWbaxfAUzR6jHgp8TSuoj7xemA4qIwyu0oCN4rR9XZOPsMqhycxdwjqitCYPb2GXbHgPTZPgWYEWkzwyCzH8iJYJkxUPYnNtw3W2XSHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=A9ZrXWZq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O1wLTM81; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="A9ZrXWZq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O1wLTM81"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 382FF7A00AB;
	Tue, 31 Mar 2026 15:05:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 31 Mar 2026 15:05:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983958; x=
	1775070358; bh=1aFiUXtIRaRYT/JGXF8xGDsoIltNDNyNBm0jIV5HbNo=; b=A
	9ZrXWZqjNtQih96q12C+bqzxUu4Fh9vmsKJHmRc7zSSjhylIwwst/ozIdtMyPn5f
	mOmHjvbysMXaJAFAoCGZVxDQ0X3rz8+Hez5jivtI06+/1q54eG3SuVeTuDpJeeQj
	5WtQ4DQj45zIuce87+ZRUaHxgnvRvPYmSaRljFR87ZmLqzCIRwq+gemdqSB0rJK+
	Acg+bYZ+DNz7SjqIZc2Lao7aqRbHiFy//ohmPop7rWm7FdWeL/+cC80PtrlF/x0/
	k0M8KAOmtuZWSTdgBfKmVcMMym/C+CNbVQNDZ6ljKstMgqPV57arKPotUjnYcv+T
	l7CT3knY/vL2Yn/Stv6iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983958; x=1775070358; bh=1
	aFiUXtIRaRYT/JGXF8xGDsoIltNDNyNBm0jIV5HbNo=; b=O1wLTM815Zva7v0EP
	Ma93IEMNjAn0+SAeC7a2Ne+LfljLfBZcwUVpDr9mlJvTOjavFzesypWmxqm161tV
	TUSjBarR5oZAmV07jIztIc01P2OtleKXOmYQyX1BE+E3l15G7MweDVSydjNpWygN
	50bDJTNhfG6xOp0U0+gOhqn/QTjOSljXlXa8tXTl4bf6AOcp21OO6C/JjvuSgsu4
	IRWo8dzyc3vKbUnpfDq3KXkBlx/IwSP4/jd1mRnjEzUuuXRNvGQZL7IsLokM9ihX
	KbarVkZ5lRo4ySgDSbIltqMs5VR6+B2sL+tLleCngdlgzX8wBQSfFmi7sgqF2RYf
	PzRIg==
X-ME-Sender: <xms:FhvMaXXz8_4D7fmsN-qG9hCyl-CmeFNqEamKUSx64yVUyCc7fkhxGA>
    <xme:FhvMaWmHpAPs_Ayq1XAiOcPjimZDzMyRLc02fIPgF5J1SxGYCRk16riO3O0H2fh7d
    JdTCt26b7I9mV6iCNbNrqzzqGTn5EuTZT4PUWLwD9YGmn5_qAi4YSI>
X-ME-Received: <xmr:FhvMaYYLbK8H8kCbJbrnf5aivm6WXmrqhYSZ-iWwWoE_k5C_xkBAjkYRycamwIai1zaYNJ9i3SzlykU_fjR_W925P-XCBB0230p5lOIzOMILpiT8dEdgpj5tMGaegjShOAiwzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgrvhhiugcutfhh
    vghinhhssggvrhhguceouggrvhhiugesrhgvrggurghhvggrugdrvghuqeenucggtffrrg
    htthgvrhhnpeevheeugefgfeeuvdelleejhfetffehgffhieelleeuteejtefgfffhgeeh
    vdekgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgu
    sehrvggruggrhhgvrggurdgvuhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepthgvghesjhhklhhmrdhnohdprhgtphhtthhopehojh
    gvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgusehrvggruggrhhgv
    rggurdgvuh
X-ME-Proxy: <xmx:FhvMaRNaA3DCfA-vAl5NMt-G7ZW9Sox742HAnFGO-lCQ1Ie5enLsrA>
    <xmx:FhvMadahH-UCyR5im3ckeBI_I63YWqR5aWxTDKHD8gYCFZbCKMD7vg>
    <xmx:FhvMaf15vA0smbmn0OSZhRmXPi9QdC_HnuNZrQwuxMJEqFzNzQjrCg>
    <xmx:FhvMaTdSAJJ5TiIeTVKLg7fDIjFdrgpq5AUeDuIQ67BX2-efLO4Q4Q>
    <xmx:FhvMaTFwlDpZPl36cCCecqO43l3jgxuJ5dPa6fj9i5tJbU6lFz8AVMwL>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:56 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 09/16] bus1/util: add field projections
Date: Tue, 31 Mar 2026 21:03:01 +0200
Message-ID: <20260331190308.141622-10-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a utility module that provides field-projections for stable
Rust. The module is designed very similar to the official Rust field
projections (which are still unstable), but without any requirement for
compiler support.

The module explicitly uses names similar to the ones from the official
field projections, and is certainly meant to be replaced once those
become stable or are otherwise introduced into the kernel.

However, until then, this module is small and simple enough to allow
very convenient intrusive collections, and thus is included here.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 ipc/bus1/util/field.rs | 359 +++++++++++++++++++++++++++++++++++++++++
 ipc/bus1/util/mod.rs   |   2 +
 2 files changed, 361 insertions(+)
 create mode 100644 ipc/bus1/util/field.rs

diff --git a/ipc/bus1/util/field.rs b/ipc/bus1/util/field.rs
new file mode 100644
index 000000000000..e0226726278c
--- /dev/null
+++ b/ipc/bus1/util/field.rs
@@ -0,0 +1,359 @@
+//! # Field Projections
+//!
+//! This module allows generalizing over the fields of a structure. At its
+//! core is the [`Field`] trait, allowing limited type reflection.
+//!
+//! This trait is just enough to get intrusive collections working. For
+//! generalized versions of this, see
+//! [field projections](https://github.com/rust-lang/rust/issues/145383).
+
+use core::ptr::NonNull;
+use kernel::prelude::*;
+
+/// Authoritative information about a field of another type.
+///
+/// This trait asserts that [`Self::Base`] has a member field of type
+/// [`Self::Type`] at byte offset [`Self::OFFSET`]. This information is
+/// authoritative. As such, implementing this trait on *any* type must be
+/// subject to this condition.
+///
+/// All subtypes of an implementation always carry the same trait
+/// implementation. That is, an implementing type cannot be coerced into
+/// another type with a deviating implementation.
+///
+/// Commonly, this trait is automatically implemented on Field Representing
+/// Types (FRTs) by the compiler, or manually via [`impl_field`].
+///
+/// # Unsized Types
+///
+/// All involved types currently must be `Sized`. In particular, the
+/// implementing type `Self`, `Field::Base`, and `Field::Type` must be `Sized`.
+///
+/// The trait could allow unsized types, but the helpers that convert from base
+/// to field pointer cannot calculate pointer metadata without external
+/// input. Unless there is a solid design to pass around metadata, this is left
+/// for a future extension.
+///
+/// ## Safety
+///
+/// Implementing this type is only safe, if for a given valid value of type
+/// [`Self::Base`] there exists a valid value of type [`Self::Type`] at byte
+/// offset `OFFSET`, and this value is represented by a direct member field
+/// on [`Self::Base`].
+///
+/// Any subtypes of the implementing type must have an equal trait
+/// implementation. Type coercion must never lead to a deviating trait
+/// implementation.
+pub unsafe trait Field: Send + Sync + Copy {
+    /// Base containing type this field exists in.
+    type Base;
+
+    /// Type of the field.
+    type Type;
+
+    /// Offset of this field in bytes relative to the start of the base type.
+    const OFFSET: usize;
+}
+
+/// Authoritative information about a structurally pinned field.
+///
+/// This trait is an extension of [`Field`] and guarantees that the field is
+/// [structurally pinned](https://rust.docs.kernel.org/core/pin/index.html#projections-and-structural-pinning).
+///
+/// ## Safety
+///
+/// The implementation must guarantee that the field is structurally pinned.
+pub unsafe trait PinField: Field {
+}
+
+/// Reflection metadata about a field of a base type.
+///
+/// This type is used as implementing type for generated [`Field`]
+/// implementations. It is a 1-ZST and used only to represent reflection
+/// metadata about a field of a type.
+///
+/// See [`impl_field`] for its main user.
+///
+/// This type is invariant over all its type parameters.
+///
+/// ## Limitations
+///
+/// If multiple zero-sized member fields share the same offset, only a single
+/// one can be represented with this type. The compiler generated alternative
+/// in the standard library can circumvent this limitation. Without compiler
+/// support, auto-generation of such types requires other external enumerations
+/// that make usage needlessly complex. Hence, this uses the field offset
+/// as distinguisher, and thus limits the implementation.
+#[repr(C, packed)]
+pub struct FieldRepr<Base: ?Sized, Type: ?Sized, const OFFSET: usize> {
+    _base: [*mut Base; 0],
+    _type: [*mut Type; 0],
+    _offset: [(); OFFSET],
+}
+
+// SAFETY: `FieldRepr` doesn't contain any values. No subtypes exist.
+unsafe impl<Base: ?Sized, Type: ?Sized, const OFFSET: usize> Send
+for FieldRepr<Base, Type, OFFSET> {
+}
+
+// SAFETY: `FieldRepr` doesn't contain any values. No subtypes exist.
+unsafe impl<Base: ?Sized, Type: ?Sized, const OFFSET: usize> Sync
+for FieldRepr<Base, Type, OFFSET> {
+}
+
+impl<Base: ?Sized, Type: ?Sized, const OFFSET: usize> Clone
+for FieldRepr<Base, Type, OFFSET> {
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<Base: ?Sized, Type: ?Sized, const OFFSET: usize> Copy
+for FieldRepr<Base, Type, OFFSET> {
+}
+
+/// Turn a base pointer into a member field pointer.
+///
+/// This is equivalent to taking a raw pointer to a member field
+/// `&raw mut (*v).field`. Note that the base is not dereferenced for this
+/// operation.
+///
+/// ## Safety
+///
+/// The pointer `v` must point to an allocation of `BaseTy`, but that value can
+/// be uninitialized.
+pub unsafe fn field_of_ptr<Frt: Field>(v: *mut Frt::Base) -> *mut Frt::Type {
+    // SAFETY: Validity of the allocation behind `v` is delegated to the
+    //     caller. The offset calculation is guaranteed by the `Field` trait.
+    unsafe { v.byte_offset(Frt::OFFSET as isize).cast() }
+}
+
+/// Turn a base pointer into a member field pointer.
+///
+/// Works like [`field_of_ptr()`] but on [`NonNull`].
+///
+/// ## Safety
+///
+/// The pointer `v` must point to an allocation of `BaseTy`, but that value can
+/// be uninitialized.
+pub unsafe fn field_of_nn<Frt: Field>(v: NonNull<Frt::Base>) -> NonNull<Frt::Type> {
+    // SAFETY: Validity of the allocation behind `v` is delegated to the
+    //     caller. The offset calculation is guaranteed by the `Field` trait.
+    unsafe { v.byte_offset(Frt::OFFSET as isize).cast() }
+}
+
+/// Turn a field pointer into a base pointer.
+///
+/// This is the inverse of [`field_of_ptr()`]. It recreates the base pointer
+/// from the member field pointer.
+///
+/// ## Miri Stacked & Tree Borrows
+///
+/// If you require compatibility with Stacked Borrows as used in Miri, you must
+/// ensure that the field pointer was created from a reference to the base,
+/// rather than from a reference to the field. In other words, make sure that
+/// you use [`field_of_ptr()`] and then retain that raw field pointer until you
+/// need it for [`base_of_ptr()`]. Otherwise, your code will likely not be
+/// compatible with Stacked Borrows.
+///
+/// If you only require compatibility with Tree Borrows, this is not an issue.
+///
+/// ## Safety
+///
+/// The pointer `v` must point into an allocation of `BaseTy` at the offset of
+/// the member field described by `Field`, but the value can be uninitialized.
+pub unsafe fn base_of_ptr<Frt: Field>(v: *mut Frt::Type) -> *mut Frt::Base {
+    // SAFETY: Validity of the allocation behind `v` is delegated to the
+    //     caller. The offset calculation is guaranteed by the `Field` trait.
+    unsafe { v.byte_offset(-(Frt::OFFSET as isize)).cast() }
+}
+
+/// Turn a field pointer into a base pointer.
+///
+/// Works like [`base_of_ptr()`] but on [`NonNull`].
+///
+/// ## Safety
+///
+/// The pointer `v` must point into an allocation of `BaseTy` at the offset of
+/// the member field described by `Field`, but the value can be uninitialized.
+pub unsafe fn base_of_nn<Frt: Field>(v: NonNull<Frt::Type>) -> NonNull<Frt::Base> {
+    // SAFETY: Validity of the allocation behind `v` is delegated to the
+    //     caller. The offset calculation is guaranteed by the `Field` trait.
+    unsafe { v.byte_offset(-(Frt::OFFSET as isize)).cast() }
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_field_frt {
+    ($base:ty, $field:ident, $type:ty $(,)?) => {
+        $crate::util::field::FieldRepr<
+            $base,
+            $type,
+            { ::core::mem::offset_of!($base, $field) },
+        >
+    }
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_field_impl_field {
+    ($base:ty, $field:ident, $type:ty $(,)?) => {
+        // SAFETY: `FieldRepr` exposes no variance. `$field` is verified to be
+        //     a member of `$base` via `offset_of!()`, and correctness of its
+        //     type is verified apart from coercions (which we accept).
+        unsafe impl $crate::util::field::Field
+        for $crate::util::field::FieldRepr<
+            $base,
+            $type,
+            { ::core::mem::offset_of!($base, $field) },
+        > {
+            type Base = $base;
+            type Type = $type;
+            const OFFSET: usize = const {
+                // Verify the type of the member field.
+                let mut v = ::core::mem::MaybeUninit::<Self::Base>::uninit();
+                let v_ptr = core::ptr::from_mut(&mut v).cast::<Self::Base>();
+                // SAFETY: `v` is a valid allocation, a field access is safe.
+                let _: *mut Self::Type = unsafe {
+                    &raw mut ((*v_ptr).$field)
+                };
+                ::core::mem::offset_of!(Self::Base, $field)
+            };
+        }
+    }
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_field_impl_pin_field {
+    ($base:ty, $field:ident, $type:ty $(,)?) => {
+        $crate::util::field::impl_field!($base, $field, $type);
+        // SAFETY: Structural pinning of `$field` is guaranteed by the caller.
+        unsafe impl $crate::util::field::PinField
+        for $crate::util::field::FieldRepr<
+            $base,
+            $type,
+            { ::core::mem::offset_of!($base, $field) },
+        > {
+        }
+    }
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_field_field_of {
+    ($base:ty, $field:ident $(,)?) => {
+        $crate::util::field::frt!{$base, $field, _}
+    }
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_field_typed_field_of {
+    ($base:ty, $field:ident, $type:ty $(,)?) => {
+        $crate::util::field::frt!{$base, $field, $type}
+    }
+}
+
+/// Resolve to the field-representing-type (FRT).
+///
+/// This takes as arguments:
+/// - $base:ty
+/// - $field:ident
+/// - $type:ty
+///
+/// This resolves to `FieldRepr<$base, $type, ...>` with the last generic
+/// parameter set to the offset of `$field` in `$base`.
+#[doc(inline)]
+pub use util_field_frt as frt;
+
+/// Implement [`Field`] for a specific member field.
+///
+/// This takes as arguments:
+/// - $base:ty
+/// - $field:ident
+/// - $type:ty
+///
+/// This implements [`Field`] on [`FieldRepr`] with the given base type, member
+/// field name, and member field type.
+///
+/// ## Safety
+///
+/// The caller must guarantee that `$type` matches the type of the member 
+/// field `$field`. This is verified by this macro, except for possible
+/// coercions.
+#[doc(inline)]
+pub use util_field_impl_field as impl_field;
+
+/// Implement [`PinField`] for a structurally pinned member field.
+///
+/// This works like [`impl_field!`] but implements [`PinField`] on top.
+/// of [`Field`].
+///
+/// ## Safety
+///
+/// The safety requirements of [`impl_field!`] apply. On top, the caller
+/// must guarantee the field in question is structurally pinned.
+#[doc(inline)]
+pub use util_field_impl_pin_field as impl_pin_field;
+
+/// Resolve to the [`FieldRepr`] of a specific member field.
+///
+/// This takes as arguments:
+/// - $base:ty
+/// - $field:ident
+///
+/// This resolves to a specific type of [`FieldRepr`] for the specified member
+/// field. This lets the compiler auto-derive the type of the field. In
+/// situations where an auto-derive is not allowed (e.g., function signatures)
+/// use [`typed_field_of!`].
+#[doc(inline)]
+pub use util_field_field_of as field_of;
+
+/// Resolve to the typed [`FieldRepr`] of a specific member field.
+///
+/// This takes as arguments:
+/// - $base:ty
+/// - $field:ident
+/// - $type:ty
+///
+/// This resolves to a specific type of [`FieldRepr`] for the specified member
+/// field.
+#[doc(inline)]
+pub use util_field_typed_field_of as typed_field_of;
+
+#[allow(clippy::undocumented_unsafe_blocks)]
+#[kunit_tests(bus1_util_field)]
+mod test {
+    use super::*;
+
+    #[derive(Clone, Copy, Debug, PartialEq)]
+    #[repr(C, align(4))]
+    struct Test {
+        a: u16,
+        b: u8,
+        c: u32,
+    }
+
+    impl_field!(Test, a, u16);
+    impl_field!(Test, b, u8);
+    impl_pin_field!(Test, c, u32);
+
+    // Basic functionality tests for `Field` and its utilities.
+    #[test]
+    fn field_basics() {
+        assert_eq!(core::mem::size_of::<Test>(), 8);
+
+        let mut o = Test { a: 14, b: 11, c: 1444 };
+        let o_p = &raw mut o;
+
+        let f_p = unsafe { field_of_ptr::<field_of!(Test, b)>(o_p) };
+        let f_r = unsafe { &*f_p };
+        let b_p = unsafe { base_of_ptr::<field_of!(Test, b)>(f_p) };
+        let b_r = unsafe { &*b_p };
+
+        assert!(core::ptr::eq(o_p, b_p));
+        assert_eq!(*f_r, 11);
+        assert_eq!(b_r.b, 11);
+    }
+}
diff --git a/ipc/bus1/util/mod.rs b/ipc/bus1/util/mod.rs
index 4dd08c04eec6..ad1ceef35f3d 100644
--- a/ipc/bus1/util/mod.rs
+++ b/ipc/bus1/util/mod.rs
@@ -7,6 +7,8 @@
 use kernel::prelude::*;
 use kernel::sync::{Arc, ArcBorrow};
 
+pub mod field;
+
 /// Convert an Arc to its pinned version.
 ///
 /// All [`Arc`] instances are unconditionally pinned. It is always safe to
-- 
2.53.0

