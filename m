Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F4E3375C5;
	Sun, 11 Jan 2026 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768134448; cv=none; b=TY9ieR3J6Decmme/wBRLog3UQG7YW8qhO+0jTyBST8Kgbzemzn9xOcpCwPYPSVGuxv1CW89EGtPr9vJlznFRRrGwYpviPRpGnoJBvm5nHMmf3BZtWF5eqn0D89mIxub6rT4C7Dfa6xrp2Ctr4tOm6zKEyxLRkpTAPZX7CWrPX90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768134448; c=relaxed/simple;
	bh=OsWF/m0y3+tV0G1eX7pqvFa9oymAV8d0GrA8ajjOkZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIfaKGeq3kzxJMmvxjw0KVSqVSRZOMfzqG7mSfSl6bL6N6kuZLdNYe8xrFJNOL6W6EeqJX+IibMbdOeIWc0tbufa85D0EyTgiuWCNuJd2XnlTZhwNA9xLsR4fYEFAhI/yCmYBozWCdIFfrQSgMkFkHd5Fd9bqFqKngP5ELH/hXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IebOd6gh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IebOd6gh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C37C19422;
	Sun, 11 Jan 2026 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768134448;
	bh=OsWF/m0y3+tV0G1eX7pqvFa9oymAV8d0GrA8ajjOkZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IebOd6ghR/VlNw5JDfSRhseNvaNhJW/IzmISUVOX9h3ZsIlzJkCk0qvt1mjm2UcCo
	 E/yHMeL/OTUP2fu6xVC/5g5VuKluGPBqv3kjHr2lPRv8FWO6aHFCnYMRa9AhhjU05V
	 HfzGTuCcY1H8ysJ3DL3u9RKqphRZqNaN49mZ3+11xsxI2KjSF+X38QzH0UMuZGnFvo
	 vLCoeohxwQc1mWn+k3bVGwmMhEdFhU7bX5p4BmjWzWMPx8o47Oh5iQp31TXtAjCZdf
	 HHCbGTko2tjXbHPMr0cc1ZRD9AucASA31iQz1nLihofHPCoqdhKNUZhn9uraxFsL6l
	 o13/0of8AkNVg==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Alban Kurti <kurti@invicto.ai>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 09/15] rust: pin-init: rewrite the initializer macros using `syn`
Date: Sun, 11 Jan 2026 13:25:07 +0100
Message-ID: <20260111122554.2662175-10-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111122554.2662175-1-lossin@kernel.org>
References: <20260111122554.2662175-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rewrite the initializer macros `[pin_]init!` using `syn`. No functional
changes intended aside from improved error messages on syntactic and
semantical errors. For example if one forgets to use `<-` with an
initializer (and instead uses `:`):

    impl Bar {
        fn new() -> impl PinInit<Self> { ... }
    }

    impl Foo {
        fn new() -> impl PinInit<Self> {
            pin_init!(Self { bar: Bar::new() })
        }
    }

Then the declarative macro would report:

    error[E0308]: mismatched types
      --> tests/ui/compile-fail/init/colon_instead_of_arrow.rs:21:9
       |
    14 |     fn new() -> impl PinInit<Self> {
       |                 ------------------ the found opaque type
    ...
    21 |         pin_init!(Self { bar: Bar::new() })
       |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
       |         |
       |         expected `Bar`, found opaque type
       |         arguments to this function are incorrect
       |
       = note:   expected struct `Bar`
               found opaque type `impl pin_init::PinInit<Bar>`
    note: function defined here
      --> $RUST/core/src/ptr/mod.rs
       |
       | pub const unsafe fn write<T>(dst: *mut T, src: T) {
       |                     ^^^^^
       = note: this error originates in the macro `$crate::__init_internal` which comes from the expansion of the macro `pin_init` (in Nightly builds, run with -Z macro-backtrace for more info)

And the new error is:

    error[E0308]: mismatched types
      --> tests/ui/compile-fail/init/colon_instead_of_arrow.rs:21:31
       |
    14 |     fn new() -> impl PinInit<Self> {
       |                 ------------------ the found opaque type
    ...
    21 |         pin_init!(Self { bar: Bar::new() })
       |                          ---  ^^^^^^^^^^ expected `Bar`, found opaque type
       |                          |
       |                          arguments to this function are incorrect
       |
       = note:   expected struct `Bar`
               found opaque type `impl pin_init::PinInit<Bar>`
    note: function defined here
      --> $RUST/core/src/ptr/mod.rs
       |
       | pub const unsafe fn write<T>(dst: *mut T, src: T) {
       |                     ^^^^^

Importantly, this error gives much more accurate span locations,
pointing to the offending field, rather than the entire macro
invocation.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
Changes in v2:
* fix clippy error
* add missing SPDX-License-Identifier
* improve error handling
* improve default error evaluation
* added missing comment from pre-rewrite code
---
 rust/pin-init/internal/src/init.rs | 445 ++++++++++++++
 rust/pin-init/internal/src/lib.rs  |  21 +
 rust/pin-init/src/lib.rs           |  56 +-
 rust/pin-init/src/macros.rs        | 951 -----------------------------
 4 files changed, 468 insertions(+), 1005 deletions(-)
 create mode 100644 rust/pin-init/internal/src/init.rs
 delete mode 100644 rust/pin-init/src/macros.rs

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
new file mode 100644
index 000000000000..cd8351152cf1
--- /dev/null
+++ b/rust/pin-init/internal/src/init.rs
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+use proc_macro2::{Span, TokenStream};
+use quote::{format_ident, quote, quote_spanned};
+use syn::{
+    braced,
+    parse::{End, Parse},
+    parse_quote,
+    punctuated::Punctuated,
+    spanned::Spanned,
+    token, Block, Error, Expr, ExprCall, ExprPath, Ident, Path, Token, Type,
+};
+
+pub(crate) struct Initializer {
+    this: Option<This>,
+    path: Path,
+    brace_token: token::Brace,
+    fields: Punctuated<InitializerField, Token![,]>,
+    rest: Option<(Token![..], Expr)>,
+    error: Option<(Token![?], Type)>,
+}
+
+struct This {
+    _and_token: Token![&],
+    ident: Ident,
+    _in_token: Token![in],
+}
+
+enum InitializerField {
+    Value {
+        ident: Ident,
+        value: Option<(Token![:], Expr)>,
+    },
+    Init {
+        ident: Ident,
+        _left_arrow_token: Token![<-],
+        value: Expr,
+    },
+    Code {
+        _underscore_token: Token![_],
+        _colon_token: Token![:],
+        block: Block,
+    },
+}
+
+impl InitializerField {
+    fn ident(&self) -> Option<&Ident> {
+        match self {
+            Self::Value { ident, .. } | Self::Init { ident, .. } => Some(ident),
+            Self::Code { .. } => None,
+        }
+    }
+}
+
+pub(crate) fn expand(
+    Initializer {
+        this,
+        path,
+        brace_token,
+        fields,
+        rest,
+        error,
+    }: Initializer,
+    default_error: Option<&'static str>,
+    pinned: bool,
+) -> TokenStream {
+    let mut macro_error = crate::Error::none();
+    let error = error.map_or_else(
+        || {
+            if let Some(default_error) = default_error {
+                syn::parse_str(default_error).unwrap()
+            } else {
+                macro_error.combine(Error::new(
+                    brace_token.span.close(),
+                    "expected `? <type>` after `}`",
+                ));
+                parse_quote!(::core::convert::Infallible)
+            }
+        },
+        |(_, err)| err,
+    );
+    let slot = format_ident!("slot");
+    let (has_data_trait, data_trait, get_data, init_from_closure) = if pinned {
+        (
+            format_ident!("HasPinData"),
+            format_ident!("PinData"),
+            format_ident!("__pin_data"),
+            format_ident!("pin_init_from_closure"),
+        )
+    } else {
+        (
+            format_ident!("HasInitData"),
+            format_ident!("InitData"),
+            format_ident!("__init_data"),
+            format_ident!("init_from_closure"),
+        )
+    };
+    let init_kind = get_init_kind(rest, &mut macro_error);
+    let zeroable_check = match init_kind {
+        InitKind::Normal => quote!(),
+        InitKind::Zeroing => quote! {
+            // The user specified `..Zeroable::zeroed()` at the end of the list of fields.
+            // Therefore we check if the struct implements `Zeroable` and then zero the memory.
+            // This allows us to also remove the check that all fields are present (since we
+            // already set the memory to zero and that is a valid bit pattern).
+            fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
+            where T: ::pin_init::Zeroable
+            {}
+            // Ensure that the struct is indeed `Zeroable`.
+            assert_zeroable(#slot);
+            // SAFETY: The type implements `Zeroable` by the check above.
+            unsafe { ::core::ptr::write_bytes(#slot, 0, 1) };
+        },
+    };
+    let this = match this {
+        None => quote!(),
+        Some(This { ident, .. }) => quote! {
+            // Create the `this` so it can be referenced by the user inside of the
+            // expressions creating the individual fields.
+            let #ident = unsafe { ::core::ptr::NonNull::new_unchecked(slot) };
+        },
+    };
+    // `mixed_site` ensures that the data is not accessible to the user-controlled code.
+    let data = Ident::new("__data", Span::mixed_site());
+    let init_fields = init_fields(&fields, pinned, &data, &slot);
+    let field_check = make_field_check(&fields, init_kind, &path);
+    quote! {{
+        #macro_error
+        // We do not want to allow arbitrary returns, so we declare this type as the `Ok` return
+        // type and shadow it later when we insert the arbitrary user code. That way there will be
+        // no possibility of returning without `unsafe`.
+        struct __InitOk;
+
+        // Get the data about fields from the supplied type.
+        // SAFETY: TODO
+        let #data = unsafe {
+            use ::pin_init::__internal::#has_data_trait;
+            // Can't use `<#path as #has_data_trait>::#get_data`, since the user is able to omit
+            // generics (which need to be present with that syntax).
+            #path::#get_data()
+        };
+        // Ensure that `#data` really is of type `#data` and help with type inference:
+        let init = ::pin_init::__internal::#data_trait::make_closure::<_, __InitOk, #error>(
+            #data,
+            move |slot| {
+                {
+                    // Shadow the structure so it cannot be used to return early.
+                    struct __InitOk;
+                    #zeroable_check
+                    #this
+                    #init_fields
+                    #field_check
+                }
+                Ok(__InitOk)
+            }
+        );
+        let init = move |slot| -> ::core::result::Result<(), #error> {
+            init(slot).map(|__InitOk| ())
+        };
+        // SAFETY: TODO
+        let init = unsafe { ::pin_init::#init_from_closure::<_, #error>(init) };
+        init
+    }}
+}
+
+enum InitKind {
+    Normal,
+    Zeroing,
+}
+
+fn get_init_kind(rest: Option<(Token![..], Expr)>, macro_error: &mut crate::Error) -> InitKind {
+    let Some((dotdot, expr)) = rest else {
+        return InitKind::Normal;
+    };
+    match &expr {
+        Expr::Call(ExprCall { func, args, .. }) if args.is_empty() => match &**func {
+            Expr::Path(ExprPath {
+                attrs,
+                qself: None,
+                path:
+                    Path {
+                        leading_colon: None,
+                        segments,
+                    },
+            }) if attrs.is_empty()
+                && segments.len() == 2
+                && segments[0].ident == "Zeroable"
+                && segments[0].arguments.is_none()
+                && segments[1].ident == "init_zeroed"
+                && segments[1].arguments.is_none() =>
+            {
+                return InitKind::Zeroing;
+            }
+            _ => {}
+        },
+        _ => {}
+    }
+    macro_error.combine(Error::new(
+        dotdot.span().join(expr.span()).unwrap_or(expr.span()),
+        "expected nothing or `..Zeroable::init_zeroed()`.",
+    ));
+    InitKind::Normal
+}
+
+/// Generate the code that initializes the fields of the struct using the initializers in `field`.
+fn init_fields(
+    fields: &Punctuated<InitializerField, Token![,]>,
+    pinned: bool,
+    data: &Ident,
+    slot: &Ident,
+) -> TokenStream {
+    let mut guards = vec![];
+    let mut res = TokenStream::new();
+    for field in fields {
+        let init = match field {
+            InitializerField::Value { ident, value } => {
+                let mut value_ident = ident.clone();
+                let value_prep = value.as_ref().map(|value| &value.1).map(|value| {
+                    // Setting the span of `value_ident` to `value`'s span improves error messages
+                    // when the type of `value` is wrong.
+                    value_ident.set_span(value.span());
+                    quote!(let #value_ident = #value;)
+                });
+                // Again span for better diagnostics
+                let write = quote_spanned!(ident.span()=> ::core::ptr::write);
+                let accessor = if pinned {
+                    let project_ident = format_ident!("__project_{ident}");
+                    quote! {
+                        // SAFETY: TODO
+                        unsafe { #data.#project_ident(&mut (*#slot).#ident) }
+                    }
+                } else {
+                    quote! {
+                        // SAFETY: TODO
+                        unsafe { &mut (*#slot).#ident }
+                    }
+                };
+                quote! {
+                    {
+                        #value_prep
+                        // SAFETY: TODO
+                        unsafe { #write(::core::ptr::addr_of_mut!((*#slot).#ident), #value_ident) };
+                    }
+                    #[allow(unused_variables)]
+                    let #ident = #accessor;
+                }
+            }
+            InitializerField::Init { ident, value, .. } => {
+                // Again span for better diagnostics
+                let init = format_ident!("init", span = value.span());
+                if pinned {
+                    let project_ident = format_ident!("__project_{ident}");
+                    quote! {
+                        {
+                            let #init = #value;
+                            // SAFETY:
+                            // - `slot` is valid, because we are inside of an initializer closure, we
+                            //   return when an error/panic occurs.
+                            // - We also use `#data` to require the correct trait (`Init` or `PinInit`)
+                            //   for `#ident`.
+                            unsafe { #data.#ident(::core::ptr::addr_of_mut!((*#slot).#ident), #init)? };
+                        }
+                        // SAFETY: TODO
+                        #[allow(unused_variables)]
+                        let #ident = unsafe { #data.#project_ident(&mut (*#slot).#ident) };
+                    }
+                } else {
+                    quote! {
+                        {
+                            let #init = #value;
+                            // SAFETY: `slot` is valid, because we are inside of an initializer
+                            // closure, we return when an error/panic occurs.
+                            unsafe {
+                                ::pin_init::Init::__init(
+                                    #init,
+                                    ::core::ptr::addr_of_mut!((*#slot).#ident),
+                                )?
+                            };
+                        }
+                        // SAFETY: TODO
+                        #[allow(unused_variables)]
+                        let #ident = unsafe { &mut (*#slot).#ident };
+                    }
+                }
+            }
+            InitializerField::Code { block: value, .. } => quote!(#[allow(unused_braces)] #value),
+        };
+        res.extend(init);
+        if let Some(ident) = field.ident() {
+            // `mixed_site` ensures that the guard is not accessible to the user-controlled code.
+            let guard = format_ident!("__{ident}_guard", span = Span::mixed_site());
+            guards.push(guard.clone());
+            res.extend(quote! {
+                // Create the drop guard:
+                //
+                // We rely on macro hygiene to make it impossible for users to access this local
+                // variable.
+                // SAFETY: We forget the guard later when initialization has succeeded.
+                let #guard = unsafe {
+                    ::pin_init::__internal::DropGuard::new(
+                        ::core::ptr::addr_of_mut!((*slot).#ident)
+                    )
+                };
+            });
+        }
+    }
+    quote! {
+        #res
+        // If execution reaches this point, all fields have been initialized. Therefore we can now
+        // dismiss the guards by forgetting them.
+        #(::core::mem::forget(#guards);)*
+    }
+}
+
+/// Generate the check for ensuring that every field has been initialized.
+fn make_field_check(
+    fields: &Punctuated<InitializerField, Token![,]>,
+    init_kind: InitKind,
+    path: &Path,
+) -> TokenStream {
+    let fields = fields.iter().filter_map(|f| f.ident());
+    match init_kind {
+        InitKind::Normal => quote! {
+            // We use unreachable code to ensure that all fields have been mentioned exactly once,
+            // this struct initializer will still be type-checked and complain with a very natural
+            // error message if a field is forgotten/mentioned more than once.
+            #[allow(unreachable_code, clippy::diverging_sub_expression)]
+            // SAFETY: this code is never executed.
+            let _ = || unsafe {
+                ::core::ptr::write(slot, #path {
+                    #(
+                        #fields: ::core::panic!(),
+                    )*
+                })
+            };
+        },
+        InitKind::Zeroing => quote! {
+            // We use unreachable code to ensure that all fields have been mentioned at most once.
+            // Since the user specified `..Zeroable::zeroed()` at the end, all missing fields will
+            // be zeroed. This struct initializer will still be type-checked and complain with a
+            // very natural error message if a field is mentioned more than once, or doesn't exist.
+            #[allow(unreachable_code, clippy::diverging_sub_expression, unused_assignments)]
+            // SAFETY: this code is never executed.
+            let _ = || unsafe {
+                let mut zeroed = ::core::mem::zeroed();
+                // We have to use type inference here to make zeroed have the correct type. This
+                // does not get executed, so it has no effect.
+                ::core::ptr::write(slot, zeroed);
+                zeroed = ::core::mem::zeroed();
+                ::core::ptr::write(slot, #path {
+                    #(
+                        #fields: ::core::panic!(),
+                    )*
+                    ..zeroed
+                })
+            };
+        },
+    }
+}
+
+impl Parse for Initializer {
+    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
+        let this = input.peek(Token![&]).then(|| input.parse()).transpose()?;
+        let path = input.parse()?;
+        let content;
+        let brace_token = braced!(content in input);
+        let mut fields = Punctuated::new();
+        loop {
+            let lh = content.lookahead1();
+            if lh.peek(End) || lh.peek(Token![..]) {
+                break;
+            } else if lh.peek(Ident) || lh.peek(Token![_]) {
+                fields.push_value(content.parse()?);
+                let lh = content.lookahead1();
+                if lh.peek(End) {
+                    break;
+                } else if lh.peek(Token![,]) {
+                    fields.push_punct(content.parse()?);
+                } else {
+                    return Err(lh.error());
+                }
+            } else {
+                return Err(lh.error());
+            }
+        }
+        let rest = content
+            .peek(Token![..])
+            .then(|| Ok::<_, syn::Error>((content.parse()?, content.parse()?)))
+            .transpose()?;
+        let error = input
+            .peek(Token![?])
+            .then(|| Ok::<_, syn::Error>((input.parse()?, input.parse()?)))
+            .transpose()?;
+        Ok(Self {
+            this,
+            path,
+            brace_token,
+            fields,
+            rest,
+            error,
+        })
+    }
+}
+
+impl Parse for This {
+    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
+        Ok(Self {
+            _and_token: input.parse()?,
+            ident: input.parse()?,
+            _in_token: input.parse()?,
+        })
+    }
+}
+
+impl Parse for InitializerField {
+    fn parse(input: syn::parse::ParseStream<'_>) -> syn::Result<Self> {
+        let lh = input.lookahead1();
+        if lh.peek(Token![_]) {
+            Ok(Self::Code {
+                _underscore_token: input.parse()?,
+                _colon_token: input.parse()?,
+                block: input.parse()?,
+            })
+        } else if lh.peek(Ident) {
+            let ident = input.parse()?;
+            let lh = input.lookahead1();
+            if lh.peek(Token![<-]) {
+                Ok(Self::Init {
+                    ident,
+                    _left_arrow_token: input.parse()?,
+                    value: input.parse()?,
+                })
+            } else if lh.peek(Token![:]) {
+                Ok(Self::Value {
+                    ident,
+                    value: Some((input.parse()?, input.parse()?)),
+                })
+            } else if lh.peek(Token![,]) || lh.peek(End) {
+                Ok(Self::Value { ident, value: None })
+            } else {
+                Err(lh.error())
+            }
+        } else {
+            Err(lh.error())
+        }
+    }
+}
diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src/lib.rs
index 07ea6e0970a0..62af0bc85afd 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -13,6 +13,7 @@
 use proc_macro::TokenStream;
 use syn::parse_macro_input;
 
+mod init;
 mod pin_data;
 mod pinned_drop;
 mod zeroable;
@@ -40,6 +41,26 @@ pub fn maybe_derive_zeroable(input: TokenStream) -> TokenStream {
     ok_or_compile_error(zeroable::maybe_derive(parse_macro_input!(input)))
 }
 
+#[proc_macro]
+pub fn init(input: TokenStream) -> TokenStream {
+    init::expand(
+        parse_macro_input!(input),
+        Some("::core::convert::Infallible"),
+        false,
+    )
+    .into()
+}
+
+#[proc_macro]
+pub fn pin_init(input: TokenStream) -> TokenStream {
+    init::expand(
+        parse_macro_input!(input),
+        Some("::core::convert::Infallible"),
+        true,
+    )
+    .into()
+}
+
 fn ok_or_compile_error(res: syn::Result<proc_macro2::TokenStream>) -> TokenStream {
     match res {
         Ok(stream) => stream,
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 0e707f00061f..780b4fead22d 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -297,8 +297,6 @@
 
 #[doc(hidden)]
 pub mod __internal;
-#[doc(hidden)]
-pub mod macros;
 
 #[cfg(any(feature = "std", feature = "alloc"))]
 mod alloc;
@@ -781,32 +779,7 @@ macro_rules! stack_try_pin_init {
 /// ```
 ///
 /// [`NonNull<Self>`]: core::ptr::NonNull
-// For a detailed example of how this macro works, see the module documentation of the hidden
-// module `macros` inside of `macros.rs`.
-#[macro_export]
-macro_rules! pin_init {
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }) => {
-        $crate::pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? ::core::convert::Infallible)
-    };
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }? $err:ty) => {
-        $crate::__init_internal!(
-            @this($($this)?),
-            @typ($t $(::<$($generics),*>)? ),
-            @fields($($fields)*),
-            @error($err),
-            @data(PinData, use_data),
-            @has_data(HasPinData, __pin_data),
-            @construct_closure(pin_init_from_closure),
-            @munch_fields($($fields)*),
-        )
-    }
-}
+pub use pin_init_internal::pin_init;
 
 /// Construct an in-place, fallible initializer for `struct`s.
 ///
@@ -844,32 +817,7 @@ macro_rules! pin_init {
 /// }
 /// # let _ = Box::init(BigBuf::new());
 /// ```
-// For a detailed example of how this macro works, see the module documentation of the hidden
-// module `macros` inside of `macros.rs`.
-#[macro_export]
-macro_rules! init {
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }) => {
-        $crate::init!($(&$this in)? $t $(::<$($generics),*>)? {
-            $($fields)*
-        }? ::core::convert::Infallible)
-    };
-    ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
-        $($fields:tt)*
-    }? $err:ty) => {
-        $crate::__init_internal!(
-            @this($($this)?),
-            @typ($t $(::<$($generics),*>)?),
-            @fields($($fields)*),
-            @error($err),
-            @data(InitData, /*no use_data*/),
-            @has_data(HasInitData, __init_data),
-            @construct_closure(init_from_closure),
-            @munch_fields($($fields)*),
-        )
-    }
-}
+pub use pin_init_internal::init;
 
 /// Asserts that a field on a struct using `#[pin_data]` is marked with `#[pin]` ie. that it is
 /// structurally pinned.
diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
deleted file mode 100644
index eea8adc5c7ad..000000000000
--- a/rust/pin-init/src/macros.rs
+++ /dev/null
@@ -1,951 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR MIT
-
-//! This module provides the macros that actually implement the proc-macros `pin_data` and
-//! `pinned_drop`. It also contains `__init_internal`, the implementation of the
-//! `{try_}{pin_}init!` macros.
-//!
-//! These macros should never be called directly, since they expect their input to be
-//! in a certain format which is internal. If used incorrectly, these macros can lead to UB even in
-//! safe code! Use the public facing macros instead.
-//!
-//! This architecture has been chosen because the kernel does not yet have access to `syn` which
-//! would make matters a lot easier for implementing these as proc-macros.
-//!
-//! Since this library and the kernel implementation should diverge as little as possible, the same
-//! approach has been taken here.
-//!
-//! # Macro expansion example
-//!
-//! This section is intended for readers trying to understand the macros in this module and the
-//! `[try_][pin_]init!` macros from `lib.rs`.
-//!
-//! We will look at the following example:
-//!
-//! ```rust,ignore
-//! #[pin_data]
-//! #[repr(C)]
-//! struct Bar<T> {
-//!     #[pin]
-//!     t: T,
-//!     pub x: usize,
-//! }
-//!
-//! impl<T> Bar<T> {
-//!     fn new(t: T) -> impl PinInit<Self> {
-//!         pin_init!(Self { t, x: 0 })
-//!     }
-//! }
-//!
-//! #[pin_data(PinnedDrop)]
-//! struct Foo {
-//!     a: usize,
-//!     #[pin]
-//!     b: Bar<u32>,
-//! }
-//!
-//! #[pinned_drop]
-//! impl PinnedDrop for Foo {
-//!     fn drop(self: Pin<&mut Self>) {
-//!         println!("{self:p} is getting dropped.");
-//!     }
-//! }
-//!
-//! let a = 42;
-//! let initializer = pin_init!(Foo {
-//!     a,
-//!     b <- Bar::new(36),
-//! });
-//! ```
-//!
-//! This example includes the most common and important features of the pin-init API.
-//!
-//! Below you can find individual section about the different macro invocations. Here are some
-//! general things we need to take into account when designing macros:
-//! - use global paths, similarly to file paths, these start with the separator: `::core::panic!()`
-//!   this ensures that the correct item is used, since users could define their own `mod core {}`
-//!   and then their own `panic!` inside to execute arbitrary code inside of our macro.
-//! - macro `unsafe` hygiene: we need to ensure that we do not expand arbitrary, user-supplied
-//!   expressions inside of an `unsafe` block in the macro, because this would allow users to do
-//!   `unsafe` operations without an associated `unsafe` block.
-//!
-//! ## `#[pin_data]` on `Bar`
-//!
-//! This macro is used to specify which fields are structurally pinned and which fields are not. It
-//! is placed on the struct definition and allows `#[pin]` to be placed on the fields.
-//!
-//! Here is the definition of `Bar` from our example:
-//!
-//! ```rust,ignore
-//! #[pin_data]
-//! #[repr(C)]
-//! struct Bar<T> {
-//!     #[pin]
-//!     t: T,
-//!     pub x: usize,
-//! }
-//! ```
-//!
-//! This expands to the following code:
-//!
-//! ```rust,ignore
-//! // Firstly the normal definition of the struct, attributes are preserved:
-//! #[repr(C)]
-//! struct Bar<T> {
-//!     t: T,
-//!     pub x: usize,
-//! }
-//! // Then an anonymous constant is defined, this is because we do not want any code to access the
-//! // types that we define inside:
-//! const _: () = {
-//!     // We define the pin-data carrying struct, it is a ZST and needs to have the same generics,
-//!     // since we need to implement access functions for each field and thus need to know its
-//!     // type.
-//!     struct __ThePinData<T> {
-//!         __phantom: ::core::marker::PhantomData<fn(Bar<T>) -> Bar<T>>,
-//!     }
-//!     // We implement `Copy` for the pin-data struct, since all functions it defines will take
-//!     // `self` by value.
-//!     impl<T> ::core::clone::Clone for __ThePinData<T> {
-//!         fn clone(&self) -> Self {
-//!             *self
-//!         }
-//!     }
-//!     impl<T> ::core::marker::Copy for __ThePinData<T> {}
-//!     // For every field of `Bar`, the pin-data struct will define a function with the same name
-//!     // and accessor (`pub` or `pub(crate)` etc.). This function will take a pointer to the
-//!     // field (`slot`) and a `PinInit` or `Init` depending on the projection kind of the field
-//!     // (if pinning is structural for the field, then `PinInit` otherwise `Init`).
-//!     #[allow(dead_code)]
-//!     impl<T> __ThePinData<T> {
-//!         unsafe fn t<E>(
-//!             self,
-//!             slot: *mut T,
-//!             // Since `t` is `#[pin]`, this is `PinInit`.
-//!             init: impl ::pin_init::PinInit<T, E>,
-//!         ) -> ::core::result::Result<(), E> {
-//!             unsafe { ::pin_init::PinInit::__pinned_init(init, slot) }
-//!         }
-//!         pub unsafe fn x<E>(
-//!             self,
-//!             slot: *mut usize,
-//!             // Since `x` is not `#[pin]`, this is `Init`.
-//!             init: impl ::pin_init::Init<usize, E>,
-//!         ) -> ::core::result::Result<(), E> {
-//!             unsafe { ::pin_init::Init::__init(init, slot) }
-//!         }
-//!     }
-//!     // Implement the internal `HasPinData` trait that associates `Bar` with the pin-data struct
-//!     // that we constructed above.
-//!     unsafe impl<T> ::pin_init::__internal::HasPinData for Bar<T> {
-//!         type PinData = __ThePinData<T>;
-//!         unsafe fn __pin_data() -> Self::PinData {
-//!             __ThePinData {
-//!                 __phantom: ::core::marker::PhantomData,
-//!             }
-//!         }
-//!     }
-//!     // Implement the internal `PinData` trait that marks the pin-data struct as a pin-data
-//!     // struct. This is important to ensure that no user can implement a rogue `__pin_data`
-//!     // function without using `unsafe`.
-//!     unsafe impl<T> ::pin_init::__internal::PinData for __ThePinData<T> {
-//!         type Datee = Bar<T>;
-//!     }
-//!     // Now we only want to implement `Unpin` for `Bar` when every structurally pinned field is
-//!     // `Unpin`. In other words, whether `Bar` is `Unpin` only depends on structurally pinned
-//!     // fields (those marked with `#[pin]`). These fields will be listed in this struct, in our
-//!     // case no such fields exist, hence this is almost empty. The two phantomdata fields exist
-//!     // for two reasons:
-//!     // - `__phantom`: every generic must be used, since we cannot really know which generics
-//!     //   are used, we declare all and then use everything here once.
-//!     // - `__phantom_pin`: uses the `'__pin` lifetime and ensures that this struct is invariant
-//!     //   over it. The lifetime is needed to work around the limitation that trait bounds must
-//!     //   not be trivial, e.g. the user has a `#[pin] PhantomPinned` field -- this is
-//!     //   unconditionally `!Unpin` and results in an error. The lifetime tricks the compiler
-//!     //   into accepting these bounds regardless.
-//!     #[allow(dead_code)]
-//!     struct __Unpin<'__pin, T> {
-//!         __phantom_pin: ::core::marker::PhantomData<fn(&'__pin ()) -> &'__pin ()>,
-//!         __phantom: ::core::marker::PhantomData<fn(Bar<T>) -> Bar<T>>,
-//!         // Our only `#[pin]` field is `t`.
-//!         t: T,
-//!     }
-//!     #[doc(hidden)]
-//!     impl<'__pin, T> ::core::marker::Unpin for Bar<T>
-//!     where
-//!         __Unpin<'__pin, T>: ::core::marker::Unpin,
-//!     {}
-//!     // Now we need to ensure that `Bar` does not implement `Drop`, since that would give users
-//!     // access to `&mut self` inside of `drop` even if the struct was pinned. This could lead to
-//!     // UB with only safe code, so we disallow this by giving a trait implementation error using
-//!     // a direct impl and a blanket implementation.
-//!     trait MustNotImplDrop {}
-//!     // Normally `Drop` bounds do not have the correct semantics, but for this purpose they do
-//!     // (normally people want to know if a type has any kind of drop glue at all, here we want
-//!     // to know if it has any kind of custom drop glue, which is exactly what this bound does).
-//!     #[expect(drop_bounds)]
-//!     impl<T: ::core::ops::Drop> MustNotImplDrop for T {}
-//!     impl<T> MustNotImplDrop for Bar<T> {}
-//!     // Here comes a convenience check, if one implemented `PinnedDrop`, but forgot to add it to
-//!     // `#[pin_data]`, then this will error with the same mechanic as above, this is not needed
-//!     // for safety, but a good sanity check, since no normal code calls `PinnedDrop::drop`.
-//!     #[expect(non_camel_case_types)]
-//!     trait UselessPinnedDropImpl_you_need_to_specify_PinnedDrop {}
-//!     impl<
-//!         T: ::pin_init::PinnedDrop,
-//!     > UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for T {}
-//!     impl<T> UselessPinnedDropImpl_you_need_to_specify_PinnedDrop for Bar<T> {}
-//! };
-//! ```
-//!
-//! ## `pin_init!` in `impl Bar`
-//!
-//! This macro creates an pin-initializer for the given struct. It requires that the struct is
-//! annotated by `#[pin_data]`.
-//!
-//! Here is the impl on `Bar` defining the new function:
-//!
-//! ```rust,ignore
-//! impl<T> Bar<T> {
-//!     fn new(t: T) -> impl PinInit<Self> {
-//!         pin_init!(Self { t, x: 0 })
-//!     }
-//! }
-//! ```
-//!
-//! This expands to the following code:
-//!
-//! ```rust,ignore
-//! impl<T> Bar<T> {
-//!     fn new(t: T) -> impl PinInit<Self> {
-//!         {
-//!             // We do not want to allow arbitrary returns, so we declare this type as the `Ok`
-//!             // return type and shadow it later when we insert the arbitrary user code. That way
-//!             // there will be no possibility of returning without `unsafe`.
-//!             struct __InitOk;
-//!             // Get the data about fields from the supplied type.
-//!             // - the function is unsafe, hence the unsafe block
-//!             // - we `use` the `HasPinData` trait in the block, it is only available in that
-//!             //   scope.
-//!             let data = unsafe {
-//!                 use ::pin_init::__internal::HasPinData;
-//!                 Self::__pin_data()
-//!             };
-//!             // Ensure that `data` really is of type `PinData` and help with type inference:
-//!             let init = ::pin_init::__internal::PinData::make_closure::<
-//!                 _,
-//!                 __InitOk,
-//!                 ::core::convert::Infallible,
-//!             >(data, move |slot| {
-//!                 {
-//!                     // Shadow the structure so it cannot be used to return early. If a user
-//!                     // tries to write `return Ok(__InitOk)`, then they get a type error,
-//!                     // since that will refer to this struct instead of the one defined
-//!                     // above.
-//!                     struct __InitOk;
-//!                     // This is the expansion of `t,`, which is syntactic sugar for `t: t,`.
-//!                     {
-//!                         unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).t), t) };
-//!                     }
-//!                     // Since initialization could fail later (not in this case, since the
-//!                     // error type is `Infallible`) we will need to drop this field if there
-//!                     // is an error later. This `DropGuard` will drop the field when it gets
-//!                     // dropped and has not yet been forgotten.
-//!                     let __t_guard = unsafe {
-//!                         ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).t))
-//!                     };
-//!                     // Expansion of `x: 0,`:
-//!                     // Since this can be an arbitrary expression we cannot place it inside
-//!                     // of the `unsafe` block, so we bind it here.
-//!                     {
-//!                         let x = 0;
-//!                         unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).x), x) };
-//!                     }
-//!                     // We again create a `DropGuard`.
-//!                     let __x_guard = unsafe {
-//!                         ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).x))
-//!                     };
-//!                     // Since initialization has successfully completed, we can now forget
-//!                     // the guards. This is not `mem::forget`, since we only have
-//!                     // `&DropGuard`.
-//!                     ::core::mem::forget(__x_guard);
-//!                     ::core::mem::forget(__t_guard);
-//!                     // Here we use the type checker to ensure that every field has been
-//!                     // initialized exactly once, since this is `if false` it will never get
-//!                     // executed, but still type-checked.
-//!                     // Additionally we abuse `slot` to automatically infer the correct type
-//!                     // for the struct. This is also another check that every field is
-//!                     // accessible from this scope.
-//!                     #[allow(unreachable_code, clippy::diverging_sub_expression)]
-//!                     let _ = || {
-//!                         unsafe {
-//!                             ::core::ptr::write(
-//!                                 slot,
-//!                                 Self {
-//!                                     // We only care about typecheck finding every field
-//!                                     // here, the expression does not matter, just conjure
-//!                                     // one using `panic!()`:
-//!                                     t: ::core::panic!(),
-//!                                     x: ::core::panic!(),
-//!                                 },
-//!                             );
-//!                         };
-//!                     };
-//!                 }
-//!                 // We leave the scope above and gain access to the previously shadowed
-//!                 // `__InitOk` that we need to return.
-//!                 Ok(__InitOk)
-//!             });
-//!             // Change the return type from `__InitOk` to `()`.
-//!             let init = move |
-//!                 slot,
-//!             | -> ::core::result::Result<(), ::core::convert::Infallible> {
-//!                 init(slot).map(|__InitOk| ())
-//!             };
-//!             // Construct the initializer.
-//!             let init = unsafe {
-//!                 ::pin_init::pin_init_from_closure::<
-//!                     _,
-//!                     ::core::convert::Infallible,
-//!                 >(init)
-//!             };
-//!             init
-//!         }
-//!     }
-//! }
-//! ```
-//!
-//! ## `#[pin_data]` on `Foo`
-//!
-//! Since we already took a look at `#[pin_data]` on `Bar`, this section will only explain the
-//! differences/new things in the expansion of the `Foo` definition:
-//!
-//! ```rust,ignore
-//! #[pin_data(PinnedDrop)]
-//! struct Foo {
-//!     a: usize,
-//!     #[pin]
-//!     b: Bar<u32>,
-//! }
-//! ```
-//!
-//! This expands to the following code:
-//!
-//! ```rust,ignore
-//! struct Foo {
-//!     a: usize,
-//!     b: Bar<u32>,
-//! }
-//! const _: () = {
-//!     struct __ThePinData {
-//!         __phantom: ::core::marker::PhantomData<fn(Foo) -> Foo>,
-//!     }
-//!     impl ::core::clone::Clone for __ThePinData {
-//!         fn clone(&self) -> Self {
-//!             *self
-//!         }
-//!     }
-//!     impl ::core::marker::Copy for __ThePinData {}
-//!     #[allow(dead_code)]
-//!     impl __ThePinData {
-//!         unsafe fn b<E>(
-//!             self,
-//!             slot: *mut Bar<u32>,
-//!             init: impl ::pin_init::PinInit<Bar<u32>, E>,
-//!         ) -> ::core::result::Result<(), E> {
-//!             unsafe { ::pin_init::PinInit::__pinned_init(init, slot) }
-//!         }
-//!         unsafe fn a<E>(
-//!             self,
-//!             slot: *mut usize,
-//!             init: impl ::pin_init::Init<usize, E>,
-//!         ) -> ::core::result::Result<(), E> {
-//!             unsafe { ::pin_init::Init::__init(init, slot) }
-//!         }
-//!     }
-//!     unsafe impl ::pin_init::__internal::HasPinData for Foo {
-//!         type PinData = __ThePinData;
-//!         unsafe fn __pin_data() -> Self::PinData {
-//!             __ThePinData {
-//!                 __phantom: ::core::marker::PhantomData,
-//!             }
-//!         }
-//!     }
-//!     unsafe impl ::pin_init::__internal::PinData for __ThePinData {
-//!         type Datee = Foo;
-//!     }
-//!     #[allow(dead_code)]
-//!     struct __Unpin<'__pin> {
-//!         __phantom_pin: ::core::marker::PhantomData<fn(&'__pin ()) -> &'__pin ()>,
-//!         __phantom: ::core::marker::PhantomData<fn(Foo) -> Foo>,
-//!         b: Bar<u32>,
-//!     }
-//!     #[doc(hidden)]
-//!     impl<'__pin> ::core::marker::Unpin for Foo
-//!     where
-//!         __Unpin<'__pin>: ::core::marker::Unpin,
-//!     {}
-//!     // Since we specified `PinnedDrop` as the argument to `#[pin_data]`, we expect `Foo` to
-//!     // implement `PinnedDrop`. Thus we do not need to prevent `Drop` implementations like
-//!     // before, instead we implement `Drop` here and delegate to `PinnedDrop`.
-//!     impl ::core::ops::Drop for Foo {
-//!         fn drop(&mut self) {
-//!             // Since we are getting dropped, no one else has a reference to `self` and thus we
-//!             // can assume that we never move.
-//!             let pinned = unsafe { ::core::pin::Pin::new_unchecked(self) };
-//!             // Create the unsafe token that proves that we are inside of a destructor, this
-//!             // type is only allowed to be created in a destructor.
-//!             let token = unsafe { ::pin_init::__internal::OnlyCallFromDrop::new() };
-//!             ::pin_init::PinnedDrop::drop(pinned, token);
-//!         }
-//!     }
-//! };
-//! ```
-//!
-//! ## `#[pinned_drop]` on `impl PinnedDrop for Foo`
-//!
-//! This macro is used to implement the `PinnedDrop` trait, since that trait is `unsafe` and has an
-//! extra parameter that should not be used at all. The macro hides that parameter.
-//!
-//! Here is the `PinnedDrop` impl for `Foo`:
-//!
-//! ```rust,ignore
-//! #[pinned_drop]
-//! impl PinnedDrop for Foo {
-//!     fn drop(self: Pin<&mut Self>) {
-//!         println!("{self:p} is getting dropped.");
-//!     }
-//! }
-//! ```
-//!
-//! This expands to the following code:
-//!
-//! ```rust,ignore
-//! // `unsafe`, full path and the token parameter are added, everything else stays the same.
-//! unsafe impl ::pin_init::PinnedDrop for Foo {
-//!     fn drop(self: Pin<&mut Self>, _: ::pin_init::__internal::OnlyCallFromDrop) {
-//!         println!("{self:p} is getting dropped.");
-//!     }
-//! }
-//! ```
-//!
-//! ## `pin_init!` on `Foo`
-//!
-//! Since we already took a look at `pin_init!` on `Bar`, this section will only show the expansion
-//! of `pin_init!` on `Foo`:
-//!
-//! ```rust,ignore
-//! let a = 42;
-//! let initializer = pin_init!(Foo {
-//!     a,
-//!     b <- Bar::new(36),
-//! });
-//! ```
-//!
-//! This expands to the following code:
-//!
-//! ```rust,ignore
-//! let a = 42;
-//! let initializer = {
-//!     struct __InitOk;
-//!     let data = unsafe {
-//!         use ::pin_init::__internal::HasPinData;
-//!         Foo::__pin_data()
-//!     };
-//!     let init = ::pin_init::__internal::PinData::make_closure::<
-//!         _,
-//!         __InitOk,
-//!         ::core::convert::Infallible,
-//!     >(data, move |slot| {
-//!         {
-//!             struct __InitOk;
-//!             {
-//!                 unsafe { ::core::ptr::write(::core::addr_of_mut!((*slot).a), a) };
-//!             }
-//!             let __a_guard = unsafe {
-//!                 ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).a))
-//!             };
-//!             let init = Bar::new(36);
-//!             unsafe { data.b(::core::addr_of_mut!((*slot).b), b)? };
-//!             let __b_guard = unsafe {
-//!                 ::pin_init::__internal::DropGuard::new(::core::addr_of_mut!((*slot).b))
-//!             };
-//!             ::core::mem::forget(__b_guard);
-//!             ::core::mem::forget(__a_guard);
-//!             #[allow(unreachable_code, clippy::diverging_sub_expression)]
-//!             let _ = || {
-//!                 unsafe {
-//!                     ::core::ptr::write(
-//!                         slot,
-//!                         Foo {
-//!                             a: ::core::panic!(),
-//!                             b: ::core::panic!(),
-//!                         },
-//!                     );
-//!                 };
-//!             };
-//!         }
-//!         Ok(__InitOk)
-//!     });
-//!     let init = move |
-//!         slot,
-//!     | -> ::core::result::Result<(), ::core::convert::Infallible> {
-//!         init(slot).map(|__InitOk| ())
-//!     };
-//!     let init = unsafe {
-//!         ::pin_init::pin_init_from_closure::<_, ::core::convert::Infallible>(init)
-//!     };
-//!     init
-//! };
-//! ```
-
-#[cfg(kernel)]
-pub use ::macros::paste;
-#[cfg(not(kernel))]
-pub use ::paste::paste;
-
-/// The internal init macro. Do not call manually!
-///
-/// This is called by the `{try_}{pin_}init!` macros with various inputs.
-///
-/// This macro has multiple internal call configurations, these are always the very first ident:
-/// - nothing: this is the base case and called by the `{try_}{pin_}init!` macros.
-/// - `with_update_parsed`: when the `..Zeroable::init_zeroed()` syntax has been handled.
-/// - `init_slot`: recursively creates the code that initializes all fields in `slot`.
-/// - `make_initializer`: recursively create the struct initializer that guarantees that every
-///   field has been initialized exactly once.
-#[doc(hidden)]
-#[macro_export]
-macro_rules! __init_internal {
-    (
-        @this($($this:ident)?),
-        @typ($t:path),
-        @fields($($fields:tt)*),
-        @error($err:ty),
-        // Either `PinData` or `InitData`, `$use_data` should only be present in the `PinData`
-        // case.
-        @data($data:ident, $($use_data:ident)?),
-        // `HasPinData` or `HasInitData`.
-        @has_data($has_data:ident, $get_data:ident),
-        // `pin_init_from_closure` or `init_from_closure`.
-        @construct_closure($construct_closure:ident),
-        @munch_fields(),
-    ) => {
-        $crate::__init_internal!(with_update_parsed:
-            @this($($this)?),
-            @typ($t),
-            @fields($($fields)*),
-            @error($err),
-            @data($data, $($use_data)?),
-            @has_data($has_data, $get_data),
-            @construct_closure($construct_closure),
-            @init_zeroed(), // Nothing means default behavior.
-        )
-    };
-    (
-        @this($($this:ident)?),
-        @typ($t:path),
-        @fields($($fields:tt)*),
-        @error($err:ty),
-        // Either `PinData` or `InitData`, `$use_data` should only be present in the `PinData`
-        // case.
-        @data($data:ident, $($use_data:ident)?),
-        // `HasPinData` or `HasInitData`.
-        @has_data($has_data:ident, $get_data:ident),
-        // `pin_init_from_closure` or `init_from_closure`.
-        @construct_closure($construct_closure:ident),
-        @munch_fields(..Zeroable::init_zeroed()),
-    ) => {
-        $crate::__init_internal!(with_update_parsed:
-            @this($($this)?),
-            @typ($t),
-            @fields($($fields)*),
-            @error($err),
-            @data($data, $($use_data)?),
-            @has_data($has_data, $get_data),
-            @construct_closure($construct_closure),
-            @init_zeroed(()), // `()` means zero all fields not mentioned.
-        )
-    };
-    (
-        @this($($this:ident)?),
-        @typ($t:path),
-        @fields($($fields:tt)*),
-        @error($err:ty),
-        // Either `PinData` or `InitData`, `$use_data` should only be present in the `PinData`
-        // case.
-        @data($data:ident, $($use_data:ident)?),
-        // `HasPinData` or `HasInitData`.
-        @has_data($has_data:ident, $get_data:ident),
-        // `pin_init_from_closure` or `init_from_closure`.
-        @construct_closure($construct_closure:ident),
-        @munch_fields($ignore:tt $($rest:tt)*),
-    ) => {
-        $crate::__init_internal!(
-            @this($($this)?),
-            @typ($t),
-            @fields($($fields)*),
-            @error($err),
-            @data($data, $($use_data)?),
-            @has_data($has_data, $get_data),
-            @construct_closure($construct_closure),
-            @munch_fields($($rest)*),
-        )
-    };
-    (with_update_parsed:
-        @this($($this:ident)?),
-        @typ($t:path),
-        @fields($($fields:tt)*),
-        @error($err:ty),
-        // Either `PinData` or `InitData`, `$use_data` should only be present in the `PinData`
-        // case.
-        @data($data:ident, $($use_data:ident)?),
-        // `HasPinData` or `HasInitData`.
-        @has_data($has_data:ident, $get_data:ident),
-        // `pin_init_from_closure` or `init_from_closure`.
-        @construct_closure($construct_closure:ident),
-        @init_zeroed($($init_zeroed:expr)?),
-    ) => {{
-        // We do not want to allow arbitrary returns, so we declare this type as the `Ok` return
-        // type and shadow it later when we insert the arbitrary user code. That way there will be
-        // no possibility of returning without `unsafe`.
-        struct __InitOk;
-        // Get the data about fields from the supplied type.
-        //
-        // SAFETY: TODO.
-        let data = unsafe {
-            use $crate::__internal::$has_data;
-            // Here we abuse `paste!` to retokenize `$t`. Declarative macros have some internal
-            // information that is associated to already parsed fragments, so a path fragment
-            // cannot be used in this position. Doing the retokenization results in valid rust
-            // code.
-            $crate::macros::paste!($t::$get_data())
-        };
-        // Ensure that `data` really is of type `$data` and help with type inference:
-        let init = $crate::__internal::$data::make_closure::<_, __InitOk, $err>(
-            data,
-            move |slot| {
-                {
-                    // Shadow the structure so it cannot be used to return early.
-                    struct __InitOk;
-                    // If `$init_zeroed` is present we should zero the slot now and not emit an
-                    // error when fields are missing (since they will be zeroed). We also have to
-                    // check that the type actually implements `Zeroable`.
-                    $({
-                        fn assert_zeroable<T: $crate::Zeroable>(_: *mut T) {}
-                        // Ensure that the struct is indeed `Zeroable`.
-                        assert_zeroable(slot);
-                        // SAFETY: The type implements `Zeroable` by the check above.
-                        unsafe { ::core::ptr::write_bytes(slot, 0, 1) };
-                        $init_zeroed // This will be `()` if set.
-                    })?
-                    // Create the `this` so it can be referenced by the user inside of the
-                    // expressions creating the individual fields.
-                    $(let $this = unsafe { ::core::ptr::NonNull::new_unchecked(slot) };)?
-                    // Initialize every field.
-                    $crate::__init_internal!(init_slot($($use_data)?):
-                        @data(data),
-                        @slot(slot),
-                        @guards(),
-                        @munch_fields($($fields)*,),
-                    );
-                    // We use unreachable code to ensure that all fields have been mentioned exactly
-                    // once, this struct initializer will still be type-checked and complain with a
-                    // very natural error message if a field is forgotten/mentioned more than once.
-                    #[allow(unreachable_code, clippy::diverging_sub_expression)]
-                    let _ = || {
-                        $crate::__init_internal!(make_initializer:
-                            @slot(slot),
-                            @type_name($t),
-                            @munch_fields($($fields)*,),
-                            @acc(),
-                        );
-                    };
-                }
-                Ok(__InitOk)
-            }
-        );
-        let init = move |slot| -> ::core::result::Result<(), $err> {
-            init(slot).map(|__InitOk| ())
-        };
-        // SAFETY: TODO.
-        let init = unsafe { $crate::$construct_closure::<_, $err>(init) };
-        init
-    }};
-    (init_slot($($use_data:ident)?):
-        @data($data:ident),
-        @slot($slot:ident),
-        @guards($($guards:ident,)*),
-        @munch_fields($(..Zeroable::init_zeroed())? $(,)?),
-    ) => {
-        // Endpoint of munching, no fields are left. If execution reaches this point, all fields
-        // have been initialized. Therefore we can now dismiss the guards by forgetting them.
-        $(::core::mem::forget($guards);)*
-    };
-    (init_slot($($use_data:ident)?):
-        @data($data:ident),
-        @slot($slot:ident),
-        @guards($($guards:ident,)*),
-        // arbitrary code block
-        @munch_fields(_: { $($code:tt)* }, $($rest:tt)*),
-    ) => {
-        { $($code)* }
-        $crate::__init_internal!(init_slot($($use_data)?):
-            @data($data),
-            @slot($slot),
-            @guards($($guards,)*),
-            @munch_fields($($rest)*),
-        );
-    };
-    (init_slot($use_data:ident): // `use_data` is present, so we use the `data` to init fields.
-        @data($data:ident),
-        @slot($slot:ident),
-        @guards($($guards:ident,)*),
-        // In-place initialization syntax.
-        @munch_fields($field:ident <- $val:expr, $($rest:tt)*),
-    ) => {
-        let init = $val;
-        // Call the initializer.
-        //
-        // SAFETY: `slot` is valid, because we are inside of an initializer closure, we
-        // return when an error/panic occurs.
-        // We also use the `data` to require the correct trait (`Init` or `PinInit`) for `$field`.
-        unsafe { $data.$field(::core::ptr::addr_of_mut!((*$slot).$field), init)? };
-        // SAFETY:
-        // - the project function does the correct field projection,
-        // - the field has been initialized,
-        // - the reference is only valid until the end of the initializer.
-        #[allow(unused_variables)]
-        let $field = $crate::macros::paste!(unsafe { $data.[< __project_ $field >](&mut (*$slot).$field) });
-
-        // Create the drop guard:
-        //
-        // We rely on macro hygiene to make it impossible for users to access this local variable.
-        // We use `paste!` to create new hygiene for `$field`.
-        $crate::macros::paste! {
-            // SAFETY: We forget the guard later when initialization has succeeded.
-            let [< __ $field _guard >] = unsafe {
-                $crate::__internal::DropGuard::new(::core::ptr::addr_of_mut!((*$slot).$field))
-            };
-
-            $crate::__init_internal!(init_slot($use_data):
-                @data($data),
-                @slot($slot),
-                @guards([< __ $field _guard >], $($guards,)*),
-                @munch_fields($($rest)*),
-            );
-        }
-    };
-    (init_slot(): // No `use_data`, so we use `Init::__init` directly.
-        @data($data:ident),
-        @slot($slot:ident),
-        @guards($($guards:ident,)*),
-        // In-place initialization syntax.
-        @munch_fields($field:ident <- $val:expr, $($rest:tt)*),
-    ) => {
-        let init = $val;
-        // Call the initializer.
-        //
-        // SAFETY: `slot` is valid, because we are inside of an initializer closure, we
-        // return when an error/panic occurs.
-        unsafe { $crate::Init::__init(init, ::core::ptr::addr_of_mut!((*$slot).$field))? };
-
-        // SAFETY:
-        // - the field is not structurally pinned, since the line above must compile,
-        // - the field has been initialized,
-        // - the reference is only valid until the end of the initializer.
-        #[allow(unused_variables)]
-        let $field = unsafe { &mut (*$slot).$field };
-
-        // Create the drop guard:
-        //
-        // We rely on macro hygiene to make it impossible for users to access this local variable.
-        // We use `paste!` to create new hygiene for `$field`.
-        $crate::macros::paste! {
-            // SAFETY: We forget the guard later when initialization has succeeded.
-            let [< __ $field _guard >] = unsafe {
-                $crate::__internal::DropGuard::new(::core::ptr::addr_of_mut!((*$slot).$field))
-            };
-
-            $crate::__init_internal!(init_slot():
-                @data($data),
-                @slot($slot),
-                @guards([< __ $field _guard >], $($guards,)*),
-                @munch_fields($($rest)*),
-            );
-        }
-    };
-    (init_slot(): // No `use_data`, so all fields are not structurally pinned
-        @data($data:ident),
-        @slot($slot:ident),
-        @guards($($guards:ident,)*),
-        // Init by-value.
-        @munch_fields($field:ident $(: $val:expr)?, $($rest:tt)*),
-    ) => {
-        {
-            $(let $field = $val;)?
-            // Initialize the field.
-            //
-            // SAFETY: The memory at `slot` is uninitialized.
-            unsafe { ::core::ptr::write(::core::ptr::addr_of_mut!((*$slot).$field), $field) };
-        }
-
-        #[allow(unused_variables)]
-        // SAFETY:
-        // - the field is not structurally pinned, since no `use_data` was required to create this
-        //   initializer,
-        // - the field has been initialized,
-        // - the reference is only valid until the end of the initializer.
-        let $field = unsafe { &mut (*$slot).$field };
-
-        // Create the drop guard:
-        //
-        // We rely on macro hygiene to make it impossible for users to access this local variable.
-        // We use `paste!` to create new hygiene for `$field`.
-        $crate::macros::paste! {
-            // SAFETY: We forget the guard later when initialization has succeeded.
-            let [< __ $field _guard >] = unsafe {
-                $crate::__internal::DropGuard::new(::core::ptr::addr_of_mut!((*$slot).$field))
-            };
-
-            $crate::__init_internal!(init_slot():
-                @data($data),
-                @slot($slot),
-                @guards([< __ $field _guard >], $($guards,)*),
-                @munch_fields($($rest)*),
-            );
-        }
-    };
-    (init_slot($use_data:ident):
-        @data($data:ident),
-        @slot($slot:ident),
-        @guards($($guards:ident,)*),
-        // Init by-value.
-        @munch_fields($field:ident $(: $val:expr)?, $($rest:tt)*),
-    ) => {
-        {
-            $(let $field = $val;)?
-            // Initialize the field.
-            //
-            // SAFETY: The memory at `slot` is uninitialized.
-            unsafe { ::core::ptr::write(::core::ptr::addr_of_mut!((*$slot).$field), $field) };
-        }
-        // SAFETY:
-        // - the project function does the correct field projection,
-        // - the field has been initialized,
-        // - the reference is only valid until the end of the initializer.
-        #[allow(unused_variables)]
-        let $field = $crate::macros::paste!(unsafe { $data.[< __project_ $field >](&mut (*$slot).$field) });
-
-        // Create the drop guard:
-        //
-        // We rely on macro hygiene to make it impossible for users to access this local variable.
-        // We use `paste!` to create new hygiene for `$field`.
-        $crate::macros::paste! {
-            // SAFETY: We forget the guard later when initialization has succeeded.
-            let [< __ $field _guard >] = unsafe {
-                $crate::__internal::DropGuard::new(::core::ptr::addr_of_mut!((*$slot).$field))
-            };
-
-            $crate::__init_internal!(init_slot($use_data):
-                @data($data),
-                @slot($slot),
-                @guards([< __ $field _guard >], $($guards,)*),
-                @munch_fields($($rest)*),
-            );
-        }
-    };
-    (make_initializer:
-        @slot($slot:ident),
-        @type_name($t:path),
-        @munch_fields(_: { $($code:tt)* }, $($rest:tt)*),
-        @acc($($acc:tt)*),
-    ) => {
-        // code blocks are ignored for the initializer check
-        $crate::__init_internal!(make_initializer:
-            @slot($slot),
-            @type_name($t),
-            @munch_fields($($rest)*),
-            @acc($($acc)*),
-        );
-    };
-    (make_initializer:
-        @slot($slot:ident),
-        @type_name($t:path),
-        @munch_fields(..Zeroable::init_zeroed() $(,)?),
-        @acc($($acc:tt)*),
-    ) => {
-        // Endpoint, nothing more to munch, create the initializer. Since the users specified
-        // `..Zeroable::init_zeroed()`, the slot will already have been zeroed and all field that have
-        // not been overwritten are thus zero and initialized. We still check that all fields are
-        // actually accessible by using the struct update syntax ourselves.
-        // We are inside of a closure that is never executed and thus we can abuse `slot` to
-        // get the correct type inference here:
-        #[allow(unused_assignments)]
-        unsafe {
-            let mut zeroed = ::core::mem::zeroed();
-            // We have to use type inference here to make zeroed have the correct type. This does
-            // not get executed, so it has no effect.
-            ::core::ptr::write($slot, zeroed);
-            zeroed = ::core::mem::zeroed();
-            // Here we abuse `paste!` to retokenize `$t`. Declarative macros have some internal
-            // information that is associated to already parsed fragments, so a path fragment
-            // cannot be used in this position. Doing the retokenization results in valid rust
-            // code.
-            $crate::macros::paste!(
-                ::core::ptr::write($slot, $t {
-                    $($acc)*
-                    ..zeroed
-                });
-            );
-        }
-    };
-    (make_initializer:
-        @slot($slot:ident),
-        @type_name($t:path),
-        @munch_fields($(,)?),
-        @acc($($acc:tt)*),
-    ) => {
-        // Endpoint, nothing more to munch, create the initializer.
-        // Since we are in the closure that is never called, this will never get executed.
-        // We abuse `slot` to get the correct type inference here:
-        //
-        // SAFETY: TODO.
-        unsafe {
-            // Here we abuse `paste!` to retokenize `$t`. Declarative macros have some internal
-            // information that is associated to already parsed fragments, so a path fragment
-            // cannot be used in this position. Doing the retokenization results in valid rust
-            // code.
-            $crate::macros::paste!(
-                ::core::ptr::write($slot, $t {
-                    $($acc)*
-                });
-            );
-        }
-    };
-    (make_initializer:
-        @slot($slot:ident),
-        @type_name($t:path),
-        @munch_fields($field:ident <- $val:expr, $($rest:tt)*),
-        @acc($($acc:tt)*),
-    ) => {
-        $crate::__init_internal!(make_initializer:
-            @slot($slot),
-            @type_name($t),
-            @munch_fields($($rest)*),
-            @acc($($acc)* $field: ::core::panic!(),),
-        );
-    };
-    (make_initializer:
-        @slot($slot:ident),
-        @type_name($t:path),
-        @munch_fields($field:ident $(: $val:expr)?, $($rest:tt)*),
-        @acc($($acc:tt)*),
-    ) => {
-        $crate::__init_internal!(make_initializer:
-            @slot($slot),
-            @type_name($t),
-            @munch_fields($($rest)*),
-            @acc($($acc)* $field: ::core::panic!(),),
-        );
-    };
-}
-- 
2.52.0

