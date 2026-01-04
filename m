Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F78026FA6F
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 21:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562512; cv=none; b=gpKHxPKWIOV7fdxWRRfCoj/ZhRYMeJHNO4xhiUTJLd7rdOU60F9w+4HJXuOS0jKxeZlDkvYLO+Wahqsp1pcRuaK/c2chq3KyGBDDgjMFnGP0W62vpPhwEbUwfO1WbRj3oRuCyz2pClUKjUXOtDthr7+GwTUVQ3VshtKbFnhTW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562512; c=relaxed/simple;
	bh=IisgePLmNcXGHHGlJ8EbhrHb8f4Xc9KKYs2LKvMEEe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAeVI8PfrjOnA0i3S08zHLerxeE/6Z9srbz6DvHkI4W7WN+6t78CysOLbapa0gBuXLtZo88F2YSC+fMg0n0Z8Nd9rBu36RfyAOLurt6OtC+mE1A+jt8DVTw+puTrkvjgg3SHjWGBdBZj5UykNKRTIjYR5P27FoSmP1z38GaLABs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9AdB0JH; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9AdB0JH"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5942b58ac81so10909487e87.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 13:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767562508; x=1768167308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4WwRVntzgwNGXu0WgC9BB2t8SDr3tP+hir6ZruSJcw=;
        b=E9AdB0JHOwfZv8KJYqLhKjfUEDl/3VTBDLqy6Nhv4FLMkt0INXIaQYBqHuBg5wtcSo
         /cmruPSoG3brjnXd/KrVzS8AVwKFi8FcVIq7nFpw5RUCZIQPHrAH5lhE5SINV/gZC97h
         9PmTb9H5JQZaO2+jFyGF3A1voyel9klDNHA0BMkQM/NROcnbVdBhSHjIvpP8NPajl4mC
         40DbABJXkhXMo2b8+j41KvBC7apcouy2iGtnCnEVxEvttvkF7C0m9dBZ+H8XOZCAcRSU
         JflTHQJ7jZGvcEPRI4ZaeEi5tv2YIFMUuTd/0jTOjMplqyyGz9r6Fv4nR+nVXMR6uVNG
         HpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767562508; x=1768167308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4WwRVntzgwNGXu0WgC9BB2t8SDr3tP+hir6ZruSJcw=;
        b=rMd9xGcPbnzAAd+Jg6yIFxhTFKmOGg+/OIelpdpekP7FtL06DojEDKZRTST/aZPIsH
         qitN0kNgtSrv/tUyLC6v0g9GZaHMUsPRY5KVd/jkK4Sk7ThSLbpgTHD+BYuX9N8RMp+2
         NULeMKD7k8cQ9uDuYrsqp60Gi/Z5lHloOVeQTMJmL5beMpPAx98I1UYLGGoHg1pjZm1h
         XI4Z7PEls/roZ58QdM2D2dFJPsLjv8nZW36M0leale57HxzJHVVTiDGLcMDq/2WiySxS
         8JmVqiM/Sp5TpZSsSPVmlFxFZZf3h3xFFb67RoIXNj9LsWOu+WVV9r+G+iT0xa/nPnTE
         j/aw==
X-Forwarded-Encrypted: i=1; AJvYcCWlmW/4MnEt9DahO/mTXtH8LvIdv8Ypj6//RJVK1/xOb3pD5q19db/riIkB+7kGkDtCL/SE3JSbDy3BJl3Uhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2t/RzOAQ6Ph+xQGWYdPrVMKKJ1Lk8Qxn9T82FqPv4PtEalxoN
	WfNmj+oyGbZ4zbhwRL14z6bcu+bnwvZPh8hdCL9pr+9aD77P0Tj7/WhiOUsDVzPWRqoe5GwrYYM
	ZOatVy0CWSIJkbxokC1ff/Ov8rIbvqy4=
X-Gm-Gg: AY/fxX5ot5fOEswUiznxhgGWdebfdzctWpb9oSnwZx8oDm/aKYx9HKuWXn7K6EBSCSl
	tgcLRZ4rrUllAv8KYQ0UKgRdYYNI45ssXP2ySwHpOowt4CQZ4BYjzSwS8sVF77gjr+PTak6rsav
	EvEnwR3jxeNBSpZubsXrKHTKSRS3ATzVSmtFEeGs2NkozSzYiC32iNk0rcA9Sns3O78h/rSpKe0
	Plej4vBgc2To1ztOuW17nuvk4OmDSeDh5+MhGJ+j/MvXuTi333H0q3OfpjMLnYsf0K97kDdkr2J
	legAUkgbkHrXgvBEOUJqCCnmaRoKukjUKHO06chieLt+zdMC8s9cO0onh7OIQWB2j2Bko3YmigR
	IDjKf58r55aQ4V9akkBL/xqJd/qUKjf5WSijjjZe7c1OwfB/pOmDU
X-Google-Smtp-Source: AGHT+IG0xh9RqTMK7nSyC8onEu3cDYzFFGSgjaSZqkFBC8e26AMCY7awmJcDKUeMwlsJHFnW0f3eeRa+woB5JMeKzN0=
X-Received: by 2002:a05:6512:3c83:b0:598:edd4:d4a with SMTP id
 2adb3069b0e04-59a17deea8bmr15594666e87.44.1767562507978; Sun, 04 Jan 2026
 13:35:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211185805.2835633-1-gary@kernel.org> <20251211185805.2835633-6-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-6-gary@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 16:34:31 -0500
X-Gm-Features: AQt7F2pRKK1MgWv4A41EEUMlF7ro5shJm4zkntNW1kDmY3i7kBMQHeRA5y0vPi0
Message-ID: <CAJ-ks9nBw=cW_Ri7CpJLV7qRwiTA=AJ2LMfQe3OQVB7vC1YL1A@mail.gmail.com>
Subject: Re: [PATCH 05/11] rust: macros: use `quote!` for `module!` macro
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> This has no behavioural change, but is good for maintainability. With
> `quote!`, we're no longer using string templates, so we don't need to
> quote " and {} inside the template anymore. Further more, editors can
> now highlight the code template.
>
> This also improves the robustness as it eliminates the need for string
> quoting and escaping.
>
> Co-developed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

>  rust/Makefile         |   8 +-
>  rust/macros/module.rs | 427 ++++++++++++++++++++++--------------------
>  2 files changed, 229 insertions(+), 206 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index c816ca8663e42..96f0ac53ec0e8 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -215,7 +215,7 @@ rustdoc-pin_init_internal: private rustc_target_flags=
 =3D --cfg kernel \
>      --extern proc_macro --extern proc_macro2 --extern quote --extern syn=
 \
>      --crate-type proc-macro
>  rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
> -    rustdoc-clean FORCE
> +    rustdoc-clean rustdoc-proc_macro2 rustdoc-quote rustdoc-syn FORCE
>         +$(call if_changed,rustdoc)
>
>  rustdoc-pin_init: private rustdoc_host =3D yes
> @@ -276,7 +276,8 @@ rusttestlib-macros: $(src)/macros/lib.rs \
>  rusttestlib-pin_init_internal: private rustc_target_flags =3D --cfg kern=
el \
>      --extern proc_macro --extern proc_macro2 --extern quote --extern syn
>  rusttestlib-pin_init_internal: private rustc_test_library_proc =3D yes
> -rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
> +rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
> +    rusttestlib-proc_macro2 rusttestlib-quote rusttestlib-syn FORCE
>         +$(call if_changed,rustc_test_library)
>
>  rusttestlib-pin_init: private rustc_target_flags =3D --extern pin_init_i=
nternal \
> @@ -550,7 +551,8 @@ $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)=
/libproc_macro2.rlib \
>
>  $(obj)/$(libpin_init_internal_name): private rustc_target_flags =3D --cf=
g kernel \
>      --extern proc_macro2 --extern quote --extern syn
> -$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs=
 FORCE
> +$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs=
 \
> +       $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rli=
b FORCE
>         +$(call if_changed_dep,rustc_procmacro)
>
>  quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_=
QUIET)) L $@
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index e4d51878a5360..4a02aadef25a7 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -1,11 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0
>
> -use std::fmt::Write;
> +use std::ffi::CString;
>
>  use proc_macro2::{
>      Literal,
> +    Span,
>      TokenStream, //
>  };
> +use quote::{
> +    format_ident,
> +    quote, //
> +};
>  use syn::{
>      bracketed,
>      parse::{
> @@ -26,7 +31,7 @@
>  struct ModInfoBuilder<'a> {
>      module: &'a str,
>      counter: usize,
> -    buffer: String,
> +    ts: TokenStream,
>  }
>
>  impl<'a> ModInfoBuilder<'a> {
> @@ -34,7 +39,7 @@ fn new(module: &'a str) -> Self {
>          ModInfoBuilder {
>              module,
>              counter: 0,
> -            buffer: String::new(),
> +            ts: TokenStream::new(),
>          }
>      }
>
> @@ -51,27 +56,26 @@ fn emit_base(&mut self, field: &str, content: &str, b=
uiltin: bool) {
>              // Loadable modules' modinfo strings go as-is.
>              format!("{field}=3D{content}\0")
>          };
> +        let length =3D string.len();
> +        let string =3D Literal::byte_string(string.as_bytes());
> +        let cfg =3D if builtin {
> +            quote!(#[cfg(not(MODULE))])
> +        } else {
> +            quote!(#[cfg(MODULE)])
> +        };
>
> -        write!(
> -            &mut self.buffer,
> -            "
> -                {cfg}
> -                #[doc(hidden)]
> -                #[cfg_attr(not(target_os =3D \"macos\"), link_section =
=3D \".modinfo\")]
> -                #[used(compiler)]
> -                pub static __{module}_{counter}: [u8; {length}] =3D *{st=
ring};
> -            ",
> -            cfg =3D if builtin {
> -                "#[cfg(not(MODULE))]"
> -            } else {
> -                "#[cfg(MODULE)]"
> -            },
> +        let counter =3D format_ident!(
> +            "__{module}_{counter}",
>              module =3D self.module.to_uppercase(),
> -            counter =3D self.counter,
> -            length =3D string.len(),
> -            string =3D Literal::byte_string(string.as_bytes()),
> -        )
> -        .unwrap();
> +            counter =3D self.counter
> +        );
> +        self.ts.extend(quote! {
> +            #cfg
> +            #[doc(hidden)]
> +            #[cfg_attr(not(target_os =3D "macos"), link_section =3D ".mo=
dinfo")]
> +            #[used(compiler)]
> +            pub static #counter: [u8; #length] =3D *#string;
> +        });
>
>          self.counter +=3D 1;
>      }
> @@ -281,24 +285,36 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
>  }
>
>  pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
> +    let ModuleInfo {
> +        type_,
> +        license,
> +        name,
> +        authors,
> +        description,
> +        alias,
> +        firmware,
> +    } =3D info;
> +
> +    let type_ =3D Ident::new(&type_, Span::mixed_site());
> +
>      // Rust does not allow hyphens in identifiers, use underscore instea=
d.
> -    let ident =3D info.name.replace('-', "_");
> +    let ident =3D name.replace('-', "_");
>      let mut modinfo =3D ModInfoBuilder::new(ident.as_ref());
> -    if let Some(authors) =3D info.authors {
> +    if let Some(authors) =3D authors {
>          for author in authors {
>              modinfo.emit("author", &author);
>          }
>      }
> -    if let Some(description) =3D info.description {
> +    if let Some(description) =3D description {
>          modinfo.emit("description", &description);
>      }
> -    modinfo.emit("license", &info.license);
> -    if let Some(aliases) =3D info.alias {
> +    modinfo.emit("license", &license);
> +    if let Some(aliases) =3D alias {
>          for alias in aliases {
>              modinfo.emit("alias", &alias);
>          }
>      }
> -    if let Some(firmware) =3D info.firmware {
> +    if let Some(firmware) =3D firmware {
>          for fw in firmware {
>              modinfo.emit("firmware", &fw);
>          }
> @@ -309,179 +325,184 @@ pub(crate) fn module(info: ModuleInfo) -> Result<=
TokenStream> {
>          std::env::var("RUST_MODFILE").expect("Unable to fetch RUST_MODFI=
LE environmental variable");
>      modinfo.emit_only_builtin("file", &file);
>
> -    Ok(format!(
> -        "
> -            /// The module name.
> -            ///
> -            /// Used by the printing macros, e.g. [`info!`].
> -            const __LOG_PREFIX: &[u8] =3D b\"{name}\\0\";
> -
> -            // SAFETY: `__this_module` is constructed by the kernel at l=
oad time and will not be
> -            // freed until the module is unloaded.
> -            #[cfg(MODULE)]
> -            static THIS_MODULE: ::kernel::ThisModule =3D unsafe {{
> -                extern \"C\" {{
> -                    static __this_module: ::kernel::types::Opaque<::kern=
el::bindings::module>;
> -                }}
> -
> -                ::kernel::ThisModule::from_ptr(__this_module.get())
> -            }};
> -            #[cfg(not(MODULE))]
> -            static THIS_MODULE: ::kernel::ThisModule =3D unsafe {{
> -                ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
> -            }};
> -
> -            /// The `LocalModule` type is the type of the module created=
 by `module!`,
> -            /// `module_pci_driver!`, `module_platform_driver!`, etc.
> -            type LocalModule =3D {type_};
> -
> -            impl ::kernel::ModuleMetadata for {type_} {{
> -                const NAME: &'static ::kernel::str::CStr =3D c\"{name}\"=
;
> -            }}
> -
> -            // Double nested modules, since then nobody can access the p=
ublic items inside.
> -            mod __module_init {{
> -                mod __module_init {{
> -                    use super::super::{type_};
> -                    use pin_init::PinInit;
> -
> -                    /// The \"Rust loadable module\" mark.
> -                    //
> -                    // This may be best done another way later on, e.g. =
as a new modinfo
> -                    // key or a new section. For the moment, keep it sim=
ple.
> -                    #[cfg(MODULE)]
> -                    #[doc(hidden)]
> -                    #[used(compiler)]
> -                    static __IS_RUST_MODULE: () =3D ();
> -
> -                    static mut __MOD: ::core::mem::MaybeUninit<{type_}> =
=3D
> -                        ::core::mem::MaybeUninit::uninit();
> -
> -                    // Loadable modules need to export the `{{init,clean=
up}}_module` identifiers.
> -                    /// # Safety
> -                    ///
> -                    /// This function must not be called after module in=
itialization, because it may be
> -                    /// freed after that completes.
> -                    #[cfg(MODULE)]
> -                    #[doc(hidden)]
> -                    #[no_mangle]
> -                    #[link_section =3D \".init.text\"]
> -                    pub unsafe extern \"C\" fn init_module() -> ::kernel=
::ffi::c_int {{
> -                        // SAFETY: This function is inaccessible to the =
outside due to the double
> -                        // module wrapping it. It is called exactly once=
 by the C side via its
> -                        // unique name.
> -                        unsafe {{ __init() }}
> -                    }}
> -
> -                    #[cfg(MODULE)]
> -                    #[doc(hidden)]
> -                    #[used(compiler)]
> -                    #[link_section =3D \".init.data\"]
> -                    static __UNIQUE_ID___addressable_init_module: unsafe=
 extern \"C\" fn() -> i32 =3D init_module;
> -
> -                    #[cfg(MODULE)]
> -                    #[doc(hidden)]
> -                    #[no_mangle]
> -                    #[link_section =3D \".exit.text\"]
> -                    pub extern \"C\" fn cleanup_module() {{
> -                        // SAFETY:
> -                        // - This function is inaccessible to the outsid=
e due to the double
> -                        //   module wrapping it. It is called exactly on=
ce by the C side via its
> -                        //   unique name,
> -                        // - furthermore it is only called after `init_m=
odule` has returned `0`
> -                        //   (which delegates to `__init`).
> -                        unsafe {{ __exit() }}
> -                    }}
> -
> -                    #[cfg(MODULE)]
> -                    #[doc(hidden)]
> -                    #[used(compiler)]
> -                    #[link_section =3D \".exit.data\"]
> -                    static __UNIQUE_ID___addressable_cleanup_module: ext=
ern \"C\" fn() =3D cleanup_module;
> -
> -                    // Built-in modules are initialized through an initc=
all pointer
> -                    // and the identifiers need to be unique.
> -                    #[cfg(not(MODULE))]
> -                    #[cfg(not(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS))]
> -                    #[doc(hidden)]
> -                    #[link_section =3D \"{initcall_section}\"]
> -                    #[used(compiler)]
> -                    pub static __{ident}_initcall: extern \"C\" fn() ->
> -                        ::kernel::ffi::c_int =3D __{ident}_init;
> -
> -                    #[cfg(not(MODULE))]
> -                    #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
> -                    ::core::arch::global_asm!(
> -                        r#\".section \"{initcall_section}\", \"a\"
> -                        __{ident}_initcall:
> -                            .long   __{ident}_init - .
> -                            .previous
> -                        \"#
> -                    );
> -
> -                    #[cfg(not(MODULE))]
> -                    #[doc(hidden)]
> -                    #[no_mangle]
> -                    pub extern \"C\" fn __{ident}_init() -> ::kernel::ff=
i::c_int {{
> -                        // SAFETY: This function is inaccessible to the =
outside due to the double
> -                        // module wrapping it. It is called exactly once=
 by the C side via its
> -                        // placement above in the initcall section.
> -                        unsafe {{ __init() }}
> -                    }}
> -
> -                    #[cfg(not(MODULE))]
> -                    #[doc(hidden)]
> -                    #[no_mangle]
> -                    pub extern \"C\" fn __{ident}_exit() {{
> -                        // SAFETY:
> -                        // - This function is inaccessible to the outsid=
e due to the double
> -                        //   module wrapping it. It is called exactly on=
ce by the C side via its
> -                        //   unique name,
> -                        // - furthermore it is only called after `__{ide=
nt}_init` has
> -                        //   returned `0` (which delegates to `__init`).
> -                        unsafe {{ __exit() }}
> -                    }}
> -
> -                    /// # Safety
> -                    ///
> -                    /// This function must only be called once.
> -                    unsafe fn __init() -> ::kernel::ffi::c_int {{
> -                        let initer =3D
> -                            <{type_} as ::kernel::InPlaceModule>::init(&=
super::super::THIS_MODULE);
> -                        // SAFETY: No data race, since `__MOD` can only =
be accessed by this module
> -                        // and there only `__init` and `__exit` access i=
t. These functions are only
> -                        // called once and `__exit` cannot be called bef=
ore or during `__init`.
> -                        match unsafe {{ initer.__pinned_init(__MOD.as_mu=
t_ptr()) }} {{
> -                            Ok(m) =3D> 0,
> -                            Err(e) =3D> e.to_errno(),
> -                        }}
> -                    }}
> -
> -                    /// # Safety
> -                    ///
> -                    /// This function must
> -                    /// - only be called once,
> -                    /// - be called after `__init` has been called and r=
eturned `0`.
> -                    unsafe fn __exit() {{
> -                        // SAFETY: No data race, since `__MOD` can only =
be accessed by this module
> -                        // and there only `__init` and `__exit` access i=
t. These functions are only
> -                        // called once and `__init` was already called.
> -                        unsafe {{
> -                            // Invokes `drop()` on `__MOD`, which should=
 be used for cleanup.
> -                            __MOD.assume_init_drop();
> -                        }}
> -                    }}
> -
> -                    {modinfo}
> -                }}
> -            }}
> -        ",
> -        type_ =3D info.type_,
> -        name =3D info.name,
> -        ident =3D ident,
> -        modinfo =3D modinfo.buffer,
> -        initcall_section =3D ".initcall6.init"
> -    )
> -    .parse()
> -    .expect("Error parsing formatted string into token stream."))
> +    let modinfo =3D modinfo.ts;
> +
> +    let ident_init =3D format_ident!("__{ident}_init");
> +    let ident_exit =3D format_ident!("__{ident}_exit");
> +    let ident_initcall =3D format_ident!("__{ident}_initcall");
> +    let initcall_section =3D ".initcall6.init";
> +
> +    let global_asm =3D format!(
> +        r#".section "{initcall_section}", "a"
> +        __{ident}_initcall:
> +            .long   __{ident}_init - .
> +            .previous
> +        "#
> +    );
> +
> +    let name_cstr =3D
> +        Literal::c_string(&CString::new(name.as_str()).expect("name cont=
ains NUL-terminator"));
> +
> +    Ok(quote! {
> +        /// The module name.
> +        ///
> +        /// Used by the printing macros, e.g. [`info!`].
> +        const __LOG_PREFIX: &[u8] =3D #name_cstr.to_bytes_with_nul();
> +
> +        // SAFETY: `__this_module` is constructed by the kernel at load =
time and will not be
> +        // freed until the module is unloaded.
> +        #[cfg(MODULE)]
> +        static THIS_MODULE: ::kernel::ThisModule =3D unsafe {
> +            extern "C" {
> +                static __this_module: ::kernel::types::Opaque<::kernel::=
bindings::module>;
> +            };
> +
> +            ::kernel::ThisModule::from_ptr(__this_module.get())
> +        };
> +
> +        #[cfg(not(MODULE))]
> +        static THIS_MODULE: ::kernel::ThisModule =3D unsafe {
> +            ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
> +        };
> +
> +        /// The `LocalModule` type is the type of the module created by =
`module!`,
> +        /// `module_pci_driver!`, `module_platform_driver!`, etc.
> +        type LocalModule =3D #type_;
> +
> +        impl ::kernel::ModuleMetadata for #type_ {
> +            const NAME: &'static ::kernel::str::CStr =3D #name_cstr;
> +        }
> +
> +        // Double nested modules, since then nobody can access the publi=
c items inside.
> +        mod __module_init {
> +            mod __module_init {
> +                use super::super::#type_;
> +                use pin_init::PinInit;
> +
> +                /// The "Rust loadable module" mark.
> +                //
> +                // This may be best done another way later on, e.g. as a=
 new modinfo
> +                // key or a new section. For the moment, keep it simple.
> +                #[cfg(MODULE)]
> +                #[doc(hidden)]
> +                #[used(compiler)]
> +                static __IS_RUST_MODULE: () =3D ();
> +
> +                static mut __MOD: ::core::mem::MaybeUninit<#type_> =3D
> +                    ::core::mem::MaybeUninit::uninit();
> +
> +                // Loadable modules need to export the `{init,cleanup}_m=
odule` identifiers.
> +                /// # Safety
> +                ///
> +                /// This function must not be called after module initia=
lization, because it may be
> +                /// freed after that completes.
> +                #[cfg(MODULE)]
> +                #[doc(hidden)]
> +                #[no_mangle]
> +                #[link_section =3D ".init.text"]
> +                pub unsafe extern "C" fn init_module() -> ::kernel::ffi:=
:c_int {
> +                    // SAFETY: This function is inaccessible to the outs=
ide due to the double
> +                    // module wrapping it. It is called exactly once by =
the C side via its
> +                    // unique name.
> +                    unsafe { __init() }
> +                }
> +
> +                #[cfg(MODULE)]
> +                #[doc(hidden)]
> +                #[used(compiler)]
> +                #[link_section =3D ".init.data"]
> +                static __UNIQUE_ID___addressable_init_module: unsafe ext=
ern "C" fn() -> i32 =3D
> +                    init_module;
> +
> +                #[cfg(MODULE)]
> +                #[doc(hidden)]
> +                #[no_mangle]
> +                #[link_section =3D ".exit.text"]
> +                pub extern "C" fn cleanup_module() {
> +                    // SAFETY:
> +                    // - This function is inaccessible to the outside du=
e to the double
> +                    //   module wrapping it. It is called exactly once b=
y the C side via its
> +                    //   unique name,
> +                    // - furthermore it is only called after `init_modul=
e` has returned `0`
> +                    //   (which delegates to `__init`).
> +                    unsafe { __exit() }
> +                }
> +
> +                #[cfg(MODULE)]
> +                #[doc(hidden)]
> +                #[used(compiler)]
> +                #[link_section =3D ".exit.data"]
> +                static __UNIQUE_ID___addressable_cleanup_module: extern =
"C" fn() =3D cleanup_module;
> +
> +                // Built-in modules are initialized through an initcall =
pointer
> +                // and the identifiers need to be unique.
> +                #[cfg(not(MODULE))]
> +                #[cfg(not(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS))]
> +                #[doc(hidden)]
> +                #[link_section =3D #initcall_section]
> +                #[used(compiler)]
> +                pub static #ident_initcall: extern "C" fn() ->
> +                    ::kernel::ffi::c_int =3D #ident_initcall;
> +
> +                #[cfg(not(MODULE))]
> +                #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
> +                ::core::arch::global_asm!(#global_asm);
> +
> +                #[cfg(not(MODULE))]
> +                #[doc(hidden)]
> +                #[no_mangle]
> +                pub extern "C" fn #ident_init() -> ::kernel::ffi::c_int =
{
> +                    // SAFETY: This function is inaccessible to the outs=
ide due to the double
> +                    // module wrapping it. It is called exactly once by =
the C side via its
> +                    // placement above in the initcall section.
> +                    unsafe { __init() }
> +                }
> +
> +                #[cfg(not(MODULE))]
> +                #[doc(hidden)]
> +                #[no_mangle]
> +                pub extern "C" fn #ident_exit() {
> +                    // SAFETY:
> +                    // - This function is inaccessible to the outside du=
e to the double
> +                    //   module wrapping it. It is called exactly once b=
y the C side via its
> +                    //   unique name,
> +                    // - furthermore it is only called after `#ident_ini=
t` has
> +                    //   returned `0` (which delegates to `__init`).
> +                    unsafe { __exit() }
> +                }
> +
> +                /// # Safety
> +                ///
> +                /// This function must only be called once.
> +                unsafe fn __init() -> ::kernel::ffi::c_int {
> +                    let initer =3D
> +                        <#type_ as ::kernel::InPlaceModule>::init(&super=
::super::THIS_MODULE);
> +                    // SAFETY: No data race, since `__MOD` can only be a=
ccessed by this module
> +                    // and there only `__init` and `__exit` access it. T=
hese functions are only
> +                    // called once and `__exit` cannot be called before =
or during `__init`.
> +                    match unsafe { initer.__pinned_init(__MOD.as_mut_ptr=
()) } {
> +                        Ok(m) =3D> 0,
> +                        Err(e) =3D> e.to_errno(),
> +                    }
> +                }
> +
> +                /// # Safety
> +                ///
> +                /// This function must
> +                /// - only be called once,
> +                /// - be called after `__init` has been called and retur=
ned `0`.
> +                unsafe fn __exit() {
> +                    // SAFETY: No data race, since `__MOD` can only be a=
ccessed by this module
> +                    // and there only `__init` and `__exit` access it. T=
hese functions are only
> +                    // called once and `__init` was already called.
> +                    unsafe {
> +                        // Invokes `drop()` on `__MOD`, which should be =
used for cleanup.
> +                        __MOD.assume_init_drop();
> +                    }
> +                }
> +
> +                #modinfo
> +            }
> +        }
> +    })
>  }
> --
> 2.51.2
>
