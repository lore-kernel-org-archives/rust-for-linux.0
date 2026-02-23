Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE1134F47D
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839738; cv=none; b=YhF93Zemx3Ypqb8UALY/e8hZcoIR0ilQpejaLD1N0omLvlXI+LTYoeca6BnGH75EoTHcMjUHn2yE1bRSlm5tCXJjPydwk5BLhvwe1xUqCOm2UoZK5zVTg74rDNvyxyJOnxJlQfsOI3jwmbip009+4rmapBtbnUarcIhjcH1FKo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839738; c=relaxed/simple;
	bh=lK/rxbLXmR7FXtu7YDazhKjFradnQjWAbJ7SyNmtKQs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rZ8TyKUV448Wz6F8RnRL9dX9CSRW+tVeRNCj5r7Xp86oa3CTG+GynSULUSlTkAOSvMta9f5BjvL8mljfrlDaWvEgXApI+Jv/J1ReU5QDp0VkKOaPAHOtHdtOzh0OlX7fNg+lkBALd428VMrqH40/UBsho90rg6lQhD9WEb3oR1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZWyJOrjy; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZWyJOrjy"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-436267b01c4so4336789f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 01:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771839736; x=1772444536; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QXEmF7/lOJPXxXvA/92nwkNhZWQtT+NIs4QhiHeqW0g=;
        b=ZWyJOrjyLAeI5rfaBCFTI3f9WT+/cYVHzNhPatBHEePW8Ca/oz2SWUGQbqUHoCe6ZJ
         QI5zFOekHkyEBNxcj9LlAvd+Rs1sae8zUsSNSQGLYoSjujv0LrOOQA/zDROuKVXfp5aC
         4kjGhbnDc77vCUF+zHkpH9cfgg3Rxevczmjn0bZO7MZlisHnX/zjkkTfDErkcdgzq0uJ
         d8MTDnQ7Dt68woORYlZxtkgStN1Qfw/QE+6rK8ycUiEDz9dG89NpZiOw2ajbDqNLUs4I
         e5MvBaO1KJM4gTnmkx/fq+kH8khkMBW0qFWfF36k1A1+g+9TZahsqFQGSgsjKuO+TgUP
         /kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839736; x=1772444536;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QXEmF7/lOJPXxXvA/92nwkNhZWQtT+NIs4QhiHeqW0g=;
        b=KwQUkUIZJ7azsGN543ckEc43fhIqv6qKHgqyB1lalAUcVBlGMvvixbsqf06pjqxChQ
         6EXtU5k9e63kQQOV3IJybuJaRoapMYzad1hLBxueKNPJMwNfO8gHrR84L7XIu4SYYSac
         +bLj+d/dnlwQjqp2tXU8gtxy3IBZ4Xs3ru76yV7lpagVbsAtk207JFpl27gob6Nn0YEH
         /vN5tjda7/yC5Rdxwrt/12u5uOJ3sJlzMODcm6Y1SZEydrnNK+R3nHI3a0Ko5a5Fah9v
         pUevtjXEQ2rTNrYX66C2pfjngXiQRpvG66B2in5d3xbluKyj5awqzWlghLeJn7ckzQNW
         7IyA==
X-Forwarded-Encrypted: i=1; AJvYcCWchG4d3R6NdCo00AxkNetuWdFi/TojwrevolfxM1SW8QkTD/Z5MVWdlN4x2grfslLkkO0MR9dDP46EdvmRAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/HPQ/x5uDrSiVlQ3wBcpqoyu5mjtuM4zEEsZM38nH2SLqgVc9
	50k/72DuZYKhXUjYUeM7vcd0ABj3NjGA+yV8wsJERyFRa66UPnd589aEchHWknER5IH5+sO/nYU
	8OgpDL5hE4EhariY3HQ==
X-Received: from wrbey2.prod.google.com ([2002:a05:6000:24c2:b0:437:71a8:3aa3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1883:b0:435:bbd7:18d8 with SMTP id ffacd0b85a97d-4396f15b062mr12747873f8f.17.1771839735613;
 Mon, 23 Feb 2026 01:42:15 -0800 (PST)
Date: Mon, 23 Feb 2026 09:42:08 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO8gnGkC/3XMQQ6CMBCF4auQWTtmWi1GV97DsKBlWiZBalogG
 sLdrexd/i953wqZk3CGW7VC4kWyxLGEPlTg+nYMjNKVBk26JkUGnRcc0ox5aqc5Y00dGc+1v54 slNMrsZf3Dj6a0r3kKabP7i/qt/6lFoUKyeozKX9xxup7iDEMfHTxCc22bV8muVk4rQAAAA==
X-Change-Id: 20260105-cfi-lru-status-60d05fe6f93b
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7437; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=lK/rxbLXmR7FXtu7YDazhKjFradnQjWAbJ7SyNmtKQs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnCDxVAfbVqjly5Q2ejMPGHnjVXOpXj6rT3uh8
 T2xhKNpLSeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZwg8QAKCRAEWL7uWMY5
 Rp0VD/wN+tXda4aa4OsgZBMTqILQhOVJVC3mj0eErNXqEwLhBfHUaCS+g9bWR7U5FBYAZjz3v9a
 w1zWlk3tBQjwdhQKmPuaMA60+mooHQUUnGe6Vubz0Wb0PbdJ4A09aBR7WA+oCUGglxp6bcqELiN
 JEahJuXM9YruWtKSDma/2ycm12vw5e55f62xqTXVmeH4LrwJROTxzSbZtBE5LubkYiS5TB3IVvJ
 gBNq/I3w3ks4lb2waS0YS4FuzbzmUsa8qq1onWS3Xzn0xWehFH5d9h6QLZIr709wri0FY//ZJAP
 F81Lq8QbTLoZkBYedsRCPAEZUPyi2cwzrzCVCp3zwEuiMJy+1AB7PlQo68OH2xRaqrPFfE7/LBT
 ynVOCFseFzKS+5VgumYr2Td7ndX3FO3OjjOCwGxZ1w/TUgcqnkFBkHTqT+BIydXi0hBS0SwrZAl
 Jg+Hzuz5avdDo5U0eET/+0U8npHTstiV7xDJ2Usgk81r56z6q34MbodqXCwO6F8jpziGeUfa7DH
 Vy3u3FeLYMouz9ay8GPdMy7XpjOyBMgcDfD/m5Osj0AK1zXYh/Xgn/OAFRjWu/+jTo4s0VQF+IF
 8pB17bnMtLArMobibjdV+hz3zp3jKQxAl1TXcBVvcVivlmbIrqiIt4ViUPxHf/BATkqh4wr7OUb r/X8hoCoqHyB1YQ==
X-Mailer: b4 0.14.2
Message-ID: <20260223-cfi-lru-status-v2-1-89c6448a63a4@google.com>
Subject: [PATCH v2] rust: declare cfi_encoding for lru_status
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Ramon de C Valle <rcvalle@google.com>, 
	Matthew Maurer <mmaurer@google.com>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

By default bindgen will convert 'enum lru_status' into a typedef for an
integer. For the most part, an integer of the same size as the enum
results in the correct ABI, but in the specific case of CFI, that is not
the case. The CFI encoding is supposed to be the same as a struct called
'lru_status' rather than the name of the underlying native integer type.

To fix this, tell bindgen to generate a newtype and set the CFI type
explicitly. Note that we need to set the CFI attribute explicitly as
bindgen is using repr(transparent), which is otherwise identical to the
inner type for ABI purposes.

This allows us to remove the page range helper C function in Binder
without risking a CFI failure when list_lru_walk calls the provided
function pointer.

The --with-attribute-custom-enum argument requires bindgen v0.71 or
greater.

My testing procedure was to add this to the android17-6.18 branch and
verify that rust_shrink_free_page is successfully called without crash,
and verify that it does in fact crash when the cfi_encoding is set to
other values. Note that I couldn't test this on android16-6.12 as that
branch uses a bindgen version that is too old.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch requires bumping the minimum bindgen version to v0.71 or
greater. I did not include that here.
---
Changes in v2:
- Rebase on v7.0-rc1.
- Update cfi encoding with 10 prefix.
- Add details to commit message.
- Link to v1: https://lore.kernel.org/r/20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com
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
index fdd97112ef5c8b2341e498dc3567b659f05e3fd7..8e9f5c4819d01e9f87026b0af03aa499a7f72027 100644
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
index fd2fd1c3cb9a51ea46fcd721907783b457aa1378..374e20d42b99daa5912a2f9ffd8aaac2eaa0607e 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -23,6 +23,10 @@
 # warning. We don't need to peek into it anyway.
 --opaque-type spinlock
 
+# enums that appear in indirect function calls should specify a cfi type
+--newtype-enum lru_status
+--with-attribute-custom-enum=lru_status='#[cfi_encoding="10lru_status"]'
+
 # `seccomp`'s comment gets understood as a doctest
 --no-doc-comments
 
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952c2b29ab82d5d481063a1cf48bccf..faf3ee634ced03bb36e525365b6aef8bd663e4c2 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -149,5 +149,4 @@ const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
-#include "../../drivers/android/binder/page_range_helper.h"
 #endif
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 19f57c5b2fa2a343c4250063e9d5ce1067e6b6ff..3d2a97fdfb4f86c6c6b53ab48fbc5dbb5bd8e9b7 100644
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
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260105-cfi-lru-status-60d05fe6f93b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

