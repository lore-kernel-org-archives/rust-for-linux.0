Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D483A4267
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817324; cv=none; b=LF5U1JT+LN4FVkaY7bLLRhf+0PzNR6+bB3YHcLogj2YMb+FrKoJTUaZJ3ptIfJ23A4RiyLfW0p1M/PdPmBmbcC+FvkccWIVZHKaHGF3MO2h15Fzl6j4tqLNc1I6fQ6wqmjxruHhTxJxnudwDZEMthoq53Fkky00GM+OmS//NEuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817324; c=relaxed/simple;
	bh=ClTBzeMLVCZZPvnEKAOlUe0dkGyo1RTW3U1pB0pM7aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/vVF4NiFoP2OH8ir1YpRqZutHmlIYh2PjnTFSTr7XOnbliQYx1RvsHkCV/WIBjQj8CN3z0sDOh9AekZfhOn6FUldmy3bDXFl4BMEdfcF4REV3wnnCCxclyr0IyyfSjnxy1hADThEjSg9yoM/UDihw0WnYGBi6alw1rLPmXAYqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=wL8h6XDK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="wL8h6XDK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-85377c8bc96so1837968b3a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 00:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1787817321; x=1788422121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSYOQNfZf8FcKNI6R1tceCkpsnl5HzfVK78BAtVvR3Y=;
        b=wL8h6XDKBAWEcczp0cx1y/Jd+hXsEI/LfGpX2IsWJBzyh9kOMwYcIkkNrqtSH0k8OI
         oZKpgXegMTZDQ8MREU5jRiPXlcSn/UeqYVswvdnOegDTRbmjuR2sZgg1EUKv2+ZuTtbN
         4C3RnT1G+ePUi9IJvNj/pM9OY7WVOyrNpD2y0LA5tM2MRUUyge86dOE2JdQxRDkgTUd6
         2VEZ/dq2vMaAptVRjO+g4NUiw+fmUJy4RyqtWeGAgnvCZmLvBfUHycICXKi8KKbdj8S4
         0O8oSLY3VVOMJuHENm3y9xVcdS05X0MDk7vsWOSKu9icN6YdNANq1ID3TcNMM7oTKs+t
         Qq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817321; x=1788422121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSYOQNfZf8FcKNI6R1tceCkpsnl5HzfVK78BAtVvR3Y=;
        b=brTxnVl23QBTbMxsbxeH3U3yecAjG1Q2OcwmzqM8y7i2yBQcxSHMe1Onw2VL83kXQK
         tFpitQ1wGmQRrm63IOKM4/IXh6b5hSRw2k3zKVoqRIKBu4iR5NB0htbR7fBBK4U0bMm9
         pqUnMdsc6n3oUi90Yk90hGrr5Gt+tzzPNfdQ+kyUNNCSmkwEWL+npi2n+4F6fA8wx0D7
         h5H01xN6q5ZYWGdZcvV1PWPlgBuFpi5TSDKWtaiAOqle2yrDw7h7+3Lo6Mo7BOqvd+45
         avODQtU74jQcXfw2GSsRF5QL0sqJzi1pK7+vRxeCWmDSptddcDurZllfSrlla1E7KyBS
         8DnA==
X-Forwarded-Encrypted: i=1; AHgh+Rq88u7w/TLEKZPflh808xRKdbUbr+m2MfZ/bXj7bsZigU718ey7s0+h2pEUFu6EvxeW0gwDIQF8NdtEbhKK4w==@vger.kernel.org
X-Gm-Message-State: AFuF++mfDhUC9nthQgkrajcWrWW65GZjKHFE/nlyGzpx0NN9WppdxB0k
	m7+Ao3SWQfO5nn5S9FHBrZoyslnLKIg2EKPeJ+lco7nE9wu8kJfXHseFnu1/I20Fnw==
X-Gm-Gg: AR+sD11Xa1Zs/ElEIhj/vRHCS0NzF+5Cf1Br0ezRO6EBVueI3KBDz0OVT6BQtEvXQKI
	tgJ9XI0Ao40bc2QpibCQpiJQMndO6D46xPUMpAZKyHmLiQtnnyFUaMSlETTfhqfCvzK/VE5Qnrv
	slvN93WoMSuzAVko5GGtjo/z1NJ16wT790QN6Go+6kpJObHgDcrJqj4xMrsF/YxQbLVdq0i+bPG
	qmZC43UYFZmHkmC8ZTtq9jnRlfnHN+6J3NpD8WQ6YQyaefr3gw2OorzYRaZvmemDQwDDXM8hSBR
	wAHhVDhP7PnkFwPG7A3vW4ZxVNPu2+5uFpRFzQNta7wx/YEbbKZbAFEI60jk9O5AVmdmXJoeedP
	k6s7mIp6FhMSHxE9UgWNdGqpLbS1TOKlumngPWlRzkldXtkSzU5tQ4I3aUXoBpZhdECQnEw3g3I
	glyLKZe8/ZA/zE4V68QOim1kGZ4ZFjTymy+suvV/NHLlu0+NZ6Tfo9oafjDLCei0qFqayAIMo=
X-Received: by 2002:a05:6a20:9c87:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3cf7596a8cfmr28568140637.2.1787817321526;
        Thu, 27 Aug 2026 00:55:21 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm24641685eec.5.2026.08.27.00.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 00:55:21 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 27 Aug 2026 13:24:39 +0530
Subject: [PATCH v2 3/7] rust: crc_ccitt: add CRC-CCITT abstraction
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-gb-uart-transport-v2-3-a03bb1f5fbd1@beagleboard.org>
References: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
In-Reply-To: <20260827-gb-uart-transport-v2-0-a03bb1f5fbd1@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=ClTBzeMLVCZZPvnEKAOlUe0dkGyo1RTW3U1pB0pM7aw=;
 b=kA0DAAoBBc71x4nlWnQByyZiAGqP7UOhwafQsl81AShgnTC0QQHWk3xXv4lXvWV77VaHiIEbu
 4kCMwQAAQoAHRYhBN/MEx7yTy1lb6UE1gXO9ceJ5Vp0BQJqj+1DAAoJEAXO9ceJ5Vp0TI0QALMs
 iFSdhuNe+KI8MHO+ig1BHNI6WRGwm37HdprL49lEK8+5+BOPXTdaLckb0j245p3EQkufrBcI3ah
 AOni+iXZJcrWicUCIXI69D0m1kqWNOXYGpRP8tmBVNk4C2UOAq+U9dEOXzitxkIWr+8rxxZGkqb
 EoLFrXr80iu+nfpAvpJDfV7s7lNawH3s7wXn3YtmykATL3QPT5FHi/N5vfeN799lRlNmp825gRS
 vVMjrYK5mYADkRBr8rrRPsBzlRKVBb7g+aplq4jYMcCrQUQiGFRIiCuBPB2PfbAp78jjforyV/y
 HPTLPKvDZq57oPIVlsxM5kCefzczxYrSXq0KlwBas5+R7HSlvUjcFOMgq6750dpogEcJUPKt2NR
 xvfwVwrHmdp3gOFbQqXoI15iwB1voXw8mrNJ4NhAL2bIKYfQ0Hv8w2lg0i8RnWJbP9QEKnG56lm
 IWmAzv0wq/CQPwkxrhvgDHnhg+liKmsPJp/1PyV/Dpk42w6EZkmWxL7uPxRiC1o8THNTFO0Jf2r
 QEtCIvhErE0PhmHxM9zEeWn/pS4AO7vxWLs8kbayZ570VH8NIsmtVKZdoY99KAduvdn0nxrXQax
 moU5dgoj/c0UrBOfHdYzN8KZI/nwPg2TShgY2U5yGTycIrF7CCtIPL8YtyGN7Y7En1CH1mZHA7b
 OtGPC
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

The module is gated behind the new RUST_CRC_CCITT_ABSTRACTIONS Kconfig
symbol, which selects CRC_CCITT, so the C library is only built when a
Rust user actually needs it.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 MAINTAINERS                     |  1 +
 lib/crc/Kconfig                 |  7 +++++++
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/crc_ccitt.rs        | 26 ++++++++++++++++++++++++++
 rust/kernel/lib.rs              |  2 ++
 5 files changed, 37 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6008f16ae2ca..1e3b42eff741 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6921,6 +6921,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-ne
 F:	Documentation/staging/crc*
 F:	include/linux/crc*
 F:	lib/crc/
+F:	rust/kernel/crc*
 F:	scripts/gen-crc-consts.py
 
 CREATIVE SB0540
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index 927fc6a6b2b9..628da2d30fc8 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -32,6 +32,13 @@ config CRC_CCITT
 	  The CRC-CCITT library functions.  Select this if your module uses any
 	  of the functions from <linux/crc-ccitt.h>.
 
+config RUST_CRC_CCITT_ABSTRACTIONS
+	bool
+	depends on RUST
+	select CRC_CCITT
+	help
+	  This enables the Rust abstraction for the CRC-CCITT API.
+
 config CRC_ITU_T
 	tristate
 	help
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 24d659a87c1d..6eb3caaee497 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -49,6 +49,7 @@
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
+#include <linux/crc-ccitt.h>
 #include <linux/cred.h>
 #include <linux/debugfs.h>
 #include <linux/device/faux.h>
diff --git a/rust/kernel/crc_ccitt.rs b/rust/kernel/crc_ccitt.rs
new file mode 100644
index 000000000000..6042ada16967
--- /dev/null
+++ b/rust/kernel/crc_ccitt.rs
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! CRC-CCITT computation.
+//!
+//! C header: [`include/linux/crc-ccitt.h`](srctree/include/linux/crc-ccitt.h)
+
+/// Computes the CRC-CCITT of `data`, starting from the seed value `crc`.
+///
+/// Pass the result back in as `crc` to compute the checksum of a buffer
+/// incrementally.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::crc_ccitt::crc_ccitt;
+///
+/// let one_shot = crc_ccitt(0xffff, b"hello world");
+/// let split = crc_ccitt(crc_ccitt(0xffff, b"hello "), b"world");
+/// assert_eq!(one_shot, split);
+/// ```
+#[inline]
+pub fn crc_ccitt(crc: u16, data: &[u8]) -> u16 {
+    // SAFETY: `data.as_ptr()` is valid for reads of `data.len()` bytes for the
+    // duration of the call, since it is derived from a live shared slice.
+    unsafe { bindings::crc_ccitt(crc, data.as_ptr(), data.len()) }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3edc343caba5..45c4f4db51d2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -61,6 +61,8 @@
 #[cfg(CONFIG_CPU_FREQ)]
 pub mod cpufreq;
 pub mod cpumask;
+#[cfg(CONFIG_RUST_CRC_CCITT_ABSTRACTIONS)]
+pub mod crc_ccitt;
 pub mod cred;
 pub mod debugfs;
 pub mod device;

-- 
2.55.0

