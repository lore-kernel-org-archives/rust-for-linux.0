Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088E81D5CD1
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 01:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768872128; cv=none; b=OMOnfojBBKIjHSuevrC78oIaWuwu1/tAqUF1TQi8eSqnM+o6CmNJG2BHhSXBfTc6/Uanc1dm4cdseEoIO9pq5fA+Vv7LgU5hl2YJrLzcWzd+Hgat0MngmahjzLiKUyUhkb55pTb/mj48qxW53oePAgEag6pwzir/7aHhxeLWGt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768872128; c=relaxed/simple;
	bh=YoizsBHu3n79Xc3tQ0T9Y9HP9MXevKG5MURuvkI55OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejgQZwzml7dYnVGNFk+SXCU82cGpMCWkV82c/Vt8TSetuzBtJ4kLLzqKGy++YnMXXoF4ofGEtG7Znfk9S8EeZMIu5coABnuwCTkObwYbU3Rij3HPpgHVtNz5l1tFDig6V6k938OQ9k1ap2uBA53hU7ofzN7BQ+Yzbrp+DFn8ngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbDDVIXr; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbDDVIXr"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45c798c92edso3015657b6e.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 17:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768872126; x=1769476926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AcphxinHBu5Dt6Nikvz739mSNGlAYBODdeosdW4F0ig=;
        b=AbDDVIXrt++mBOZ/AVYntQfg7a+dAEEzU5GMj3ULQ36jH2oZBsRXwoRQQMCIKgqfUd
         A5m+/3V/D11x3+e1viI6QNNoHXA/zbuXMn4MawUtprmlWHx3rbtXK/bAJpEoTo/WKEuB
         n8564ro7whyrjzIClb/gmTxNiWYQpiYkaCxeIuq+mxe0+6O8hVGlWJDb/eseUmRKu9sq
         R+jQf6A+Qh9pMGRsPP0HdCK9wDm+Now6KaX8+9Xt7sSWSQTSex/nYhc0PuSYsjB2yfcv
         eW58Niwrcsm3Y5lpYyuhk6i8qmHkfrGaBfolPXnW23goYnqg3Tqd6/XWl43znCRsihco
         aEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768872126; x=1769476926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcphxinHBu5Dt6Nikvz739mSNGlAYBODdeosdW4F0ig=;
        b=BjKVisRjjIsZN1O+J3YZE3nijj+Qa6tquYuHkHGT1Cwft+WbK2U0oPWjYAhXXfC9Sj
         sxysO9qM9RBqXLu6P+yZ6C2PvQpZgAbWO367MEiigw3Vy5EnL0NvHVS2r4K6X5Kdaedk
         z9CJzsrjBUzN7E30xh/WO5mBe3rCkqvFYUen3LkZbMbswrbPoL58B6xkBhoT86+oQBjh
         9I9RvqcFo25GAd6d4zwXM1I04piHvRhyFwENa50eydDx52Lj6Qd12ZySkti0d8Sz0VQp
         t+57tLf7b6TGphQWItcXKzsprGVFg50hxg/YHilV2IRXJTehp1U3E8fRzLGK7rl+U+cg
         JJGw==
X-Forwarded-Encrypted: i=1; AJvYcCXi+tz7+R0f7wBBojP2LwOX5UfxofgOsjfr9BvvZ+wFZq/ZW5pfiQ/xxLnOt07Qngku/funmJXbU1OHn4A06A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7KbOU0v9dFzBh9Nszu1B5Z4GZxPhJsParTgQLBUDIy3g9QWHR
	7DXeBgSARF4sMSfoYNSjhreMxBnhPtKfCZRemp8Cd6dr8BIu0O2l6BFAIWRL+A==
X-Gm-Gg: AY/fxX7o5kRoza774j1/5a8k0cnuJYO1XZWLgGTdZwUBQmpg6b5RCpkI598cVMU4K05
	RgkFNahEJJNNfBs5Y3Ht1NQgOy3az4RLzvGrYEhrBPFHT2dBshEFOj8eC35xOMgF2riX2hWt8Nr
	Ro/jl/7mC0KbE6c7hbn5ClsOCeuGyZe8qllGe13xfKjaGQg2Vm+8nF4Wm2h1lHGN0eS8SUrr37h
	ZfAE0x0ukcjddQydY8JB+cl1sjVc0v5455xzf785VQmW1NFAvolMEqH1QyQHMuzFKQe0pmdxbC0
	UrYzpmpOa6ENyk6IdN2hURAZrzo6ZFcHgdvc+mcGwX3MtXU9Hop9ezxbYilANM/qTSK3J0FnedM
	nBiqFFiDOMXqxH1y4QXPEDkWL8NUwNpWToydkE2YTWTm4pBMBOo7cG5rTMOyX1CcQjeVPAXVx9g
	jYCDM+Au18RBkdlaj2gPc5jnzrzdOiuA1VXz270Q+7nO2wO5/lS/JN+664FsJ7Fw==
X-Received: by 2002:a05:6a00:4394:b0:81f:61d2:849b with SMTP id d2e1a72fcca58-81f9f690012mr12626237b3a.6.1768865792216;
        Mon, 19 Jan 2026 15:36:32 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108c51dsm10169203b3a.14.2026.01.19.15.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 15:36:31 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1] rust: time: Add Delta range constants for time units
Date: Tue, 20 Jan 2026 08:36:21 +0900
Message-ID: <20260119233621.3465304-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add MIN_*/MAX_* constants for Delta::from_micros(), from_millis(), and
from_secs() constructors, and update their documentation to reference
these constants instead of integer literals.

This improves documentation readability and makes the valid ranges
reusable.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6ea98dfcd027..7b3d9795f322 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -363,9 +363,14 @@ impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { nanos: 0 };
 
+    /// The minimum number of microseconds that can be represented by a [`Delta`].
+    pub const MIN_MICROS: i64 = -9_223_372_036_854_775;
+    /// The maximum number of microseconds that can be represented by a [`Delta`].
+    pub const MAX_MICROS: i64 = 9_223_372_036_854_775;
+
     /// Create a new [`Delta`] from a number of microseconds.
     ///
-    /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
+    /// The `micros` can range from [`Delta::MIN_MICROS`] to [`Delta::MAX_MICROS`].
     /// If `micros` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
     #[inline]
@@ -375,9 +380,14 @@ pub const fn from_micros(micros: i64) -> Self {
         }
     }
 
+    /// The minimum number of milliseconds that can be represented by a [`Delta`].
+    pub const MIN_MILLIS: i64 = -9_223_372_036_854;
+    /// The maximum number of milliseconds that can be represented by a [`Delta`].
+    pub const MAX_MILLIS: i64 = 9_223_372_036_854;
+
     /// Create a new [`Delta`] from a number of milliseconds.
     ///
-    /// The `millis` can range from -9_223_372_036_854 to 9_223_372_036_854.
+    /// The `millis` can range from [`Delta::MIN_MILLIS`] to [`Delta::MAX_MILLIS`].
     /// If `millis` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
     #[inline]
@@ -387,9 +397,14 @@ pub const fn from_millis(millis: i64) -> Self {
         }
     }
 
+    /// The minimum number of seconds that can be represented by a [`Delta`].
+    pub const MIN_SECS: i64 = -9_223_372_036;
+    /// The maximum number of seconds that can be represented by a [`Delta`].
+    pub const MAX_SECS: i64 = 9_223_372_036;
+
     /// Create a new [`Delta`] from a number of seconds.
     ///
-    /// The `secs` can range from -9_223_372_036 to 9_223_372_036.
+    /// The `secs` can range from [`Delta::MIN_SECS`] to [`Delta::MAX_SECS`].
     /// If `secs` is outside this range, `i64::MIN` is used for negative values,
     /// and `i64::MAX` is used for positive values due to saturation.
     #[inline]

base-commit: 2ad6c5cdc89acfefb01b84afa5e55262c40d6fec
-- 
2.43.0

