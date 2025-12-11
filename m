Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9252E2665
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765453145; cv=none; b=n5pYaSTJaH2OZUBg3kf3dvTMTyqw8crQY8lVN02iBWoFs8Q1ZoglY9OcCSAxfWjg8fn7dHRhL1x+O1O5TRvh5v/O3quMDa8owyBTj8S5LOPMZo7hTt2niScvWRvmqhGMW00QHqwMuAgyjxjIP1qFVs99X1Y+ZF6MJLCHqsv/PHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765453145; c=relaxed/simple;
	bh=BvJ4kyv3pRIV2pGFYDzqAEMbl0n5tP9CblqGAL7sShM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndfWSmz4hKsjtwY/rzvwXov2IzXegKLLDyF0g6Jh3Ub+kZjpYeKLOA2G+i0h6lBJe5KV+DIrtOGsIRUCWeBYucxijXwQr+oJQteYwrqGyywaQufZLb/pD3jPoy48vuswbXz7N3c2jFf2KuZJ46sPKeVR6dcPXeBarv4ilzeVu6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYozub2n; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYozub2n"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3437af8444cso1003699a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 03:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765453143; x=1766057943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJvNtpunMeiUqKvy611XprNFLGOO9Ya35bENmnzTer8=;
        b=mYozub2naKnLxWsACTZAi4BCHWcjKDdoy6Rz6+/GJCmQlk3SSdkMnZ2hG83mq3Ucqp
         TC1gdrtnF/ssHYMfEuB3uMQPCEE0y/lj3wHHx12Seegrz/K3SirVGzqUGwTjhOmsaFmo
         7p5FBgwsC6bmSiMnXSSzxixmNyPh2Jz07CCqjTww2Ycqv3HminiQI4xmdccfY9T68TvM
         d9n1DWxQPu9GjaZ6HASe+mohSKsy1cuTJq8Qi8k6JiFNrMjkKr18CxSVN73uB2UQpSlM
         hEAo9iz/KjpvVPPTfpsdGjfaHbFdRuebEM1JJvfcG7OCOKXLPYowsP9WCkXz3ZgGGGoj
         x2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765453143; x=1766057943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mJvNtpunMeiUqKvy611XprNFLGOO9Ya35bENmnzTer8=;
        b=WUiGYusgpSGLvdS8AmhB750UBhyvHT8kOoE1rp/7zh9G9N++X3cPVSXxAgTK1mlG3b
         a+U88JUo8PyHdtRn50XnS9Ka8oX8zPFVnzR5qXrwYYOGGR1p5A/+qx5a6MrhGHPDZe0p
         hMKzZ5w/dq0Zp3z3QtzWH34xJEMgzuIXiETwg2nygCwCmVWlXtSST0OmH/g7KQv+OK4r
         gOdiYgksybX/1hhqWhxdRtGDKkfkIGyglza3sjvlFvdcnIbOOArmcah24M8oeUYv/+kE
         EC5ie7cjIXsgZpQvU/DBSDlaXXopHX2QF4hoxTLhHhByvLNaK31lt7OSmh1Dj8U+ioDB
         9eYw==
X-Forwarded-Encrypted: i=1; AJvYcCUZAkR8syrQo2stAXWTJ8MZifHBkQjrYcldSbeGSxaD4EnyPcxamQxorIHdC55ujTkKSJGC1rIRs/fEifuknQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3da6PaO5Xh9L0tP5vv1hyeKuwVBxfTTc4EXQ/W/8ZEv6WsWWm
	Q2mkGvLFW/DuxOicg5v3e4UTnba17O6iaRLJLgoyydoOZr/KAS7t57sw
X-Gm-Gg: AY/fxX4FLnTWbzj4U6VD8ojRosPlmZ2uZTXTJmdUO2PmKX7hh8FTGS0HJcR2pp9nUCw
	HB6/7ihXrWzJmc3Ae1i9uK0qAFlNec1fJTRKxAc6QeEGs/tPxiUb83/d0WyT3Ujpl63JgaphU+n
	KkExZcqGcUqMTyE7TGnFL89tm81B7F6KvxJGXqqwv0N+fwPFKfXvHN72uyZeujPNGVzfe9at94w
	ZZaKhynTw8LyESMtiWd/9Su5LVCCsGVJUbRkKk9OMkPgdcv9IeQOIZlYpd4E3KL55ptr7DADiG6
	LZ3KmFbzQDCfBI90NQq5Oholbd+GhfqSEIf4vJrlHrfh9KuIO2xmUilPVj3TqdLgfv9qSLVd1LD
	lJR+xtRHm94txGjrqb//gNJtGOnNO95wEiu+yJNmc1OG7ZqwxanSxdiyJ+Ic8gtQcUSpaXuvGSq
	1nUjmHrhEC5v7aJvn8pULFPwjbFBAe8c65s5wfdpp+Kopn/0o/Aj2Zxi7QMwJgaQosuNKTdoMo
X-Google-Smtp-Source: AGHT+IGwApvPnFgAH0zmoWLThdLA6m/j4hVI40Pe/wtvbQ0dd6LfTpi99yKguEeCrdiwL/I3JXhC+w==
X-Received: by 2002:a17:90b:5748:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-34a7288c03cmr4791910a91.27.1765453142892;
        Thu, 11 Dec 2025 03:39:02 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9264e4f6sm1780337a91.2.2025.12.11.03.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 03:39:02 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: acourbot@nvidia.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 3/4] rust: sync: atomic: Add i8/i16 load and store support
Date: Thu, 11 Dec 2025 20:38:25 +0900
Message-ID: <20251211113826.1299077-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
References: <20251211113826.1299077-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add atomic operation support for i8 and i16 types using volatile
read/write and smp_load_acquire/smp_store_release helpers.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/internal.rs  | 69 ++++++++++++++++++++++++++--
 rust/kernel/sync/atomic/predefine.rs | 14 +++++-
 2 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 6fdd8e59f45b..51c5750d7986 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -13,17 +13,22 @@ mod private {
     pub trait Sealed {}
 }
 
-// `i32` and `i64` are only supported atomic implementations.
+// The C side supports atomic primitives only for `i32` and `i64` (`atomic_t` and `atomic64_t`),
+// while the Rust side also layers provides atomic support for `i8` and `i16`
+// on top of lower-level C primitives.
+impl private::Sealed for i8 {}
+impl private::Sealed for i16 {}
 impl private::Sealed for i32 {}
 impl private::Sealed for i64 {}
 
 /// A marker trait for types that implement atomic operations with C side primitives.
 ///
-/// This trait is sealed, and only types that have directly mapping to the C side atomics should
-/// impl this:
+/// This trait is sealed, and only types that map directly to the C side atomics
+/// or can be implemented with lower-level C primitives are allowed to implement this:
 ///
-/// - `i32` maps to `atomic_t`.
-/// - `i64` maps to `atomic64_t`.
+/// - `i8` and `i16` are implemented with lower-level C primitives.
+/// - `i32` map to `atomic_t`
+/// - `i64` map to `atomic64_t`
 pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
     /// The type of the delta in arithmetic or logical operations.
     ///
@@ -32,6 +37,14 @@ pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
     type Delta;
 }
 
+impl AtomicImpl for i8 {
+    type Delta = Self;
+}
+
+impl AtomicImpl for i16 {
+    type Delta = Self;
+}
+
 // `atomic_t` implements atomic operations on `i32`.
 impl AtomicImpl for i32 {
     type Delta = Self;
@@ -215,6 +228,15 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
     }
 );
 
+// It is still unclear whether i8/i16 atomics will eventually support
+// the same set of operations as i32/i64, because some architectures
+// do not provide hardware support for the required atomic primitives.
+// Furthermore, supporting Atomic<bool> will require even more
+// significant structural changes.
+//
+// To avoid premature refactoring, a separate macro for i8 and i16 is
+// used for now, leaving the existing macros untouched until the overall
+// design requirements are settled.
 declare_and_impl_atomic_methods!(
     /// Exchange and compare-and-exchange atomic operations
     pub trait AtomicExchangeOps {
@@ -263,3 +285,40 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
         }
     }
 );
+
+macro_rules! impl_atomic_only_load_and_store_ops {
+    ($($ty:ty),* $(,)?) => {
+        $(
+            impl AtomicBasicOps for $ty {
+                paste! {
+                    #[inline(always)]
+                    fn atomic_read(a: &AtomicRepr<Self>) -> Self {
+                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                        unsafe { bindings::[< atomic_ $ty _load >](a.as_ptr().cast()) }
+                    }
+
+                    #[inline(always)]
+                    fn atomic_read_acquire(a: &AtomicRepr<Self>) -> Self {
+                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                        unsafe { bindings::[< atomic_ $ty _load_acquire >](a.as_ptr().cast()) }
+                    }
+
+                    // Generate atomic_set and atomic_set_release
+                    #[inline(always)]
+                    fn atomic_set(a: &AtomicRepr<Self>, v: Self) {
+                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                        unsafe { bindings::[< atomic_ $ty _store >](a.as_ptr().cast(), v) }
+                    }
+
+                    #[inline(always)]
+                    fn atomic_set_release(a: &AtomicRepr<Self>, v: Self) {
+                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                        unsafe { bindings::[< atomic_ $ty _store_release >](a.as_ptr().cast(), v) }
+                    }
+                }
+            }
+        )*
+    };
+}
+
+impl_atomic_only_load_and_store_ops!(i8, i16);
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 45a17985cda4..09b357be59b8 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -5,6 +5,18 @@
 use crate::static_assert;
 use core::mem::{align_of, size_of};
 
+// SAFETY: `i8` has the same size and alignment with itself, and is round-trip transmutable to
+// itself.
+unsafe impl super::AtomicType for i8 {
+    type Repr = i8;
+}
+
+// SAFETY: `i16` has the same size and alignment with itself, and is round-trip transmutable to
+// itself.
+unsafe impl super::AtomicType for i16 {
+    type Repr = i16;
+}
+
 // SAFETY: `i32` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i32 {
@@ -118,7 +130,7 @@ macro_rules! for_each_type {
 
     #[test]
     fn atomic_basic_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             assert_eq!(v, x.load(Relaxed));
-- 
2.43.0

