Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A211FBEA9
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Dec 2024 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134231; cv=none; b=YTl+hldQRM3uACoLZcG2xvwPnDni2JcDrPMC6G1x0gwko8g/Hx2DaeBkSi7IIa8BU90wVSZzbJ1YFgsXxBssMXa1hMqy+JzQ5wjl7CricJ9Ex9qSbz5t3rywz1qkLEZQfMxgMr+wxW/cdrA+aFxP88Bjioq9KcUTMLiIstOPfKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134231; c=relaxed/simple;
	bh=i1LrBgaX5V4ULoTLFRphmE6z7m4aK91gkCJPILr97lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RrRYC+R8JD5cuNGVUR9cyqqZOQXvXPFnwljSRB+wNgLZ7GvepGdg9jEsfo70RsLHgcrmGagnDuV7Mb3kE+tZoj+JdbvRp+YfYCcVan/yrqRywV921PchQ4nXUDhMLDIr08xpfcJEH4vYPCLLN0rOfg68U97YbjmwVMJv4L1PZb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbNA80pR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbNA80pR"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53de7321675so4077649e87.2
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Dec 2024 02:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733134227; x=1733739027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYUN79yTvxUGTP37eFMgsRdjIc31xY0fSZ118meDgS8=;
        b=AbNA80pREmTdSztdMt7bULenYDyC/LpMlTpmJZCib1wY2DtEAV2LgthXLCd7r8OP+y
         w7zmuPXKEDV05Tww+rlrUYMtj5pLGLAc/vU56hdXUmN3NMPvWg6LYQuhLOxAq+rs9+DJ
         CaXxIftO7SSFB/2xP44sPLJVxNQT0BpF/Hcopgon/y7dl1LJID9QIcVBR1LurANG2R4z
         VCElIw3GyYExMY2zI4zgTPY1LpyOji5afRlXSOV1nRH86jPVbM6yg7hSDt7439M76bRF
         qpAWQLg7zLarDCYHc+WmIbDOhAMllj4J9jXzhEZN6CAer95uNClD6s2lQp8OQ0KKoErg
         uZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134227; x=1733739027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYUN79yTvxUGTP37eFMgsRdjIc31xY0fSZ118meDgS8=;
        b=ggv7JNxbix2KXRVAdsQjriU7iPZP2AtgyG9JuzsfoG7ittgSZDcB68Cd+jOpEF4QuE
         YPGzipDp+/9I4nVHPCUfL03zTTj6tuKX+xTFoF7d9EGVgtl8cpZ3E975mI8iPGPaYkFp
         54xLs4DBAIExZ+zAnKnUVxaclNIIG4v87FreDSwglQARxZJyUrjJB30k4oPpTP54iIyA
         KDLfxYcsVmgJBqEuJGOV0DM5wOJznCPjIspoUvrkFFOQslJeJiCc4rekr1LdqwZgfAQs
         M8lHvQijd3qzeAEpbU2EFg3mc5C3n2B/TRNvdghEuQadusujBNLdIxW8eJ4/YLtH9KZM
         AGtQ==
X-Gm-Message-State: AOJu0YwACZqAKO77bPyMyTu3yeTpRCfHWqkw2MLelBuB6e6hePH5SSQE
	L6P95gznnZH7i9Pps+AdsDAJTrCoPO9C/fCvk1TadLDVihkPPdLOQpATGidR8YH1hT4G
X-Gm-Gg: ASbGncviQNgRWTezdIWLx9dxwVmZY2lWdHXwOsp0873ShQni2TALSU7EvLRe5jgFnBA
	WzNh5lDf4Spl0N+/zmNS7Vrbs9WubiUOVbr3dm6nmMbyuedgZKpD7BAwl2iP5Q+MNn5Pr26DwFU
	cncC7oDSIYiFqItRDp0G4sl5ozAIim4lQvenBSYj26jwBeD8iITCDH+hy34WgYLKBcdafHAOGdH
	uTY6yZSMfLrAqv+Xp9HLdsPUj85P1yJwuawB9Qicr/AlUT+89EHa4NVZO7kkS/lsx4gO+EnaXAZ
	rAkjOAv/PJnb4tYWw0pq9LeOl7JJici2S6v8CGy7WaMBHWg=
X-Google-Smtp-Source: AGHT+IGXWVw52NpssZkA0auZSBWbtlJ9SAAzp5g8ekW8clIBF/NsSg12PFpgGleg3a7p6Okg4s3XFg==
X-Received: by 2002:a05:6512:3a8e:b0:53d:ede4:35ff with SMTP id 2adb3069b0e04-53df00ff716mr12635561e87.38.1733134226509;
        Mon, 02 Dec 2024 02:10:26 -0800 (PST)
Received: from P7.fritz.box (p200300f987065b00bdc782375f5a57aa.dip0.t-ipconnect.de. [2003:f9:8706:5b00:bdc7:8237:5f5a:57aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa764474sm175799125e9.10.2024.12.02.02.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:10:25 -0800 (PST)
From: Xiangfei Ding <dingxiangfei2009@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: aliceryhl@google.com,
	ojeda@kernel.org,
	dingxiangfei2009@protonmail.ch,
	Xiangfei Ding <dingxiangfei2009@gmail.com>
Subject: [PATCH] rust: use derive(CoercePointee) on rustc >= 1.83.0
Date: Mon,  2 Dec 2024 18:09:48 +0800
Message-ID: <20241202100948.2416372-1-dingxiangfei2009@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel crate relies on both *coerce_unsized*
and *dispatch_from_dyn* unstable features.
Alice Ryhl has proposed [1] the introduction of
the unstable macro `SmartPointer` to reduce such
dependence, along with a RFC patch [2].
Since Rust 1.81.0 this macro, later renamed to
`CoercePointee` at Rust 1.83.0, has been fully
implemented with the naming discussion resolved.

This feature is now on track to stabilization
in the language. In order to do so, we shall start
using this macro in the kernel crate to prove the
functionality and utility of the macro as
the justification of its stabilization.

This patch makes this switch in such a way that
the crate remains backward compatible with older
Rust compiler versions, via the flag
*RUST_COERCE_POINTEE*.

A minimal demostration code is added to
the *samples/rust/rust_print_main.rs* module.

Link: https://rust-lang.github.io/rfcs/3621-derive-smart-pointer.html [1]
Link: https://lore.kernel.org/all/20240823-derive-smart-pointer-v1-1-53769cd37239@google.com/ [2]
Signed-off-by: Xiangfei Ding <dingxiangfei2009@gmail.com>
---
 init/Kconfig                    |  3 +++
 rust/kernel/lib.rs              |  7 ++++---
 rust/kernel/list/arc.rs         |  9 ++++++---
 rust/kernel/sync/arc.rs         | 15 +++++++++++----
 samples/rust/rust_print_main.rs | 15 +++++++++++++++
 5 files changed, 39 insertions(+), 10 deletions(-)

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
2.47.0

