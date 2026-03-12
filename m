Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B5D22A4F1;
	Thu, 12 Mar 2026 17:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337642; cv=none; b=UJZeZVpFRCHWn0zT51KIlDsaycEQ/CKDHUR+dhSQqsb8a05nSkRDUYvKBDrc7jr5/EFv15RV5HnqeTECqGwLy7ilUaANXSrKULjDYhOsiRy4iln2qOTAS32MumatuNgvyvefM5uZrq7pRm2vIn5hit37RW1LXIlO44fIv2aXXsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337642; c=relaxed/simple;
	bh=0LzhGHMtFV7EfAV0wRrBpVwbZX+fv85P4tknNiQk6dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=li1yFKB1VNyi4cyryO+co+km8wzcrf2wvfJFzM2f0NAOErSm+jca1NqmvymexjcY0vBzhUgqihotTQsw/iW5pqEZgpG8V/CkDi3fKg88nw7UZAOe3MAsBnSIsU1Vbw9o+smJ2d0qtjIOrCn+1eTrpxqCU3RA4Fzvq7P/tpA9TGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQx31ZWv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQx31ZWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADCCC4CEF7;
	Thu, 12 Mar 2026 17:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337642;
	bh=0LzhGHMtFV7EfAV0wRrBpVwbZX+fv85P4tknNiQk6dc=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=TQx31ZWvh63fz2Wg3Ey6ckChxOX4MZKfRrNdSthHVgLj/eGf4I7RRr8azFn7PPL8G
	 Vz4wIPFQ4JzlYBfXpxlGDc4qE1VKpPrc27l52LN2G32I0JJ3we2joHzH9COg3wJpyR
	 EitQcyLjGJsAnwPb7UDvRBQqR4fTAPiheNdv0k+0fp8ueo3Fl39lgi8j6Hkxj6WMza
	 DboIhr7gWlcaBmSY6kda1kU7ApIHCWvWjZ1Ya+ySFCpGpzzTj6zcq+Dm70frvARzKv
	 0eosyxIKGHH+iW5SBl0t6Uj3NiO995TTqpCB5zKPI9ZwvlWgMr29aaSs0ViQodTcBD
	 wmN8Hq+yXVWfQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: list: hide macros from top-level kernel doc
Date: Thu, 12 Mar 2026 17:46:59 +0000
Message-ID: <20260312174700.4016015-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Due to Rust macro scoping rules, all macros defined in a crate using
`#[macro_export]` end up in the top-level. For the list macros, we
re-export them inside the list module, and expect users to use
`kernel::list::macro_name!()`.

Use `#[doc(hidden)]` on the macro definition, and use `#[doc(inline)]` on
the re-export to make the macro appear to be defined at module-level inside
documentation.

The other exported types are already automatically `#[doc(inline)]` because
they are defined in a non-public module, so there is no need to split the
macro re-exports out.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/list.rs                    | 22 +++++++++++++++++++---
 rust/kernel/list/arc.rs                |  1 +
 rust/kernel/list/arc_field.rs          |  1 +
 rust/kernel/list/impl_list_item_mod.rs |  3 +++
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 8349ff32fc37..406e3a028c55 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -12,15 +12,31 @@
 use pin_init::PinInit;
 
 mod impl_list_item_mod;
+#[doc(inline)]
 pub use self::impl_list_item_mod::{
-    impl_has_list_links, impl_has_list_links_self_ptr, impl_list_item, HasListLinks, HasSelfPtr,
+    impl_has_list_links,
+    impl_has_list_links_self_ptr,
+    impl_list_item,
+    HasListLinks,
+    HasSelfPtr, //
 };
 
 mod arc;
-pub use self::arc::{impl_list_arc_safe, AtomicTracker, ListArc, ListArcSafe, TryNewListArc};
+#[doc(inline)]
+pub use self::arc::{
+    impl_list_arc_safe,
+    AtomicTracker,
+    ListArc,
+    ListArcSafe,
+    TryNewListArc, //
+};
 
 mod arc_field;
-pub use self::arc_field::{define_list_arc_field_getter, ListArcField};
+#[doc(inline)]
+pub use self::arc_field::{
+    define_list_arc_field_getter,
+    ListArcField, //
+};
 
 /// A linked list.
 ///
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 2282f33913ee..e1082423909c 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -82,6 +82,7 @@ pub unsafe trait TryNewListArc<const ID: u64 = 0>: ListArcSafe<ID> {
 /// [`AtomicTracker`]. However, it is also possible to defer the tracking to another struct
 /// using also using this macro.
 #[macro_export]
+#[doc(hidden)]
 macro_rules! impl_list_arc_safe {
     (impl$({$($generics:tt)*})? ListArcSafe<$num:tt> for $t:ty { untracked; } $($rest:tt)*) => {
         impl$(<$($generics)*>)? $crate::list::ListArcSafe<$num> for $t {
diff --git a/rust/kernel/list/arc_field.rs b/rust/kernel/list/arc_field.rs
index c4b9dd503982..2ad8aea55993 100644
--- a/rust/kernel/list/arc_field.rs
+++ b/rust/kernel/list/arc_field.rs
@@ -66,6 +66,7 @@ pub unsafe fn assert_mut(&self) -> &mut T {
 
 /// Defines getters for a [`ListArcField`].
 #[macro_export]
+#[doc(hidden)]
 macro_rules! define_list_arc_field_getter {
     ($pub:vis fn $name:ident(&self $(<$id:tt>)?) -> &$typ:ty { $field:ident }
      $($rest:tt)*
diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
index ee53d0387e63..5a3eac9f3cf0 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -29,6 +29,7 @@ pub unsafe trait HasListLinks<const ID: u64 = 0> {
 
 /// Implements the [`HasListLinks`] trait for the given type.
 #[macro_export]
+#[doc(hidden)]
 macro_rules! impl_has_list_links {
     ($(impl$({$($generics:tt)*})?
        HasListLinks$(<$id:tt>)?
@@ -74,6 +75,7 @@ pub unsafe trait HasSelfPtr<T: ?Sized, const ID: u64 = 0>
 
 /// Implements the [`HasListLinks`] and [`HasSelfPtr`] traits for the given type.
 #[macro_export]
+#[doc(hidden)]
 macro_rules! impl_has_list_links_self_ptr {
     ($(impl$({$($generics:tt)*})?
        HasSelfPtr<$item_type:ty $(, $id:tt)?>
@@ -181,6 +183,7 @@ unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$
 /// }
 /// ```
 #[macro_export]
+#[doc(hidden)]
 macro_rules! impl_list_item {
     (
         $(impl$({$($generics:tt)*})? ListItem<$num:tt> for $self:ty {

-- 
2.51.2

