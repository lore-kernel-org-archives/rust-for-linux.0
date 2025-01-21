Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428181ACA;
	Tue, 21 Jan 2025 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737473455; cv=pass; b=uW9HWPZ4bp0FfCfzlsLgkC/lPOQTDjO3a4cgI3xsayqyfRF7EkhtkXCBTkjgTYwfN2w3YxydDB84vHNULrlYRE/FwvhZkA1zVgfSskMKdXuys9onqNKXcg+XdveDzmS1i+bsXcr/WwNx+/A+dawwnumv/pc0uutxZKKLNd8M6h0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737473455; c=relaxed/simple;
	bh=6u7COiDN1PDbUHT8cjzBrAzLy0jbSBAm1elYtORfbLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E6uEf7T0rI9jUUjmJZtRH9bSr4H/mR5Kn0y/6CWy7+aPj9I2Ihr4zjtrTJvGQMRU7S8L7pqLlVPx9FPd38FnYsb6JvhT2NyeHPEoAIj/VYGAP4d9Jh45uO6GSiQIXLxDrf58BmGq6r6II0gf3yonsfH4Hgkg/FD9BgtGBxyMucI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=YtjR9h/j; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YtjR9h/j"
ARC-Seal: i=1; a=rsa-sha256; t=1737473425; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QAEqAFUk/oXv3A3FdgmAlzJDVsDpvLm4ZpfwGocAY1dELsD0p5t/oUbOE9HCW6A7aKFztHvFk0UTWnOpL/kJn6SuzglgOQssWqOhdqCXBDS2iNXKE5ExlxfVN9c/IeM6koGVBKY6O7ejvea7iqBkYxUnottzzJn0hq/RWsQFpVo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737473425; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TxmnHhrY2TucEEKbiAvpstGm6XtnjfhjBZfuEbv50bM=; 
	b=FJHePXlbP9OxurGAX4meOmyUaKXrEaJXLq1LPO82Wdjc5ttavHfabKUEpEqAhGhRFtJQhcOIEr4SK+ktvQ/tS+yqb9L7uv4oWa1kNFK096BD353uuplFvb5HQ80qQBe69Te3Ou73ppqkgQIh8iwPZK2i9yAFdy+TLS1WuWjSSQk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737473425;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=TxmnHhrY2TucEEKbiAvpstGm6XtnjfhjBZfuEbv50bM=;
	b=YtjR9h/j4jbkmoblYpFKngNqRz3rMEyly4Pppn5Fo284a52Hb7sy9GbDqs/BgYLL
	ybba+aQVu/+IFWgNPMLbAlYFljhRlBjXPaioxTCBqw5wMzIXh6UapdCAGGOai7EXAnZ
	g9Wwpfh/h7cxaKmqKiE8oS8dTbyN3wo4q6EXMxlU=
Received: by mx.zohomail.com with SMTPS id 1737473421893515.5019879031579;
	Tue, 21 Jan 2025 07:30:21 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 21 Jan 2025 12:29:52 -0300
Subject: [PATCH v3] rust: kernel: add support for bits/genmask macros
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-topic-panthor-rs-genmask-v3-1-5c3bdf21ce05@collabora.com>
X-B4-Tracking: v=1; b=H4sIAG+9j2cC/3WNQQqDMBBFryKz7hRNFEtXvUdxMU4nGqpJSERax
 Ls3Fbrs8j3472+QJFpJcC02iLLaZL3LoE8F8EhuELSPzKBKVVel0rj4YBkDuWX0EWPCQdxM6Ym
 Gem5abcTUGvI8RDH2daTvXebRpsXH9/G0qq/9Rev/0VVhhZdG6ZYrU7LQjf00Ue8jndnP0O37/
 gGYIWRAxAAAAA==
X-Change-ID: 20241023-topic-panthor-rs-genmask-fabc573fef43
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

In light of bindgen being unable to generate bindings for macros,
manually define the bit and genmask C macros in Rust.

Bit and genmask are frequently used in drivers, and are simple enough to
just be redefined. Their implementation is also unlikely to ever change.

These macros are converted from their kernel equivalent. Since
genmask_u32 and genmask_u64 are thought to suffice, these two versions
are implemented as const fns instead of declarative macros.

---
Changes in v3:
- Changed from declarative macro to const fn
- Added separate versions for u32 and u64
- Link to v2: https://lore.kernel.org/r/20241024-topic-panthor-rs-genmask-v2-1-85237c1f0cea@collabora.com

Changes in v2:

- Added ticks around `BIT`, and `h >=l` (Thanks, Benno).
- Decided to keep the arguments as `expr`, as I see no issues with that
- Added a proper example, with an assert_eq!() (Thanks, Benno)
- Fixed the condition h <= l, which should be h >= l.
- Checked that the assert for the condition above is described in the
  docs.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/bits.rs | 42 ++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs  |  1 +
 2 files changed, 43 insertions(+)

diff --git a/rust/kernel/bits.rs b/rust/kernel/bits.rs
new file mode 100644
index 0000000000000000000000000000000000000000..32049abd2078525be25b57b8e6b5948d1eecbf9f
--- /dev/null
+++ b/rust/kernel/bits.rs
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bit manipulation macros.
+//!
+//! C header: [`include/linux/bits.h`](srctree/include/linux/bits.h)
+
+/// Produces a literal where bit `n` is set.
+///
+/// Equivalent to the kernel's `BIT` macro.
+pub const fn bit(n: u32) -> u64 {
+    1 << n
+}
+
+/// Create a contiguous bitmask starting at bit position `l` and ending at
+/// position `h`, where `h >= l`.
+///
+/// # Examples
+/// ```
+///     use kernel::bits::genmask_u64;
+///     let mask = genmask_u64(39, 21);
+///     assert_eq!(mask, 0x000000ffffe00000);
+/// ```
+///
+pub const fn genmask_u64(h: u32, l: u32) -> u64 {
+    assert!(h >= l);
+    (!0u64 - (1u64 << l) + 1) & (!0u64 >> (64 - 1 - h))
+}
+
+/// Create a contiguous bitmask starting at bit position `l` and ending at
+/// position `h`, where `h >= l`.
+///
+/// # Examples
+/// ```
+///     use kernel::bits::genmask_u32;
+///     let mask = genmask_u32(9, 0);
+///     assert_eq!(mask, 0x000003ff);
+/// ```
+///
+pub const fn genmask_u32(h: u32, l: u32) -> u32 {
+    assert!(h >= l);
+    (!0u32 - (1u32 << l) + 1) & (!0u32 >> (32 - 1 - h))
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b5f4b3ce6b48203507f89bcc4b0bf7b076be6247..4f256941ac8fbd1263d5c014a0ce2f5ffb9d1849 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -27,6 +27,7 @@
 extern crate self as kernel;
 
 pub mod alloc;
+pub mod bits;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 mod build_assert;

---
base-commit: 91e21479c81dd4e9e22a78d7446f92f6b96a7284
change-id: 20241023-topic-panthor-rs-genmask-fabc573fef43

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

