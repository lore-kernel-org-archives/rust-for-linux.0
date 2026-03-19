Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC63B6BEC;
	Thu, 19 Mar 2026 09:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913224; cv=none; b=jMuK/dMNvBr471TCMmu8oISrjq4ticUtElQfoeoYuliew5lICU6/ruEKzXb2Xdc21W8TP/DHekEgSQrtHfZJsFrEBLvHpmaG4G1lpumT3KR003wpV+/mPaSp588MRg4JHg4kKwfouMfWeh4KZcsmqmfGO8s0jBXNj4k6CfbadyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913224; c=relaxed/simple;
	bh=YOSVIA/sFKy8EDlR8CuwlMh6qQ0FTqHzhmUqYFaHn7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Px5H3RL9OPs2+AkZV3O+ZjLgQB+JifllzeWzB3LI3N6RWak5k11Wcw1YlhlsdzG4hRXhg7BI9vzz7IMXiSZX0hI8L95Rvr1M4Q+TOid9nKJB1k70pJh4Pc2B6psXqEka2MY4thnO3ykdcDlNvXKEaLl57ZEI+HAHNSBY4b1t2gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBrPcDHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBrPcDHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01568C2BC87;
	Thu, 19 Mar 2026 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913223;
	bh=YOSVIA/sFKy8EDlR8CuwlMh6qQ0FTqHzhmUqYFaHn7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VBrPcDHfscWMwjNKbTxm7CeImyiNYrIMGpzw8CLJ9ngB2gdggLL/85DHUDVkvtiBt
	 4i4tOcakjnD4g5ABqCi6NxY23I/IUMPJCc+XLG1QoHLNFNY2oZXzVwb+3S1Wsr7yK/
	 F9ILtsvUPY3tK4wIe+b6YzW9D1GiZCfL61faO4nZ8VOwCsElwMq7FI5JcLIp2nBmbO
	 dd9pz/YVTY1190vumhS33Afv22+ggpimtRZZucyXjsMdyH3ExeWiXGQXMQoXbhX4QN
	 aH2gD8j5FvX65UYoNDVxaRg/S2nx0SeZvWu6fNQaXABEn2cuBF4Pk34K278giOqZZw
	 LQoEcFDon4Qww==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Antonio Hickey <contact@antoniohickey.com>,
	Janne Grunau <j@jannau.net>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Oleksandr Babak <alexanderbabak@proton.me>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] rust: pin-init: properly document let binding workaround
Date: Thu, 19 Mar 2026 10:35:25 +0100
Message-ID: <20260319093542.3756606-3-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319093542.3756606-1-lossin@kernel.org>
References: <20260319093542.3756606-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The three let bindings (in the bodies of `cast_init`, `cast_pin_init`
and the `init!` macro) are used to avoid the following compiler error in
Rust 1.78.0, 1.79.0, 1.80.0, 1.80.1, and 1.81.0 (just showing the one
for `cast_init`, the others are similar):

    error[E0391]: cycle detected when computing type of opaque `cast_init::{opaque#0}`
        --> src/lib.rs:1160:66
         |
    1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
         |                                                                  ^^^^^^^^^^^^^^^
         |
    note: ...which requires borrow-checking `cast_init`...
        --> src/lib.rs:1160:1
         |
    1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
         | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    note: ...which requires const checking `cast_init`...
        --> src/lib.rs:1160:1
         |
    1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
         | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
         = note: ...which requires computing whether `cast_init::{opaque#0}` is freeze...
         = note: ...which requires evaluating trait selection obligation `cast_init::{opaque#0}: core::marker::Freeze`...
         = note: ...which again requires computing type of opaque `cast_init::{opaque#0}`, completing the cycle
    note: cycle used when computing type of `cast_init::{opaque#0}`
        --> src/lib.rs:1160:66
         |
    1160 | pub const unsafe fn cast_init<T, U, E>(init: impl Init<T, E>) -> impl Init<U, E> {
         |                                                                  ^^^^^^^^^^^^^^^
         = note: see https://rustc-dev-guide.rust-lang.org/overview.html#queries and https://rustc-dev-guide.rust-lang.org/query.html for more information

Once we raise the nightly-MSRV above 1.81, we can remove this
workaround.

Link: https://github.com/Rust-for-Linux/pin-init/commit/bb3e96f3e9a4f5fca80a22af883c7e5aa90f0893
[ Moved this commit after the previous one to avoid a build failure due
  to unstable features. Changed the cfg to use `USE_RUSTC_FEAUTURES`.
  - Benno ]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/examples/big_struct_in_place.rs |  2 ++
 rust/pin-init/internal/src/init.rs            |  6 ++++++
 rust/pin-init/src/lib.rs                      | 18 ++++++++++++------
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/rust/pin-init/examples/big_struct_in_place.rs b/rust/pin-init/examples/big_struct_in_place.rs
index c05139927486..de8612a5e27d 100644
--- a/rust/pin-init/examples/big_struct_in_place.rs
+++ b/rust/pin-init/examples/big_struct_in_place.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
+#![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
+
 use pin_init::*;
 
 // Struct with size over 1GiB
diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index 2fe918f4d82a..c1c9400b090a 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -173,6 +173,12 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
         };
         // SAFETY: TODO
         let init = unsafe { ::pin_init::#init_from_closure::<_, #error>(init) };
+        // FIXME: this let binding is required to avoid a compiler error (cycle when computing the
+        // opaque type returned by this function) before Rust 1.81. Remove after MSRV bump.
+        #[allow(
+            clippy::let_and_return,
+            reason = "some clippy versions warn about the let binding"
+        )]
         init
     }})
 }
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index b1de166b5626..a513930ee01a 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1144,9 +1144,12 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
     let res = unsafe { pin_init_from_closure(|ptr: *mut U| init.__pinned_init(ptr.cast::<T>())) };
-    // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
-    // cycle when computing the type returned by this function)
-    #[allow(clippy::let_and_return)]
+    // FIXME: this let binding is required to avoid a compiler error (cycle when computing the opaque
+    // type returned by this function) before Rust 1.81. Remove after MSRV bump.
+    #[allow(
+        clippy::let_and_return,
+        reason = "some clippy versions warn about the let binding"
+    )]
     res
 }
 
@@ -1160,9 +1163,12 @@ unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
     // SAFETY: initialization delegated to a valid initializer. Cast is valid by function safety
     // requirements.
     let res = unsafe { init_from_closure(|ptr: *mut U| init.__init(ptr.cast::<T>())) };
-    // FIXME: remove the let statement once the nightly-MSRV allows it (1.78 otherwise encounters a
-    // cycle when computing the type returned by this function)
-    #[allow(clippy::let_and_return)]
+    // FIXME: this let binding is required to avoid a compiler error (cycle when computing the opaque
+    // type returned by this function) before Rust 1.81. Remove after MSRV bump.
+    #[allow(
+        clippy::let_and_return,
+        reason = "some clippy versions warn about the let binding"
+    )]
     res
 }
 
-- 
2.53.0

