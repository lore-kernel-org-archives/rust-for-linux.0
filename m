Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5750F1DF755
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766923612; cv=none; b=szmMuvNyhtsZmvKoq6nAuY08rLHLCzCyDyi7DDlfwwyUGrssQ7tJtzhWtl8tS1rg3bLgB0PiVkWKLKMhNOLiSyqVtV1yNJBK4ovkUWjnG76974uI/HbELAsKcjdH9lsiMEosNEsVs8C+Mj4ZzRi1VL0NNK2ljA0oqtgxXHuMSjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766923612; c=relaxed/simple;
	bh=Fj855t3I4CTICGMZSe/bZxVHjn8Ob9FFGmi/tpikOVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPOC4LqF9txtT9lr+b7VRxrCvcumWN7v9Jfgr7kRdc8xjEkcrM5GEdE1AfIYYrqpoBwAkXRiAYDcWic5CfCznWRahbIKripo7OI9ooFu1IGFjz3m+tf+5XQ+XAusS1n9WZUloV55ZV/WbrbXJe9LolZfsnJ5DE3hd1ubWKFMYQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnQrO9fa; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnQrO9fa"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c868b197eso9042706a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 04:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923611; x=1767528411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6D5SL/tU0r+DimNggrw7Qq+jusNR0ZnpyAfP9kPr5uA=;
        b=PnQrO9faLwWNer5PnIPjhyvcxmAYIWArFmgGZ2WA1kdkFwvswEGz7e13eUEyHWqFeb
         ErJ7hMXJJ323xPZeAroE/P+3OvHk9qB7bL5vyrFTz04gyxHhBoqy2rd3oeN3LX9R0TSI
         XIwqKXVB7NzYyCcqi33bFofZbaX0gQN/TCIQ050Q4hmJMVU3tyRFlGGsX9rffGXSjtRs
         R5tM9vyleHdd0NPd8gVwhwJ/05Mc1XLr44Chgq351kSeCep4JE2A+7zjR4wpHSJgU4pX
         Pdof1AdTBED8rS7DZ2ZZik/t8sAFkVRoTaJkuQdD7iqnHyv6rhwjDrGNDsoKEHl7ZekS
         9ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923611; x=1767528411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6D5SL/tU0r+DimNggrw7Qq+jusNR0ZnpyAfP9kPr5uA=;
        b=sV3gJCF40ebjpZSaVkkIbINpNqvIx636Tnc2W8eKHYqkDJTwBu7LMA9dsXubSa/8e9
         KpoT6Smt7YNMDaezW/gMNP2yynrWwSahMgl8b6BTgaNOVlgBFF02bsiKYse47Sx4Ydzb
         V7WBOsgib6U3DKn9Vjtau2Bgk/uBOU0RP+gEpQi5qv4IM1hn66x50C8fgKejR8qGHGpx
         6wEQJHf3HNHsZ2wW1q2lDnpRmCIFlkYApxl3xwC5secLxXi31shfT0m3px8DjHS/F0Cj
         3edxGGS/wwtMubWW7cNBmIJN0m4VulfVc1pa33LQJO3m/nevph55NR16Bb5yyZ8XsFSt
         XcWA==
X-Forwarded-Encrypted: i=1; AJvYcCUApYjY+i0xiRboIGjEIG7coNoXBHNc1Jf4abT4jN9nqgSSvyZtONP8QaBzcNeNuPJxrjjh1oB0WHTV6zjbmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx0Md7f8AbQw2851VluZhLCIpE+dg35YasMPQJc7B2BaLgbarI
	g20K8L+BEK1tz8CknvEgZ8vI3w1JGenQc9k+KclItRMbJfLYGu6gCWwH
X-Gm-Gg: AY/fxX5AguDL3FNUgSAJ8Vtvu3pgyWRXg04r2XB7uZ7gDztiKa3a8zC4paxyaLgQYpP
	SUIbn2ouERb52aVcfid4gxOY6iD7s7PKFgYt1KWLmsRxWmbXzEYCrWpmc3OdVkmYVIocnBi98m3
	pr64TwGq590/RT/MrReCQ806imzMKZJ93E7IGsaiFRsfgMi1oehak7/tRa4oqEnVfUHuGBZ2MJ0
	24RT41+ksR97pbNJQ4jTdhVKUuPx1I5BkOknT5NI07CyuwMyJ2ScQdDFLlmzjn8M5yZ4rfgIfpM
	DMfED0J88IxRNvuAu7pKJOhsPwrDeKDM+v9dtMbxUCYLJo7F7IEKpxLphjjL+r2/g8UuuWmgW9E
	LH5ZXQKOEKwzgfOuMQKU5rTlU1wu4zMko1VxBhrMyobCBkjt77RTWYVA50pEoW1wJVLNLsK6cl9
	i7CGd0KnZRxyuU5P+1ldNjG9vdzNzAJqagy1klmIKaPiv7dSyFLks1iBuV18WN1110FQxUzC7z
X-Google-Smtp-Source: AGHT+IGgnuadbw2GVZfQ646xnEIMflmwjZmlHOCuptJh/vo6f2ohKgx7xDaMO0/oqDQGX0T/rwdxFQ==
X-Received: by 2002:a17:90b:3e85:b0:34c:a35d:de19 with SMTP id 98e67ed59e1d1-34e921f6c7emr22846681a91.33.1766923610627;
        Sun, 28 Dec 2025 04:06:50 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dccd14sm27914829a91.16.2025.12.28.04.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:06:50 -0800 (PST)
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
Subject: [PATCH v1 2/3] rust: sync: atomic: Remove workaround macro for i8/i16 BasicOps
Date: Sun, 28 Dec 2025 21:05:45 +0900
Message-ID: <20251228120546.1602275-3-fujita.tomonori@gmail.com>
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

Remove workaround impl_atomic_only_load_and_store_ops macro and use
declare_and_impl_atomic_methods to add AtomicBasicOps support for
i8/i16.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/helpers/atomic_ext.c           | 16 +++++-----
 rust/kernel/sync/atomic/internal.rs | 48 +----------------------------
 2 files changed, 9 insertions(+), 55 deletions(-)

diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index 3a5ef6bb2776..10733bb4a75e 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -4,42 +4,42 @@
 #include <asm/rwonce.h>
 #include <linux/atomic.h>
 
-__rust_helper s8 rust_helper_atomic_i8_load(s8 *ptr)
+__rust_helper s8 rust_helper_atomic_i8_read(s8 *ptr)
 {
 	return READ_ONCE(*ptr);
 }
 
-__rust_helper s8 rust_helper_atomic_i8_load_acquire(s8 *ptr)
+__rust_helper s8 rust_helper_atomic_i8_read_acquire(s8 *ptr)
 {
 	return smp_load_acquire(ptr);
 }
 
-__rust_helper s16 rust_helper_atomic_i16_load(s16 *ptr)
+__rust_helper s16 rust_helper_atomic_i16_read(s16 *ptr)
 {
 	return READ_ONCE(*ptr);
 }
 
-__rust_helper s16 rust_helper_atomic_i16_load_acquire(s16 *ptr)
+__rust_helper s16 rust_helper_atomic_i16_read_acquire(s16 *ptr)
 {
 	return smp_load_acquire(ptr);
 }
 
-__rust_helper void rust_helper_atomic_i8_store(s8 *ptr, s8 val)
+__rust_helper void rust_helper_atomic_i8_set(s8 *ptr, s8 val)
 {
 	WRITE_ONCE(*ptr, val);
 }
 
-__rust_helper void rust_helper_atomic_i8_store_release(s8 *ptr, s8 val)
+__rust_helper void rust_helper_atomic_i8_set_release(s8 *ptr, s8 val)
 {
 	smp_store_release(ptr, val);
 }
 
-__rust_helper void rust_helper_atomic_i16_store(s16 *ptr, s16 val)
+__rust_helper void rust_helper_atomic_i16_set(s16 *ptr, s16 val)
 {
 	WRITE_ONCE(*ptr, val);
 }
 
-__rust_helper void rust_helper_atomic_i16_store_release(s16 *ptr, s16 val)
+__rust_helper void rust_helper_atomic_i16_set_release(s16 *ptr, s16 val)
 {
 	smp_store_release(ptr, val);
 }
diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 0634368d10d2..1b2a7933bc14 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -256,7 +256,7 @@ macro_rules! declare_and_impl_atomic_methods {
 }
 
 declare_and_impl_atomic_methods!(
-    [ i32 => atomic, i64 => atomic64 ]
+    [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
     /// Basic atomic operations
     pub trait AtomicBasicOps {
         /// Atomic read (load).
@@ -273,15 +273,6 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
     }
 );
 
-// It is still unclear whether i8/i16 atomics will eventually support
-// the same set of operations as i32/i64, because some architectures
-// do not provide hardware support for the required atomic primitives.
-// Furthermore, supporting Atomic<bool> will require even more
-// significant structural changes.
-//
-// To avoid premature refactoring, a separate macro for i8 and i16 is
-// used for now, leaving the existing macros untouched until the overall
-// design requirements are settled.
 declare_and_impl_atomic_methods!(
     [ i32 => atomic, i64 => atomic64 ]
     /// Exchange and compare-and-exchange atomic operations
@@ -332,40 +323,3 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
         }
     }
 );
-
-macro_rules! impl_atomic_only_load_and_store_ops {
-    ($($ty:ty),* $(,)?) => {
-        $(
-            impl AtomicBasicOps for $ty {
-                paste! {
-                    #[inline(always)]
-                    fn atomic_read(a: &AtomicRepr<Self>) -> Self {
-                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
-                        unsafe { bindings::[< atomic_ $ty _load >](a.as_ptr().cast()) }
-                    }
-
-                    #[inline(always)]
-                    fn atomic_read_acquire(a: &AtomicRepr<Self>) -> Self {
-                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
-                        unsafe { bindings::[< atomic_ $ty _load_acquire >](a.as_ptr().cast()) }
-                    }
-
-                    // Generate atomic_set and atomic_set_release
-                    #[inline(always)]
-                    fn atomic_set(a: &AtomicRepr<Self>, v: Self) {
-                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
-                        unsafe { bindings::[< atomic_ $ty _store >](a.as_ptr().cast(), v) }
-                    }
-
-                    #[inline(always)]
-                    fn atomic_set_release(a: &AtomicRepr<Self>, v: Self) {
-                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
-                        unsafe { bindings::[< atomic_ $ty _store_release >](a.as_ptr().cast(), v) }
-                    }
-                }
-            }
-        )*
-    };
-}
-
-impl_atomic_only_load_and_store_ops!(i8, i16);
-- 
2.43.0

