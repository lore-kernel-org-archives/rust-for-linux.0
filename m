Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7C7313540
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Sep 2026 01:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558440; cv=none; b=pU6dFZcwiRFOr7Oy0S/miLf17Sd6kS5tMx2NRU3o+6i+V1g9f+HGfanjKTS1/BNu3wf/zm0WiirT+1bDUmPD4ZlEU4XS3mlESTuXRpFZ+skSXEhvlRWRcpVCUR7DFKgZryNrHA6tyDGvqls0I2o7a8OolvTmrRUQ3gd/ZfgAgDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558440; c=relaxed/simple;
	bh=dYwkjAg9+owsT1rlev5yvf7o5Iv/qhN5PaHBspFONRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cML67/9+EE7mCIQWGJthzSBX4WrGCITTJ1SdyICwas5D8Rp0K/oHhvHnCVl0mWOv4gzRum4vVDyrQowOzT+1vI1FluQNvyR9fIcEt/lc8aad96+adgiGU4Ntc7ykyKa0GsVdvjwfG47O2MBOLjkvdTySSdS62f1CNnLOvbTrMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eofv/6HN; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eofv/6HN"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so1242491a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 18:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790558438; x=1791163238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BTUtz+ZG/2ayv7b8VSD8LMcB/N3Z789fLpe/5tgLu8=;
        b=eofv/6HNXMTrfmzvduJ7Li+ba32kruOnJZu7gKL2yVRdkvfNA7xdmHq2M6aoJsLPpM
         3e3nG63FbyBnd8JkuVChyeDSZ+oYMmyMkfTAQ9yeLtDuvE+AB0WeUFYU042K++dwpqE8
         xBUEhOXtUSorI3Nl70dw+RQwQ8rqmab4lFzdLDmZnrQm+l/CX8P+eF4+0o9rRWv1sCeW
         qfAPbGBrn2/JjRYc3LWT48W9XUxNc3bHYD0FtJHeBq6f69T/X8Si5ABQYcC46TolClo6
         wLYKUklZEczVnYe9jQ6Kh2+6rSZqQBM8x6Tze3mj8ReLgegaQ+4WJ7Oe0rbiFi8mkaAF
         zWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558438; x=1791163238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BTUtz+ZG/2ayv7b8VSD8LMcB/N3Z789fLpe/5tgLu8=;
        b=oGX1YOU2zllO6dW2vfFL4E3oign7S7BUDXy5iUw9PyWaZXYTAzDSDDLNiip4vDmkhR
         ehMWXrGJdsN8GQR2Fu4bHECzVVS6lwyoEl6cWfFgFmdfVU2j8W/lMbCKJ76zO/JKQXk5
         jpVGTRgBv6Qe5hTEiDRerBoWNq0B29Qeuk1xywPnbAw4qbqTlIuDeE4r7kqmmKO+IuNm
         QG+FCN/8TJEMPJhlP//AQARwucZsWVz9g3G9lUcFpyjgGN7saCdLLi/PZR+Fzpr47zxD
         0u+YsvM2cwaSwAFS/2VI3521UqdSwTIIqtChU69m5zHowu1M3eDhPbTOP6F08oZMDG+m
         Mp3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwIAtsGnBwB5cGw/7acYwK+uUAZ7F+7vR3YkusT8JL71wwI1vjyAom1uWvAWlOrdS1f+Hj94gEHYFCmcyr9xQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtnvF4Fzv7EuN+CniG9tpXK2E6Tr27LHFyL2wUQUQWTE3i4pkm
	9aDFl78oosq0Xgpo/T7O4C2IakPIFu3lS3vjl1Ldw1uq5kEuchhBd8Hh
X-Gm-Gg: AYBFou2A+dRcKZbtNFp4ryPLdgVnxbtq3DBO0Dsy2nk0aSWHYCmKBQbQrnXjPZtjqEn
	vaUEJPBb7VM1Lvqu0IMEM21n0FLRAqdML8AK6ezeZv2/ZXWjNJS01iyb4z8Fq8MDCE7FEAV3E9U
	ow/1Kelqxq8DFyj8mf2oKDIbW/uckJcClF6PyyJo9fxs4oJ6nT9lAzTzH2ggv8j+6DysiOO9JVA
	d0uPPYgv50mPP3aZLUvJs8ijcaqs5YDo6+805zvgHiQIzY0LWNrl7raEIzTU1sFjWMStd+XexP/
	9R4OYpqF/b+0mL1HM/o2QICtCjdEKxK6jJuWM35/MpUG+ps1pxyqG/qfzdqgKtPdXRm2OYATf1Q
	HqelZZXph7pGyfADHID+/TH6iEupRJA/u9G61B4sneQPpnWk+5ErolD6tI1r96LGGtCTYqdcI2T
	nUiLRYBJwxwVvkyIQO98mk+YnWiD7/JAxIjEpLfT3BRo1yX3usl1+mXX+LD5cxjoWgV/6l+hABr
	CazMQIc0QsjpB9u
X-Received: by 2002:a17:90b:440b:b0:3a0:b540:c00e with SMTP id 98e67ed59e1d1-3a0b540ccf2mr7577893a91.40.1790558438438;
        Sun, 27 Sep 2026 18:20:38 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e151be04sm11010527a91.9.2026.09.27.18.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 18:20:37 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	Jonathan.Cameron@huawei.com,
	bhelgaas@google.com,
	djbw@kernel.org,
	alistair@alistair23.me,
	lukas@wunner.de,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	jic23@kernel.org,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	bjorn3_gh@protonmail.com,
	ojeda@kernel.org,
	tmgross@umich.edu,
	gary@garyguo.net,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	benno.lossin@proton.me,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	a.hindborg@kernel.org
Subject: [PATCH v4 20/22] lib: rspdm: Support SPDM certificate validation
Date: Mon, 28 Sep 2026 11:20:19 +1000
Message-ID: <20260928012021.484003-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928012021.484003-1-alistair.francis@wdc.com>
References: <20260928012021.484003-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair@alistair23.me>

Support validating the SPDM certificate chain. This only performs basic
sanity checks on the chain before we continue on. This does not ensure
that the root CA is trusted, we leave that for userspace to check and
enforce. Instead we just make sure that the chain is correct, uses
supported signatures and that it isn't blacklisted in the kernel.

We then store the first leaf certificate for use later.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 lib/rspdm/lib.rs                |  12 +++
 lib/rspdm/state.rs              | 147 +++++++++++++++++++++++++++++++-
 rust/bindings/bindings_helper.h |   2 +
 3 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
index ee17f4818aeb..50ff92741086 100644
--- a/lib/rspdm/lib.rs
+++ b/lib/rspdm/lib.rs
@@ -124,6 +124,18 @@ pub extern "C" fn spdm_authenticate(state_ptr: *mut spdm_state) -> c_int {
         provisioned_slots &= !(1 << slot);
     }
 
+    let mut provisioned_slots = state.provisioned_slots;
+    while (provisioned_slots as usize) > 0 {
+        let slot = provisioned_slots.trailing_zeros() as u8;
+
+        if let Err(e) = state.validate_cert_chain(slot) {
+            pr_err!("Certificate in slot {slot} failed to verify: {e:?}\n");
+            return e.to_errno() as c_int;
+        }
+
+        provisioned_slots &= !(1 << slot);
+    }
+
     -(EPROTONOSUPPORT as i32)
 }
 
diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
index 780b9d459abf..9f7f6d0ffac6 100644
--- a/lib/rspdm/state.rs
+++ b/lib/rspdm/state.rs
@@ -117,7 +117,8 @@
 ///  H in SPDM specification.
 /// @certs: Certificate chain in each of the 8 slots. Empty KVec if a slot is
 ///  not populated. Prefixed by the 4 + H header per SPDM 1.0.0 table 15.
-#[expect(dead_code)]
+/// @leaf_key: Public key portion of leaf certificate against which to check
+///  responder's signatures.
 pub(crate) struct SpdmState<'a> {
     pub(crate) dev: *mut bindings::device,
     pub(crate) transport: bindings::spdm_transport,
@@ -146,10 +147,20 @@ pub(crate) struct SpdmState<'a> {
 
     // Certificates
     pub(crate) certs: [KVec<u8>; SPDM_SLOTS],
+    pub(crate) leaf_key: Option<*mut bindings::public_key>,
 }
 
 impl Drop for SpdmState<'_> {
     fn drop(&mut self) {
+        if let Some(leaf_key) = self.leaf_key.take() {
+            // SAFETY: `leaf_key` was extracted from a x509 certificate
+            // in `validate_cert_chain()` so it is valid to pass to
+            // `public_key_free()`.
+            unsafe {
+                bindings::public_key_free(leaf_key);
+            }
+        }
+
         self.free_desc();
 
         unsafe {
@@ -186,6 +197,7 @@ pub(crate) fn new(
             desc: core::ptr::null_mut(),
             hash_len: 0,
             certs: [const { KVec::new() }; SPDM_SLOTS],
+            leaf_key: None,
         }
     }
 
@@ -762,4 +774,137 @@ pub(crate) fn get_certificate(&mut self, slot: u8) -> Result<(), Error> {
 
         Ok(())
     }
+
+    pub(crate) fn validate_cert_chain(&mut self, slot: u8) -> Result<(), Error> {
+        let cert_chain_buf = &self.certs[slot as usize];
+        let cert_chain_len = cert_chain_buf.len();
+        // We skip over the RootHash
+        let header_len = 4 + self.hash_len;
+
+        let mut offset = header_len;
+        let mut prev_cert: Option<*mut bindings::x509_certificate> = None;
+
+        if offset >= cert_chain_len {
+            return Err(EPROTO);
+        }
+
+        while offset < cert_chain_len {
+            // SAFETY: `cert_chain_buf[offset..]` is a non-empty slice of
+            // bytes valid for at least `cert_chain_len` bytes.
+            let cert_len = unsafe {
+                bindings::x509_get_certificate_length(
+                    &cert_chain_buf[offset..] as *const _ as *const u8,
+                    cert_chain_len - offset,
+                )
+            };
+
+            if cert_len < 0 {
+                pr_err!("Invalid certificate length\n");
+
+                if let Some(prev) = prev_cert {
+                    // SAFETY: `prev_cert` is the previously parsed
+                    // certificate from a prior loop iteration.
+                    unsafe { bindings::x509_free_certificate(prev) };
+                }
+
+                to_result(cert_len as i32)?;
+            }
+
+            // SAFETY: `cert_chain_buf[offset..]` is a non-empty slice of
+            // bytes valid for at least `cert_len` bytes.
+            let cert_ptr = unsafe {
+                match from_err_ptr(bindings::x509_cert_parse(
+                    &cert_chain_buf[offset..] as *const _ as *const c_void,
+                    cert_len as usize,
+                )) {
+                    Err(e) => {
+                        if let Some(prev) = prev_cert {
+                            // SAFETY: `prev_cert` is the previously parsed
+                            // certificate from a prior loop iteration.
+                            bindings::x509_free_certificate(prev);
+                        }
+                        return Err(e);
+                    }
+                    Ok(c) => c,
+                }
+            };
+            // SAFETY: Cast the `struct x509_certificate` to a Rust binding
+            let cert = unsafe { *cert_ptr };
+
+            if cert.unsupported_sig || cert.blacklisted {
+                pr_err!("Certificate was rejected\n");
+
+                if let Some(prev) = prev_cert {
+                    // SAFETY: `prev_cert` is the previously parsed
+                    // certificate from a prior loop iteration.
+                    unsafe { bindings::x509_free_certificate(prev) };
+                }
+                // SAFETY: `cert_ptr` was just returned by
+                // `x509_cert_parse()`.
+                unsafe { bindings::x509_free_certificate(cert_ptr) };
+
+                return Err(EKEYREJECTED);
+            }
+
+            if let Some(prev) = prev_cert {
+                // SAFETY: `prev_cert` is the previously parsed
+                // certificate from a prior loop iteration.
+                let rc = unsafe { bindings::public_key_verify_signature((*prev).pub_, cert.sig) };
+
+                if rc < 0 {
+                    pr_err!("Signature validation error\n");
+
+                    // SAFETY: `prev_cert` is the previously parsed
+                    // certificate from a prior loop iteration.
+                    unsafe { bindings::x509_free_certificate(prev) };
+
+                    // SAFETY: `cert_ptr` was just returned by
+                    // `x509_cert_parse()`.
+                    unsafe { bindings::x509_free_certificate(cert_ptr) };
+
+                    to_result(rc)?;
+                }
+            }
+
+            if let Some(prev) = prev_cert {
+                // SAFETY: `prev_cert` is the previously parsed
+                // certificate from a prior loop iteration.
+                unsafe { bindings::x509_free_certificate(prev) };
+            }
+
+            prev_cert = Some(cert_ptr);
+            offset += cert_len as usize;
+        }
+
+        if let Some(prev) = prev_cert {
+            if let Some(validate) = self.validate {
+                // SAFETY: Call the `validate` function provided.
+                let rc = unsafe { validate(self.dev, slot, prev) };
+                if let Err(e) = to_result(rc) {
+                    // SAFETY: `prev_cert` is the previously parsed
+                    // certificate from a prior loop iteration.
+                    unsafe { bindings::x509_free_certificate(prev) };
+                    return Err(e);
+                }
+            }
+
+            // The leaf key is the same for all slots (MULT_KEY_CAP == 0),
+            // so just store the first one.
+            if self.leaf_key.is_none() {
+                // SAFETY: `prev_cert` is the previously parsed
+                // certificate from a prior loop iteration.
+                self.leaf_key = unsafe { Some((*prev).pub_) };
+                // SAFETY: `prev_cert` is the previously parsed
+                // certificate from a prior loop iteration. We are setting
+                // the `pub` key to null so it isn't freed below
+                unsafe { (*prev).pub_ = core::ptr::null_mut() };
+            }
+
+            // SAFETY: `prev_cert` is the previously parsed
+            // certificate from a prior loop iteration.
+            unsafe { bindings::x509_free_certificate(prev) };
+        }
+
+        Ok(())
+    }
 }
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index d2781c27794b..5cc71552b524 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -38,6 +38,8 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
+#include <keys/asymmetric-type.h>
+#include <keys/x509-parser.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitmap.h>
-- 
2.55.0

