Received: from sender4-pp-g126.zoho.com (sender4-pp-g126.zoho.com [136.143.188.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E34A42E009;
	Fri,  6 Feb 2026 18:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770402261; cv=pass; b=mfEZ1YO+E8oJbcHijqThLO6Bcf+/8WQodpvUqbKzEKkCL+CdgW38s37skCeMtapWR3AQgE0A/dWTH/6VFRq9L/XQQEvfxXDW+0WJ0L9DIGpsFh+JhguXPdxIz9u4nvJysoYnvdNIz0Kfd7/v7POpfcvS330unIyFjnotzHoC6iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770402261; c=relaxed/simple;
	bh=cVnxLDVSIrqWE/RDk5b9AvR3F1J0RCGch0DgB910JoM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WhVICdKFlCV0gpUYNF6dMSyTkW1KWirBFdnvZRlqQcIhgM3medVTySWBpYJmtG7HkuBJ03VcF6vxBWwgrm5TGUECPrUc2VfUtZv7dclj8a539nYSQTv97PxOCxU0bOKkZH2eAZQvUUppXs7sZQ6TRS3EeDGwQ/xuPn3WLAPfct4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Rg8IWbZw; arc=pass smtp.client-ip=136.143.188.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Rg8IWbZw"
ARC-Seal: i=1; a=rsa-sha256; t=1770402243; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZuG0ddiwKocWlgkL40CTwqqM4IpiYaFzG52X4Y3B735lmWHM9wpdRq4HFiDc0QlNTO59VFqW0pz3VjVZEGR5V76it5C4g4vWKd3aO4nMDrdmgVQwU47MBnuEkAtlrG9ngazcLbm/X+JYw8d8ESjmTMS+3DLF8GQWTtL0UkScG38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770402243; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k3fcBrmtYEvld9O2FWrlRHXmj7F/Z1N6xAmhp7BkF2U=; 
	b=jy297TkL8bK1llscFw+MHPtssMJL00d8ugxFDRMN4AG6ZC8aliH3PoFuQrEB1qNiFDvygSv9ZGufHNwP5Bp9MZNvCaBrIpQx6dogJZFi9URlo1FoDv8Z02gjvIs/ZnJpC1XGF3l1bWc1loYQuerTfBNuMb+aZMMoPNa2Ks2FcGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770402243;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=k3fcBrmtYEvld9O2FWrlRHXmj7F/Z1N6xAmhp7BkF2U=;
	b=Rg8IWbZw5Teab+23YkIQhCgdAqm1PUz+40oizSjFnyx5zPLXQl/6V228j3T9MJlJ
	6el4ZJpANZBSv6U2PjewtuPRx7SG9diaCJjGDWJbup2xKutQ3sKlds2yM4UhZwf5O/V
	AeFTYf8VuHsyuTi4o+ads1YJ/TriH4ddgN3afkTo=
Received: by mx.zohomail.com with SMTPS id 1770402241983608.7492885305168;
	Fri, 6 Feb 2026 10:24:01 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 2/7] rust: num: add `shr` and `shl` methods to
 `Bounded`
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260129-register-v5-2-c4587c902514@nvidia.com>
Date: Fri, 6 Feb 2026 15:23:44 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Yury Norov <yury.norov@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>,
 Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D87FBE7D-C320-426A-96E2-DB23975CF895@collabora.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
 <20260129-register-v5-2-c4587c902514@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 29 Jan 2026, at 10:32, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Shifting a `Bounded` left or right changes the number of bits required
> to represent the value. Add methods that perform the shift and return =
a
> `Bounded` with the appropriately adjusted bit width.
>=20
> These methods are particularly useful for bitfield extraction.
>=20
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> rust/kernel/num/bounded.rs | 42 =
++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 42 insertions(+)
>=20
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index f870080af8ac..4b929762d5c2 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -470,6 +470,48 @@ pub fn cast<U>(self) -> Bounded<U, N>
>         // `N` bits, and with the same signedness.
>         Bounded::__new(value)
>     }
> +
> +    /// Right-shifts `self` by `SHIFT` and returns the result as a =
`Bounded<_, RES>`, where `RES >=3D
> +    /// N - SHIFT`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v =3D Bounded::<u32, 16>::new::<0xff00>();
> +    /// let v_shifted: Bounded::<u32, 8> =3D v.shr::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff);
> +    /// ```
> +    pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, =
RES> {
> +        const { assert!(RES >=3D N - SHIFT) }
> +
> +        // SAFETY: We shift the value right by `SHIFT`, reducing the =
number of bits needed to
> +        // represent the shifted value by as much, and just asserted =
that `RES =3D=3D N - SHIFT`.
> +        unsafe { Bounded::__new(self.0 >> SHIFT) }
> +    }
> +
> +    /// Left-shifts `self` by `SHIFT` and returns the result as a =
`Bounded<_, RES>`, where `RES >=3D
> +    /// N + SHIFT`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// let v =3D Bounded::<u32, 8>::new::<0xff>();
> +    /// let v_shifted: Bounded::<u32, 16> =3D v.shl::<8, _>();
> +    ///
> +    /// assert_eq!(v_shifted.get(), 0xff00);
> +    /// ```
> +    pub fn shl<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, =
RES> {
> +        const { assert!(RES >=3D N + SHIFT) }
> +
> +        // SAFETY: We shift the value left by `SHIFT`, augmenting the =
number of bits needed to
> +        // represent the shifted value by as much, and just asserted =
that `RES =3D=3D N + SHIFT`.
> +        unsafe { Bounded::__new(self.0 << SHIFT) }
> +    }
> }
>=20
> impl<T, const N: u32> Deref for Bounded<T, N>
>=20
> --=20
> 2.52.0
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

