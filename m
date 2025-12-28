Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DAE26E16C
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766923616; cv=none; b=q61/oahm9x7l+QheoaNRDMEYRwEOJErKoZ01tBjzjJ5meZFiEUnm6yUWT9tT5dVg6TsEoeGk89rL3j16au3Mz7cfdKAmG2CUj1F5wOkPbOwcFeTsYSSzKbumJjHHUwUE2btyiwxM71lzWGYDVrVz9IeaYSoReXtN6gP/vacEF3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766923616; c=relaxed/simple;
	bh=vuUX1mk/VJxRZfH7rvomzLR0gIbpaEYqrEcG+teLjYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ph0HRUTAUwaJ4V08ydy52ERxAAIjm2Ny0Fa10Utf1fk/oCaIP9M+0yjCy2oiBy4rymelSqvXVS/smYI+FfW83KR8HmpULyk29h9B2hU1yvUmbtiLXxxRClYr1VtBW84Ux3MiEF/zqlec/wE5th7ldouPdHW7o5ia97rSEI5F+hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZlgNEsi; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZlgNEsi"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso7429163a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 04:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923614; x=1767528414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udBZ3SDDpJ067s9KyXQUT2WA2NoaCEPHVst8W/2Rtbg=;
        b=UZlgNEsipWuTYqWvkQdg3KxfW5YhRnZPP4NW7X0ZzY8UX9BuzXD3qPcN4zJ71LDkix
         5dbJKVFMYjvW9I6jsOd/ew7oV0lnDn0BNZcDZnSJDt9AcTXrC+cpVkrpmImoZvV4/0MS
         KIH+gjoNypbjk1j7V6705s++W5plII4xXs829k3wNz+YxH7GNqllWXQykC4NH1yrPNgB
         HeeqyLWfYlXTK/7tfrXIyAScCIICCefWC+R3zl4iKQpKVRQISBU0UOSv52PpPUCvT5yo
         lzno4larMUe2hbeyLmFGQgeBkQ8Ry46gnfxQ/6Hm2lo7fQrkQF1MhIwIayB4oX+qgAC7
         rVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923614; x=1767528414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=udBZ3SDDpJ067s9KyXQUT2WA2NoaCEPHVst8W/2Rtbg=;
        b=hBy2ct6UusihCn/kHkQfxfftMelogNI7o82vEbVWTTBijOV+7i+oELLU8+6//bvQMd
         h1r8qaBe3KiQ11zdjK8k9SA1bGR1EZTXwcT0DUizpG0smvOhwtu83vvPI/V6pZhuQBpw
         aMD4ifuybK9JBTHSVHsgtKlakHCJSgvZM7e+Q0occ8temm+RNPb7uGvF9Rj5K6NigqEX
         dAR1llpcGVVlYYL57a5ZV0o+fVdEhK1cPo12FxjW745Yxzu4+qhBNpgerQVLmUenhVBo
         /WK57Rm+/VloyiTRydsZ46lciGj8yPmEyxGp9swIjfiskQnPAIbc2fWq8v5+Mi+OOPKw
         SHuA==
X-Forwarded-Encrypted: i=1; AJvYcCWFCW+uyFCHkxLhZa+Q5wzOi1DtmEGvHFRnJpSxPIG1iU40jA/ieVgxc3Ja7ZUI25uYQDciZxva3tWIkaBgzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo9gBFbSkCAGvJwt9MsnksDsL2kSqY0S7TXSJAvmxInm0FRyRG
	FXSdvGJmioe2wBVMOESlJaUXebNm9xQxe4Bm62Yb6PqtVx14SthQCK8z
X-Gm-Gg: AY/fxX6Z5327wMb/sDLYIQGgoSVALKZeMTI00aj0PZSSjHibucSDoLWeYOjSNxN31RB
	2czQi3uaOokXErJCGin2zWI2R0jFH8M+eHEqlwoKL4QkbsdNefPmPM464fHDmPYDvpvY6qEmGP8
	SH+Jtgta+VgupUG270PlIZPEN9brhnXzkFDkQ5iygqQ9LjNIL5KE8swlM0sHywP+wJCYB6vkXKA
	wdDgFjy4rOF+6vvQrEpa8ViR+7MN/g6gTaxgCGbZ4Ep1ezUybnwAlmdZDBlIh4euDcEGgZyF/uQ
	Re9kwiZ77GdNB+abMwJzS6/GGg92dYRUMAANr826HJD0lWvqdFLHkCs524+p29HDjTlvq0rrJHY
	FZwXQS0d1qFoE+vt37M+2Y0c7tFy/Mm95oTICbo4+NwvdUHn+EE8JoJEM2InnGrRMPpVtz86sRL
	N95FvNeYaaFS6+/KzE5ih0c5M3yEDjOzVXDeu1J7F33uJFOMgrIlLgA0WRGxX2Hw==
X-Google-Smtp-Source: AGHT+IFXx40ZbUxsAyM/VZOPSBoXjxpm/etqD20ZbZ2Pq5V4usnuZlWpOlKaBvoUEp0qTG6TdrwjXA==
X-Received: by 2002:a17:90b:4c46:b0:34a:aa7b:1af8 with SMTP id 98e67ed59e1d1-34e921ec7d5mr20049650a91.32.1766923613656;
        Sun, 28 Dec 2025 04:06:53 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dccd14sm27914829a91.16.2025.12.28.04.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:06:53 -0800 (PST)
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
Subject: [PATCH v1 3/3] rust: sync: atomic: Add i8/i16 xchg and cmpxchg support
Date: Sun, 28 Dec 2025 21:05:46 +0900
Message-ID: <20251228120546.1602275-4-fujita.tomonori@gmail.com>
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

Add atomic xchg and cmpxchg operation support for i8 and i16 types
with tests.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/internal.rs  | 2 +-
 rust/kernel/sync/atomic/predefine.rs | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 1b2a7933bc14..55a80e22a7a0 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -274,7 +274,7 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
 );
 
 declare_and_impl_atomic_methods!(
-    [ i32 => atomic, i64 => atomic64 ]
+    [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
     /// Exchange and compare-and-exchange atomic operations
     pub trait AtomicExchangeOps {
         /// Atomic exchange.
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 51e9df0cf56e..248d26555ccf 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -149,7 +149,7 @@ fn atomic_acquire_release_tests() {
 
     #[test]
     fn atomic_xchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
@@ -162,7 +162,7 @@ fn atomic_xchg_tests() {
 
     #[test]
     fn atomic_cmpxchg_tests() {
-        for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
             let x = Atomic::new(v);
 
             let old = v;
-- 
2.43.0

