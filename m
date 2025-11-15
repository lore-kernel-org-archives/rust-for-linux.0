Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565CDDA9
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 05:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763183015; cv=none; b=R46BcbWa3ElWY8UV9I0gBlZgzrRIdoRw7UNu4NvTKjGJ3OQFlWZ8tbwaEYtqqMsmrT40RFv8uOxaDsjXWcsfehssb5qD3NBf8QTDXe125uDaNuEnB4o4MgOgACDRyBQjAFsJGnypAoubwPqplYPbVKQWCwZiuXPRAxb1+oAy0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763183015; c=relaxed/simple;
	bh=pvd3f0r99+urSgocldSRb+8IP6+EO/nasw2S/UJ05QM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpDRrXsXsjFqoVHtYsYjXjhCb1T4/6EhaPbtZYb14wVyuR8RzW6NQi0tEz0cHEcYQ8YiumbNRK00PP0hx0teO6SP3lyVxNCUQ4unwcCJ4xcDY+sZdIXBBT78TSbbxCMvt1Avr5kgiEFrgCFloCslda2P7vyoqrh4qy4i+SdBzdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTVniLnF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTVniLnF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297ef378069so26542795ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 21:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763183013; x=1763787813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCta8N4hhSTW3s3/gP/RiPmanddFNWnQV7j9DERb0D8=;
        b=PTVniLnFJBru15SbJCSIaPTpy2QVbx24ifE99Depsu/DR3TEDWC0Fr3/+ixfvF8b0d
         7AlezOK3JhW/ITOXSVStGrgWjgTyqTsGZ/hRxH/dIgu/btlt0wbABlsVroquZ+g7SZL+
         Nb1S5523JhxFgss7hvIUrTn4Vyua1nZ89xoyDe1OjW2IotS+1g3/vSjRBGzJtdlLQpyu
         nlaHaYK87W1mY5FVkz+vRsb8wVCowZNC90rJhA78G1Ok8oaJ9h5hP81Em7zyM6pNhhAl
         hOHXTx9FDoYNe4+zZPNBZa7y2pCYooKWb32MNns5/6UCjWYbw7j9a8+hOy3dDKG1u/0M
         46LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763183013; x=1763787813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tCta8N4hhSTW3s3/gP/RiPmanddFNWnQV7j9DERb0D8=;
        b=ecOyiIgBKlSyuRb2N187WZ2Al9gXxWkD9aRSzbhenwfaDNG66l38RITr1mCsJcWvtd
         GLOkH0xfMEx/sUIN1hUElGHB2w1lj/2IJiJjwDLMPPJsFFt9S6SkBq9jz3h1DUOEd+xu
         7Y6Epdh4pyFoZt2ZBPBBxqJfRspJwWVf/UqIKUF+c2gNoal2/A4e8MQS74H/xQ0TWteL
         w3LaAvkVitO3Y5Kon/04DV7ltlTg2TiREGRD9y8qp4yUFlbiooJuDdkxDkjT7Vnd9ZbV
         vVFFUAd3CI53ym2mTN/s7yTSam15h4CnipLziivfpV9u5ZBE97GX1oFgVEtIjmGryQ8d
         KlgA==
X-Forwarded-Encrypted: i=1; AJvYcCUz4k+FHsV7J7udNZh0l6F9/kkH3CG9ymQnzWV3nU+umZepgA6+Cs7NK6mKEm61pbrxoTHLhpcb0WbibJg59Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4KSCbYSMl6IsmURXJ6J59+V8Fvz2Pf//FMYtTs6YESOj+HpRr
	Ie1kX6IuI7DF2QuFuyNIwEWSx34fhHYSp25CrLAbraGIU5ZMPS6Wf1iF
X-Gm-Gg: ASbGncvU4EWNzF+9oaulyOcL1cw3GAO4KWj1OzATVYHbu571w+IeZDitM+4JplXqGsc
	Lw1z+FApxXoplf0jeoPj6ngcL+0KHAnr1Xpz6xvY2RXpfIEv7GJFT+ykHinXSqNlJDsAjELTCwR
	TzO9IaUCmFBGalLNGJdFg/ueQ7xPHQUjkYpWuTCd0Ujowc2uFK8MQv/Ss9ovTt3y6sRRgLo/e3K
	gl01Pt5b0jWjRZU+QvEBuA328/2l5HXJEM7v432cb8XHDkhWA1pguPkEbzX9N0ROSE9zGNQ/DTP
	tb8DQaFP/gSXyMwpm+84b/41qQVyhUj54MjV8cLXx5XZTf5JT7FjlQK4gtQ5KOBI6Yp3tsabZ/t
	pBrq+73gwjGq42ZeeGCXTCEe3DT4HMGc2KnK4Jj03efu5w1oXkQxPqxbli5WNL5ymRGLhLK+2Ps
	z6WlWvd3Cqs4zm8kVhWFBmeeKn9XOn+EVctjRj9ylzOeDf08iwtmwMOmqXrJU=
X-Google-Smtp-Source: AGHT+IHdfKJQRxSG1wPm7+35ADvgj6fWldVtfISAwOv1ZEORNOm2aZdKsjz5KWweqBGRNIysU807+w==
X-Received: by 2002:a17:903:40d1:b0:297:ef11:b504 with SMTP id d9443c01a7336-2986a6cfce3mr55106425ad.24.1763183013302;
        Fri, 14 Nov 2025 21:03:33 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245c4asm72261935ad.33.2025.11.14.21.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 21:03:32 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v1 2/3] rust: sync: atomic: Add i8 and i16 support (load and store)
Date: Sat, 15 Nov 2025 14:03:04 +0900
Message-ID: <20251115050305.3872412-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
References: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
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
 rust/kernel/sync/atomic/internal.rs  | 85 ++++++++++++++++++++++++++++
 rust/kernel/sync/atomic/predefine.rs | 14 ++++-
 2 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 6fdd8e59f45b..d9c4edfec20d 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -263,3 +263,88 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
         }
     }
 );
+
+impl private::Sealed for i8 {}
+impl private::Sealed for i16 {}
+
+impl AtomicImpl for i8 {
+    type Delta = Self;
+}
+
+impl AtomicImpl for i16 {
+    type Delta = Self;
+}
+
+trait VolatileOps: AtomicImpl {
+    /// Volatile read.
+    fn volatile_read(a: &AtomicRepr<Self>) -> Self;
+
+    /// Volatile write.
+    fn volatile_set(a: &AtomicRepr<Self>, v: Self);
+}
+
+macro_rules! impl_volatile_methods {
+    ($ty:ty) => {
+        impl VolatileOps for $ty {
+            #[inline(always)]
+            fn volatile_read(a: &AtomicRepr<Self>) -> Self {
+                // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                unsafe { core::ptr::read_volatile(a.as_ptr()) }
+            }
+
+            #[inline(always)]
+            fn volatile_set(a: &AtomicRepr<Self>, v: Self) {
+                // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                unsafe { core::ptr::write_volatile(a.as_ptr(), v) }
+            }
+        }
+    };
+}
+
+impl_volatile_methods!(i8);
+impl_volatile_methods!(i16);
+
+macro_rules! impl_atomic_basic_ops_by_volatile {
+    ($ty:ty) => {
+        impl AtomicBasicOps for $ty {
+            #[inline(always)]
+            fn atomic_set(a: &AtomicRepr<Self>, v: Self) {
+                <Self as VolatileOps>::volatile_set(a, v)
+            }
+
+            #[inline(always)]
+            fn atomic_set_release(a: &AtomicRepr<Self>, v: Self) {
+                // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                unsafe {
+                    bindings::smp_store_release(
+                        a.as_ptr().cast(),
+                        v as u64,
+                        core::mem::size_of::<Self>(),
+                    )
+                }
+            }
+
+            #[inline(always)]
+            fn atomic_read(a: &AtomicRepr<Self>) -> Self {
+                <Self as VolatileOps>::volatile_read(a)
+            }
+
+            #[inline(always)]
+            fn atomic_read_acquire(a: &AtomicRepr<Self>) -> Self {
+                let mut ret: Self = 0;
+                // SAFETY: `a.as_ptr()` is valid and properly aligned.
+                unsafe {
+                    bindings::smp_load_acquire(
+                        a.as_ptr().cast(),
+                        core::ptr::from_mut(&mut ret).cast(),
+                        core::mem::size_of::<Self>(),
+                    )
+                }
+                ret
+            }
+        }
+    };
+}
+
+impl_atomic_basic_ops_by_volatile!(i8);
+impl_atomic_basic_ops_by_volatile!(i16);
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

