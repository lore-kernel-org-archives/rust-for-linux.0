Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64D2186E2E;
	Thu, 19 Mar 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913240; cv=none; b=MVPJToJ16QNtrtO3yaTujE8/FPVTnBuhg2hoHa8p94vgk2uR+3kM9oe+ngt1EvjJEa+wRn6qOyMofHwfIUZrSx3/FCdJFk0JGDMQAicIdDgwVv2Bvq0IH1rgm/fUG86omg2+GRSqE3CaKcpfYCZDw3JvdOcW2UZmX+7/xVKXBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913240; c=relaxed/simple;
	bh=JHsdH/EAalW0ppjGx1wo/Fd7E9MW645nNhyZRQWuUQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzTPzbx7SOtDMxQ6gO0Czg15ZEDwSAIAuGoZ3cHntiPW8YTC5Abesu9NGoJtcyV4a88hDMa9c15IyaficmfIB2O9d2XG2tRJvW8aYqhN5FGgWbFDdcjiwxFJ2BkSfBSESJUzVUlKYYiprUi6wN/VHqFrLAh7GDFtBfQSkx8BkTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSrvC1vt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSrvC1vt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D6FC2BC87;
	Thu, 19 Mar 2026 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913240;
	bh=JHsdH/EAalW0ppjGx1wo/Fd7E9MW645nNhyZRQWuUQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SSrvC1vtIUlLGfXrcFn6dHuc3AMm8Jzvv51kpTrzz8iTzKInbCLQ4dy/gRLHYlhPy
	 7prD6pocKmZTrAqg5xRLLXoQihmq3WyHAEWLMLFay9l4yjDCnSs45b5meBIgu4/Yx6
	 KL7KnMo/2vc3XMfys/nDeGFP/cfmw6VEieDVq78gwoDu5OtIqQ493BqwHPFSy7nx6w
	 a4gfuxA0685Ej/JddU2XdSUJFfbtWbP6zpbXBnFSFtRH9WhT8vJXrRAx4sZJP//aPz
	 RhVJ8n9p9Jxud07W2jFBczX5KZa7GD33lrJ9/Osm/IpfHjcDz1bD4GrbWnyxBvCorv
	 RU4FP0Xr21QKQ==
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
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Oleksandr Babak <alexanderbabak@proton.me>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] rust: pin-init: replace `addr_of_mut!` with `&raw mut`
Date: Thu, 19 Mar 2026 10:35:28 +0100
Message-ID: <20260319093542.3756606-6-lossin@kernel.org>
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

From: Antonio Hickey <contact@antoniohickey.com>

`feature(raw_ref_op)` became stable in Rust 1.82.0 which is the current
MSRV of pin-init with no default features. Earlier Rust versions will
now need to enable `raw_ref_op` to continue to work with pin-init.

This reduces visual complexity and improves consistency with existing
reference syntax.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Closes: https://github.com/Rust-for-Linux/pin-init/issues/99
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
Link: https://github.com/Rust-for-Linux/pin-init/commit/e27763004e2f6616b089437fbe9b3719cd72bd5c
[ Reworded commit message. - Benno ]
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/README.md                       | 3 +--
 rust/pin-init/examples/big_struct_in_place.rs | 1 +
 rust/pin-init/examples/linked_list.rs         | 1 +
 rust/pin-init/examples/mutex.rs               | 1 +
 rust/pin-init/examples/pthread_mutex.rs       | 1 +
 rust/pin-init/examples/static_init.rs         | 1 +
 rust/pin-init/internal/src/init.rs            | 8 ++++----
 rust/pin-init/src/lib.rs                      | 8 ++++----
 8 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/rust/pin-init/README.md b/rust/pin-init/README.md
index 6cee6ab1eb57..9095d6661ff6 100644
--- a/rust/pin-init/README.md
+++ b/rust/pin-init/README.md
@@ -160,7 +160,6 @@ actually does the initialization in the correct way. Here are the things to look
 ```rust
 use pin_init::{pin_data, pinned_drop, PinInit, PinnedDrop, pin_init_from_closure};
 use core::{
-    ptr::addr_of_mut,
     marker::PhantomPinned,
     cell::UnsafeCell,
     pin::Pin,
@@ -199,7 +198,7 @@ impl RawFoo {
         unsafe {
             pin_init_from_closure(move |slot: *mut Self| {
                 // `slot` contains uninit memory, avoid creating a reference.
-                let foo = addr_of_mut!((*slot).foo);
+                let foo = &raw mut (*slot).foo;
                 let foo = UnsafeCell::raw_get(foo).cast::<bindings::foo>();
 
                 // Initialize the `foo`
diff --git a/rust/pin-init/examples/big_struct_in_place.rs b/rust/pin-init/examples/big_struct_in_place.rs
index de8612a5e27d..80f89b5f8fd6 100644
--- a/rust/pin-init/examples/big_struct_in_place.rs
+++ b/rust/pin-init/examples/big_struct_in_place.rs
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
 #![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 
 use pin_init::*;
 
diff --git a/rust/pin-init/examples/linked_list.rs b/rust/pin-init/examples/linked_list.rs
index 226e33e4a957..119169e4dc41 100644
--- a/rust/pin-init/examples/linked_list.rs
+++ b/rust/pin-init/examples/linked_list.rs
@@ -3,6 +3,7 @@
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
 #![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 
 use core::{
     cell::Cell,
diff --git a/rust/pin-init/examples/mutex.rs b/rust/pin-init/examples/mutex.rs
index e534c367f644..d53671f0edb8 100644
--- a/rust/pin-init/examples/mutex.rs
+++ b/rust/pin-init/examples/mutex.rs
@@ -3,6 +3,7 @@
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
 #![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 #![allow(clippy::missing_safety_doc)]
 
 use core::{
diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index 562ca5d3d08c..f3b5cc9b7134 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -4,6 +4,7 @@
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
 #![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 
 #[cfg(not(windows))]
 mod pthread_mtx {
diff --git a/rust/pin-init/examples/static_init.rs b/rust/pin-init/examples/static_init.rs
index df562134a53c..f7e53d1a5ae6 100644
--- a/rust/pin-init/examples/static_init.rs
+++ b/rust/pin-init/examples/static_init.rs
@@ -3,6 +3,7 @@
 #![allow(clippy::undocumented_unsafe_blocks)]
 #![cfg_attr(feature = "alloc", feature(allocator_api))]
 #![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 #![allow(unused_imports)]
 
 use core::{
diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index c1c9400b090a..daa3f1c6466e 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -270,7 +270,7 @@ fn init_fields(
                     {
                         #value_prep
                         // SAFETY: TODO
-                        unsafe { #write(::core::ptr::addr_of_mut!((*#slot).#ident), #value_ident) };
+                        unsafe { #write(&raw mut (*#slot).#ident, #value_ident) };
                     }
                     #(#cfgs)*
                     #[allow(unused_variables)]
@@ -293,7 +293,7 @@ fn init_fields(
                             //   return when an error/panic occurs.
                             // - We also use `#data` to require the correct trait (`Init` or `PinInit`)
                             //   for `#ident`.
-                            unsafe { #data.#ident(::core::ptr::addr_of_mut!((*#slot).#ident), #init)? };
+                            unsafe { #data.#ident(&raw mut (*#slot).#ident, #init)? };
                         },
                         quote! {
                             // SAFETY: TODO
@@ -308,7 +308,7 @@ fn init_fields(
                             unsafe {
                                 ::pin_init::Init::__init(
                                     #init,
-                                    ::core::ptr::addr_of_mut!((*#slot).#ident),
+                                    &raw mut (*#slot).#ident,
                                 )?
                             };
                         },
@@ -348,7 +348,7 @@ fn init_fields(
                 // SAFETY: We forget the guard later when initialization has succeeded.
                 let #guard = unsafe {
                     ::pin_init::__internal::DropGuard::new(
-                        ::core::ptr::addr_of_mut!((*slot).#ident)
+                        &raw mut (*slot).#ident
                     )
                 };
             });
diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index d09e7fe97eae..64eec095c859 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -172,7 +172,6 @@
 //! # #![feature(extern_types)]
 //! use pin_init::{pin_data, pinned_drop, PinInit, PinnedDrop, pin_init_from_closure};
 //! use core::{
-//!     ptr::addr_of_mut,
 //!     marker::PhantomPinned,
 //!     cell::UnsafeCell,
 //!     pin::Pin,
@@ -211,7 +210,7 @@
 //!         unsafe {
 //!             pin_init_from_closure(move |slot: *mut Self| {
 //!                 // `slot` contains uninit memory, avoid creating a reference.
-//!                 let foo = addr_of_mut!((*slot).foo);
+//!                 let foo = &raw mut (*slot).foo;
 //!                 let foo = UnsafeCell::raw_get(foo).cast::<bindings::foo>();
 //!
 //!                 // Initialize the `foo`
@@ -265,6 +264,7 @@
 //! [Rust-for-Linux]: https://rust-for-linux.com/
 
 #![cfg_attr(USE_RUSTC_FEATURES, feature(lint_reasons))]
+#![cfg_attr(USE_RUSTC_FEATURES, feature(raw_ref_op))]
 #![cfg_attr(
     all(any(feature = "alloc", feature = "std"), USE_RUSTC_FEATURES),
     feature(new_uninit)
@@ -754,7 +754,7 @@ macro_rules! stack_try_pin_init {
 ///
 /// ```rust
 /// # use pin_init::*;
-/// # use core::{ptr::addr_of_mut, marker::PhantomPinned};
+/// # use core::marker::PhantomPinned;
 /// #[pin_data]
 /// #[derive(Zeroable)]
 /// struct Buf {
@@ -768,7 +768,7 @@ macro_rules! stack_try_pin_init {
 /// let init = pin_init!(&this in Buf {
 ///     buf: [0; 64],
 ///     // SAFETY: TODO.
-///     ptr: unsafe { addr_of_mut!((*this.as_ptr()).buf).cast() },
+///     ptr: unsafe { (&raw mut (*this.as_ptr()).buf).cast() },
 ///     pin: PhantomPinned,
 /// });
 /// let init = pin_init!(Buf {
-- 
2.53.0

