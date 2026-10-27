Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078913;
	b=0IDTJM6GVNoQWErIGEDtyyzE1JDsfVTpjTIQW83L81QXOvCmHRm/rW3otR7Vkc1HJmXD
	 HAi/e7bKhIO/4eZNA+E92kuGNR5yVZ3An8lzu8UBxQB7qiw0/1+V+n2Tes6325LWh2tOe
	 KRkCmOXpFKnxwMksm2nmU5B0CcI5qPzoSc3LTgGfo7pbQOnUGu+r8gi9Ate+Da+P7q9ws
	 Fh2nYKrkspQMl3g+eZ+RUcDR+/eIBQms6DjNKhqoNxa/Di4LHhhpAJ4b9PgDdtV5hfVHM
	 ecj0wvAopitmc3nOpBuzmEGfPPPm/KMh9YpLifQ4EvUvoyIWVnGzhflMvVw846KlZ1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aUUrd4E5Xw5s9j+rkflFuxNd81QaxojYSSWf5OfPIxE=;
	b=P4L3PNTzDhigAdeb5P1pvXuGgJPIsOoFSLuya+9Rm9i0Z0c5b6gPTCAgP4Hoi+OxiqCZ
	 5hdmxx7o5s83X04lbKc1N1v2/PK3nxi+hVBbdu1EwFBmu6x4yGqvzgNkPZXcRY92ywOrS
	 j8QqvB5gp7KrHxh6w6v/qM279xZ9pkEc+1VIAO0RVREb2zW/etTQPG1ZEe7RLlgg0hS2E
	 GXXcN8UgPT2hQpwjNClUvajwc0ypCm1cTrM4epvAVg2p1IyyW5ahhyVFeX0UMQQZk73fm
	 T9uYg75mqFJeNnG43NU/9nPxF1rT7wqCgwF2O8mf9oQB2eFLkbBSBgB4ayn9Y1eR8/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTmWG1ES;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C8606A333
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Oct 2026 05:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5C8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTmWG1ES
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ea7987517aso21113635ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 22:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078911; x=1793683711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUUrd4E5Xw5s9j+rkflFuxNd81QaxojYSSWf5OfPIxE=;
        b=YTmWG1ESwbN0XwH51gxbHiAuUkW+mAIjKpnvoqopHe1qhUg7eW+lbxcGz5XtZKcgkx
         LjZ6d5vGfifkLR8MRVuS5vA/rUcu627XdWcN8RkBDYq5ieXionVQSJScJ8j3c8CUZoGU
         EdkIY6SXnrOXzpf7VqU1dEg+LVQki3PVsHtAUF/CHyTkbzItIdhw/uiU6mKI5dw7CeC0
         uasVCFfjdntyQqjf1CoMkMxNuMUT4d7rU3IRh7vKIWTfxpODHg32T2UiL5iiq8rMqinB
         ViZG1BEZfHodPejx73/d2VK2f34fbW3KrBEd2ZdZ8j4tqyTVhKkUpgDYpexibRKXN8Kb
         XKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078911; x=1793683711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUUrd4E5Xw5s9j+rkflFuxNd81QaxojYSSWf5OfPIxE=;
        b=qjh1e3MPMVukIhhcNP6ukwVtbPw8N2tqlh7psFGkkvUI4hXEA+8HC48dKmHUlJDHEo
         JWoyqNcDYLNLiZaGMX2mwsta/W+yLJ4EMkuLQk5uk+T9yD5ET0QjIeS+kAFGVIf952i9
         HbsLjV2lK41r8PQyzke7iLJTeRNh91pOcI3vzHluVPH53Eyhq+Wb8VVpSiVIbtBqlqn1
         gd7OHdNlajowR5cL20+jrgVvw9lc5wtHBfgk14ceIbcISh50BbCYYDd7Muy9fJOIUOsJ
         V3SjFeJOxoC0Vj9fsk9sNuh/4zrvWBJHDBc9Ib6c2vG2E1gaTH9K8j/gKOoaOPcgFuPQ
         1O3A==
X-Forwarded-Encrypted: i=1; AKwUvBxisRc2uYispza4v3p9EIBHFSnxzddf05ipGUiJFHQyaL7r3LfCGbthRKvETVvug0K1CJ/XzJAsh+5LNKURGQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKGvnkN+16WDtaEhTWEqoGJRpSKnPTdEYkXMdo1QyM9mfgDnFq4
	vCZQSrlb+t0WwtrrW9RVDBFjvAepGsMncMeXrn7DDEhgQzQ/qxGIOLxW
X-Gm-Gg: AYBFou0cFwWq6k7eF1xelD5cYJ9FtHia0bYaGXFlVau30o6usuyf6ZzfGwAENAvcToz
	2lygmjxrVwdwwcl4DPigKTC8AsW7atk8/7XoMs+RZbwZfAgyOC8/3AYriW/7UyECoh6AfUMYTiT
	VyyPOxp4nth+hvf3BMKpQqgqoQHifzpKrgIT8bAHE4BnQGdJOIxZx943f9m7tdpbaicHoL15/GG
	TnIf7Xkw9kV34DtkitksmtAm05+EBcDFiHNEqXVZjTS9xsG6U3cvwe0K6ipJ1FXBi9Clf7SPpHz
	eIvEhhSdiBfiVi2Jbi+5X35Pv9Fu14jOn+LzfqtZi5ojRGPa37gECfxMTzQObDCayjjzvuBezvd
	FUgZiAhetmulX9w3E5gMcx/RaZNAdRmdlDiN3EItmBtQP8ZojnggVeudPMeeMyb0mpYSt/2Xvc6
	SU1oCuRN0bB1dpXmSukyhxFD59lNq6cCTXS+jKd+tzl/pD3pmbx3rSYdP2afzL7Rel4kUMzgnL4
	09nxyGl+pewmIIw69jDagWrVI78vZDzOphVva86Lb7vlaZFAaZaGzqq49jvREJBis5ctrsw2rz+
	Rkl6fSyKSOlJ5jHbnxgp
X-Received: by 2002:a17:902:ce0d:b0:2e9:7b4f:b994 with SMTP id d9443c01a7336-2ea9c7c8254mr73796515ad.33.1793078911484;
        Mon, 26 Oct 2026 22:28:31 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:28:30 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 21/23] rust: x509: Add X509 certificate bindings
Date: Tue, 27 Oct 2026 15:25:34 +1000
Message-ID: <20261027052536.1722081-22-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Initial support for the kernel x509 parser bindings,
which will be used by the SPDM library.

This is just a few functions that the Rust SPDM implementation will use
in the next few commits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/x509.rs             | 118 ++++++++++++++++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 rust/kernel/x509.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index da8855899c530..66e18819d52b0 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -39,6 +39,8 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
+#include <keys/asymmetric-type.h>
+#include <keys/x509-parser.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitmap.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e8b652faa3b49..aa95aafff8c49 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -153,6 +153,8 @@
 pub mod usb;
 pub mod validate;
 pub mod workqueue;
+#[cfg(CONFIG_CRYPTO)]
+pub mod x509;
 pub mod xarray;
 
 #[doc(hidden)]
diff --git a/rust/kernel/x509.rs b/rust/kernel/x509.rs
new file mode 100644
index 0000000000000..1b5bc2a99c91c
--- /dev/null
+++ b/rust/kernel/x509.rs
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Western Digital
+
+//! Wrappers around the Linux kernel X509 parser APIs.
+//!
+//! C headers: [`include/keys/x509-parser.h`](srctree/include/keys/x509-parser.h).
+
+use core::ffi::c_void;
+use core::ptr::{self, NonNull};
+use kernel::prelude::*;
+use kernel::{
+    bindings,
+    error::{
+        from_err_ptr,
+        to_result, //
+    },
+    public_key::PublicKey,
+};
+
+/// Owned `struct x509_certificate` wrapper.
+pub struct Certificate {
+    cert: NonNull<bindings::x509_certificate>,
+}
+
+impl Certificate {
+    /// Parses a DER certificate from `data` and returns it with the length
+    /// of the certificate in bytes.
+    pub fn parse(data: &[u8]) -> Result<(Self, usize)> {
+        // SAFETY: `data.as_ptr()` points to at least `data.len()` valid bytes.
+        let len = unsafe { bindings::x509_get_certificate_length(data.as_ptr(), data.len()) };
+        let len = usize::try_from(len).map_err(|_| {
+            pr_err!("Invalid certificate length\n");
+            EPROTO
+        })?;
+
+        if len > data.len() {
+            pr_err!("Certificate length is larger then the buffer\n");
+            return Err(EPROTO);
+        }
+
+        // SAFETY: `data.as_ptr()` points to `data.len()` valid bytes and the
+        // caller has already checked that the DER certificate length fits in
+        // that buffer.
+        let cert = from_err_ptr(unsafe {
+            bindings::x509_cert_parse(data.as_ptr().cast::<c_void>(), len)
+        })?;
+        let cert = NonNull::new(cert).ok_or(EINVAL)?;
+
+        Ok((Self { cert }, len))
+    }
+
+    /// Returns the raw pointer for the X.509 certificate.
+    /// This is what is returned from the C function x509_cert_parse()
+    pub fn raw(&self) -> *mut bindings::x509_certificate {
+        self.cert.as_ptr()
+    }
+
+    /// Check that the certificate is not unsupported or blacklisted.
+    pub fn check_accepted(&self) -> Result {
+        // SAFETY: `self.cert` was returned by `x509_cert_parse()` and remains
+        // valid until dropped.
+        let cert = unsafe { &*self.cert.as_ptr() };
+        if cert.unsupported_sig || cert.blacklisted {
+            pr_err!("Certificate was rejected\n");
+            return Err(EKEYREJECTED);
+        }
+
+        Ok(())
+    }
+
+    /// Verify that `child`'s signature is signed by this cert's public/private key.
+    pub fn verify_signed(&self, child: &Self) -> Result {
+        // SAFETY: both certificate pointers were produced by `x509_cert_parse()`
+        // and remain valid until dropped.
+        let (prev, child) = unsafe { (&*self.cert.as_ptr(), &*child.cert.as_ptr()) };
+
+        let prev_pub = NonNull::new(prev.pub_).ok_or(EINVAL)?;
+        let child_sig = NonNull::new(child.sig).ok_or(EINVAL)?;
+
+        // SAFETY: `prev_pub` and `child_sig` are valid for at least the duration
+        // of this call.
+        unsafe {
+            to_result(bindings::public_key_verify_signature(
+                prev_pub.as_ptr(),
+                child_sig.as_ptr(),
+            ))
+        }
+    }
+
+    /// Transfers the public key out of the certificate so the certificate can be
+    /// dropped without freeing the public key.
+    pub fn take_public_key(&mut self) -> Option<PublicKey> {
+        // SAFETY: `self.cert` is a valid certificate pointer.
+        let raw = unsafe { (*self.cert.as_ptr()).pub_ };
+        let key = NonNull::new(raw)?;
+
+        // SAFETY: `self.cert` is a valid certificate pointer. Clearing `pub_`
+        // transfers ownership of the public key to the returned `PublicKey`.
+        // The `pub_` field will not be freed by `x509_free_certificate()` in
+        // Drop
+        unsafe {
+            (*self.cert.as_ptr()).pub_ = ptr::null_mut();
+        }
+
+        Some(PublicKey::from_raw(key))
+    }
+}
+
+impl Drop for Certificate {
+    fn drop(&mut self) {
+        // SAFETY: `self.cert` was produced by `x509_cert_parse()` and has
+        // not been freed yet.
+        unsafe {
+            bindings::x509_free_certificate(self.cert.as_ptr());
+        }
+    }
+}
-- 
2.56.0

