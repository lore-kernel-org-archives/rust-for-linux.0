Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D90739E6DF;
	Wed,  7 Jan 2026 16:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803462; cv=none; b=CA6C/uuICfdBR6ZpfzlplBmv0mt2eAwzX7iCEnIRXFjrOa0YTezNEqy/o94vVMEXPimERIvz0I+ZnmRXtsp1Z2IN4tm/mtwsXA76JGjDNqQBQg0n37Jh91OTQyF9VFXWn27xnNVHxYJ+CqAK6kryPeyGeYRwkeGOG5poOLRQO/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803462; c=relaxed/simple;
	bh=Phb544yEWAHBz2Vzze93L2MOMb05V1e2xfsSh4hb1d0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqHfI/4XfHI/B2fPj7GmCtDqBF36CaxY5BJjhQDe3TstJZyPartRe+igEKSuUHm7Hi6Xy1KeU9UfBFj6tMsyZ0p0KRQHEJze1uTqSEsVL+G4t7yahnMyim04KQBb+s+MbNzpR2Onai8rUHEIeJaKGotWF65DEOfHp0g84YNC83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orBft5n6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orBft5n6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D5FC4CEF7;
	Wed,  7 Jan 2026 16:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767803460;
	bh=Phb544yEWAHBz2Vzze93L2MOMb05V1e2xfsSh4hb1d0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=orBft5n6pMHlhEnIP8mfFbf4b8wsYo+XonrA7iHhJqdndOHMbRoGFM4gHpieV9N0r
	 yvEmDdOqcjdGLEOop1aI/Nr+s3TuVBMxBh90Cr35a5P4FdKGJnngkGghtX/apwugg5
	 /8FnmAqpeLgEKa7jiRruxZjNwrUtZK+e695CciwiNG6gcz0s5C0WttZ+4APoGSWrf/
	 BY+vg+7fm3XfIMez7oZLE2EQO+RJUzOevsGgscY/9ExBSgGG9RQLzek3WqF2We1diB
	 amLAOdsMw7Yj7ld3xA+ykqLN+voNQFFu64E4Rkq0B9rdzWw+kNo71HLuYHeih0JE9L
	 DXKeoClY9xGOQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/11] rust: macros: convert `concat_idents!` to use `syn`
Date: Wed,  7 Jan 2026 16:15:46 +0000
Message-ID: <20260107161729.3855851-8-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260107161729.3855851-1-gary@kernel.org>
References: <20260107161729.3855851-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This eliminates the need for `expect_punct` helper.

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/concat_idents.rs | 39 ++++++++++++++++++++++++------------
 rust/macros/helpers.rs       | 14 +------------
 rust/macros/lib.rs           |  4 ++--
 3 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/rust/macros/concat_idents.rs b/rust/macros/concat_idents.rs
index 12cb231c3d715..47b6add378d2c 100644
--- a/rust/macros/concat_idents.rs
+++ b/rust/macros/concat_idents.rs
@@ -1,23 +1,36 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use proc_macro2::{token_stream, Ident, TokenStream, TokenTree};
+use proc_macro2::{
+    Ident,
+    TokenStream,
+    TokenTree, //
+};
+use syn::{
+    parse::{
+        Parse,
+        ParseStream, //
+    },
+    Result,
+    Token, //
+};
 
-use crate::helpers::expect_punct;
+pub(crate) struct Input {
+    a: Ident,
+    _comma: Token![,],
+    b: Ident,
+}
 
-fn expect_ident(it: &mut token_stream::IntoIter) -> Ident {
-    if let Some(TokenTree::Ident(ident)) = it.next() {
-        ident
-    } else {
-        panic!("Expected Ident")
+impl Parse for Input {
+    fn parse(input: ParseStream<'_>) -> Result<Self> {
+        Ok(Self {
+            a: input.parse()?,
+            _comma: input.parse()?,
+            b: input.parse()?,
+        })
     }
 }
 
-pub(crate) fn concat_idents(ts: TokenStream) -> TokenStream {
-    let mut it = ts.into_iter();
-    let a = expect_ident(&mut it);
-    assert_eq!(expect_punct(&mut it), ',');
-    let b = expect_ident(&mut it);
-    assert!(it.next().is_none(), "only two idents can be concatenated");
+pub(crate) fn concat_idents(Input { a, b, .. }: Input) -> TokenStream {
     let res = Ident::new(&format!("{a}{b}"), b.span());
     TokenStream::from_iter([TokenTree::Ident(res)])
 }
diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index 754c827cc21e1..adfa60d8f42d8 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -1,10 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use proc_macro2::{
-    token_stream,
-    TokenStream,
-    TokenTree, //
-};
+use proc_macro2::TokenStream;
 use quote::ToTokens;
 use syn::{
     parse::{
@@ -16,14 +12,6 @@
     Result, //
 };
 
-pub(crate) fn expect_punct(it: &mut token_stream::IntoIter) -> char {
-    if let TokenTree::Punct(punct) = it.next().expect("Reached end of token stream for Punct") {
-        punct.as_char()
-    } else {
-        panic!("Expected Punct");
-    }
-}
-
 /// A string literal that is required to have ASCII value only.
 pub(crate) struct AsciiLitStr(LitStr);
 
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index da8239d2474b6..12467bfc703a8 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -311,8 +311,8 @@ pub fn fmt(input: TokenStream) -> TokenStream {
 /// assert_eq!(BR_OK, binder_driver_return_protocol_BR_OK);
 /// ```
 #[proc_macro]
-pub fn concat_idents(ts: TokenStream) -> TokenStream {
-    concat_idents::concat_idents(ts.into()).into()
+pub fn concat_idents(input: TokenStream) -> TokenStream {
+    concat_idents::concat_idents(parse_macro_input!(input)).into()
 }
 
 /// Paste identifiers together.
-- 
2.51.2

