Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EA41A683D;
	Mon, 21 Sep 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991844; cv=none; b=ZmmXBwWzFTOtu11pAHnCCcTxowfh+QUVto7pkbDuk8PUmtBMx05uuyuY0IbhciUynVOBwyQFZ7TyfpOb6m4TymDxrUCdsIX95b+h/dRzbVMlYwBPDVoXTUB1UlpRvi8zuzWAgbZzvAAoj4xvD4OBjVmSY92hOm0ic//l004QaVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991844; c=relaxed/simple;
	bh=z6B3gXChls0QIDLqXAw/90YZ2CIIF8h6vVMZyubyZRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uhlJDi+bLYyEjUnJCO0ix9xbb3hSCutIh5RiDT5FusJRoRlD8Fwc8F3cNIo7ugBq3pntQeYUM5tuoMIscpq1DAJS9T1ZKmqpLZ6zwm8qVw5x2MVJlRQLbWvBp/qTlxnKu/wLQMQqVGMiq15GCUyAD1YqwiyEpa5n8uRAlNom4n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnZ+gk92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnZ+gk92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFF01F000FF;
	Mon, 21 Sep 2026 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789991843;
	bh=ipcW4ouILRXncfth75T0aMdgYWDwKvkKwCyzRkUBAj8=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=lnZ+gk92+xnmffJxVfYJG3vMv/ywDsTo9M8PWnc/oWezaVrG0MYNd1hRpeh7Uj9B2
	 xEj5tETqy90xPeigT5+D0FUVVymOIDbGSip7fJH4EJoJY0kvKl8/wqN+sR3wzKUhb/
	 ky0Gl6xoyrpxiJLs/SsY2wdOaNE9GyzKKNE/SDAxCdukbnMIkRT9cFpmJiBES05CD4
	 JEmtFZgQgPsDHyuD5QbbNtWW8BwF3Ra4ug0/xGk1PcJLq7i4hMMzilxjwnhuuL1/la
	 nNMEkrewPYHUwIUrIwQ1kZuAchCwt5RmE8OFGiSFlguS6yzY6TF4zKjpi6FVTOm6BV
	 EC8rP72HXwGXQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
Date: Mon, 21 Sep 2026 12:57:07 +0100
Message-ID: <20260921115708.4009754-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

The `Span::join` function is very important in generating useful
diagnostics. When invoking `syn::Spanned::span`, it attempts to return a
overall span that covers the whole expression. If the `join` function is
unavailable, however, only the span of the first token is generated.

This causes worse diagnostics quality for all macros, notably pin-init,
when compared to the pin-init's own diagnostics test suite with the feature
enabled.

For example, this diagnostic refers to only a fragment of path and not the
full one:

    error: The field index `1` of type `PhantomPinned` only has an effect if it has the `#[pin]` attribute
     --> tests/ui/compile-fail/pin_data/tuple_struct_missing_pin_phantom.rs:6:20
      |
    6 | struct Tuple<T>(T, core::marker::PhantomPinned);
      |                    ^^^^

The special "<-" syntax gets parsed as two tokens, so they are only
partially marked in diagnostics:

    error: `<-` is not supported in tuple constructor syntax; name the fields by index instead, e.g. `Type { 0 <- initializer, 1: value }`
     --> tests/ui/compile-fail/init/no_tuple_paren_arrow.rs:7:29
      |
    7 |     let _ = pin_init!(Tuple(<- 1, 2));
      |                             ^

In the upcoming pin-init self-reference series, there are also custom
diagnostics that wish to use the span of the full type instead of its first
token.

Thus, enable the `proc_macro_span` feature. This does make use of the
unstable `Span::join` function, but this is for producing diagnostics only,
so we do not have a hard reliance on the feature. A very small tweak of
proc-macro2 vendored code is needed to make the code compile for 1.85.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Miguel, please let me know if you're okay with the proc-macro2
modification.

I'd like to take this via pin-init-next if possible.
---
 rust/Makefile                             | 1 +
 rust/proc-macro2/README.md                | 3 ++-
 rust/proc-macro2/probe/proc_macro_span.rs | 8 --------
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index da1a7409d984..5ee9c30c324a 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -100,6 +100,7 @@ zerocopy-envs := \
 proc_macro2-cfgs := \
     feature="proc-macro" \
     wrap_proc_macro \
+    proc_macro_span \
     $(if $(call rustc-min-version,108800),proc_macro_span_file proc_macro_span_location)
 
 proc_macro2-flags := \
diff --git a/rust/proc-macro2/README.md b/rust/proc-macro2/README.md
index af044fee4f59..c63a7434217c 100644
--- a/rust/proc-macro2/README.md
+++ b/rust/proc-macro2/README.md
@@ -4,7 +4,8 @@ These source files come from the Rust `proc-macro2` crate, version
 1.0.101 (released 2025-08-16), hosted in the
 <https://github.com/dtolnay/proc-macro2> repository, licensed under
 "Apache-2.0 OR MIT" and only modified to add the SPDX license
-identifiers and to remove the `unicode-ident` dependency.
+identifiers, to remove the `unicode-ident` dependency, and to build with 1.85
+with nightly features enabled.
 
 For copyright details, please see:
 
diff --git a/rust/proc-macro2/probe/proc_macro_span.rs b/rust/proc-macro2/probe/proc_macro_span.rs
index 892a7eb3e5a0..fc7dfb4ac156 100644
--- a/rust/proc-macro2/probe/proc_macro_span.rs
+++ b/rust/proc-macro2/probe/proc_macro_span.rs
@@ -32,14 +32,6 @@ pub fn column(this: &Span) -> usize {
     this.column()
 }
 
-pub fn file(this: &Span) -> String {
-    this.file()
-}
-
-pub fn local_file(this: &Span) -> Option<PathBuf> {
-    this.local_file()
-}
-
 pub fn join(this: &Span, other: Span) -> Option<Span> {
     this.join(other)
 }

base-commit: dfb6a037fd586f1ffcba3b143dab58f5c88294d1
-- 
2.54.0

