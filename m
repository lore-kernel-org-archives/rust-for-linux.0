Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED1B3A255D
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983962; cv=none; b=hRtu3j4YXPV1QdLedKpO27iH0rPg0Y8nF1HFMwp1wns8c8BBEnZ6kKa6w7+pLYjDMVp5Aj+bzfCO+iYGm8FctAufoThdXthpSOhYG50T+cLSZqWv5QdpprpoIXsgQAbmyt/4fWBARL3jvDRkb2nbIp+XpsZda3VttK9ffk7IJOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983962; c=relaxed/simple;
	bh=xtujbG6ays57Xw0ww2I3pg6qtCOd2WvL0uWfw8TZ5RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXln+kuL8Woz6Nd1sx5d6/ZZU7WcW8DbDfGoU4HJ2of77pNFxLCFk8S784LqxZojY74/ezW/CDOXogpjAlOzSCtCp0NtzbgdE6BwSQ4DKg8NdE0NBoeahWqJlwbGAXZvFnkGffRk5iYGEEqG1H6jrPjqvR3IOtLyAjnjRsVqUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=Uevtes09; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R33I4jy4; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="Uevtes09";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R33I4jy4"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 2418C1D00053;
	Tue, 31 Mar 2026 15:06:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 31 Mar 2026 15:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983959; x=
	1775070359; bh=u2eR2LHB1509Rt25r2lzBioEwzOiW30UJDk6w0uikAQ=; b=U
	evtes09kJjEKvpoMbRTaLMHMFVPzck3VqMzwi3OWv7vmkqsnO8e7//A91C6Srh2n
	NGMXeGxSPg7YfLia3i/xCwamL/7Ug4utIdusJWcssFfhUdu1MpBpE5Q+8VFykx6g
	MtNtBd+FiXo8z7PBsZybxIuuhLzRDkxtzQ6LfBb4JlXlobGykrMaBnhRPWZnSvYC
	/OOBGJmRcFzUVLNT+GgZVGqsooJwAhwrQGXGUs0CiMRZgWO/tts7uhBIg1w01o2p
	viIM1ZGCNB6CDPDXeHQO3eIQjugqfxzLRTFGbenJcTTOQQOHx8mS+T+EBwFNrt10
	LUzDDth4cg/XM5QwQV0+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983959; x=1775070359; bh=u
	2eR2LHB1509Rt25r2lzBioEwzOiW30UJDk6w0uikAQ=; b=R33I4jy4HwSozAS3b
	cQ7+owCEChK4M9mIqTldLmpvwfLtJLX3IjRFY3NTD9qoOtFPQpKkk9dPfAiVpTmT
	MvVggvUrU1++g9fpuu+2iXaPW4nOTAk7H0j4Xqg09/ce9tl6xCtq9Php9By+BcTH
	sDMg+TcfVpjQ1M48G1gPY8k5ymojCcF8/3+tBJa4wAjnItcLl/wwsES8ciVjz57w
	6u7TwsqGY5p0q2IVjcFoFC1CHgAuApDmv6TRwMSYeaZR9c9k8nrx1O0shVPTFwRy
	WL7uRBF99MaGV6B8LQwW/dIkJp2T2/EArmbChpG/ljOgIpjvcNYrohC1ENqGyefy
	vN7hg==
X-ME-Sender: <xms:FxvMaWzeYMQ9BVPLq0eI8SOwsQHkzNICbIJK1EvdxETaIhrVsLHYbQ>
    <xme:FxvMaZR80rvqokejq-Qvyq2s0jr4Hbox-d4_0hvhIYIV50lt354bRKK0GTEh6aeN2
    fsWUIoK8fMi_HLk2WQU-jK5Uv5aHU99P5PBNvOW75_UhrLVMeGvwwsH>
X-ME-Received: <xmr:FxvMadUQ5rKjbDVkgTOs9EWU9gqIIzGVqxftd0HoBp0_YmCNG2Lay0YkeXTQCtMSaCW66hyUo9OTIVgoucmUtlgQoVz1KDiXOzGdZNkryoaQsfSUHNCapGuhcv0aJjIB8Tkf6Q>
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
X-ME-Proxy: <xmx:FxvMabaWkPLNwMzk0JELRAPapeQqU_JQSCnFglN2XshOhYuCcTgNEw>
    <xmx:FxvMaT3lAKBxWLRMts5YvUpmjK-mJryRwjO7ZTG2CmYnkhTYeKsvWg>
    <xmx:FxvMadi2KHc1-ub6Xs_Xcw6MmLb28cmoKVDKT_0ag8n_dJiEpdZkMQ>
    <xmx:FxvMaXb9prf9ANAtuaK7m3biMXSlq5FnrxG7EOAFypuWEecd_7UHug>
    <xmx:FxvMaTjY7ApT5_v3QyNeMdYvBTGNkjOkmEcL28DEaguTGxkpjHcv-Zgt>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:58 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 10/16] bus1/util: add IntoDeref/FromDeref
Date: Tue, 31 Mar 2026 21:03:02 +0200
Message-ID: <20260331190308.141622-11-david@readahead.eu>
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

Introduce two new utility traits: IntoDeref and FromDeref.

The traits are an abstraction for `Box::into_raw()` and
`Box::from_raw()`, as well as their equivalents in `Arc`. At the same
time, the traits can be implemented for plain references as no-ops.

The traits will be used by intrusive collections to generalize over the
data-type stored in a collection, without moving the actual data into
the collection.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 ipc/bus1/util/convert.rs | 259 +++++++++++++++++++++++++++++++++++++++
 ipc/bus1/util/mod.rs     |   1 +
 2 files changed, 260 insertions(+)
 create mode 100644 ipc/bus1/util/convert.rs

diff --git a/ipc/bus1/util/convert.rs b/ipc/bus1/util/convert.rs
new file mode 100644
index 000000000000..2b918f3b7db2
--- /dev/null
+++ b/ipc/bus1/util/convert.rs
@@ -0,0 +1,259 @@
+//! # Utilities for conversions between types
+//!
+//! This module contains utilities to help dealing with conversions between
+//! types.
+
+use core::ptr::NonNull;
+use kernel::prelude::*;
+use crate::util;
+
+/// Convert a value into a raw pointer to its dereferenced value.
+///
+/// This trait extends [`core::ops::Deref`] and allows converting a value
+/// into a raw pointer to its dereferenced value. While
+/// [`core::ops::Deref`] retains the original value and merely borrows to
+/// dereference it, [`IntoDeref`] actually converts the value into a raw
+/// pointer to the dereferenced value without retaining the original.
+///
+/// Note that in many cases this will leak the original value if no extra
+/// steps are taken. Usually, you want to restore the original value to ensure
+/// the correct drop handlers are run (see [`FromDeref`]).
+///
+/// This trait is a generic version of
+/// [`Box::into_raw()`](kernel::alloc::Box::into_raw),
+/// [`Arc::into_raw()`](kernel::sync::Arc::into_raw), and more.
+///
+/// ## Mutability
+///
+/// [`IntoDeref`] serves for immutable and mutable conversions. The returned
+/// pointer does not reflect whether mutable access is granted. That is, the
+/// trait can be used for owned values like [`Box`](kernel::alloc::Box)
+/// where mutable access is granted, and shared values like
+/// [`Arc`](kernel::sync::Arc) where no mutable access is granted.
+///
+/// If [`DerefMut`] is implemented as well, then the value is available
+/// mutably. If it is not implemented, then mutably is left undefined.
+///
+/// ## Safety
+///
+/// The implementations of [`Deref`](core::ops::Deref) and [`IntoDeref`] must
+/// be compatible. That is, `deref()` must return the same pointer as
+/// `into_deref()`. If [`DerefMut`] is implemented, `deref_mut()` must also
+/// return the same pointer.
+///
+/// Furthermore, for types that provide [pinned](core::pin) variants,
+/// [`IntoDeref`] is part of the safety requirements of
+/// [`core::pin::Pin::new_unchecked()`] just like
+/// [`Deref`](core::ops::Deref) is.
+///
+/// An implementation must uphold the documented guarantees of the individual
+/// methods.
+pub unsafe trait IntoDeref: Sized + core::ops::Deref {
+    /// Convert a value into a raw pointer to its dereferenced value.
+    ///
+    /// This consumes a dereferencable value and yields a raw pointer
+    /// to the dereferenced value.
+    ///
+    /// The returned pointer is guaranteed to be convertible to a shared
+    /// reference for any caller-chosen lifetime `'a` where `Self: 'a`.
+    ///
+    /// If [`DerefMut`](core::ops::DerefMut) is implemented for [`Self`],
+    /// then the pointer is guaranteed to be convertible to a mutable
+    /// reference for any caller-chosen lifetime `'a` where `Self: 'a`.
+    ///
+    /// Conversion to a reference is subject to exclusivity guarantees as
+    /// required by `&` and `&mut`.
+    fn into_deref(v: Self) -> NonNull<Self::Target>;
+
+    /// Convert a pinned value into a raw pointer to its dereferenced value.
+    ///
+    /// This is the pinned equivalent of [`Self::into_deref()`]. The pointer
+    /// is only convertible to a pinned reference.
+    fn pin_into_deref(v: Pin<Self>) -> NonNull<Self::Target> {
+        // SAFETY: Pinned types must ensure they uphold pinning guarantees
+        //     just like `Deref` does (see trait requirements).
+        Self::into_deref(unsafe { Pin::into_inner_unchecked(v) })
+    }
+}
+
+/// Convert a dereferenced value back to its original value.
+///
+/// This trait provides the inverse operation of [`IntoDeref`]. It takes a
+/// raw pointer to a dereferenced value and restores the original pointer.
+/// This operation is unsafe and requires the caller to guarantee that the
+/// pointer was acquired via [`IntoDeref`] or similar means.
+///
+/// This trait is a generic version of
+/// [`Box::from_raw()`](kernel::alloc::Box::from_raw),
+/// [`Arc::from_raw()`](kernel::sync::Arc::from_raw), and more.
+///
+/// ## Safety
+///
+/// An implementation must uphold the documented guarantees of the individual
+/// methods.
+pub unsafe trait FromDeref: IntoDeref {
+    /// Convert a dereferenced value back to its original value.
+    ///
+    /// This returns the value that was originally passed to
+    /// [`IntoDeref::into_deref()`].
+    ///
+    /// ## Safety
+    ///
+    /// The wrapped pointer must have been acquired via [`IntoDeref`] or a
+    /// matching equivalent.
+    ///
+    /// The caller must guarantee that they do not make use of any retained
+    /// copies of the wrapped pointer.
+    ///
+    /// It is always safe to call this on values obtained via [`IntoDeref`], as
+    /// long as the raw pointer is no longer used afterwards.
+    unsafe fn from_deref(v: NonNull<Self::Target>) -> Self;
+
+    /// Convert a dereferenced value back to its original pinned value.
+    ///
+    /// This is the pinned equivalent of [`Self::from_deref()`].
+    ///
+    /// ## Safety
+    ///
+    /// The caller must guarantee that the original value was a pinned pointer.
+    /// Furthermore, all requirements of [`Self::from_deref()`] apply.
+    unsafe fn pin_from_deref(v: NonNull<Self::Target>) -> Pin<Self> {
+        // SAFETY: Pinned types must ensure they uphold pinning guarantees
+        //     just like `Deref` does (see trait requirements of `IntoDeref`).
+        //     Also, the caller must ensure the original value was pinned.
+        unsafe { Pin::new_unchecked(Self::from_deref(v)) }
+    }
+}
+
+mod impls {
+    use super::*;
+    use kernel::alloc::{Allocator, Box};
+    use kernel::sync::Arc;
+
+    // SAFETY: Coherent with `Deref` and pinning. Upholds method guarantees.
+    unsafe impl<T: ?Sized> IntoDeref for &T {
+        fn into_deref(v: Self) -> NonNull<Self::Target> {
+            util::nonnull_from_ref(v)
+        }
+    }
+
+    // SAFETY: Upholds method guarantees.
+    unsafe impl<T: ?Sized> FromDeref for &T {
+        unsafe fn from_deref(v: NonNull<Self::Target>) -> Self {
+            // SAFETY: Caller guarantees `v` is a `&T`.
+            unsafe { v.as_ref() }
+        }
+    }
+
+    // SAFETY: Coherent with `Deref` and pinning. Upholds method guarantees.
+    unsafe impl<T: ?Sized> IntoDeref for &mut T {
+        fn into_deref(v: Self) -> NonNull<Self::Target> {
+            util::nonnull_from_mut(v)
+        }
+    }
+
+    // SAFETY: Upholds method guarantees.
+    unsafe impl<T: ?Sized> FromDeref for &mut T {
+        unsafe fn from_deref(mut v: NonNull<Self::Target>) -> Self {
+            // SAFETY: Caller guarantees `v` is a `&mut T`.
+            unsafe { v.as_mut() }
+        }
+    }
+
+    // SAFETY: Coherent with `Deref` and pinning. Upholds method guarantees.
+    unsafe impl<T: ?Sized, A: Allocator> IntoDeref for Box<T, A> {
+        fn into_deref(v: Self) -> NonNull<Self::Target> {
+            // SAFETY: `Box::into_raw()` never returns NULL.
+            unsafe { NonNull::new_unchecked(Box::into_raw(v)) }
+        }
+    }
+
+    // SAFETY: Upholds method guarantees.
+    unsafe impl<T: ?Sized, A: Allocator> FromDeref for Box<T, A> {
+        unsafe fn from_deref(v: NonNull<Self::Target>) -> Self {
+            // SAFETY: Caller guarantees `v` is from `IntoDeref`.
+            unsafe { Box::from_raw(v.as_ptr()) }
+        }
+    }
+
+    // SAFETY: Coherent with `Deref` and pinning. Upholds method guarantees.
+    unsafe impl<T: ?Sized> IntoDeref for Arc<T> {
+        fn into_deref(v: Self) -> NonNull<Self::Target> {
+            // SAFETY: `Arc::into_raw()` never returns NULL.
+            unsafe { NonNull::new_unchecked(Arc::into_raw(v).cast_mut()) }
+        }
+    }
+
+    // SAFETY: Upholds method guarantees.
+    unsafe impl<T: ?Sized> FromDeref for Arc<T> {
+        unsafe fn from_deref(v: NonNull<Self::Target>) -> Self {
+            // SAFETY: Caller guarantees `v` is from `IntoDeref`.
+            unsafe { Arc::from_raw(v.as_ptr()) }
+        }
+    }
+}
+
+#[allow(clippy::undocumented_unsafe_blocks)]
+#[kunit_tests(bus1_util_convert)]
+mod test {
+    use super::*;
+    use kernel::alloc::KBox;
+    use kernel::sync::Arc;
+
+    #[test]
+    fn into_from_deref() {
+        let mut v: u64 = 71;
+
+        {
+            let p: *const u64 = &raw const v;
+            let f: &u64 = &v;
+
+            let d: NonNull<u64> = IntoDeref::into_deref(f);
+            assert_eq!(71, unsafe { *d.as_ref() });
+            assert!(core::ptr::eq(p, d.as_ptr()));
+
+            let r: &u64 = unsafe { FromDeref::from_deref(d) };
+            assert_eq!(71, *r);
+            assert!(core::ptr::eq(p, r));
+        }
+
+        {
+            let p: *mut u64 = &raw mut v;
+            let f: &mut u64 = &mut v;
+
+            let d: NonNull<u64> = IntoDeref::into_deref(f);
+            assert_eq!(71, unsafe { *d.as_ref() });
+            assert!(core::ptr::eq(p, d.as_ptr()));
+
+            let r: &mut u64 = unsafe { FromDeref::from_deref(d) };
+            assert_eq!(71, *r);
+            assert!(core::ptr::eq(p, r));
+        }
+
+        {
+            let f: KBox<u64> = KBox::new(v, GFP_KERNEL).unwrap();
+            let p: *const u64 = &raw const *f;
+
+            let d: NonNull<u64> = IntoDeref::into_deref(f);
+            assert_eq!(71, unsafe { *d.as_ref() });
+            assert!(core::ptr::eq(p, d.as_ptr()));
+
+            let r: KBox<u64> = unsafe { FromDeref::from_deref(d) };
+            assert_eq!(71, *r);
+            assert!(core::ptr::eq(p, &raw const *r));
+        }
+
+        {
+            let f: Arc<u64> = Arc::new(v, GFP_KERNEL).unwrap();
+            let p: *const u64 = &raw const *f;
+
+            let d: NonNull<u64> = IntoDeref::into_deref(f);
+            assert_eq!(71, unsafe { *d.as_ref() });
+            assert!(core::ptr::eq(p, d.as_ptr()));
+
+            let r: Arc<u64> = unsafe { FromDeref::from_deref(d) };
+            assert_eq!(71, *r);
+            assert!(core::ptr::eq(p, &raw const *r));
+        }
+    }
+}
diff --git a/ipc/bus1/util/mod.rs b/ipc/bus1/util/mod.rs
index ad1ceef35f3d..b8922cfb74cc 100644
--- a/ipc/bus1/util/mod.rs
+++ b/ipc/bus1/util/mod.rs
@@ -7,6 +7,7 @@
 use kernel::prelude::*;
 use kernel::sync::{Arc, ArcBorrow};
 
+pub mod convert;
 pub mod field;
 
 /// Convert an Arc to its pinned version.
-- 
2.53.0

