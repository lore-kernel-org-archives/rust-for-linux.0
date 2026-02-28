Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9595439017;
	Sat, 28 Feb 2026 11:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772278651; cv=none; b=hbvImfTe831hGqBmFjn+ke1c/msD87zx4YfI4jI3vCocOh2wTDJ7wurtnk8kN2V69sVSTPDnCXqQcKiFFmesEfB1lynQZYHglnVI0dd45BBV4O0Ugx5xYgiWMmR9P0QzR3VyDPleS2eODP2494Su50H5o3BfMf0g4elix6Q2ASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772278651; c=relaxed/simple;
	bh=2PvAH33FAs9ERsdarTKWOOT9boomJOG34mRo9oVpqrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gmXS752dbA1sp+FNURaQsK3k6EY/uvANOeOweOiKy3giPm/q7tb2FTF09MRa8HGElKdon2nmqpiXa2dD4hyld5ZY+pV3heUgtwx6C7e2Eb/4tEYJRtYsS/V+ap+g+2RVyrw7ePQSW3r50xbXGdCxECn88HtOWFpZ6ra54RM9tGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBv06GFZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBv06GFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA47C116D0;
	Sat, 28 Feb 2026 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772278650;
	bh=2PvAH33FAs9ERsdarTKWOOT9boomJOG34mRo9oVpqrc=;
	h=From:To:Cc:Subject:Date:From;
	b=MBv06GFZBGrRe8UskQ2W+7mfzY0u0iTlgVWqSzXWz7CTfmYjvb7+XSrsGg92YdS7w
	 WScVAX9ir7MJ/Jlr7s+3XDus7BGAX2Px+x0NQBsHUg7/kMf+zPZiFT1xhgOtWBXKMr
	 x8IbxOzLGxBQPGKIAwTO/lGxrg4V6G/tRvd5TdmFUJ2abrt3zfnU5LrySJ1Kxgeu2D
	 CrcgrtFlqY4gui7OQQgZ4YAV4YCs4DvfpLxyH8S8POX/wk64fltn/zsIFOFPz7LQ8+
	 ENNtWY7GyauSATuMsuarorQxdzWZEG/+LJLutTnTruDbxXEmT4gRpDRa/5cQMOmeSv
	 6Ux/QMBcJZZJw==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>,
	asahi@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
Date: Sat, 28 Feb 2026 12:37:04 +0100
Message-ID: <20260228113713.1402110-1-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
traits cannot support packed struct, since they use operations that
require aligned pointers. This means that any code using packed structs
and pin-init is unsound.

Thus remove the `#[disable_initialized_field_access]` attribute from
`init!`, which is the only safe way to create an initializer of a packed
struct.

In the future, we can add support for packed structs by changing the
trait infrastructure to include `UnalignedInit` or hopefully another
mechanism.

Reported-by: Gary Guo <gary@garyguo.net>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch for referencing initialized fields")
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
This commit does not need backporting, as ceca298c53f9 is not yet in any
stable tree.

However, the unsoundness still affects several stable trees, because it
was unknowingly fixed in commit 42415d163e5d ("rust: pin-init: add
references to previously initialized fields"). Before then, packed
structs compiled without any issues with pin-init and thus all prior
kernel versions with pin-init that do not contain that commit are
affected.

We introduced pin-init in 90e53c5e70a6 ("rust: add pin-init API core"),
which was included in 6.4. The affected stable trees that are still
maintained are: 6.17, 6.16, 6.12, and 6.6. Note that 6.18 and 6.19
already contain 42415d163e5d, so they are unaffected.

I will prepare a separate patch series to backport 42415d163e5d to each
of the affected trees, including the second patch of this series that
documents the fact that field accessors are load-bearing for soundness.

@asahi folks, let me know if I should prioritize a solution for packed
structs. Otherwise I'd like not support it at the moment, as that
requires some deeper changes to the internals of pin-init. I'm tracking
the status of packed structs in:

    https://github.com/Rust-for-Linux/pin-init/issues/112
---
 rust/pin-init/internal/src/init.rs | 39 ++++++------------------------
 1 file changed, 8 insertions(+), 31 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 42936f915a07..da53adc44ecf 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -62,7 +62,6 @@ fn ident(&self) -> Option<&Ident> {
 
 enum InitializerAttribute {
     DefaultError(DefaultErrorAttribute),
-    DisableInitializedFieldAccess,
 }
 
 struct DefaultErrorAttribute {
@@ -86,6 +85,7 @@ pub(crate) fn expand(
     let error = error.map_or_else(
         || {
             if let Some(default_error) = attrs.iter().fold(None, |acc, attr| {
+                #[expect(irrefutable_let_patterns)]
                 if let InitializerAttribute::DefaultError(DefaultErrorAttribute { ty }) = attr {
                     Some(ty.clone())
                 } else {
@@ -145,15 +145,7 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
     };
     // `mixed_site` ensures that the data is not accessible to the user-controlled code.
     let data = Ident::new("__data", Span::mixed_site());
-    let init_fields = init_fields(
-        &fields,
-        pinned,
-        !attrs
-            .iter()
-            .any(|attr| matches!(attr, InitializerAttribute::DisableInitializedFieldAccess)),
-        &data,
-        &slot,
-    );
+    let init_fields = init_fields(&fields, pinned, &data, &slot);
     let field_check = make_field_check(&fields, init_kind, &path);
     Ok(quote! {{
         // We do not want to allow arbitrary returns, so we declare this type as the `Ok` return
@@ -236,7 +228,6 @@ fn get_init_kind(rest: Option<(Token![..], Expr)>, dcx: &mut DiagCtxt) -> InitKi
 fn init_fields(
     fields: &Punctuated<InitializerField, Token![,]>,
     pinned: bool,
-    generate_initialized_accessors: bool,
     data: &Ident,
     slot: &Ident,
 ) -> TokenStream {
@@ -272,13 +263,6 @@ fn init_fields(
                         unsafe { &mut (*#slot).#ident }
                     }
                 };
-                let accessor = generate_initialized_accessors.then(|| {
-                    quote! {
-                        #(#cfgs)*
-                        #[allow(unused_variables)]
-                        let #ident = #accessor;
-                    }
-                });
                 quote! {
                     #(#attrs)*
                     {
@@ -286,7 +270,9 @@ fn init_fields(
                         // SAFETY: TODO
                         unsafe { #write(::core::ptr::addr_of_mut!((*#slot).#ident), #value_ident) };
                     }
-                    #accessor
+                    #(#cfgs)*
+                    #[allow(unused_variables)]
+                    let #ident = #accessor;
                 }
             }
             InitializerKind::Init { ident, value, .. } => {
@@ -326,20 +312,15 @@ fn init_fields(
                         },
                     )
                 };
-                let accessor = generate_initialized_accessors.then(|| {
-                    quote! {
-                        #(#cfgs)*
-                        #[allow(unused_variables)]
-                        let #ident = #accessor;
-                    }
-                });
                 quote! {
                     #(#attrs)*
                     {
                         let #init = #value;
                         #value_init
                     }
-                    #accessor
+                    #(#cfgs)*
+                    #[allow(unused_variables)]
+                    let #ident = #accessor;
                 }
             }
             InitializerKind::Code { block: value, .. } => quote! {
@@ -466,10 +447,6 @@ fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
                 if a.path().is_ident("default_error") {
                     a.parse_args::<DefaultErrorAttribute>()
                         .map(InitializerAttribute::DefaultError)
-                } else if a.path().is_ident("disable_initialized_field_access") {
-                    a.meta
-                        .require_path_only()
-                        .map(|_| InitializerAttribute::DisableInitializedFieldAccess)
                 } else {
                     Err(syn::Error::new_spanned(a, "unknown initializer attribute"))
                 }

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.53.0

