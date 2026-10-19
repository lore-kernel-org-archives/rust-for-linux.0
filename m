Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C99349B456;
	Mon, 19 Oct 2026 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407479; cv=none; b=XoMb7CKD2CN3zI+celORp1/hEQqEU2m9MFn2rQvmrsaSmE16ld7+82QE9Yc+zllijOTM+gs+tUrHvS7zYrVlZ966jZU8brsYsxHKAO15yIi0OkcxS80iN1XBElgegydwhqnFMAo0SR5GBk5clnIyA81ndtf9c0Ni38mZdkLFd68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407479; c=relaxed/simple;
	bh=opH950SuKwOKJTrlUbTFeedkdIPWn4W8U1UYKGiUkRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JEu4gxMjlEThQwb5XljCWsr73nl32qUX6LYBooOtZNG5/0h6gki9oqXzlVzb7kPWK/ERVAyppQ68QJUDP/tfVycj+OLQpLKHXeD3/sp4C+hkv+VmV1W3prQri5vu3NHvZEscYd9HuK8xyok3d+b0RFsOpdhSFQbepXL80ido/Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id AC5CA720C634; Mon, 19 Oct 2026 12:57:46 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: num: Add inline annotation to Bounded methods
Date: Mon, 19 Oct 2026 12:57:38 +0200
Message-ID: <20261019105744.2943249-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It was previously generating a ton of very short functions, such as
<<kernel::num::bounded::Bounded<u32, 32>>::shr::<17, 15>> or
<<kernel::num::bounded::Bounded<u16, 16>>::new::<16384>> on use.

These are obviously better inlined, although I wasn’t completely sure
between #[inline] and #[inline(always)], but the former worked fine in
my setup so I went for it, we can always adjust it later.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 rust/kernel/num/bounded.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 0b32f4343922..d3486675046a 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -264,6 +264,7 @@ impl<const N: u32> Bounded<$type, N> {
                 ", 4>::new::<7>();")]
             /// assert_eq!(v.get(), 7);
             /// ```
+            #[inline]
             pub const fn new<const VALUE: $type>() -> Self {
                 // Statically assert that `VALUE` fits within the set number of bits.
                 const_assert!(fits_within!(VALUE, $type, N));
@@ -309,6 +310,7 @@ impl<T, const N: u32> Bounded<T, N>
     /// # Safety
     ///
     /// The caller must ensure that `value` can be represented within `N` bits.
+    #[inline]
     const unsafe fn __new(value: T) -> Self {
         // Enforce the type invariants.
         // `N` cannot be zero.
@@ -350,6 +352,7 @@ impl<T, const N: u32> Bounded<T, N>
     /// let v = Bounded::<i8, 4>::try_new(8);
     /// assert_eq!(v, None);
     /// ```
+    #[inline]
     pub fn try_new(value: T) -> Option<Self> {
         fits_within(value, N).then(|| {
             // SAFETY: `fits_within` confirmed that `value` can be represented within `N` bits.
@@ -412,6 +415,7 @@ pub fn from_expr(expr: T) -> Self {
     /// let v = Bounded::<u32, 4>::new::<7>();
     /// assert_eq!(v.get(), 7u32);
     /// ```
+    #[inline]
     pub const fn get(self) -> T {
         self.0
     }
@@ -430,6 +434,7 @@ pub const fn get(self) -> T {
     /// // The contained values are equal even though `larger_v` has a bigger capacity.
     /// assert_eq!(larger_v, v);
     /// ```
+    #[inline]
     pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
         const_assert!(
             M >= N,
@@ -459,6 +464,7 @@ pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
     /// // ... but doesn't fit within `2` bits.
     /// assert_eq!(v.try_shrink::<2>(), None);
     /// ```
+    #[inline]
     pub fn try_shrink<const M: u32>(self) -> Option<Bounded<T, M>> {
         Bounded::<T, M>::try_new(self.get())
     }
@@ -482,6 +488,7 @@ pub fn try_shrink<const M: u32>(self) -> Option<Bounded<T, M>> {
     /// // This won't build: a `u8` is smaller than the required 12 bits.
     /// // let _: Bounded<u8, 12> = v.cast();
     /// ```
+    #[inline]
     pub fn cast<U>(self) -> Bounded<U, N>
     where
         U: TryFrom<T> + Integer,
@@ -510,6 +517,7 @@ pub fn cast<U>(self) -> Bounded<U, N>
     ///
     /// assert_eq!(v_shifted.get(), 0xff);
     /// ```
+    #[inline]
     pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
         const_assert!(SHIFT < T::BITS);
         const_assert!(RES + SHIFT >= N);
@@ -563,6 +571,7 @@ pub fn shr_exact<const SHIFT: u32, const RES: u32>(self) -> Option<Bounded<T, RE
     ///
     /// assert_eq!(v_shifted.get(), 0xff00);
     /// ```
+    #[inline]
     pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES> {
         const_assert!(RES >= N + SHIFT);
 

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.56.0

