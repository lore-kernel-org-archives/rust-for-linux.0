Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959042512C8;
	Tue, 13 Jan 2026 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323939; cv=none; b=hFWXQ1ZNAa6iHjSrNtX37HgzdEe5bqEoyeoO0HJWHxWZuqP+1FTd802Lup0DuavRwwvzkIMEkAU6Bo/Qjd1I54doKmCdWGtQBlQGhIicAbc/6pyva0FBVNqtk9USeRmEN8ZMpWvspXDKg/1HfqtY+rDUvW7fVx/C/vbSLQWb5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323939; c=relaxed/simple;
	bh=TYrgBJFaZ8sFQy9XsEl3LuP2n2M9Br7WYDbF0l/uawQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhSVh4RJ+XrTD80kFvG77N0c7auKtfiK1ruWBcmrG5vIvMjlYZLvMTnA6Iy0j+dU7plmVlOop99Jk61CXyUNdcG6UODtdZltgf9midzro4cqy9CTzQPywcVmZG5lt9svU6thySMh2QZZ5Iv8XgLDT8UhyNb8Crvjnwg3brNijz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiBSFvQQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiBSFvQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1695C19422;
	Tue, 13 Jan 2026 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768323939;
	bh=TYrgBJFaZ8sFQy9XsEl3LuP2n2M9Br7WYDbF0l/uawQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=BiBSFvQQMPMJ9Kc7qXct85UNvIOAU8Kffdl0zeSgUd4MQrYgbIKKG8Bz9GCIraskH
	 iSZfwG9YTVSRYAu7xKW6ZtoRHgcsoWWq7aonwGmQcurzx8V6kIYXM0pp6j8fZifGOW
	 OXIhyGMzklCxfNFJs7osmT95r9BwZSinxtRUDvnJoPnHOUtcTXWO42yUwHhbKLCBi2
	 pCaK6KGfdBqASL5/GPT/4rkGRl4o6xrw2+s34w9XAOaGuiPDZzUdiIUqfvW5mSICbV
	 Eo8Dbs3aRGEuT61CvPSOZlBzy0kPRF+xngjXSfyeyhk3p23mURqcOglTp32o9ei6kJ
	 E+qlrX2RwFH+Q==
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
Subject: [PATCH v2] rust: macros: support `#[cfg]` properly in `#[vtable]` macro.
Date: Tue, 13 Jan 2026 17:05:21 +0000
Message-ID: <20260113170529.2240744-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <CAJ-ks9=CXCuE+NDnu_SsFwQKLsc4yz+GuRh4pD=DQ-7KFdaOPA@mail.gmail.com>
References: <CAJ-ks9=CXCuE+NDnu_SsFwQKLsc4yz+GuRh4pD=DQ-7KFdaOPA@mail.gmail.com>
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
index adfa60d8f42d8..37ef6a6f2c851 100644
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
+pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> impl Iterator<Item = &Attribute> + '_ {
+    attr.iter().filter(|a| a.path().is_ident("cfg"))
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

