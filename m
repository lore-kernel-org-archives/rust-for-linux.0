Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406A0339B44
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132980; cv=none; b=SFic5RiY+EzQYxSwyLB4jP+JwbvvKaN6pVTEu2FyjOcwZ+DNU508/m2cV43Rt/jMZqv6PLvKZ7Ou8uTdHxh0QXptrfnrrwQ+PNnY+sRFhrsrCqQsTYcfZjgGM354VWEZdBPt9uaRWewblOAeipfpL2zSggluD+/9/lhNbfLq2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132980; c=relaxed/simple;
	bh=oTsLVh7+62858v+yELcUQMMrzooKUeqT6tHzij81HR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=alEutg+Ufob70rDz1n/G2u4Eu3kcisNf1G5OkWidZods/zWjPy5DPldZpc05j5zsCksq6QdFrsHXMQSLIy8dxc/ylz5y4mBVPtItMxHKErWB5gbXl1GAn6RNB1UXs+A1j5Gjmw+UEjwUhD9TyipV0hEAE1UOjurIYcIzZLuh5kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K32TxZzC; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K32TxZzC"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c30365ac43so532294585a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132978; x=1768737778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8qDVBbENifc0pq4xp3nEolxAocVYbYphCLTCBuBolEM=;
        b=K32TxZzCfxuQV3/m1jgifgDgUoC3cC9vwogj5E4w5OWbCdKKu0MkGu4xFj0cDrjNKs
         loLtAOUQAubCVjVQyPnpBzD/03jKxUF4ibpaxUK1hCgde8wmdfPxcbHBhiSJdip0Kppb
         WbqI9Qlf8RRaj6sM+YAURjQtgA7ZiElcqZocstwFM5ulQ8+ee8KG3nQ1TVDeLmS6LuEe
         9cLK4u0Ob6iYpsB1vathDhf9zBt8l/92/n+sA8HlbpDNaf82XGbL2XNFfvUOv0dJPdq1
         BZA5NW50Fg8hsSOHgLJsRmdOnHuHAVehUp3wmmuY76Xo3q7d3IDo3yv9seM9kvYQwxlR
         zH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132978; x=1768737778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qDVBbENifc0pq4xp3nEolxAocVYbYphCLTCBuBolEM=;
        b=SOvbhZHK/wS4xYQylWLuw9srdCPAQw1GRr3wTzLUyg3r+1qOhxbw+b7deeOcriHX/w
         grCnSWqDnXNkWXFmGR5OHkgLgQh8Iv/pgWxOpKXzY4Ehz6A3Xsz4xmX4z2qg/2K7DFSx
         b6/YZtZuqBeL3WlIA6ts0Vs8UvbdCbjckWywBGI6RizqgZZ4wEK7fMAFbRqCaJbdu+8W
         vJrXSOaut6SQOaZ1iNW2AxEzLWw1hqVAxPzuWkgrWMlhzlzwgGrAjrcI9aBZp/Q5aZrA
         QmLYc8lqHk6/2p4NVHNmot86M/bIygsm64QJ0xPACtKimm4pldJzJZzMWhM+x/2xfUAd
         txKw==
X-Gm-Message-State: AOJu0YzTdPJIO86w1CphiRB2jFp+7lUM41B1rzUOzLe+iOJvG+QvO1ut
	9tYRc7qiju+JEUBlFNN+7uEwc/PM8L6LlP945mrDxluGbinC2gcb8iQu
X-Gm-Gg: AY/fxX6Nj7wxJxhbV2T8xVsO7tEXRrM6wK3JGzl46gGUrmwZEbu22a+c7mbWTagI57R
	rxpiKzCn+NFvxSjBmrzitVkhv/v92yr9ZS/g5D5OIF2LWUBM2o7AAaXjnVEQb52FjHMdzE/kcGL
	5qWae9JeeVqMoDDIlWUcQhU1hbYvV5rohPYBxkmQTcaw0U8R1HTb+gswQopqJa4R3JclZq1HHm0
	lYI9B0g++iKA57X1HTL6Y5y9SbmmFWn69u0HEZYFx0Rd/m0q5VDYXsLcTF/sGmq4Xo7/jFQy5pq
	VUhVXg7DOepySl5i42oKSnf2pRU5gqnrPvRXR9yAWwwD+HcFwC6Ffs7pwn50kzhxrTaS1WbGa6Q
	pReE7IvsO+KPaJddQu59mvLLCijEWscROXVih7uqejzlLv0OS7hT+aAsRz/BTbCRJYvpzWd+ms4
	hW9dYAK4D82pI0uaO16bWwfJhgXuMwH5XnAm0RwLL+1GJhG/kVPKHsmIYELrWjm544WX2E5pBdj
	PrToUIjJ325gAr+jlncBdm9Ag==
X-Google-Smtp-Source: AGHT+IG25UDLm/tl/EQCA1/Z5VObkZ8Y28aJ0C4JvOkqF9v15aiZMK/q1DZMCAo/y2vDWXvWAljdeg==
X-Received: by 2002:a05:620a:371f:b0:8b2:f26e:3220 with SMTP id af79cd13be357-8c389370d1amr2140616385a.8.1768132978038;
        Sun, 11 Jan 2026 04:02:58 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5438f6sm1261581985a.53.2026.01.11.04.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:02:57 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 13507F40068;
	Sun, 11 Jan 2026 07:02:57 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 11 Jan 2026 07:02:57 -0500
X-ME-Sender: <xms:cZFjafS4pJ1vEFDQp5Q-KquvizUbmc-S4SFNh09IpVBC1SIEDvZG7A>
    <xme:cZFjaYXHz4xCGVwj84QJWrBWt-XIOSALwL2dNVHsHHyxpUbZJ9ExFiqwsXIQEJC6f
    GtSRFT71CIlZPPrr3U2qbNygYbZn4QocauaUUKtNRSuSQPRJsa-CaE>
X-ME-Received: <xmr:cZFjaUd8AAE4vzpQTYU-60wE9L51GDIr3e0i7ygSe4GaAAeUiCy1Fucm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefggfeuvdehiefftdefiedtvdejgeekkeejvefgjeeikeefteefjeekudeiveev
    hfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhmshhgihgurdhlihhnkhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekhe
    ehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghm
    vgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthht
    ohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:cZFjabwTBLR2cHjtAL-BQP0-zAw8MVTrk7BboitpCFtnAgr6lE670A>
    <xmx:cZFjafHWGJ06fsaJwEZyFYkuQu0oPpMtByFtnlr3M2sjiwbosSBH5w>
    <xmx:cZFjaa1IYjhRTku0Ar71CSplaQZdKzKCGNH8ZiTIXDHq4c0pWrcFMQ>
    <xmx:cZFjaX97nMqf4cR39iK7msC8Y8tI-rCw-MI5n00gu9g1K73MKTwMEA>
    <xmx:cZFjadH6Dqg5vSpP6tPAh4P-Z3EuRQUD9MJphIZAHOCymb3lykAD2vqp>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:02:56 -0500 (EST)
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
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 17/36] rust: sync: atomic: Add i8/i16 load and store support
Date: Sun, 11 Jan 2026 20:01:50 +0800
Message-ID: <20260111120209.6133-15-boqun.feng@gmail.com>
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

Add atomic operation support for i8 and i16 types using volatile
read/write and smp_load_acquire/smp_store_release helpers.

[boqun: Adjust [1] to avoid introduction of
impl_atomic_only_load_and_store_ops!() in the middle]

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Link: https://lore.kernel.org/all/20251228120546.1602275-1-fujita.tomonori@gmail.com/ [1]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20251211113826.1299077-4-fujita.tomonori@gmail.com
---
 rust/kernel/sync/atomic/internal.rs  | 25 +++++++++++++++++++------
 rust/kernel/sync/atomic/predefine.rs | 14 +++++++++++++-
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 41b4ce2935e3..1b2a7933bc14 100644
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
@@ -243,7 +256,7 @@ macro_rules! declare_and_impl_atomic_methods {
 }
 
 declare_and_impl_atomic_methods!(
-    [ i32 => atomic, i64 => atomic64 ]
+    [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
     /// Basic atomic operations
     pub trait AtomicBasicOps {
         /// Atomic read (load).
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
2.51.0

