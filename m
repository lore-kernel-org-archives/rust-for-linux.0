Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB5C32AAD1
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 23:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772149662; cv=none; b=oGu09IpU0ZX02bEGbQ7I+e3B4KisPEnzmAf0pHl7l5ORA5qtDUGlvu7g3m+1fOUopd11wt8Gj/Gtrmb7ZIVNDGJdGRezFcQ5QKhStDJ6QlWmIJoc0mNVQ/1uI9jrYVgYTz1Eio6x3arUhFNEkG2+VMy5Vxfe1M4dxDKmLMTro+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772149662; c=relaxed/simple;
	bh=muxh3fCFRhSf9Unv2vBe0W+v1Z0hoW/CIg7AHgZRxaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mlPzmeWzhDDM4NHLC+NlvW0ImNghSSYZp6F2gDHKRYttjk9JuFxai6pbPPkRT0RuuU2W8u5Q0b2fAEkoo1SFivKWFPrnx5vkP3tU4tdBRc9zUCRul/DAGNEI4sZQ42rv6d2ozeO7B5CXZes/m6ijGuDc5Oc3VA2RNGS8UF87YR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX/VZ7n4; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX/VZ7n4"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bdcb30fe8aso2376040eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 15:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772149660; x=1772754460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOJAuKmw4q0dzp0Ep92fm1clLy9bI5rwzposWVs1Z0k=;
        b=EX/VZ7n48a7dg7o4vgOtulAQFW7a9o8lBRcfmJ0uIbupnWZswyr7EOzckc3ZO59nm2
         nKdbuYWIVYTmhP+M3cXwh2s7QW4O+W5NTvUdGq0D3lujNhRghg4ABgcE6KdmE9mn/36q
         A6h9m/P4sl4+Pkj32k+hAFPTCvXi7Y5gzuzXuX//gWB19cyvqEYw19oKmsHDeeC/8/0p
         KGMbvGkUdHbmWV/ceBFFqvKm/Q28HpqpQTbBIU4eYHgrxi58vPlqBVQtD6yFxrm6chhr
         cZ+SPiTsqOhwlAQqlK+Wr9OtkUdiQo24XN4Jn/utzAe37IphwIV0KiaEJET+vCmjKYb0
         AgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772149660; x=1772754460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iOJAuKmw4q0dzp0Ep92fm1clLy9bI5rwzposWVs1Z0k=;
        b=Q4m6v/QvbXz52AM+qy3aYL58YLrIMS8oSt7+FKccUNTs0/GGAcJVaF4+A66JlL66rF
         pEhvSLyQpkzjEnF0p0DsH+e3Sho/P8q7yr0AdX/q+cUqYQaWc376UnZqCmEAT7cfAHKu
         ZenUF5/lGdtF7WfI2QKZ1/55l6I+dLsFvW1HIvF4ltOuDgYYBOj/i4vnGlTxk99+GhNH
         ndgTkGZvnkDixqF9qs3YHgqMr3tSx0AzSPoFfh/p1jTDsGRHbmyECQeF1XNqtgyC0z+N
         9n03jE0jwf3F1TdLLDB1Vf7owZGJagalCgvHe1kJMCkX5kAFADjacMQDS0F0YO0eRMYG
         3y+w==
X-Forwarded-Encrypted: i=1; AJvYcCVTTP9PxKe6vUn5AXfm1JIMvTws72hFsEjW6I9+r82zaD2xinUsG8UD1Z7HQClp4T1iIVBtIk9nYKfFMcls2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQxn+KPR5s070epKv6n9U2CovtCXvcWSKO77usP3Dm4Ji8m+J
	Czh7uFgyD4LsgCDjRfR0M+AlCOf0c7RRQgnXHL7rXksHzqw9Uz/6SccV
X-Gm-Gg: ATEYQzyam7NDnQJaro61BwBmWNoEzbAIxo0Am96Tta+CxbHPhKVgVRqXJJBEYW5+p/h
	6zj02slcgATgZdvN5bO6nQVgl7N30U1XmjxVKZG3gGRV7mINFWt8jb2EfH4nXlLTndbdo4t/Fcx
	H8xJZV6jseNyjcuJSK2Bnb0tCIx+GeajRk5awtkjoxAFGjSPobH199HDI2Za7P7xKSX+SyjwJA0
	Zoae0kRiXKXssnhIJ3ZysyI10NaXJUWz8VoscTPZQp+BpYJ3ggRb2CR06pmv7gWCuAb+VFiSvOF
	y76mFA/D6jVoStYD9gmMeWVbOY+c0jUYBB78Tfvo7FPHdN7eWuMurQipUfqnBIczzXhWGhB1/RI
	3mdZud/A72xd3EIrdikKa9kAcATtbx62u1oB9hyUDXT8FjTHq96/IWnmRaNujp2EzWfa3eadg2S
	yb08jcPo0BWLHM/L3HC+gEHrSV8w8ktsX/6PsEEnc2NPI8XxFTSLzWqRfbqha/jiF4C8JceF1kQ
	GiVbkzWxr8d
X-Received: by 2002:a05:7022:4583:b0:127:5cda:fb7d with SMTP id a92af1059eb24-1278fc2c5fbmr491168c88.6.1772149659700;
        Thu, 26 Feb 2026 15:47:39 -0800 (PST)
Received: from localhost (99-122-55-39.lightspeed.sntcca.sbcglobal.net. [99.122.55.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899ea1e5sm4259846c88.7.2026.02.26.15.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 15:47:39 -0800 (PST)
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
Subject: [PATCH 2/8] rust: module_param: wire StringParam into the module! macro
Date: Thu, 26 Feb 2026 15:47:28 -0800
Message-ID: <20260226234736.428341-3-thepacketgeek@gmail.com>
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

Add support for `string` as a parameter type in the module! macro.

On the runtime side, add:
  - set_string_param(): an extern "C" callback matching the
    kernel_param_ops::set signature that stores the raw C string
    pointer directly into the SetOnce<StringParam> container, avoiding
    an unnecessary copy-and-parse round-trip.
  - PARAM_OPS_STRING: a static kernel_param_ops that uses
    set_string_param as its setter.
  - ModuleParam impl for StringParam with try_from_param_arg()
    returning -EINVAL, since string parameters are populated
    exclusively through the kernel's set callback.

On the macro side:
  - Change the Parameter::ptype field from Ident to syn::Type to
    support path-qualified types.
  - Recognize the `string` shorthand and resolve it to the fully
    qualified ::kernel::module_param::StringParam type during code
    generation.
  - Wrap string default values with StringParam::from_c_str(c_str!(...))
    to produce a compile-time CStr-backed default.
  - Route `string` to PARAM_OPS_STRING in param_ops_path().

Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
---
 rust/kernel/module_param.rs | 48 +++++++++++++++++++++++++++++++++++++
 rust/macros/module.rs       | 42 +++++++++++++++++++++++++-------
 2 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index 80fe8643c0ab..67ff6f2ea9c2 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -86,6 +86,36 @@ pub trait ModuleParam: Sized + Copy {
     })
 }
 
+/// Set a string module parameter from a string.
+///
+/// Similar to [`set_param`] but for [`StringParam`].
+///
+/// # Safety
+///
+/// Same requirements as [`set_param`].
+unsafe extern "C" fn set_string_param(
+    val: *const c_char,
+    param: *const bindings::kernel_param,
+) -> c_int {
+    if val.is_null() {
+        crate::pr_warn!("Null pointer passed to `module_param::set_string_param`");
+        return EINVAL.to_errno();
+    }
+
+    crate::error::from_result(|| {
+        // SAFETY: val points to a valid C string from the kernel.
+        let cstr_param = unsafe { StringParam::from_ptr(val) };
+
+        // SAFETY: By function safety requirements, param.arg points to our SetOnce<StringParam>.
+        let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<StringParam>>()) };
+
+        container
+            .populate(cstr_param)
+            .then_some(0)
+            .ok_or(kernel::error::code::EEXIST)
+    })
+}
+
 macro_rules! impl_int_module_param {
     ($ty:ident) => {
         impl ModuleParam for $ty {
@@ -175,6 +205,15 @@ pub fn as_bytes(&self) -> Option<&[u8]> {
 unsafe impl Send for StringParam {}
 unsafe impl Sync for StringParam {}
 
+impl ModuleParam for StringParam {
+    fn try_from_param_arg(_arg: &BStr) -> Result<Self> {
+        // For StringParam, we don't parse here - the kernel's set callback
+        // directly stores the pointer. This method should not be called
+        // when using PARAM_OPS_STRING.
+        Err(EINVAL)
+    }
+}
+
 /// A wrapper for kernel parameters.
 ///
 /// This type is instantiated by the [`module!`] macro when module parameters are
@@ -249,3 +288,12 @@ macro_rules! make_param_ops {
 make_param_ops!(PARAM_OPS_U64, u64);
 make_param_ops!(PARAM_OPS_ISIZE, isize);
 make_param_ops!(PARAM_OPS_USIZE, usize);
+
+/// Parameter ops for string parameters.
+#[doc(hidden)]
+pub static PARAM_OPS_STRING: bindings::kernel_param_ops = bindings::kernel_param_ops {
+    flags: 0,
+    set: Some(set_string_param),
+    get: None,
+    free: None,
+};
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index e16298e520c7..0d76743741fb 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -8,7 +8,8 @@
 };
 use quote::{
     format_ident,
-    quote, //
+    quote,
+    ToTokens, //
 };
 use syn::{
     braced,
@@ -120,13 +121,15 @@ fn emit_params(&mut self, info: &ModuleInfo) {
 
         for param in params {
             let param_name_str = param.name.to_string();
-            let param_type_str = param.ptype.to_string();
+            let param_type_str = param.ptype.to_token_stream().to_string();
+            // Clean up the type string for modinfo (remove spaces around ::)
+            let param_type_clean = param_type_str.replace(" ", "");
 
             let ops = param_ops_path(&param_type_str);
 
             // Note: The spelling of these fields is dictated by the user space
             // tool `modinfo`.
-            self.emit_param("parmtype", &param_name_str, &param_type_str);
+            self.emit_param("parmtype", &param_name_str, &param_type_clean);
             self.emit_param("parm", &param_name_str, &param.description.value());
 
             let static_name = format_ident!("__{}_{}_struct", self.module, param.name);
@@ -137,14 +140,32 @@ fn emit_params(&mut self, info: &ModuleInfo) {
                     .expect("name contains NUL-terminator");
 
             let param_name = &param.name;
-            let param_type = &param.ptype;
             let param_default = &param.default;
 
+            // `string` is a shorthand for `StringParam` in the macro — resolve to
+            // the real type for code generation.
+            let is_str_param = param_type_str == "string";
+            let actual_type: Type = if is_str_param {
+                parse_quote!(::kernel::module_param::StringParam)
+            } else {
+                param.ptype.clone()
+            };
+
+            // For `string` params the default is always a string literal which
+            // gets wrapped with StringParam::from_c_str(kernel::c_str!(...)).
+            let default_expr = if is_str_param {
+                quote! {
+                    ::kernel::module_param::StringParam::from_c_str(::kernel::c_str!(#param_default))
+                }
+            } else {
+                quote!(#param_default)
+            };
+
             self.param_ts.extend(quote! {
                 #[allow(non_upper_case_globals)]
                 pub(crate) static #param_name:
-                    ::kernel::module_param::ModuleParamAccess<#param_type> =
-                        ::kernel::module_param::ModuleParamAccess::new(#param_default);
+                    ::kernel::module_param::ModuleParamAccess<#actual_type> =
+                        ::kernel::module_param::ModuleParamAccess::new(#default_expr);
 
                 const _: () = {
                     #[allow(non_upper_case_globals)]
@@ -186,7 +207,9 @@ fn emit_params(&mut self, info: &ModuleInfo) {
 }
 
 fn param_ops_path(param_type: &str) -> Path {
-    match param_type {
+    let type_name = param_type.rsplit("::").next().unwrap_or(param_type).trim();
+
+    match type_name {
         "i8" => parse_quote!(::kernel::module_param::PARAM_OPS_I8),
         "u8" => parse_quote!(::kernel::module_param::PARAM_OPS_U8),
         "i16" => parse_quote!(::kernel::module_param::PARAM_OPS_I16),
@@ -197,6 +220,7 @@ fn param_ops_path(param_type: &str) -> Path {
         "u64" => parse_quote!(::kernel::module_param::PARAM_OPS_U64),
         "isize" => parse_quote!(::kernel::module_param::PARAM_OPS_ISIZE),
         "usize" => parse_quote!(::kernel::module_param::PARAM_OPS_USIZE),
+        "string" => parse_quote!(::kernel::module_param::PARAM_OPS_STRING),
         t => panic!("Unsupported parameter type {}", t),
     }
 }
@@ -340,7 +364,7 @@ macro_rules! parse_ordered_fields {
 
 struct Parameter {
     name: Ident,
-    ptype: Ident,
+    ptype: Type,
     default: Expr,
     description: LitStr,
 }
@@ -349,7 +373,7 @@ impl Parse for Parameter {
     fn parse(input: ParseStream<'_>) -> Result<Self> {
         let name = input.parse()?;
         input.parse::<Token![:]>()?;
-        let ptype = input.parse()?;
+        let ptype: Type = input.parse()?;
 
         let fields;
         braced!(fields in input);
-- 
2.52.0

