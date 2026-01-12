Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9871C374184;
	Mon, 12 Jan 2026 17:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237933; cv=none; b=oSJUyB56NsqAB/0bi52zLLGZgsn3TFwNoSPIswsBdnCbmIVYgx2Oso5lEWtseftGkhk5DKRpb9BXNfAtN09cPnS9SE4z019bZUuBzKoeKdwcz5uca8dFhSu6MC/k9xZxRgjVbIbJUwUz3HvU3/dUGg7A61eRbhpyTmXlssEVcnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237933; c=relaxed/simple;
	bh=iG3UfccCDEq0X+oHbWGRGIE2l/bJdbKP33sm6OF0iJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dm9q8LONwyUuO9Kb4h26cBWQf/oI16CToRC6+K7VvRo7EzLSUO6yDmv5hHfu21IjkycrR4aG08lTAuU6ox2aO3uSm5xv/vELE8xQk1kbwgGQOIXkNK0eWoLYLT9TP5GXW8Zid8ZMNl0lOYAPCptJ5+R7dooztJ7V5JW0/xhQ6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3T/7uFt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3T/7uFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1520C116D0;
	Mon, 12 Jan 2026 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768237933;
	bh=iG3UfccCDEq0X+oHbWGRGIE2l/bJdbKP33sm6OF0iJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=V3T/7uFtB13+i3DBBdpZIQNVFYrBZFiTf+F0i/XzaSv7CUiyrAn+DZWC/5qjNnHbr
	 2hx/pAdw8xl0WIE/h/JhHsg9dL5Go/TTHjitbMm1gSCp6mq0Al5Uu7Ofviw3dl+AqJ
	 gpqJOU1+6PJ/lTZtnPYoboIoTiIiKhAUOugjwC8wd8XDjhUD/jckJvsgGiuMl12BVv
	 BD4nPQJLl5gJ8MR1qjNJRWJPYX/SLZlVBl/Y55ZUgK/lMr5dTanOuNRIC247A5nbrJ
	 Bso2G0lr1UmX9QjJi3mqnSIbRmwioHJETOcerK3dGtzhcRQiK5QrmSiG3VmYXs/YMX
	 LsFv2PZQX9xUw==
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
Subject: [PATCH v3 12/12] rust: macros: support `#[cfg]` properly in `#[vtable]` macro.
Date: Mon, 12 Jan 2026 17:07:23 +0000
Message-ID: <20260112170919.1888584-13-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260112170919.1888584-1-gary@kernel.org>
References: <20260112170919.1888584-1-gary@kernel.org>
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
 rust/macros/helpers.rs |  9 +++++++++
 rust/macros/vtable.rs  | 13 ++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index adfa60d8f42d8..c17287da801dd 100644
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
@@ -53,3 +54,11 @@ pub(crate) fn file() -> String {
         proc_macro::Span::call_site().file()
     }
 }
+
+/// Obtain all `#[cfg]` attributes.
+pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> Vec<Attribute> {
+    attr.iter()
+        .filter(|a| a.path().is_ident("cfg"))
+        .cloned()
+        .collect()
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
 
-- 
2.51.2

