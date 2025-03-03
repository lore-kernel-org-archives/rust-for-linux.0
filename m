Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0D1F0990
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740991556; cv=none; b=IdE6s8S4E6WAkKg6wbHIKde+tWdn+y7J1vc2NWrib/L44Y2/WtvxmJizu3X1FeP6xGfORytu5ZqaPz0kOAhjdW6XRxpqeZLEJWgPA3ihhks32Iwzu7iwn0dspk2GsIsg2R0gJXVAIyhJawcr1/VxUu/ba98yf0nM+PycsVRukSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740991556; c=relaxed/simple;
	bh=1SNAXOe9oyT3qRvAmlmyXdBbsP3AQD5dhDmNwYVOio8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A4Ns7EqX9OqKZh6Mc+hGPZf6HRCQunp8GHEHYxWtHoAWONDlRhijNXaMbLise3Np/WEHuS4Hj21YWMax2FLIsFcR5QGkWd+SrgW+54g/6eL5qcYMahnRH/6Ponsl3bGVj4mF7bGjwxRsdnC/LKZBgMNy9rq1Zi5/7Ba/dPAhnso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IM+P1vHr; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IM+P1vHr"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-390e271517fso2416851f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 00:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740991553; x=1741596353; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgRB7R3QxdYuF4ALv/yYMTfwUqi5oUHSBNOS9q0wOcQ=;
        b=IM+P1vHrFiUqhcC9xDjRvUZHkGQzJbarIU9rW4ZMrGjzRB1OkFCzyjWsCABsrsWoz0
         aOyhLeJ2OfN5GsnIiVc2RJfeYzhQ1KsA3YYLjoN/kMlu+PdDd52Z/uzGBgPeLaUOVmyJ
         sOtaxcQZoL/vYgp9fqZuMsI0wG85JzDZGMQiifYvzok5eMIBNy0ptp3xTaOx1qXgtiDJ
         4sKUejrJP00yS4NGqTQjdcTpWVO57SMbaKYH5sGBvej03P6RQU8S/9TrtqFNDYZ6rkHd
         T6GbrCtU35MrmnAm59Amf1PbbJM2ec4drHU0YoFOEu2QNJQim4aoOOdzYAs1MyEmQ/9h
         kNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740991553; x=1741596353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dgRB7R3QxdYuF4ALv/yYMTfwUqi5oUHSBNOS9q0wOcQ=;
        b=anojsCk6BdPJqnWN6DBcuTqnHkr3hqR+aZ3gMk9gi0cNJGTYBUAsrSyTTKCG/0XzYO
         sOH0ozcC/ExtDlkbllhnP6ONHrbC5DXfiHrCZjVwYAiSyZJyrSb43LqpwN9H9112pPcp
         TEvZzvvd1IciWT8RtDX1g9Wwccd7kPqeVE2bEpRWF0YwPpcHxhIxRvjuHRjv/uq317rF
         u08DOZ/1DUojJWeuIBbqYD7SRxJtEGVCaUBsiqInLf7HN8W0w0FQkx2pZrk9MqL9ZAnc
         cEOxzV8soiWqz1F3FvlQUJOjFoep5yeYUzqUy2HqIzsDMrHyh+hbKL6zu9T/183hlBOz
         nUSg==
X-Forwarded-Encrypted: i=1; AJvYcCWyKuCKZd9UKDYPxP3+J3EnIRP1gWq146A6VCcV4nS514/Rcn0l4BzOLIyz7OXjeFffRGU3cXHJdxVRATtb0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMPx7lgI9rykHoyWy1PtQk1vL3cA+2M0yWxglU/QZn2qHMxGK
	T6RvpfFE+P/FnVUx8f86krfTPfxuzk17SfrHQ5VTmFZSGRS3BDXUY3ZqtiZGKg/dbRrRH9j6/PD
	SnAaL1bkjFXAIqQ==
X-Google-Smtp-Source: AGHT+IEbagZM/EJ0D/zs3j/Sycg3tpD2lbmYa29N6g/8/oZyQL05ic4DnohKXYym9qS/gDiNrS+7p/b4SDKBM28=
X-Received: from wmsd10.prod.google.com ([2002:a05:600c:3aca:b0:439:9541:1cf5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:588c:0:b0:390:df02:47f0 with SMTP id ffacd0b85a97d-390eca414c6mr7792866f8f.42.1740991553493;
 Mon, 03 Mar 2025 00:45:53 -0800 (PST)
Date: Mon, 03 Mar 2025 08:45:14 +0000
In-Reply-To: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6732; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=1SNAXOe9oyT3qRvAmlmyXdBbsP3AQD5dhDmNwYVOio8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnxWw2t+6Dxj44koarvcgY9JDKUuMhLzySqp2yS
 kaGfNpNK3eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ8VsNgAKCRAEWL7uWMY5
 RgwPD/9IdLzG+1nDOK5S9Nc3Wnyk6K1CZNtu7cX/HaCmzPhgLgoTKD3RncHw/rHaM0HaQpwUC0p
 wyoHfvjTiJB7C+/wx+uF3UJygcVabx1GU9ri9ZtkoRWaTcAbKXXB56Dr/a2N7nUKiDqTg8QSvR6
 efpNr+G5neqz+5RF7eN75GEIVYv1K3VTK5KzOslfmVBYybYNVFIXDtbbOaFvMgdHCRInkE79H/f
 3BaBPmUIvFHIKwTxBZIcGjaQpYopL6TdaM2Vn21eTxPsCWtowuJg91TGsrDFvBE1canWkG1Ie3C
 WswfS09Hr1ZX+ab0L/uTjunIWwi+2rkeeaceEAp023ESvo1Ei1Kd2LpVmsHL6/62BpDN85cp853
 I/6Y8sTLQheFSozz5bfOneb+Q4xfM+rfyaw8/bN33JkEUPbrXSb0XK/4JWFNuRnCQ45xk5rBjyD
 V0vRrVwLugEKOApFh7opcO1uovnWsmI2CzzvGv8+q45n0vqNIvnoWiwOyiBk60OHZFHb/yvCIQq
 5ntMZslk52d5qT9WCJefLx0JsmjeBhRyE8Kkj7qCrAeO1Mr85OFau9BnHRfm8bZ1sutuHaSiOYR
 GB4IuLgfwEc7zUOUmaDeGQ2IheDFUE9g+UnUgflSXUZUUF1q/tZCdoR22R8YrcnN835DzntiJZm Qo6fUXFEi7wHgrw==
X-Mailer: b4 0.14.1
Message-ID: <20250303-export-macro-v3-3-41fbad85a27f@google.com>
Subject: [PATCH v3 3/5] rust: add #[export] macro
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Rust has two different tools for generating function declarations to
call across the FFI boundary:

* bindgen. Generates Rust declarations from a C header.
* cbindgen. Generates C headers from Rust declarations.

However, we only use bindgen in the kernel. This means that when C code
calls a Rust function by name, its signature must be duplicated in both
Rust code and a C header, and the signature needs to be kept in sync
manually.

Introducing cbindgen as a mandatory dependency to build the kernel would
be a rather complex and large change, so we do not consider that at this
time. Instead, to eliminate this manual checking, introduce a new macro
that verifies at compile time that the two function declarations use the
same signature. The idea is to run the C declaration through bindgen,
and then have rustc verify that the function pointers have the same
type.

The signature must still be written twice, but at least you can no
longer get it wrong. If the signatures don't match, you will get errors
that look like this:

error[E0308]: `if` and `else` have incompatible types
  --> <linux>/rust/kernel/print.rs:22:22
   |
21 | #[export]
   | --------- expected because of this
22 | unsafe extern "C" fn rust_fmt_argument(
   |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
   |
   = note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, *mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
              found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *const c_void) -> *mut i8 {print::rust_fmt_argument}`

It is unfortunate that the error message starts out by saying "`if` and
`else` have incompatible types", but I believe the rest of the error
message is reasonably clear and not too confusing.

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/prelude.rs |  2 +-
 rust/macros/export.rs  | 29 +++++++++++++++++++++++++++++
 rust/macros/helpers.rs | 19 ++++++++++++++++++-
 rust/macros/lib.rs     | 24 ++++++++++++++++++++++++
 4 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index dde2e0649790..889102f5a81e 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -17,7 +17,7 @@
 pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, VBox, VVec, Vec};
 
 #[doc(no_inline)]
-pub use macros::{module, pin_data, pinned_drop, vtable, Zeroable};
+pub use macros::{export, module, pin_data, pinned_drop, vtable, Zeroable};
 
 pub use super::{build_assert, build_error};
 
diff --git a/rust/macros/export.rs b/rust/macros/export.rs
new file mode 100644
index 000000000000..a08f6337d5c8
--- /dev/null
+++ b/rust/macros/export.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::helpers::function_name;
+use proc_macro::TokenStream;
+
+/// Please see [`crate::export`] for documentation.
+pub(crate) fn export(_attr: TokenStream, ts: TokenStream) -> TokenStream {
+    let Some(name) = function_name(ts.clone()) else {
+        return "::core::compile_error!(\"The #[export] attribute must be used on a function.\");"
+            .parse::<TokenStream>()
+            .unwrap();
+    };
+
+    // This verifies that the function has the same signature as the declaration generated by
+    // bindgen. It makes use of the fact that all branches of an if/else must have the same type.
+    let signature_check = quote!(
+        const _: () = {
+            if true {
+                ::kernel::bindings::#name
+            } else {
+                #name
+            };
+        };
+    );
+
+    let no_mangle = quote!(#[no_mangle]);
+
+    TokenStream::from_iter([signature_check, no_mangle, ts])
+}
diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index 563dcd2b7ace..3e04f8ecfc74 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use proc_macro::{token_stream, Group, TokenStream, TokenTree};
+use proc_macro::{token_stream, Group, Ident, TokenStream, TokenTree};
 
 pub(crate) fn try_ident(it: &mut token_stream::IntoIter) -> Option<String> {
     if let Some(TokenTree::Ident(ident)) = it.next() {
@@ -215,3 +215,20 @@ pub(crate) fn parse_generics(input: TokenStream) -> (Generics, Vec<TokenTree>) {
         rest,
     )
 }
+
+/// Given a function declaration, finds the name of the function.
+pub(crate) fn function_name(input: TokenStream) -> Option<Ident> {
+    let mut input = input.into_iter();
+    while let Some(token) = input.next() {
+        match token {
+            TokenTree::Ident(i) if i.to_string() == "fn" => {
+                if let Some(TokenTree::Ident(i)) = input.next() {
+                    return Some(i);
+                }
+                return None;
+            }
+            _ => continue,
+        }
+    }
+    None
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index d61bc6a56425..a52443a3dbb9 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -9,6 +9,7 @@
 #[macro_use]
 mod quote;
 mod concat_idents;
+mod export;
 mod helpers;
 mod module;
 mod paste;
@@ -174,6 +175,29 @@ pub fn vtable(attr: TokenStream, ts: TokenStream) -> TokenStream {
     vtable::vtable(attr, ts)
 }
 
+/// Export a function so that C code can call it via a header file.
+///
+/// Functions exported using this macro can be called from C code using the declaration in the
+/// appropriate header file. It should only be used in cases where C calls the function through a
+/// header file; cases where C calls into Rust via a function pointer in a vtable (such as
+/// `file_operations`) should not use this macro.
+///
+/// This macro has the following effect:
+///
+/// * Disables name mangling for this function.
+/// * Verifies at compile-time that the function signature matches the declaration in the header
+///   file.
+///
+/// You must declare the signature of the Rust function in a header file that is included by
+/// `rust/bindings/bindings_helper.h`.
+///
+/// This macro is *not* the same as the C macros `EXPORT_SYMBOL_*`. All Rust symbols are currently
+/// automatically exported with `EXPORT_SYMBOL_GPL`.
+#[proc_macro_attribute]
+pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
+    export::export(attr, ts)
+}
+
 /// Concatenate two identifiers.
 ///
 /// This is useful in macros that need to declare or reference items with names

-- 
2.48.1.711.g2feabab25a-goog

