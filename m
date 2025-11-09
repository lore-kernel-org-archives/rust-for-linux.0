Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13DA27280C
	for <rust-for-linux@vger.kernel.org>; Sun,  9 Nov 2025 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762695131; cv=none; b=TSlv8d5mLfXWiDY2TaZ1NYJ6KMUu9F4lS8lRVno3zj/U8DAqsEcmGiIiZ5n1lE4gdy7eq2h07xjv69UL1S/mKRyaGtID1G6UGZOTdtNktbylCVvOnp1n9LzD/rW2LEsTyRVhTwR1lsGMoGmCCzW9jPu4dvH3UlyTFw9BYRjfGgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762695131; c=relaxed/simple;
	bh=aqIN+QVMKY4kIgR52WiwPj/sLpKUNXsLeXvstiFVGJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mr9Lg8KtgZMGWYKLuoBYeag6yQcwM//RsYVlMFIQeympwhIxoxI3T2pC9It5T7kbkV58qnS1KHO6EceoFUhgTiBj0GoP/fApH8qtWmKkskc6sx8AgexUwW8GTDi8b5wkomw8M7Y9ISZ+IXHz06aHd456bFhmKdq1/Kui5mbaWF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFYyE0G+; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFYyE0G+"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-937268fe284so572866241.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Nov 2025 05:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762695127; x=1763299927; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJLQQdNPsU+g+F24sPVT+Pr0SaADBoxPUw3GePaExOE=;
        b=jFYyE0G+jWrvA2L+g6Z6VwUhiJs6YXjR4Rdj+WpryQBPWewylAciaHUAZMr3LDldX8
         hynIh0hlIow36xeAve+tzgQOH5itjP6GMCZUfrmd3MnhAbjn6roWw5wFjI1xGiKibGkr
         Tu7weIgVyQ6VxlwmnI1KaNLcGYPwIAe1KCXmz9Y2Ii2ipIapLBxoXs4mwllzgCmKK7dS
         2b3l94Q4HyYZ5NIIHKabkqkFWtoxe6AlVHZNRIc+kSy36ZVjc8+dHtKXKYll51ZBEWr4
         P8wiFf0MrfPZtgXR+e+UzyhEcyMJKCH8pJj/aSI6qN8vIgHJZmlmLNliHubl1KIizJ6e
         t9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762695127; x=1763299927;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJLQQdNPsU+g+F24sPVT+Pr0SaADBoxPUw3GePaExOE=;
        b=uum0TU9gYruWKg5A2wVXWNL54DT3y7VEEOTLjAW93UAFYYBZVlM3rdkhrxZGfsxQnZ
         OctsgZ9fAv5VMCTd4z+gD6X0g8N7r4tKxFtyCabMGKoLVodlf74TRY44s1zRID6AoMtd
         nHz02gS4UpTsreQHBhG24NzhL1txh6DZ5vI2hQdoZYVcxvFbhotUgt/JjZPNdwroH1Ta
         qYxWs9mNQUfjrpHXXHDJUMtCKZNLGREuOJ1HxdRuDl10+m48WGB/ipUbRpmwo2dYhqrd
         B3OGvFF3YYAcj1C+B5koaNbFNkkv4GQPKDPDvgjXLtMl9Tk5Wd1T9SRj8lM6EVej7WYO
         y/tA==
X-Forwarded-Encrypted: i=1; AJvYcCWgHJtsSMJR2KAUHATqX17n2TNBitxn1eR14GAAevblJeURrtPs+8JdRAIXM3YaHDoDsvTBWzzS70+UG9Bq0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+5kDW+g/I1/RJsIN4Nw32twkhKHa35umfMK/tjJpzKs+8daM
	BLQZvO79NQbF3/ty9Dp1xs2sBPw80o6SxRxcMLw2bRHzjW74hVK9zZtl
X-Gm-Gg: ASbGncuuMOQSgOQqXxXQnZBbMain8RiRycKisYruAl3I3QiqG3sQnSFqth2+fNm+/kc
	ppyW64EoFj+9llUf49no9xZThUp4pry9FRhkT94zY+SuwOm+Kd1U+QTLrZ1AMqxSvlwSmZ5m6ud
	p358dUGriRcATCkDoIfZknBAKlXRx7RZbwqwYiLdE/ebMUad1+wkDqEeS7+JN2Ub/ov2RVpDCQV
	uMiHCnHX98uUIb0o136Nhnme4DeWKmqBqVrK+E5BgZOCAcsYuz79K28CMC65XBZyiWbfvD58mur
	iKjexilKpfRDQJCPmmld0xHrGRwa38Qw2bmu8XCqQNgPonbD0VT6sSeSUIrU6GwfNpBcxfoeJTU
	9nmvBviZpRVosyECQrQAGxW2t6XKQgSkkclp+GZ4vI8RfV2ZOrkwaaWXzIgAXYPFHbbVdWwKRPu
	ezhu9pGpAQORL/Pdyvzg==
X-Google-Smtp-Source: AGHT+IEGdXQokDSSKebUf4lhu1yxr1tCaNhrSjddI7zqj0wqNvjFyLx/rfGteERnW1cF1KocSllPWw==
X-Received: by 2002:a05:6102:358d:b0:5dc:7fe3:1d0 with SMTP id ada2fe7eead31-5ddc46ddcecmr1789460137.19.1762695127443;
        Sun, 09 Nov 2025 05:32:07 -0800 (PST)
Received: from fedora.local ([2804:d57:4e50:a700:f33d:65d1:e22e:109b])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9372a613bd3sm1366632241.1.2025.11.09.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 05:32:06 -0800 (PST)
From: Filipe Xavier <felipeaggger@gmail.com>
Date: Sun, 09 Nov 2025 10:31:41 -0300
Subject: [PATCH v5] rust: add new macro for common bitmap operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-feat-add-bitmask-macro-v5-1-9d911b207ef4@gmail.com>
X-B4-Tracking: v=1; b=H4sIALyXEGkC/4XPwQrCMAwG4FeRnq20abepJ99DPCRtpkW3STuGI
 nt3Ow8qwpCc/kC+JA+ROAZOYrt4iMhDSKFrcyiWC+FO2B5ZBp+zAAWFMsrKmrGX6L2k0DeYzrJ
 BFztZWrCkndEVg8jD18h1uL3g/SHnU0h9F++vPYOeun/JQctcDjyQI1uVtDs2GC4r1zViIgf4Y
 qCYZSAz3hAjefQbVf8y5sNYrWcZM12zrsgbtqgM/zL2zWgF5SxjM8Oais30Uv7smxnH8Qk00NI
 HkQEAAA==
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
 rust/kernel/impl_flags.rs | 229 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs        |   2 +
 rust/kernel/prelude.rs    |   1 +
 3 files changed, 232 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c1086677678408f46c4832e2110c761fab017055
--- /dev/null
+++ b/rust/kernel/impl_flags.rs
@@ -0,0 +1,229 @@
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

