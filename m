Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8662A3064A3
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764929758; cv=none; b=Jqw9RGtVDPpUtdHEep9yqM3VTF/VWqHtLYUEEKSxl5YTzY/BHAXgdWh4veSUcU0sGmESPWFN7/n4T18VSisoW1TM3m3fe3tYu+Mq2vYWJpTpqV6pXK9m+iOF/kVp07n8Oe2dH4j/G3sy5VYe3n417KQelgu5aTMIB5O/Vin66H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764929758; c=relaxed/simple;
	bh=k0KN7P6dl2a6Ne5wdTQhHWK++Hut6FAQmstW/n8LZiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mUYuf3VLkcmdhwL4N6jQpLHr8bhVsYZRQacHLsvgSSCy3WBWSkZQF1APvzNueLLJJZcyZ4K+LmjruGyHzK9njFKb+yXzEad9PV2n5MwqzCvj8v2iGwspvpwx/TLFAEA6Ps6K4XRhF6g+Wz2NBfodr+H3BGxIMs1aBPKVpEpgElg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiL3ywlW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiL3ywlW"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so2269990b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 02:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764929748; x=1765534548; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlCVgLVeA0P6k5Hmt3N5pioJaret9Pyw9mt1Sqene2k=;
        b=BiL3ywlWXoxyijxdaPTh/EsiPD18DMqRbvwPt/S/2aFQP1POe/QHDuDv7n4XxDa44+
         O/yw+aI8GC47zaYcvuIYqnQSCT/TX+19dX+NUjWb+nKU1L1MhI4NXzX0qZ8IaASmAyNP
         VW7LwspUElnqYzjELcOtt/3nkFvXJ2LoHvXrxylTFKBRCnufCF+pMGskCePS3aAcKnpX
         DJtA2Pot9Aq5KaDcDsTDYBlJtVAnuOnFecxwx/4stGY8UkL8hnlIpDYViO2OQk1g+Huk
         Hhab/eUHm9HJRq4yGocmFxHKu2wEl00EpAdD2SItXiQ4JVSAHWYNyx5OgoD3ogyyOnJi
         fV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764929748; x=1765534548;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlCVgLVeA0P6k5Hmt3N5pioJaret9Pyw9mt1Sqene2k=;
        b=CsE+CunzAGMcJgDN15zYY6cpLllcV52E8JEcYPOrUG1Y75nKREBDaHa9H8WgIjCGXl
         pIbTR65qafLMTIVfrrWWSFcQ9beI3CNZcMW+qBueD1SgEOA6IvRTht03Lw/HeW68m58F
         UIt+kH9S+edx4QUvpD1cDamg3RDJeXX3le7Ki1vQ68IXddnFHsL8GypBblSv+idy9U3H
         gR7rdDFzIknMCzw6pLSVuvd0XwX6CAJiTajNd3IFuFX4C/CsQMkuIFplqB/+q9Kez3Iw
         qX5pVAkShFXXiaIUbypYZxEepXe4Qx8xexMXeNVJJ6db6aLzFNQUbLHVeMAmiNBvepmu
         30Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUsYXSM3BroodzFmgrmti9AaP4sq7h62DL3UluKydaFbULzksz8TeldpSBOvs5u5eEs1ECHzCyw1O+1fSe5yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsTSXAmQDKarHsSGp2DlZZwyBW6gWTFlUDuIMrdaj5CFppHB4U
	8V15TrrI3Vzxaqt1/js4y0CM3YL2h1tk+kLWwZtQUw4iFJx5AdRlWbpi
X-Gm-Gg: ASbGncsHoL3Oxsg0rshpMqSHT0oKmFWXFZsONX5ohKOvC9r7gZfOw4AnxdPf14lbR8F
	kq20fO/AKN6JEMngN5++Jlda9K0J/hvM81gKF71/5x098sRpt9tCUVh7CYDGAOkiiZ1qupAvJrn
	xM+Y5l7v6AR3MJ/iVn1mhaF6bAPLMTLE7tsTzx9RJ3Ig6OJ7bUm0vKXf/NmUPYrvVkk96O9y3pT
	Dzseftm6q/6TqIvrC/aViLVW3xd8OPREMZUhPQnBSk4+lCWYejngPS1JHunFYLegrVwvzY+p0PR
	N/PMpi3h9YztWrY0aAhyUU7ykbleqAmkoP7IsqbVe7zSy2lmMqp0WkcveG3jRWx5P8KSLVPyCV4
	q2y7ti5eliSNAQ3gvc6YnVfLn5lSZAuy1vYwDowANBPke/++JxTjibfFaZbhaYncBJgLfcLV3zi
	NvB6ShEGyoBCaZkpA0uA==
X-Google-Smtp-Source: AGHT+IFW3nGKE+9P/dJCZBPsQDlpFpbwat83tGC0IRJ+Y+OxSdTfHHsWmPdzp81Y6y+09+b62j5OMw==
X-Received: by 2002:a05:7023:b87:b0:119:e569:f620 with SMTP id a92af1059eb24-11df0c474efmr7310113c88.25.1764929747459;
        Fri, 05 Dec 2025 02:15:47 -0800 (PST)
Received: from fedora.local ([2804:d57:4e50:a700:f33d:65d1:e22e:109b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2f3csm15252108c88.5.2025.12.05.02.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 02:15:46 -0800 (PST)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Fri, 05 Dec 2025 07:15:17 -0300
Subject: [PATCH v6] rust: add new macro for common bitmap operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-feat-add-bitmask-macro-v6-1-31fbbf14b15a@gmail.com>
X-B4-Tracking: v=1; b=H4sIALSwMmkC/4XPwWrDMAwG4FcpPtfDku1k7qnvMXawbKU1a5pih
 7BR8u5zelhLIAydfoE+SXdROCcu4rC7i8xTKmm41tDsdyKc/fXEMsWaBSq0SisjO/aj9DFKSmP
 vy5fsfciDbAwagqChZRR1+Ja5S98P+OOz5nMq45B/HnsmWLr/khPIWgEjUiDTNnQ89T5d3sLQi
 4Wc8IVBu8lgZaIm9hR9dKpbM/rJGIBNRi/XvLcUNRuvNK8Z88eAwmaTMZVhIOuWl+pna8Y+GVB
 uk7GVcdEBEKqWO/PKzPP8CyKeI3LYAQAA
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
 rust/kernel/impl_flags.rs | 243 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs        |   2 +
 rust/kernel/prelude.rs    |   1 +
 3 files changed, 246 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
new file mode 100644
index 0000000000000000000000000000000000000000..aff6f14bc2f6097e78ba21bb13d124ff999b376a
--- /dev/null
+++ b/rust/kernel/impl_flags.rs
@@ -0,0 +1,243 @@
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
+                Self(self.0 ^ rhs.0)
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
+                Self(!self.0)
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
+                $flags(self as $ty ^ rhs as $ty)
+            }
+        }
+
+        impl ::core::ops::Not for $flag {
+            type Output = $flags;
+            #[inline]
+            fn not(self) -> Self::Output {
+                $flags(!(self as $ty))
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

