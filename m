Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD1199380
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Aug 2024 23:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723505369; cv=none; b=k+gyIasnLfIUhWo8mnAD4ULjDhIp5qj9gJpVd2B/bcGNF16S523jFra7UKWwd2OlvI1kigvqjOPNg8w/NFTmLgYxRz8FnDiczhFrP/3PduRMBJ0rBmh5WWrmL73ITQtSxlyhQo+clLNqtu9gMy1MAsxjU1z8A2wtCQ3QyWOB4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723505369; c=relaxed/simple;
	bh=kL3DAzlkmToM0AEz1ViuUbMjwHeKGPw4C7nPFToMXko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uefg4jFV+akBGNer0XS1KyXQXQrF17twLRHTjjBmjtIcnfZXMA/eORd8aBW7SDOYn/pXHI0VebT74Kj8y+o8xBNlSZ5wLHz8W+FB089snyYSK2dxRJMSg604PWLhpdsV1d4PklRJRb0p7ilAHUvCJngCxTpWTi8zgP8ivYFzMME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f1IsasBN; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f1IsasBN"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e11368fa2e3so1510081276.3
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Aug 2024 16:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723505367; x=1724110167; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=upOwpMTeo+ntHO/NqVQFtbSuOi1aXqqXOiMSFMXzMsU=;
        b=f1IsasBNxo4XZqapEeD60eNUNEXwjJskZs/3jKYwkoDWmKQJqisxhUJUX/xk0JzT3J
         qnWdWhK6Fn18V7E3DmEGsYhfSl/ebQT8z9v3fq71p+o9DJz2HhIkmD2d7ivlBlMTjpXB
         Hq3rc/8BE8PGkVcNL4fqZB/samAm5fWIqP3L0XzTDwp4dvNtRvEEj6+lajqSDv/aJNWj
         SC048n4JXQwZD0NrfxGj8nt0mRcUIYZYxX669AwIyRhuGkO/+Wt8MgjbPHejfBpNykfs
         g78HctiZbtF47N3sBqG76QP5ELI2TJuCXk7Dmd37F7XPLhNp1fDgv6+XL3SrxOZbePrI
         gTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723505367; x=1724110167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upOwpMTeo+ntHO/NqVQFtbSuOi1aXqqXOiMSFMXzMsU=;
        b=oUF8k5C9BM72arzvhmmMJA9m379V5oRO5G2pbtEzac0XQDq56vzuhL2O1xjUG/Kyqc
         cIUwmwKIETUetBJ7Dzb7cWxHfI7lVNEuGuujt95Un17C4ACj5rDVsMMIOrPz6crsd9F0
         qdRMIXfM1ECm9cMyxr7u/6qDN58d19ART2BBR0DpmPCkK3xNMpSzeKKFM+laZWNnfN9F
         qXiWF13uX8yiFRjUJJZHw2SSQkBx37e20dXMuXxY6Qoj2T+pMRwUqT2kDsVpFlawntGB
         ZrEfAnKIuOBSBgXjPYeqM3r7lxOznmd48uyagxV4sZnejH+y0CH1IIdfG5vig+wVKkyq
         IW4w==
X-Forwarded-Encrypted: i=1; AJvYcCWO7eBnofNo+8Alq+TP3wppL019fe4Qunlwsg9RBk3mc1usMR0uasFSM8BmsvZX3vKRGxe1KTNyQuoOPTvQKbRF6cB2/A17uaVh+NswPGU=
X-Gm-Message-State: AOJu0YzxinTqoRRXsHiRXdLLT32+5RGE99XLx6t0Wfu5kq2ynTh/fCmQ
	TZBjvSKZG+Y7an63W6Jfh7dA9IQAsF3S/3k7sSyo0Y2VyNkkMWnrX3SGrvOmylVlePzx09msYyI
	h0uzOzg==
X-Google-Smtp-Source: AGHT+IEbI2xHXS1NFNlXCt2+JC+OCS4CUJP3dnvdvqLavIiiV4QA03cxFw2gUqrwIFrDOo44dUgxsS61/+Y1
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:5f09:0:b0:e0e:4a15:cc1e with SMTP id
 3f1490d57ef6-e113c80de33mr25468276.0.1723505367499; Mon, 12 Aug 2024 16:29:27
 -0700 (PDT)
Date: Mon, 12 Aug 2024 23:29:03 +0000
In-Reply-To: <20240812232910.2026387-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240812232910.2026387-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240812232910.2026387-4-mmaurer@google.com>
Subject: [PATCH v2 3/3] kasan: rust: Add KASAN smoke test via UAF
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: aliceryhl@google.com, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Adds a smoke test to ensure that KASAN in Rust is actually detecting a
Rust-native UAF. There is significant room to expand this test suite,
but this will at least ensure that flags are having the intended effect.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 mm/kasan/Makefile                         |  9 ++++++++-
 mm/kasan/{kasan_test.c => kasan_test_c.c} | 13 +++++++++++++
 mm/kasan/kasan_test_rust.rs               | 17 +++++++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)
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
diff --git a/mm/kasan/kasan_test.c b/mm/kasan/kasan_test_c.c
similarity index 99%
rename from mm/kasan/kasan_test.c
rename to mm/kasan/kasan_test_c.c
index 7b32be2a3cf0..28821c90840e 100644
--- a/mm/kasan/kasan_test.c
+++ b/mm/kasan/kasan_test_c.c
@@ -30,6 +30,7 @@
 #include <asm/page.h>
 
 #include "kasan.h"
+#include "kasan_test_rust.h"
 
 #define OOB_TAG_OFF (IS_ENABLED(CONFIG_KASAN_GENERIC) ? 0 : KASAN_GRANULE_SIZE)
 
@@ -1899,6 +1900,17 @@ static void match_all_mem_tag(struct kunit *test)
 	kfree(ptr);
 }
 
+/*
+ * Check that Rust performing a uaf using `unsafe` is detected.
+ * This is an undirected smoke test to make sure that Rust is being sanitized
+ * appropriately.
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
@@ -1971,6 +1983,7 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(match_all_not_assigned),
 	KUNIT_CASE(match_all_ptr_tag),
 	KUNIT_CASE(match_all_mem_tag),
+	KUNIT_CASE(rust_uaf),
 	{}
 };
 
diff --git a/mm/kasan/kasan_test_rust.rs b/mm/kasan/kasan_test_rust.rs
new file mode 100644
index 000000000000..6f4b43ea488c
--- /dev/null
+++ b/mm/kasan/kasan_test_rust.rs
@@ -0,0 +1,17 @@
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
2.46.0.76.ge559c4bf1a-goog

