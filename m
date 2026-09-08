Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD525C818;
	Tue,  8 Sep 2026 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788842433; cv=none; b=cjvizquNBjNRtiizXhVKGLX9/Y1E56eNjwCovSRnI3sKaCfsnj+dXuXdNfk7mHirLw1/g7JrkKs72pOdiTdKn7r8WPjDfSa21nUiA9gsY3hbFvG6eTGeZXLnHsf4Vt64GS/DvtkUhCzUSxZy866KlPoRvtiuZpBBDOb4wPUuTOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788842433; c=relaxed/simple;
	bh=uqWZN4R2OQIxsNEBMPRafa6W6zRwfZek/mynQtOCEA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nihA8MhjQLmJEDNZsOgCHFStSmgyI7IaG1A4QXke2CZLIFzM41f9UGZDY8vPm0Qchs9ZPK+9hzmqxttO6QHd+kET/LkErRQ5Ug6pHbFi/G27XjIATu+80Q2tA+x3IkCYh1E8GWp4lar6V6nHrerIsBlg+iESJxzk85iFfySv0x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCsyh3mR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCsyh3mR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7992BC2BCB8;
	Tue,  8 Sep 2026 04:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788842432;
	bh=uqWZN4R2OQIxsNEBMPRafa6W6zRwfZek/mynQtOCEA4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LCsyh3mR1hfDAOjU1WMB7FEjgS++EamQ0Y74HnY/nzYSU72c0foU4ioCj92PnjKD6
	 q+DLWrcz4VDGxWct9sC/uaguSOmzn6sxaCrSn8KGfTE5G9yf6eohG+2CktwQKoRPsJ
	 oVm0eTYLkMxV+i6aukfrC6VHgnnayLRmoiNYJyPfVoP/WM9BIMtd2lGWKbPt3uBCNo
	 LIkwC/vubO3nRoQCI2F08q9mTBZW4Tn1gqqc4aPi6osLs9v9/z+IwuJqEALANQoXou
	 7ogVm6KUFiB4fciq3KVh+MG3xUJualjUnHiOaY5M4kBbG0cRjMbU/uXkIP/xdSE+GD
	 YulI/wF/JZ7xQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534F4C79F9E;
	Tue,  8 Sep 2026 04:40:32 +0000 (UTC)
From: Younes Akhouayri via B4 Relay <devnull+git.younes.io@kernel.org>
Date: Tue, 08 Sep 2026 06:39:59 +0200
Subject: [PATCH v2] rust: num: document why Integer is sealed
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-docs-rust-num-integer-sealing-safety-v2-1-e8c65234db82@younes.io>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQ6CMBCFr2K6drQUBerKexgWpQwwRlvTKURCu
 Lv8nMDlN3nzvTcJxkDI4naYRMCBmLxbQB0PwnbGtQhULyyUVJnUMoPaW4bQcwTXv4FcxBYDMJo
 XuRbYNBhHSI1EpbPc6EshFtUnYEPfreZR7sx99UQbV/eaqAwjVME4260nH6gld9569s8l0xFHH
 8Zt65Csrj9nDQkkkBfymqc6SaWy99H3DvlEXpTzPP8ACs769g4BAAA=
X-Change-ID: 20260906-docs-rust-num-integer-sealing-safety-3a0e2967a948
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Younes Akhouayri <git@younes.io>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788842431; l=9303;
 i=git@younes.io; s=20260712; h=from:subject:message-id;
 bh=Npbz8G8u3MVnEdlz8DnebUk4PDv4U212b+94+h5OrC8=;
 b=YiE7+5KB3cJuv28DOLy2HKRm0h7SC4WELGqi/f/u/IiYFHrwmNsGWOFhSzEjq1n8TmG+2JXrK
 u5Pzyk1ks7LB0ZGHUXoNxR29fIMrlQfGXlEQit9qNh6zGQqiCpfox7b
X-Developer-Key: i=git@younes.io; a=ed25519;
 pk=1DRfzPrQ04RQHHgGK28t+vjIAPv5oISPiAdLMU6J5dE=
X-Endpoint-Received: by B4 Relay for git@younes.io/20260712 with
 auth_id=866
X-Original-From: Younes Akhouayri <git@younes.io>
Reply-To: git@younes.io

From: Younes Akhouayri <git@younes.io>

Bounded relies on Integer implementations to provide primitive integer
semantics. Unsafe blocks use those semantics to justify unchecked
construction and conversion, but their safety comments do not say why a
safe trait may be trusted.

Document the seal at those safety comments and next to the private
supertrait.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/all/CANiq72m8kycbfQ1teyne-OtB5d5TsUcX_WW0FCkWB3Ayyg-qWw@mail.gmail.com/
Link: https://lore.kernel.org/all/DL88SQWYU15W.2CVZB5NVSSJGK@garyguo.net/
Link: https://lore.kernel.org/all/CANiq72kx-YPPEruOFdu-Dp7GX+8=Et6svG+sQtqEmmF7kpnVyQ@mail.gmail.com/
Signed-off-by: Younes Akhouayri <git@younes.io>
---
Changes in v2:
- Shorten the comment explaining why `Integer` is sealed.
- Mention the seal in the `SAFETY` comments that rely on it.
- Link to v1: https://patch.msgid.link/20260906-docs-rust-num-integer-sealing-safety-v1-1-78057391302c@younes.io

To: Alexandre Courbot <acourbot@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
To: Tamir Duberstein <tamird@kernel.org>
To: Onur Özkan <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 rust/kernel/num.rs         |  1 +
 rust/kernel/num/bounded.rs | 48 ++++++++++++++++++++++++++--------------------
 2 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
index de589792a77a..0449e84a384a 100644
--- a/rust/kernel/num.rs
+++ b/rust/kernel/num.rs
@@ -21,6 +21,7 @@ pub trait Sealed {}
 
 /// Describes core properties of integer types.
 pub trait Integer:
+    // Sealed so that unsafe code can rely on the correctness of its implementations.
     private::Sealed
     + Sized
     + Copy
diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 2a2b0a4bca5e..1a3f369cd886 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -336,7 +336,8 @@ impl<T, const N: u32> Bounded<T, N>
     /// ```
     pub fn try_new(value: T) -> Option<Self> {
         fits_within(value, N).then(|| {
-            // SAFETY: `fits_within` confirmed that `value` can be represented within `N` bits.
+            // SAFETY: `Integer` is sealed, so `fits_within` has primitive integer semantics and
+            // confirmed that `value` can be represented within `N` bits.
             unsafe { Self::__new(value) }
         })
     }
@@ -379,7 +380,8 @@ pub fn from_expr(expr: T) -> Self {
             "Requested value larger than maximal representable value."
         );
 
-        // SAFETY: `fits_within` confirmed that `expr` can be represented within `N` bits.
+        // SAFETY: `Integer` is sealed, so `fits_within` has primitive integer semantics and
+        // confirmed that `expr` can be represented within `N` bits.
         unsafe { Self::__new(expr) }
     }
 
@@ -420,8 +422,8 @@ pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
             "Requested number of bits is less than the current representation."
         );
 
-        // SAFETY: The value did fit within `N` bits, so it will all the more fit within
-        // the larger `M` bits.
+        // SAFETY: `Integer` is sealed, so the `Bounded` invariant can be relied upon. The value
+        // did fit within `N` bits, so it will all the more fit within the larger `M` bits.
         unsafe { Bounded::__new(self.0) }
     }
 
@@ -472,12 +474,13 @@ pub fn cast<U>(self) -> Bounded<U, N>
         T: Integer,
         U: Integer<Signedness = T::Signedness>,
     {
-        // SAFETY: The converted value is represented using `N` bits, `U` can contain `N` bits, and
-        // `U` and `T` have the same sign, hence this conversion cannot fail.
+        // SAFETY: `Integer` is sealed, so the bit widths and signedness are correct. The converted
+        // value is represented using `N` bits, `U` can contain `N` bits, and `U` and `T` have the
+        // same sign, hence this conversion cannot fail.
         let value = unsafe { U::try_from(self.get()).unwrap_unchecked() };
 
-        // SAFETY: Although the backing type has changed, the value is still represented within
-        // `N` bits, and with the same signedness.
+        // SAFETY: `Integer` is sealed, so the signedness is correct. Although the backing type has
+        // changed, the value is still represented within `N` bits, and with the same signedness.
         unsafe { Bounded::__new(value) }
     }
 
@@ -498,8 +501,9 @@ pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
         const_assert!(SHIFT < T::BITS);
         const_assert!(RES + SHIFT >= N);
 
-        // SAFETY: We shift the value right by `SHIFT`, reducing the number of bits needed to
-        // represent the shifted value by as much, and just asserted that `RES >= N - SHIFT`.
+        // SAFETY: `Integer` is sealed, so the shift has primitive integer semantics. We reduce the
+        // number of bits needed to represent the shifted value by `SHIFT`, and just asserted that
+        // `RES >= N - SHIFT`.
         unsafe { Bounded::__new(self.0 >> SHIFT) }
     }
 
@@ -550,8 +554,9 @@ pub fn shr_exact<const SHIFT: u32, const RES: u32>(self) -> Option<Bounded<T, RE
     pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
         const_assert!(RES >= N + SHIFT);
 
-        // SAFETY: We shift the value left by `SHIFT`, augmenting the number of bits needed to
-        // represent the shifted value by as much, and just asserted that `RES >= N + SHIFT`.
+        // SAFETY: `Integer` is sealed, so the shift has primitive integer semantics. We augment
+        // the number of bits needed to represent the shifted value by `SHIFT`, and just asserted
+        // that `RES >= N + SHIFT`.
         unsafe { Bounded::__new(self.0 << SHIFT) }
     }
 }
@@ -565,8 +570,8 @@ impl<T, const N: u32> Deref for Bounded<T, N>
     fn deref(&self) -> &Self::Target {
         // Enforce the invariant to inform the compiler of the bounds of the value.
         if !fits_within(self.0, N) {
-            // SAFETY: Per the `Bounded` invariants, `fits_within` can never return `false` on the
-            // value of a valid instance.
+            // SAFETY: `Integer` is sealed, so `fits_within` has primitive integer semantics. Per
+            // the `Bounded` invariants, it cannot return `false` on the value of a valid instance.
             unsafe { core::hint::unreachable_unchecked() }
         }
 
@@ -1028,8 +1033,9 @@ impl<T, const N: u32> From<$type> for Bounded<T, N>
             Self: AtLeastXBits<{ <$type as Integer>::BITS as usize }>,
         {
             fn from(value: $type) -> Self {
-                // SAFETY: The trait bound on `Self` guarantees that `N` bits is
-                // enough to hold any value of the source type.
+                // SAFETY: `Integer` is sealed, so the bit widths and signedness are correct. The
+                // trait bound on `Self` guarantees that `N` bits is enough to hold any value of
+                // the source type.
                 unsafe { Self::__new(T::from(value)) }
             }
         }
@@ -1104,9 +1110,9 @@ impl<T, const N: u32> From<Bounded<T, N>> for $type
             Bounded<T, N>: FitsInXBits<{ <$type as Integer>::BITS as usize }>,
         {
             fn from(value: Bounded<T, N>) -> $type {
-                // SAFETY: The trait bound on `Bounded` ensures that any value it holds (which
-                // is constrained to `N` bits) can fit into the destination type, so this
-                // conversion cannot fail.
+                // SAFETY: `Integer` is sealed, so the bit widths and signedness are correct. The
+                // trait bound on `Bounded` ensures that any value it holds (which is constrained
+                // to `N` bits) can fit into the destination type, so this conversion cannot fail.
                 unsafe { <$type>::try_from(value.get()).unwrap_unchecked() }
             }
         }
@@ -1137,8 +1143,8 @@ impl<T, const N: u32> From<bool> for Bounded<T, N>
     T: Integer<Signedness = Unsigned> + From<bool>,
 {
     fn from(value: bool) -> Self {
-        // SAFETY: A boolean is represented by `0` or `1`, so it fits within any valid unsigned
-        // `Bounded` width.
+        // SAFETY: `Integer` is sealed, so `T` is a primitive unsigned integer. A boolean is
+        // represented by `0` or `1`, so it fits within any valid unsigned `Bounded` width.
         unsafe { Self::__new(T::from(value)) }
     }
 }

---
base-commit: c6709d5e14072d0e3d02f291daee46a199e5dad3
change-id: 20260906-docs-rust-num-integer-sealing-safety-3a0e2967a948

Best regards,
--  
Younes Akhouayri <git@younes.io>


