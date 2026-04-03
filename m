Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4153282F34
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775254113; cv=none; b=epKD71/rAClAVSly2D2SqUE/G+DMi95mG6mWO+NzzZPl+zJegpjwP9ZfT7yR+HcCnpwSDtDnsRuKymeLdqxFPZdfhZbr4wr2djHYFZXiI1wpBVrefbcaJqQnklT7+eLeht8Ej0Z6S5MgWAL9afxHcfyfb0T4JI5Q78XKXGnyAds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775254113; c=relaxed/simple;
	bh=koV33q08y0bDIIhnFTEwVNjYGR1s9p8pD70TH0MWT34=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p43eoBgkc/42DwNaIx01WqNXkZ/IjsY6Oyj/k7YRWQ7O6D8ISD7n3kibA7u5eWIjjCWAiMgyXq9hyRu2EcPzjypXgQNOPLaCnK1ik0VwIuHSH6ZlaK2IqUMiJU8EGLMr+FFBgy8NNGc8gBNLFDp1iA+IL3F7O6aYPARBUynEbHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=RUEc5PVF; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="RUEc5PVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1775254109; x=1775513309;
	bh=yKSMS8ZOCb73k9f/De6CUYqojN0KxTphEqb91Hm/sk4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RUEc5PVF6hMJGzH9Tbd8rdRbsefV1joNwHjLskTqQka40+adhHm+O960C7VD9GWcw
	 qOGDvQSpLAWCrXnRt7W6Xa06aNqXatQQRpaslGgUobaGPefCVjG27mNT+3eDTcH+33
	 dGsDvYHk0ek8pXlIxvyZSvbOsBJ7QE9PmkZfIROj9CV+Y7wihT669f4FS+eT9L5ExW
	 BUBtRhIMkWqYmWREoKfFBxBEavool0L/EWMVzYWbRX2/PJdibXyFLnCD+YyvymjwQe
	 bI/wJsCtDoPR0ih5apDHsjNtsbR3D7C1tkHLcu9eMpOIphqEpJFcCNKxZZxs4Savvn
	 5oqvyx4XPJV8A==
Date: Fri, 03 Apr 2026 22:08:24 +0000
To: ojeda@kernel.org
From: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, aliceryhl@google.com, lossin@kernel.org, Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Subject: [PATCH 2/2] rust: list: fix SAFETY comments in impl_list_item_mod
Message-ID: <20260403220751.15374-3-t1bur0n.kernel.org@protonmail.ch>
In-Reply-To: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
Feedback-ID: 190658113:user:proton
X-Pm-Message-ID: 8e8c77dfe149e1efcdda56d85d4c270d9b2ace72
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

Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
---
 rust/kernel/list/impl_list_item_mod.rs | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl=
_list_item_mod.rs
index 5a3eac9f3..2d1f4723a 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -86,7 +86,11 @@ macro_rules! impl_has_list_links_self_ptr {
         // right type.
         unsafe impl$(<$($generics)*>)? $crate::list::HasSelfPtr<$item_type=
 $(, $id)?> for $self {}
=20
-        // SAFETY: TODO.
+        // SAFETY: The implementation of `raw_get_list_links` returns a po=
inter to the
+        // `ListLinks` field inside `ListLinksSelfPtr`. This cast is valid=
 because
+        // `ListLinksSelfPtr` is a wrapper around `ListLinks` and shares t=
he same memory
+        // layout. The macro only compiles if the field has type `ListLink=
sSelfPtr`, which
+        // the type system enforces statically.
         unsafe impl$(<$($generics)*>)? $crate::list::HasListLinks$(<$id>)?=
 for $self {
             #[inline]
             unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::l=
ist::ListLinks$(<$id>)? {
@@ -274,7 +278,10 @@ unsafe fn prepare_to_insert(me: *const Self) -> *mut $=
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
@@ -326,7 +333,11 @@ unsafe fn view_links(me: *const Self) -> *mut $crate::=
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


