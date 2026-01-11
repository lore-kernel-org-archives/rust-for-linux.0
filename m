Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E161F33C197
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132979; cv=none; b=mrdIa38tPSlvVx3iIVkI+A+GcmdVwWEvjNJxjiub6hTN1xOCBDSX90nBvyQtu1UtIuFlDRfvAtgVARkJscLlkr38KAVSfYUp6QRq7rESC4uoscFcbLYkhBI4KRq3GkJbntHNQmNAhz44p+fHnW1yYvuj6Wj0P7YNOXidtxsI6sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132979; c=relaxed/simple;
	bh=am9QCZcRcf2AAMBjS1CyDB4YX26g4rNaBgRNhi+yglM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUcArQ9Ejv+3d+0AYkLyvvLqzmceR6IzP+UvIuCZIVAnteoBVvuT/hQS0nE9Dw3nM9ioVcurhnRu0T7CoRScTsDzvIrr95RirPJcmw+G7XWSQy9QPNgpUj8hew+gtHHzTiLJIF7Pm5g+0qqEq/cLx4rz+JZFWOgwhzCNwb+ESxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOkS4xED; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOkS4xED"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8888a1c50e8so69710166d6.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132973; x=1768737773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n+VR8d+xDtsCoPiRu/UfANhgJIbLDtAMf28K6zfVKpQ=;
        b=dOkS4xEDz0nlXFF4kUc/4CFZevAnhig8Yu84glKJM2okNrI/roRSnh+D7AkJs35UcY
         kM1wG9FdUmLtdfdWlgXxDyX5A0lgCpR1nki8LDJuZI/jV6gNcpCeBPJYpGoFYpzL6rch
         fowOsEy/p+tocs0hV51DC4faQYitq0MHz+J2NaB6X/xrh8ste0We6TGdHwII8vxuhAhL
         1Oa8c5r/e1egOAmMUT6OoFrVgrQatWxQSFLJ2AA60oqX9HhYfv7H0KDM3241hrqkOtYp
         ImBbFxz6TiGx5fMJN+e9kRqEO2j6MMYTntDHFcg2yBocigD1kkFnLIBE7WqjTzy9rl36
         Lr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132973; x=1768737773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+VR8d+xDtsCoPiRu/UfANhgJIbLDtAMf28K6zfVKpQ=;
        b=cC8m05urKCLUoEQ2j+51nKYDrkY27ZwLJQLcxUWF9tc0ET2B3xv8OujmHl0dMJKiMj
         /Dr0ni0ACxuLdQeLeG+1aSjBGynLz3qpd5XPLPztJ6p4YYTWmigOqwjo6rnw8R3AV9qe
         jWDj2MY6k9027aLEoGzaHGIV8CU3Ejsu5CsxurlgMtYFG2zIkSG4Vo+EJFE86rZHrkeE
         fNvw6UUD8Bq8glsiQ6HFV3Ro3/Gk3NzaGw0/kmWwWuO7MOflcEChkj3SaA4cFZyj8TD8
         UqxrQjeMr6RqynYwYq2GyLdEN0AKutvr924yYQrO/XXamW7Tw1uuU1F1drb8ZBmIcbkD
         T4Ug==
X-Gm-Message-State: AOJu0YzNQjOVpXSv57TX90cELu9LiEIJw1AbPHXcJAddOxThroCc8T9T
	8sbiUPWnqL8KMuhHESAmHX147otOU9a/5wFxUR7JbH/RyUW+uPbVhaey
X-Gm-Gg: AY/fxX4WDIfWUrNfG1yWfXwPpp+on12ro6DOKmH0CXKPCWnk7x9W4PUnr5UAW6DlJRw
	ZImxflMfipNGi81+5YodEy1fkk9HLfxSTZVA5AsWZPJNzQuyd4LuHW04YO1ZEmBbVCv3D+QpEug
	yI7CFT5rkCFkFCAx1i8RS/iukNjpTGy7aqiSllSrmFpZGf9ydkFmOTLLBzMDaW5BiGsrhRJ2M5E
	o7LN1u0xzTRxITpsYFF3ApJtPWojprMONzes8ULuUtAbBpX+8FltVJF1xr6fo3zLNvubZoOvgFY
	poJhafXdjDdNAb5Rnt5UVZJ/2d/xpJm7lxUTHxREL5O8SPKbqVdy4OKVKxHTWxTQXODZgJqujeK
	h/wyPV6+w7wZ/rculOhut9a9t8ncQwMKjrRGvF2zZy9wclVbALJXe5G0lk04WJ6nhcSsjAMhKwz
	HvhXqa3f92slFCnmpQPeLoalMqQeEP9GgINiDLz7Q8vqxwhW98gw+Pb/5KYBXoKuXEFArrZN1NE
	4HEvblV4HUpcUSbFeyger5xGA==
X-Google-Smtp-Source: AGHT+IGGgbGTyoxACaBF+0HtJRQ61/DF/nUsWZtrN72Gl/g3cg5v/faOWA6GQtenNrE7SzpLNmqDlA==
X-Received: by 2002:a05:6214:4613:b0:888:57f3:ac07 with SMTP id 6a1803df08f44-890842552c3mr231905276d6.54.1768132972783;
        Sun, 11 Jan 2026 04:02:52 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce99dsm118428406d6.3.2026.01.11.04.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:52 -0800 (PST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id EFF21F40068;
	Sun, 11 Jan 2026 07:02:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 11 Jan 2026 07:02:51 -0500
X-ME-Sender: <xms:a5FjadAB5JV8NiXpgy4O_2j8yJ5vHcb0RHQWLOMYCy4lZ4Nr-A4FVg>
    <xme:a5FjaV66qj4vSRQef3kYWN4J_36tP_GKPuTYPIQixJpheesTSkbxixbPFitzBsQtG
    6Tr4VZai3ko_URC-q0K5CJVVL-ZZeBFDIFT3VDW7h0-ikE8RrdVWcI>
X-ME-Received: <xmr:a5FjaettkBGRw0wf9PKl-iNj2cQ69HjeXNg4sb9u05AJ_2nwW-2LY92n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepud
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    peduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:a5FjaS4TS3eIrWFdoVtZcTbyiBLYmXXUYDM8zSzbeHBm_12R20KXSA>
    <xmx:a5Fjaa2DxWTSp9HjwiwsGCY0eSVJekT-G3OofYMSUNbWI93k8NJVog>
    <xmx:a5FjadjxjPlnueRgtK76J-UMr7gXrw08GUkwm9VIgmz3AtWYFJcxrg>
    <xmx:a5FjaSp5Toaxd5-dksD5mh_a_2URuEhW8xd96qHxVQFcxcL-c_1UKg>
    <xmx:a5FjaYMijyVb1LlKtlZOJM2SjRzr5mJYYqlLpsrZPcKMfpd1mKvphSWS>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:51 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 15/36] rust: sync: atomic: Prepare AtomicOps macros for i8/i16 support
Date: Sun, 11 Jan 2026 20:01:48 +0800
Message-ID: <20260111120209.6133-13-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Rework the internal AtomicOps macro plumbing to generate per-type
implementations from a mapping list.

Capture the trait definition once and reuse it for both declaration
and per-type impl expansion to reduce duplication and keep future
extensions simple.

This is a preparatory refactor for enabling i8/i16 atomics cleanly.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251228120546.1602275-2-fujita.tomonori@gmail.com
---
 rust/kernel/sync/atomic/internal.rs | 85 ++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 6fdd8e59f45b..41b4ce2935e3 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -156,16 +156,17 @@ fn [< atomic_ $func >]($($arg: $arg_type,)*) $(-> $ret)? {
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
@@ -175,21 +176,25 @@ fn $func:ident [$($variant:ident),*]($($arg_sig:tt)*) $( -> $ret:ty)? {
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
@@ -198,7 +203,47 @@ impl $ops for i64 {
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
@@ -216,6 +261,7 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
 );
 
 declare_and_impl_atomic_methods!(
+    [ i32 => atomic, i64 => atomic64 ]
     /// Exchange and compare-and-exchange atomic operations
     pub trait AtomicExchangeOps {
         /// Atomic exchange.
@@ -243,6 +289,7 @@ fn try_cmpxchg[acquire, release, relaxed](
 );
 
 declare_and_impl_atomic_methods!(
+    [ i32 => atomic, i64 => atomic64 ]
     /// Atomic arithmetic operations
     pub trait AtomicArithmeticOps {
         /// Atomic add (wrapping).
-- 
2.51.0

