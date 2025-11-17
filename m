Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F007423FC41;
	Mon, 17 Nov 2025 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368246; cv=none; b=I8tJr2QdMlakTduk0Ha1+zkLtvcewcXz/ydX3tRhj329SHUgXjOpN3P0sL85FlXjy24mbUspZggcVihRbXtNuguTXQFToiDLiwpnOyrFxLM3zwjChzEmlP5SnOcRzpF/CUefrWESJYRtcdiGhuLOXE7ZjSAIpHh6S5/7CHbLZU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368246; c=relaxed/simple;
	bh=sxWMa/mDBPp4HoqCOyQoRiSDW95qyAs8NAKxdTuY/ZE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A03yt7DJKivJuB9AENBGMHUUTXhmTfiawbYkGppr1lBrlFnJXDYO8aWrpc7a0jVbKqNOkxw7X6x8SjBrzthCLGwsDp4lipjaP+Rl/DO/7Q06zJojw8AIuthXLSr7Yx4DJEQTCtTaOMCNX+3/0OsygrQ/lhxPY/ZdLUGDCthgLoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SV0HxCmV; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SV0HxCmV"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4d914V42FGz9t3b;
	Mon, 17 Nov 2025 09:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1763367866; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpfJKf0RfoIxB3LnP5nbqJDXEBSh/jyubeKddbAZHuk=;
	b=SV0HxCmVpp9B/aO7XZ23ah4l04Kczxnwn5EoKiCeZPAL//EX5VRVXqVlD1ELl6AOaw+BIC
	URAc0Y+g9pwQzYccqJPo6BabgkC3cqmhgD+r/LvsIpg1x9NHnD+t9aM2NGSeMDndtgUPHT
	ZYp5VGp15eIWEN5qOESkjHL1FSWsYodfGKK4bCU4GGjIiD0e36li6dALMybEG4/+f3JgMB
	8hhzuN+AFPIh64MilrpNI8ajkK03izPEMK4IFsxR+00fIA/YAS7r1+qxw1VfdRfr2Se7r/
	qCoQnkmBhxhQwSsFW4da6NVfcmXjFccKswt7Ff7mtywyKL1ZAWk2ZEuI9KaogA==
Message-ID: <2da1f1588ce8e02831e7bcda569f4e03ce88e4cf.camel@mailbox.org>
Subject: Re: [PATCH] rust: lib: Add necessary unsafes for container_of
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, Tamir
 Duberstein <tamird@gmail.com>,  rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 17 Nov 2025 09:24:19 +0100
In-Reply-To: <aRc5RVnXe4PGNkt0@google.com>
References: <20251114140020.327075-2-phasta@kernel.org>
	 <aRc5RVnXe4PGNkt0@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 55gwb3r6a5aufon7s76dgxp8uupbxhgk
X-MBO-RS-ID: d3b9c5c315a48db0e62

On Fri, 2025-11-14 at 14:14 +0000, Alice Ryhl wrote:
> On Fri, Nov 14, 2025 at 03:00:21PM +0100, Philipp Stanner wrote:
> > When trying to use LinkedList in the kernel crate, build fails with an
> > error message demanding unsafe blocks in the container_of macro:
> >=20

[=E2=80=A6]

> > =C2=A0rust/kernel/lib.rs | 7 +++++--
> > =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index fef97f2a5098..a26b87015e7d 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -249,8 +249,11 @@ macro_rules! container_of {
> > =C2=A0=C2=A0=C2=A0=C2=A0 ($field_ptr:expr, $Container:ty, $($fields:tt)=
*) =3D> {{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let offset: usize =3D =
::core::mem::offset_of!($Container, $($fields)*);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let field_ptr =3D $fie=
ld_ptr;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let container_ptr =3D field=
_ptr.byte_sub(offset).cast::<$Container>();
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $crate::assert_same_type(fi=
eld_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Offsetting the p=
ointer to the container is correct because the offset was
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // calculated validly above=
.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let container_ptr =3D unsaf=
e { field_ptr.byte_sub(offset).cast::<$Container>() };
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Safe because the=
 container_ptr was validly created above.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $crate::assert_same_type(fi=
eld_ptr, unsafe { (&raw const (*container_ptr).$($fields)*) }.cast_mut());
>=20
> The unsafe block goes in the impl_list_item! macro. This change makes
> container_of! a safe operation, but is should not be a safe operation
> because it uses byte_sub which promises the compiler that this pointer
> offset operation stays within a single allocation.


OK, so container_of is an unsafe function and all uses of it must be
guarded by an unsafe block.

If I do this, however

diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl=
_list_item_mod.rs
index 202bc6f97c13..2f05b73c9eed 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -217,7 +217,7 @@ unsafe fn view_value(me: *mut $crate::list::ListLinks<$=
num>) -> *const Self {
                 // SAFETY: `me` originates from the most recent call to `p=
repare_to_insert`, so it
                 // points at the field `$field` in a value of type `Self`.=
 Thus, reversing that
                 // operation is still in-bounds of the allocation.
-                $crate::container_of!(me, Self, $($field).*)
+                unsafe { $crate::container_of!(me, Self, $($field).*) }
             }
=20
             // GUARANTEES:
@@ -242,7 +242,7 @@ unsafe fn post_remove(me: *mut $crate::list::ListLinks<=
$num>) -> *const Self {
                 // SAFETY: `me` originates from the most recent call to `p=
repare_to_insert`, so it
                 // points at the field `$field` in a value of type `Self`.=
 Thus, reversing that
                 // operation is still in-bounds of the allocation.
-                $crate::container_of!(me, Self, $($field).*)
+                unsafe { $crate::container_of!(me, Self, $($field).*) }
             }
         }
     )*};


then the compiler gets sad again, complaining precisely about the
internals of container_of:



error[E0133]: call to unsafe function `core::ptr::mut_ptr::<impl *mut T>::b=
yte_sub` is unsafe and requires unsafe block
   --> rust/kernel/lib.rs:252:29
    |
252 |           let container_ptr =3D field_ptr.byte_sub(offset).cast::<$Co=
ntainer>();
    |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^ call to unsa=
fe function
    |
   ::: rust/kernel/drm/jq.rs:124:1
    |
124 | / impl_list_item! {
125 | |     impl ListItem<0> for EnqueuedJob<dyn JobData> { using ListLinks=
SelfPtr { self.links }; }
126 | | }
    | |_- in this macro invocation
    |
    =3D note: for more information, see <https://doc.rust-lang.org/nightly/=
edition-guide/rust-2024/unsafe-op-in-unsafe-fn.html>
    =3D note: consult the function's documentation for information on how t=
o avoid undefined behavior
note: an unsafe function restricts its caller, but its body is safe by defa=
ult
   --> rust/kernel/list/impl_list_item_mod.rs:269:13
    |
269 |               unsafe fn prepare_to_insert(me: *const Self) -> *mut $c=
rate::list::ListLinks<$num> {
    |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
   ::: rust/kernel/drm/jq.rs:124:1
    |
124 | / impl_list_item! {
125 | |     impl ListItem<0> for EnqueuedJob<dyn JobData> { using ListLinks=
SelfPtr { self.links }; }
126 | | }
    | |_- in this macro invocation
    =3D note: requested on the command line with `-D unsafe-op-in-unsafe-fn=
`
    =3D note: this error originates in the macro `$crate::container_of` whi=
ch comes from the expansion of the macro `impl_list_item` (in Nightly build=
s, run with -Z macro-backtrace for more info)

error[E0133]: dereference of raw pointer is unsafe and requires unsafe bloc=
k
   --> rust/kernel/lib.rs:254:57
    |
254 |           $crate::assert_same_type(field_ptr, (&raw const (*container=
_ptr).$($fields)*).cast_mut());
    |                                                           ^^^^^^^^^^^=
^^^^^ dereference of raw pointer
    |
   ::: rust/kernel/drm/jq.rs:124:1
    |
124 | / impl_list_item! {
125 | |     impl ListItem<0> for EnqueuedJob<dyn JobData> { using ListLinks=
SelfPtr { self.links }; }
126 | | }
    | |_- in this macro invocation
    |
    =3D note: for more information, see <https://doc.rust-lang.org/nightly/=
edition-guide/rust-2024/unsafe-op-in-unsafe-fn.html>
    =3D note: raw pointers may be null, dangling or unaligned; they can vio=
late aliasing rules and cause data races: all of these are undefined behavi=
or
    =3D note: this error originates in the macro `$crate::container_of` whi=
ch comes from the expansion of the macro `impl_list_item` (in Nightly build=
s, run with -Z macro-backtrace for more info)

error[E0133]: call to unsafe function `core::ptr::mut_ptr::<impl *mut T>::b=
yte_sub` is unsafe and requires unsafe block
   --> rust/kernel/lib.rs:252:29
    |
252 |           let container_ptr =3D field_ptr.byte_sub(offset).cast::<$Co=
ntainer>();
    |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^ call to unsa=
fe function
    |
   ::: rust/kernel/drm/jq.rs:124:1
    |
124 | / impl_list_item! {
125 | |     impl ListItem<0> for EnqueuedJob<dyn JobData> { using ListLinks=
SelfPtr { self.links }; }
126 | | }
    | |_- in this macro invocation
    |
    =3D note: for more information, see <https://doc.rust-lang.org/nightly/=
edition-guide/rust-2024/unsafe-op-in-unsafe-fn.html>
    =3D note: consult the function's documentation for information on how t=
o avoid undefined behavior
note: an unsafe function restricts its caller, but its body is safe by defa=
ult
   --> rust/kernel/list/impl_list_item_mod.rs:321:13
    |
321 |               unsafe fn view_value(links_field: *mut $crate::list::Li=
stLinks<$num>) -> *const Self {
    |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
   ::: rust/kernel/drm/jq.rs:124:1
    |
124 | / impl_list_item! {
125 | |     impl ListItem<0> for EnqueuedJob<dyn JobData> { using ListLinks=
SelfPtr { self.links }; }
126 | | }
    | |_- in this macro invocation
    =3D note: this error originates in the macro `$crate::container_of` whi=
ch comes from the expansion of the macro `impl_list_item` (in Nightly build=
s, run with -Z macro-backtrace for more info)

error[E0133]: dereference of raw pointer is unsafe and requires unsafe bloc=
k
   --> rust/kernel/lib.rs:254:57
    |
254 |           $crate::assert_same_type(field_ptr, (&raw const (*container=
_ptr).$($fields)*).cast_mut());
    |                                                           ^^^^^^^^^^^=
^^^^^ dereference of raw pointer
    |
   ::: rust/kernel/drm/jq.rs:124:1
    |
124 | / impl_list_item! {
125 | |     impl ListItem<0> for EnqueuedJob<dyn JobData> { using ListLinks=
SelfPtr { self.links }; }
126 | | }
    | |_- in this macro invocation
    |
    =3D note: for more information, see <https://doc.rust-lang.org/nightly/=
edition-guide/rust-2024/unsafe-op-in-unsafe-fn.html>
    =3D note: raw pointers may be null, dangling or unaligned; they can vio=
late aliasing rules and cause data races: all of these are undefined behavi=
or
    =3D note: this error originates in the macro `$crate::container_of` whi=
ch comes from the expansion of the macro `impl_list_item` (in Nightly build=
s, run with -Z macro-backtrace for more info)

