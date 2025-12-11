Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A532531B12D;
	Thu, 11 Dec 2025 19:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765481420; cv=none; b=YV7jTlMmDmrrryOF4w877q3Eg2vru3T77hdE+07YNR7KB9adMaXfrHcCNl5erS03Bw3q83bdguXFFhhUv/T1WgRmlP3kV9vYzOiKt6mmEdI9Q7oujSh5Xk3XgZDRYeo3ToAuG/lDt2FVm4Cd/gurYl8UPbWQvBqDYFAGFoAuJhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765481420; c=relaxed/simple;
	bh=T5GFpTndzj5bhRmtv0IJpXD8NDw7/7ylRpytzQVlQGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSsDsfgCT8yybMmanE0P7WTtbRQVJHHYV5qneLvqEV78WtMMpZ+BWuKT2AHqZfsPjkFW3PofQh8JglHPnSDz1Te6SiECHPqmRlhnAYJtsDLfQLKQGk1swfI++OCO4DqgqbkW2TxVMe5n4sSApPNKnGByHnZgRxj9UD+8WKEwCOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHZyUpSM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHZyUpSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CC7C16AAE;
	Thu, 11 Dec 2025 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765481420;
	bh=T5GFpTndzj5bhRmtv0IJpXD8NDw7/7ylRpytzQVlQGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=nHZyUpSMICBU/CSHHpq2b8mmAVuKTpGMIdEiwVkJEI7+pWMgc94RZOLXlqSrpoWo8
	 UPfNUyZgn7ufHxkpMlxGZCH7GgbdJgsXH0Wbw7sK3ReKDGfZBzibjoPOge8m0vIta2
	 AAQqzb3kzplnkSY7YDu0FuihjvLOkPHT+pD1KUkWmk9iykIoY/3l17eAJaYUmiWcsx
	 3ZyhU9pkx1g+Vli1i2QjjYuvKtN8YPu/PWEDxkJZCJwZJSob5JOXNSHOL6P/Jw0iuV
	 dvwFd6oZrMH3jhYBAOvBuF1uyzIhaMAqQI+dRiE5+WbY30hjlIf94+ynXSQ6wBTgCN
	 xGXiRt/TuYWng==
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
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] rust: macros: rearrange `#[doc(hidden)]` in `module!` macro
Date: Thu, 11 Dec 2025 18:56:50 +0000
Message-ID: <20251211185805.2835633-11-gary@kernel.org>
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

This `#[doc(hidden)]` can just be applied on a module to hide anything
within.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/module.rs | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index d6298d04c86f4..75a4eae5610cd 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -71,7 +71,6 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
         );
         self.ts.extend(quote! {
             #cfg
-            #[doc(hidden)]
             #[cfg_attr(not(target_os = "macos"), link_section = ".modinfo")]
             #[used(compiler)]
             pub static #counter: [u8; #length] = *#string;
@@ -375,6 +374,7 @@ impl ::kernel::ModuleMetadata for #type_ {
         }
 
         // Double nested modules, since then nobody can access the public items inside.
+        #[doc(hidden)]
         mod __module_init {
             mod __module_init {
                 use pin_init::PinInit;
@@ -384,7 +384,6 @@ mod __module_init {
                 // This may be best done another way later on, e.g. as a new modinfo
                 // key or a new section. For the moment, keep it simple.
                 #[cfg(MODULE)]
-                #[doc(hidden)]
                 #[used(compiler)]
                 static __IS_RUST_MODULE: () = ();
 
@@ -397,7 +396,6 @@ mod __module_init {
                 /// This function must not be called after module initialization, because it may be
                 /// freed after that completes.
                 #[cfg(MODULE)]
-                #[doc(hidden)]
                 #[no_mangle]
                 #[link_section = ".init.text"]
                 pub unsafe extern "C" fn init_module() -> ::kernel::ffi::c_int {
@@ -408,14 +406,12 @@ mod __module_init {
                 }
 
                 #[cfg(MODULE)]
-                #[doc(hidden)]
                 #[used(compiler)]
                 #[link_section = ".init.data"]
                 static __UNIQUE_ID___addressable_init_module: unsafe extern "C" fn() -> i32 =
                     init_module;
 
                 #[cfg(MODULE)]
-                #[doc(hidden)]
                 #[no_mangle]
                 #[link_section = ".exit.text"]
                 pub extern "C" fn cleanup_module() {
@@ -429,7 +425,6 @@ pub extern "C" fn cleanup_module() {
                 }
 
                 #[cfg(MODULE)]
-                #[doc(hidden)]
                 #[used(compiler)]
                 #[link_section = ".exit.data"]
                 static __UNIQUE_ID___addressable_cleanup_module: extern "C" fn() = cleanup_module;
@@ -438,7 +433,6 @@ pub extern "C" fn cleanup_module() {
                 // and the identifiers need to be unique.
                 #[cfg(not(MODULE))]
                 #[cfg(not(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS))]
-                #[doc(hidden)]
                 #[link_section = #initcall_section]
                 #[used(compiler)]
                 pub static #ident_initcall: extern "C" fn() ->
@@ -449,7 +443,6 @@ pub extern "C" fn cleanup_module() {
                 ::core::arch::global_asm!(#global_asm);
 
                 #[cfg(not(MODULE))]
-                #[doc(hidden)]
                 #[no_mangle]
                 pub extern "C" fn #ident_init() -> ::kernel::ffi::c_int {
                     // SAFETY: This function is inaccessible to the outside due to the double
@@ -459,7 +452,6 @@ pub extern "C" fn #ident_init() -> ::kernel::ffi::c_int {
                 }
 
                 #[cfg(not(MODULE))]
-                #[doc(hidden)]
                 #[no_mangle]
                 pub extern "C" fn #ident_exit() {
                     // SAFETY:
-- 
2.51.2

