Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6450E33A6E8
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 23:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149666; cv=none; b=Vpaas3W4cMv1eZLynSWtnT2neHugVzyQBIl0gHsQigl6H7fQqLYxeevoHYZ/sw2DFEF1qMAFRn5I0GuxOCyqoRxCnqQveB4A7htbIx3DSQdbv7j7ZeIbZBGURzdXCmxa4gHqjniB7gyHp9R2l463NFp+vQ5mOoZkaOe7d6GMjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149666; c=relaxed/simple;
	bh=xFtVJPjb1lCf06i8AWnkVR51MqrSe6UEn+2i41YDHgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fw6KUNZ+Hd2eEK5mHV1P0WoHThZbOtVl7FqjpejSIRtFNulBRiqGJ4c8+3toNJXmF28V2RQQl2Krf5IX2OdFzegpOpp0JpxOORlJIh5jJjDcvCgMi7NC6D3XVRCl0Rlp6KuAW/O57sN41Oyv3FU9R0Cmo97Rv/h2SIJSormMgZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9nqjOSA; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9nqjOSA"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdcfbd0779so1699908eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772149665; x=1772754465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpIeoheh9kwABfSNbiyNPrL4mJinCWikDVLVci1HHt8=;
        b=K9nqjOSAih+SH5bFtlfEcL/2quri6A8287JDxDswMn7HZkmxlZ0QRiwFxjqmEUhi2Z
         vlQhI0h9PapS2uOqs7oVZJBZaxdJ4qGEpdHPQi8mdEKSVLktvPP0CLzlUTuKj9DZ2mGP
         fOCaSLlZre906qf3nWTN2i9ahuCXEmO5Ptu4NHKKJ7iIo8HJKXrLooJHqdqZI3T+OCvs
         ajcHKnxaUgQXlQw/RXIk9EyWlZneH2aTT8Tcux0qC/efNSwP5tRUpWdyLt0suMWUdaiC
         Ug83Ni+N87mC0m3vsq5pyxVmj6gulTjtFaDBqhWhP11J5v5PdU+VszWpcsB+W9Cmzwvv
         onqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149665; x=1772754465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EpIeoheh9kwABfSNbiyNPrL4mJinCWikDVLVci1HHt8=;
        b=gs8WnmqWcErtJbXqNQoEXurfSo4h30T3U/N965F8kLiXgCmkyL7R9QOnAuUPM8BMoK
         kJLlstFqKOYwMZNLJ0oAxGzyQYwzVCELLIX0okEapVmunZrgoaVYaMeE8I3cTG0ZkTW2
         +uBp983GroqNuq9Rw4Z6o/hHb4Mt7u8tvw4PXj+ikCCfL/yJOx3TovP6iAYXZmtjfaCJ
         UEoKX9QdZYJzZ4gStAGmBukhucRfbi1uYbyHbauJ17nOgQmj96d0qPa0+pblntUl7VBl
         B7Er57/lu+cwHo2wR98pOYH+zOCT52D4TjSIIM96Zzh46VJZdza1Qn2KVPwxKsIKPYch
         dcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLQEIztpBsN0SKtDV95Fuj9KxeX4FthGWndcbGFip6sv6CXuj/uZnlADX+b7OyekC/4xp74jHACtfE5gJ5og==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjS6dAaLqwSTMrF+D86/MmtFR0H/6e4c3kvuin4HkUy8QCXw+N
	MJrmCqYdxVchnM+caQ33dg4W2WDESlni9LZn3hTrSC54tPo99+PQA5k9pM8nNw==
X-Gm-Gg: ATEYQzx9fp71G4jXKsVEikylKgAcJAtTqXQfKYv5v9JMx3WttG7loXElBiFd+E69avB
	SME/tT9uWoFydIDyNbTAVJKwCfhmBQavxFUwVVdhZppeDthf4rSsWxXDf2UTY4A6k6iyIpgykGo
	HDAWMGoIy5xL0LT/KiZzMUZst+1/9Cv+lLRsdumiAFt2PNt39c2q0pHAI/VQKcXeL1nsuuChidU
	D8m9aLR2DrPSmsKaux7CcX+4yv5tKhyuXu+jVP3US3/0LF4Ecul+Mwz+CZnPCw4GgkA4bOqWgCK
	GGOGouBM7qOMXtT8yDNidfCvk3AYhgnr3avN4W/lEDED5XK+LinkkcQHKpzPUW2Rgb9eo3lSyR6
	5AAsOyf67yM6lAQKDLBzhvk28ddJ284V6Evu6kvNoTwDeb1DXa3PFD1b5qqi0Q/3odXhbrStQe5
	1QgHXB3jsfYw5uxvBQAsIbs/FM0ocRH3f4kSLnZxSJklddHEDbR4FTdvihyUnHcXBMHsyZ5x+3O
	A==
X-Received: by 2002:a05:7300:3b24:b0:2ba:75f5:72a2 with SMTP id 5a478bee46e88-2bde1b4def2mr341086eec.2.1772149664426;
        Thu, 26 Feb 2026 15:47:44 -0800 (PST)
Received: from localhost (99-122-55-39.lightspeed.sntcca.sbcglobal.net. [99.122.55.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f23be8sm2683786eec.20.2026.02.26.15.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:47:44 -0800 (PST)
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
Subject: [PATCH 6/8] rust: macros: add early_param support to module! macro
Date: Thu, 26 Feb 2026 15:47:32 -0800
Message-ID: <20260226234736.428341-7-thepacketgeek@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226234736.428341-1-thepacketgeek@gmail.com>
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow module parameters to be registered as early boot command-line
parameters via the existing __setup infrastructure.

Add an optional `early_param` field to the parameter block in the
module! macro.  When specified, the macro generates:

  - A setup callback that calls ModuleParam::from_setup_arg() and
    stores the result via ModuleParamAccess::set_value().
  - A static string in .init.rodata with the command-line prefix.
  - An ObsKernelParam entry in the .init.setup section linking the
    two together.

The generated code is gated behind #[cfg(not(MODULE))] since __setup
parameters are only meaningful for built-in modules — loadable modules
receive their parameters through the standard module_param mechanism.

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 rust/macros/lib.rs    |  5 +++
 rust/macros/module.rs | 81 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 0c36194d9971..83dcc89a425a 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -35,9 +35,14 @@
 /// parameter_name: type {
 ///     default: default_value,
 ///     description: "Description",
+///     early_param: "cmdline_prefix=",  // optional
 /// }
 /// ```
 ///
+/// The optional `early_param` field registers the parameter as an early
+/// boot command-line parameter via `__setup`. The value is the command-line
+/// prefix string (e.g. `"netconsole="`).
+///
 /// `type` may be one of
 ///
 /// - [`i8`]
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 0d76743741fb..4d2e144fa6de 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -38,6 +38,7 @@ struct ModInfoBuilder<'a> {
     counter: usize,
     ts: TokenStream,
     param_ts: TokenStream,
+    setup_ts: TokenStream,
 }
 
 impl<'a> ModInfoBuilder<'a> {
@@ -47,6 +48,7 @@ fn new(module: &'a str) -> Self {
             counter: 0,
             ts: TokenStream::new(),
             param_ts: TokenStream::new(),
+            setup_ts: TokenStream::new(),
         }
     }
 
@@ -204,6 +206,78 @@ fn emit_params(&mut self, info: &ModuleInfo) {
             });
         }
     }
+
+    fn emit_setup(&mut self, info: &ModuleInfo) {
+        let Some(params) = &info.params else {
+            return;
+        };
+
+        for param in params {
+            let Some(early_param) = &param.early_param else {
+                continue;
+            };
+
+            let setup_str_value = early_param.value();
+            let param_name = &param.name;
+
+            // Resolve `string` shorthand to the real `StringParam` type.
+            let param_type_str = param.ptype.to_token_stream().to_string();
+            let actual_type: Type = if param_type_str == "string" {
+                parse_quote!(::kernel::module_param::StringParam)
+            } else {
+                param.ptype.clone()
+            };
+
+            // Create identifiers for the generated statics
+            let setup_fn_name = format_ident!("__setup_fn_{}", param_name);
+            let setup_str_name =
+                format_ident!("__SETUP_STR_{}", param_name.to_string().to_uppercase());
+            let setup_name = format_ident!("__SETUP_{}", param_name.to_string().to_uppercase());
+
+            // The setup string with null terminator
+            let setup_str_bytes = format!("{}\0", setup_str_value);
+            let setup_str_len = setup_str_bytes.len();
+            let setup_str_lit = Literal::byte_string(setup_str_bytes.as_bytes());
+
+            self.setup_ts.extend(quote! {
+                #[cfg(not(MODULE))]
+                const _: () = {
+                    unsafe extern "C" fn #setup_fn_name(
+                        val: *mut ::kernel::ffi::c_char,
+                    ) -> ::kernel::ffi::c_int {
+                        if val.is_null() {
+                            return 0;
+                        }
+                        // SAFETY: The kernel passes a valid null-terminated string from
+                        // `static_command_line`.
+                        match unsafe {
+                            <#actual_type as ::kernel::module_param::ModuleParam>::from_setup_arg(
+                                val as *const _
+                            )
+                        } {
+                            Ok(v) => {
+                                if module_parameters::#param_name.set_value(v) { 1 } else { 0 }
+                            }
+                            Err(_) => 0,
+                        }
+                    }
+
+                    #[link_section = ".init.rodata"]
+                    #[used(compiler)]
+                    static #setup_str_name: [u8; #setup_str_len] = *#setup_str_lit;
+
+                    #[link_section = ".init.setup"]
+                    #[used(compiler)]
+                    static #setup_name: ::kernel::module_param::ObsKernelParam =
+                        ::kernel::module_param::ObsKernelParam {
+                            str_: #setup_str_name.as_ptr().cast(),
+                            setup_func: ::core::option::Option::Some(#setup_fn_name),
+                            early: 0,
+                        };
+                };
+            });
+        }
+    }
 }
 
 fn param_ops_path(param_type: &str) -> Path {
@@ -367,6 +441,7 @@ struct Parameter {
     ptype: Type,
     default: Expr,
     description: LitStr,
+    early_param: Option<LitStr>,
 }
 
 impl Parse for Parameter {
@@ -382,6 +457,7 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
             from fields;
             default [required] => fields.parse()?,
             description [required] => fields.parse()?,
+            early_param => fields.parse()?,
         }
 
         Ok(Self {
@@ -389,6 +465,7 @@ fn parse(input: ParseStream<'_>) -> Result<Self> {
             ptype,
             default,
             description,
+            early_param,
         })
     }
 }
@@ -501,9 +578,11 @@ pub(crate) fn module(info: ModuleInfo) -> Result<TokenStream> {
     modinfo.emit_only_builtin("file", &file, false);
 
     modinfo.emit_params(&info);
+    modinfo.emit_setup(&info);
 
     let modinfo_ts = modinfo.ts;
     let params_ts = modinfo.param_ts;
+    let setup_ts = modinfo.setup_ts;
 
     let ident_init = format_ident!("__{ident}_init");
     let ident_exit = format_ident!("__{ident}_exit");
@@ -678,5 +757,7 @@ unsafe fn __exit() {
         mod module_parameters {
             #params_ts
         }
+
+        #setup_ts
     })
 }
-- 
2.52.0

