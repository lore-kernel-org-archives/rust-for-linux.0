Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CFD3B14DC;
	Fri,  5 Jun 2026 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664705; cv=none; b=AhMoSlE6UMb0J8fJ1fOCLwSmuoWTcbL5+NnJ/ngko+c5/LTJO2CQ+/gnDN4e1kC8+sdhGus8Il0rkQgc5gkE6YVMQt2Aqo+7JekG6AEWYPfqDCiyqdVzDxVayQiYsCnL/1Fdry/1xTpA6xnT4GxaJrQJPcoky43w4OGsrK/An48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664705; c=relaxed/simple;
	bh=ioMw3xPGSMtDGXeeXbbiCBXt5yGAIRMASDj8ubWaMeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWrHsF1uCnbagYTLSn1MvybpLJYpe+pTFxS2/o5cTKPXPXTOo1KdcWVQ6aoNriBt70+LeiZSLfxH7UR9HKHd1LqYl+I/WVnCiwFCYPjBgU9NJ3QkbmivsCERmqb4oJQ4tp3nULX5wKuSA95v4d3SF2ucGakY/2Guk8aptELzUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxiVQDvI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxiVQDvI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016E41F0089A;
	Fri,  5 Jun 2026 13:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780664703;
	bh=Odg6jQOIPJGRNnkKjmmS4IoAqIuyjP6bRgIbkVWP8WM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BxiVQDvIHPhR7jGy3urehVvP/UBfpbOxgCeGuU13XlJuw4Hmx8ADtZklmnt5vjwN4
	 7BO0P7+szIxIZD+iFkYMGFZy9ifZlNM8DnnXcVfoiLkRWxYdk5HQiY0X7K9dmnNPWJ
	 9TTaftf7RBz8NqPqCJIjLknFY8IwHKpv/RS3QMbrLTWgUXFVEQqqYKDitchBwoXcof
	 /uqwb0PANeeUhvW3UaVLQzmuShK0+DIkR+OWgNrIBrxG416CGm2L69fpckBbwjmKVb
	 BE+gU83ZV/gh4GV6cGXzP9WYXmzTmH7LiIvZpC0qS0b+V6IXS5BxSC9CgdTBvKQ3aO
	 oIHssDXRKNqiQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 15:04:38 +0200
Subject: [PATCH v2 1/2] rust: impl_flags: add conversion functions
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-impl-flags-additions-v2-1-0d27242f460b@kernel.org>
References: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org>
In-Reply-To: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ioMw3xPGSMtDGXeeXbbiCBXt5yGAIRMASDj8ubWaMeM=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIslnAcmiQK04rwXfchu57Cxi5cKsxAWbbHkIt
 qkOkJe0VkCJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLJZwAKCRD6UCkIqsW9
 0MtQD/9KJ31whqzYpkryipluRwxxZV2IlfYh39WLBY4dBcMJ4s9fM6wceppcdy1NYJGefFXEXGF
 2EYVX656D7psoc1+TyeYVsDxOyRG48U09FTxJgSIMFOHsYZHMIzF0g5y3HBgPCXK9pYMF4j6Ffk
 mwgW7NfNHhzVD5KUtW9ACYGWjEOHBVy9aDzxYxuyrPLrxpyJM/dmY+T5hU/21chRgxEVsxu7xr3
 0EyGyHV3Et6yUvB40kB5ZwgT5TgaliqhUiT11kcM1v/QiFpBl780qQ6sJtSe2XmMHsdayZUVjbW
 g+O60ewOUUFmcXNJC+EdtRC3GPMn50Yh+eJWPyuufw2ynaGo+edWaa8OcViUGUDmsd/9rqqNhgK
 KryU6SktdRgI2b4yCJB5kt4zua/iQ9LR8u+nxSYcn52/V+4Vn9vo7BxAf1/xa02ghGb6r1mh2Ub
 kbwg21t0gF1Oaw9f2owcXDttTkQTGeLxgTJPvL71EdZ8fQuBVFV+k7Qr0JDCACpstgduqjDtITR
 5tVxOOXw9RQHzAfWmGCN6nGJypDS5ab4uea5o3AE/tFEs7FlpEDECW3btgVRVu8aP1snEL92R04
 +WzIp45ja9wpwztNhYdjAHe+BNaXiR4rHV/Ts4+NbTREjRE5FDxubo4tn8p4gWjOt9McNpPi+yz
 ZYXOGSaU38uk/Og==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add two conversion functions to the `impl_flags!` macro:

 - A `From<_>` implementation to convert from the flag value enum to
   underlying type.

 - A `TryFrom<_> implementation to convert from the underlying
   representation to flag container type.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/impl_flags.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index 1d39d54540dc..04a4b0a356df 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -77,6 +77,17 @@
 /// // representation — useful for passing the value to a C API.
 /// let raw: u32 = read_only.bits();
 /// assert_eq!(raw, Permission::Read as u32);
+///
+/// // Convert a single flag value to its underlying integer representation.
+/// let raw_read: u32 = Permission::Read.into();
+/// assert_eq!(raw_read, Permission::Read as u32);
+///
+/// // Construct a `Permissions` value from a raw integer. `TryFrom` rejects
+/// // integers whose set bits do not all correspond to declared flags.
+/// let parsed = Permissions::try_from(raw_read | Permission::Write as u32).unwrap();
+/// assert!(parsed.contains(Permission::Read));
+/// assert!(parsed.contains(Permission::Write));
+/// assert!(Permissions::try_from(1 << 7).is_err());
 /// ```
 #[macro_export]
 macro_rules! impl_flags {
@@ -119,6 +130,26 @@ fn from(value: $flags) -> Self {
             }
         }
 
+        impl ::core::convert::From<$flag> for $ty {
+            #[inline]
+            fn from(value: $flag) -> Self {
+                value as Self
+            }
+        }
+
+        impl ::core::convert::TryFrom<$ty> for $flags {
+            type Error = ::kernel::error::Error;
+
+            #[inline]
+            fn try_from(value: $ty) -> Result<Self, Self::Error> {
+                if value & !$flags::all_bits() != 0 {
+                    return Err(::kernel::error::code::EINVAL);
+                }
+
+                Ok(Self(value))
+            }
+        }
+
         impl ::core::ops::BitOr for $flags {
             type Output = Self;
             #[inline]

-- 
2.51.2


