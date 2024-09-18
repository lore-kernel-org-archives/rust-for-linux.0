Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A251494B1
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Sep 2024 22:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726699900; cv=none; b=uQn9lu2QYUbzaMaUj70UCZortvWJ5IMbeQOArr8xUPAyEtobxwakzgOKwyneqy4UjdbYOfIq4wUiiHikkCaerxH3uQMRSs2FKljloqItlOo/6EsBClzkGiNxpSukLwqor83VqBDepcDtb2S8hhUSy6umh4gHFuxcvy0tG3oEJB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726699900; c=relaxed/simple;
	bh=Bxa7g13IljFlVU52UnAmcYe2B2JR8bvmxzic11zXUmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u92QiHGEIi/sQSAdsbbg/vH2YvoOFWp+bX3khoipTUyImxJQ/JGe4Z4g4astvLXbW1ZEqDnZU9Nme8xGZt7/SDphonBSEEvzoE78jsdm4H6tr5EVkbiF5/K3J0d2h2OZrBFr86A86q3SASj/ceHbFcpe/LHPH4GZlxGlpMhV+3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrjpzFud; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrjpzFud"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6c582ca168fso1140246d6.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Sep 2024 15:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726699898; x=1727304698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrFKD/01TQoxbavJuu6mg4GA/Q0s/ylPIwTCZM0ZtYk=;
        b=ZrjpzFudUci8MPJf0+jl6ia8CBcvGNw8B+tLQML8tcwJwARAlJ+qpJnOYbYl9JRIX9
         pA+9BXGtqLuNC6TemwfrSGrVA11Br5scJtmGALyimANk7TirgIBpxDQsRYQj11obgsBC
         Qs5B2cIhCbKrg2YeXt4UGeYE0E7g7HkRREw70dgA1SKkURW1/zq8A62HyElTbVX+XhUg
         poMj8m4lB4q8fVSSlBu0ULvBZzyXIZMZ84Qdz+hXTId7erSwNZx/bYoYu65LeJgUnBeq
         VGPQbeUxnd0SMaIHh+tL82Xsuvu7NhyAWT1ipCylBxBsT854EGtsKy7QGPzYxGzqMh6r
         kKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726699898; x=1727304698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrFKD/01TQoxbavJuu6mg4GA/Q0s/ylPIwTCZM0ZtYk=;
        b=fVn2RhKTSgTmP8d82+R91nRbbwSbDunIo+RAMajKPpTmvT4SljnIo2eoyePhVf1gqk
         AmdOLx2fSzMI7jESYbHgDLaVZinITC7wyDW1uTu0JHrhJEtgNh+fq+q87tF9rX8wvb30
         /JVPKGncxqFF4iKYoV9iXxk/wJT218KDMtMx1S1LDa9iakzjm8IAFc3I6oyFvliuX6Hz
         v90CA3Mqea4cPgxPLhbVft8SI+EnS0LPtNW/gG1qMG4RnDIvNX8QwzxdfRjz6dZO4gtr
         dXaoneXAwUCXkb0LfNN8tATvwpRFw3808Nj/vR+2ZJbj73Zp6T2JeugOLPibercrt/d4
         S7bw==
X-Forwarded-Encrypted: i=1; AJvYcCUj+RsnxPCW9/tTYqeCMFRF2W7tg3iD6WbfiIMQ3NnlE9ACkjLtPw7CsF+C2o8IRvu+uz3SFQ8oDNZ3JPvt8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr+WB8Pym+4tyBzcQ5oBrgzjeHXmuhmCAzGkSvWkAbncy0kYZ/
	6p5ngJyRX+Sf6gE5gl+06OOuVnavmwZZJ8+NP2H2XxVTmF2RMYSN
X-Google-Smtp-Source: AGHT+IHNNChe40blit5EL5Avu04r+UxDc8KZKZ2nm8gD8uj3ZqHmYabJsmtIAqMxW3eKuVFhSngFKA==
X-Received: by 2002:a05:6214:5d08:b0:6c5:111e:8ff7 with SMTP id 6a1803df08f44-6c57df6e856mr299688586d6.2.1726699897791;
        Wed, 18 Sep 2024 15:51:37 -0700 (PDT)
Received: from localhost.localdomain ([146.70.202.153])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c75e46f58esm1675736d6.56.2024.09.18.15.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 15:51:37 -0700 (PDT)
From: Aliet Exposito Garcia <aliet.exposito@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Aliet Exposito Garcia <aliet.exposito@gmail.com>
Subject: [PATCH 1/2] rust: Move `FromBytes` and `AsBytes` traits to a new `transmute` module
Date: Wed, 18 Sep 2024 18:51:14 -0400
Message-ID: <20240918225115.2309224-2-aliet.exposito@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240918225115.2309224-1-aliet.exposito@gmail.com>
References: <20240918225115.2309224-1-aliet.exposito@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch refactors the `FromBytes` and `AsBytes` traits from `types.rs`
into a new `transmute.rs` module.
The traits and their implementations remain unchanged.
 - Adds `rust/kernel/transmute.rs` with the definitions of `FromBytes`
    and `AsBytes`
 - Removes the same trait definitions from `rust/kernel/types.rs`
 - Updates `rust/kernel/uaccess.rs` to import `AsBytes` and `FromBytes`
    from `transmute.rs`

Suggested-by: Benno Lossin <benno.lossin@proton.me>

Link: https://github.com/Rust-for-Linux/linux/issues/1117
Signed-off-by: Aliet Exposito Garcia <aliet.exposito@gmail.com>
---
 rust/kernel/lib.rs       |  1 +
 rust/kernel/transmute.rs | 67 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/types.rs     | 64 --------------------------------------
 rust/kernel/uaccess.rs   |  2 +-
 4 files changed, 69 insertions(+), 65 deletions(-)
 create mode 100644 rust/kernel/transmute.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f10b06a78..5007ba914 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -52,6 +52,7 @@
 pub mod sync;
 pub mod task;
 pub mod time;
+pub mod transmute;
 pub mod types;
 pub mod uaccess;
 pub mod workqueue;
diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
new file mode 100644
index 000000000..89d74de94
--- /dev/null
+++ b/rust/kernel/transmute.rs
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Traits for transmuting types.
+
+/// Types for which any bit pattern is valid.
+///
+/// Not all types are valid for all values. For example, a `bool` must be either zero or one, so
+/// reading arbitrary bytes into something that contains a `bool` is not okay.
+///
+/// It's okay for the type to have padding, as initializing those bytes has no effect.
+///
+/// # Safety
+///
+/// All bit-patterns must be valid for this type. This type must not have interior mutability.
+pub unsafe trait FromBytes {}
+
+// SAFETY: All bit patterns are acceptable values of the types below.
+unsafe impl FromBytes for u8 {}
+unsafe impl FromBytes for u16 {}
+unsafe impl FromBytes for u32 {}
+unsafe impl FromBytes for u64 {}
+unsafe impl FromBytes for usize {}
+unsafe impl FromBytes for i8 {}
+unsafe impl FromBytes for i16 {}
+unsafe impl FromBytes for i32 {}
+unsafe impl FromBytes for i64 {}
+unsafe impl FromBytes for isize {}
+// SAFETY: If all bit patterns are acceptable for individual values in an array, then all bit
+// patterns are also acceptable for arrays of that type.
+unsafe impl<T: FromBytes> FromBytes for [T] {}
+unsafe impl<T: FromBytes, const N: usize> FromBytes for [T; N] {}
+
+/// Types that can be viewed as an immutable slice of initialized bytes.
+///
+/// If a struct implements this trait, then it is okay to copy it byte-for-byte to userspace. This
+/// means that it should not have any padding, as padding bytes are uninitialized. Reading
+/// uninitialized memory is not just undefined behavior, it may even lead to leaking sensitive
+/// information on the stack to userspace.
+///
+/// The struct should also not hold kernel pointers, as kernel pointer addresses are also considered
+/// sensitive. However, leaking kernel pointers is not considered undefined behavior by Rust, so
+/// this is a correctness requirement, but not a safety requirement.
+///
+/// # Safety
+///
+/// Values of this type may not contain any uninitialized bytes. This type must not have interior
+/// mutability.
+pub unsafe trait AsBytes {}
+
+// SAFETY: Instances of the following types have no uninitialized portions.
+unsafe impl AsBytes for u8 {}
+unsafe impl AsBytes for u16 {}
+unsafe impl AsBytes for u32 {}
+unsafe impl AsBytes for u64 {}
+unsafe impl AsBytes for usize {}
+unsafe impl AsBytes for i8 {}
+unsafe impl AsBytes for i16 {}
+unsafe impl AsBytes for i32 {}
+unsafe impl AsBytes for i64 {}
+unsafe impl AsBytes for isize {}
+unsafe impl AsBytes for bool {}
+unsafe impl AsBytes for char {}
+unsafe impl AsBytes for str {}
+// SAFETY: If individual values in an array have no uninitialized portions, then the array itself
+// does not have any uninitialized portions either.
+unsafe impl<T: AsBytes> AsBytes for [T] {}
+unsafe impl<T: AsBytes, const N: usize> AsBytes for [T; N] {}
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9e7ca0663..d086f8503 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -468,67 +468,3 @@ pub enum Either<L, R> {
     /// Constructs an instance of [`Either`] containing a value of type `R`.
     Right(R),
 }
-
-/// Types for which any bit pattern is valid.
-///
-/// Not all types are valid for all values. For example, a `bool` must be either zero or one, so
-/// reading arbitrary bytes into something that contains a `bool` is not okay.
-///
-/// It's okay for the type to have padding, as initializing those bytes has no effect.
-///
-/// # Safety
-///
-/// All bit-patterns must be valid for this type. This type must not have interior mutability.
-pub unsafe trait FromBytes {}
-
-// SAFETY: All bit patterns are acceptable values of the types below.
-unsafe impl FromBytes for u8 {}
-unsafe impl FromBytes for u16 {}
-unsafe impl FromBytes for u32 {}
-unsafe impl FromBytes for u64 {}
-unsafe impl FromBytes for usize {}
-unsafe impl FromBytes for i8 {}
-unsafe impl FromBytes for i16 {}
-unsafe impl FromBytes for i32 {}
-unsafe impl FromBytes for i64 {}
-unsafe impl FromBytes for isize {}
-// SAFETY: If all bit patterns are acceptable for individual values in an array, then all bit
-// patterns are also acceptable for arrays of that type.
-unsafe impl<T: FromBytes> FromBytes for [T] {}
-unsafe impl<T: FromBytes, const N: usize> FromBytes for [T; N] {}
-
-/// Types that can be viewed as an immutable slice of initialized bytes.
-///
-/// If a struct implements this trait, then it is okay to copy it byte-for-byte to userspace. This
-/// means that it should not have any padding, as padding bytes are uninitialized. Reading
-/// uninitialized memory is not just undefined behavior, it may even lead to leaking sensitive
-/// information on the stack to userspace.
-///
-/// The struct should also not hold kernel pointers, as kernel pointer addresses are also considered
-/// sensitive. However, leaking kernel pointers is not considered undefined behavior by Rust, so
-/// this is a correctness requirement, but not a safety requirement.
-///
-/// # Safety
-///
-/// Values of this type may not contain any uninitialized bytes. This type must not have interior
-/// mutability.
-pub unsafe trait AsBytes {}
-
-// SAFETY: Instances of the following types have no uninitialized portions.
-unsafe impl AsBytes for u8 {}
-unsafe impl AsBytes for u16 {}
-unsafe impl AsBytes for u32 {}
-unsafe impl AsBytes for u64 {}
-unsafe impl AsBytes for usize {}
-unsafe impl AsBytes for i8 {}
-unsafe impl AsBytes for i16 {}
-unsafe impl AsBytes for i32 {}
-unsafe impl AsBytes for i64 {}
-unsafe impl AsBytes for isize {}
-unsafe impl AsBytes for bool {}
-unsafe impl AsBytes for char {}
-unsafe impl AsBytes for str {}
-// SAFETY: If individual values in an array have no uninitialized portions, then the array itself
-// does not have any uninitialized portions either.
-unsafe impl<T: AsBytes> AsBytes for [T] {}
-unsafe impl<T: AsBytes, const N: usize> AsBytes for [T; N] {}
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index e9347cff9..0af243482 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -9,7 +9,7 @@
     bindings,
     error::Result,
     prelude::*,
-    types::{AsBytes, FromBytes},
+    transmute::{AsBytes, FromBytes},
 };
 use alloc::vec::Vec;
 use core::ffi::{c_ulong, c_void};
-- 
2.46.0

