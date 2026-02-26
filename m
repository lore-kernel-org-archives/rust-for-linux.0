Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C0D331A5D
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 23:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149675; cv=none; b=fZCBg0DBiphPXleW1QdbxXV9Hgot8fjQ49nuLUS8ywsxTEYxGNC6ZAnyjU4tTcsufO66xBEk8Nk4KXavs62PSB/54akCQz7C1XLBIOAQuo8OwYVkXBxT/3QdpsZVJWtVVObtQ05moh7om9wzcuTzL3HqoQdWNBfunjAm1QwsunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149675; c=relaxed/simple;
	bh=eHSd6gZAgAs99aURB/P61YrQaeqSUqKmTJDHpVJAJgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwBXoyGbCEkCpjPPjQwP2AwCp/CBtz1L/NwVh3TV+KzB/AZ2EGfulHCB6HF34gL8WdrFMk9mPoWRMTQC9AMd4IkY+FqbGHvbWMBNAAvMFsjjdh7jsckWrIXG6CLMkLOKGxymHHsON6GsWaMhIFMYkHLYGGJ4ONH677ngSd8JuxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1Yj8Xhi; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1Yj8Xhi"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1473975eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772149667; x=1772754467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9Hb2iavLuCFwRbZcUJdleryz74/Q+xg8WkVXrxCwXo=;
        b=d1Yj8XhiNEDcSEBMYSPG0iltvoIdKiu6FndiVhVCztvqTMN/sLm5yehkw+AbZaL2RT
         6gDYQEEdSPjmh7kU9quk2KhOVHvYP4al2ENNvlFxF31NrA9uDeoN/krSBa4Xicaaj3SY
         FkVkZb1SEh3y7CGEnIH46f+tFbHfFxe8ZfUlmcwXT4oXlMSKtMtcU4i4Ml/HH7dT98nj
         n20IupGAK7iFGvKdoe79DnElTMpMo3XEDLNxVLlzfCcESZZu1Wm7a58TJxr9q7tapJjy
         rftfIX6+3GsEq2WEU//+z1iVOZqXpSt7pUvQnYSoVbiNOJgItjQfB+lopPxJJSedmu7k
         OBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149667; x=1772754467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9Hb2iavLuCFwRbZcUJdleryz74/Q+xg8WkVXrxCwXo=;
        b=uaFv8r3dJ7HMerWJVoV97bH2scgbNzgpyyuxj74l5M2HPg/B3AK+Ld5hBdD1FPbRhu
         GkP+I70dPLg34fGychW9WkdB3u+572wSYvhYUHSoQeh1COM0ayJue/75FZFXBe85lNqH
         PLM1tl2uGyH0HbWDgt4Hc994e+flVkT8Uoeox69Iv/711mD4J1Hf1Uzl5KppW0P1nNhq
         oDe3zjRVM9iVBNgebb/Kh0nierL0fXfk+bjsLrxLAPH6aNdbRSjpfoQpoRy5DgQb5XYv
         li4aVycW5cYA6JKQERgaeHPL5HvrHmEn8WoVJpAMU4Z/GDxF/T1suaHuAvIiS0yJ9Cy9
         4N5g==
X-Forwarded-Encrypted: i=1; AJvYcCU6Od4R6i+eQebkSTBhLRYLet18pyOSFreZRhRshznjQUyjU0qK4R0VeE2qbp9vz1w4acnivD1JvWE9UYlt5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/qo6c8Ue/IhYtXiIzpdIwGSM8lXyeOXk/fs2ZiLnm4E90T1R
	bN+AI7Qh4McpYp6uNeegh3NYMIT2NOe/2MHWp+H1Dwx99zj4maKx/w3F
X-Gm-Gg: ATEYQzwkze6d8fLwwhLmPVzdCsKiPzjqloTl2kHou8D+c6SButw4qrg5OeI5B0EQLKK
	xWHC2MpxWpkarWYAM/2OlAFsMh5sVxbvSbrXla/OpHfYndaZciITasbpzuyZab3N8h1yZbD2b6W
	t7lxJi0EQ4UvKKHqX5KO8xYYVUxw+NRtL/+q42iyqImJExjjmChrTA+a9ceX5xre/G3dmbQQW7W
	lm6dIebXsJH8MIHYqgym7oEAdb1v+GhM029EaJOzqcDydmpmFYis4EP16f69juMUgDaeiJMe5Bl
	JAhV5MMVt0+wQ+ZMOCkqMTZ5LIoBR69HuV1e+QzTUsJKUOyZme5ITwapFmgqS9jXL5VXT5HKFwU
	v94Pg9aDCos0XK706gyyuisNu8P7zutzKl06AAEYCBhla1mqfxlzhRdYk6TAMAVGvWmgkXjjsNr
	sK1hvh1O6ElgtnVuq+SiVz1Kx0E93dJymyB1U5FPHzn2BdDx24D1WbcIdAXnpkss2+L8VppyEeN
	g==
X-Received: by 2002:a05:7300:fb89:b0:2ba:72c3:53c0 with SMTP id 5a478bee46e88-2bde16c8443mr353009eec.0.1772149666732;
        Thu, 26 Feb 2026 15:47:46 -0800 (PST)
Received: from localhost (99-122-55-39.lightspeed.sntcca.sbcglobal.net. [99.122.55.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1bce276sm2849248eec.3.2026.02.26.15.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:47:46 -0800 (PST)
From: Matthew Wood <thepacketgeek@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	David Gow <davidgow@google.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
	linux-modules@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] rust: macros: add configurable initcall levels to module! macro
Date: Thu, 26 Feb 2026 15:47:34 -0800
Message-ID: <20260226234736.428341-9-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226234736.428341-1-thepacketgeek@gmail.com>
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently all Rust modules using the module! macro are placed at
initcall level 6 (device_initcall).  Some modules need to initialize
earlier in the boot sequence to provide services that other subsystems
depend on.

Add an InitCallLevel enum representing all eight standard initcall
levels (pure through late) and map each to its corresponding
.initcallN.init ELF section.

Expose this as an optional `initcall` field in the module! macro.
When omitted, the default remains level 6 (device) so existing
modules are unaffected.  Example usage:

    module! {
        ...
        initcall: subsys,
    }

This only affects built-in modules; loadable modules always enter
through init_module() regardless of the declared level.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 rust/macros/lib.rs    |  4 ++++
 rust/macros/module.rs | 56 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 83dcc89a425a..cfde59e81cdd 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -135,6 +135,10 @@
 ///   - `alias`: array of ASCII string literals of the alias names of the kernel module.
 ///   - `firmware`: array of ASCII string literals of the firmware files of
 ///     the kernel module.
+///   - `initcall`: initcall level for built-in modules. Valid values are:
+///     `pure` (0), `core` (1), `postcore` (2), `arch` (3), `subsys` (4),
+///     `fs` (5), `device` (6, the default), and `late` (7).
+///     This only affects built-in modules; loadable modules always use `init_module()`.
 #[proc_macro]
 pub fn module(input: TokenStream) -> TokenStream {
     module::module(parse_macro_input!(input))
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 4d2e144fa6de..1e210fee4506 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -436,6 +436,53 @@ macro_rules! parse_ordered_fields {
     }
 }
 
+#[derive(Clone, Copy, Debug, PartialEq, Eq)]
+enum InitCallLevel {
+    Pure,
+    Core,
+    PostCore,
+    Arch,
+    Subsys,
+    Fs,
+    Device,
+    Late,
+}
+
+impl InitCallLevel {
+    fn section(&self) -> &'static str {
+        match self {
+            Self::Pure => ".initcall0.init",
+            Self::Core => ".initcall1.init",
+            Self::PostCore => ".initcall2.init",
+            Self::Arch => ".initcall3.init",
+            Self::Subsys => ".initcall4.init",
+            Self::Fs => ".initcall5.init",
+            Self::Device => ".initcall6.init",
+            Self::Late => ".initcall7.init",
+        }
+    }
+}
+
+impl Parse for InitCallLevel {
+    fn parse(input: ParseStream<'_>) -> Result<Self> {
+        let ident: Ident = input.call(Ident::parse_any)?;
+        match ident.to_string().as_str() {
+            "pure" => Ok(Self::Pure),
+            "core" => Ok(Self::Core),
+            "postcore" => Ok(Self::PostCore),
+            "arch" => Ok(Self::Arch),
+            "subsys" => Ok(Self::Subsys),
+            "fs" => Ok(Self::Fs),
+            "device" => Ok(Self::Device),
+            "late" => Ok(Self::Late),
+            _ => Err(Error::new_spanned(
+                ident,
+                "invalid initcall level. Valid values are: pure, core, postcore, arch, subsys, fs, device, late",
+            )),
+        }
+    }
+}
+
 struct Parameter {
     name: Ident,
     ptype: Type,
@@ -480,6 +527,7 @@ pub(crate) struct ModuleInfo {
     firmware: Option<Punctuated<AsciiLitStr, Token![,]>>,
     imports_ns: Option<Punctuated<AsciiLitStr, Token![,]>>,
     params: Option<Punctuated<Parameter, Token![,]>>,
+    initcall: Option<InitCallLevel>,
 }
 
 impl Parse for ModuleInfo {
@@ -515,6 +563,7 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
                 braced!(list in input);
                 Punctuated::parse_terminated(&list)?
             },
+            initcall => input.parse()?,
         );
 
         Ok(ModuleInfo {
@@ -527,6 +576,7 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
             firmware,
             imports_ns,
             params,
+            initcall,
         })
     }
 }
@@ -542,6 +592,7 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
         firmware,
         imports_ns,
         params: _,
+        initcall,
     } = &info;
 
     // Rust does not allow hyphens in identifiers, use underscore instead.
@@ -587,7 +638,10 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
     let ident_init = format_ident!("__{ident}_init");
     let ident_exit = format_ident!("__{ident}_exit");
     let ident_initcall = format_ident!("__{ident}_initcall");
-    let initcall_section = ".initcall6.init";
+    let initcall_section = initcall
+        .as_ref()
+        .unwrap_or(&InitCallLevel::Device)
+        .section();
 
     let global_asm = format!(
         r#".section "{initcall_section}", "a"
-- 
2.52.0

