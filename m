Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB91C5D7D
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766923609; cv=none; b=XJ7wzqu3ZlJXQa/P6lWy59HugH7au7pghZsKlGE+3Qx6rtmZDqEgEideftaAiIMQCrwPopWxowaz21CnbE5/30LNQBG/n2WXG7dVadzK5H27hz5V8omTUci0ee4Wq/oK1fCf6dpHgySdjv7+Mw8COSHzE5vd9CebvZ+MqGON5bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766923609; c=relaxed/simple;
	bh=6f+9vheRBSIp53sJKd2FU0IPOAixNytxv8A2ghoZpA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZnk3bKTJcZ4A0wuzEt9p+tM5SwqzTHhc6mg3G8EV/5G0FpnReOymqFNu92yJglRo9bLvmZ+yOCDg3PdWj21EU+Pg14m0QnF+cHLjDSKn10UaRgQC/JR9RXPeIWLfc4ElIGNIL6zp/TsunW4lb+6tinHpHkphzBoWitV6kcojzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdZsEalU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdZsEalU"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso9689042b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 04:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923608; x=1767528408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6h8C/PqE3VMHZYKO75kSrHKcH1eM5Y0IdJqxognnwlY=;
        b=cdZsEalUOCigcKte0EYq0nx0FZuOL2VVuRIcz/ja1RvRrx8hTGjc4HJ7t1ngQQyviW
         HVc7gItV4924KlBiRcOy5dyrdky7PVanPzEVzo17VDNyEJIUTuqhodyomFNXRddbSvd0
         x/qfzw8lSkpxfNeOavwsvTUw5Tp0RWk4MD5sP9hVb0xzykWNO3Pm0sxOZw9ooYxVYGFN
         SkjOEKQlgAHFx6vRvcWzD8Ec00o2YO7BAymdF73J5GBN+u20Y7s0AFapUuUiMFjb267I
         ntPWRFkGP0R370Gr7udK51nZ+mKgPKa566IBc617WKDOEWnqrM6eRbpChjKQlmuYBf7f
         Is4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923608; x=1767528408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6h8C/PqE3VMHZYKO75kSrHKcH1eM5Y0IdJqxognnwlY=;
        b=kgpMQmoauL9EgQTRLPeh6wHjgrPucnquDEYfiM19m8yxOQAtXSSjq1OiA2AVAbZ2LD
         vVog3oQM6tzrmhYGgAO/o7in0xPLuClt9XFipCIUteXO6qpqnQ4n61rMh15TfTJPOr5A
         LapkpubI6gFVhpBSISeyiXuf1DUV56eOJwmvp0U1fKzVGV9H3d3CWxs+UN0JmaFZG+3x
         vV+V+TE1l8GkhHYxKSCoeDKI7bDUrocgbHa++MCa826FwuHX8ct4NB38iwSfxQoEyNf9
         gD3/tRGQzUbTUcBh0zd4XExoCxaR344lPYrYa8MH3xVjDF4fTUMRAvLg4JQGAlM/suml
         2s7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPkj8so2gEdoIjjg+HYbkyNwjoCJZ/ZaM3JxgJ7yE+fbwf4K9B848mB35Pq+ZHVlzCSdM8j9yfZKDmKlpJDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUd84mV32yqf12fWeLE+kVu8NqltrCHiVsR2q5CPPRg4hgwVUF
	qijGuuGbQXQ/3nTgkOxBv8PI+Q65KCAhys/1AhPPWSLsVwWNoPXPShmWRo+hAw==
X-Gm-Gg: AY/fxX7Of+Jw2yzP2HUgN1+VNyV2DFM39qUsearNnu02w3DdvpeV5YnIiSqn6vvtpKO
	QA+fzvdLgxdhtqAL5Uc5+ktvHBMnqxEKpz/0JOspfsWyNvXy5RnlpXC+N64Zz3sfyaA6OI7GT6y
	ec/uV09WkJBbyQqTJ6Pqk9A1+OIxPunl23paFTKQfS9glkb+9bq6jTmLRYMDo/02uMlYj6anVoN
	LCzlKBmac9uBoRi4/H7TP1v4jbi5bdhko5qTZ4sfnX+dDaKh/XvMIG+uXsWB5JudfxdWDLS+9yg
	0sN4frJU13n1MYtTvynz2sKzIqOJfBYkpqlbWHUYnIF68aKv2/tQ8NDcdTaaWkTwykx8GtgPZER
	R/84blIZ8YEoyQLQ6IWaaBEmkqeSj58D0jEHrx359KgXCuTTebAp2EXkQECkXfVIf0Dz3pxBXCo
	Dtw6IUEY30Elw7VJNGY6t5gc8UisW4P/9A0BHXPs22uYq+t0/0f5LifN+S5d/OMQ==
X-Google-Smtp-Source: AGHT+IGl06bxiZxmOJA8LEaKTNR8p0l9I0xHezykgFuSkkx0FkmiFVNFycPYVBf4LvJGYXXZn65pPw==
X-Received: by 2002:a05:6300:210c:b0:334:a523:abec with SMTP id adf61e73a8af0-376aabfcab7mr25243298637.60.1766923607698;
        Sun, 28 Dec 2025 04:06:47 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dccd14sm27914829a91.16.2025.12.28.04.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:06:47 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v1 1/3] rust: sync: atomic: Prepare AtomicOps macros for i8/i16 support
Date: Sun, 28 Dec 2025 21:05:44 +0900
Message-ID: <20251228120546.1602275-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228120546.1602275-1-fujita.tomonori@gmail.com>
References: <20251228120546.1602275-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Rework the internal AtomicOps macro plumbing to generate per-type
implementations from a mapping list.

Capture the trait definition once and reuse it for both declaration
and per-type impl expansion to reduce duplication and keep future
extensions simple.

This is a preparatory refactor for enabling i8/i16 atomics cleanly.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/internal.rs | 85 ++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 51c5750d7986..0634368d10d2 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -169,16 +169,17 @@ fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
     }
 }
 
-// Delcares $ops trait with methods and implements the trait for `i32` and `i64`.
-macro_rules! declare_and_impl_atomic_methods {
-    ($(#[$attr:meta])* $pub:vis trait $ops:ident {
-        $(
-            $(#[doc=$doc:expr])*
-            fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
-                $unsafe:tt { bindings::#call($($arg:tt)*) }
-            }
-        )*
-    }) => {
+macro_rules! declare_atomic_ops_trait {
+    (
+        $(#[$attr:meta])* $pub:vis trait $ops:ident {
+            $(
+                $(#[doc=$doc:expr])*
+                fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
+                    $unsafe:tt { bindings::#call($($arg:tt)*) }
+                }
+            )*
+        }
+    ) => {
         $(#[$attr])*
         $pub trait $ops: AtomicImpl {
             $(
@@ -188,21 +189,25 @@ fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
                 );
             )*
         }
+    }
+}
 
-        impl $ops for i32 {
+macro_rules! impl_atomic_ops_for_one {
+    (
+        $ty:ty => $ctype:ident,
+        $(#[$attr:meta])* $pub:vis trait $ops:ident {
             $(
-                impl_atomic_method!(
-                    (atomic) $func[$($variant)*]($($arg_sig)*) $(-> $ret)? {
-                        $unsafe { call($($arg)*) }
-                    }
-                );
+                $(#[doc=$doc:expr])*
+                fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
+                    $unsafe:tt { bindings::#call($($arg:tt)*) }
+                }
             )*
         }
-
-        impl $ops for i64 {
+    ) => {
+        impl $ops for $ty {
             $(
                 impl_atomic_method!(
-                    (atomic64) $func[$($variant)*]($($arg_sig)*) $(-> $ret)? {
+                    ($ctype) $func[$($variant)*]($($arg_sig)*) $(-> $ret)? {
                         $unsafe { call($($arg)*) }
                     }
                 );
@@ -211,7 +216,47 @@ impl $ops for i64 {
     }
 }
 
+// Declares $ops trait with methods and implements the trait.
+macro_rules! declare_and_impl_atomic_methods {
+    (
+        [ $($map:tt)* ]
+        $(#[$attr:meta])* $pub:vis trait $ops:ident { $($body:tt)* }
+    ) => {
+        declare_and_impl_atomic_methods!(
+            @with_ops_def
+            [ $($map)* ]
+            ( $(#[$attr])* $pub trait $ops { $($body)* } )
+        );
+    };
+
+    (@with_ops_def [ $($map:tt)* ] ( $($ops_def:tt)* )) => {
+        declare_atomic_ops_trait!( $($ops_def)* );
+
+        declare_and_impl_atomic_methods!(
+            @munch
+            [ $($map)* ]
+            ( $($ops_def)* )
+        );
+    };
+
+    (@munch [] ( $($ops_def:tt)* )) => {};
+
+    (@munch [ $ty:ty => $ctype:ident $(, $($rest:tt)*)? ] ( $($ops_def:tt)* )) => {
+        impl_atomic_ops_for_one!(
+            $ty => $ctype,
+            $($ops_def)*
+        );
+
+        declare_and_impl_atomic_methods!(
+            @munch
+            [ $($($rest)*)? ]
+            ( $($ops_def)* )
+        );
+    };
+}
+
 declare_and_impl_atomic_methods!(
+    [ i32 => atomic, i64 => atomic64 ]
     /// Basic atomic operations
     pub trait AtomicBasicOps {
         /// Atomic read (load).
@@ -238,6 +283,7 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
 // used for now, leaving the existing macros untouched until the overall
 // design requirements are settled.
 declare_and_impl_atomic_methods!(
+    [ i32 => atomic, i64 => atomic64 ]
     /// Exchange and compare-and-exchange atomic operations
     pub trait AtomicExchangeOps {
         /// Atomic exchange.
@@ -265,6 +311,7 @@ fn try_cmpxchg[acquire, release, relaxed](
 );
 
 declare_and_impl_atomic_methods!(
+    [ i32 => atomic, i64 => atomic64 ]
     /// Atomic arithmetic operations
     pub trait AtomicArithmeticOps {
         /// Atomic add (wrapping).
-- 
2.43.0

