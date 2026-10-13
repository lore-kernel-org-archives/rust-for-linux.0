Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F406A4F4745
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892913; cv=none; b=W4o7EU8Pm+kl4zg0qNDKEU6uBmggp//pMs9ukCgx9q8nD+vm7c5RhDtOtnJDYFDjzrIE7VV8s7C5xPlqL2vU9p4d93TSjgQw/Lkhwnmtncjn15boAMBrfT40RfwedNTV9gwENLUtdAROhPRWwO7sUSv1yY2qnHxfhWxThEoXmlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892913; c=relaxed/simple;
	bh=0tQbZbHo8xI21dpA2bFknxB1c/WDEfciyAdGxnoZAag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/BT2rhdyrgYD97c09kQpVQgu6yQtc3dzY6bxPrqcjp518EmO3Gsfm7ldQagEZ8XqS8E6xGehuF0RgVB97rwG9t8ThcAg7JswUuFTVpjXVZvd2PFs7Tp00K/B17MjJ/I+B1Fys1j6nnbwUsI0yH/nTVdnJdJjwZYmGkej/C5keg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=sRq/CfmN; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="sRq/CfmN"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so155569a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1791892911; x=1792497711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
        b=sRq/CfmNUNf+lV5ShcFhNuChrbU0fX5HDyfQJWU+GYn+1ey5XYzE/qVLCW85+fAKg8
         IrcDv3U6GUeklbIU8+mhsf0HInXYEMupR4CZoTWyozrSYW7yDC8JK5CNw2V60GKxHWxB
         aUEAA0IbVhzDiqwDRgz25ge+o4u+UYlQbVUsjQewx5yYqQby5+/Woo11UZmkqmtKPbno
         WyR0YUSnQKTWK2IzAzjwtiVkx+Vd4KWuq6C1vM6HyTn//l3o3K6ep5o5/gfzejuH/5nf
         k5drJI7kdvzcwRNksaG34yHyGa2DcQ5DGQYvyGZIdGKAiIfrZnb04xEtoFyean+GTe4v
         HDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892911; x=1792497711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWz643dbsj/ZlYo+epLXd9Iw2Mt+qid7bAcxch49zgs=;
        b=yui3uM+vtwxsOcs/HjeduVkl9+qGfqt7RyPxOos2jR5ZNMfG+RI9zwGVK95tOEDgO7
         xbGM176KdusnX8xZlReBKQKbMRvgwIMcl6qiickyqm4qgX2jNA8ShIHC/V6AONYiPCae
         tzbptn1FSBk7EYt4fmVixwNcV9XVZ6M/yAN6Om4GN/nzOyvojlZbp2vSfMxQIzRyX736
         y7A5+ncUOfBHXwJMR9hjCxT4DMZEFsF7rZAsyy/ufKp4fmZrG71eJM8gzqglvA/Jj0lB
         fHk9SM2KJgl/T7Xwd9FFDn4KcgNzHjq6iM2NfB+8vVSUJwBrJKDQ0gPt2HNxwJ4WyMSO
         60dQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0VtEkeBIby/3i9Cpg4FxTW+Ll8uZKYzJasd+ISa5I6FjcldxroUURjDy/8h9i5EneBhPUGfmrn0xPlebAMQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdjsvd3dSzPwx5Zi9NmBF+tqeByuipYQArO3e81PzFCnzSF58w
	yYWKmxS+WffMBXRfp4J6BkraqNMbtE6qneFD036sDIi4cWlf02C2AEbVejhW0UfzLQ==
X-Gm-Gg: AYBFou3m05Y8nUZKIUtWjXO0yhrgAKmhqi8/8tMIipLl1qNXmYcmQ+DYGlLRVv5OIA/
	C7qtGFaWDSzwNbeEUAMzSIp2IvjYDRgI1DD1s+vaQdkM6t318tHdIhbc/vK27W0upJeX82XJcA2
	Vc9bK95U0PxFj3v+jR4WCDrv1gSsFQFhmgWVBE4agaVAv+eVyIGl5iQpVCtOGFfj5zwTC4KmiHo
	hJriTRrrH4Zz23UQzWsqpr6SE2oWoASgxmZ1npHgEBsyQXFqnOxi63CZr+CR7zKYOtTfIb7tZ9y
	CAlLxmZsDoFcWKBa0hVUpzY1unJ8Tg/zprTw+MWvot7G99bkUEGq3Wz1CBVihZxlLY9u1mxQsDz
	ioOHMYboy9y2BdgYq8HuA+HeyIbGoP1+m7rwxviaLUFSxXGu1V4/76vBYRDd93qhxCcVmrqXCw7
	9zGNHSdoowIuAHZHU2IxSv02z6fZPCJ2QOiWmpJiWIk96Ez9+PT3liaZwK+G5VfvMIVPy0BSKhk
	x1HoR3KdQ==
X-Received: by 2002:a17:90a:ec87:b0:3ac:5ca:c7a8 with SMTP id 98e67ed59e1d1-3ac05cac819mr3599231a91.60.1791892911131;
        Tue, 13 Oct 2026 05:01:51 -0700 (PDT)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab8a393666sm16566838a91.15.2026.10.13.05.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:01:50 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 13 Oct 2026 17:30:41 +0530
Subject: [PATCH v3 3/7] rust: crc_ccitt: add CRC-CCITT abstraction
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-gb-uart-transport-v3-3-81d0a8a1acf7@beagleboard.org>
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
In-Reply-To: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
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
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=0tQbZbHo8xI21dpA2bFknxB1c/WDEfciyAdGxnoZAag=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBqzh2DrfofpM81AoSaxkGGZjnn4Q2V0WxE8qIBk
 APPhf5gzD2JAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCas4dgwAKCRAFzvXHieVa
 dOA4D/0VHJ8iOhDb6ZudbAvG8SSKJoPnZsKjupZNYhU1O9zbcgvP9F7pUDdfyhIy7tA8scVqYy1
 63jSjAelitNXknjEaK1FnUg5BbRQXNtkpSKN4jY15josP77lepe7nF25CBLhsh3ru4mic1G6ZRc
 Mm0CpZ14mshgbIW0qnK7nwL8PE1h3Vu7dnBgn+6W78l1rsJJjpkk9oiTqklsoYckrngoZ4qO6K4
 BvFgIfOFw7wOb6hP8RjRWkdwBQ8y3sAbhbdwbcyojKJQUwqDBwhaUHJQuMqkoqlS8G1aLODh6YZ
 GLHoNWXvqMJfOZ4tACaNCWVl714mUHmnegxGOYU2HGQBJV6ciDXjB7SXEEAaz/BI2ALmXnJ/52Y
 BOmYFFwojEyO9ZpsNKi1OpZFx2jkRc46o+5wj34VrEQAkpDZZ/Se9jfB9WCTnk7jBzE8tekBbJH
 T0yB9nVZRkP6ZpjGdiBs4APRR7y1aKu3VVh1VNkzsyLZPGhYFFN1ZYSZxNjbrkjkmn7NfnFaXE6
 Bcv8HC+L8RS9LH3fGtZgUdD6NcPbw/PV0x6nvbmcPBYyaOABRznnjo2qd3z4yBgtkzrvQ5aoRlG
 mLxWX6qtx1tPUyKa2kPVX0kumqUyWm6leOnNJxtu0RVYkITHBB0MoHuP/Pr7uty2FU299Ere5F8
 CHtRGnXt0wpHCtw==
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
index 252b6d7ee163..772023e0e5a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7036,6 +7036,7 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-ne
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
index 3791af0aadc7..55d1a2d7655a 100644
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
index f9ef36217bb5..637442761d34 100644
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
2.56.0

