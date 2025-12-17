Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A17928369D;
	Wed, 17 Dec 2025 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765990343; cv=pass; b=d8vSKtv+FDPlrpQkDisF8aAnKZPZHDAf5C6V/FRcB3xvGrf6fVqAjUOfqCi0ImU9XFv/BTbflzRqM6ZWH8LZ8JhYU3vM/1WPpBOImr5LCsJBFVSA7LP/rbV7uTrjoYlTp8+sK7jsJl0hzawei83nNUME+/CTNhGJhbDfmhwhrwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765990343; c=relaxed/simple;
	bh=VJV63aui3L9dDiolW7iGJu2YZXQ1itdJYcmXk5XmNT4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ClyPQA6gs5te4GD1Kd175WLXmDQdjYhNrwZXUxWLMLti88Y0nogSlJuiE0QAoaTvF3kr6XT2ksNR6hcvSpbUH3vMvAMEZ8KKHRF0DuVgD/RTYzJCQOqG9ag7ebWsBVKO9dyHQfFEM8loZ8qPduwA0O3GvkIHl6yj8iK4YB+73VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=IwgPWsKO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="IwgPWsKO"
ARC-Seal: i=1; a=rsa-sha256; t=1765990324; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PJrsjeSn4S1pxAJCmGrXRs2PYBbq2YA6H48QbwVVH5/3ggf5VQnqHo6RAQeJ/piUVLUhzi9EHI/SiiNAICfy6rJlaQNiVMi153tqZdS+kLr8TgbxgJxsZ9sP9akdSdM3cq+E8Ufb5P0HA4iheZ1OflMrRKGcquSLKVSo0kp3/3s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765990324; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NOdz/WycWcmDJMMDJRkRhXw7fOxe4EIqWwJnvzI0uyw=; 
	b=CxhbwggxD7DfJsDQjuYb1tBYWKqcz8mwWkV8I+Q2EoNgz8uPl2rI0X1m3uaAo+XSd3gUv4F6zxvJCZLOHZUYWQnwDg7b/rz0v6NzCofUBQk/H1LhSDf+h5fZ+zXMTihmq/F1E079zppIxVrp+1f/s9cDrQ52dZD87gzM+aJr5LY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765990324;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=NOdz/WycWcmDJMMDJRkRhXw7fOxe4EIqWwJnvzI0uyw=;
	b=IwgPWsKOo6E+V9VyGJYkSIqmLYlGbPSk5dOz2Qch77MYrv3MsrOHicQcalKcc/vS
	aNZRXo0loZccwwFGOb58DhHGSb8PV/8N4isIyx1IBRgn9is2wVhWg2HKv8oVDYyMUv/
	/WxROJPkDfFgq0b4RziTiKgVzMdF7m0ERHJkprb4=
Received: by mx.zohomail.com with SMTPS id 176599032305820.76430976023471;
	Wed, 17 Dec 2025 08:52:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 1/3] rust: transmute: Support transmuting slices of
 AsBytes/FromBytes types
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251216-transmute-v2-1-b23e5277ad02@google.com>
Date: Wed, 17 Dec 2025 13:51:46 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0448F279-3759-423C-86B9-7A92137A28E7@collabora.com>
References: <20251216-transmute-v2-0-b23e5277ad02@google.com>
 <20251216-transmute-v2-1-b23e5277ad02@google.com>
To: Matthew Maurer <mmaurer@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Matthew,

> On 15 Dec 2025, at 21:44, Matthew Maurer <mmaurer@google.com> wrote:
>=20
> Currently, we support either transmuting a byte slice of the exact =
size
> of the target type or a single element from a prefix of a byte slice.
>=20
> This adds support for transmuting from a byte slice to a slice of
> elements, assuming appropriate traits are implemented.
>=20
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
> rust/kernel/transmute.rs | 72 =
++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 72 insertions(+)
>=20
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index =
be5dbf3829e25c92f85083cc0f4940f35bb7baec..5cc5f4fde4c31cea3c51ab078b4d68f3=
a0a2caa1 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -122,6 +122,78 @@ fn from_bytes_mut_prefix(bytes: &mut [u8]) -> =
Option<(&mut Self, &mut [u8])>
>         }
>     }
>=20
> +    /// Converts a slice of bytes to a slice of `Self`.
> +    ///
> +    /// Succeeds if the reference is properly aligned, and the size =
of `bytes` is a multiple of that
> +    /// of `Self`.
> +    ///
> +    /// Otherwise, returns [`None`].
> +    fn from_bytes_to_slice(bytes: &[u8]) -> Option<&[Self]>
> +    where
> +        Self: Sized,
> +    {
> +        let size =3D size_of::<Self>();
> +        if size =3D=3D 0 {
> +            return None;
> +        }
> +        if bytes.len() % size !=3D 0 {
> +            return None;
> +        }
> +        let len =3D bytes.len() / size;
> +        let ptr =3D bytes.as_ptr().cast::<Self>();
> +
> +        #[allow(clippy::incompatible_msrv)]
> +        if ptr.is_aligned() {
> +            // SAFETY:
> +            // - `ptr` is valid for reads of `bytes.len()` bytes, =
which is
> +            //   `len * size_of::<Self>()`.
> +            // - `ptr` is aligned for `Self`.
> +            // - `ptr` points to `len` consecutive properly =
initialized values of type `Self`
> +            //   because `Self` implements `FromBytes` (any bit =
pattern is valid).
> +            // - The lifetime of the returned slice is bound to the =
input `bytes`.
> +            unsafe { Some(core::slice::from_raw_parts(ptr, len)) }
> +        } else {
> +            None
> +        }

Nit: I=E2=80=99d rewrite this as=20

if !ptr.is_aligned() {
 return None;
}

unsafe { Some(core::slice::from_raw_parts(ptr, len)) }

This saves one indentation level.

> +    }
> +
> +    /// Converts a mutable slice of bytes to a mutable slice of =
`Self`.
> +    ///
> +    /// Succeeds if the reference is properly aligned, and the size =
of `bytes` is a multiple of that
> +    /// of `Self`.
> +    ///
> +    /// Otherwise, returns [`None`].
> +    fn from_bytes_to_mut_slice(bytes: &mut [u8]) -> Option<&mut =
[Self]>
> +    where
> +        Self: AsBytes + Sized,
> +    {
> +        let size =3D size_of::<Self>();
> +        if size =3D=3D 0 {
> +            return None;
> +        }
> +        if bytes.len() % size !=3D 0 {
> +            return None;
> +        }
> +        let len =3D bytes.len() / size;
> +        let ptr =3D bytes.as_mut_ptr().cast::<Self>();
> +
> +        #[allow(clippy::incompatible_msrv)]
> +        if ptr.is_aligned() {
> +            // SAFETY:
> +            // - `ptr` is valid for reads and writes of `bytes.len()` =
bytes, which is
> +            //   `len * size_of::<Self>()`.
> +            // - `ptr` is aligned for `Self`.
> +            // - `ptr` points to `len` consecutive properly =
initialized values of type `Self`
> +            //   because `Self` implements `FromBytes`.
> +            // - `AsBytes` guarantees that writing a new `Self` to =
the resulting slice can safely
> +            //   be reflected as bytes in the original slice.
> +            // - The lifetime of the returned slice is bound to the =
input `bytes`.
> +            unsafe { Some(core::slice::from_raw_parts_mut(ptr, len)) =
}
> +        } else {
> +            None
> +        }

Same here.

> +    }
> +
>     /// Creates an owned instance of `Self` by copying `bytes`.
>     ///
>     /// Unlike [`FromBytes::from_bytes`], which requires aligned =
input, this method can be used on
>=20
> --=20
> 2.52.0.305.g3fc767764a-goog
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

