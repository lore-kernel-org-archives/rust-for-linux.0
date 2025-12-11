Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66326319847;
	Thu, 11 Dec 2025 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481384; cv=none; b=C+uXjVMzk+c9eMao/o5BEzjH8u9LpNYh4S+ZYFyzH51Xv+akvUUmLyQvg9ICWECJA2VCnbv2teV9oST7F2PLo1ncs7aV4z0ryeqfvfN00f/cE0O5mz9Weyf86XNCmcW/VK0JvB52YBjJhs0Y8EQjV1B107qwndh/6Yl5XjEXMpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481384; c=relaxed/simple;
	bh=pfxM0c+rR8GlpmK6+wPCAR5++a9CmT8xXiEGeUXq7oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+PSKkrcVWVZ0UZwjmt7S2awemrrOwcotfmAk0UG+GM9S0gWQW8tykO8bS032hBYxCZnTMIXkw5v0srvRspMIzkZvqVdoGqF+PUR3661dydkCIOzqwq2eceRxRUKttMja+UlsO1O5i8qN9evQGPRHxUzoyz9kKUmnmQK/Pez5I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAffyxDx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAffyxDx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43D1C4CEF7;
	Thu, 11 Dec 2025 19:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765481384;
	bh=pfxM0c+rR8GlpmK6+wPCAR5++a9CmT8xXiEGeUXq7oQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=cAffyxDx3cjNT2NwNukCrcWuvLRmSX2DSd+0k1LyMI3GY4A1KRKJ4mROGjNlu4qnT
	 MCboHw2N6aM7FZtE8jVhGNvclFwkpaAKahFf8vMSDufvvBxKFiCfEJQ08XhcFR8czM
	 OS64GC5V3c1bRkbDpGYm/AysPgoi0BLo7WNpgwohgGyQobqsKtxhoW74GQYRUIwOXh
	 mis3eKQQ1ZSHdhrPCYdFlhpOFziFjxQuXu6lGaxvUJ0nE53HxnWKuWeirKX1ZfjVQV
	 VqqhtaKCEi6eiBR5rItpZkTfamXb0xEmU4WnUBaAeeTY+PBkltsQw7SWjo88THy9Vo
	 2qRclWfVSNy2A==
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] rust: macros: use `quote!` for `module!` macro
Date: Thu, 11 Dec 2025 18:56:45 +0000
Message-ID: <20251211185805.2835633-6-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251211185805.2835633-1-gary@kernel.org>
References: <20251211185805.2835633-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This has no behavioural change, but is good for maintainability. With
`quote!`, we're no longer using string templates, so we don't need to
quote " and {} inside the template anymore. Further more, editors can
now highlight the code template.

This also improves the robustness as it eliminates the need for string
quoting and escaping.

Co-developed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/Makefile         |   8 +-
 rust/macros/module.rs | 427 ++++++++++++++++++++++--------------------
 2 files changed, 229 insertions(+), 206 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index c816ca8663e42..96f0ac53ec0e8 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -215,7 +215,7 @@ rustdoc-pin_init_internal: private rustc_target_flags = --cfg kernel \
     --extern proc_macro --extern proc_macro2 --extern quote --extern syn \
     --crate-type proc-macro
 rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
-    rustdoc-clean FORCE
+    rustdoc-clean rustdoc-proc_macro2 rustdoc-quote rustdoc-syn FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-pin_init: private rustdoc_host = yes
@@ -276,7 +276,8 @@ rusttestlib-macros: $(src)/macros/lib.rs \
 rusttestlib-pin_init_internal: private rustc_target_flags = --cfg kernel \
     --extern proc_macro --extern proc_macro2 --extern quote --extern syn
 rusttestlib-pin_init_internal: private rustc_test_library_proc = yes
-rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
+rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
+    rusttestlib-proc_macro2 rusttestlib-quote rusttestlib-syn FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-pin_init: private rustc_target_flags = --extern pin_init_internal \
@@ -550,7 +551,8 @@ $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel \
     --extern proc_macro2 --extern quote --extern syn
-$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs FORCE
+$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
+	$(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index e4d51878a5360..4a02aadef25a7 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -1,11 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use std::fmt::Write;
+use std::ffi::CString;
 
 use proc_macro2::{
     Literal,
+    Span,
     TokenStream, //
 };
+use quote::{
+    format_ident,
+    quote, //
+};
 use syn::{
     bracketed,
     parse::{
@@ -26,7 +31,7 @@
 struct ModInfoBuilder<'a> {
     module: &'a str,
     counter: usize,
-    buffer: String,
+    ts: TokenStream,
 }
 
 impl<'a> ModInfoBuilder<'a> {
@@ -34,7 +39,7 @@ fn new(module: &'a str) -> Self {
         ModInfoBuilder {
             module,
             counter: 0,
-            buffer: String::new(),
+            ts: TokenStream::new(),
         }
     }
 
@@ -51,27 +56,26 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
             // Loadable modules' modinfo strings go as-is.
             format!("{field}={content}\0")
         };
+        let length = string.len();
+        let string = Literal::byte_string(string.as_bytes());
+        let cfg = if builtin {
+            quote!(#[cfg(not(MODULE))])
+        } else {
+            quote!(#[cfg(MODULE)])
+        };
 
-        write!(
-            &mut self.buffer,
-            "
-                {cfg}
-                #[doc(hidden)]
-                #[cfg_attr(not(target_os = \"macos\"), link_section = \".modinfo\")]
-                #[used(compiler)]
-                pub static __{module}_{counter}: [u8; {length}] = *{string};
-            ",
-            cfg = if builtin {
-                "#[cfg(not(MODULE))]"
-            } else {
-                "#[cfg(MODULE)]"
-            },
+        let counter = format_ident!(
+            "__{module}_{counter}",
             module = self.module.to_uppercase(),
-            counter = self.counter,
-            length = string.len(),
-            string = Literal::byte_string(string.as_bytes()),
-        )
-        .unwrap();
+            counter = self.counter
+        );
+        self.ts.extend(quote! {
+            #cfg
+            #[doc(hidden)]
+            #[cfg_attr(not(target_os = "macos"), link_section = ".modinfo")]
+            #[used(compiler)]
+            pub static #counter: [u8; #length] = *#string;
+        });
 
         self.counter += 1;
     }
@@ -281,24 +285,36 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
 }
 
 pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
+    let ModuleInfo {
+        type_,
+        license,
+        name,
+        authors,
+        description,
+        alias,
+        firmware,
+    } = info;
+
+    let type_ = Ident::new(&type_, Span::mixed_site());
+
     // Rust does not allow hyphens in identifiers, use underscore instead.
-    let ident = info.name.replace('-', "_");
+    let ident = name.replace('-', "_");
     let mut modinfo = ModInfoBuilder::new(ident.as_ref());
-    if let Some(authors) = info.authors {
+    if let Some(authors) = authors {
         for author in authors {
             modinfo.emit("author", &author);
         }
     }
-    if let Some(description) = info.description {
+    if let Some(description) = description {
         modinfo.emit("description", &description);
     }
-    modinfo.emit("license", &info.license);
-    if let Some(aliases) = info.alias {
+    modinfo.emit("license", &license);
+    if let Some(aliases) = alias {
         for alias in aliases {
             modinfo.emit("alias", &alias);
         }
     }
-    if let Some(firmware) = info.firmware {
+    if let Some(firmware) = firmware {
         for fw in firmware {
             modinfo.emit("firmware", &fw);
         }
@@ -309,179 +325,184 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
         std::env::var("RUST_MODFILE").expect("Unable to fetch RUST_MODFILE environmental variable");
     modinfo.emit_only_builtin("file", &file);
 
-    Ok(format!(
-        "
-            /// The module name.
-            ///
-            /// Used by the printing macros, e.g. [`info!`].
-            const __LOG_PREFIX: &[u8] = b\"{name}\\0\";
-
-            // SAFETY: `__this_module` is constructed by the kernel at load time and will not be
-            // freed until the module is unloaded.
-            #[cfg(MODULE)]
-            static THIS_MODULE: ::kernel::ThisModule = unsafe {{
-                extern \"C\" {{
-                    static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
-                }}
-
-                ::kernel::ThisModule::from_ptr(__this_module.get())
-            }};
-            #[cfg(not(MODULE))]
-            static THIS_MODULE: ::kernel::ThisModule = unsafe {{
-                ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
-            }};
-
-            /// The `LocalModule` type is the type of the module created by `module!`,
-            /// `module_pci_driver!`, `module_platform_driver!`, etc.
-            type LocalModule = {type_};
-
-            impl ::kernel::ModuleMetadata for {type_} {{
-                const NAME: &'static ::kernel::str::CStr = c\"{name}\";
-            }}
-
-            // Double nested modules, since then nobody can access the public items inside.
-            mod __module_init {{
-                mod __module_init {{
-                    use super::super::{type_};
-                    use pin_init::PinInit;
-
-                    /// The \"Rust loadable module\" mark.
-                    //
-                    // This may be best done another way later on, e.g. as a new modinfo
-                    // key or a new section. For the moment, keep it simple.
-                    #[cfg(MODULE)]
-                    #[doc(hidden)]
-                    #[used(compiler)]
-                    static __IS_RUST_MODULE: () = ();
-
-                    static mut __MOD: ::core::mem::MaybeUninit<{type_}> =
-                        ::core::mem::MaybeUninit::uninit();
-
-                    // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
-                    /// # Safety
-                    ///
-                    /// This function must not be called after module initialization, because it may be
-                    /// freed after that completes.
-                    #[cfg(MODULE)]
-                    #[doc(hidden)]
-                    #[no_mangle]
-                    #[link_section = \".init.text\"]
-                    pub unsafe extern \"C\" fn init_module() -> ::kernel::ffi::c_int {{
-                        // SAFETY: This function is inaccessible to the outside due to the double
-                        // module wrapping it. It is called exactly once by the C side via its
-                        // unique name.
-                        unsafe {{ __init() }}
-                    }}
-
-                    #[cfg(MODULE)]
-                    #[doc(hidden)]
-                    #[used(compiler)]
-                    #[link_section = \".init.data\"]
-                    static __UNIQUE_ID___addressable_init_module: unsafe extern \"C\" fn() -> i32 = init_module;
-
-                    #[cfg(MODULE)]
-                    #[doc(hidden)]
-                    #[no_mangle]
-                    #[link_section = \".exit.text\"]
-                    pub extern \"C\" fn cleanup_module() {{
-                        // SAFETY:
-                        // - This function is inaccessible to the outside due to the double
-                        //   module wrapping it. It is called exactly once by the C side via its
-                        //   unique name,
-                        // - furthermore it is only called after `init_module` has returned `0`
-                        //   (which delegates to `__init`).
-                        unsafe {{ __exit() }}
-                    }}
-
-                    #[cfg(MODULE)]
-                    #[doc(hidden)]
-                    #[used(compiler)]
-                    #[link_section = \".exit.data\"]
-                    static __UNIQUE_ID___addressable_cleanup_module: extern \"C\" fn() = cleanup_module;
-
-                    // Built-in modules are initialized through an initcall pointer
-                    // and the identifiers need to be unique.
-                    #[cfg(not(MODULE))]
-                    #[cfg(not(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS))]
-                    #[doc(hidden)]
-                    #[link_section = \"{initcall_section}\"]
-                    #[used(compiler)]
-                    pub static __{ident}_initcall: extern \"C\" fn() ->
-                        ::kernel::ffi::c_int = __{ident}_init;
-
-                    #[cfg(not(MODULE))]
-                    #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
-                    ::core::arch::global_asm!(
-                        r#\".section \"{initcall_section}\", \"a\"
-                        __{ident}_initcall:
-                            .long   __{ident}_init - .
-                            .previous
-                        \"#
-                    );
-
-                    #[cfg(not(MODULE))]
-                    #[doc(hidden)]
-                    #[no_mangle]
-                    pub extern \"C\" fn __{ident}_init() -> ::kernel::ffi::c_int {{
-                        // SAFETY: This function is inaccessible to the outside due to the double
-                        // module wrapping it. It is called exactly once by the C side via its
-                        // placement above in the initcall section.
-                        unsafe {{ __init() }}
-                    }}
-
-                    #[cfg(not(MODULE))]
-                    #[doc(hidden)]
-                    #[no_mangle]
-                    pub extern \"C\" fn __{ident}_exit() {{
-                        // SAFETY:
-                        // - This function is inaccessible to the outside due to the double
-                        //   module wrapping it. It is called exactly once by the C side via its
-                        //   unique name,
-                        // - furthermore it is only called after `__{ident}_init` has
-                        //   returned `0` (which delegates to `__init`).
-                        unsafe {{ __exit() }}
-                    }}
-
-                    /// # Safety
-                    ///
-                    /// This function must only be called once.
-                    unsafe fn __init() -> ::kernel::ffi::c_int {{
-                        let initer =
-                            <{type_} as ::kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
-                        // SAFETY: No data race, since `__MOD` can only be accessed by this module
-                        // and there only `__init` and `__exit` access it. These functions are only
-                        // called once and `__exit` cannot be called before or during `__init`.
-                        match unsafe {{ initer.__pinned_init(__MOD.as_mut_ptr()) }} {{
-                            Ok(m) => 0,
-                            Err(e) => e.to_errno(),
-                        }}
-                    }}
-
-                    /// # Safety
-                    ///
-                    /// This function must
-                    /// - only be called once,
-                    /// - be called after `__init` has been called and returned `0`.
-                    unsafe fn __exit() {{
-                        // SAFETY: No data race, since `__MOD` can only be accessed by this module
-                        // and there only `__init` and `__exit` access it. These functions are only
-                        // called once and `__init` was already called.
-                        unsafe {{
-                            // Invokes `drop()` on `__MOD`, which should be used for cleanup.
-                            __MOD.assume_init_drop();
-                        }}
-                    }}
-
-                    {modinfo}
-                }}
-            }}
-        ",
-        type_ = info.type_,
-        name = info.name,
-        ident = ident,
-        modinfo = modinfo.buffer,
-        initcall_section = ".initcall6.init"
-    )
-    .parse()
-    .expect("Error parsing formatted string into token stream."))
+    let modinfo = modinfo.ts;
+
+    let ident_init = format_ident!("__{ident}_init");
+    let ident_exit = format_ident!("__{ident}_exit");
+    let ident_initcall = format_ident!("__{ident}_initcall");
+    let initcall_section = ".initcall6.init";
+
+    let global_asm = format!(
+        r#".section "{initcall_section}", "a"
+        __{ident}_initcall:
+            .long   __{ident}_init - .
+            .previous
+        "#
+    );
+
+    let name_cstr =
+        Literal::c_string(&CString::new(name.as_str()).expect("name contains NUL-terminator"));
+
+    Ok(quote! {
+        /// The module name.
+        ///
+        /// Used by the printing macros, e.g. [`info!`].
+        const __LOG_PREFIX: &[u8] = #name_cstr.to_bytes_with_nul();
+
+        // SAFETY: `__this_module` is constructed by the kernel at load time and will not be
+        // freed until the module is unloaded.
+        #[cfg(MODULE)]
+        static THIS_MODULE: ::kernel::ThisModule = unsafe {
+            extern "C" {
+                static __this_module: ::kernel::types::Opaque<::kernel::bindings::module>;
+            };
+
+            ::kernel::ThisModule::from_ptr(__this_module.get())
+        };
+
+        #[cfg(not(MODULE))]
+        static THIS_MODULE: ::kernel::ThisModule = unsafe {
+            ::kernel::ThisModule::from_ptr(::core::ptr::null_mut())
+        };
+
+        /// The `LocalModule` type is the type of the module created by `module!`,
+        /// `module_pci_driver!`, `module_platform_driver!`, etc.
+        type LocalModule = #type_;
+
+        impl ::kernel::ModuleMetadata for #type_ {
+            const NAME: &'static ::kernel::str::CStr = #name_cstr;
+        }
+
+        // Double nested modules, since then nobody can access the public items inside.
+        mod __module_init {
+            mod __module_init {
+                use super::super::#type_;
+                use pin_init::PinInit;
+
+                /// The "Rust loadable module" mark.
+                //
+                // This may be best done another way later on, e.g. as a new modinfo
+                // key or a new section. For the moment, keep it simple.
+                #[cfg(MODULE)]
+                #[doc(hidden)]
+                #[used(compiler)]
+                static __IS_RUST_MODULE: () = ();
+
+                static mut __MOD: ::core::mem::MaybeUninit<#type_> =
+                    ::core::mem::MaybeUninit::uninit();
+
+                // Loadable modules need to export the `{init,cleanup}_module` identifiers.
+                /// # Safety
+                ///
+                /// This function must not be called after module initialization, because it may be
+                /// freed after that completes.
+                #[cfg(MODULE)]
+                #[doc(hidden)]
+                #[no_mangle]
+                #[link_section = ".init.text"]
+                pub unsafe extern "C" fn init_module() -> ::kernel::ffi::c_int {
+                    // SAFETY: This function is inaccessible to the outside due to the double
+                    // module wrapping it. It is called exactly once by the C side via its
+                    // unique name.
+                    unsafe { __init() }
+                }
+
+                #[cfg(MODULE)]
+                #[doc(hidden)]
+                #[used(compiler)]
+                #[link_section = ".init.data"]
+                static __UNIQUE_ID___addressable_init_module: unsafe extern "C" fn() -> i32 =
+                    init_module;
+
+                #[cfg(MODULE)]
+                #[doc(hidden)]
+                #[no_mangle]
+                #[link_section = ".exit.text"]
+                pub extern "C" fn cleanup_module() {
+                    // SAFETY:
+                    // - This function is inaccessible to the outside due to the double
+                    //   module wrapping it. It is called exactly once by the C side via its
+                    //   unique name,
+                    // - furthermore it is only called after `init_module` has returned `0`
+                    //   (which delegates to `__init`).
+                    unsafe { __exit() }
+                }
+
+                #[cfg(MODULE)]
+                #[doc(hidden)]
+                #[used(compiler)]
+                #[link_section = ".exit.data"]
+                static __UNIQUE_ID___addressable_cleanup_module: extern "C" fn() = cleanup_module;
+
+                // Built-in modules are initialized through an initcall pointer
+                // and the identifiers need to be unique.
+                #[cfg(not(MODULE))]
+                #[cfg(not(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS))]
+                #[doc(hidden)]
+                #[link_section = #initcall_section]
+                #[used(compiler)]
+                pub static #ident_initcall: extern "C" fn() ->
+                    ::kernel::ffi::c_int = #ident_initcall;
+
+                #[cfg(not(MODULE))]
+                #[cfg(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS)]
+                ::core::arch::global_asm!(#global_asm);
+
+                #[cfg(not(MODULE))]
+                #[doc(hidden)]
+                #[no_mangle]
+                pub extern "C" fn #ident_init() -> ::kernel::ffi::c_int {
+                    // SAFETY: This function is inaccessible to the outside due to the double
+                    // module wrapping it. It is called exactly once by the C side via its
+                    // placement above in the initcall section.
+                    unsafe { __init() }
+                }
+
+                #[cfg(not(MODULE))]
+                #[doc(hidden)]
+                #[no_mangle]
+                pub extern "C" fn #ident_exit() {
+                    // SAFETY:
+                    // - This function is inaccessible to the outside due to the double
+                    //   module wrapping it. It is called exactly once by the C side via its
+                    //   unique name,
+                    // - furthermore it is only called after `#ident_init` has
+                    //   returned `0` (which delegates to `__init`).
+                    unsafe { __exit() }
+                }
+
+                /// # Safety
+                ///
+                /// This function must only be called once.
+                unsafe fn __init() -> ::kernel::ffi::c_int {
+                    let initer =
+                        <#type_ as ::kernel::InPlaceModule>::init(&super::super::THIS_MODULE);
+                    // SAFETY: No data race, since `__MOD` can only be accessed by this module
+                    // and there only `__init` and `__exit` access it. These functions are only
+                    // called once and `__exit` cannot be called before or during `__init`.
+                    match unsafe { initer.__pinned_init(__MOD.as_mut_ptr()) } {
+                        Ok(m) => 0,
+                        Err(e) => e.to_errno(),
+                    }
+                }
+
+                /// # Safety
+                ///
+                /// This function must
+                /// - only be called once,
+                /// - be called after `__init` has been called and returned `0`.
+                unsafe fn __exit() {
+                    // SAFETY: No data race, since `__MOD` can only be accessed by this module
+                    // and there only `__init` and `__exit` access it. These functions are only
+                    // called once and `__init` was already called.
+                    unsafe {
+                        // Invokes `drop()` on `__MOD`, which should be used for cleanup.
+                        __MOD.assume_init_drop();
+                    }
+                }
+
+                #modinfo
+            }
+        }
+    })
 }
-- 
2.51.2

