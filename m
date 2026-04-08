Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22C72D7DF8
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 22:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686744; cv=none; b=kuEL7U3JO91o6AzK02gO2JEg2KlF17z2G+H9R8n+vbJN+3GI6z/Y3Q+eyR8mAhUuwG8GP2HM6JBWerlMCWJtjLBjW2qETj/iwIBUDVxaPmckFZW/rWtiMfZ0sBHuchs2dbZHFaPPVPcms4uqI7NxgVbhw27HJxoLd0UD9ws1r78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686744; c=relaxed/simple;
	bh=/Ldxp9a+e/n/zmbjEgNhRZ0eU3434tIYx5OYhMM6uMY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BYFCZjyKTBN4D1MxrvbQMxLhHQsouibsB8qNK4+FRtNGN+WdJI61UsNi+2ehIfS1ixkdh3PKXNkJ0rLr1Rm0jTqc3yUV93yaRGID3gQYo9KiCcxsEJ1rEIrkxFMA8OontXYkBAyz1E33k3wmMe9l0PVdPFihZtgxjgw5t9S7iL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=DcMGghWt; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="DcMGghWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1775686739; x=1775945939;
	bh=2NsMNcTpS2SCRYlS91atjFoOfFqtQ89WufsfKvZo/EY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DcMGghWtpx4Qh0Jd7i9sFtJvs7GslOZBDpnNSdDkOmRBi8SZ1Yvzv8IMTka3srXsu
	 J36s+Z9gjxuUyF0yKqQ7DUt7xv16ajywlJ2X/hFhagxyG+VeKCgIzA/5bJwpqfDVqH
	 9cqHChpZ7OqYdgT0z4CAT5kIZjJ6Aw2NoWux+tUrDVRxc7K0txM/mGRg86a6uXJC9B
	 JtEDGv2T3g4VOTXDtFA394PIScbk+GX2OnXCPxTc8lUgKYcLHFIhSaiqrumO2Vu88q
	 FXN2o7a+ckcxwoyXfKBacWb2rKUWc+2DlaBxUpWYFiwzEh8WyquAdZFbPmVKW2dWWc
	 PrqOANPmBNPpw==
Date: Wed, 08 Apr 2026 22:18:52 +0000
To: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
From: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: ojeda@kernel.org, aliceryhl@google.com, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Subject: [PATCH v2] rust: list: fix SAFETY comments in impl_list_item_mod
Message-ID: <20260408221841.449995-1-t1bur0n.kernel.org@protonmail.ch>
Feedback-ID: 190658113:user:proton
X-Pm-Message-ID: af84267247abe04831d18629028d035a6db893bc
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Three SAFETY comments were left as TODO in impl_list_item_mod.rs.
Fill them in:

- impl_has_list_links_self_ptr!: the HasListLinks impl is safe because
  raw_get_list_links only compiles if the field has type ListLinksSelfPtr,
  which the type system enforces statically.

- prepare_to_insert: the container_of! call is safe because links_field
  is valid from view_links and Self: HasSelfPtr guarantees links_field
  points to the inner field of a ListLinksSelfPtr.

- view_value: the container_of! call is safe because the caller of
  prepare_to_insert promised to retain the ListArc, and Self: HasSelfPtr
  guarantees links_field points to the inner field of a ListLinksSelfPtr.

v2: Fix incorrect SAFETY comment per Alice Ryhl's review
  - The cast is valid because ListLinksSelfPtr is repr(C) and ListLinks
    is its first field, not because they share the same memory layout.

Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
---
 rust/kernel/list/impl_list_item_mod.rs | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl=
_list_item_mod.rs
index 5a3eac9f3cf0..48d4da349b56 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -86,7 +86,12 @@ macro_rules! impl_has_list_links_self_ptr {
         // right type.
         unsafe impl$(<$($generics)*>)? $crate::list::HasSelfPtr<$item_type=
 $(, $id)?> for $self {}
=20
-        // SAFETY: TODO.
+        // SAFETY: The implementation of `raw_get_list_links` returns a po=
inter to the
+        // `ListLinks` field inside `ListLinksSelfPtr`. This cast is valid=
 because
+        // `ListLinksSelfPtr` is `repr(C)` and its first field is `ListLin=
ks`, so the
+        // pointer to `ListLinksSelfPtr` can be cast to a pointer to its f=
irst field.
+        // The macro only compiles if the field has type `ListLinksSelfPtr=
`, which
+        // the type system enforces statically.
         unsafe impl$(<$($generics)*>)? $crate::list::HasListLinks$(<$id>)?=
 for $self {
             #[inline]
             unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::l=
ist::ListLinks$(<$id>)? {
@@ -274,7 +279,10 @@ unsafe fn prepare_to_insert(me: *const Self) -> *mut $=
crate::list::ListLinks<$nu
                 // SAFETY: The caller promises that `me` points at a valid=
 value of type `Self`.
                 let links_field =3D unsafe { <Self as $crate::list::ListIt=
em<$num>>::view_links(me) };
=20
-                // SAFETY: TODO.
+                // SAFETY: `links_field` is valid because `view_links` ret=
urned it from a valid
+                // `me` pointer as promised by the caller. `links_field` p=
oints to the `inner`
+                // field of a `ListLinksSelfPtr` because `Self: HasSelfPtr=
` guarantees that the
+                // `ListLinks` field is always inside a `ListLinksSelfPtr`=
.
                 let container =3D unsafe {
                     $crate::container_of!(
                         links_field, $crate::list::ListLinksSelfPtr<Self, =
$num>, inner
@@ -326,7 +334,11 @@ unsafe fn view_links(me: *const Self) -> *mut $crate::=
list::ListLinks<$num> {
             //   `ListArc` containing `Self` until the next call to `post_=
remove`. The value cannot
             //   be destroyed while a `ListArc` reference exists.
             unsafe fn view_value(links_field: *mut $crate::list::ListLinks=
<$num>) -> *const Self {
-                // SAFETY: TODO.
+                // SAFETY: `links_field` is valid and points to a live val=
ue because the caller
+                // of `prepare_to_insert` promised to retain ownership of =
the `ListArc`, and the
+                // value cannot be destroyed while a `ListArc` exists. `li=
nks_field` points to
+                // the `inner` field of a `ListLinksSelfPtr` because `Self=
: HasSelfPtr`
+                // guarantees this.
                 let container =3D unsafe {
                     $crate::container_of!(
                         links_field, $crate::list::ListLinksSelfPtr<Self, =
$num>, inner
--=20
2.53.0


