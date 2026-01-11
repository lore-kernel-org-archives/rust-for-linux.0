Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B27500947
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768138391; cv=none; b=oH8Q22b/ypib2LeIWOQl8yqOuol5ELnA4hZd03fcxXo1KZyWJL43nwebj0FLsp1wytwrTk4KX1UelYvcMxrf5EsHxspezOk4J1GkS46y4LjK2hkxX/TkXGna+6GV6J5Y9Qop/wphJf/aoGbP+vDT4i6zdYAeq4z32ePXtoNm6j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768138391; c=relaxed/simple;
	bh=zKGPumh1zpnXhFLPU75A+eULBMSkRFO4PXGmK8w2/Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gRPgfqbSXhOz11FKSk+2psKPuGRI+KWTl2hjWXdfoov1quXAKFrJtINHxiRG49ftytmmndV4TPXwNay1gzOWLsYBg/6vZi3YCwss1wJFahekscc3kDrTSIx1PmkNWKvElCNV00mbaxw5nPnOLhHFFqekOwMJaK11vGJ5ZlthBF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNze9cE1; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNze9cE1"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b6a66f155so2439059e0c.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768138388; x=1768743188; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/RV6MqXAcCmd2/aOjmIuyONzFDlCm75U4UcQWA77WLk=;
        b=WNze9cE1eeVHtLthmAkf/7C4K0bB9P6EiLiXI/LTlczY2vVn78Trz/cENVcw1/k11J
         lLqfg7Mv2yrErg6OL9bd1KdnmZXNfrthHjJaT6VOMUh9TW052ciRMQ4ooCPy7eHTJC6k
         X9WshHkt0EcsfkBF/3FLhxb5Tx5CeDjAO7OXAARSCjMpbLqaoIi/csPJWDOe5ZccwtB6
         /ydJo5Yg5U2cY8u1Pyz+cfu/mz9c59/9eup2iQvtG+n4edOP/Cvv0jKkirh5IGStSSuP
         Gs1A1qBUxXSXpuYpbnXV41ELTZxSZFDHvwt5vvz55RGng68gEOj6OJUpPmvuQP+YR0Wu
         WEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768138388; x=1768743188;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RV6MqXAcCmd2/aOjmIuyONzFDlCm75U4UcQWA77WLk=;
        b=YkUvMSfW8JCLnGP1kGrgwxuJ6xMQ2iNBb2A8iQdygWPNHqBQb6tDD/K0q8xQSDnT2J
         zBt5jJhXQ02cDxORAsm9Usz7qpzXdTs65cMm7NRO66cX4rJuevllpyGwDJUDH6JoGQ5z
         o1bmbQAl6a+JwEcbGNEtLf3tjXYARDmtBWx7TzJeEIP/pryO/CnJOl3OwS0GmZSiUhiv
         3RbIrnR850WuJANQibU/cLUwo2wJOXTnZ0sUPw1X1jIsMsaOthKWBDAFz01aHyXxG/gK
         odcB6HBWCvTkkljODy3kloP6YYmRoq0EQiyfSahnUmqbkAlnzLVNR4VKiQcYdD17fsPv
         rCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu27IOMFMVcBSbsepvGIKef2Rod84BeOME4b2sZ51iX/njldn7AxpoDbRno1WgsBIyeivC0AP5RWLHYwQVDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5FpqaFmB1V7+ewbFD0kDmKl2nswYkmx3f7jHy6mvhSM+ncajj
	g8i5GHppkve4RjNhcXzES2T9p/r4TeeFjR1TrAWEKreRGjYtdcrrTzCi
X-Gm-Gg: AY/fxX7RzjGWYukWZ0z0gg5RTWVdmdTEmnY8ahM7JsrUy/f8sNk6vwfcsyq7xjrkRd7
	qq/QiMktdnp9iNPr+3oKPmENWGx7DhOxeEJU+Yx55bkgfD5RMEGg2mQGi34U/J1BIiWJ82Qy3pl
	r8CFHD6iXs4xtrpz9prDxkYyNRkZIJojYkALCJL+5/M9hV7OVgV6dzW+yNbnm1GyAN397OJ/ToQ
	r+LLOxbuW2GRM6RagxgYtYc/kNGuTh1ruA3ZOqEGfVn6pwe3Fn37onaWTzJWJGhVc24IwbpPvuX
	vkRW5RNbfmbSKyqbBwx5b0oBrAy5RzsXpssFbHqUh8kaFiTo4XXScAfqhHB21bpQvMt2S770JG6
	r4bGFrx0iqPmRvtiy8QmDSGoMeg2neG35UhF340O6EwBjYISjR/DedkrIMXchEWJ8qgaJ+28y80
	GskbWjof88iXwKdxSo6w==
X-Google-Smtp-Source: AGHT+IFUD5+gfUuzlLnLbDNxhU7AL18xUyRDoisnOWJNdEAvAE+ZaaRFvSvwZ0VK/pvh2j2ee2tT4Q==
X-Received: by 2002:a05:6122:459a:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-56347ffbc74mr5830433e0c.17.1768138388262;
        Sun, 11 Jan 2026 05:33:08 -0800 (PST)
Received: from fedora.local ([2804:d57:4e32:d200:d9b8:e236:f824:3578])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a1ea810sm13961771e0c.5.2026.01.11.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 05:33:07 -0800 (PST)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Sun, 11 Jan 2026 10:32:45 -0300
Subject: [PATCH v8] rust: add new macro for common bitflag operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHymY2kC/4XR20rEMBAG4FdZcm0kMzlt9sr3EC9ymOwG7VbaU
 pSl7266oNVCkFxNYL7kn7mxkYZCIzsdbmyguYylv9bi+HBg8eKvZ+Il1ZqhQC2kUDyTn7hPiYc
 ydX585Z2PQ8+NQhUgSrCErDa/D5TLxx1+fqn1pYxTP3ze35lhvf2XnIHXEzFhiEFZE57OnS9vj
 7Hv2ErO+ItB3WSwMkkG8iH55ETeM3JjFECTketvjjYkScoLSXtG/TAg0DQZVRmCoN0aqSbbM3p
 jQLgmoyvjkgMIKCxltWfMxqBoz8ZURkIOIUNdn/Z7xn4zRoBoz8auofTRI2XjsvizqWVZvgA9Y
 D7hZgIAAA==
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
Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
---
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
 rust/kernel/impl_flags.rs | 260 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs        |   2 +
 rust/kernel/prelude.rs    |   1 +
 3 files changed, 263 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
new file mode 100644
index 0000000000000000000000000000000000000000..0c50b8404fa795926b4c12c21350b611a2a3d149
--- /dev/null
+++ b/rust/kernel/impl_flags.rs
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Common helper for declaring bitflag and bitmask types.
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

