Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7287AEB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 14:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344358AbjFOOXv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 10:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345041AbjFOOXk (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 10:23:40 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC0D2705
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 07:23:28 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b515ec39feso1836065ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686839007; x=1689431007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQLizMj5uW48XKCjLSjhGPW2Q6D2v3EmRanvYcpOZXQ=;
        b=ed5vVGb4a6QF7AP7RobxKekZ77bHLx2MftMcx5B20RWlq8iP81ZUoK0aWMr5xY7XXH
         78lCoYbDl139+wspWyZ0FRIKcKi3Hvi2FSjtvOdCZqZxzQm/I8AOK+hM+7VkhBYIwwTU
         juMnrqHb8Xr10LlW1uX5a/knhiaeKEIgWHQkCPZ+cIfX5xfehKuz7GZ6OW9VAA8Dx+ow
         PggwmReTuDiqdlz8wpi0E2GAl4bmRFR28sz1khhfuh8HlED8hLyb+8oTfBm/eAgHzWl9
         A3dkBQ64EFhYLzapR/mFnZ1TQS0Jh1BPFk5DAJmrB2DkHBdlZoCIVsXj2sNDu/c/P+PW
         Aqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686839007; x=1689431007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQLizMj5uW48XKCjLSjhGPW2Q6D2v3EmRanvYcpOZXQ=;
        b=dCh0xBHjQvDY1Aspi4KTccoyg5x74p8LZfrmLm9SkPFCVyTEX1i1AKexo06m81rfHX
         yPB/mvkbmsMEwwxgzq5MubXEvJmAYo9f3KzZwHqnn9+qj/8ecb3Bx3RfmVtdbYZaNfxp
         GZT5u/aqvXEkiSyqoNuySzIfQvGH3SvjPsr3TQ/EQv8ANKQSNF4Tuc4rVkoZecnBS2qe
         arO0vDPaCR2/KxeIAj2P/JC4CKJHSTXHVctqocxxMHAjOCL3pLkxRbjQUUEFzDVFpR4U
         OOKtoaCjte5443BiH4429ySgQqcX1y3qU0G6NLz0SmB3S5WoF9H9jeWahOdNdJZ8cen4
         p8GA==
X-Gm-Message-State: AC+VfDwOfNLKT4crGF21mYyl8ovnMoVk3tZkn8r4rpTSfAuncR/Gt5pz
        +zYQcmsX9rLw3SKRwQghO7+E6t1mm6bsFw==
X-Google-Smtp-Source: ACHHUZ77EMtbI90MGFrplegW/ATZXD55jODbH8lBFbAUoMDDy1hNAfXfDuJOWbm4XVInaAcV3gm/eg==
X-Received: by 2002:a17:902:ec91:b0:1a6:cf4b:4d7d with SMTP id x17-20020a170902ec9100b001a6cf4b4d7dmr20341061plg.2.1686839007317;
        Thu, 15 Jun 2023 07:23:27 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090322cd00b001a69dfd918dsm14194616plg.187.2023.06.15.07.23.25
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:23:26 -0700 (PDT)
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
To:     rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v2 1/2] rust: add synchronous message digest support
Date:   Thu, 15 Jun 2023 23:23:10 +0900
Message-Id: <20230615142311.4055228-2-fujita.tomonori@gmail.com>
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
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |  26 +++++++
 rust/kernel/crypto.rs           |   5 ++
 rust/kernel/crypto/hash.rs      | 118 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 5 files changed, 152 insertions(+)
 create mode 100644 rust/kernel/crypto.rs
 create mode 100644 rust/kernel/crypto/hash.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3e601ce2548d..2f198c6d5de5 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <crypto/hash.h>
 #include <linux/errname.h>
 #include <linux/slab.h>
 #include <linux/refcount.h>
diff --git a/rust/helpers.c b/rust/helpers.c
index bb594da56137..7966902ed8eb 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -18,6 +18,7 @@
  * accidentally exposed.
  */
 
+#include <crypto/hash.h>
 #include <linux/bug.h>
 #include <linux/build_bug.h>
 #include <linux/err.h>
@@ -28,6 +29,31 @@
 #include <linux/sched/signal.h>
 #include <linux/wait.h>
 
+#ifdef CONFIG_CRYPTO
+void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
+EXPORT_SYMBOL_GPL(rust_helper_crypto_free_shash);
+
+unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tfm)
+{
+    return crypto_shash_digestsize(tfm);
+}
+EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_digestsize);
+
+unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
+{
+    return crypto_shash_descsize(tfm);
+}
+EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_descsize);
+
+int rust_helper_crypto_shash_init(struct shash_desc *desc) {
+	return crypto_shash_init(desc);
+}
+EXPORT_SYMBOL_GPL(rust_helper_crypto_shash_init);
+#endif
+
 __noreturn void rust_helper_BUG(void)
 {
 	BUG();
diff --git a/rust/kernel/crypto.rs b/rust/kernel/crypto.rs
new file mode 100644
index 000000000000..f80dd7bd3381
--- /dev/null
+++ b/rust/kernel/crypto.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Cryptography.
+
+pub mod hash;
diff --git a/rust/kernel/crypto/hash.rs b/rust/kernel/crypto/hash.rs
new file mode 100644
index 000000000000..53f4a311b3b2
--- /dev/null
+++ b/rust/kernel/crypto/hash.rs
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Cryptographic Hash operations.
+//!
+//! C headers: [`include/crypto/hash.h`](../../../../include/crypto/hash.h)
+
+use crate::{
+    error::{code::ENOMEM, from_err_ptr, to_result, Result},
+    str::CStr,
+};
+use alloc::alloc::{alloc, dealloc};
+use core::alloc::Layout;
+
+/// Corresponds to the kernel's `struct crypto_shash`.
+///
+/// # Invariants
+///
+/// The pointer is valid.
+pub struct Shash(*mut bindings::crypto_shash);
+
+impl Drop for Shash {
+    fn drop(&mut self) {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        unsafe { bindings::crypto_free_shash(self.0) }
+    }
+}
+
+impl Shash {
+    /// Creates a [`Shash`] object for a message digest handle.
+    pub fn new(name: &CStr, t: u32, mask: u32) -> Result<Shash> {
+        // SAFETY: FFI call.
+        let ptr =
+            unsafe { from_err_ptr(bindings::crypto_alloc_shash(name.as_char_ptr(), t, mask)) }?;
+        // INVARIANT: `ptr` is valid and non-null since `crypto_alloc_shash`
+        // returned a valid pointer which was null-checked.
+        Ok(Self(ptr))
+    }
+
+    /// Sets optional key used by the hashing algorithm.
+    pub fn setkey(&mut self, data: &[u8]) -> Result {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        to_result(unsafe {
+            bindings::crypto_shash_setkey(self.0, data.as_ptr(), data.len() as u32)
+        })
+    }
+
+    /// Returns the size of the result of the transformation.
+    pub fn digestsize(&self) -> u32 {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        unsafe { bindings::crypto_shash_digestsize(self.0) }
+    }
+}
+
+/// Corresponds to the kernel's `struct shash_desc`.
+///
+/// # Invariants
+///
+/// The field `ptr` is valid.
+pub struct ShashDesc<'a> {
+    ptr: *mut bindings::shash_desc,
+    tfm: &'a Shash,
+    size: usize,
+}
+
+impl Drop for ShashDesc<'_> {
+    fn drop(&mut self) {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        unsafe {
+            dealloc(
+                self.ptr.cast(),
+                Layout::from_size_align(self.size, 2).unwrap(),
+            );
+        }
+    }
+}
+
+impl<'a> ShashDesc<'a> {
+    /// Creates a [`ShashDesc`] object for a request data structure for message digest.
+    pub fn new(tfm: &'a Shash) -> Result<Self> {
+        // SAFETY: The type invariant guarantees that `tfm.0` pointer is valid.
+        let size = core::mem::size_of::<bindings::shash_desc>()
+            + unsafe { bindings::crypto_shash_descsize(tfm.0) } as usize;
+        let layout = Layout::from_size_align(size, 2)?;
+        let ptr = unsafe { alloc(layout) } as *mut bindings::shash_desc;
+        if ptr.is_null() {
+            return Err(ENOMEM);
+        }
+        // INVARIANT: `ptr` is valid and non-null since `alloc`
+        // returned a valid pointer which was null-checked.
+        let mut desc = ShashDesc { ptr, tfm, size };
+        // SAFETY: `desc.ptr` is valid and non-null since `alloc`
+        // returned a valid pointer which was null-checked.
+        // Additionally, The type invariant guarantees that `tfm.0` is valid.
+        unsafe { (*desc.ptr).tfm = desc.tfm.0 };
+        desc.reset()?;
+        Ok(desc)
+    }
+
+    /// Re-initializes message digest.
+    pub fn reset(&mut self) -> Result {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        to_result(unsafe { bindings::crypto_shash_init(self.ptr) })
+    }
+
+    /// Adds data to message digest for processing.
+    pub fn update(&mut self, data: &[u8]) -> Result {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        to_result(unsafe {
+            bindings::crypto_shash_update(self.ptr, data.as_ptr(), data.len() as u32)
+        })
+    }
+
+    /// Calculates message digest.
+    pub fn finalize(&mut self, output: &mut [u8]) -> Result {
+        // SAFETY: The type invariant guarantees that the pointer is valid.
+        to_result(unsafe { bindings::crypto_shash_final(self.ptr, output.as_mut_ptr()) })
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 85b261209977..3cb8bd8a17d9 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -31,6 +31,8 @@
 #[cfg(not(testlib))]
 mod allocator;
 mod build_assert;
+#[cfg(CONFIG_CRYPTO)]
+pub mod crypto;
 pub mod error;
 pub mod init;
 pub mod ioctl;
-- 
2.34.1

