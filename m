Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3E278771
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807786; cv=none; b=ABJbujCWtRyYNJly0wkF7VBQGyZH+gk+woOE2jkcWt0jQKHmFMZx+Jxk/s3sTDq0qGd/ScBow5Pt3CESAQhhfG2VQuYOfpyN/dJdTBezVbLGcUZKlAZsPoMpSV2CYXx2BQ5Mtu6Ql868vCzCjkgkYDzgwVY398y0WinrndHse5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807786; c=relaxed/simple;
	bh=56qk4oXZToDCRjUenEK2FztuuA7wWME8i0VRUMgg2i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hf14TnRv+edrNQD7lGVKAlgGHnjDG5IXrWjDN71zDFrhRC1aTxdFZ75v0EMyJulE6igI4DHx+opirmngRZUyq2XQZwyDvG5KcZlHOxha/jYGGhVW0p8nV3e1D1WgZNOhQeB30GJKTegbml3WXl/xdTSWE+Dxl4aU1plTngBLo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPqwqYGk; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPqwqYGk"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8593bcdd909so99119885a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Sep 2025 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758807784; x=1759412584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiEqMd3xsyy/ksNexRFAfYvN9OsAs0xxvpBCNib+PpM=;
        b=fPqwqYGkAPyS2GsHS3ZjEMWjFhNCbocZjRUMb1PJ8s0mnO3m5Q7ZLbZB6gXiS6MkpN
         zJIuGHzg3Pg6g2mpfzxAqdAtWPluEqAejLGJq9eIf58ujpqDvS+YBWxiYdae4nOpJZI0
         GCxYyLWEEJwGd5lIPpbTE2mD/2coZMfW08utmOksup6o4DX7AEE0DPxZY1uXd8idP0EG
         +4VVzkIbLzT7qqLZbFl9wNfyPo4LlxXMRwKPTDuNljoG7bppKUNoCw8T+08iojPm49es
         oBfK7W5j6Maxg4KPDLHfyKSplP3zBn3gzy9SdbGIHkoOneW/cVinJTaNjrpcSnuV1yAO
         Y5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807784; x=1759412584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiEqMd3xsyy/ksNexRFAfYvN9OsAs0xxvpBCNib+PpM=;
        b=YaI+XrR0vnJ6gnrJlblcnn1SSnOvCGEGO1LInYK8naYbnLkZPPnSZV4qlcoEZBshNu
         0MUNgwKAKbHqZoCiPk9pcIdHqnsMuGFuTueUZejCqkZP8RWMWManE3AVVb6hMM1wAX/d
         yxjD/O8TCd1gYA5SnlLdMNf1hgvGwvGDoLN+duK9t5MgJT90Y8vP0M9lzdqluJjxhZug
         ySOO5JNq67LnZjkJigO2Ey4MUhShBf+EZNpRZDG0lB3wkfTSixsJi3bMUfUZEDRfvD1Q
         X+ZmrwzPon9TRgPql0M7FajPpq5ur7qH9LHruAVrk2tlgk3p/vB0H8n61haDOyXcv6jF
         jzzQ==
X-Gm-Message-State: AOJu0Yxb+r1CWfpq8MR0g4jCOYurT1XdBfPeq1UuKldqBGuXJbDmzf8o
	4TMhHzPlTGu68XJ8kC6UHpPItvQcY5NQFfS/zNly8DwVJvLDhwQQora5
X-Gm-Gg: ASbGncsVoqHNoNVSbEBXBq6Bj46jYkb8qR+X6ubIKlW4nLaj4jP7wUsblZxBdyxxl9E
	w4ZSzGOPRi2XaSoVN4BxSCqezEAbuAbrDpTvecpSSfADllIRFCbLE0kb9JYaxHciL9Rp363BXrg
	yBuG+9Bz9sbjegewMT/Yof9+sKZv+hNE4gk0P1gyMr4GFnJwuR2lUMCjYcYCbq2bUHtmCEAB0Bc
	jc2xkT2LB4ey8AoILwKu+ZDiK5gnBpjhfR9LgDv0t2r/6+GuncaBjUh9H8FsQ6+h7nPNDpVm4PT
	Mai/nUJjT0Owhl+R4ydhdCsnZT4AXC9syz6v/ljtxoIyJgK5l6Dh4B0TUOjGxOvzxK7Cit773zq
	2MjEDvxSsekdQZDQ8eicsLkONTukdz83CLNNd0uPDYVwG1BSTDtTR5Yp/nyZb6h9r8lzw4MiptA
	dTH4CZX+T0N/dMLr6UJDFtysEytf/H7t38nXvhfHS8Dz7GL5u5Qw1QO4E/AT4QThGKG58O1FbxF
	o0VzRw=
X-Google-Smtp-Source: AGHT+IFnMmPLM7sJgOTWJTZmOBtjOjlrmMiPSYJvwGy2g77wsP/Q26ddaL5tF9eDcxx/v05Wr7nlDg==
X-Received: by 2002:a05:6214:f0a:b0:720:e4bd:d3e6 with SMTP id 6a1803df08f44-7fc374b2447mr37447426d6.15.1758807783375;
        Thu, 25 Sep 2025 06:43:03 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-800fa5f6dd7sm11852546d6.0.2025.09.25.06.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:43:02 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:42:53 -0400
Subject: [PATCH v16 2/3] rust: support formatting of foreign types
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-cstr-core-v16-2-5cdcb3470ec2@gmail.com>
References: <20250925-cstr-core-v16-0-5cdcb3470ec2@gmail.com>
In-Reply-To: <20250925-cstr-core-v16-0-5cdcb3470ec2@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758807776; l=11126;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=56qk4oXZToDCRjUenEK2FztuuA7wWME8i0VRUMgg2i0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFS5FBG5hG6X0Xkek0CL7w9zjaW6ziGcSIXaI/fHnn4mWXQaWHA2ook+z/gflzaX3Y+2kzogSEE
 fyz6dlk+WKw8=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Introduce a `fmt!` macro which wraps all arguments in
`kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This enables
formatting of foreign types (like `core::ffi::CStr`) that do not
implement `core::fmt::Display` due to concerns around lossy conversions
which do not apply in the kernel.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Custom.20formatting/with/516476467
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/fmt.rs     | 87 +++++++++++++++++++++++++++++++++++++++++++++-
 rust/kernel/prelude.rs |  3 +-
 rust/macros/fmt.rs     | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     | 19 ++++++++++
 rust/macros/quote.rs   |  7 ++++
 5 files changed, 207 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
index 0306e8388968..84d634201d90 100644
--- a/rust/kernel/fmt.rs
+++ b/rust/kernel/fmt.rs
@@ -4,4 +4,89 @@
 //!
 //! This module is intended to be used in place of `core::fmt` in kernel code.
 
-pub use core::fmt::{Arguments, Debug, Display, Error, Formatter, Result, Write};
+pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
+
+/// Internal adapter used to route allow implementations of formatting traits for foreign types.
+///
+/// It is inserted automatically by the [`fmt!`] macro and is not meant to be used directly.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+#[doc(hidden)]
+pub struct Adapter<T>(pub T);
+
+macro_rules! impl_fmt_adapter_forward {
+    ($($trait:ident),* $(,)?) => {
+        $(
+            impl<T: $trait> $trait for Adapter<T> {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    let Self(t) = self;
+                    $trait::fmt(t, f)
+                }
+            }
+        )*
+    };
+}
+
+use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
+impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
+
+/// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
+///
+/// Types should implement this trait rather than [`core::fmt::Display`]. Together with the
+/// [`Adapter`] type and [`fmt!`] macro, it allows for formatting foreign types (e.g. types from
+/// core) which do not implement [`core::fmt::Display`] directly.
+///
+/// [`fmt!`]: crate::prelude::fmt!
+pub trait Display {
+    /// Same as [`core::fmt::Display::fmt`].
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
+}
+
+impl<T: ?Sized + Display> Display for &T {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        Display::fmt(*self, f)
+    }
+}
+
+impl<T: ?Sized + Display> core::fmt::Display for Adapter<&T> {
+    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+        let Self(t) = self;
+        Display::fmt(t, f)
+    }
+}
+
+macro_rules! impl_display_forward {
+    ($(
+        $( { $($generics:tt)* } )? $ty:ty $( { where $($where:tt)* } )?
+    ),* $(,)?) => {
+        $(
+            impl$($($generics)*)? Display for $ty $(where $($where)*)? {
+                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
+                    core::fmt::Display::fmt(self, f)
+                }
+            }
+        )*
+    };
+}
+
+impl_display_forward!(
+    bool,
+    char,
+    core::panic::PanicInfo<'_>,
+    Arguments<'_>,
+    i128,
+    i16,
+    i32,
+    i64,
+    i8,
+    isize,
+    str,
+    u128,
+    u16,
+    u32,
+    u64,
+    u8,
+    usize,
+    {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
+    {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
+);
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 198d09a31449..26424ad7e989 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -25,7 +25,7 @@
 pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, VBox, VVec, Vec};
 
 #[doc(no_inline)]
-pub use macros::{export, kunit_tests, module, vtable};
+pub use macros::{export, fmt, kunit_tests, module, vtable};
 
 pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
 
@@ -36,7 +36,6 @@
 pub use super::dbg;
 pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
 pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
-pub use core::format_args as fmt;
 
 pub use super::{try_init, try_pin_init};
 
diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
new file mode 100644
index 000000000000..2f4b9f6e2211
--- /dev/null
+++ b/rust/macros/fmt.rs
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro::{Ident, TokenStream, TokenTree};
+use std::collections::BTreeSet;
+
+/// Please see [`crate::fmt`] for documentation.
+pub(crate) fn fmt(input: TokenStream) -> TokenStream {
+    let mut input = input.into_iter();
+
+    let first_opt = input.next();
+    let first_owned_str;
+    let mut names = BTreeSet::new();
+    let first_span = {
+        let Some((mut first_str, first_span)) = (match first_opt.as_ref() {
+            Some(TokenTree::Literal(first_lit)) => {
+                first_owned_str = first_lit.to_string();
+                Some(first_owned_str.as_str()).and_then(|first| {
+                    let first = first.strip_prefix('"')?;
+                    let first = first.strip_suffix('"')?;
+                    Some((first, first_lit.span()))
+                })
+            }
+            _ => None,
+        }) else {
+            return first_opt.into_iter().chain(input).collect();
+        };
+
+        // Parse `identifier`s from the format string.
+        //
+        // See https://doc.rust-lang.org/std/fmt/index.html#syntax.
+        while let Some((_, rest)) = first_str.split_once('{') {
+            first_str = rest;
+            if let Some(rest) = first_str.strip_prefix('{') {
+                first_str = rest;
+                continue;
+            }
+            if let Some((name, rest)) = first_str.split_once('}') {
+                first_str = rest;
+                let name = name.split_once(':').map_or(name, |(name, _)| name);
+                if !name.is_empty() && !name.chars().all(|c| c.is_ascii_digit()) {
+                    names.insert(name);
+                }
+            }
+        }
+        first_span
+    };
+
+    let adapter = quote_spanned!(first_span => ::kernel::fmt::Adapter);
+
+    let mut args = TokenStream::from_iter(first_opt);
+    {
+        let mut flush = |args: &mut TokenStream, current: &mut TokenStream| {
+            let current = std::mem::take(current);
+            if !current.is_empty() {
+                let (lhs, rhs) = (|| {
+                    let mut current = current.into_iter();
+                    let mut acc = TokenStream::new();
+                    while let Some(tt) = current.next() {
+                        // Split on `=` only once to handle cases like `a = b = c`.
+                        if matches!(&tt, TokenTree::Punct(p) if p.as_char() == '=') {
+                            names.remove(acc.to_string().as_str());
+                            // Include the `=` itself to keep the handling below uniform.
+                            acc.extend([tt]);
+                            return (Some(acc), current.collect::<TokenStream>());
+                        }
+                        acc.extend([tt]);
+                    }
+                    (None, acc)
+                })();
+                args.extend(quote_spanned!(first_span => #lhs #adapter(&#rhs)));
+            }
+        };
+
+        let mut current = TokenStream::new();
+        for tt in input {
+            match &tt {
+                TokenTree::Punct(p) if p.as_char() == ',' => {
+                    flush(&mut args, &mut current);
+                    &mut args
+                }
+                _ => &mut current,
+            }
+            .extend([tt]);
+        }
+        flush(&mut args, &mut current);
+    }
+
+    for name in names {
+        let name = Ident::new(name, first_span);
+        args.extend(quote_spanned!(first_span => , #name = #adapter(&#name)));
+    }
+
+    quote_spanned!(first_span => ::core::format_args!(#args))
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index fa847cf3a9b5..793f712dbf7c 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -15,6 +15,7 @@
 mod quote;
 mod concat_idents;
 mod export;
+mod fmt;
 mod helpers;
 mod kunit;
 mod module;
@@ -201,6 +202,24 @@ pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
     export::export(attr, ts)
 }
 
+/// Like [`core::format_args!`], but automatically wraps arguments in [`kernel::fmt::Adapter`].
+///
+/// This macro allows generating `fmt::Arguments` while ensuring that each argument is wrapped with
+/// `::kernel::fmt::Adapter`, which customizes formatting behavior for kernel logging.
+///
+/// Named arguments used in the format string (e.g. `{foo}`) are detected and resolved from local
+/// bindings. All positional and named arguments are automatically wrapped.
+///
+/// This macro is an implementation detail of other kernel logging macros like [`pr_info!`] and
+/// should not typically be used directly.
+///
+/// [`kernel::fmt::Adapter`]: ../kernel/fmt/struct.Adapter.html
+/// [`pr_info!`]: ../kernel/macro.pr_info.html
+#[proc_macro]
+pub fn fmt(input: TokenStream) -> TokenStream {
+    fmt::fmt(input)
+}
+
 /// Concatenate two identifiers.
 ///
 /// This is useful in macros that need to declare or reference items with names
diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
index acc140c18653..ddfc21577539 100644
--- a/rust/macros/quote.rs
+++ b/rust/macros/quote.rs
@@ -48,6 +48,7 @@ macro_rules! quote_spanned {
     ($span:expr => $($tt:tt)*) => {{
         let mut tokens = ::proc_macro::TokenStream::new();
         {
+            #[allow(unused_variables)]
             let span = $span;
             quote_spanned!(@proc tokens span $($tt)*);
         }
@@ -146,6 +147,12 @@ macro_rules! quote_spanned {
         )]);
         quote_spanned!(@proc $v $span $($tt)*);
     };
+    (@proc $v:ident $span:ident & $($tt:tt)*) => {
+        $v.extend([::proc_macro::TokenTree::Punct(
+            ::proc_macro::Punct::new('&', ::proc_macro::Spacing::Alone),
+        )]);
+        quote_spanned!(@proc $v $span $($tt)*);
+    };
     (@proc $v:ident $span:ident _ $($tt:tt)*) => {
         $v.extend([::proc_macro::TokenTree::Ident(
             ::proc_macro::Ident::new("_", $span),

-- 
2.51.0

