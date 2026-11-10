Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284464;
	b=sZGtwww0wCg5KxOZ7Mi3Kl60a7KDRk30+1sUVJs6WgucKI70M0rHlQNIlhCxh8VFoOPq
	 MzkS6b+XIQH5+dfB7nE4htDeK5T+4j+pQnFK89l+l92BUBg6fPsg8SpoDTNE9zA+xGJOw
	 MtoYDyAVkMiLnjCrfKtElo4CIfG8dHCUHzHx8thRNgLoK3na0KrOelazDu8PFHcQiXpYC
	 7DBJB5bVb5FQNMe0wjlNaOcdKMA7igaPcMTpsIaApvxmUUYGBBYfRlyt6KCGjyJAcXLNw
	 zN2Gn7mdKSPEuXMaH+wD+iMVXNOXz7CTxZbvJ3ggdcNW+Lw9MHiaQ7EsD31k4lq/QCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
	b=Yx5J/M8aQF4JUtNu/mJjcrOYkHeVKEGGkM6kFLiwshOt0H9MxgwbarmaqtZyW0jSX65P
	 hZsOZmvdlqiBsPqsAcwDUkxpdLOPF1N0D5WLaFm1CMm4mplMGrPxqXvBoS5zRGSPZcR2y
	 avlokF+srjJmiVnwUYeoN2vQ/bKxHv5GTVPw8wXxQhO9YVV7Cy673QJu8iR2EalKrwOoR
	 AlzWRNtSvGFacDpvESBpSScjlvNfrOgqmc7T9JxS5avI7FvzFh8dCe4OE3GgZ7y028XJg
	 4wYdlyeQjSltMRLf/WfaH9EMy/horPnPW5ZE420T1/WME0HpSpWGA4bJHeSJ+QyGUKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBBRbkGU;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4061060A262B
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 04:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4061060A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBBRbkGU
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so2711615c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 20:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794284462; x=1794889262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
        b=lBBRbkGUOdW39g7/KHjzlpnPJ6GtmuwJmyhcwaeYU9cYtJ1U4OdM/6wro7fwsNM4dn
         NIDrMoph7FdUIlhIVgwtVg+QNcoB/mq7nkS9Y7XPzhfPs8rdwMh6UwahvluHZJhIG/T3
         dpoj4AwGkYNgCu/slIxtdwWHNXw4a+ZZqxjCIE9hwbu8/56Pmwv+UqIgdlxP5Bxh5H2b
         3HXC4N47LYS1xRXzmdGKj71m3/FSrUrnehSwiDNTDwzTfLM5tnCfiwOWw7gJ+1s79QCY
         zZOEjMO6w6Li+KkewbiY+YUs//7gkTNcS/p5NEKunvqSqMjtTWytwmVYgZ/dnkmGY1aF
         B9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284462; x=1794889262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zyt2Bz/rIR/RhhcPSDpg8Xgw63qkgtmvP9go9YSwbK8=;
        b=diMRGbQkYhcfRf3B9D2BfSWs0CnAU77t/5jzJOnZVsYwMB12vQCZmqtv2UFI9SzQN0
         e4vo8jR0QrazCIoQ+1Wi4o6dwD3u/nMVc9H6pLS/0sttCr2/DPe8DKzlSe5nTgz0YzrR
         sv8ti2EItmGoRav6iXXrWvU5KWIM6WetBPdpOmn3kXSb4jM3JqixZti273WvikLJyvi7
         5GNwsbUKpyadRcW5Z5glIRqq0B5XF0mnnAVPE3QLPEPxJP7U+pq7m3TgiUHMqxfPYTQC
         H6MKHmyXLNE6EwoqSuyMr++oVx0U7uMgMAPP9KW+bcH/zqd9930gMhCfKLaefWyGZ0lV
         QeQw==
X-Forwarded-Encrypted: i=1; AL+hErEfYDLirtHBhXVz/r6YT9AAC/9M4lsZXWYUYosfpzQdGUzapx7BnLBQCXycqD/i1dSNEdBsSinFV6lplx/Cng==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8c3rl7Idyb+odXAXENG9H/NtFnyrqg6cj7toV7cwIfDWkfuwP
	hmcVSqnK35b0o0YI52LX+iJxI+p02woCk3sEkbJS1ApE+5JifDGF1TVM
X-Gm-Gg: AYBFou1jUVf5PfG2tTSdojEV8y94yn4nLoan08SJRvkZ/Agx7x3c6SUYbH+RgV+eABl
	bERiMgMLgngFqNpBh6pXswjHgM8MP3lJ84E/FoRq3Dv9Ul8geqEQVzltwRh0XLOD4I0clfiySph
	aVRr+8koUTGYmSz8GjJLv6/63IwZyn4VZy7JYsG5KfWTivUlABEKlW8d/WxnfAqgApWlUMHrTp5
	Ajd2QVTNXavOasU/0vnxmgHWCBRlOHAHVDEjoCgNmPbO9vOdzhOYYq/JHJVKa8z9VRRHpVU3UWZ
	YcROrEEAlJywbXheeaE7NMHe6pDmVGGDdnskxeVKHxhDuirswRjCVUeGt9rJl2w6iLhPL5rZsAg
	qWaKbyxoY0h5iPggs7m/rjoFzqkCuEU0J5pl1rDUzgnuhCBa7r11FZkn0GMgKKQhpLoaX62PD2w
	2Wl/SeBJjscbbF4Md1i8Cb023/xRMHltA22Nx7RQAPUigHM+2eieJa2jF9aj/ZrHb+qvG0IScPF
	iWDWWentbkTFFefW5eIIfVEq7qfBDvaiT6limjrrWuD67ZnYbUBm1xFuuzYibfo0YRzHlMJsUPb
	jVjAlwDOdVODh5MJc5EETy1j5QfQN/aHtI5v7viMV3RXov0=
X-Received: by 2002:a05:7022:f8a:b0:1a7:7160:ffc8 with SMTP id a92af1059eb24-1b3b60039e7mr2636172c88.10.1794284461889;
        Mon, 09 Nov 2026 20:21:01 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3540459c88.22.2026.11.09.20.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:21:01 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	bvanassche@acm.org,
	linux-pci@vger.kernel.org,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jic23@kernel.org,
	rust-for-linux@vger.kernel.org,
	jgg@nvidia.com,
	akpm@linux-foundation.org
Cc: gary@garyguo.net,
	a.hindborg@kernel.org,
	wilfred.mallawa@wdc.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	alistair23@gmail.com,
	gregkh@linuxfoundation.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v6 16/25] rust: kernel: Add crypto hash bindings
Date: Tue, 10 Nov 2026 14:18:23 +1000
Message-ID: <20261110041832.1730924-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110041832.1730924-1-alistair.francis@wdc.com>
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
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

Initial support for the kernel crypto hash bindings, which will be used
by the SPDM library.

This is just a few functions that the Rust SPDM implementation will use
in the next few commits.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 lib/Kconfig         |   1 +
 rust/kernel/hash.rs | 141 ++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs  |   2 +
 3 files changed, 144 insertions(+)
 create mode 100644 rust/kernel/hash.rs

diff --git a/lib/Kconfig b/lib/Kconfig
index daf219282f441..7b1952c5d5c18 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -593,6 +593,7 @@ config RSPDM
 	depends on RUST
 	select KEYS
 	select CRYPTO
+	select CRYPTO_HASH2
 	select ASYMMETRIC_KEY_TYPE
 	select ASYMMETRIC_PUBLIC_KEY_SUBTYPE
 	select X509_CERTIFICATE_PARSER
diff --git a/rust/kernel/hash.rs b/rust/kernel/hash.rs
new file mode 100644
index 0000000000000..84b3c79a2895f
--- /dev/null
+++ b/rust/kernel/hash.rs
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Western Digital
+
+//! Wrappers around the Linux kernel crypto hash APIs.
+//!
+//! C headers: [`include/crypto/hash.h`](srctree/include/crypto/hash.h).
+//!
+//! Reference: <https://www.kernel.org/doc/html/latest/crypto/devel-algos.html#hashing-hash>
+
+use core::ptr::NonNull;
+use kernel::prelude::*;
+use kernel::{
+    bindings,
+    error::{
+        from_err_ptr,
+        to_result, //
+    },
+    str::CStr,
+};
+
+/// Synchronous hash transformation plus its descriptor buffer.
+pub struct Shash {
+    shash: NonNull<bindings::crypto_shash>,
+    desc: NonNull<bindings::shash_desc>,
+    desc_len: usize,
+    desc_capacity: usize,
+    hash_len: usize,
+    name: &'static CStr,
+}
+
+impl Shash {
+    /// Allocates a hash transformation and its descriptor buffer.
+    pub fn new(name: &'static CStr) -> Result<Self> {
+        // SAFETY: `name.as_char_ptr()` is a valid NUL-terminated C string.
+        // `crypto_alloc_shash()` returns a valid pointer or an ERR_PTR.
+        let shash =
+            from_err_ptr(unsafe { bindings::crypto_alloc_shash(name.as_char_ptr(), 0, 0) })?;
+        let shash = NonNull::new(shash).ok_or(ENOMEM)?;
+
+        // SAFETY: `shash` is a valid `crypto_shash` handle.
+        let desc_size = unsafe { bindings::crypto_shash_descsize(shash.as_ptr()) } as usize;
+        // SAFETY: `shash` is a valid `crypto_shash` handle.
+        let hash_len = unsafe { bindings::crypto_shash_digestsize(shash.as_ptr()) } as usize;
+        let desc_len = core::mem::size_of::<bindings::shash_desc>() + desc_size;
+
+        let desc_vec = match KVec::from_elem(0u8, desc_len, GFP_KERNEL) {
+            Ok(desc_vec) => desc_vec,
+            Err(e) => {
+                // SAFETY: `shash` was allocated above and must be freed if the
+                // descriptor allocation fails.
+                unsafe {
+                    bindings::crypto_free_shash(shash.as_ptr());
+                }
+                return Err(e.into());
+            }
+        };
+
+        let (desc_buf, _desc_len, desc_capacity) = desc_vec.into_raw_parts();
+
+        debug_assert_eq!(
+            desc_buf.addr() % core::mem::align_of::<bindings::shash_desc>(),
+            0,
+            "kmalloc alignment insufficient for shash_desc"
+        );
+        let desc = NonNull::new(desc_buf.cast::<bindings::shash_desc>()).ok_or(ENOMEM)?;
+
+        // SAFETY: `desc` points to an allocation of `desc_len` bytes, which is
+        // exactly large enough for a `shash_desc` header and its trailing
+        // algorithm state. No explicit init is needed as
+        // `crypto_shash_digest()` re-initialises the descriptor on each call.
+        unsafe {
+            (*desc.as_ptr()).tfm = shash.as_ptr();
+        }
+
+        Ok(Self {
+            shash,
+            desc,
+            desc_len,
+            desc_capacity,
+            hash_len,
+            name,
+        })
+    }
+
+    /// Return the name of the hash
+    #[inline]
+    pub fn name(&self) -> &'static CStr {
+        self.name
+    }
+
+    /// Return the length of the hash output (in bytes)
+    #[inline]
+    pub fn hash_len(&self) -> usize {
+        self.hash_len
+    }
+
+    /// Computes a one-shot digest into `out`, which must be exactly the digest
+    /// size of the selected hash algorithm.
+    #[inline]
+    pub fn digest(&mut self, data: &[u8], out: &mut [u8]) -> Result {
+        if out.len() != self.hash_len {
+            return Err(EINVAL);
+        }
+
+        let data_len = u32::try_from(data.len()).map_err(|_| EINVAL)?;
+
+        // SAFETY: `self.desc` was created by `Shash::new()` and points to a
+        // valid `shash_desc` with a valid `tfm`. `out` is checked above to be
+        // exactly `crypto_shash_digestsize()` bytes.
+        unsafe {
+            to_result(bindings::crypto_shash_digest(
+                self.desc.as_ptr(),
+                data.as_ptr(),
+                data_len,
+                out.as_mut_ptr(),
+            ))
+        }
+    }
+}
+
+impl Drop for Shash {
+    fn drop(&mut self) {
+        // SAFETY: `self.desc` was produced from a `KVec<u8>` allocation by
+        // `into_raw_parts()` in `Shash::new()`, and `desc_len` and
+        // `desc_capacity` are the exact values handed out at that time.
+        let desc_vec = unsafe {
+            KVec::<u8>::from_raw_parts(
+                self.desc.as_ptr().cast::<u8>(),
+                self.desc_len,
+                self.desc_capacity,
+            )
+        };
+        drop(desc_vec);
+
+        // SAFETY: `self.shash` is a valid handle created by `crypto_alloc_shash()`.
+        unsafe {
+            bindings::crypto_free_shash(self.shash.as_ptr());
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index a3c54971e9dea..0cf6eab448d08 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -82,6 +82,8 @@
 pub mod fwctl;
 #[cfg(CONFIG_GPU_BUDDY = "y")]
 pub mod gpu;
+#[cfg(CONFIG_CRYPTO_HASH2 = "y")]
+pub mod hash;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;
-- 
2.56.0

