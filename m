Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847551FF7C7
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 02:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782958727; cv=none; b=RXxR1xiK4gj5tE33h3yX9tz/P/addSMN0d49kKRSV+7trjfx9XPfmTB6cvedL3/niZQOVjOKjT+qjnOEk+8eND17sr+gNWuFmJSuT5RcBiSjJ7dfIkLvt8WXk16k0qRk+bbzl19KZuOFsKTXYs3UKdPT/ZGlDwkHwUQiFOQnLLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782958727; c=relaxed/simple;
	bh=u98X9Z9w1c6BzzpQp1M3iN9dahtRBhdFHn6doIpOHb8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m3a/1ZE+nWCTUqKCHT3v3obnjp0A8yFrskK4mElz4PTBinqOusKp4IzJ5VABR4D3Ss+OHiVk4LHXQQfhI0Euv+auLpxRotDQf/0ZHF8bmAiZ3HnMwFqqa6VIbyGwNTN/0cOiLjFsWuFqAuWuJx1UYPUmUVY2xhDX7LJZ2hMc+4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=antoniohickey.com; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antoniohickey.com
Date: Thu, 02 Jul 2026 02:18:31 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Antonio Hickey <contact@antoniohickey.com>
Cc: Antonio Hickey <contact@antoniohickey.com>, Daniel Cote <danielstonecote@gmail.com>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v6 1/2] rust: kernel: create `overflow_assert!` macro
Message-ID: <20260702021811.758731-2-contact@antoniohickey.com>
In-Reply-To: <20260702021811.758731-1-contact@antoniohickey.com>
References: <20260702021811.758731-1-contact@antoniohickey.com>
Feedback-ID: 144211621:user:proton
X-Pm-Message-ID: d39059f06ab5ff992cbddd5fd875d8557c84aed5
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This commit creates a macro for overflow assertions, the use of this
macro will avoid local `#ifdef`s by encapsulating the conditional
behavior (like `#[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]`) to the macro.

In addition this macro allows us to document the intent of the assertion
more clearly.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1159
Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/lib.rs             |  1 +
 rust/kernel/overflow_assert.rs | 43 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 rust/kernel/overflow_assert.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..3a562b517952 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -101,6 +101,7 @@
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
+pub mod overflow_assert;
 pub mod page;
 #[cfg(CONFIG_PCI)]
 pub mod pci;
diff --git a/rust/kernel/overflow_assert.rs b/rust/kernel/overflow_assert.r=
s
new file mode 100644
index 000000000000..e3e822edda73
--- /dev/null
+++ b/rust/kernel/overflow_assert.rs
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Overflow assertion.
+
+/// Asserts that a boolean expression is `true` at runtime if
+/// `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
+///
+/// This will invoke the [`panic!`] macro if the provided
+/// expression cannot be evaluated to `true` at runtime.
+///
+/// This assertion is intended only for extra validation within
+/// builds and environments where panics are acceptable. **Do not
+/// rely on `overflow_assert!` for checks that must *always* execute**
+/// (e.g. to prevent undefined behavior, perform access checks, etc).
+///
+/// # Examples
+///
+/// Basic boolean condition:
+///
+/// ```
+/// let a: u32 =3D 10;
+/// let b: u32 =3D 5;
+/// overflow_assert!(a >=3D b);
+/// ```
+///
+/// A guard before doing a size computation that could overflow:
+///
+/// ```
+/// fn reserve_for_concat(curr: usize, to_add: usize, cap: usize) {
+///     // If enabled, these will catch overflow errors early:
+///     overflow_assert!(curr <=3D cap, "curr=3D{} > cap=3D{}", curr, cap)=
;
+///     overflow_assert!(to_add <=3D cap - curr, "would exceed cap: {}+{} =
> {}", curr, to_add, cap);
+///     // ... then proceed to grow/append
+/// }
+/// ```
+#[macro_export]
+macro_rules! overflow_assert {
+    ($($arg:tt)*) =3D> {
+        if cfg!(CONFIG_RUST_OVERFLOW_CHECKS) {
+            ::core::assert!($($arg)*);
+        }
+    };
+}
--=20
2.54.0


