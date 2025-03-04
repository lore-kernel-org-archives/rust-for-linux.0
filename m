Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997062010E3
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741092935; cv=none; b=buwERA2B9ZSiWUDUrsIy5iW2SKszrL3FK8+I+oH/rWP58iFSsQW0WFYib/1m8u9k3hhqOlq/Nk5y81fMCvbwgjJfkPVsut4pwfKRBhZMMw99e7PflQbMxHx76EKaskm9dooFtKXR4EBFWX5QznR+0LVOzDqfwADOX3Cp4qtpmMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741092935; c=relaxed/simple;
	bh=dQaDsWyItVgpiYThT5xd0edfVcWB1LaSGQGSXCvx6xM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dLCkM+GFIMdc+SJiKQVyL90TZNX5chrPMLD8MonTj+kPUG9I3OudZMeSj0nujvoxYrJokjbCFwQh5XAb1AHfUsU1QJdlj89k2uxq8dVIAg4Uw/PaSPVsN1wMs8FBNJN5huGYlREgFg9mvrez9VR58GNvf0OROIOpeyAeAoJhASs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U95QnWFw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U95QnWFw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2237cf6a45dso51547525ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 04:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741092931; x=1741697731; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=voZQ1a2O7HEFkITQtNXpDvi0EHQiBy/WvD54cFY7z8w=;
        b=U95QnWFwIyaQG2hvkEHAhMEuOiySwIy+liR/fSAyx3z4aekIVvzt6daoreh54q9n6I
         svdJFWq05nZ0f7jOH1lLs0fCbU7rctcQqhSkaooWkisku0PT6AlylwDaQV9L30Z+WfCw
         tZ4HD2Z0YabYiUjT9+RPEPTBNLKqEikn5Gfrk+Bw5Fzj6DaB1f5G6yBtlhK1pS6Wflmg
         WEw1AcH8aNPwXmcqAXbDJapZ68MmmxgLmenTPl9MuUIgNXPzbdxRpDeIdZII3dBe/8j6
         x66FHpLTg1ohB+7GpvTVGlYk1KQxrGw9ZHBlaFaMHiS+i8tFYUMN9MGLalO6025MBSDX
         LnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741092931; x=1741697731;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voZQ1a2O7HEFkITQtNXpDvi0EHQiBy/WvD54cFY7z8w=;
        b=HHXyqTj2S4UZftKn1Tl1LkwXkCRG0dexOlYBMGvw9/aepQ2YoSufVxjyVxpynEF/BE
         MkFEcvh7KMnvasFTMF/Rqw2//ekrD+M1tHAswUGJ5BD1B+IbvQk0g/N8WoZZWniJFPbo
         IXwBEMCzRfj8JPFfQ65wSue5LJMga0n2n3nZS+V2SN3u/u2Yn2ttpkA5SMKjDTxMq/uj
         9jeylQewsJ3n8ttIXTBBP5seCOAGGNG19m1ILL75aC+KdbeFnsfXnl1kB6dgRjNMwIzh
         CU6cdetQuhX3ZH3wKTRwvcRFxkYHzw7WygwuPcoedmPUO2UBXXGOfQwWCDPflVCP+5D2
         Uj0w==
X-Forwarded-Encrypted: i=1; AJvYcCX08JZEikgeUvWPtLmeMz9GRC9NfAPCgpVLRjXEFhHSfYL8xoiKchjX5g8s0GTuQfcc2tjlIjSXq2eeoQ1GlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIdPCuHMv5LWInRdsaBd09CzQWIGYhPwW+pYl3Hd87nsWSngTf
	indwNq8ld5JsxXWPM+NKsBApDe5TLVJTIUAeMjd1Kodb/Yy1m0Ju
X-Gm-Gg: ASbGncvpb3goC8TZhazsKnOTyM3WeeKU3hkfoOiU/l+cvD5Nva0fuSFXZ7IIcmCEpcS
	EKHExqbP+pqoz2Yw34B7Jcn+V0ijCVoE6H8OQtUYIZDQrHBfYKiQBU1ZLtlqjbt8DM+DkuZbanD
	srwSaQm+xYMnn6w9wdO/oOgf4nG/kJ7uuSgwxPfbTdPynKV/qU/Yb+uKE2pcWRMP7VR2MOsa5aY
	65LlqvAll0sXxzclf9q0xRkbpioaxdqqWlhzKm0B4Z3ERrzQnlaRki5L+D0w5csZrr57urYQUh1
	/36l2aIKNUQ0geUM+21XopEaVBcnmrWSBeEXf1eJClPA2naU3EGj
X-Google-Smtp-Source: AGHT+IFtp6CDGaLqS/DhfW2v4gOksI/8Sk4zeYHbzfaEd6C34GZ0d42EMvJZdNizN1PPXkqbvra+Kg==
X-Received: by 2002:a17:903:23cf:b0:223:525b:2a7 with SMTP id d9443c01a7336-22368f7b5efmr196754215ad.15.1741092930729;
        Tue, 04 Mar 2025 04:55:30 -0800 (PST)
Received: from fedora.local ([2804:d57:4e50:a700:f33d:65d1:e22e:109b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc495sm94954045ad.174.2025.03.04.04.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:55:30 -0800 (PST)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Tue, 04 Mar 2025 09:55:11 -0300
Subject: [PATCH] rust: add new macro for common bitwise operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC74xmcC/x3MTQqAIBBA4avErBtQs4KuEi1GnWqIftCIILp70
 vJbvPdA4iicoCseiHxJkn3L0GUBfqZtYpSQDUaZWlXK4sh0IoWATs6V0oIr+bhjY4112le6ZQM
 5PiKPcv/jfnjfD5PsFRloAAAA
X-Change-ID: 20250304-feat-add-bitmask-macro-6424b1c317e2
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org, 
 felipe_life@live.com, Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: b4 0.14.2

We have seen a proliferation of mod_whatever::foo::Flags
being defined with essentially the same implementation
for bitAnd, bitOr, contains and etc.

This macro aims to bring a solution for this,
allowing to generate these methods for user-defined structs.
With some use cases in KMS and VideoCodecs.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
---
 rust/kernel/bitmask.rs | 171 +++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   2 +
 rust/kernel/prelude.rs |   1 +
 3 files changed, 174 insertions(+)

diff --git a/rust/kernel/bitmask.rs b/rust/kernel/bitmask.rs
new file mode 100644
index 0000000000000000000000000000000000000000..8d26a541c693a2cb60096059ecb708d895bb3ad1
--- /dev/null
+++ b/rust/kernel/bitmask.rs
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bitmask utilities for working with flags in Rust.
+
+/// Declares a bitmask type with its corresponding flag type.
+///
+/// This macro generates:
+/// - Implementations of common bitwise operations (`BitOr`, `BitAnd`, etc.).
+/// - Utility methods such as `.contains()` to check flags.
+///
+/// # Examples
+///
+/// Defining and using a bitmask:
+/// ```
+/// bitmask!(Permissions, Permission, u32);
+///
+/// // Define some individual permissions
+/// const READ: Permission = Permission(1 << 0);
+/// const WRITE: Permission = Permission(1 << 1);
+/// const EXECUTE: Permission = Permission(1 << 2);
+///
+/// // Combine multiple permissions using bitwise OR (`|`)
+/// let read_write = Permissions::from(READ) | WRITE;
+///
+/// assert!(read_write.contains(READ));   // READ is set
+/// assert!(read_write.contains(WRITE));  // WRITE is set
+/// assert!(!read_write.contains(EXECUTE)); // EXECUTE is not set
+///
+/// // Removing a permission with bitwise AND (`&`)
+/// let read_only = read_write & READ;
+/// assert!(read_only.contains(READ)); // Still has READ
+/// assert!(!read_only.contains(WRITE)); // WRITE was removed
+///
+/// // Toggling permissions with XOR (`^`)
+/// let toggled = read_only ^ Permissions::from(READ);
+/// assert!(!toggled.contains(READ)); // READ was removed
+///
+/// // Inverting permissions with negation (`-`)
+/// let negated = -read_only;
+/// assert!(negated.contains(WRITE)); // Previously unset bits are now set
+/// ```
+#[macro_export]
+macro_rules! bitmask {
+    ($flags:ident, $flag:ident, $ty:ty) => {
+        #[allow(missing_docs)]
+        #[repr(transparent)]
+        #[derive(Copy, Clone, Default, PartialEq, Eq)]
+        pub struct $flags($ty);
+
+        #[allow(missing_docs)]
+        #[derive(Copy, Clone, PartialEq, Eq)]
+        pub struct $flag($ty);
+
+        impl From<$flag> for $flags {
+            #[inline]
+            fn from(value: $flag) -> Self {
+                Self(value.0)
+            }
+        }
+
+        impl From<$flags> for $ty {
+            #[inline]
+            fn from(value: $flags) -> Self {
+                value.0
+            }
+        }
+
+        impl core::ops::BitOr for $flags {
+            type Output = Self;
+
+            #[inline]
+            fn bitor(self, rhs: Self) -> Self::Output {
+                Self(self.0 | rhs.0)
+            }
+        }
+
+        impl core::ops::BitOrAssign for $flags {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: Self) {
+                *self = *self | rhs;
+            }
+        }
+
+        impl core::ops::BitAnd for $flags {
+            type Output = Self;
+
+            #[inline]
+            fn bitand(self, rhs: Self) -> Self::Output {
+                Self(self.0 & rhs.0)
+            }
+        }
+
+        impl core::ops::BitAndAssign for $flags {
+            #[inline]
+            fn bitand_assign(&mut self, rhs: Self) {
+                *self = *self & rhs;
+            }
+        }
+
+        impl core::ops::BitOr<$flag> for $flags {
+            type Output = Self;
+
+            #[inline]
+            fn bitor(self, rhs: $flag) -> Self::Output {
+                self | Self::from(rhs)
+            }
+        }
+
+        impl core::ops::BitOrAssign<$flag> for $flags {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flag) {
+                *self = *self | rhs;
+            }
+        }
+
+        impl core::ops::BitAnd<$flag> for $flags {
+            type Output = Self;
+
+            #[inline]
+            fn bitand(self, rhs: $flag) -> Self::Output {
+                self & Self::from(rhs)
+            }
+        }
+
+        impl core::ops::BitAndAssign<$flag> for $flags {
+            #[inline]
+            fn bitand_assign(&mut self, rhs: $flag) {
+                *self = *self & rhs;
+            }
+        }
+
+        impl core::ops::BitXor for $flags {
+            type Output = Self;
+
+            #[inline]
+            fn bitxor(self, rhs: Self) -> Self::Output {
+                Self(self.0 ^ rhs.0)
+            }
+        }
+
+        impl core::ops::BitXorAssign for $flags {
+            #[inline]
+            fn bitxor_assign(&mut self, rhs: Self) {
+                *self = *self ^ rhs;
+            }
+        }
+
+        impl core::ops::Neg for $flags {
+            type Output = Self;
+
+            #[inline]
+            fn neg(self) -> Self::Output {
+                Self(!self.0)
+            }
+        }
+
+        impl $flags {
+            /// Returns an empty instance of <type> where no flags are set.
+            #[inline]
+            pub const fn empty() -> Self {
+                Self(0)
+            }
+
+            /// Checks if a specific flag is set.
+            #[inline]
+            pub fn contains(self, flag: $flag) -> bool {
+                (self.0 & flag.0) == flag.0
+            }
+        }
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911a9fdbce5d26738b9cf7ef910b269..c4c88b59d2c3d96ce4efd7e610c28211d4691ec3 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -35,6 +35,8 @@
 
 pub use ffi;
 
+pub mod bitmask;
+
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index dde2e0649790ca24e6c347b29465ea0a1c3e503b..2560e92aeed87e69bf0dc7c18abe81c0e45310ca 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -25,6 +25,7 @@
 #[doc(no_inline)]
 pub use super::dbg;
 pub use super::fmt;
+pub use super::bitmask;
 pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
 pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
 

---
base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
change-id: 20250304-feat-add-bitmask-macro-6424b1c317e2

Best regards,
-- 
Filipe Xavier <felipeaggger@gmail.com>

