Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A937DEB8;
	Thu, 19 Mar 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913228; cv=none; b=QJsToUidi11f6rzdb5MabthcCUovAe0JAG5qE4joNTicjHQAP1byEnuvgeqmoW/nwnxmrHHykE0wqNF/Y3sFXGrmdWURu7t1sMPnwpFdtojhuE4X41bBW1UTPX/7vcx7+5Mp2faGM3QIJ4Y5iQokihTb5UsQ4lPM3wMFvWyV5w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913228; c=relaxed/simple;
	bh=wYjlvMETVwDUcB0zijHWhHhAjBYMbGjYwW2LpGaFV5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1mJSHoQ2N/fZqLLf4cU9cBbPp1psjP5gs2UAlLVQxtdY0gw6CMMnf5tbmTagxOwiSkV3LtfVqhMry04ci89VKZOdMOlZiJuC51f0HCDCw0YXtvNXUU0C0/ob6aaGRaM9W5uqLBNafIMzd6jim3hq3TIHcz63r3pwwE4DnfnQuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJry2TSt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJry2TSt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1291AC2BC87;
	Thu, 19 Mar 2026 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913227;
	bh=wYjlvMETVwDUcB0zijHWhHhAjBYMbGjYwW2LpGaFV5c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TJry2TStlQWTBgCyIYA81m3tZTrJgyHvWnqbvvhGDD1SVDvHr4n1+SVinAfwiI7zs
	 kpzU9DTZ4vBGnCHJcOzO5zfzjfkIVMEzgTgjObrGsNj03cVbi1UrFFgXl+uKKixl90
	 oG20mESgLAiaWAS6+rF2CMXk/Hp7s1TnD4V2CqcE+e0tPhV1Jjsk20S0TJSHJlbkIc
	 CbuCryyern6A/8Kyip4vly3swYroAiuykuFKhWAHonx4j5FL9R8kR2nE/3Q6msunD5
	 inVhYq8SmVDcijwmQn6wzv/rUJB98KUnwUcHYdrotxtdmiIq2GH2xRP0WCFqFsUQU5
	 JCm4gwNmxTbeA==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Oleksandr Babak <alexanderbabak@proton.me>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] rust: pin-init: doc: de-clutter documentation with fake-variadics
Date: Thu, 19 Mar 2026 10:35:26 +0100
Message-ID: <20260319093542.3756606-4-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319093542.3756606-1-lossin@kernel.org>
References: <20260319093542.3756606-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently the doc for `Zeroable` and `ZeroableOption` are filled with the
generated impl of tuples and fn pointers. Use the internal
"fake_variadics" feature to improve the rendered quality.

This makes use of an internal feature, however this is of minimal risk as
it's for documentation only, not activated during normal build, gated
behind `USE_RUSTC_FEATURES`, and can be removed at any time. This feature
is already used by serde and bevy to improve documentation quality.

For compilers that cannot use this feature, we still hide most generated
impls, and the existence of them are hinted by doc comments on the single
non-hidden impl.

Signed-off-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/Rust-for-Linux/pin-init/commit/530c4eb79a449599e219821f9397f03250cc2aa4
[ Reordered `#[doc]` attributes and safety comments to avoid errors in
  older versions of clippy. - Benno ]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index a513930ee01a..7e79f75089df 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -276,6 +276,8 @@
     all(feature = "unsafe-pinned", CONFIG_RUSTC_HAS_UNSAFE_PINNED),
     feature(unsafe_pinned)
 )]
+#![cfg_attr(all(USE_RUSTC_FEATURES, doc), allow(internal_features))]
+#![cfg_attr(all(USE_RUSTC_FEATURES, doc), feature(rustdoc_internals))]
 
 use core::{
     cell::UnsafeCell,
@@ -1638,8 +1640,14 @@ macro_rules! impl_zeroable {
 }
 
 macro_rules! impl_tuple_zeroable {
-    ($(,)?) => {};
+    ($first:ident, $(,)?) => {
+        #[cfg_attr(all(USE_RUSTC_FEATURES, doc), doc(fake_variadic))]
+        /// Implemented for tuples up to 10 items long.
+        // SAFETY: All elements are zeroable and padding can be zero.
+        unsafe impl<$first: Zeroable> Zeroable for ($first,) {}
+    };
     ($first:ident, $($t:ident),* $(,)?) => {
+        #[cfg_attr(doc, doc(hidden))]
         // SAFETY: All elements are zeroable and padding can be zero.
         unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($first, $($t),*) {}
         impl_tuple_zeroable!($($t),* ,);
@@ -1654,7 +1662,16 @@ macro_rules! impl_fn_zeroable_option {
         $(impl_fn_zeroable_option!({unsafe extern $abi} $args);)*
     };
     ({$($prefix:tt)*} {$(,)?}) => {};
+    ({$($prefix:tt)*} {$ret:ident, $arg:ident $(,)?}) => {
+        #[cfg_attr(all(USE_RUSTC_FEATURES, doc), doc(fake_variadic))]
+        /// Implemented for function pointers with up to 20 arity.
+        // SAFETY: function pointers are part of the option layout optimization:
+        // <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
+        unsafe impl<$ret, $arg> ZeroableOption for $($prefix)* fn($arg) -> $ret {}
+        impl_fn_zeroable_option!({$($prefix)*} {$arg,});
+    };
     ({$($prefix:tt)*} {$ret:ident, $($rest:ident),* $(,)?}) => {
+        #[cfg_attr(doc, doc(hidden))]
         // SAFETY: function pointers are part of the option layout optimization:
         // <https://doc.rust-lang.org/stable/std/option/index.html#representation>.
         unsafe impl<$ret, $($rest),*> ZeroableOption for $($prefix)* fn($($rest),*) -> $ret {}
-- 
2.53.0

