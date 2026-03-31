Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6FB330B2D
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983964; cv=none; b=BMDibmkgBHK9lSmhTRgSkrb307MRgYutWjReNJ9aC0XUrhjIl/wmaY81nPNWLJ4IApj3CWW+z8J+tACvIIwL1jzsasJb9PUqGKjFZMEYZuslBbfujf0MyOO/hwiJTzrg+6Ef/kNyc1MMckNgGyOI+yny/2IpQTJeqFTORFVx/F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983964; c=relaxed/simple;
	bh=NlXLSOi3cvwBlrmzPUxSctQ7WQ2VYDVAdXSI7svmCEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9BtmLzGDUQjVjPCf9mZftvKqowye5IQByAVREapOpzIMbFKHVo0qUH5IWO+d3hNT895PvZfhFRGnT/TpIurj/JT9N7eODFQdhoehlYODq/8/PUwGiqriZYdDW+TLDmYJkNHPE8U0gilQiViGjAGiVh6gkha7d+oujDFzD78v/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=kpfnQhr1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WYs6GhL+; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="kpfnQhr1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WYs6GhL+"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id AEF7C1D000C9;
	Tue, 31 Mar 2026 15:06:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 31 Mar 2026 15:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983961; x=
	1775070361; bh=lyGqAyfoi7lgE79yFL/d3PGSHOiA9L9pIa3EDAjEk4Y=; b=k
	pfnQhr125WzhfFCxh6scu3E7gRkyQaDWmAGn2PWM3UA4Qb/bnwnc/rzSuhOSMbOr
	ZDWojZt3LwENStc2NoeI7so4CcFJ0IxQA5LcN3Q33OM8YBuJnXNLSQ9Utij3hu74
	Ns+1+WBGrm5o6/l39UfzjbZLlXJLRwvZbo+SFWQgTD3r3my0OahOKXfMZuifHS8J
	L6jptmRk+2wx9wbJk3DMOukHdy+5xwwvlwIH4W90pENrtqjxXlxtydVvS2i/mYZn
	eVs8I8Woc6uizrJwTkXWjtcKvduqD4RYzyOChgyHSD6r8HXawBDVBUQ2RRTzL8Dp
	pNnF5o9UfSLzd0Qrm+juA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983961; x=1775070361; bh=l
	yGqAyfoi7lgE79yFL/d3PGSHOiA9L9pIa3EDAjEk4Y=; b=WYs6GhL+oSTgCwq8R
	CRLFWoanmU6QJNJCCwXEODYLihCCBMBn5xQNEnAjYSziQ4Vc+ZlOdud6nbZBeoko
	BiYQIm2n2jmhvcb0t/afGG1BzfaFTNZJAT/7Pwf1vkHh/Ih2mYrGqJGIirXrR745
	U57MOKI2iMt+4259nYN0TGZavm2JozOfe8YVGwadq6+MIUX2theL/mjvUpCGOepu
	q96oiyAb8ulITxMqxbhfGROVGwsxWlqcA/Swg1KeYaganZ+gE0GXpSPz55niSWPv
	A6CBAckhQexHfXRLAfSiG2QCo55EGYLAoJHrb84WQm/Hj7+tozPjKJKf/4Vo9MR3
	9xhHw==
X-ME-Sender: <xms:GRvMaXUB9-GT2dMQgG91Sfdt0KWphLshC4EMVTp79EBBirT7DXDXmQ>
    <xme:GRvMaWl9hVLKzJteRwYGLBEpBIUTERbitYcKPgS9Ci6zrgcLraZQMmAptWxyAnhNu
    1qgwg49Bf-hXx9TMjFAYGJwlGyXu4-onEJo-obo0__O8npRmfaxs2o>
X-ME-Received: <xmr:GRvMaYbJOCrdsOTXUiI6yC0esqugc9bmXnag3kYPFiGL2wS9KvK0Dl1pbBJ5KfZpvgRJY_Q_KWM1cClxXEAsI2cfJY5alVxhvgb7TPyCJNjK5jyN5BvIWMP2zOOnDadinaOC7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepueduudehfedvtddtudfhtedutdetffdukeefudefieehveevudeutdeivdfg
    teejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepug
    grvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesrhgvrg
    gurghhvggrugdrvghu
X-ME-Proxy: <xmx:GRvMaRNA5NN2JmV_K1yLH4A5oPGIRXTV356bd0I2YNzQr2Qe2yXVXg>
    <xmx:GRvMadaPhYJ9s97W8y7y_oBJEuf9qRPWgcTNOnRaH2l8sklElAR82Q>
    <xmx:GRvMaf3P9g0EIGrM5JDBIQJJsEFPWUiSSUqy6iuSxUe028pl-nZIGQ>
    <xmx:GRvMaTfwGlwAN0mjU1HS-zPy6txo8g51QC31fi_8hhikvKjX1ZBDHA>
    <xmx:GRvMaTGeL_a7xtQvD4OettRkvH4EqusmZQZHHKufneWANm6k0It1Ae_M>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:06:00 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 11/16] bus1/util: add intrusive data-type helpers
Date: Tue, 31 Mar 2026 21:03:03 +0200
Message-ID: <20260331190308.141622-12-david@readahead.eu>
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

Add `util::intrusive` as a helper module for the different intrusive
data-types that will be added later on. At its core is the `Link`
trait. It describes the relationship between a value in a collection,
and the intrusive metadata on that type required by the collection.

`Link` is auto-derived for types that use `IntoDeref` and `FromDeref`,
as well as field projections. This means, for most usecases, the `Link`
trait is not necessary to be implemented at all.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 ipc/bus1/util/intrusive.rs | 397 +++++++++++++++++++++++++++++++++++++
 ipc/bus1/util/mod.rs       |   1 +
 2 files changed, 398 insertions(+)
 create mode 100644 ipc/bus1/util/intrusive.rs

diff --git a/ipc/bus1/util/intrusive.rs b/ipc/bus1/util/intrusive.rs
new file mode 100644
index 000000000000..d6d4656a26d7
--- /dev/null
+++ b/ipc/bus1/util/intrusive.rs
@@ -0,0 +1,397 @@
+//! # Utilities for Intrusive Data Structures
+//!
+//! Intrusive data structures store metadata of elements they manage in the
+//! element itself, rather than using support data structures. This requires
+//! users to embed the respective metadata types in their types, and annotate
+//! the data structures with sufficient information about this embedding.
+//!
+//! Intrusive data structures encode connections between elements and
+//! containing collections in the type system. Furthermore, they can often
+//! reduce or fully eliminate dynamic allocations, as well as reduce the
+//! number of pointer chases necessary to traverse a collection.
+//! On the flip side, intrusive data structures often reduce cache locality and
+//! can thus be more expensive to traverse.
+//!
+//! In general, performance and allocation pressure highly depend on the
+//! implemented algorithm, rather than on the fact whether a data structure is
+//! intrusive. But if dynamic collections free of allocations are needed,
+//! intrusive data structures are usually the only option.
+//!
+//! The biggest advantage of intrusive data structures, though, is their use
+//! of the type system to encode the possible relationships of different
+//! data types. An instance of a given data type can only be linked into a
+//! statically known number of intrusive collections at a time. The fact that
+//! metadata is directly embedded in a type can be used to deduce how a type
+//! can be hooked up into other collections. Furthermore, such relationships
+//! can be queried at runtime in constant time.
+//!
+//! ## Examples
+//!
+//! The following pseudo code shows how intrusive collections behave, based on
+//! a fictional intrusive collection called `col`. Most collections that use
+//! the utilities of this module behave in a very similar manner.
+//!
+//! ```rust,ignore
+//! // Import the fictional collection `col`.
+//! use some::intrusive::collection::col;
+//!
+//! // Data type that will be stored in the collection. The payload describes
+//! // the user controlled data that can be put into the entry. `md` is the
+//! // mandatory metadata used to store it as a node in the collection.
+//! struct Entry {
+//!     payload: u8,
+//!     md: col::Node,
+//! }
+//!
+//! // Encode that `Entry` has a node as member field called `md`. The unstable
+//! // field-projections feature of Rust would make this obsolete.
+//! util::field::impl_pin_field!(Entry, md, col::Node);
+//!
+//! // Create 3 entries, and then pin them on the stack. As an alternative, the
+//! // entries could also be dynamically allocated via `Box`, `Arc`, etc..
+//! let e0_o = Entry { payload: 0, ..Default::default() };
+//! let e1_o = Entry { payload: 1, ..Default::default() };
+//! let e2_o = Entry { payload: 2, ..Default::default() };
+//! let e0 = core::pin::pin!(e0_o);
+//! let e1 = core::pin::pin!(e1_o);
+//! let e2 = core::pin::pin!(e2_o);
+//!
+//! // Create a fictional collection called `Map`, which stores elements of
+//! // type `Entry` using the `md` member field.
+//! let map = col::Map::<col::node_of!(&Entry, md)>::new();
+//!
+//! // Nodes can be queried for their state at any time.
+//! assert!(!e0.md.is_linked());
+//! // Collections can often be queried for their relationship to a node. This
+//! // can usually be performed in O(1), but depends on the implementation.
+//! assert!(!map.contains(&e0));
+//!
+//! // Collections take ownership of a reference to an element, rather than
+//! // moving the element into the collection. In this case, a shared reference
+//! // is used. Dynamic allocations would move a `Box`, `Arc`, etc. into the
+//! // collection.
+//! map.push(&e0);
+//!
+//! // Since the used reference type implements `Clone`, the caller retains a
+//! // reference and can use it to query the collection for it.
+//! assert!(e0.md.is_linked());
+//! assert!(map.contains(&e0));
+//!
+//! // Many elements can be pushed into a collection, but a single element
+//! // cannot be in multiple collections that use the same member field node.
+//! // Assuming `push()` panics on failure, we use `try_push()` to verify that
+//! // `e0` was already pushed before.
+//! map.push(&e1);
+//! map.push(&e2);
+//! assert!(map.try_push(&e0).is_err());
+//!
+//! // Collections usually provide cursors that allow traversals that can
+//! // optionally modify the collection. In this case it is used to drop all
+//! // elements with an even payload number.
+//! let mut cursor = map.first_mut();
+//! while let Some(v) = cursor.get() {
+//!     if (v.payload % 2) == 0 {
+//!         cursor.move_next_unlink();
+//!     } else {
+//!         cursor.move_next();
+//!     }
+//! }
+//! assert!(!map.contains(&e0));
+//! assert!(map.contains(&e1));
+//! assert!(!map.contains(&e2));
+//!
+//! // Since collections own references to their elements, they can be dropped
+//! // and will automatically drop all references to contained elements.
+//! // Here, this means the elements are no longer linked anywhere and we can
+//! // get mutable access to them again (verified by using `Pin::set()`).
+//! drop(map);
+//! e0.set(Default::default());
+//! e1.set(Default::default());
+//! e2.set(Default::default());
+//! ```
+
+use core::ptr::NonNull;
+use kernel::prelude::*;
+use crate::util::{self, field};
+
+/// Link metadata for intrusive data structures.
+///
+/// This trait represents the link between nodes in an intrusive data
+/// structure. It defines how to operate with the data-type that is stored
+/// in an intrusive data structure, and how to acquire and release the
+/// metadata stored in it.
+///
+/// An intrusive data-structure is usually generic over [`Link<Node>`], where
+/// `Node` is the type of intrusive metadata used with that data structure. A
+/// user then needs to provide an implementation of `Link<Node>` for the data
+/// type they want to use. The trait defines how to get acquire and release
+/// values of this data type, and how to locate the metadata of type `Node`
+/// within that type.
+///
+/// The trait is usually not directly implemented on any of the involved types.
+/// Instead, a representing meta-type is used, similar to
+/// field-representing-types of [`field projections`](crate::util::field). This
+/// module provides such a link-representing-type as [`LinkRepr`].
+///
+/// # Default Implementation via [`Deref`](core::ops::Deref)
+///
+/// If a type implements [`IntoDeref`](field::IntoDeref), a
+/// default implementation of [`Link`] is provided via `Deref::Target` as
+/// `Link<Ref = T, Target = T::Target>`. The implementation is provided via
+/// a field-representing-type on [`LinkRepr`], and can be accessed via
+/// [`link_of!()`].
+///
+/// # Safety
+///
+/// An implementation must uphold the documented guarantees of the individual
+/// methods.
+pub unsafe trait Link<Node: ?Sized> {
+    /// Reference type that is used with an intrusive collection.
+    type Ref;
+    /// Target type that represents the borrowed version of the reference type.
+    type Target: ?Sized;
+
+    /// Acquire a reference target pointer from a reference.
+    ///
+    /// This will turn the reference into a reference target pointer and node
+    /// pointer. It is up to the caller to ensure calling [`Self::release()`]
+    /// when releasing the pointer. Otherwise, the original reference will be
+    /// leaked.
+    ///
+    /// The returned pointer is guaranteed to be convertible to a reference for
+    /// any caller-chosen lifetime `'a` where `Self::Ref: 'a`.
+    ///
+    /// Conversion to a reference is subject to exclusivity guarantees of `&`
+    /// and `&mut` (i.e., only shared refs, or no shared ref but exactly one
+    /// mutable ref).
+    ///
+    /// If, and only if, [`LinkMut`] is implemented on `Self`, mutable
+    /// references are allowed.
+    ///
+    /// Repeated calls to `acquire()` (with intermittent calls to `release()`)
+    /// produce the same pointer.
+    fn acquire(v: Pin<Self::Ref>) -> NonNull<Node>;
+
+    /// Release a reference target pointer to get back the original reference.
+    ///
+    /// # Safety
+    ///
+    /// The reference target pointer must have been acquired via
+    /// [`Self::acquire()`], and the caller must cease further use of the
+    /// pointer.
+    unsafe fn release(v: NonNull<Node>) -> Pin<Self::Ref>;
+
+    /// Project a reference target to its node.
+    ///
+    /// This allows access to a `Node` from its owning reference target,
+    /// without having access to any owning reference (`Self::Ref`).
+    ///
+    /// The returned pointer is guaranteed to be convertible to a shared
+    /// reference for any caller-chosen lifetime `'a` where `'_: 'a`.
+    ///
+    /// Repeated calls will return the same pointer, and are guaranteed to be
+    /// the inverse operation of [`Self::borrow()`].
+    // XXX: We need to investigate whether it is valid to store pointers from
+    // this in a collection itself. A collection must already own pointers to
+    // the same element, but likely not derived from a matching reference.
+    // Hence, under Stacked Borrows it will carry a different tag and thus can
+    // invalidate other tags if interior mutability is involved (needs to be
+    // verified).
+    fn project(v: &Self::Target) -> NonNull<Node>;
+
+    /// Borrow the reference target temporarily.
+    ///
+    /// # Safety
+    ///
+    /// `v` must have been from [`Self::acquire()`] and no mutable reference
+    /// can co-exist.
+    unsafe fn borrow<'a>(v: NonNull<Node>) -> Pin<&'a Self::Target>
+    where
+        Self::Ref: 'a;
+
+    /// Clone a borrow of the reference target.
+    ///
+    /// This creates a clone of the original reference type from a borrowed
+    /// node. This is only available, if the reference type implements
+    /// [`Clone`](core::clone::Clone).
+    ///
+    /// # Safety
+    ///
+    /// `v` must have been from [`Self::acquire()`] and no other reference
+    /// can co-exist.
+    unsafe fn borrow_clone(v: NonNull<Node>) -> Pin<Self::Ref>
+    where
+        Self::Ref: Clone,
+    {
+        // Create a clone by temporarily releasing and re-acquiring the
+        // original reference. Ensure a panic in the `clone()`-impl does not
+        // drop the original reference, just to be safe and avoid cascading
+        // failures.
+        let t = core::mem::ManuallyDrop::new(unsafe { Self::release(v) });
+        let r = (*t).clone();
+        let _ = Self::acquire(core::mem::ManuallyDrop::into_inner(t));
+        r
+    }
+}
+
+/// Mutability Extensions to [`Link`].
+///
+/// This trait extends [`Link`] by declaring the reference type to grant
+/// mutable access to the stored data.
+///
+/// # Safety
+///
+/// An implementation must uphold the documented guarantees of the individual
+/// methods.
+pub unsafe trait LinkMut<Node: ?Sized>: Link<Node> {
+    /// Mutably borrow the reference target temporarily.
+    ///
+    /// # Safety
+    ///
+    /// `v` must have been from [`Self::acquire()`] and no other reference
+    /// can co-exist.
+    unsafe fn borrow_mut<'a>(v: NonNull<Node>) -> Pin<&'a mut Self::Target>
+    where
+        Self::Ref: 'a;
+}
+
+/// Representation of link metadata for intrusive data structures.
+///
+/// This type is used as implementing type for [`Link`] if field projections
+/// are used to access metadata. It is a 1-ZST and only used to represent the
+/// link between nodes of an intrusive data structure.
+///
+/// This type takes the reference type of the data structure as first argument
+/// (called `Ref`), and the field-representing-type of the reference target as
+/// second argument (called `Frt`). The type is usually access via
+/// [`link_of!()`].
+///
+/// This type is invariant over all its type parameters.
+#[repr(C, packed)]
+pub struct LinkRepr<Ref: ?Sized, Frt> {
+    _ref: [*mut Ref; 0],
+    _frt: [*mut Frt; 0],
+}
+
+// SAFETY: Upholds method guarantees.
+unsafe impl<Ref, Frt> Link<Frt::Type> for LinkRepr<Ref, Frt>
+where
+    Ref: util::convert::FromDeref,
+    Frt: field::PinField<Base = Ref::Target>,
+{
+    type Ref = Ref;
+    type Target = Frt::Base;
+
+    fn acquire(v: Pin<Self::Ref>) -> NonNull<Frt::Type> {
+        let target = Ref::pin_into_deref(v);
+        // SAFETY: `target` was just acquired from `pin_into_deref()`, which
+        //     guarantees that the result is convertible to a reference. A
+        //     field projection thus cannot be `NULL`.
+        unsafe {
+            NonNull::new_unchecked(
+                field::field_of_ptr::<Frt>(target.as_ptr())
+            )
+        }
+    }
+
+    unsafe fn release(v: NonNull<Frt::Type>) -> Pin<Self::Ref> {
+        // SAFETY: Caller guarantees that `v` was from `acquire()`, and
+        //     thus points into an allocation of `Frt::Type` within a
+        //     `Self::Target`. Hence, `base_of_ptr()` is safe to call and
+        //     cannot return `NULL`.
+        let target = unsafe {
+            NonNull::new_unchecked(field::base_of_ptr::<Frt>(v.as_ptr()))
+        };
+        // SAFETY: Caller guarantees that `v` was from `acquire()`, and thus
+        //     from `pin_into_deref()`. They also guarantee to cease using `v`.
+        unsafe { util::convert::FromDeref::pin_from_deref(target) }
+    }
+
+    fn project(v: &Self::Target) -> NonNull<Frt::Type> {
+        // SAFETY: `v` is a valid reference, so it must point to a valid
+        //     allocation.
+        unsafe {
+            NonNull::new_unchecked(
+                field::field_of_ptr::<Frt>(core::ptr::from_ref(v).cast_mut())
+            )
+        }
+    }
+
+    unsafe fn borrow<'a>(v: NonNull<Frt::Type>) -> Pin<&'a Self::Target>
+    where
+        Self::Ref: 'a,
+    {
+        // SAFETY: Caller guarantees that `v` was from `acquire()`, and
+        //     thus points into an allocation of `Frt::Type` within a
+        //     `Self::Target`. Hence, `base_of_ptr()` is safe to call and
+        //     is pinned.
+        //     Caller also guarantees that no mutable reference exists.
+        unsafe { Pin::new_unchecked(&*field::base_of_ptr::<Frt>(v.as_ptr())) }
+    }
+}
+
+// SAFETY: Upholds method guarantees.
+unsafe impl<Ref, Frt> LinkMut<Frt::Type> for LinkRepr<Ref, Frt>
+where
+    Ref: util::convert::FromDeref,
+    Frt: field::PinField<Base = Ref::Target>,
+{
+    unsafe fn borrow_mut<'a>(v: NonNull<Frt::Type>) -> Pin<&'a mut Self::Target>
+    where
+        Self::Ref: 'a,
+    {
+        // SAFETY: Caller guarantees that `v` was from `acquire()`, and
+        //     thus points into an allocation of `Frt::Type` within a
+        //     `Self::Target`. Hence, `base_of_ptr()` is safe to call and
+        //     is pinned.
+        //     Caller also guarantees that no other reference exists.
+        unsafe { Pin::new_unchecked(&mut *field::base_of_ptr::<Frt>(v.as_ptr())) }
+    }
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_intrusive_lrt {
+    ($ref:ty, $deref:ty, $field:ident, $node:ty $(,)?) => {
+        $crate::util::intrusive::LinkRepr<$ref, $crate::util::field::typed_field_of!{$deref, $field, $node}>
+    }
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! util_intrusive_link_of {
+    ($ref:ty, $field:ident, $node:ty $(,)?) => {
+        $crate::util::intrusive::lrt!{
+            $ref,
+            <$ref as core::ops::Deref>::Target,
+            $field,
+            $node,
+        }
+    }
+}
+
+/// Resolve to the link-representing-type (LRT).
+///
+/// This takes as arguments:
+/// - $ref:ty
+/// - $deref:ty
+/// - $field:ident
+/// - $node:ty
+///
+/// And resolves to `LinkRepr<$ref, typed_field_of!($deref, $field, $node)>`
+/// using a field-representing-type.
+#[doc(inline)]
+pub use crate::util_intrusive_lrt as lrt;
+
+/// Resolve to [`LinkRepr`] of a reference type.
+///
+/// This takes as arguments:
+/// - $ref:ty
+/// - $field:ident
+/// - $node:ty
+///
+/// It resolves to a type implementing [`Link<$node>`], using
+/// [`Deref`](core::ops::Deref) on `$ref` as reference target and its
+/// field-representing-type with `$field` as member name.
+#[doc(inline)]
+pub use crate::util_intrusive_link_of as link_of;
diff --git a/ipc/bus1/util/mod.rs b/ipc/bus1/util/mod.rs
index b8922cfb74cc..bcd6eedff85a 100644
--- a/ipc/bus1/util/mod.rs
+++ b/ipc/bus1/util/mod.rs
@@ -9,6 +9,7 @@
 
 pub mod convert;
 pub mod field;
+pub mod intrusive;
 
 /// Convert an Arc to its pinned version.
 ///
-- 
2.53.0

