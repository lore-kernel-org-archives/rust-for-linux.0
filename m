Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C711E5018
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 18:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767291692; cv=none; b=NE/tvE5PMqHZoZKeVGyAx62mIIbzlt/q/OwHAy2k6w8gjCtXY3581vZcv6kDuMEhZmXoKAzkHbrQhw6NRtmBD1dETsjSKrZd1HfKrl3QDcOCIsduON0xTv4XIgEtksU7ReNKhhiaS1W651PzN9YH8raw1Gp3de/OtEYjp5XiB88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767291692; c=relaxed/simple;
	bh=nQYdXPbGUgiCEnAyOPKoVENR05vYc5X1srKvAZ1iuv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hcbZi0UnULF6izdnvFJEunku2SbFvwTe7NsQVks11MoGyZEPFxxyV+ZGE4B6UhV0b065X2d+sC2pv3jkxs044rOfw6efQVyWvhmTxEG/9vxoJGSUlhpoS5Mvmlt3o2w/J1Uaodys39s+yesO+z638NBIEg83IfPqL2WkhHJkRgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWpChwao; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWpChwao"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc0d7255434so6857836a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 10:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767291689; x=1767896489; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqocTB6k9TnZL6o9I1vPjiWfpvxllpgpflej/fz1zF0=;
        b=YWpChwao7OUfHNpmXlQJ6vTpUDiEU0KhUH4cB7VG5DJ28/GazXaXqO52AEGnKn2ff5
         34RBdCEmeFvHxLP3QXby3c1tKq39kULOozZO887WXQEZIMGkSCmmBrATTPcoOdzJEXRD
         KAbVAGF+HRF+QvpAnzy9KcQ3Yijo5V/K/ce8VBp8hAMztyRlLK9hwgjIHssrU4A0GWIs
         KDgq7s9owzp2Bd+bzILRbzJGNHlibAUe7tqaIa/KvlM/Nx7bVEpK3JQeCYxk6YcWDGij
         MyWAeNLe3oKxq0SOOGhxqcdkFcqLG2r2+paPtOT7leWS5P3f28y0Hcs452p97inLFZAj
         atcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767291689; x=1767896489;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqocTB6k9TnZL6o9I1vPjiWfpvxllpgpflej/fz1zF0=;
        b=VMUDpIfDbchQ5rw0AWVF6gIYgyOrxKfoCM6HOb/j3lrKL91Q/cVtBb921gW42aMas6
         JehmlPl5iuYDeWrjwI2jNqOBEeLn5ulPQT0y2KRYv1wJHPIygLdM8GF8Xi9n6ivjNJKk
         0cZKKgRiEmnnInSGVH/1UTYvSIXUkvzMm7yA+vGOR5jK7THlv9YlqtvjOTq9iArUGtsF
         0suIL/I2TJO+8QpWcJACP91L4MnMrcjIl63opcLQiykIv3Sw72Qdi0iO+CUG9T7ptk2m
         ogUbXk9chYlvuxDYgnUUfGVMFP+5thrktlncQma3JMdipEs2HEJYjyYG9R9FCtDLrXfb
         gOBA==
X-Forwarded-Encrypted: i=1; AJvYcCUTO86WvyUlN8sEsRGIfYVyVIDFezmiJdujJjKSrcW+oWyIq0FqpiAbbgc98K3Q5n1LtUpVSrQ51QXR6GmQCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYbt5395WaMPFzd+NyvPL9QsZv5aLpQXCG7ur573jbTIvdrAw
	IhbeU1okRgaShf9eb94CmV9VEBq5/XCWABQItHIYO4Xvh00yeSEgVMAT
X-Gm-Gg: AY/fxX4sbS+XwZN0vMPx4VnN5UKosDgWUFUtoWJw0jyXLq6bt1j+y0Rw7Bfph2gkcq/
	HMhQEBugwC4EJW/5pSw5UEZhSOnk0dttZH8zALO3NagX8RXeNFxJpsngbI0ipTMgzqeJ3NC1wU1
	LrGq8vEci6lWrfj/jYQnEqAz8Bs+vP2bYOlVhaHb2P727du4P1CtHExgxIqH654o17D6hc7Y4z6
	SyrpzPaglO52H0BcCcQXh54nyt8Jatp7iLWcoe47K4xtvaxL0uGxSDUgUMeuMEmvbB9RHkh9+XX
	JVVHR1SUlKg/7VswrH3Ky0dfgSdlpAtT3+LCoTl3MKAxdD34jInNDimEt8vmKxOr+xcDDsjSOm+
	u67T9UvlHPpjEmMTpS5VmUY4OL2Z6nyvpqwfjIAkdW8GLh4IpRbt0vsal22HqnAGHDx7x0UbUQr
	UH2hIQABmcXwtxttiaN8jXDE/67UKg
X-Google-Smtp-Source: AGHT+IHtoDz+rG4Dwbx5AZyJdCKMjAyisGVLQhi/zEggbrwTPy1vUCcJeA5aIWbeKwLgYmOVqz+dEg==
X-Received: by 2002:a05:7022:e88e:b0:119:e55a:9be6 with SMTP id a92af1059eb24-121721aae3bmr36597422c88.2.1767291689051;
        Thu, 01 Jan 2026 10:21:29 -0800 (PST)
Received: from fedora.local ([2804:d57:4e32:d200:d9b8:e236:f824:3578])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfc0esm145898341c88.2.2026.01.01.10.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 10:21:28 -0800 (PST)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Thu, 01 Jan 2026 15:21:16 -0300
Subject: [PATCH v7] rust: add new macro for common bitmap operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
X-B4-Tracking: v=1; b=H4sIABu7VmkC/4XRwWrDMAwG4FcpPs/Dku1k6WnvUXawbLk1W5qRh
 NBR8u5TelhKIAyffoM+WdZdDdwXHtTxcFc9T2Uo3VVC/XJQ8RKuZ9YlSVZo0BtrnM4cRh1S0lT
 GNgyfug2x73Tl0BFECzWjkuLvnnO5PeDTh+RLGcau/3n0mWC5/ZecQMuJmJAiubqi93Mbytdr7
 Fq1kBM+Meh3GRQmWeJAKaTG5C1jV8YB7DJ2ec1bTcmyC8bylnF/DBisdhknDAP5ZhlJJtsyfmX
 ANLuMF6ZJDQChqTm7LVOtDJr9v6mEsZCJMsj6fHhm5nn+BSEH61cfAgAA
X-Change-ID: 20250304-feat-add-bitmask-macro-6424b1c317e2
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org, 
 felipe_life@live.com, linux-kernel@vger.kernel.org, 
 Filipe Xavier <felipeaggger@gmail.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2

We have seen a proliferation of mod_whatever::foo::Flags
being defined with essentially the same implementation
for BitAnd, BitOr, contains and etc.

This macro aims to bring a solution for this,
allowing to generate these methods for user-defined structs.
With some use cases in KMS and upcoming GPU drivers.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
Suggested-by: Lyude Paul <lyude@redhat.com>
---
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
 rust/kernel/impl_flags.rs | 250 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs        |   2 +
 rust/kernel/prelude.rs    |   1 +
 3 files changed, 253 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
new file mode 100644
index 0000000000000000000000000000000000000000..e908142f9a474ed79a5168bad2bcfe2b2e06ee40
--- /dev/null
+++ b/rust/kernel/impl_flags.rs
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/// Common helper for declaring bitflag and bitmask types.
+///
+/// This macro handles:
+/// - A struct representing a bitmask, and an enumerator representing bitflags which
+/// may be used in the aforementioned bitmask.
+/// - Implementations of common bitmap op. ([`::core::ops::BitOr`], [`::core::ops::BitAnd`], etc.).
+/// - Utility methods such as `.contains()` to check flags.
+///
+/// # Examples
+///
+/// Defining and using impl_flags:
+///
+/// ```
+/// use kernel::impl_flags;
+///
+/// impl_flags!(
+///     /// Represents multiple permissions.
+///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
+///     pub struct Permissions(u32);
+///     /// Represents a single permission.
+///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+///     pub enum Permission {
+///         Read    = 1 << 0,
+///         Write   = 1 << 1,
+///         Execute = 1 << 2,
+///     }
+/// );
+///
+/// // Combine multiple permissions using operation OR (`|`).
+/// let read_write: Permissions = Permission::Read | Permission::Write;
+///
+/// assert!(read_write.contains(Permission::Read));
+/// assert!(read_write.contains(Permission::Write));
+/// assert!(!read_write.contains(Permission::Execute));
+/// assert!(read_write.contains_any(Permission::Read | Permission::Execute));
+/// assert!(read_write.contains_all(Permission::Read | Permission::Write));
+///
+/// // Removing a permission with operation AND (`&`).
+/// let read_only: Permissions = read_write & Permission::Read;
+/// assert!(read_only.contains(Permission::Read));
+/// assert!(!read_only.contains(Permission::Write));
+///
+/// // Toggling permissions with XOR (`^`).
+/// let toggled: Permissions = read_only ^ Permission::Read;
+/// assert!(!toggled.contains(Permission::Read));
+///
+/// // Inverting permissions with negation (`!`).
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

