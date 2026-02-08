Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA2B665
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Feb 2026 22:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770590853; cv=none; b=eEsjAa3bzUPoTbK1ei2Z7rt1m7SPe0juAB8ABGUq+phs4ZC6IiP3hhPe1i2ciizet90f3976ZCXcLxnsEuNvA/V3Zcp0H5PNxZwavy8loGT7Jo0COP1Bbq0cNdJ9OmkoRkAZfAJQVXmI1xs0ksfv5GjHOYnnPGh/OjEtC25XMZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770590853; c=relaxed/simple;
	bh=s8pW2Kycjh2ttATRdWr3ibvFuD9ITqgQoQFMD9lORn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odfI3B0RAIMT96coxZQkx1gjOz7XuO4Qr+VuGWJdhwFrAqpm3mkdXvHjUF88KnNOo6RX0xAhELrp+DlIaf5touFlDMMpkPlFv8cV2VptzjbGBJIlPFH/L+RaV3tGZOnr5J8l5KsViC8xTDsmOIKs3JxXvqeewkmYNoqWc/lAPFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtjrU9rb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtjrU9rb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433EBC16AAE;
	Sun,  8 Feb 2026 22:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770590852;
	bh=s8pW2Kycjh2ttATRdWr3ibvFuD9ITqgQoQFMD9lORn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtjrU9rbQbjJx/uhNB6XmKqg5VZTbfxntywv03O4YoDFwLYE3BV+HCPigJK+6OvfJ
	 A7WfabF+Hw9cyyE1F8DI/J4eb6qWLpbzQ4u2kL/gwHwFzSO5jIqbXvFBB9353+kOYm
	 sHJP9RJrgKnf/E2VoCWrkzZCxFeINcMcp8ZLzxCmDXsBZZrwNKIEexAxR0JE55szAE
	 caO7nM/5CF++df/qz4V+2fIgsvngtr/wyorsRehzL6rD9tvoTkJ5JmzIeHHFbBf2mU
	 i4SOi3OHumR2h+W53kUcXBCTmjJkJ4y1ZqtY/migAB7uzOnX5lae9SBriM9Xdy4E2s
	 Psgprn/X7J2mw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] rust: prelude: use the "kernel vertical" imports style
Date: Sun,  8 Feb 2026 23:46:58 +0100
Message-ID: <20260208224659.18406-2-ojeda@kernel.org>
In-Reply-To: <20260208224659.18406-1-ojeda@kernel.org>
References: <20260208224659.18406-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Format the Rust prelude to use the "kernel vertical" imports style [1].

No functional changes intended.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/prelude.rs | 114 +++++++++++++++++++++++++++++++----------
 1 file changed, 88 insertions(+), 26 deletions(-)

diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 2877e3f7b6d3..81a8cba66879 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -13,43 +13,105 @@
 
 #[doc(no_inline)]
 pub use core::{
-    mem::{align_of, align_of_val, size_of, size_of_val},
-    pin::Pin,
+    mem::{
+        align_of,
+        align_of_val,
+        size_of,
+        size_of_val, //
+    },
+    pin::Pin, //
 };
 
-pub use ::ffi::{
-    c_char, c_int, c_long, c_longlong, c_schar, c_short, c_uchar, c_uint, c_ulong, c_ulonglong,
-    c_ushort, c_void, CStr,
+pub use ffi::{
+    c_char,
+    c_int,
+    c_long,
+    c_longlong,
+    c_schar,
+    c_short,
+    c_uchar,
+    c_uint,
+    c_ulong,
+    c_ulonglong,
+    c_ushort,
+    c_void,
+    CStr, //
 };
 
-pub use crate::alloc::{flags::*, Box, KBox, KVBox, KVVec, KVec, VBox, VVec, Vec};
-
 #[doc(no_inline)]
-pub use macros::{export, fmt, kunit_tests, module, vtable};
+pub use macros::{
+    export,
+    fmt,
+    kunit_tests,
+    module,
+    vtable, //
+};
 
-pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
+pub use pin_init::{
+    init,
+    pin_data,
+    pin_init,
+    pinned_drop,
+    InPlaceWrite,
+    Init,
+    PinInit,
+    Zeroable, //
+};
 
-pub use super::{build_assert, build_error};
+pub use super::{
+    alloc::{
+        flags::*,
+        Box,
+        KBox,
+        KVBox,
+        KVVec,
+        KVec,
+        VBox,
+        VVec,
+        Vec, //
+    },
+    build_assert,
+    build_error,
+    current,
+    dev_alert,
+    dev_crit,
+    dev_dbg,
+    dev_emerg,
+    dev_err,
+    dev_info,
+    dev_notice,
+    dev_warn,
+    error::{
+        code::*,
+        Error,
+        Result, //
+    },
+    init::{
+        InPlaceInit, //
+    },
+    pr_alert,
+    pr_crit,
+    pr_debug,
+    pr_emerg,
+    pr_err,
+    pr_info,
+    pr_notice,
+    pr_warn,
+    static_assert,
+    str::{
+        CStrExt as _, //
+    },
+    try_init,
+    try_pin_init,
+    uaccess::{
+        UserPtr, //
+    },
+    ThisModule, //
+};
 
 // `super::std_vendor` is hidden, which makes the macro inline for some reason.
 #[doc(no_inline)]
 pub use super::dbg;
-pub use super::{dev_alert, dev_crit, dev_dbg, dev_emerg, dev_err, dev_info, dev_notice, dev_warn};
-pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
-
-pub use super::{try_init, try_pin_init};
-
-pub use super::static_assert;
-
-pub use super::error::{code::*, Error, Result};
-
-pub use super::{str::CStrExt as _, ThisModule};
-
-pub use super::init::InPlaceInit;
-
-pub use super::current;
-
-pub use super::uaccess::UserPtr;
 
 #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
 pub use super::slice::AsFlattened;
-- 
2.53.0

