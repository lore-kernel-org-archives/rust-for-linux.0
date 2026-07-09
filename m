Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2842D29C7
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 21:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783631611; cv=none; b=oUilvcMK3ebxdR58hUVrjtkg53aDsDgHsv3oCyUmehDlmAQ0K7vE+emhc3CVWewOG/5s10IXxHwdiIQD0Z8ruTQiTf1aohyM7nafXOllYy1ON2CNDBpMXFfYZRbpeSo95WJquXx/klD2CMwx6g7Rpsf8unfj4HXksgUgwhI2k5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783631611; c=relaxed/simple;
	bh=bqdv+TY2WrGkXu1W8c8lKTCe1tey4el9AuN1e1OVnsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hr7JOEqhRUe5cKAi/GV4ET554m3pTsee6dbynwX9gDGI7wlvEOrWo4igWIART2yXw8xg/7+CrxZzWqLnxLNFQ/lKXIqXmUda7F6RMtVkBsB8N199SIKtb84IH2LBBDcqknTZMYG2D6TIj91NVDnMq+2h/NIv9OcflMKPpPyWrjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtXqBzfI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtXqBzfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78391F000E9;
	Thu,  9 Jul 2026 21:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783631609;
	bh=pnCxH1c6Mxef2nPS/0MDqVBweSnAO3uS5IVi/xHN+Uk=;
	h=From:To:Cc:Subject:Date;
	b=BtXqBzfIWMrzAMVgIVeW9K2uuUlE+STPPj/lXytmCxx+wtv4MO0YJQnz//lL1Mcss
	 3eBTD4Cg0jyjTgbHPrArUbYaHkS/0U0uJFkLXhCHDoatFWABmpw/JlFYTW9IKuysEu
	 9gTMdF6+HuuKOkKMIUTq/ehnEQNvK7m5YuhnG2BL63ebSIgVAuX2sKCRrBf2XFlB/8
	 rrDwb5zYC/O6VejOJLWAurpHAPBndGYsRhM5eqrcHwpnSiLqJjBu3a/LHpBlk9XU0V
	 JkaYFBfANXuOA5MtM2h23thXoQgOMmZl5me6lEaAwINz+QIpFY5bqxyVmCPE50NL3f
	 iSC1soxPOBArQ==
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>
Subject: [PATCH] rust: zerocopy: update to v0.8.54
Date: Thu,  9 Jul 2026 23:13:11 +0200
Message-ID: <20260709211311.142544-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.54.

It is a very small delta from v0.8.52, and most importantly it resolves
the unexpected lack of inlining [1] which triggered a modpost error
under `CONFIG_CC_OPTIMIZE_FOR_SIZE=y` reported by Alexandre using Gary's
suggestion [2]:

    ERROR: modpost: "_RNvMNtCs5wX7wwEUCR9_8zerocopy6layoutNtB2_8SizeInfo24try_to_nonzero_elem_size" [drivers/gpu/nova-core.ko] undefined!
    ERROR: modpost: "_RNvNtCs5wX7wwEUCR9_8zerocopy4util18padding_needed_for" [drivers/gpu/nova-core.ko] undefined!

It also resolves `most_traits` being unexpectedly documented [3] that I
reported and adds a missing SPDX license identifier [4] that I requested
to match the kernel version.

The following script may be used to check for the remaining differences:

    for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name README.md); do
        curl --silent --show-error --location \
            https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/zerocopy-derive/src/$path |
            git diff --no-index - rust/zerocopy-derive/$path &&
            echo $path: OK
    done

    for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md); do
        curl --silent --show-error --location \
            https://github.com/google/zerocopy/raw/v0.8.54/zerocopy/$path |
            git diff --no-index - rust/zerocopy/$path &&
            echo $path: OK
    done

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@google.com>
Reported-by: Alexandre Courbot <acourbot@nvidia.com>
Link: https://lore.kernel.org/rust-for-linux/20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com/ [1]
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DJT6235B3DOV.222XR5O6VHG4M@garyguo.net/ [2]
Link: https://github.com/google/zerocopy/issues/3466 [3]
Link: https://github.com/google/zerocopy/issues/3457 [4]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
This goes on top of the v0.8.52 one:

  https://lore.kernel.org/rust-for-linux/20260625231919.692444-1-ojeda@kernel.org/

I may land both in `rust-fixes`, especially if someone else can confirm
it works for them (I reproduced Alexandre's issue and this does indeed
solve it).

 rust/Makefile                   |  2 +-
 rust/zerocopy-derive/README.md  | 12 ++++++------
 rust/zerocopy-derive/lib.rs     |  2 +-
 rust/zerocopy/README.md         | 12 ++++++------
 rust/zerocopy/rustdoc/style.css |  1 -
 rust/zerocopy/src/byteorder.rs  |  1 +
 rust/zerocopy/src/layout.rs     |  2 ++
 rust/zerocopy/src/lib.rs        |  1 -
 rust/zerocopy/src/util/mod.rs   |  6 ++++++
 9 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 835cf10e1c0b..627ed79dc6f5 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -92,7 +92,7 @@ zerocopy-flags := \
     $(call cfgs-to-flags,$(zerocopy-cfgs))

 zerocopy-envs := \
-    CARGO_PKG_VERSION=0.8.52
+    CARGO_PKG_VERSION=0.8.54

 proc_macro2-cfgs := \
     feature="proc-macro" \
diff --git a/rust/zerocopy-derive/README.md b/rust/zerocopy-derive/README.md
index 2a3dcf1212af..d62c79804342 100644
--- a/rust/zerocopy-derive/README.md
+++ b/rust/zerocopy-derive/README.md
@@ -1,14 +1,14 @@
 # `zerocopy-derive`

-These source files come from the Rust `zerocopy-derive` crate, version v0.8.52
-(released 2026-06-09), hosted in the <https://github.com/google/zerocopy>
+These source files come from the Rust `zerocopy-derive` crate, version v0.8.54
+(released 2026-07-08), hosted in the <https://github.com/google/zerocopy>
 repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
 modified to tweak the SPDX license identifiers and to remove the generation of
 non-ASCII identifiers.

 For copyright details, please see:

-    https://github.com/google/zerocopy/blob/v0.8.52/README.md?plain=1
-    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-BSD
-    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-APACHE
-    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-MIT
+    https://github.com/google/zerocopy/blob/v0.8.54/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-MIT
diff --git a/rust/zerocopy-derive/lib.rs b/rust/zerocopy-derive/lib.rs
index 88599e750894..d387de368367 100644
--- a/rust/zerocopy-derive/lib.rs
+++ b/rust/zerocopy-derive/lib.rs
@@ -129,7 +129,7 @@ fn into_ts(self) -> proc_macro2::TokenStream {
 derive!(ByteEq => derive_eq => crate::derive::derive_eq);
 derive!(SplitAt => derive_split_at => crate::derive::derive_split_at);

-#[cfg_attr(zerocopy_unstable_linux, doc(hidden))]
+#[cfg_attr(not(zerocopy_unstable_linux), doc(hidden))]
 #[proc_macro_derive(most_traits, attributes(zerocopy))]
 pub fn most_traits(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
     let ast = syn::parse_macro_input!(ts as DeriveInput);
diff --git a/rust/zerocopy/README.md b/rust/zerocopy/README.md
index 712b0317df25..3d11a6502cf0 100644
--- a/rust/zerocopy/README.md
+++ b/rust/zerocopy/README.md
@@ -1,13 +1,13 @@
 # `zerocopy`

-These source files come from the Rust `zerocopy` crate, version v0.8.52
-(released 2026-06-09), hosted in the <https://github.com/google/zerocopy>
+These source files come from the Rust `zerocopy` crate, version v0.8.54
+(released 2026-07-08), hosted in the <https://github.com/google/zerocopy>
 repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
 modified to tweak the SPDX license identifiers.

 For copyright details, please see:

-    https://github.com/google/zerocopy/blob/v0.8.52/README.md?plain=1
-    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-BSD
-    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-APACHE
-    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-MIT
+    https://github.com/google/zerocopy/blob/v0.8.54/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.54/LICENSE-MIT
diff --git a/rust/zerocopy/rustdoc/style.css b/rust/zerocopy/rustdoc/style.css
index 414348964af2..d2d55ad2e689 100644
--- a/rust/zerocopy/rustdoc/style.css
+++ b/rust/zerocopy/rustdoc/style.css
@@ -1,5 +1,4 @@
 /* SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT */
-
 /*
 Copyright 2026 The Fuchsia Authors

diff --git a/rust/zerocopy/src/byteorder.rs b/rust/zerocopy/src/byteorder.rs
index ecf95e38eebd..c761d5728320 100644
--- a/rust/zerocopy/src/byteorder.rs
+++ b/rust/zerocopy/src/byteorder.rs
@@ -100,6 +100,7 @@ impl Sealed for super::LittleEndian {}

 #[allow(missing_copy_implementations, missing_debug_implementations)]
 #[doc(hidden)]
+#[derive(PartialEq)]
 pub enum Order {
     BigEndian,
     LittleEndian,
diff --git a/rust/zerocopy/src/layout.rs b/rust/zerocopy/src/layout.rs
index 942d35db8957..b1fa0cd436db 100644
--- a/rust/zerocopy/src/layout.rs
+++ b/rust/zerocopy/src/layout.rs
@@ -71,6 +71,8 @@ impl SizeInfo {
     /// Attempts to create a `SizeInfo` from `Self` in which `elem_size` is a
     /// `NonZeroUsize`. If `elem_size` is 0, returns `None`.
     #[allow(unused)]
+    #[cfg_attr(not(zerocopy_inline_always), inline)]
+    #[cfg_attr(zerocopy_inline_always, inline(always))]
     const fn try_to_nonzero_elem_size(&self) -> Option<SizeInfo<NonZeroUsize>> {
         Some(match *self {
             SizeInfo::Sized { size } => SizeInfo::Sized { size },
diff --git a/rust/zerocopy/src/lib.rs b/rust/zerocopy/src/lib.rs
index 700fece1b728..572f0563fe2f 100644
--- a/rust/zerocopy/src/lib.rs
+++ b/rust/zerocopy/src/lib.rs
@@ -435,7 +435,6 @@
     WARNING
 };

-#[doc(hidden)]
 #[cfg(all(any(feature = "derive", test), zerocopy_unstable_linux))]
 pub use zerocopy_derive::most_traits;
 /// Implements [`KnownLayout`].
diff --git a/rust/zerocopy/src/util/mod.rs b/rust/zerocopy/src/util/mod.rs
index f8affbbd336c..02fd4ed62741 100644
--- a/rust/zerocopy/src/util/mod.rs
+++ b/rust/zerocopy/src/util/mod.rs
@@ -150,6 +150,8 @@ pub(crate) fn validate_aligned_to<T: AsAddress, U>(t: T) -> Result<(), Alignment
     // Ensures that we add the minimum required padding.
     kani::ensures(|&p| p < align.get()),
 )]
+#[cfg_attr(not(zerocopy_inline_always), inline)]
+#[cfg_attr(zerocopy_inline_always, inline(always))]
 pub(crate) const fn padding_needed_for(len: usize, align: NonZeroUsize) -> usize {
     #[cfg(kani)]
     #[kani::proof_for_contract(padding_needed_for)]
@@ -251,6 +253,8 @@ fn proof() {
     n & mask
 }

+#[cfg_attr(not(zerocopy_inline_always), inline)]
+#[cfg_attr(zerocopy_inline_always, inline(always))]
 pub(crate) const fn max(a: NonZeroUsize, b: NonZeroUsize) -> NonZeroUsize {
     if a.get() < b.get() {
         b
@@ -259,6 +263,8 @@ pub(crate) const fn max(a: NonZeroUsize, b: NonZeroUsize) -> NonZeroUsize {
     }
 }

+#[cfg_attr(not(zerocopy_inline_always), inline)]
+#[cfg_attr(zerocopy_inline_always, inline(always))]
 pub(crate) const fn min(a: NonZeroUsize, b: NonZeroUsize) -> NonZeroUsize {
     if a.get() > b.get() {
         b
--
2.55.0
