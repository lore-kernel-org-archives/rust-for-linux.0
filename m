Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981533321AB
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764603128; cv=pass; b=ULpP628PEpOCXICwqZ+e3glhkp4V/69ymhRr9Jou/hjtFnpc2dPKR0xha+HisiJ/XH/CsSu4OrEyo6ARQZJRFsQ+SZbAMdRh+ZBSjGWbLQAb+mkaWW719bn/GEclsc1Rcm92AX4eB7slBb7KJmxY0XY37liagCcYwo4nEpfDrTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764603128; c=relaxed/simple;
	bh=DEXfUlkwf9/dY3M6LU/JNWo1A5toSf2N2cnfe6rqxlY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XVa3UCEDNxIr1bxQm/adL/uLe4impTHir/HQyyM0AuaVapob/J2IrBhdDVXm0bBP7lsX8IxkuBrK0aLD2ux6x7w2k3i5M7sxA6JYf6XnjkH9YrEIJ8UIJ10ei3y5WpJFd6Gakei5InrTjAZTlqgKm8yh/hlgcjjJ94gW5gslxTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=UIBVZiu9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UIBVZiu9"
ARC-Seal: i=1; a=rsa-sha256; t=1764603084; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xuy+zrayxriwhuYfV/lVGssZKZ+Bjy7aYphus6QJ/hBrv939HE61Ad745hTjCtzVc5kx4WT9ABt8vM9ekMcBIK1zJVpxgEclYdCLoePwiPQkm7wAqnSofQWudJdg+L61dnNzPqFj3xr47S0vxMksduM+fAitX1b3WenFPZw6t0s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764603084; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3HbneU3qyka+xS+SgyzTpdhrl3NagdrNaKT2I4JJmeg=; 
	b=fyY2x3hqyXc+eLlSejazJ4GEzzUSn6ZRpeCrTY+/AV5qDOock5KTgQPt1pO+EO/kp6u3hlxOfhcpFFr4P8Re6Hph16nZ76FlL9qrPqrQFsCczyLdD+HLk54xxsqzlY6M1FIluDxHRVhm1CsmT9mSzi4p90M5G/4zTps8cxQvJCU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764603084;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=3HbneU3qyka+xS+SgyzTpdhrl3NagdrNaKT2I4JJmeg=;
	b=UIBVZiu9rxK3BZWr6HrP6U+QllaOJuwYNqVOggn6MYMG2I0i7qRSylEGzDSG78Zx
	V3gwwUKPTl/1t5Qf+3RA9xmbBnhWIml8CbpDyEZJFttuv1yfxEKxxydFy33Paw7hYzu
	bc0tDMOa5uirnHDAkatQcM+721cH5zFiiJfPZczs=
Received: by mx.zohomail.com with SMTPS id 1764603079634801.5377747252071;
	Mon, 1 Dec 2025 07:31:19 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2] rust: drm: use `pin_init::zeroed()` for file
 operations initialization
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201152759.16429-1-atharvd440@gmail.com>
Date: Mon, 1 Dec 2025 12:31:04 -0300
Cc: Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Lyude Paul <lyude@redhat.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6DE296DC-45BA-4915-8FB7-78A6A7339A66@collabora.com>
References: <20251201152759.16429-1-atharvd440@gmail.com>
To: Atharv Dubey <atharvd440@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Atharv,

> On 1 Dec 2025, at 12:27, Atharv Dubey <atharvd440@gmail.com> wrote:
>=20
> Replace the manual `unsafe { core::mem::zeroed() }` initialization of
> `bindings::file_operations` with `pin_init::zeroed()`. This removes =
the
> explicit unsafe
>=20
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
> rust/kernel/drm/gem/mod.rs | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 30c853988b94..f9fd98dc102b 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -298,9 +298,7 @@ impl<T: DriverObject> AllocImpl for Object<T> {
> }
>=20
> pub(super) const fn create_fops() -> bindings::file_operations {
> -    // SAFETY: As by the type invariant, it is safe to initialize =
`bindings::file_operations`
> -    // zeroed.
> -    let mut fops: bindings::file_operations =3D unsafe { =
core::mem::zeroed() };
> +    let mut fops: bindings::file_operations =3D pin_init::zeroed();
>=20
>     fops.owner =3D core::ptr::null_mut();
>     fops.open =3D Some(bindings::drm_open);
> --=20
> 2.43.0
>=20
>=20

I wonder if this should be part of a larger series that implements this =
change
throughout the tree?

=E2=80=94 Daniel=
