Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B2D1862B2
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724410521; cv=none; b=s5GEG8Otb3AnIwrt5wAPLElOHsutEcrThPbI6LyrrJEGQKzhdUPJ7xlG5BaZ0U48rW8yRrMBNyKkW8aJyDd7gcCXx1y+uvgVIvKeK2c6hGC40qXGxxw1dMGQBnxz5o1el/ndHRRhwkqejBrYwEewCEojClKxyb8rI4WU9KwCNS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724410521; c=relaxed/simple;
	bh=RtJ/AdbxOE/GjRFBJ9fhBYT9B8CI/T2THh1h0pKLuvA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GGBkEfGd5Uypg9b5ZLogAwVXH2CqTmihqSeEtzSi/0AUYEvMLvyaRuhUyw4zkFhtj4BPp6RrnMcfaj9tCO+hzmCx3WncfYx/6QYM2QKxbyV994NUTvoPbs6ro0J6Jl2tNeY6lcICmbYKXVSh/t61FgXU6ZTwIWjJFXg8cYJmG+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WtYtqPm+; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WtYtqPm+"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-371a804f191so1043011f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724410518; x=1725015318; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cD67b7Zi6Zw8NIq2acR0psgoJQ6SLX50UoQSjEUy06g=;
        b=WtYtqPm+IpT7cZlOK4Qdiy9aT+bTpKU24f2FcRknf2BJQ1QVTmZqlB9+WHBgm+eLZP
         O2XhOJX9881haBwZWg3I8N4GhcLT1/To/l0aWmBnj+syj80fdCIAJs52TOLeDNzdzJsO
         O0bn0P5WDt/q0weCJancQmjZH3xVy9IznqvR0digNIExvMvtfR04wm+BuDyRTgVqDMHH
         zucpFA4QbcQgLUOF4PGggONAYg8EH+A5VeZ1ba4Vs8Ck51Nb+cY9+N4AfvXhg6HEKcoS
         rZC3zllOmqXnuyDGRLWEQtiVLIbvMplcOWZvh9tqH/XwUVrh2T6CJTorKnxROMhx3rpX
         LZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724410518; x=1725015318;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cD67b7Zi6Zw8NIq2acR0psgoJQ6SLX50UoQSjEUy06g=;
        b=GycvTHeUjxoI8qovnOQnfyOqtc2LiFCE3otCLgrRY7rS5WAiTa2u+PkNmuzlXkZeSQ
         cJnlGpg/CsdGFpbICuHxgz0HeCZf3iBodo1+fZuJhT8XHkfF5DZzq4xj+BWOOy8N39U7
         C6lS7UbgKH6DxzmApwrR5a51BZLSFoz6pgPyo5bl9d8Ze8xTyFXP8+WMf7RSdNFi7iON
         B5LL4etJAt4oXgo9t1H1D/neNc/YidEZoXMFe/tqMfzZ9y+jlSY/VUneQ6XMwxwTAYhu
         eBGOp2Ci7QkF7hBsYuCC2feMfSVCQhilLkMvAwsFd37/kKJ4nDRrzGYyupAk6h8jegbG
         k8mQ==
X-Gm-Message-State: AOJu0YxAZxOgmO6oaCpJGwXajn6pjuWX0NLyF5eL43DGIHXFQwyIJzE6
	Rs32gVXBOMoOJRupunQnaQHABEO6roFQuspcRxN3qsqaalvWXSDpqH++95AF4UwhIlviID220fm
	fBSop0bM4v90GArHpHyijhQ0TYamKmoUQbRwZGuQHQZ1gIdjJPUXDLSt/7lRrrrrrYcgAjU8ZZ7
	ACzNhh/D+WaJQlj45pPDQL7RkhEEX6CHjO8x96ivfzvHDjA+Wzpj7Y1NXj6BU=
X-Google-Smtp-Source: AGHT+IHeaMduo0ZOpHvpvG48IvqCUMBj12cxF7+7mapR0ZYUeqkMYDTrVMAj39aG4gwN94fhuVqtiRxgZ/xlcWg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:adf:fb92:0:b0:371:7c71:9ab0 with SMTP id
 ffacd0b85a97d-3731185ba5dmr2998f8f.5.1724410517480; Fri, 23 Aug 2024 03:55:17
 -0700 (PDT)
Date: Fri, 23 Aug 2024 10:54:53 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHxqyGYC/x2MuwqAMAwAf0UyG2ir4mMV/ABXcSiaagarpCKC+
 O8Wx4O7eyCQMAVokgeELg68+wg6TWBarV8IeY4MRplcVSbDOfoXYdisnHjs7E8SzGplS6ddodU EMT2EHN//doC+a2F83w8lyCmHawAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7293; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RtJ/AdbxOE/GjRFBJ9fhBYT9B8CI/T2THh1h0pKLuvA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmyGqQDWYcMTn8gkyb5neaOK14glRCocEwe+sts
 SaSmELUjAWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZshqkAAKCRAEWL7uWMY5
 RgbAEACJ0W1v6r9RCGO+m0RcsuB2tgoFzLEr3BwUKxKWinnCfdNSlehVODhREMEEMWYFnXxO1E8
 W/BHwUISPuLoTHAc6iHF8beVcrvdr02eSK/uZed7Y1NShuUH3Yp65gTO7eQhLWtPaDxBSsM9Cr5
 JtKmH1/tLqDXpXFvKNxUIF4PY0J+Q5bNAjALBQuwI+pjlfNyl4h/wIO+qsPMTddXgcGRJCQQqkX
 uPvQJZa0MSHRPIPi5hJK8DKbDkA/qEOkQQ8BZMwjoY0JqvE/togsC+andbJOZfrH8562TJ5PVIu
 diOI3r+mE/+cnHG2bssUkMn/5Houw+MWvAhFa5eGUxOlfe2wX79MyNcrcggstcSKZ1l68qsyTka
 Vx7RCbQz71b8ze7Ov4drkemzuwnbDfzvzD/l2uWViofDHTVQV8WfengzZ/nKRbadNpB09+01HTD
 gb9WZ7kSZ7RuBJO0g7o2b9qHbhDBxuA4O+6Hdw1pPxGKg+r4XKFWa2WMRXB8fGebEG8ALb0muBY
 r9ysYkzPwqh5OcOEGu6wdqHoOYtr6EjYMO8o6CFpSOJA/GeyeT7VOfNKGPypgWjyy4xOOCYj19m
 1t76XxTISSDSn+6HpQDv3VVjtowwhkPie1jn9gEhmL6wkIVYRRXMAOkr2TmnDEkQg43W2Psn3tR lGgkL/LDz5q1pYg==
X-Mailer: b4 0.13.0
Message-ID: <20240823-derive-smart-pointer-v1-1-53769cd37239@google.com>
Subject: [PATCH RFC] rust: experiment with `#[derive(SmartPointer)]`
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Xiangfei Ding <dingxiangfei2009@protonmail.ch>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

I am sending this RFC patch to share my experience with using the new
`#[derive(SmartPointer)]` feature [1] with our custom smart pointers.
The feature is being added so that the kernel can stop using the
unstable dispatch_from_dyn and unsize features.

In general, the feature appears to work. As can be seen in the change to
`rust_minimal.rs`, it is possible to use `Arc` together with a dynamic
trait object, and the trait object is object safe even though it uses
the custom smart pointer as a self parameter.

I did run into one nit, which is that `Arc` requires the `#[pointee]`
annotation even though there's only one generic paramter. I filed an
issue [2] about this.

Link: https://rust-lang.github.io/rfcs/3621-derive-smart-pointer.html [1]
Link: https://github.com/rust-lang/rust/issues/129465 [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/lib.rs           |  3 +--
 rust/kernel/list/arc.rs      | 23 +++--------------------
 rust/kernel/sync/arc.rs      | 24 +++++++-----------------
 samples/rust/rust_minimal.rs | 15 +++++++++++++++
 4 files changed, 26 insertions(+), 39 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9baea9e9ee1a..6f24e8095b41 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -13,10 +13,9 @@
 
 #![no_std]
 #![feature(coerce_unsized)]
-#![feature(dispatch_from_dyn)]
+#![feature(derive_smart_pointer)]
 #![feature(new_uninit)]
 #![feature(receiver_trait)]
-#![feature(unsize)]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index d801b9dc6291..d0096af6a000 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -7,7 +7,7 @@
 use crate::alloc::{AllocError, Flags};
 use crate::prelude::*;
 use crate::sync::{Arc, ArcBorrow, UniqueArc};
-use core::marker::{PhantomPinned, Unsize};
+use core::marker::{PhantomPinned, SmartPointer};
 use core::ops::Deref;
 use core::pin::Pin;
 use core::sync::atomic::{AtomicBool, Ordering};
@@ -158,8 +158,9 @@ fn try_new_list_arc(&self) -> bool {
 /// * The tracking inside `T` is aware that a `ListArc` reference exists.
 ///
 /// [`List`]: crate::list::List
+#[derive(SmartPointer)]
 #[repr(transparent)]
-pub struct ListArc<T, const ID: u64 = 0>
+pub struct ListArc<#[pointee] T, const ID: u64 = 0>
 where
     T: ListArcSafe<ID> + ?Sized,
 {
@@ -444,24 +445,6 @@ fn as_ref(&self) -> &Arc<T> {
 // This is to allow [`ListArc`] (and variants) to be used as the type of `self`.
 impl<T, const ID: u64> core::ops::Receiver for ListArc<T, ID> where T: ListArcSafe<ID> + ?Sized {}
 
-// This is to allow coercion from `ListArc<T>` to `ListArc<U>` if `T` can be converted to the
-// dynamically-sized type (DST) `U`.
-impl<T, U, const ID: u64> core::ops::CoerceUnsized<ListArc<U, ID>> for ListArc<T, ID>
-where
-    T: ListArcSafe<ID> + Unsize<U> + ?Sized,
-    U: ListArcSafe<ID> + ?Sized,
-{
-}
-
-// This is to allow `ListArc<U>` to be dispatched on when `ListArc<T>` can be coerced into
-// `ListArc<U>`.
-impl<T, U, const ID: u64> core::ops::DispatchFromDyn<ListArc<U, ID>> for ListArc<T, ID>
-where
-    T: ListArcSafe<ID> + Unsize<U> + ?Sized,
-    U: ListArcSafe<ID> + ?Sized,
-{
-}
-
 /// A utility for tracking whether a [`ListArc`] exists using an atomic.
 ///
 /// # Invariant
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3021f30fd822..c3a8b6fda7c4 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -27,7 +27,7 @@
 use core::{
     alloc::Layout,
     fmt,
-    marker::{PhantomData, Unsize},
+    marker::{PhantomData, SmartPointer},
     mem::{ManuallyDrop, MaybeUninit},
     ops::{Deref, DerefMut},
     pin::Pin,
@@ -126,7 +126,9 @@
 /// let coerced: Arc<dyn MyTrait> = obj;
 /// # Ok::<(), Error>(())
 /// ```
-pub struct Arc<T: ?Sized> {
+#[derive(SmartPointer)]
+#[repr(transparent)]
+pub struct Arc<#[pointee] T: ?Sized> {
     ptr: NonNull<ArcInner<T>>,
     _p: PhantomData<ArcInner<T>>,
 }
@@ -174,13 +176,6 @@ unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
 // This is to allow [`Arc`] (and variants) to be used as the type of `self`.
 impl<T: ?Sized> core::ops::Receiver for Arc<T> {}
 
-// This is to allow coercion from `Arc<T>` to `Arc<U>` if `T` can be converted to the
-// dynamically-sized type (DST) `U`.
-impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Arc<U>> for Arc<T> {}
-
-// This is to allow `Arc<U>` to be dispatched on when `Arc<T>` can be coerced into `Arc<U>`.
-impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<U>> for Arc<T> {}
-
 // SAFETY: It is safe to send `Arc<T>` to another thread when the underlying `T` is `Sync` because
 // it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
 // `T` to be `Send` because any thread that has an `Arc<T>` may ultimately access `T` using a
@@ -475,7 +470,9 @@ fn from(item: Pin<UniqueArc<T>>) -> Self {
 /// obj.as_arc_borrow().use_reference();
 /// # Ok::<(), Error>(())
 /// ```
-pub struct ArcBorrow<'a, T: ?Sized + 'a> {
+#[derive(SmartPointer)]
+#[repr(transparent)]
+pub struct ArcBorrow<'a, #[pointee] T: ?Sized + 'a> {
     inner: NonNull<ArcInner<T>>,
     _p: PhantomData<&'a ()>,
 }
@@ -483,13 +480,6 @@ pub struct ArcBorrow<'a, T: ?Sized + 'a> {
 // This is to allow [`ArcBorrow`] (and variants) to be used as the type of `self`.
 impl<T: ?Sized> core::ops::Receiver for ArcBorrow<'_, T> {}
 
-// This is to allow `ArcBorrow<U>` to be dispatched on when `ArcBorrow<T>` can be coerced into
-// `ArcBorrow<U>`.
-impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<ArcBorrow<'_, U>>
-    for ArcBorrow<'_, T>
-{
-}
-
 impl<T: ?Sized> Clone for ArcBorrow<'_, T> {
     fn clone(&self) -> Self {
         *self
diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
index 2a9eaab62d1c..9d947465c6c3 100644
--- a/samples/rust/rust_minimal.rs
+++ b/samples/rust/rust_minimal.rs
@@ -3,6 +3,7 @@
 //! Rust minimal sample.
 
 use kernel::prelude::*;
+use kernel::sync::Arc;
 
 module! {
     type: RustMinimal,
@@ -16,6 +17,15 @@ struct RustMinimal {
     numbers: Vec<i32>,
 }
 
+trait MyTrait {
+    fn my_fn(self: Arc<Self>);
+}
+impl MyTrait for Vec<i32> {
+    fn my_fn(self: Arc<Self>) {
+        pr_info!("{:?}", self.as_slice());
+    }
+}
+
 impl kernel::Module for RustMinimal {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Rust minimal sample (init)\n");
@@ -26,6 +36,11 @@ fn init(_module: &'static ThisModule) -> Result<Self> {
         numbers.push(108, GFP_KERNEL)?;
         numbers.push(200, GFP_KERNEL)?;
 
+        let in_arc = kernel::sync::Arc::new(numbers)?;
+        in_arc.my_fn();
+        let arc_dyn: Arc<dyn MyTrait> = in_arc;
+        arc_dyn.my_fn();
+
         Ok(RustMinimal { numbers })
     }
 }

---
base-commit: b204bbc53f958fc3119d63bf2cda5a526e7267a4
change-id: 20240823-derive-smart-pointer-390a7f1f510c

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

