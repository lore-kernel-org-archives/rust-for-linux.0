Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF904EB64DB
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 14:23:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjFOOXv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 10:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345034AbjFOOXk (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 10:23:40 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17064295B
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 07:23:29 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-657c4bcad0bso2043013b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686839008; x=1689431008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZbRXoEyCOw1IC0lc1IybFUSxvSw2TEk+Y+46OudCCs=;
        b=OF/u68vZCieSHPLghlehKSRgSdLORCSKNAwq+g7DMRGfKAsuCquQG3/cybUvXqd8xb
         BRdJBIhyqjPTvEfS0NYA//PMNwu5XcKdg/3g0Qn0aHIeD+Qgk0XTRCFsHxuMrUjd25Pg
         lmQFwSBGiGw/JYZVeu7AjC4FxonuaBGlMzQuh0Ngtt8ThDxmf9VL5I4AogTKy++7b1tx
         nK5JGSv1SSnoDIheyeABHyC1rjobYRyboLTDj6ACypf9BH5iKA08zwgA9nzlZ0wQEHxC
         fUPz9/RrvW5FrbwbV337O3RUw78beBTtrQ/ibC9t8Z9qOhFmEouGt+pBgR8X6nl/hk5A
         8yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686839008; x=1689431008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZbRXoEyCOw1IC0lc1IybFUSxvSw2TEk+Y+46OudCCs=;
        b=K9A1xt/Re66GQtDUHzz4/Mib7z6zLda9Nr3NBP05m7qU7PR683XK/LnodnORUm3fHJ
         KvUABCKhOuAbIzK1BdBK74L9zjm3qErmvMhmraPykBkKjuh5fzr8cN/rPs2RpS/F9iEd
         Lr+HMtOMcZUv0DIz7iX2RiBVc7YbLu3JHazgzBVZ+r/C/mnTCeGMZLIfzqKtKcVQ74AG
         3sXy/t+wOuFhBc//O54YCiAWlqljyXP7qR0m6heBN9hgBhPSJcL4pyyjmMcPTvfhjKla
         tm9n8eEsS1f9Lr+UIdkFG51IIfczsKXF3fSh5G1GUbvxOM5pnAq4qqPW7nRHhrAif4Dd
         MF1g==
X-Gm-Message-State: AC+VfDwtJ7Q530tyWmWMpsHluWhAho2SiCw0s5p9nporvdrK8BkVRPLP
        uZmSYyRhZy/3q7XjsAyETGtZkiocvJoFGw==
X-Google-Smtp-Source: ACHHUZ6x5hUBvNLvll1WdiM8bpDpE8EmGH2JaEMTUaD9qL0mSq82QO5uMkyb8INuNhHM8IcXhimIcA==
X-Received: by 2002:a05:6a20:8e19:b0:11a:efaa:eb7b with SMTP id y25-20020a056a208e1900b0011aefaaeb7bmr14456647pzj.0.1686839007963;
        Thu, 15 Jun 2023 07:23:27 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090322cd00b001a69dfd918dsm14194616plg.187.2023.06.15.07.23.27
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:23:27 -0700 (PDT)
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
To:     rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v2 2/2] rust: add Random Number Generator algorithms support
Date:   Thu, 15 Jun 2023 23:23:11 +0900
Message-Id: <20230615142311.4055228-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615142311.4055228-1-fujita.tomonori@gmail.com>
References: <20230615142311.4055228-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers.c                  | 12 ++++++
 rust/kernel/crypto.rs           |  1 +
 rust/kernel/crypto/rng.rs       | 72 +++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 rust/kernel/crypto/rng.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2f198c6d5de5..089ac38c6461 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -7,6 +7,7 @@
  */
 
 #include <crypto/hash.h>
+#include <crypto/rng.h>
 #include <linux/errname.h>
 #include <linux/slab.h>
 #include <linux/refcount.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index 7966902ed8eb..e4dcd611738f 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -19,6 +19,7 @@
  */
 
 #include <crypto/hash.h>
+#include <crypto/rng.h>
 #include <linux/bug.h>
 #include <linux/build_bug.h>
 #include <linux/err.h>
@@ -52,6 +53,17 @@ int rust_helper_crypto_shash_init(struct shash_desc *desc) {
 	return crypto_shash_init(desc);
 }
 EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_init);
+
+void rust_helper_crypto_free_rng(struct crypto_rng *tfm) {
+	crypto_free_rng(tfm);
+}
+EXPORT_SYMBOL_GPL(rust_helper_crypto_free_rng);
+
+int rust_helper_crypto_rng_generate(struct crypto_rng *tfm, const u8 *src,
+	unsigned int slen, u8 *dst, unsigned int dlen) {
+	return crypto_rng_generate(tfm, src, slen, dst, dlen);
+}
+EXPORT_SYMBOL_GPL(rust_helper_crypto_rng_generate);
 #endif
 
 __noreturn void rust_helper_BUG(void)
diff --git a/rust/kernel/crypto.rs b/rust/kernel/crypto.rs
index f80dd7bd3381..a1995e6c85d4 100644
--- a/rust/kernel/crypto.rs
+++ b/rust/kernel/crypto.rs
@@ -3,3 +3,4 @@
 //! Cryptography.
 
 pub mod hash;
+pub mod rng;
diff --git a/rust/kernel/crypto/rng.rs b/rust/kernel/crypto/rng.rs
new file mode 100644
index 000000000000..2215a8344669
--- /dev/null
+++ b/rust/kernel/crypto/rng.rs
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Random number generator.
+//!
+//! C headers: [`include/crypto/rng.h`](../../../../include/crypto/rng.h)
+
+use crate::{
+    error::{from_err_ptr, to_result, Result},
+    str::CStr,
+};
+
+/// Corresponds to the kernel's `struct crypto_rng`.
+///
+/// # Invariants
+///
+/// The pointer is valid.
+pub struct Rng(*mut bindings::crypto_rng);
+
+impl Drop for Rng {
+    fn drop(&mut self) {
+        // SAFETY: The type invariant guarantees that `self.0` is valid.
+        if unsafe { bindings::crypto_default_rng } == self.0 {
+            // SAFETY: FFI call.
+            unsafe {
+                bindings::crypto_put_default_rng();
+            }
+        } else {
+            // SAFETY: The type invariant guarantees that `self.0` is valid.
+            unsafe { bindings::crypto_free_rng(self.0) };
+        }
+    }
+}
+
+impl Rng {
+    /// Creates a [`Rng`] instance.
+    pub fn new(name: &CStr, t: u32, mask: u32) -> Result<Self> {
+        // SAFETY: FFI call.
+        let ptr = unsafe { from_err_ptr(bindings::crypto_alloc_rng(name.as_char_ptr(), t, mask)) }?;
+        // INVARIANT: `ptr` is valid and non-null since `crypto_alloc_rng`
+        // returned a valid pointer which was null-checked.
+        Ok(Self(ptr))
+    }
+
+    /// Creates a [`Rng`] instance with a default algorithm.
+    pub fn new_with_default() -> Result<Self> {
+        // SAFETY: FFI call.
+        to_result(unsafe { bindings::crypto_get_default_rng() })?;
+        // SAFETY: The C API guarantees that `crypto_default_rng` is valid until
+        // `crypto_put_default_rng` is called.
+        Ok(Self(unsafe { bindings::crypto_default_rng }))
+    }
+
+    /// Get a random number.
+    pub fn generate(&mut self, src: &[u8], dst: &mut [u8]) -> Result {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        to_result(unsafe {
+            bindings::crypto_rng_generate(
+                self.0,
+                src.as_ptr(),
+                src.len() as u32,
+                dst.as_mut_ptr(),
+                dst.len() as u32,
+            )
+        })
+    }
+
+    /// Re-initializes the [`Rng`] instance.
+    pub fn reset(&mut self, seed: &[u8]) -> Result {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        to_result(unsafe { bindings::crypto_rng_reset(self.0, seed.as_ptr(), seed.len() as u32) })
+    }
+}
-- 
2.34.1

