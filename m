Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A09472767
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708518; cv=none; b=LmyltwRpEsrUkLairlcnH5dJmODyQgAp4IXeodpNmUGFcp9BGfihseBzF3g6o7MVjFgo7BAImRSclE9UsDNjPw1a/n8WT+x8q8VJmjbT5Hdj1u64CpQPjIuRIc30uzimVq5y1c6ZYLAqPArPLv8ptAl8qwIhb/i+TqNFAdBsy14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708518; c=relaxed/simple;
	bh=q14rlrl6kk80xHA6o292BjF9Qhfku6wNmqR8GrKUP9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AJCX9DUAxPamDPFbFz423ftA0+B0HWyMfO0nJFvKizfanXxULWkkzgxgrKc+tu2c06hjbHYI5wew0k0XycSzb1QS6R4XgVaSj7u+tgrh6qPIbAwjFRBeY3kc4CW45FyhYVkhyUNzFadlp8+6oCmCdbP2NchPJsW4Fd6MEh+5Eo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=sVltTWyZ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="sVltTWyZ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490c1915793so48626455e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1781708514; x=1782313314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjrJjlGjPbkkQ49KrNbR1jXlz2YDaRjKqN+8Zb3WdbU=;
        b=sVltTWyZv0gTb+tNhNGOcipLRCxigw+dHH4SVc1tl2e91TMGqKw5z41beh2eLWhgJE
         fVO/gf9MJbfbE7VC7JXYsqGnvnfZFpeBQImvWjR+MNS6xrNIPLi3proFSEoJ+P1UX6jz
         WlkNDhcI1MIchdx5Vm42D7Nt6GZU6hFql8xWLv8eGZErT8vf0svfFYcErvbS3j1mlLIf
         eT78Gs69OcN52g0Vgz9d3Ca3qpDEKRbsyqgWsO7zDFDiiQeVwd6KS1o9g6YgNPVKMuAd
         OhqyihLCODxzWJmq1LAoBp8DmW0DsdW1vjj/5pmSsSX0Vu4a7ISq1ONBeUUioI/OxLn1
         he5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708514; x=1782313314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjrJjlGjPbkkQ49KrNbR1jXlz2YDaRjKqN+8Zb3WdbU=;
        b=HdKL0sGkRQaOP6SslwoQap8s1MaWR0uCs1OjOGM+f0SxLGwWyuq5qg8/ba8Bymeky2
         TCX3u+f9aesO2YFm7c+G7B1yYJ3ZxtSIreG7lNDpAN1x+j2Hmh5cFsX3MkBISuqgsCKj
         lUicsA7Jh4SybIN9z8Ia1B2OWFiacS88hu6B449STfKroVJ9Ieyz3gFHcp/43BqwVfsX
         gdINDgPO6Cw+FRzV8Y8lkNqpeoh2//b0kQMhN/UZ/mtKyFG2exrb06GSBdDDa/InIO1W
         yHSNM6YPVCeEVAiFakt+OCwxbWOeZJaBdm8sBks7FgsFMXWacYcHEqY9GJFXLmeYEOcG
         8N1g==
X-Gm-Message-State: AOJu0YyVH5Rs5IfJzuTrcSm2BdzN1dFj/aLRk9mQeYcB4IjXP9cS1vPi
	P2/Ivi0vFgbYqfHgB/41AlE3/dfNhuoVj5ZsTO7mkF7RZuAYjTJYY/p2BtnqlS5Rb5mdvOj5CfL
	2rTfNrTj4
X-Gm-Gg: Acq92OHjD2Lep3/MM6D3PPygdkaqOxOkOUO17iQslnWTJtBmmni7dJWQccZoHbcPR/B
	LkxbUENUuWt+E0Xg3YsliCImifngXkWctmbxV24flSk6QHwsFNe1G9yAhHty054Yq905npyz5hk
	EV46hroYyr/WUdnYfGHluUIvtPCcrLly3QilCEy6PFEKItUtxrGQpk6GQVSlefJL10nMSxfdasm
	KBehSQ7q0fRzvehTFYKFP+TCDmmg5WdBE3sTqJ6exn7zJDKQpPuX6VVhiMSpv0yunbK5r4qEgLR
	ls8Y/iBNv3fEWo7/hPFNO0teVmKNXgWf4wqGN/2em7wB4kmUwc8gONnV4qZCvQSP1vhb25jvrOx
	cOG9+W3ReWDW6YunG9R6Hbfc3r2cFtWsqJqiK/7QmxBPPWVErYGjbaBH/pln6tj+uXIMrCm3N9G
	xJydquS+Mc3DLvOWgjlnuJj7wKDVKcPnHk4u1glGoClEypxHdU+aB0Duas
X-Received: by 2002:a7b:c044:0:b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-49234142047mr42520215e9.35.1781708512013;
        Wed, 17 Jun 2026 08:01:52 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-461abb44c3dsm13769159f8f.9.2026.06.17.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:01:51 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	linux-crypto@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] rust: crypto: add RSA public-key encryption via crypto_akcipher
Date: Wed, 17 Jun 2026 16:01:33 +0100
Message-ID: <20260617150143.2152-3-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617150143.2152-1-mike@fireburn.co.uk>
References: <20260617150143.2152-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a Rust binding for the asynchronous public-key cipher API
(crypto_akcipher), driven synchronously, and a crypto::rsa_pubkey_encrypt()
convenience built on it.

crypto::Akcipher wraps a tfm allocated with crypto_alloc_akcipher(): new()
selects the algorithm by name, set_pub_key() installs the key in the
algorithm's wire format, and encrypt() runs one public-key operation and
blocks until it completes. crypto::rsa_pubkey_encrypt() DER-encodes the
RSAPublicKey { modulus, publicExponent } that the "rsa" transform's
set_pub_key expects and computes out = (input ^ e) mod n; the caller
applies any padding (PKCS#1 v1.5, EME-OAEP, ...) to the input first, and
out is zeroed on any error so it never retains data from a partial
computation.

The request object, scatterlists and the completion wait are static-inline
or on-stack state that cannot be expressed from Rust, and the akcipher
data path needs DMA-capable (kmalloc, not vmap-stack) buffers, so the
canonical synchronous encrypt sequence and a kmalloc bounce live in a
single rust_helper_ shim; crypto_free_akcipher() and
crypto_akcipher_set_pub_key() are exposed through 1:1 shims as they too
are static inlines.

This goes through the crypto_akcipher subsystem rather than the raw MPI
math library, so it composes with any registered akcipher implementation
(including hardware offload) and does not open-code modular exponentiation.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/crypto.c           |  70 +++++++++++++
 rust/kernel/crypto.rs           | 180 +++++++++++++++++++++++++++++++-
 3 files changed, 250 insertions(+), 1 deletion(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 14671e1825bb..e6add9754acd 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -28,6 +28,7 @@
  */
 #include <linux/hrtimer_types.h>
 
+#include <crypto/akcipher.h>
 #include <crypto/sha2.h>
 
 #include <linux/acpi.h>
diff --git a/rust/helpers/crypto.c b/rust/helpers/crypto.c
index dc9614f6fc8e..6681e9155c84 100644
--- a/rust/helpers/crypto.c
+++ b/rust/helpers/crypto.c
@@ -1,6 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <crypto/aes.h>
+#include <crypto/akcipher.h>
+#include <linux/crypto.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
 #include <linux/string.h>
 
 /*
@@ -23,3 +27,69 @@ rust_helper_aes128_encrypt_block(const u8 *key, const u8 *in, u8 *out)
 	memzero_explicit(&enckey, sizeof(enckey));
 	return 0;
 }
+
+/*
+ * crypto_free_akcipher() and crypto_akcipher_set_pub_key() are static inlines,
+ * so they are exposed to Rust through these 1:1 shims (the same convention as
+ * the other rust_helper_ wrappers).
+ */
+__rust_helper void
+rust_helper_crypto_free_akcipher(struct crypto_akcipher *tfm)
+{
+	crypto_free_akcipher(tfm);
+}
+
+__rust_helper int
+rust_helper_crypto_akcipher_set_pub_key(struct crypto_akcipher *tfm,
+					const void *key, unsigned int keylen)
+{
+	return crypto_akcipher_set_pub_key(tfm, key, keylen);
+}
+
+/*
+ * One-shot synchronous public-key encrypt over the akcipher API: encrypts
+ * @src_len bytes at @src into @dst (capacity @dst_len) and returns the
+ * ciphertext length or -errno.
+ *
+ * The request object, the scatterlists and the completion wait are all
+ * static-inline or on-stack state that cannot be expressed from Rust, so the
+ * canonical synchronous akcipher sequence lives here. The akcipher data path
+ * also needs DMA-capable (kmalloc, not vmap-stack) buffers, so @src/@dst are
+ * bounced through kmalloc'd copies; @dst is overwritten only on success and
+ * the bounce buffers are wiped on free.
+ */
+__rust_helper int
+rust_helper_akcipher_encrypt_oneshot(struct crypto_akcipher *tfm,
+				     const u8 *src, unsigned int src_len,
+				     u8 *dst, unsigned int dst_len)
+{
+	struct akcipher_request *req;
+	struct scatterlist src_sg, dst_sg;
+	DECLARE_CRYPTO_WAIT(wait);
+	u8 *in, *out;
+	int ret = -ENOMEM;
+
+	req = akcipher_request_alloc(tfm, GFP_KERNEL);
+	in = kmemdup(src, src_len, GFP_KERNEL);
+	out = kzalloc(dst_len, GFP_KERNEL);
+	if (!req || !in || !out)
+		goto out;
+
+	sg_init_one(&src_sg, in, src_len);
+	sg_init_one(&dst_sg, out, dst_len);
+	akcipher_request_set_crypt(req, &src_sg, &dst_sg, src_len, dst_len);
+	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
+				      crypto_req_done, &wait);
+
+	ret = crypto_wait_req(crypto_akcipher_encrypt(req), &wait);
+	if (ret == 0) {
+		memcpy(dst, out, dst_len);
+		ret = req->dst_len;
+	}
+out:
+	kfree_sensitive(in);
+	kfree_sensitive(out);
+	if (req)
+		akcipher_request_free(req);
+	return ret;
+}
diff --git a/rust/kernel/crypto.rs b/rust/kernel/crypto.rs
index c8f2cb994cfd..0824f6ec81df 100644
--- a/rust/kernel/crypto.rs
+++ b/rust/kernel/crypto.rs
@@ -6,10 +6,21 @@
 //! SHA-256 and HMAC-SHA256 — for use from Rust. They run synchronously in the
 //! calling context with no allocation; the hashes are infallible.
 //!
+//! Also exposes the asynchronous public-key API ([`Akcipher`]) over
+//! `crypto_akcipher`, driven synchronously, and a convenience RSA public-key
+//! primitive built on it for callers that do their own padding (see
+//! [`rsa_pubkey_encrypt`]).
+//!
 //! C headers: [`include/crypto/aes.h`](srctree/include/crypto/aes.h),
+//! [`include/crypto/akcipher.h`](srctree/include/crypto/akcipher.h),
 //! [`include/crypto/sha2.h`](srctree/include/crypto/sha2.h).
 
-use crate::{bindings, error::to_result, prelude::*};
+use crate::{
+    bindings,
+    error::{from_err_ptr, to_result},
+    prelude::*,
+};
+use core::ptr::NonNull;
 
 /// Size of a SHA-256 / HMAC-SHA256 digest, in bytes.
 pub const SHA256_DIGEST_SIZE: usize = 32;
@@ -75,3 +86,170 @@ pub fn encrypt_block(
         Ok(out)
     }
 }
+
+/// An asynchronous public-key cipher transform (`struct crypto_akcipher`),
+/// driven synchronously.
+///
+/// Wraps a tfm allocated with `crypto_alloc_akcipher()`; the underlying
+/// algorithm (e.g. `"rsa"`) is selected by name in [`Akcipher::new`]. After a
+/// key is installed with [`set_pub_key`](Akcipher::set_pub_key), [`encrypt`]
+/// performs one public-key operation, blocking until the request completes.
+///
+/// [`encrypt`]: Akcipher::encrypt
+///
+/// # Examples
+///
+/// ```
+/// use kernel::crypto::Akcipher;
+/// // `der` is a DER-encoded RSAPublicKey; `pt` is already padded to key size.
+/// # fn f(der: &[u8], pt: &[u8]) -> Result {
+/// let mut tfm = Akcipher::new(c"rsa")?;
+/// tfm.set_pub_key(der)?;
+/// let mut ct = [0u8; 256];
+/// let n = tfm.encrypt(pt, &mut ct)?;
+/// # let _ = n; Ok(())
+/// # }
+/// ```
+pub struct Akcipher(NonNull<bindings::crypto_akcipher>);
+
+// SAFETY: a tfm is a self-contained kernel object with no thread affinity; the
+// synchronous request path takes its own per-call state, so the handle may be
+// moved and used from any thread.
+unsafe impl Send for Akcipher {}
+
+impl Akcipher {
+    /// Allocates a transform for the named akcipher algorithm (e.g. `c"rsa"`).
+    pub fn new(alg_name: &core::ffi::CStr) -> Result<Self> {
+        // SAFETY: `alg_name` is a valid NUL-terminated C string; the call
+        // returns a valid tfm pointer or an `ERR_PTR`.
+        let tfm = from_err_ptr(unsafe {
+            bindings::crypto_alloc_akcipher(alg_name.as_ptr().cast(), 0, 0)
+        })?;
+        Ok(Self(NonNull::new(tfm).ok_or(ENOMEM)?))
+    }
+
+    /// Installs the public key, encoded in the algorithm's expected wire format
+    /// (for `"rsa"`, a DER-encoded `RSAPublicKey`).
+    pub fn set_pub_key(&mut self, key: &[u8]) -> Result {
+        // SAFETY: `self.0` is a live tfm; `key` is valid for `key.len()` reads.
+        to_result(unsafe {
+            bindings::crypto_akcipher_set_pub_key(
+                self.0.as_ptr(),
+                key.as_ptr().cast(),
+                key.len() as u32,
+            )
+        })
+    }
+
+    /// Encrypts `src` into `dst`, returning the ciphertext length. Blocks until
+    /// the operation completes. `dst` must be at least the algorithm's maximum
+    /// output size (the key/modulus size for RSA).
+    pub fn encrypt(&self, src: &[u8], dst: &mut [u8]) -> Result<usize> {
+        // SAFETY: `self.0` is a live tfm; `src`/`dst` are valid for their
+        // lengths. The helper bounces them through kmalloc'd buffers, runs one
+        // synchronous akcipher encrypt, and returns the length or a negative
+        // errno.
+        let ret = unsafe {
+            bindings::akcipher_encrypt_oneshot(
+                self.0.as_ptr(),
+                src.as_ptr(),
+                src.len() as u32,
+                dst.as_mut_ptr(),
+                dst.len() as u32,
+            )
+        };
+        to_result(ret)?;
+        Ok(ret as usize)
+    }
+}
+
+impl Drop for Akcipher {
+    fn drop(&mut self) {
+        // SAFETY: `self.0` was allocated by `crypto_alloc_akcipher()` and is
+        // freed exactly once here.
+        unsafe { bindings::crypto_free_akcipher(self.0.as_ptr()) };
+    }
+}
+
+/// Appends a DER definite length to `out`.
+fn der_len(out: &mut KVec<u8>, len: usize) -> Result {
+    if len < 0x80 {
+        out.push(len as u8, GFP_KERNEL)?;
+        return Ok(());
+    }
+    let mut bytes = [0u8; core::mem::size_of::<usize>()];
+    let mut n = 0;
+    let mut rest = len;
+    while rest > 0 {
+        bytes[n] = rest as u8;
+        rest >>= 8;
+        n += 1;
+    }
+    out.push(0x80 | n as u8, GFP_KERNEL)?;
+    for i in (0..n).rev() {
+        out.push(bytes[i], GFP_KERNEL)?;
+    }
+    Ok(())
+}
+
+/// Appends a DER `INTEGER` carrying the unsigned big-endian magnitude `bytes`.
+fn der_integer(out: &mut KVec<u8>, bytes: &[u8]) -> Result {
+    // Canonicalise: drop leading zero octets, keeping at least one.
+    let mut mag = bytes;
+    while mag.len() > 1 && mag[0] == 0 {
+        mag = &mag[1..];
+    }
+    // A leading zero is needed to keep the value positive if the top bit is set
+    // (or to represent zero when the magnitude is empty).
+    let pad = mag.is_empty() || mag[0] & 0x80 != 0;
+    out.push(0x02, GFP_KERNEL)?;
+    der_len(out, mag.len() + pad as usize)?;
+    if pad {
+        out.push(0x00, GFP_KERNEL)?;
+    }
+    out.extend_from_slice(mag, GFP_KERNEL)?;
+    Ok(())
+}
+
+/// DER-encodes `RSAPublicKey ::= SEQUENCE { modulus INTEGER, publicExponent
+/// INTEGER }` from big-endian `modulus`/`exponent`, as `rsa`'s `set_pub_key`
+/// expects.
+fn der_rsa_pubkey(modulus: &[u8], exponent: &[u8]) -> Result<KVec<u8>> {
+    let mut body = KVec::new();
+    der_integer(&mut body, modulus)?;
+    der_integer(&mut body, exponent)?;
+    let mut der = KVec::new();
+    der.push(0x30, GFP_KERNEL)?;
+    der_len(&mut der, body.len())?;
+    der.extend_from_slice(&body, GFP_KERNEL)?;
+    Ok(der)
+}
+
+/// Computes the RSA public-key operation `out = (input ^ exponent) mod modulus`
+/// through the `crypto_akcipher` `"rsa"` transform.
+///
+/// All buffers are unsigned big-endian. `out` is written fixed-width to exactly
+/// `out.len()` bytes (left zero-padded by the cipher); pass `out.len()` equal to
+/// the modulus size (e.g. 128 for RSA-1024). This is the bare primitive: the
+/// caller applies any padding (PKCS#1 v1.5, EME-OAEP, …) to `input` first.
+///
+/// `input` interpreted as an integer must be less than `modulus`, as RSA
+/// requires; otherwise an error is returned. On any error `out` is zeroed, so
+/// it never retains data from a partial computation.
+pub fn rsa_pubkey_encrypt(
+    modulus: &[u8],
+    exponent: &[u8],
+    input: &[u8],
+    out: &mut [u8],
+) -> Result {
+    let der = der_rsa_pubkey(modulus, exponent)?;
+    let mut tfm = Akcipher::new(c"rsa")?;
+    tfm.set_pub_key(&der)?;
+    match tfm.encrypt(input, out) {
+        Ok(_) => Ok(()),
+        Err(e) => {
+            out.fill(0);
+            Err(e)
+        }
+    }
+}
-- 
2.54.0

