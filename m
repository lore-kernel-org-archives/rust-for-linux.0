Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0736F1FD4
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 02:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490663; cv=none; b=m4unF7jUV3iLyZNHitm+3tIiqi+1/SLnQdLQHeNvxotBIV4kx7zvFsWncFwkCTsnXPs4oGZ+cOxu/mAb5kmeIkX6y+ZPHQTroOO8BduGElC0PNYcGNvbknUJapHKKYsBQQaKUTYPqAMnIpn2V9q1OAUA+/HEKCYTlw3UM+cIcTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490663; c=relaxed/simple;
	bh=UbaLDdoKMZ1amHnNIq1ECQ8csN3V5qaNENCXbyH+3GE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/OGaCbqyAIHBmZLAMDsb+b+obI9fEww16G/yMU6SNEX6c+muv7olI41ULtRW33DscBZtjHO2vPneuJCswFsqjKJqQoh1fbyoqJOkMlpTfPKDwDpYAAIJcoBdtlKOY91jf30W0TypgSUymkm7NKsUU5li2NHaAf0/uHWptsYPrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXBDQ15s; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXBDQ15s"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35b88a4f123so204185a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 19:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774490661; x=1775095461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iWl6PzFsmSICAmTCaN++hWfc9rZNO5qDABFfVl7uRzs=;
        b=QXBDQ15sKeO9iCayXFJunVp1HgAuL2cevoHs8nO6qPPmIwCBeC5xJnyoIf530w4iNt
         vS68V1AeUea0qMYV6e0zu7kX3dBGQnpApKh1BDq4sHOTWrPyjxr7eEy15GHvX2c0nvcV
         9MwYp7oGHvnT/KibwhlYps/YSjlbkJIsFl4J7Z4B+BV1n80ISD71pdNQtbEFvCSolPJA
         JWj4HzE7eTaVuz1ISj1v531y41p5GnlfYjiMi/dIkbT5yrqJY/aQNYsDnwAdznrZvE+P
         cyoQV5JjUhVvvo0ah6cQyd40sIxMLbtO0DiwSSd14YF/jfen6HKksEaTEE2d0AVUme/u
         nWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490661; x=1775095461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWl6PzFsmSICAmTCaN++hWfc9rZNO5qDABFfVl7uRzs=;
        b=Vu4q4af+ssU1w974xqPreiFydrBdusrAxcMsrUdGN0LzoWtni+2JXvJ+OLkPE9mLsu
         7/V9JEjD9/6zPry9AwFJijA611gB8HqMFHk36qYIuVtslOqqaBnHrQS/j/R8GQ3n9r68
         VCqrWX4lsIrRiZlalyjZ1CqFX3Bd3JNJX3dqsP4HTBpqKwaBxrszJ7BiIvIRPv/Iqq69
         fsiYUsDvfPXEBUU/x0TFfVq/bNMmQRUKcspV47NpsPCcLDGSMBAKa1LPqxgJghiZHG/K
         g5N/9jGlJdcNrgo9ninKMT5oehNaOSfi3tQNxm9HDozCRBm1pgRmd6KiveeR0PmdsEcN
         a+kw==
X-Forwarded-Encrypted: i=1; AJvYcCXD4F75ItDC3QuuFlWNhyNub00krYuaKUBKLg3mnVbF29KzoPQGfusRlohHk4GAl7kL/vw3+e3V0ZG5u420kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwNqOjwUVfe/CFiUMLMdR4ydxyFqX4YYPJ2SWl5q5zIOWwjP3t
	LckOUCWzCb5OzPwyLXo5w6aPT1HEfYso1aUzU4oIsOeiHRsXB6nh3PBq
X-Gm-Gg: ATEYQzzWVuE2rb7i3089wZUJ5Q1WOsWAegkywWLwYasqOS8Dtjw9RhxV4YL3n16qLzY
	B/5e5iTr9ILlNN3yr/OeFKGbqfgKgffwsoIZ6zSQPBb0TTbG9s3ZHBm8faqD/L2FbjVl5ZqNi+v
	Z00avkc9G1dIxGlqPaVaxh4ehnknJboIg4JkO+b68DrWaRerITM8VGuOKJ0fjA3B3AK4UzWgIpm
	8xdy4s4vHaZ/mgHLbcCQT2NQnLGKRHHhb2uP5RCQ7qC4wi7lDRiKKhG06v7IlM9lTVLL5ZqhXC5
	D+84gV8oDrtzivbwFU5lm8So2Iq90gwkvINGaVbUFOIMMC6W4MmqRBzdk1coarSBTFwrZcsOiB/
	B6aTgscQD/SleRVJa5hVTXnQSDm+1iTRIzluXVB2a3dZwOSpR7A2rnrnkutpCyq/mSSxxqeWMqy
	cJ57dc065Pm2l7gK5PrQIS3Zjr7IJ/lSWTiHx7w+DDMw==
X-Received: by 2002:a17:90b:57e3:b0:34a:be93:72ee with SMTP id 98e67ed59e1d1-35c0d1451d7mr4561960a91.8.1774490661208;
        Wed, 25 Mar 2026 19:04:21 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0eb4d780sm1571592a91.6.2026.03.25.19.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:04:20 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: dakr@kernel.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3] rust: Mark all from() for Error functions inline
Date: Thu, 26 Mar 2026 12:04:06 +1000
Message-ID: <20260326020406.1438210-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Mark all of the existing

impl From<...> for Error {
    fn from(err: ...) -> Self {
        ...
    }
}

functions as `#[inline]`

There was a recent request [1] to inline the simple from() Error
functions to avoid the function call overhead.

This patch inlines all of the functions (except for the pin-initi and
syn) and converts one existing `inline(always)` to `inline` to match
the styles.

Link: https://lore.kernel.org/all/CAH5fLggOnVguVErjySphX__vs3iYAo4O+J6hrXW546JrWSq5ZA@mail.gmail.com/ [1]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
v3:
 - Convert Link to use lore.kernel.org
 - Drop change to syn

 rust/kernel/alloc/kvec/errors.rs | 3 +++
 rust/kernel/error.rs             | 6 ++++++
 rust/kernel/ptr/projection.rs    | 2 +-
 rust/kernel/xarray.rs            | 1 +
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
index e7de5049ee47..985c5f2c3962 100644
--- a/rust/kernel/alloc/kvec/errors.rs
+++ b/rust/kernel/alloc/kvec/errors.rs
@@ -15,6 +15,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl<T> From<PushError<T>> for Error {
+    #[inline]
     fn from(_: PushError<T>) -> Error {
         // Returning ENOMEM isn't appropriate because the system is not out of memory. The vector
         // is just full and we are refusing to resize it.
@@ -32,6 +33,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl From<RemoveError> for Error {
+    #[inline]
     fn from(_: RemoveError) -> Error {
         EINVAL
     }
@@ -55,6 +57,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl<T> From<InsertError<T>> for Error {
+    #[inline]
     fn from(_: InsertError<T>) -> Error {
         EINVAL
     }
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..935787c2a91c 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -216,36 +216,42 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 impl From<AllocError> for Error {
+    #[inline]
     fn from(_: AllocError) -> Error {
         code::ENOMEM
     }
 }
 
 impl From<TryFromIntError> for Error {
+    #[inline]
     fn from(_: TryFromIntError) -> Error {
         code::EINVAL
     }
 }
 
 impl From<Utf8Error> for Error {
+    #[inline]
     fn from(_: Utf8Error) -> Error {
         code::EINVAL
     }
 }
 
 impl From<LayoutError> for Error {
+    #[inline]
     fn from(_: LayoutError) -> Error {
         code::ENOMEM
     }
 }
 
 impl From<fmt::Error> for Error {
+    #[inline]
     fn from(_: fmt::Error) -> Error {
         code::EINVAL
     }
 }
 
 impl From<core::convert::Infallible> for Error {
+    #[inline]
     fn from(e: core::convert::Infallible) -> Error {
         match e {}
     }
diff --git a/rust/kernel/ptr/projection.rs b/rust/kernel/ptr/projection.rs
index 140ea8e21617..7e37390da6c6 100644
--- a/rust/kernel/ptr/projection.rs
+++ b/rust/kernel/ptr/projection.rs
@@ -13,7 +13,7 @@
 pub struct OutOfBound;
 
 impl From<OutOfBound> for Error {
-    #[inline(always)]
+    #[inline]
     fn from(_: OutOfBound) -> Self {
         ERANGE
     }
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index a49d6db28845..46e5f43223fe 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -172,6 +172,7 @@ pub struct StoreError<T> {
 }
 
 impl<T> From<StoreError<T>> for Error {
+    #[inline]
     fn from(value: StoreError<T>) -> Self {
         value.error
     }
-- 
2.53.0

