Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A6B1D79A0
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733259070; cv=none; b=ffPijJMGcKUCvuI+7XFAURbzzwawgIjpwH6fJnh8gv5v7Et3NE1J5EaFwSY28fyEBm+VkZn3Bl/cc6hzogh+VpwfLhA2TTajSRA0XL4W2znQnpviZlhbzdVLDt/z2MOLMljz6/2GZ7/JqU86XQkQwVV7f3x5S75baeS3DiYp6Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733259070; c=relaxed/simple;
	bh=uh3ga+NpdDrRcmWKnKCW56Zf4OxNWTTqbwIuU6uEP0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CadIFleh8kldW6VeFE2czPb904hgjZH1iWRrFXA7TlY6QcQE/Z5GdnzTbBg/1rkrrxqy1vEB90XzQOFd4TYs9g/5wCig+xdd3Q7iagpSHwSu7dfgh0Yii6gjHZAkBkpo1kkn74V8nOIZIH7L9pfSn5pTEJ5FMNJfpL0Q/NCLMYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVsOLqo8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVsOLqo8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e0e224cbso2926604f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 12:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733259066; x=1733863866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJ0KIy6SUGpzc3r4p7paBW5CQwCc94J32YDajIvj7LY=;
        b=GVsOLqo8zEvLEmzqKodbLcZx3J9vjqQHYoj2+wxmsoALjWF5eMoffncxR/orFyJg4R
         Z1x5JsZX1ahyPDH5AfhMHpAIlU4MVhCBvBBVqVd3fUqzecW8Rw8HoOToyw8VgNWxRyEq
         pnAwYWWRAcVi9T1xu1/jR9BOQ9obbk8KHa9kDReGyT1ai3N4qGlHeKdNusDra0D+WIMz
         FaXZSgS0cN9HfLlLyD6j2tcLLVOhuM/Y+8ML6G3gMY+pfK1DjhHRQ/G8h76Or8hehuBn
         dI3mxnamxoUkZ/n5vIxjFFwjlRyI53lFskgU7AtcWhynrn6yml54MgAjPCJTtol9EzRy
         8kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733259066; x=1733863866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJ0KIy6SUGpzc3r4p7paBW5CQwCc94J32YDajIvj7LY=;
        b=ekbo19wrpiuoldTkql+pkybNdpNJlfFZyzd9R6SqD35eQ/zN3fC0o7XzY0edCVocaR
         1iNP33K0gDBuPt8a7opYNbex5llZ4HeRj+7Y7HFBm+xaOpheGdG7FEY+pBhftdDPamFx
         CZSKIlO4/WBRdy2g5K01sfRNzq8KLSYR3Ma6Bgd8zLnYZlfM3Rhdt8WSG/vBewZLmP6u
         +kibqmYYtWDw2kqrxHtGlrv3cazEhDNEhtWuKjvGtxbXF8ZCho5qsgNSgaclBS7o7C4R
         /TYflDFd8Eq6ri+1URmhDdvqsEz83CdHitZVYXAJDSeBAylIY6tuFr6dhG5sBH4QihAv
         qYPA==
X-Gm-Message-State: AOJu0Yysd3/uXWKKyKb6rl4fAlnMrY/C3CJFOO+9ZDyy1aoFFc45zdLn
	S+O2Nz/zPH93+NwpZjndhIk514yE+GEMW/+aO2/JEIaXxKtzW1zJQFffG3LaZa/06b95
X-Gm-Gg: ASbGnctmjdWnAYZKJ/pdLK1ZzL/Cv9SFXV1GnUYgfVwUvsoNRCj5DnW2HMIvYmOIRba
	X2uGbBMemF4oRoOcOnTWEaar+cogixMWi7Eiv1Wg/6vk87qgNaBcl16Ni+o3hHTH7RTTxLBfhrq
	Tki6Eh7dQK0Qbi+7Uqrl29ifelt/QeqXP2O3gKBE4sL0zyr5c94G+CsCbNGq0IWwoVzC5rufrO2
	ke9UMgIkhmkY4Ysvjcf9IijwAgy9zvANh4yuzzWAgPWHCDFxF3zUQF35TiivfbhyYJK9jcHShER
	Q+3qZeNU5nGUt6wmV2dz8EreyRBw+7EdODtwqGbiJZDbhH4=
X-Google-Smtp-Source: AGHT+IHktq/X1tS32gLykSFTOCuokJLmjWVJPkRFNk9j7ZF+lZYQgk9dDpkpb5XzhzZaxaXvv01Mhg==
X-Received: by 2002:a05:6000:1a8b:b0:385:e8ff:b9c9 with SMTP id ffacd0b85a97d-385fd43733fmr3384554f8f.42.1733259066032;
        Tue, 03 Dec 2024 12:51:06 -0800 (PST)
Received: from P7.fritz.box (p200300f987065b00bdc782375f5a57aa.dip0.t-ipconnect.de. [2003:f9:8706:5b00:bdc7:8237:5f5a:57aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dfb2d7e0sm13285863f8f.44.2024.12.03.12.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 12:51:05 -0800 (PST)
From: Xiangfei Ding <dingxiangfei2009@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: aliceryhl@google.com,
	ojeda@kernel.org,
	dingxiangfei2009@protonmail.ch,
	Xiangfei Ding <dingxiangfei2009@gmail.com>
Subject: [PATCH v2] rust: use derive(CoercePointee) on rustc >= 1.83.0
Date: Wed,  4 Dec 2024 04:47:49 +0800
Message-ID: <20241203205050.679106-2-dingxiangfei2009@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203205050.679106-1-dingxiangfei2009@gmail.com>
References: <CAH5fLggS+3K8WHV7mrgTJQhGZMNni5gj9=huQtezc4GK8bk4HA@mail.gmail.com>
 <20241203205050.679106-1-dingxiangfei2009@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel crate relies on both *coerce_unsized* and *dispatch_from_dyn*
unstable features.
Alice Ryhl has proposed [1] the introduction of the unstable macro
`SmartPointer` to reduce such dependence, along with a RFC patch [2].
Since Rust 1.81.0 this macro, later renamed to `CoercePointee` at
Rust 1.83.0, has been fully implemented with the naming discussion
resolved.

This feature is now on track to stabilization in the language.
In order to do so, we shall start using this macro in the kernel crate
to prove the functionality and utility of the macro as the justification
of its stabilization.

This patch makes this switch in such a way that the crate remains
backward compatible with older Rust compiler versions,
via the flag *RUST_COERCE_POINTEE*.

A minimal demostration code is added to the
*samples/rust/rust_print_main.rs* module.

Link: https://rust-lang.github.io/rfcs/3621-derive-smart-pointer.html [1]
Link: https://lore.kernel.org/all/20240823-derive-smart-pointer-v1-1-53769cd37239@google.com/ [2]
Signed-off-by: Xiangfei Ding <dingxiangfei2009@gmail.com>
---
Changes in v2:
- Apply the new name to the `kernel` crate
- Reformat the commit message.

 init/Kconfig                    |  3 +++
 rust/kernel/alloc.rs            |  2 +-
 rust/kernel/lib.rs              |  7 ++++---
 rust/kernel/list/arc.rs         |  9 ++++++---
 rust/kernel/sync/arc.rs         | 15 +++++++++++----
 samples/rust/rust_print_main.rs | 15 +++++++++++++++
 6 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index a20e6efd3f0f..eb9b7e24e859 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1978,6 +1978,9 @@ config RUST
 
 	  If unsure, say N.
 
+config RUST_COERCE_POINTEE
+	def_bool y if RUSTC_VERSION >= 108300
+
 config RUSTC_VERSION_TEXT
 	string
 	depends on RUST
diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index f2f7f3a53d29..fc9c9c41cd79 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -123,7 +123,7 @@ pub mod flags {
 /// [`Allocator`] is designed to be implemented as a ZST; [`Allocator`] functions do not operate on
 /// an object instance.
 ///
-/// In order to be able to support `#[derive(SmartPointer)]` later on, we need to avoid a design
+/// In order to be able to support `#[derive(CoercePointee)]` later on, we need to avoid a design
 /// that requires an `Allocator` to be instantiated, hence its functions must not contain any kind
 /// of `self` parameter.
 ///
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 04dbee70d3e6..b665a28d1c12 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -13,11 +13,12 @@
 
 #![no_std]
 #![feature(arbitrary_self_types)]
-#![feature(coerce_unsized)]
-#![feature(dispatch_from_dyn)]
+#![cfg_attr(CONFIG_RUST_COERCE_POINTEE, feature(derive_coerce_pointee))]
+#![cfg_attr(not(CONFIG_RUST_COERCE_POINTEE), feature(coerce_unsized))]
+#![cfg_attr(not(CONFIG_RUST_COERCE_POINTEE), feature(dispatch_from_dyn))]
+#![cfg_attr(not(CONFIG_RUST_COERCE_POINTEE), feature(unsize))]
 #![feature(inline_const)]
 #![feature(lint_reasons)]
-#![feature(unsize)]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 3483d8c232c4..f5b3a446eae2 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -7,7 +7,7 @@
 use crate::alloc::{AllocError, Flags};
 use crate::prelude::*;
 use crate::sync::{Arc, ArcBorrow, UniqueArc};
-use core::marker::{PhantomPinned, Unsize};
+use core::marker::PhantomPinned;
 use core::ops::Deref;
 use core::pin::Pin;
 use core::sync::atomic::{AtomicBool, Ordering};
@@ -159,6 +159,7 @@ fn try_new_list_arc(&self) -> bool {
 ///
 /// [`List`]: crate::list::List
 #[repr(transparent)]
+#[cfg_attr(CONFIG_RUST_COERCE_POINTEE, derive(core::marker::CoercePointee))]
 pub struct ListArc<T, const ID: u64 = 0>
 where
     T: ListArcSafe<ID> + ?Sized,
@@ -443,18 +444,20 @@ fn as_ref(&self) -> &Arc<T> {
 
 // This is to allow coercion from `ListArc<T>` to `ListArc<U>` if `T` can be converted to the
 // dynamically-sized type (DST) `U`.
+#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
 impl<T, U, const ID: u64> core::ops::CoerceUnsized<ListArc<U, ID>> for ListArc<T, ID>
 where
-    T: ListArcSafe<ID> + Unsize<U> + ?Sized,
+    T: ListArcSafe<ID> + core::marker::Unsize<U> + ?Sized,
     U: ListArcSafe<ID> + ?Sized,
 {
 }
 
 // This is to allow `ListArc<U>` to be dispatched on when `ListArc<T>` can be coerced into
 // `ListArc<U>`.
+#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
 impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc<T, ID>
 where
-    T: ListArcSafe<ID> + Unsize<U> + ?Sized,
+    T: ListArcSafe<ID> + core::marker::Unsize<U> + ?Sized,
     U: ListArcSafe<ID> + ?Sized,
 {
 }
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index fa4509406ee9..bca3d1f1e1b6 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -26,7 +26,7 @@
 use core::{
     alloc::Layout,
     fmt,
-    marker::{PhantomData, Unsize},
+    marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},
     pin::Pin,
@@ -125,6 +125,8 @@
 /// let coerced: Arc<dyn MyTrait> = obj;
 /// # Ok::<(), Error>(())
 /// ```
+#[repr(transparent)]
+#[cfg_attr(CONFIG_RUST_COERCE_POINTEE, derive(core::marker::CoercePointee))]
 pub struct Arc<T: ?Sized> {
     ptr: NonNull<ArcInner<T>>,
     _p: PhantomData<ArcInner<T>>,
@@ -172,10 +174,12 @@ unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
 
 // This is to allow coercion from `Arc<T>` to `Arc<U>` if `T` can be converted to the
 // dynamically-sized type (DST) `U`.
-impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Arc<U>> for Arc<T> {}
+#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
+impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Arc<U>> for Arc<T> {}
 
 // This is to allow `Arc<U>` to be dispatched on when `Arc<T>` can be coerced into `Arc<U>`.
-impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<U>> for Arc<T> {}
+#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
+impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<U>> for Arc<T> {}
 
 // SAFETY: It is safe to send `Arc<T>` to another thread when the underlying `T` is `Sync` because
 // it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
@@ -471,6 +475,8 @@ fn from(item: Pin<UniqueArc<T>>) -> Self {
 /// obj.as_arc_borrow().use_reference();
 /// # Ok::<(), Error>(())
 /// ```
+#[repr(transparent)]
+#[cfg_attr(CONFIG_RUST_COERCE_POINTEE, derive(core::marker::CoercePointee))]
 pub struct ArcBorrow<'a, T: ?Sized + 'a> {
     inner: NonNull<ArcInner<T>>,
     _p: PhantomData<&'a ()>,
@@ -478,7 +484,8 @@ pub struct ArcBorrow<'a, T: ?Sized + 'a> {
 
 // This is to allow `ArcBorrow<U>` to be dispatched on when `ArcBorrow<T>` can be coerced into
 // `ArcBorrow<U>`.
-impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<ArcBorrow<'_, U>>
+#[cfg(not(CONFIG_RUST_COERCE_POINTEE))]
+impl<T: ?Sized + core::marker::Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<ArcBorrow<'_, U>>
     for ArcBorrow<'_, T>
 {
 }
diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index aed90a6feecf..87cf5321f492 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -34,6 +34,21 @@ fn arc_print() -> Result {
     // Uses `dbg` to print, will move `c` (for temporary debugging purposes).
     dbg!(c);
 
+    {
+        use core::fmt::Display;
+        fn arc_dyn_print(arc: &Arc<dyn Display>) {
+            pr_info!("Arc<dyn Display> says {arc}");
+        }
+        // `Arc` can be used to delegate dynamic dispatch and the following is an example.
+        // Both `i32` and `&str` implements `Display`.
+        // This enables us to express a unified behaviour, contract or protocol
+        // on both `i32` and `&str` into a single `Arc` type `Arc<dyn Display>`.
+        let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
+        let a_str_display: Arc<dyn Display> = a.clone();
+        arc_dyn_print(&a_i32_display);
+        arc_dyn_print(&a_str_display);
+    }
+
     // Pretty-prints the debug formatting with lower-case hexadecimal integers.
     pr_info!("{:#x?}", a);
 
-- 
2.47.1

