Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E612D7DC4
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759154177; cv=none; b=W7y/0+loNzP9Ykes4MKWMUVQNTCislEeJtiYUjH0/HNLMbeUaCWiPmv+KTwBGxlYL3ni7cYHARIupwm9igfBreySrAarmNJ9Z0J3Rg1Uu8VKm4sHXsNSd5HFQnWEmq1Aj2fL2Swpq2pWOdiaSAKhGi5ecWI0bwiODpA2HbxZI7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759154177; c=relaxed/simple;
	bh=10DmDsmKy3bt68ioVWFr2s4Www/UQo6J4qGmBqhpuA0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ekwFQbuArUac8oIhWjB15HTDI4hxmecaZ2xNFpOxqNOdsccptMQxAyjtQd/+E0sBLnQCrvEDEYQ/gfUG5kDqVQoZI/J9m2Ww4XwZ8jHjC29c+3pL4jYYhCQlrWWH4vTF3wVKyDlkvB7yWq55Cy0YbR8xbnm+KJw9msBhwlDopic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Pz6m1urP; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Pz6m1urP"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E9EE3240104
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 15:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1759154172; bh=QO8VXI1aOBTRG72HYuPkYXgG39QcVbV6YDQAMXMpy1k=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:OpenPGP:From;
	b=Pz6m1urP2Szo0m/6lEVTWJGnlgfzenn4pK1kIi0+rDi7xIPFtvQgE7mx/SBRfKP5J
	 PidOtQR38ZPbCc5dhHjmFj8TJJdkZGaZAV0c/L546l0VElmxEJMa727OMmWLWfLFo2
	 VQx4x+XeOldj1/QpNd6NfjtxR5ISzAljHwnjOY5n1qBX9p4FVIuGR60iWi5fXa/zUe
	 lL4VR03IjbEmw4tzGAxKmCi8shkO4Ji4QEWHmgIYg0NUo4qTjqTtHItUBLkYOp8Iie
	 Ivx9oJFjRFl1/Zft+/YXv9cFzbKlyXl2iSCmsPEGHvMrsppdyFDNizdWcYJ2wwAK/S
	 OWVi5IwkNLzmw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4cb2lt59T6z6tw8;
	Mon, 29 Sep 2025 15:56:10 +0200 (CEST)
Message-ID: <1c6b4744ef37e3d3091c3f41e9505b091a266c2d.camel@posteo.de>
Subject: Re: [PATCH] rust: of: Add basic DeviceNode abstractions
From: Markus Probst <markus.probst@posteo.de>
To: devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Miguel Ojeda
	 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Date: Mon, 29 Sep 2025 13:56:12 +0000
In-Reply-To: <cffbb9a12082751ea8a7e2f38b7d203d34ce6765.camel@posteo.de>
References: <cffbb9a12082751ea8a7e2f38b7d203d34ce6765.camel@posteo.de>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 R3rOFHA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt

I justed noticed a bug in the code, in which the `DeviceNodeIterator`
skipped the first child in the device node. Weirdly this bug hasn't
been spotted in testing, but it seems it should have been avoidable, so
I apologize. I will submit a second version of this patch.

On Mon, 2025-09-29 at 13:29 +0000, Markus Probst wrote:
> Add a safe wrapper arround `struct device_node`, which is capable of:
>=20
> * reading string, u32 and bool properties
>=20
> * iterating over children
>=20
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
> =C2=A0rust/bindings/bindings_helper.h |=C2=A0=C2=A0 1 +
> =C2=A0rust/helpers/of.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +++
> =C2=A0rust/kernel/of.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 150
> ++++++++++++++++++++++++++++++++
> =C2=A03 files changed, 161 insertions(+)
>=20
> diff --git a/rust/bindings/bindings_helper.h
> b/rust/bindings/bindings_helper.h
> index 81796d5e16e8..e670b8e42787 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -59,6 +59,7 @@
> =C2=A0#include <linux/jump_label.h>
> =C2=A0#include <linux/mdio.h>
> =C2=A0#include <linux/miscdevice.h>
> +#include <linux/of.h>
> =C2=A0#include <linux/of_device.h>
> =C2=A0#include <linux/pci.h>
> =C2=A0#include <linux/phy.h>
> diff --git a/rust/helpers/of.c b/rust/helpers/of.c
> index 86b51167c913..293cc43452aa 100644
> --- a/rust/helpers/of.c
> +++ b/rust/helpers/of.c
> @@ -6,3 +6,13 @@ bool rust_helper_is_of_node(const struct
> fwnode_handle
> *fwnode)
> =C2=A0{
> =C2=A0	return is_of_node(fwnode);
> =C2=A0}
> +
> +struct device_node *rust_helper_of_node_get(struct device_node
> *node)
> +{
> +	return of_node_get(node);
> +}
> +
> +void rust_helper_of_node_put(struct device_node *node)
> +{
> +	of_node_put(node);
> +}
> diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
> index b76b35265df2..61a470d9ecd7 100644
> --- a/rust/kernel/of.rs
> +++ b/rust/kernel/of.rs
> @@ -1,12 +1,16 @@
> =C2=A0// SPDX-License-Identifier: GPL-2.0
>=20
> =C2=A0//! Device Tree / Open Firmware abstractions.
> +//!
> +//! C header: [`include/linux/of.h`](srctree/include/linux/of.h)
>=20
> =C2=A0use crate::{
> =C2=A0=C2=A0=C2=A0=C2=A0 bindings,
> =C2=A0=C2=A0=C2=A0=C2=A0 device_id::{RawDeviceId, RawDeviceIdIndex},
> =C2=A0=C2=A0=C2=A0=C2=A0 prelude::*,
> +=C2=A0=C2=A0=C2=A0 types::{ARef, Opaque},
> =C2=A0};
> +use core::ptr::NonNull;
>=20
> =C2=A0/// IdTable type for OF drivers.
> =C2=A0pub type IdTable<T> =3D &'static dyn
> kernel::device_id::IdTable<DeviceId, T>;
> @@ -16,6 +20,20 @@
> =C2=A0#[derive(Clone, Copy)]
> =C2=A0pub struct DeviceId(bindings::of_device_id);
>=20
> +/// The device node representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct
> device_node`. The implementation
> +/// abstracts the usage of an already existing C `struct
> device_node`
> within Rust code that we get
> +/// passed from the C side.
> +///
> +/// # Invariants
> +///
> +/// A [`DeviceNode`] instance represents a valid `struct
> device_node`
> created by the C portion of the kernel.
> +#[repr(transparent)]
> +pub struct DeviceNode(Opaque<bindings::device_node>);
> +
> +struct DeviceNodeIterator<'a>(&'a DeviceNode,
> Option<NonNull<bindings::device_node>>);
> +
> =C2=A0// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `struc=
t
> of_device_id` and
> =C2=A0// does not add additional invariants, so it's safe to transmute to
> `RawType`.
> =C2=A0unsafe impl RawDeviceId for DeviceId {
> @@ -63,3 +81,135 @@ macro_rules! of_device_table {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $crate::module_device_ta=
ble!("of", $module_table_name,
> $table_name);
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0}
> +
> +impl DeviceNode {
> +=C2=A0=C2=A0=C2=A0 const fn as_raw(&self) -> *mut bindings::device_node =
{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.0.get()
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Returns the device tree populated by the bootload=
er.
> +=C2=A0=C2=A0=C2=A0 pub fn root() -> Option<&'static DeviceNode> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `of_root` is guara=
nteed to be a pointer to a
> valid
> `struct device_node` or a null-pointer.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NonNull::new(unsafe { binding=
s::of_root })
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // CA=
ST: `DeviceNode` is a transparent wrapper of
> `Opaque<bindings::device_node>`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: `ptr` is guaranteed to be a pointer to a
> valid
> `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .map(=
|ptr| unsafe { ptr.cast().as_ref() })
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Returns an iterator over the children of this dev=
ice node.
> +=C2=A0=C2=A0=C2=A0 pub fn children(&self) -> impl Iterator<Item =3D ARef=
<DeviceNode>>
> +
> use<'_> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw` is g=
uaranteed to be a pointer to a
> valid `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let initial =3D unsafe {
> bindings::of_get_next_child(self.as_raw(), core::ptr::null_mut()) };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceNodeIterator(self, NonN=
ull::new(initial.cast()))
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Returns the name of the device node.
> +=C2=A0=C2=A0=C2=A0 pub fn name(&self) -> Option<&CStr> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw` is g=
uaranteed to be a pointer to a
> valid `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let name =3D unsafe { (*self.=
as_raw()).name };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if name.is_null() {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 None
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: `name` is valid by the safety requirements.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some(=
unsafe { CStr::from_char_ptr(name) })
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Returns the full name (name including the full_na=
me of the
> parent) of the device node.
> +=C2=A0=C2=A0=C2=A0 pub fn full_name(&self) -> Option<&CStr> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw` is g=
uaranteed to be a pointer to a
> valid `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let full_name =3D unsafe { (*=
self.as_raw()).full_name };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if full_name.is_null() {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 None
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: `full_name` is valid by the safety
> requirements.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some(=
unsafe { CStr::from_char_ptr(full_name) })
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Find and read a u32 from a multi-value property.
> +=C2=A0=C2=A0=C2=A0 pub fn property_read_u32_index(&self, propname: &CStr=
, index:
> u32)
> -> Result<u32> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut value =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw` is g=
uaranteed to be a pointer to a
> valid `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ret =3D unsafe {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindi=
ngs::of_property_read_u32_index(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 self.as_raw(),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 propname.as_char_ptr(),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 index,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 &mut value,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ret !=3D 0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n Err(Error::from_errno(ret));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(value)
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Find and read a string from a property.
> +=C2=A0=C2=A0=C2=A0 pub fn property_read_string(&self, propname: &CStr) -=
>
> Result<&CStr> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut value =3D core::ptr::=
null();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw` is g=
uaranteed to be a pointer to a
> valid `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ret =3D unsafe {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindi=
ngs::of_property_read_string(self.as_raw(),
> propname.as_char_ptr(), &mut value)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ret !=3D 0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retur=
n Err(Error::from_errno(ret));
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `value` is guarant=
eed to be a valid C string
> pointer.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(unsafe { CStr::from_char_p=
tr(value) })
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Find a property.
> +=C2=A0=C2=A0=C2=A0 ///
> +=C2=A0=C2=A0=C2=A0 /// Returns true if the property exists false otherwi=
se.
> +=C2=A0=C2=A0=C2=A0 pub fn property_read_bool(&self, propname: &CStr) -> =
bool {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw` is g=
uaranteed to be a pointer to a
> valid `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::of_propert=
y_read_bool(self.as_raw(),
> propname.as_char_ptr()) }
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 /// Find the child node by name for this device node.
> +=C2=A0=C2=A0=C2=A0 pub fn child_by_name(&self, name: &CStr) ->
> Option<ARef<DeviceNode>> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw` is g=
uaranteed to be a pointer to a
> valid `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let node =3D unsafe {
> bindings::of_get_child_by_name(self.as_raw(), name.as_char_ptr()) };
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `node` is guarante=
ed to be a pointer to a valid
> `struct device_node` or a null-pointer.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some(unsafe { ARef::from_raw(=
NonNull::new(node)?.cast()) })
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +// SAFETY: A `DeviceNode` is always reference-counted and can be
> released from any thread.
> +unsafe impl Send for DeviceNode {}
> +
> +// SAFETY: `DeviceNode` can be shared among threads because all
> methods of `DeviceNode` are thread safe.
> +unsafe impl Sync for DeviceNode {}
> +
> +// SAFETY: Instances of `DeviceNode` are always reference-counted.
> +unsafe impl kernel::types::AlwaysRefCounted for DeviceNode {
> +=C2=A0=C2=A0=C2=A0 fn inc_ref(&self) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The existence of a=
 shared reference guarantees
> that
> the refcount is non-zero.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::of_node_ge=
t(self.as_raw()) };
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 unsafe fn dec_ref(obj: NonNull<Self>) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The safety require=
ments guarantee that the
> refcount
> is non-zero.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::of_node_pu=
t(obj.cast().as_ptr()) }
> +=C2=A0=C2=A0=C2=A0 }
> +}
> +
> +impl<'a> Iterator for DeviceNodeIterator<'a> {
> +=C2=A0=C2=A0=C2=A0 type Item =3D ARef<DeviceNode>;
> +
> +=C2=A0=C2=A0=C2=A0 fn next(&mut self) -> Option<Self::Item> {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let prev =3D self.1.take()?;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `self.0.as_raw` is guara=
nteed to be a pointer to a
> valid
> `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `prev` is guaranteed to =
be a pointer to a valid `struct
> device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.1 =3D
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NonNu=
ll::new(unsafe {
> bindings::of_get_next_child(self.0.as_raw(), prev.as_ptr()) });
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .as_r=
ef()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // CA=
ST: `DeviceNode` is a transparent wrapper of
> `Opaque<bindings::device_node>`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SA=
FETY: `ptr` is guaranteed to be a pointer to a
> valid
> `struct device_node`.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .map(=
|ptr| ARef::from(unsafe {
> ptr.cast::<DeviceNode>().as_ref() }))
> +=C2=A0=C2=A0=C2=A0 }
> +}
> --
> 2.49.1
