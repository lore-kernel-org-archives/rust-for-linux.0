Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3167D2D0620
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047665; cv=none; b=IvSxWL5f/VqYK1SO/Nik8fF2ON80y6Nvo1NE2odsAeUgHDcmaCf9k+n/m73QVPIaFGcQbO4CTxciBzsA4aPlDbY2+fH6TEzrlKloKshQx3camIX5RaLfk48tKhHxh5/qtA4Gu9Q9QzY0czO1sqImYBhSjjndHvCfhP/O/cmcDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047665; c=relaxed/simple;
	bh=JcssajxRi9PNX78hwKD3nC3DUtxZW5CBP4nY1hEy3WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Umpn/gy9u6kbchIHARaHk0qxLi2kI0vLImwK4mVolnSdL07FA3aFO6oHjNKpzut8T80QC1Y3/Vj8kiIKSMyhtguyI92r/R5COQAA8V2xFGKnVgaeW7KrYL49vznT0zSN42jVbBqKyDdd9dq7u8JmYVvpSOplMi6ZDqKjDlUTsi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=OrkoSSgP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="OrkoSSgP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso553815e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047663; x=1783652463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHdvnoaQNk7ls45hnvahZXx3/d9yXQUlDlEG/vvXbjU=;
        b=OrkoSSgPveBD5gWrf+S1cmqgozVeOz/yNAQQCj03SjXqkedSECOlMsHhedY9SAJX7w
         OjSvbP7Wqf1sLaeU/+Fj2MlYUPE6D1PP5eS2KX8O+z/98N8SufS9tzqEUM6BsBvcZThy
         nDbS/Gk37wrlkpqVl2+woiCXyF8haEisbr9YsrlkaaJpgI6vEqnBu99Gj11m6OpBtz/5
         CkDqAG+I3Wv8HNsjUAvWW7LOupl1c/rwI2LHqRNIbw88WTt8VulHo3O/yfU47lpE0i5v
         2tEYjASqqQC4ii3KK0tFh07DAecjRhzMCz6LmfV5Zsp0C1xhDmgOvDfM1XwhVtYOmV2K
         AaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047663; x=1783652463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AHdvnoaQNk7ls45hnvahZXx3/d9yXQUlDlEG/vvXbjU=;
        b=YUGT9S7CHkwj3zjY8yGpP3WzEbZDJwi/S9z6x1TOtW9qsTZvRFHEylcw0Pgr1RWePW
         694sAr5sLUjKNxlizCqZtnQUO03HuNiSlZamldTYyQRi3cZga5gPOWBq7OdC1jx4TmSm
         JOOz0Cc0MEMu8Dvo794ALt2jzF3Nd5T6D7MfIXP8DXFUgwkSNkNVjx+351d4P08QUBLr
         r+uXBuRJlYCo1gdg8ysLPMJO54c2oGDRBocUUFlmMjvkVfpLCBC78a+53w3uTEUhHghe
         fV+nEoTLPKTIAx5HHRicuipgZsdI+64IM0Q4SRMG5h9N+1YpMYvkAcIqdEVJ/s2zPvtc
         0Jcw==
X-Gm-Message-State: AOJu0YzPG5OzINQaBGKn4kIwLqRzUuXEIfZb5gQNet+w8F6i6V8SFhpk
	u8A9htu+yHmppqdeGiI7Ab9nrSN0ONOEFmJAxWxIqoMuEoLqZCC/5iPr9uAX4J0IFORFWI3iu5R
	MzfwjepAg
X-Gm-Gg: AfdE7ckDsBLT1DYXja65fbhQ6YDeP6OCBp6oNXy7hE/MX0YJsSHRjd1VFPvrIFV2CiM
	m7pLKQRkil+F5FNQrNXOgOhMB1p6GunLuPJ0i2xgunEc/HCtA8PMKcM1s14bfslydxxxAA8kNDT
	BgQBp3JiIgHd1h3OogP52w/DCyCNjAgxrJr/o/8pPdI+0zHpZzexrelAWQqwlyu1as5KWAIKMrr
	A/THhI1sHMSrcMUBeEUMQJMxOlJMLOAu7LOVH5L1+y7BR2YC85uIqh9Z1w5tO8q+nW/Ht4t1Wa1
	t0RdjsXrXP856+wxpBlyfUe94353cMOzfQqMqi1eY0ilkWiUHPh+OS30xPv/cI4+IcHp023seSY
	rSe8dmwKfqMoeLLj0QZhd3OBdpbMVr+6lEvObnJeEkjOPS+/OoEEQRiBRQ6xVQgwx2YqRk/EHWN
	sU1gYiEgmXhPha5VFRMG9zyicafnHFWhBX3bT3sKdsrryvQtTSMBVmI/mXzQoS4OOmlhY=
X-Received: by 2002:a05:600c:8590:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-493c2ba43a2mr103955105e9.33.1783047662567;
        Thu, 02 Jul 2026 20:01:02 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm199495015e9.2.2026.07.02.20.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:01:01 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 1/3] rust: crypto: add library AES-128 / SHA-256 / HMAC-SHA256 bindings
Date: Fri,  3 Jul 2026 04:00:51 +0100
Message-ID: <20260703030056.2763-2-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703030056.2763-1-mike@fireburn.co.uk>
References: <20260617150143.2152-1-mike@fireburn.co.uk>
 <20260703030056.2763-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a small `kernel::crypto` module exposing the kernel's synchronous
library crypto (lib/crypto) to Rust: SHA-256, HMAC-SHA256 and single-block
AES-128 ECB. These are one-shot, allocation-free and run in the calling
context, suitable for in-kernel Rust users that need a hash or a block
cipher without the full asynchronous crypto API.

SHA-256 (`sha256()`) and HMAC-SHA256 (`hmac_sha256_usingrawkey()`) are
plain exported functions and are bound directly via bindgen, so their
header `<crypto/sha2.h>` is added to bindings_helper.h. AES single-block
encryption goes through a `rust_helper_` shim because `aes_encrypt()` takes
a transparent union (`aes_encrypt_arg`) that bindgen cannot express; the
shim also zeroes the expanded key schedule before returning.

The Rust API: `crypto::sha256(&[u8]) -> [u8; 32]`,
`crypto::hmac_sha256(key, data) -> [u8; 32]`, and the `crypto::Aes128`
type, created with `Aes128::new(key)` and used via
`encrypt_block(&[u8; 16]) -> Result<[u8; 16]>`.

Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Assisted-by: Claude:claude-opus-4-8 [Claude-Code]
---
 rust/bindings/bindings_helper.h |  2 +
 rust/helpers/crypto.c           | 25 +++++++++++
 rust/helpers/helpers.c          |  1 +
 rust/kernel/crypto.rs           | 77 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  1 +
 5 files changed, 106 insertions(+)
 create mode 100644 rust/helpers/crypto.c
 create mode 100644 rust/kernel/crypto.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1124785e210b..14671e1825bb 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -28,6 +28,8 @@
  */
 #include <linux/hrtimer_types.h>
 
+#include <crypto/sha2.h>
+
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
diff --git a/rust/helpers/crypto.c b/rust/helpers/crypto.c
new file mode 100644
index 000000000000..dc9614f6fc8e
--- /dev/null
+++ b/rust/helpers/crypto.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/aes.h>
+#include <linux/string.h>
+
+/*
+ * AES-128 single-block ECB encryption: out = AES(key, in).
+ *
+ * A helper because aes_encrypt() takes a transparent union (aes_encrypt_arg)
+ * that bindgen cannot express. SHA-256 and HMAC-SHA256 are plain extern
+ * functions and are bound directly.
+ */
+__rust_helper int
+rust_helper_aes128_encrypt_block(const u8 *key, const u8 *in, u8 *out)
+{
+	struct aes_enckey enckey;
+	int ret;
+
+	ret = aes_prepareenckey(&enckey, key, AES_KEYSIZE_128);
+	if (ret)
+		return ret;
+	aes_encrypt(&enckey, out, in);
+	memzero_explicit(&enckey, sizeof(enckey));
+	return 0;
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 998e31052e66..4f8a1d6d129c 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -56,6 +56,7 @@
 #include "cpufreq.c"
 #include "cpumask.c"
 #include "cred.c"
+#include "crypto.c"
 #include "device.c"
 #include "dma.c"
 #include "dma-resv.c"
diff --git a/rust/kernel/crypto.rs b/rust/kernel/crypto.rs
new file mode 100644
index 000000000000..c8f2cb994cfd
--- /dev/null
+++ b/rust/kernel/crypto.rs
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Safe wrappers over the kernel's synchronous library crypto.
+//!
+//! Exposes the one-shot `lib/crypto` primitives — AES-128 single-block ECB,
+//! SHA-256 and HMAC-SHA256 — for use from Rust. They run synchronously in the
+//! calling context with no allocation; the hashes are infallible.
+//!
+//! C headers: [`include/crypto/aes.h`](srctree/include/crypto/aes.h),
+//! [`include/crypto/sha2.h`](srctree/include/crypto/sha2.h).
+
+use crate::{bindings, error::to_result, prelude::*};
+
+/// Size of a SHA-256 / HMAC-SHA256 digest, in bytes.
+pub const SHA256_DIGEST_SIZE: usize = 32;
+/// AES-128 block and key size, in bytes.
+pub const AES128_BLOCK_SIZE: usize = 16;
+
+/// Returns the SHA-256 digest of `data`.
+pub fn sha256(data: &[u8]) -> [u8; SHA256_DIGEST_SIZE] {
+    let mut out = [0u8; SHA256_DIGEST_SIZE];
+    // SAFETY: `data` is valid for `data.len()` reads and `out` is a valid
+    // `SHA256_DIGEST_SIZE`-byte output buffer, as `sha256()` requires.
+    unsafe { bindings::sha256(data.as_ptr(), data.len(), out.as_mut_ptr()) };
+    out
+}
+
+/// Returns `HMAC-SHA256(key, data)`.
+pub fn hmac_sha256(key: &[u8], data: &[u8]) -> [u8; SHA256_DIGEST_SIZE] {
+    let mut out = [0u8; SHA256_DIGEST_SIZE];
+    // SAFETY: `key` and `data` are valid for their respective lengths and `out`
+    // is a valid `SHA256_DIGEST_SIZE`-byte output buffer, as required.
+    unsafe {
+        bindings::hmac_sha256_usingrawkey(
+            key.as_ptr(),
+            key.len(),
+            data.as_ptr(),
+            data.len(),
+            out.as_mut_ptr(),
+        )
+    };
+    out
+}
+
+/// An AES-128 key usable for single-block ECB encryption.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::crypto::Aes128;
+/// let cipher = Aes128::new([0u8; 16]);
+/// let _ct = cipher.encrypt_block(&[0u8; 16])?;
+/// # Ok::<(), Error>(())
+/// ```
+pub struct Aes128([u8; AES128_BLOCK_SIZE]);
+
+impl Aes128 {
+    /// Creates an AES-128 key from 16 raw key bytes.
+    pub fn new(key: [u8; AES128_BLOCK_SIZE]) -> Self {
+        Self(key)
+    }
+
+    /// Encrypts one 16-byte block: returns `AES-128-ECB(key, block)`.
+    pub fn encrypt_block(
+        &self,
+        block: &[u8; AES128_BLOCK_SIZE],
+    ) -> Result<[u8; AES128_BLOCK_SIZE]> {
+        let mut out = [0u8; AES128_BLOCK_SIZE];
+        // SAFETY: `self.0`, `block` and `out` are all valid 16-byte buffers, as
+        // the helper requires.
+        let ret = unsafe {
+            bindings::aes128_encrypt_block(self.0.as_ptr(), block.as_ptr(), out.as_mut_ptr())
+        };
+        to_result(ret)?;
+        Ok(out)
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..7fcbf3e7d7af 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -59,6 +59,7 @@
 pub mod cpufreq;
 pub mod cpumask;
 pub mod cred;
+pub mod crypto;
 pub mod debugfs;
 pub mod device;
 pub mod device_id;
-- 
2.55.0

