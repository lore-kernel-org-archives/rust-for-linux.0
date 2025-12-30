Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8F961FFE
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 04:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767070240; cv=none; b=lSxgyOYqWEJfhCuWuLX1SsPuBV5IUJCt7Nfhd7AIntstuBuQqtG2ccA3p6jrNob75S6kGEtu0hFzwrnaFsY1NE6Qc4b1JSZ/xsQZbLPwKKFI7QfI4WqJ7YkIQn4jWNZ5Ib5D4oTm8zwUC/oPD4yVqx3EIkMkSKu94pfqVqLl3Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767070240; c=relaxed/simple;
	bh=pfSjhiBCdWEueZV2JY7NvPpeGueAo/ur4F5F/8tuP2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oe14H5yta8WxV4HbDOLdXvKczbiwvL/80519tni+YQCcDZqRV8x/yimB8HSOpCfL/BM1OProyZwfwsiwcYg5+feskBP+hTSnrbGZ8mWKDGiHCoq7xK1maweQZPmanWegEQiAkioQS+OoJGH/7Khq9Qlwq/Jdqlf2PSvA5smusYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOBNgV06; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOBNgV06"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b9387df58cso15507225b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 20:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767070238; x=1767675038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAQu8usZZgPqr6XefOMeBwVUvwr/9/vXnmhBkCIeE70=;
        b=TOBNgV06j1CjDiomX/VT+VmbIAps/hLd3GlUG42NA3DjUG4ukI+liKGoeaBx7jtRS4
         aWAW7TtXfCZptxyAW7TIwUb/ih/N+vwBcECz2hj/vvtk4dTaWjgLJv6a7qcGHACsk6BD
         KHESCyibSrLFzCnC/w5yGEwg6aWq4y9d7h/57fiJn+hN4GTzpDafAvuBzcwnSgSmDfDK
         H0kIAnqd5HrxJ4Tzw3fFHVejPQ7ekVXbqrcl9OOdAalQtIAZu9a4eXHVvHfk/odUY9Dh
         QTTOkkxcW4FfKi1M1UpFZ81ZZYaJmm1XusEHJYbi4Rt8+5BabvF46G+K64tiAgUeOL2f
         EZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767070238; x=1767675038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BAQu8usZZgPqr6XefOMeBwVUvwr/9/vXnmhBkCIeE70=;
        b=EkiNquFOLTW1wtkxrReDVMeGUbEnZI+EvdD74RbUj2uJiCq4citDWV1O2GQmwzZdjL
         Sn++ILMrDHjLqo7OB+B20nUK6hTmN8N0ueP5ekek/SmrEe51lzQKkySdNqw9l7+A5y4J
         EzQMMs8TfbVfGdVzqwuf91/HauxcOqtbDtWiK1Rjxhvb+Rs/iv0O4xAQOJk+ArCu0Mmy
         lnItwkw1TUlRuVQqEoHi5wY3gMMcjyiSzm7visV5aodavll+nBOP8RsQo0jxUlPFvRgP
         4gKGfGVuj1yX6C5Cz2k4hMuqA+YcywWYbQHf75+AHeW71zpmnenCiQOEUB5AyGn0kG4B
         oELA==
X-Forwarded-Encrypted: i=1; AJvYcCV6y/2zr/H9vNu5Gyxmg8uY/LTTSJZL+AC/ZcCmpQVlGCijkVtg0Yx35SKdcNNA3LiH6i4JDdFFk3aJPC42ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6RE6EjR6GYre2Ly17KugIhpSXUndZAwysIJQ3HBgOHpfActU
	gLnVB5LkuzRnVPr1xfWbUYqMW19oD3F/a/x/XYuH4UIX9lITqg9r0Wbq
X-Gm-Gg: AY/fxX7mcBs+77hPkvAukKD5ngSPvW2J1miYcWAHPo3sP4K6k2OWHfrx+k84CjyUvQg
	u1gaCq5Kp2WiEL7p0HuWhsooSGB1luU8nOoiWp3iblCe1q5xBA+ktlfyw0gjnJyapmVCWXN8BLv
	fWCUnZymzTFZJ6ggCdw/4IkpQ84B+3hNT6RJ2b4q/e4moqu83uduRkwb0Xus3DD3Z0CCoTGns+T
	lRkCv17Vj186YAn0I3agJVSx5ARKTHm77GNcbI7NeDrZZBXphhztKh+VYjgCA14q8D+WzRpH3E/
	4drMAZZAxm7/wKWLrrn9VBc1XpN9oX1HIbPvnANXtHoGRhJXPUex4HSN6F6AXP7Y65bqom23OWw
	ugP34GskeuzmRXiTtVwHkGYq8/qE2F+BUDQXaTPn53yv9CJbPJkSrRzbjw0p0S+eJEXMpIZFteU
	V/ooOzR/MXfqL7TIQdGqxcgkrpwM1/7X90w4GCh37Bn0TlxgK2zGqUoroxrv6INA==
X-Google-Smtp-Source: AGHT+IFRltqB5h90bJgRJypmxdLSXnFioKVInc9YxdWoeZP/3RSsexZ217SSNT+4mgmdbFQb9uXs2w==
X-Received: by 2002:a05:6a00:420f:b0:7ac:1444:6777 with SMTP id d2e1a72fcca58-7ff646f9380mr30293750b3a.12.1767070238391;
        Mon, 29 Dec 2025 20:50:38 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7aa328basm31100194b3a.11.2025.12.29.20.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 20:50:38 -0800 (PST)
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
Subject: [PATCH v1 1/2] rust: sync: atomic: Add atomic bool support via i8 representation
Date: Tue, 30 Dec 2025 13:50:27 +0900
Message-ID: <20251230045028.1773445-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230045028.1773445-1-fujita.tomonori@gmail.com>
References: <20251230045028.1773445-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add `bool` support, `Atomic<bool>` by using `i8` as its underlying
representation.

Rust specifies that `bool` has size 1 and alignment 1 [1], so it
matches `i8` on layout; keep `static_assert!()` checks to enforce this
assumption at build time.

Implement `AtomicImpl` for `bool` under
`CONFIG_ARCH_SUPPORTS_ATOMIC_RMW`, consistent with the existing
`i8/i16` gating.

Document the additional safety requirement for
`Atomic::<bool>::from_ptr`: only bit patterns 0 (false) and 1 (true)
are valid.

Link: https://doc.rust-lang.org/reference/types/boolean.html [1]
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic.rs           |  1 +
 rust/kernel/sync/atomic/internal.rs  |  8 ++++++++
 rust/kernel/sync/atomic/predefine.rs | 11 +++++++++++
 3 files changed, 20 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4aebeacb961a..2c998cbd300e 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -158,6 +158,7 @@ pub const fn new(v: T) -> Self {
     ///
     /// - `ptr` is aligned to `align_of::<T>()`.
     /// - `ptr` is valid for reads and writes for `'a`.
+    /// - If `T` is `bool`, only the bit patterns 0 (`false`) and 1 (`true`) are valid.
     /// - For the duration of `'a`, other accesses to `*ptr` must not cause data races (defined
     ///   by [`LKMM`]) against atomic operations on the returned reference. Note that if all other
     ///   accesses are atomic, then this safety requirement is trivially fulfilled.
diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
index 0dac58bca2b3..0e12955082e5 100644
--- a/rust/kernel/sync/atomic/internal.rs
+++ b/rust/kernel/sync/atomic/internal.rs
@@ -16,6 +16,7 @@ pub trait Sealed {}
 // The C side supports atomic primitives only for `i32` and `i64` (`atomic_t` and `atomic64_t`),
 // while the Rust side also layers provides atomic support for `i8` and `i16`
 // on top of lower-level C primitives.
+impl private::Sealed for bool {}
 impl private::Sealed for i8 {}
 impl private::Sealed for i16 {}
 impl private::Sealed for i32 {}
@@ -37,6 +38,13 @@ pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
     type Delta;
 }
 
+// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
+// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
+#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
+impl AtomicImpl for bool {
+    type Delta = Self;
+}
+
 // The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
 // guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
 #[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 248d26555ccf..3fc99174b086 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -5,6 +5,17 @@
 use crate::static_assert;
 use core::mem::{align_of, size_of};
 
+// Ensure size and alignment requirements are checked.
+static_assert!(size_of::<bool>() == size_of::<i8>());
+static_assert!(align_of::<bool>() == align_of::<i8>());
+
+// SAFETY: `bool` has the same size and alignment as `i8`, and Rust guarantees that `bool` has
+// only two valid bit patterns: 0 (false) and 1 (true). Those are valid `i8` values, so `bool` is
+// round-trip transmutable to `i8`.
+unsafe impl super::AtomicType for bool {
+    type Repr = i8;
+}
+
 // SAFETY: `i8` has the same size and alignment with itself, and is round-trip transmutable to
 // itself.
 unsafe impl super::AtomicType for i8 {
-- 
2.43.0

