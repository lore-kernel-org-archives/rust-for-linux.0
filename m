Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE62C0284
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 10:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768646507; cv=none; b=aPG2fFWJb+n4B5BLWh+BuuhAmSMB90k7b53MJklhum7ohZw6+K6C1lCxJkPtHVq1zjqERcu+Bq4uJnL/XRH9WOGpq5Ki8PLt/p47HjgGTngcH6jslr7uM9INtppxZSLaJO4d446qPdXHiTBmZbq/SBG13gYkMJIpKiamo9wbwS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768646507; c=relaxed/simple;
	bh=f2sOJWcAt4FyJS9j4XSBNgftxllz6pUUYQnOdycV+Z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pKdw7wrgB0SiuCBpZXJe4DeKWIZstKEgSz3yWFRz/7+PyXtUbTdsjVv74KI/6WDiYvq4x9Ik4sFoo/pye2E8zrzjN/60IiL2iJjSemDbEwD5cvWb5/8MR2W8c45oiI9/vVRzXUuwspe0sKPKGP9Fgu8MfMwRIqDHNi5u0ph4Uco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxcZKnzt; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxcZKnzt"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso3402988eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 02:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768646505; x=1769251305; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a7vtnvE01iI7v1rBdFNoPep/W+GiXNN2AhrAsd+WetA=;
        b=FxcZKnztbg1fVUWuNsn9GAPT3OblGECQIjJ+/HpZUReqszcHyoVtSHOQTDaJ153Wb1
         dgqF4POl5W0mDKUwDfyv0WY3R2inWVdnPCKWAKR42paraOPP9OrKexbmarYBdiUj+yKj
         d+I+sv98oUr/IF/SwoO+dASQqNUSPAV5ieroXPN4Rm7kqx2BS2kET4HsSRFR2tTr/Jqu
         0pFOWrPBgBdf5ORWmoxTJKY6Otb6ypKfImVTcoztk5ndVdz0YC8T8HDWcfa+0ptG3jUA
         xrNlgcwYMice/tI2YKP9+ZB8ArRBDXdgy1rEeQX541Kvbjaw2vjOr3uSv+7lWzGR1fKH
         N1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768646505; x=1769251305;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7vtnvE01iI7v1rBdFNoPep/W+GiXNN2AhrAsd+WetA=;
        b=NIRUUO6UYku3zuI2hofrLQiQ6YT1vcdkI4XYUoHwT6NzW1njCWZZAJ25vsoccF+rBh
         0LMcs10JSaZX6LHRZEWt/7I/hCzyh5KfAEAN+0O1RtO7o+OMWMBf4rCxx2USAsgCJojY
         jDy+1667QV12d9i1C6n3UV28eH3RqtzdxtOG6+8gFPD7L/jPfa6oyYT01UOdGjgO/frL
         Sy0b1fSwTzZFoOFrpcSmA2KQ7e7Q05ewKS3okaVP9NIdz1Msz2mQ1tMTwgfrz1WDVwUZ
         zCDI+9n2Yk5myVXEkkKJV4lSfMGMrUqeNpNpeArBPFx5k1+dA63VL7tpcl6Gy3rbZZUu
         09fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhL9/ib0O2t2smviku9wXhtOohtck8JH32N7RTBbQSmv5ZSDakPNvxKD5lawdc4Ia4XUsO3J38ug8ZJHvDSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3u4uE0qlIqgZz0BFGvHDK1TZqi8UhCGl+tfVHxImCe593+Kpd
	9qCNYFgNoRAImADOSmGD/cDreufIAuGY+4lbOkwU8rpez7Tu1vm4vJ+/
X-Gm-Gg: AY/fxX5m1rqa0VGR0ztb2VaLFWAAv1O/zGK9NgM/jdeu0Kh/UASc7lf+ov6iwJyWsFs
	L905MQHBT4CkNcVZ+nJuPlp13g+aGrMsLI0TfTVmL/hwxuO44YSvBw+PmMkbSQY7cgobMw3c62y
	4HjeY+1rwoGrP5RMTLw/YUSN2Akg17oeXCyHxwdx2VHvhFMUQtaaixIL4QuSdL90C2IAUEddOYw
	PAP1+RjkHfBsWHcHcoCp4CXSPvlHNCUao8ZMEkz06Z0VhNb3B52f0LIgsPJx6+AoPMEqSkO2HTc
	2qWgn2qWlmg2pp8iejzhkcLlGVQHPtVXdiFo8UzMXFAENOEO/QRWj778Mb6coxkF8XGzL6flxje
	Hxcw+2g35mWNJbL/2eQ2WTWGKqK1cTMKZlER3i0381adeEdlKaMTMa7P3FV6lFbEUltJt+p4h+d
	pggIVafYHFJs0i8Gyjyw==
X-Received: by 2002:a05:7300:3b1a:b0:2ae:581f:ce5 with SMTP id 5a478bee46e88-2b6b3f065a4mr6003602eec.7.1768646504429;
        Sat, 17 Jan 2026 02:41:44 -0800 (PST)
Received: from fedora.local ([2804:d57:4e32:d200:d9b8:e236:f824:3578])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b365516asm5331445eec.26.2026.01.17.02.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 02:41:43 -0800 (PST)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Sat, 17 Jan 2026 07:41:25 -0300
Subject: [PATCH v9] rust: add new macro for common bitflag operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-feat-add-bitmask-macro-v9-1-45ea1f00f846@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFRna2kC/4XRyU7DMBAG4FepfMZoZrwk7on3QBy8jFsL0qAki
 kBV3x2nErQKCsin35I/z3IWIw+FR7HfncXAcxlLf6rBPexEPPrTgWVJNQsCMqBAy8x+kj4lGcr
 U+fFVdj4OvbSadMCosGES9fH7wLl8XOHnl5qPZZz64fP6z4zL7b/kjLKeSIlCDLqx4enQ+fL2G
 PtOLORMdwyZTYYqk1RgH5JPDvKaUTdGI24yaqmmbUJSrD0oXjP6h0Egu8noyjAG45aWamdrxtw
 YBLfJmMq45BADQcNZrxl7Ywi2Z2MrozCHkLGuz/g103wzFhC2Z9MsTZnWE2frMvzaVHvH/DHid
 qkmRPDGtJwY7pnL5fIFoJMgK60CAAA=
X-Change-ID: 20250304-feat-add-bitmask-macro-6424b1c317e2
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org, 
 felipe_life@live.com, linux-kernel@vger.kernel.org, 
 Lyude Paul <lyude@redhat.com>, Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: b4 0.14.2

We have seen a proliferation of mod_whatever::foo::Flags
being defined with essentially the same implementation
for BitAnd, BitOr, contains and etc.

This macro aims to bring a solution for this,
allowing to generate these methods for user-defined structs.
With some use cases in KMS and upcoming GPU drivers.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
Suggested-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
---
Changes in v9:
- Doc: Add file module/file description.
- Link to v8: https://lore.kernel.org/r/20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com

Changes in v8:
- Doc: Fix some terms and improving the macro documentation.
- Link to v7: https://lore.kernel.org/r/20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com

Changes in v7:
- Mask invalid bits: add all_bits mask to preserve only valid bits in Not and BitXor ops.
- Link to v6: https://lore.kernel.org/r/20251205-feat-add-bitmask-macro-v6-1-31fbbf14b15a@gmail.com

Changes in v6:
- New methods: add new methods contains_any and contains_all.
- Link to v5: https://lore.kernel.org/r/20251109-feat-add-bitmask-macro-v5-1-9d911b207ef4@gmail.com

Changes in v5:
- Docs: improve macro documentation.
- Link to v4: https://lore.kernel.org/r/20251026-feat-add-bitmask-macro-v4-1-e1b59b4762bc@gmail.com

Changes in v4:
- Use enum: changed flag type from struct to enum.
- Minor fix: airect casting (flag as $ty) instead of field access (.0).
- Link to v3: https://lore.kernel.org/r/20250411-feat-add-bitmask-macro-v3-1-187bd3e4a03e@gmail.com

Changes in v3:
- New Feat: added support to declare flags inside macro use.
- Minor fixes: used absolute paths to refer to items, fix rustdoc and fix example cases.
- Link to v2: https://lore.kernel.org/r/20250325-feat-add-bitmask-macro-v2-1-d3beabdad90f@gmail.com

Changes in v2:
- rename: change macro and file name to impl_flags.
- negation sign: change char for negation to `!`. 
- transpose docs: add support to transpose user provided docs.
- visibility: add support to use user defined visibility.
- operations: add new operations for flag, 
to support use between bit and bitmap, eg: flag & flags.
- code style: small fixes to remove warnings.
- Link to v1: https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com
---
 rust/kernel/impl_flags.rs | 262 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs        |   2 +
 rust/kernel/prelude.rs    |   1 +
 3 files changed, 265 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
new file mode 100644
index 0000000000000000000000000000000000000000..1441523c6ec4782d242834ec684acdfb9b82de54
--- /dev/null
+++ b/rust/kernel/impl_flags.rs
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bitflag type generator.
+
+/// Common helper for declaring bitflag and bitmask types.
+///
+/// This macro takes as input:
+/// - A struct declaration representing a bitmask type
+///   (e.g., `pub struct Permissions(u32)`).
+/// - An enumeration declaration representing individual bit flags
+///   (e.g., `pub enum Permission { ... }`).
+///
+/// And generates:
+/// - The struct and enum types with appropriate `#[repr]` attributes.
+/// - Implementations of common bitflag operators
+///   ([`::core::ops::BitOr`], [`::core::ops::BitAnd`], etc.).
+/// - Utility methods such as `.contains()` to check flags.
+///
+/// # Examples
+///
+/// Defining and using [`impl_flags!`]:
+///
+/// ```
+/// use kernel::impl_flags;
+///
+/// impl_flags!(
+///     /// Represents multiple permissions.
+///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
+///     pub struct Permissions(u32);
+///
+///     /// Represents a single permission.
+///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+///     pub enum Permission {
+///         Read = 1 << 0,
+///         Write = 1 << 1,
+///         Execute = 1 << 2,
+///     }
+/// );
+///
+/// // Combine multiple permissions using the bitwise OR (`|`) operator.
+/// let mut read_write: Permissions = Permission::Read | Permission::Write;
+/// assert!(read_write.contains(Permission::Read));
+/// assert!(read_write.contains(Permission::Write));
+/// assert!(!read_write.contains(Permission::Execute));
+/// assert!(read_write.contains_any(Permission::Read | Permission::Execute));
+/// assert!(read_write.contains_all(Permission::Read | Permission::Write));
+///
+/// // Using the bitwise OR assignment (`|=`) operator.
+/// read_write |= Permission::Execute;
+/// assert!(read_write.contains(Permission::Execute));
+///
+/// // Masking a permission with the bitwise AND (`&`) operator.
+/// let read_only: Permissions = read_write & Permission::Read;
+/// assert!(read_only.contains(Permission::Read));
+/// assert!(!read_only.contains(Permission::Write));
+///
+/// // Toggling permissions with the bitwise XOR (`^`) operator.
+/// let toggled: Permissions = read_only ^ Permission::Read;
+/// assert!(!toggled.contains(Permission::Read));
+///
+/// // Inverting permissions with the bitwise NOT (`!`) operator.
+/// let negated = !read_only;
+/// assert!(negated.contains(Permission::Write));
+/// assert!(!negated.contains(Permission::Read));
+/// ```
+#[macro_export]
+macro_rules! impl_flags {
+    (
+        $(#[$outer_flags:meta])*
+        $vis_flags:vis struct $flags:ident($ty:ty);
+
+        $(#[$outer_flag:meta])*
+        $vis_flag:vis enum $flag:ident {
+            $(
+                $(#[$inner_flag:meta])*
+                $name:ident = $value:expr
+            ),+ $( , )?
+        }
+    ) => {
+        $(#[$outer_flags])*
+        #[repr(transparent)]
+        $vis_flags struct $flags($ty);
+
+        $(#[$outer_flag])*
+        #[repr($ty)]
+        $vis_flag enum $flag {
+            $(
+                $(#[$inner_flag])*
+                $name = $value
+            ),+
+        }
+
+        impl ::core::convert::From<$flag> for $flags {
+            #[inline]
+            fn from(value: $flag) -> Self {
+                Self(value as $ty)
+            }
+        }
+
+        impl ::core::convert::From<$flags> for $ty {
+            #[inline]
+            fn from(value: $flags) -> Self {
+                value.0
+            }
+        }
+
+        impl ::core::ops::BitOr for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign for $flags {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: Self) {
+                *self = *self | rhs;
+            }
+        }
+
+        impl ::core::ops::BitAnd for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitand(self, rhs: Self) -> Self::Output {
+                Self(self.0 & rhs.0)
+            }
+        }
+
+        impl ::core::ops::BitAndAssign for $flags {
+            #[inline]
+            fn bitand_assign(&mut self, rhs: Self) {
+                *self = *self & rhs;
+            }
+        }
+
+        impl ::core::ops::BitOr<$flag> for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitor(self, rhs: $flag) -> Self::Output {
+                self | Self::from(rhs)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign<$flag> for $flags {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flag) {
+                *self = *self | rhs;
+            }
+        }
+
+        impl ::core::ops::BitAnd<$flag> for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitand(self, rhs: $flag) -> Self::Output {
+                self & Self::from(rhs)
+            }
+        }
+
+        impl ::core::ops::BitAndAssign<$flag> for $flags {
+            #[inline]
+            fn bitand_assign(&mut self, rhs: $flag) {
+                *self = *self & rhs;
+            }
+        }
+
+        impl ::core::ops::BitXor for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitxor(self, rhs: Self) -> Self::Output {
+                Self((self.0 ^ rhs.0) & Self::all_bits())
+            }
+        }
+
+        impl ::core::ops::BitXorAssign for $flags {
+            #[inline]
+            fn bitxor_assign(&mut self, rhs: Self) {
+                *self = *self ^ rhs;
+            }
+        }
+
+        impl ::core::ops::Not for $flags {
+            type Output = Self;
+            #[inline]
+            fn not(self) -> Self::Output {
+                Self((!self.0) & Self::all_bits())
+            }
+        }
+
+        impl ::core::ops::BitOr for $flag {
+            type Output = $flags;
+            #[inline]
+            fn bitor(self, rhs: Self) -> Self::Output {
+                $flags(self as $ty | rhs as $ty)
+            }
+        }
+
+        impl ::core::ops::BitAnd for $flag {
+            type Output = $flags;
+            #[inline]
+            fn bitand(self, rhs: Self) -> Self::Output {
+                $flags(self as $ty & rhs as $ty)
+            }
+        }
+
+        impl ::core::ops::BitXor for $flag {
+            type Output = $flags;
+            #[inline]
+            fn bitxor(self, rhs: Self) -> Self::Output {
+                $flags((self as $ty ^ rhs as $ty) & $flags::all_bits())
+            }
+        }
+
+        impl ::core::ops::Not for $flag {
+            type Output = $flags;
+            #[inline]
+            fn not(self) -> Self::Output {
+                $flags((!(self as $ty)) & $flags::all_bits())
+            }
+        }
+
+        impl ::core::ops::BitXor<$flag> for $flags {
+            type Output = Self;
+            #[inline]
+            fn bitxor(self, rhs: $flag) -> Self::Output {
+                self ^ Self::from(rhs)
+            }
+        }
+
+        impl $flags {
+            /// Returns an empty instance of `type` where no flags are set.
+            #[inline]
+            pub const fn empty() -> Self {
+                Self(0)
+            }
+
+            /// Returns a mask containing all valid flag bits.
+            #[inline]
+            pub const fn all_bits() -> $ty {
+                0 $( | $value )+
+            }
+
+            /// Checks if a specific flag is set.
+            #[inline]
+            pub fn contains(self, flag: $flag) -> bool {
+                (self.0 & flag as $ty) == flag as $ty
+            }
+
+            /// Checks if at least one of the provided flags is set.
+            #[inline]
+            pub fn contains_any(self, flags: $flags) -> bool {
+                (self.0 & flags.0) != 0
+            }
+
+            /// Checks if all of the provided flags are set.
+            #[inline]
+            pub fn contains_all(self, flags: $flags) -> bool {
+                (self.0 & flags.0) == flags.0
+            }
+        }
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 28007be98fbad0e875d7e5345e164e2af2c5da32..57b789315deda3d2fa8961af79cad4462fff7fa8 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -67,6 +67,8 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+#[doc(hidden)]
+pub mod impl_flags;
 pub mod init;
 pub mod io;
 pub mod ioctl;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index baa774a351ceeb995a2a647f78a27b408d9f3834..085f23502544c80c2202eacd18ba190186a74f30 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -27,6 +27,7 @@
 #[doc(no_inline)]
 pub use super::dbg;
 pub use super::fmt;
+pub use super::impl_flags;
 pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
 pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
 

---
base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
change-id: 20250304-feat-add-bitmask-macro-6424b1c317e2

Best regards,
-- 
Filipe Xavier <felipeaggger@gmail.com>

