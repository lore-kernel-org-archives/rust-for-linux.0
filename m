Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3E815D5A6
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 21:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103360; cv=none; b=Ml7mJ0D0fHPhCG37TW24l+sOyOc9rNk70IIKIxCNG03pdEg76/pc/pW85h4480p34kgHePdEUuOLABZwjCvw1A8SXBUbiAV/BgMZJZTARSR5yvQM7vIiylzp29QAtm5hVnN5wB9/rTlY7Z9LsRKPPNjQCcmACTixgKbyquUdTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103360; c=relaxed/simple;
	bh=QXVwuyABVLpLt6Mh/xtj6wT5oL3WMNpIk4hb6szKexE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iczaw/bRyk3Q5Ly2CSCZQ75+e5ujDjfK353FrpeGHKEcSG5lxNqDmeuWFbYioQ5KX2IfyUnPljXts/X9fzwo8XZQwf97PqbQ33eyjQ1+yvXVTMHcUHzdfBjKzp3K9OF1cQJu4tQsgLdTGUfqqSTBkh0gPIc05pn4UB/WKW6jNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OokaoxRv; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OokaoxRv"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6b052c5939cso43872437b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 14:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724103358; x=1724708158; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DLZP/QF5cmnVPLPNbpw6BEPvqDqvHQJMieoIEn+0YgI=;
        b=OokaoxRvVng5EXprC6LCOHHlPKkcxYuiL0CcccFRaZGcbu40HxfCs9pC25gYmDWzU6
         OUjKR5gGABsdT6eT6rev/AnkKFMhhx2+kz39SQOeEsl3qUJ4la9PgSZkPZ3UqrqOIPgG
         JBrzsW8s9JuqVgwkixcyji4nJ4Eq9cOCGAcW20RCzjOhx7U0WHH9kqEd02fYX4xSe3IF
         NS/95Z4MBrTWIvqOSBXMUEnKUEu1LlDAUH//osYXgr4UtouN3j8qfjz+3/I+CvTHDhw2
         gbuGWEWQpkezazniVlAnxvrfo+09sLt9V6PYCfaonDektTEjUCI1jfO5tFQUmMgN5RVx
         EbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724103358; x=1724708158;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLZP/QF5cmnVPLPNbpw6BEPvqDqvHQJMieoIEn+0YgI=;
        b=lHlgNm59qfUT6Bok6DS+WSEiK7d1+R3q9P8M4b1wRDpLwghm+EmVG6CRxYALxDVc4f
         MVWwNj/EI5wDnPkNggHW6Z+8lN6z3UnRiB+r3SdW08WctU7rVgrkGXXxwf/FjLujaCg/
         KdwIT+CnPzhAOcAb6RRvLUMI6pSWHJXpGlJOagNLfKtMNnUdROFQ7SmYwcY4ygrMpxfS
         jPOmsl9KarUUmZ9Ubj9hGNeXsna5D6oOZ43A7Wuf2nhHiQkvmfcvBFDssfbSrw/Bdxq+
         58LN3wegHf9bZL0v+2noSuX+jj1KsvJvaTVi+xBYOyjFp1+gYG85YI3x+XtN9y5Hd2wZ
         55Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUmfRdsiOuuvtfyS5ZHpa7jsuPQyVoNSre91TtVNXc3BGT2+rXWT0sPL77lsni+fHYRknGfavFEEF/PUHf05w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTlwXNFy44PNttLD9YgWn9MJBD380nvXGalnJSePJ+T6dgeMFm
	1ri9AGgP9qhBH4ZfcOS2nmb8Xfx7ph/jqCTPOjRK/TMtjh453qW4c27QthGJF+2zCceuGtfop10
	SJZNTBg==
X-Google-Smtp-Source: AGHT+IFZS2xXJL0usEpl7aC1i9T/njX/Lp67FzLHxgLhINWz6El3o0+qNCa3oemMpCX7xuFSKtHBgm4HGnGG
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:4d82:b0:644:c4d6:add0 with SMTP
 id 00721157ae682-6bdcdcb9effmr348377b3.1.1724103358288; Mon, 19 Aug 2024
 14:35:58 -0700 (PDT)
Date: Mon, 19 Aug 2024 21:35:22 +0000
In-Reply-To: <20240819213534.4080408-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240819213534.4080408-5-mmaurer@google.com>
Subject: [PATCH v3 4/4] kasan: rust: Add KASAN smoke test via UAF
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, Matthew Maurer <mmaurer@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Adds a smoke test to ensure that KASAN in Rust is actually detecting a
Rust-native UAF. There is significant room to expand this test suite,
but this will at least ensure that flags are having the intended effect.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 mm/kasan/Makefile                         |  9 ++++++++-
 mm/kasan/kasan.h                          |  1 +
 mm/kasan/{kasan_test.c => kasan_test_c.c} | 11 +++++++++++
 mm/kasan/kasan_test_rust.rs               | 19 +++++++++++++++++++
 4 files changed, 39 insertions(+), 1 deletion(-)
 rename mm/kasan/{kasan_test.c => kasan_test_c.c} (99%)
 create mode 100644 mm/kasan/kasan_test_rust.rs

diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
index 7634dd2a6128..d718b0f72009 100644
--- a/mm/kasan/Makefile
+++ b/mm/kasan/Makefile
@@ -44,7 +44,8 @@ ifndef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
 CFLAGS_KASAN_TEST += -fno-builtin
 endif
 
-CFLAGS_kasan_test.o := $(CFLAGS_KASAN_TEST)
+CFLAGS_kasan_test_c.o := $(CFLAGS_KASAN_TEST)
+RUSTFLAGS_kasan_test_rust.o := $(RUSTFLAGS_KASAN)
 CFLAGS_kasan_test_module.o := $(CFLAGS_KASAN_TEST)
 
 obj-y := common.o report.o
@@ -54,3 +55,9 @@ obj-$(CONFIG_KASAN_SW_TAGS) += init.o report_sw_tags.o shadow.o sw_tags.o tags.o
 
 obj-$(CONFIG_KASAN_KUNIT_TEST) += kasan_test.o
 obj-$(CONFIG_KASAN_MODULE_TEST) += kasan_test_module.o
+
+kasan_test-objs := kasan_test_c.o
+
+ifdef CONFIG_RUST
+kasan_test-objs += kasan_test_rust.o
+endif
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fb2b9ac0659a..e5205746cc85 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -566,6 +566,7 @@ static inline void kasan_kunit_test_suite_end(void) { }
 
 bool kasan_save_enable_multi_shot(void);
 void kasan_restore_multi_shot(bool enabled);
+char kasan_test_rust_uaf(void);
 
 #endif
 
diff --git a/mm/kasan/kasan_test.c b/mm/kasan/kasan_test_c.c
similarity index 99%
rename from mm/kasan/kasan_test.c
rename to mm/kasan/kasan_test_c.c
index 7b32be2a3cf0..3a81e85a083f 100644
--- a/mm/kasan/kasan_test.c
+++ b/mm/kasan/kasan_test_c.c
@@ -1899,6 +1899,16 @@ static void match_all_mem_tag(struct kunit *test)
 	kfree(ptr);
 }
 
+/*
+ * Check that Rust performing a use-after-free using `unsafe` is detected.
+ * This is a smoke test to make sure that Rust is being sanitized properly.
+ */
+static void rust_uaf(struct kunit *test)
+{
+	KUNIT_EXPECT_KASAN_FAIL(test, kasan_test_rust_uaf());
+}
+
+
 static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(kmalloc_oob_right),
 	KUNIT_CASE(kmalloc_oob_left),
@@ -1971,6 +1981,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(match_all_not_assigned),
 	KUNIT_CASE(match_all_ptr_tag),
 	KUNIT_CASE(match_all_mem_tag),
+	KUNIT_CASE(rust_uaf),
 	{}
 };
 
diff --git a/mm/kasan/kasan_test_rust.rs b/mm/kasan/kasan_test_rust.rs
new file mode 100644
index 000000000000..7239303b232c
--- /dev/null
+++ b/mm/kasan/kasan_test_rust.rs
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Helper crate for KASAN testing
+//! Provides behavior to check the sanitization of Rust code.
+use kernel::prelude::*;
+use core::ptr::addr_of_mut;
+
+/// Trivial UAF - allocate a big vector, grab a pointer partway through,
+/// drop the vector, and touch it.
+#[no_mangle]
+pub extern "C" fn kasan_test_rust_uaf() -> u8 {
+    let mut v: Vec<u8> = Vec::new();
+    for _ in 0..4096 {
+        v.push(0x42, GFP_KERNEL).unwrap();
+    }
+    let ptr: *mut u8 = addr_of_mut!(v[2048]);
+    drop(v);
+    unsafe { *ptr }
+}
-- 
2.46.0.184.g6999bdac58-goog

