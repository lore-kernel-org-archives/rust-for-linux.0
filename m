Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A0038FF07;
	Tue, 13 Jan 2026 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309906; cv=none; b=QTVDlDBVh+JQ61aSoSXkrfDSLb/kLCgRgYiF67Zwayn5aG/XPuV8e0N2wg12uuzDES6FHvsUXhzFWBuwTn+aLbPsSktzogZZmP8kdAxNaE94BwWjPMAVc5METvQo4d1HllITbbsFjL4tqRpA0aBaSMNVOCkzimwRJ+Mn97ZvnFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309906; c=relaxed/simple;
	bh=msPLTZduOZx1Gc9Dh4+Dp0XiJhvGPKkqooXFVYCQuTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCoykSn4TGUk9EJr0Uo7d3BaqbxWDUkFHEXsF3AWdGUyXTxzSAXLbIn5HUMki0+TuswEx6j+Vusg7OgP0AL6QWHR3mvMhVCbX5YylzFyE4m2PQcTKOZDR928erdlbZfibDCLOp7HdNsqI2k45Lxw6tn7VO4QWdD1qsXDaTc88Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrvC77vZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrvC77vZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E2BC16AAE;
	Tue, 13 Jan 2026 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768309905;
	bh=msPLTZduOZx1Gc9Dh4+Dp0XiJhvGPKkqooXFVYCQuTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=TrvC77vZGJXDzcFQn3rB7QXflsOID8M5ouwRbRIpGK/Gu8hdKujUiM9GKBn0dgFKU
	 aOFIc6DB8utGLgpbGf0NwIjE7UMjqadRdhCBPZN7rCnMhMT2dhrCLxaqjGgKPDesxE
	 sPis8appenrxl3Hdnd+py29sYO64OiK330lGDmbszn8MbDG4AxPehB7x3surXcpbL4
	 Cp8HQbGlZit4WG/jVaxtDlTFo2PK2Y9RWDuJIv+0qV4LM+Q/vqlmGwIM8EP3U2e2At
	 SiyYwDaVNQd4VGQSSNzWYt3RSIOB86OuynrgT9cWeTZhYZm6/7hPAKkHD/tjVy62OM
	 N5aXyfgaazVag==
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
	Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: macros: support `#[cfg]` properly in `#[vtable]` macro.
Date: Tue, 13 Jan 2026 13:11:25 +0000
Message-ID: <20260113131138.2155899-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <CAJ-ks9=UwOz=-NR0MJ3pjKZNGjb7+3R-shFqYKQF206s5Tp6ew@mail.gmail.com>
References: <CAJ-ks9=UwOz=-NR0MJ3pjKZNGjb7+3R-shFqYKQF206s5Tp6ew@mail.gmail.com>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently, we generate `HAS_` constants as long as the definition exists in
the source, regardless if it is cfg-ed out or not.

Currently, uses of `#[cfg]` present in both trait and impl, so it is not a
problem; however if only the impl side uses `#[cfg]` then `HAS_` constants
will incorrectly be true while it shouldnt't.

With `syn` support, we can now implement `#[cfg]` handling properly by
propagating the `#[cfg]` attributes to the constants.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/helpers.rs |  6 ++++++
 rust/macros/vtable.rs  | 13 ++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index adfa60d8f42d8..11117b4c95d25 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -7,6 +7,7 @@
         Parse,
         ParseStream, //
     },
+    Attribute,
     Error,
     LitStr,
     Result, //
@@ -53,3 +54,8 @@ pub(crate) fn file() -> String {
         proc_macro::Span::call_site().file()
     }
 }
+
+/// Obtain all `#[cfg]` attributes.
+pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> impl Iterator<Item = Attribute> + '_ {
+    attr.iter().filter(|a| a.path().is_ident("cfg")).cloned()
+}
diff --git a/rust/macros/vtable.rs b/rust/macros/vtable.rs
index 72ae0a1816a04..c6510b0c4ea1d 100644
--- a/rust/macros/vtable.rs
+++ b/rust/macros/vtable.rs
@@ -23,7 +23,6 @@
 
 fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
     let mut gen_items = Vec::new();
-    let mut gen_consts = HashSet::new();
 
     gen_items.push(parse_quote! {
          /// A marker to prevent implementors from forgetting to use [`#[vtable]`](vtable)
@@ -38,22 +37,17 @@ fn handle_trait(mut item: ItemTrait) -> Result<ItemTrait> {
                 &format!("HAS_{}", name.to_string().to_uppercase()),
                 name.span(),
             );
-            // Skip if it's declared already -- this can happen if `#[cfg]` is used to selectively
-            // define functions.
-            // FIXME: `#[cfg]` should be copied and propagated to the generated consts.
-            if gen_consts.contains(&gen_const_name) {
-                continue;
-            }
 
             // We don't know on the implementation-site whether a method is required or provided
             // so we have to generate a const for all methods.
+            let cfg_attrs = crate::helpers::gather_cfg_attrs(&fn_item.attrs);
             let comment =
                 format!("Indicates if the `{name}` method is overridden by the implementor.");
             gen_items.push(parse_quote! {
+                #(#cfg_attrs)*
                 #[doc = #comment]
                 const #gen_const_name: bool = false;
             });
-            gen_consts.insert(gen_const_name);
         }
     }
 
@@ -87,10 +81,11 @@ fn handle_impl(mut item: ItemImpl) -> Result<ItemImpl> {
             if defined_consts.contains(&gen_const_name) {
                 continue;
             }
+            let cfg_attrs = crate::helpers::gather_cfg_attrs(&fn_item.attrs);
             gen_items.push(parse_quote! {
+                #(#cfg_attrs)*
                 const #gen_const_name: bool = true;
             });
-            defined_consts.insert(gen_const_name);
         }
     }
 

base-commit: 761e1fbc67b122bfe3d58518a9ea9ee668962c92
-- 
2.51.2

