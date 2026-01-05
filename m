Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA41032ED30
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767629577; cv=none; b=mF2tTh7OIv536O2/wO5GDIoe/FckbVeYocUOPaP5cVoQYJm9UMO9t1l6tfnehFlDiiW/YLUowTRgnecCJmqMcBoZqR/beqJkYlZqNQLAdhsuVZTRKi246AwpYX3S6ZMJOrbcOOWxLCGZYcOO+N2+ibrbS1m/nyFHtw1bwKJR1gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767629577; c=relaxed/simple;
	bh=Ze4hRay8zEWQjX+9ea8Tlxh9gfFZA8nwEGPdimwqB8A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LvtWcH1/qJkPQnBKp3i/reUY5qmz+K9EOuXvCV1vQc+e3AyDXIstU88+zjvc3rYR4M39aDFAirBnEuuOQ6ZZhm46BziJM3Q61fI4mIMGdIYleU0snLUvxYe73kFD7opfmF96oqWAIPG8L9EIS8RqvLbc+akxrs7XXbrchJM5chc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gbjh5Xfh; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gbjh5Xfh"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b7ff8a27466so12571666b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 08:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767629574; x=1768234374; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lkUjZSQ3V4y01AwlLqxlRmDE9csH3CjYdI8gUjE2umQ=;
        b=Gbjh5XfhlA57gONOiOe9ehWxLLW5Jq+D0ZcAgnKw6ejQzJXWNhywgKV/ijYTJys2LT
         h4rcc8yVncdV2MNwxU9QnrcEb+DA4Q12+dsiT/I+fD4oBM+zVDG5YMnAossVGYYrfXrH
         UwMmrA9GzRX00ImI1/lSF0bJDkCrMOYhoj3HfPqbQtP1DT7kKIx9tA6eklfEkExXJqav
         OpnshdsvCyL9UE3SWEDgS1Y1WelKbjJwdDznJDDZnkQ4nXSSub5ZYaMe8KecccsZJ8Zf
         J3Edip3tJ/BZOx5mUQ8WTun27DZAqvTjRYgF15BPFO7oX/A1kjCla4LogFQfBmA0wn1J
         pWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767629574; x=1768234374;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lkUjZSQ3V4y01AwlLqxlRmDE9csH3CjYdI8gUjE2umQ=;
        b=L6XWxjCMut3ekqqzdD4gcq7sFOeV+v8xZs7Apwd+hAyZjiIY4JjsXVmlYnKWA8UUHc
         s0fTu+6+qids9IFBSB84/O4Bd0iZ6ycYeGW+J5TUX+PQQHD4b/uYV2qMBEPfsiy48mqL
         SYEs1bxMweF30WbDPri4a6exjYBNru4I4uOUdPmiN/7WNtdrqGhEicIr4LtCYFhTOEH7
         uMzmis0A1UMW3dBRCZ3voCzu3UBm4g44QUCmU0OSMtN2aKe+g7pMsPKIa+NHURtVOHFH
         ZioxOiAuoRu6Q8aoL+NtdMmuv7YrM/TXI287nSsQS3hDvstZ1GHo9hLw5mEF0gtP2ev6
         eksg==
X-Forwarded-Encrypted: i=1; AJvYcCVOAZ4NTkzVpKxVUEEPZcnvGVfPUQNz5jrhYgvMcQDoWxEx3tYr0C4dxNwqASYjNjMl2g4UOMc9W/qI5/rA2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HMwLRC4lbyZpY24WJ5qqze4QWBTZIsSzW/cJgRjl9yFf2Zsp
	GTMG97x6HNGYdpnc1suCd7bKZRV1jQ7l+jXQDR6TOWr8udgX6eRnbonAToN39xL/5nKnoXC/Yk0
	ixJrQViqyIzJZJUHfyA==
X-Google-Smtp-Source: AGHT+IGpQ2bA+Uei5oYMJnhGzMvGz+hKY/BLrb3tYMyC2gLa86YB81EA95dtO/qfPeIXKrpw2KO1YLOsg1ROQdM=
X-Received: from ejcvx3.prod.google.com ([2002:a17:907:a783:b0:b7a:21aa:8975])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7294:b0:b7a:1bdb:30d9 with SMTP id a640c23a62f3a-b8426c263a3mr24554566b.65.1767629574289;
 Mon, 05 Jan 2026 08:12:54 -0800 (PST)
Date: Mon, 05 Jan 2026 16:12:47 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP7iW2kC/x3MMQqAMAxA0auUzAbSigW9ijhUTTUgKo2KIN7d4
 viG/x9QTsIKjXkg8SUq25phCwPDHNaJUcZscOQ8WapwiIJLOlGPcJyKnkaqIvtYlz3kaE8c5f6 Hbfe+H6FnNRdgAAAA
X-Change-Id: 20260105-cfi-lru-status-60d05fe6f93b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6589; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Ze4hRay8zEWQjX+9ea8Tlxh9gfFZA8nwEGPdimwqB8A=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW+MAGfUlSlQJ71wodsylXsZWLUFWKPiDk/+fo
 elh0dq9iU+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVvjAAAKCRAEWL7uWMY5
 Rs2XD/4nrQ7ZA1z5bea00HKgH+8TCGDWTjA5/GlhEzXKt5O7CKv6gT48c7ox+ic1ZQ6ntM5Hx7y
 w138DMsIvvIdyEQk3qGhuZJaa/3CQ/rik+jYOsp4v8+tJdgYbQPxKvWRBC94Fh64AvJy0D1SCxH
 yL2AV0pF1tps1PyO7l1LmtsYG3lNyzzhMD1deReaPtDVcaLfqXjbvfXR83KCgq7sce/3if/FKLv
 udmG5uEGOvCN85Z0EtDucKnTAxEOf9pn90CRTyECRbHf1u0dyIcyY9BMaz+IZxWORRvhrtDRng9
 3ytPtneUNGGfObWWfwc4vYQmqe1xOxjOPaGruJ8DYPu6HwS/RoakOeky0wLjeyg4r+gyA70JAMM
 7vsa3pA85Nd6ymOSuhEKveSSWC/wAU1F8jct7g+L128m4iHeBC5oRuLn1/ds8kc7iwUYdcnm/VY
 YIyb1RShyt7Y+w+HaksB7wPiByr7aTR2vu0UKgt21D8P8o8SkMzERAe9hwVzUnDqO6MSVZHx8+O
 dsFQ8ZulPhCrSs62p/t5ir/ApU8kLnCLf2PVeLeUwwGX/8Iy9sgiuRkK0PD1++3wRBI5ycZ4ZTp
 WvAkDWTLL4sCU5iz4Ga7a1khO6L5F062qMd7ohQlvUDEylBxo7IC0kWfUIt+pTo0OWDPB8kYi50 qzGKANISypbz4jQ==
X-Mailer: b4 0.14.2
Message-ID: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com>
Subject: [PATCH] rust: declare cfi_encoding for lru_status
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Ramon de C Valle <rcvalle@google.com>, 
	Matthew Maurer <mmaurer@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

By default bindgen will convert 'enum lru_status' into a typedef for an
integer, but this leads to the wrong cfi type. It's supposed to be a
type called "lru_status" rather than the underlying native integer type.

To fix this, tell bindgen to generate a newtype and set the CFI type
explicitly. Note that we need to set the CFI attribute explicitly as
bindgen is using repr(transparent), which is otherwise identical to the
inner type for ABI purposes.

This allows us to remove the page range helper C function in Binder
without risking a CFI failure when list_lru_walk calls the provided
function pointer.

This requires bindgen v0.71 or greater.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/Makefile            |  3 +--
 drivers/android/binder/page_range.rs       |  6 +++---
 drivers/android/binder/page_range_helper.c | 24 ------------------------
 drivers/android/binder/page_range_helper.h | 15 ---------------
 rust/bindgen_parameters                    |  4 ++++
 rust/bindings/bindings_helper.h            |  1 -
 rust/bindings/lib.rs                       |  1 +
 rust/uapi/lib.rs                           |  1 +
 8 files changed, 10 insertions(+), 45 deletions(-)

diff --git a/drivers/android/binder/Makefile b/drivers/android/binder/Makefile
index 09eabb527fa092b659559367705fd3667db6cb2c..7e0cd9782a8b24db598034e15e5a36eca91b3fa9 100644
--- a/drivers/android/binder/Makefile
+++ b/drivers/android/binder/Makefile
@@ -5,5 +5,4 @@ obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) += rust_binder.o
 rust_binder-y := \
 	rust_binder_main.o	\
 	rust_binderfs.o		\
-	rust_binder_events.o	\
-	page_range_helper.o
+	rust_binder_events.o
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index 9379038f61f513c51ebed6c7e7b6fde32e5b8d06..eb738e169525839a199132dd71e69e0b9cc69053 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -642,15 +642,15 @@ fn drop(self: Pin<&mut Self>) {
     unsafe {
         bindings::list_lru_walk(
             list_lru,
-            Some(bindings::rust_shrink_free_page_wrap),
+            Some(rust_shrink_free_page),
             ptr::null_mut(),
             nr_to_scan,
         )
     }
 }
 
-const LRU_SKIP: bindings::lru_status = bindings::lru_status_LRU_SKIP;
-const LRU_REMOVED_ENTRY: bindings::lru_status = bindings::lru_status_LRU_REMOVED_RETRY;
+const LRU_SKIP: bindings::lru_status = bindings::lru_status::LRU_SKIP;
+const LRU_REMOVED_ENTRY: bindings::lru_status = bindings::lru_status::LRU_REMOVED_RETRY;
 
 /// # Safety
 /// Called by the shrinker.
diff --git a/drivers/android/binder/page_range_helper.c b/drivers/android/binder/page_range_helper.c
deleted file mode 100644
index 496887723ee003e910d6ce67dbadd8c5286e39d1..0000000000000000000000000000000000000000
--- a/drivers/android/binder/page_range_helper.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/* C helper for page_range.rs to work around a CFI violation.
- *
- * Bindgen currently pretends that `enum lru_status` is the same as an integer.
- * This assumption is fine ABI-wise, but once you add CFI to the mix, it
- * triggers a CFI violation because `enum lru_status` gets a different CFI tag.
- *
- * This file contains a workaround until bindgen can be fixed.
- *
- * Copyright (C) 2025 Google LLC.
- */
-#include "page_range_helper.h"
-
-unsigned int rust_shrink_free_page(struct list_head *item,
-				   struct list_lru_one *list,
-				   void *cb_arg);
-
-enum lru_status
-rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one *list,
-			   void *cb_arg)
-{
-	return rust_shrink_free_page(item, list, cb_arg);
-}
diff --git a/drivers/android/binder/page_range_helper.h b/drivers/android/binder/page_range_helper.h
deleted file mode 100644
index 18dd2dd117b253fcbac735b48032b8f2d53d11fe..0000000000000000000000000000000000000000
--- a/drivers/android/binder/page_range_helper.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2025 Google, Inc.
- */
-
-#ifndef _LINUX_PAGE_RANGE_HELPER_H
-#define _LINUX_PAGE_RANGE_HELPER_H
-
-#include <linux/list_lru.h>
-
-enum lru_status
-rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one *list,
-			   void *cb_arg);
-
-#endif /* _LINUX_PAGE_RANGE_HELPER_H */
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index fd2fd1c3cb9a51ea46fcd721907783b457aa1378..1358f3348ffdd31f9bef6c04ee9577d0f6a0c5a6 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -23,6 +23,10 @@
 # warning. We don't need to peek into it anyway.
 --opaque-type spinlock
 
+# enums that appear in indirect function calls should specify a cfi type
+--newtype-enum lru_status
+--with-attribute-custom-enum=lru_status='#[cfi_encoding="lru_status"]'
+
 # `seccomp`'s comment gets understood as a doctest
 --no-doc-comments
 
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422b4256f4a2b75fe644d47e6e82c8..cc12cf1614eac38bcbc1c634e6e7e6d8ccfec434 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -147,5 +147,4 @@ const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
-#include "../../drivers/android/binder/page_range_helper.h"
 #endif
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 0c57cf9b4004f176997c59ecc58a9a9ac76163d9..7f72ab66eebe6ef4227ce1b210d66a7867cbf5dd 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -23,6 +23,7 @@
     unreachable_pub,
     unsafe_op_in_unsafe_fn
 )]
+#![feature(cfi_encoding)]
 
 #[allow(dead_code)]
 #[allow(clippy::cast_lossless)]
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 1d5fd9efb93e9db97fec84fca2bae37b500c20c5..83c4795acbff1da852639bcbd9bcf5fb66b7e070 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -28,6 +28,7 @@
     unsafe_op_in_unsafe_fn
 )]
 #![cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
+#![feature(cfi_encoding)]
 
 // Manual definition of blocklisted types.
 type __kernel_size_t = usize;

---
base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
change-id: 20260105-cfi-lru-status-60d05fe6f93b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

