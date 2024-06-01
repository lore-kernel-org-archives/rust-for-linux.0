Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1EE42A83
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 12:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717244602; cv=none; b=IL9+yJauXghQ/RqZ0sFq/SNPXQEFTj3M4Xb9KhZHk3nxB3vdCxGfGvUXvzIW6nJjCAKiYEmkr+AkDtOpb/HhuXPgnrEAC0oAIbsbeo6Dk7gi/73dgsMNJG8Yo6z7DL3I9oG/Hd4yiUbGDaChUiFx1Kw52vDNW6JOHNiRqDdF86w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717244602; c=relaxed/simple;
	bh=ghBgXPAVUSNvXNP5gXVHPbUAgePEO1wA447p6MLP5h8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BDj3zOPsZ83z3aBbpNzMawzXcXoSku7bFOyHRjD0yYxgEpkjK87HL591TPeypGktJePnWQ5WQkpm/FwwDdNARVSSlfXnowxOLlGt6YnIf5jdhCWpqv3Wee6GbEhgbzkvsiBgO5cfMfrormAWKGgb8hzOJp46uMlqPrT8v31kWA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FX4+HqdQ; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FX4+HqdQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1717244598; x=1717503798;
	bh=qfrbQsjLIbC12yb0K7Xzs1HOLxVkohDOsl4p0cUkM8w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FX4+HqdQJJB91/KmzksmKYJfyjnsBllSsJSsK0ej3ExKvWzojed9nPviXcD6ajZE8
	 Dj9QbxWcSjgjdxYoV92GQrEUJBOIejPAKuta6QCkRTOKizmAMyJSlrCSGjxzgN8yO6
	 n+P7se475yg53d2ccmSy1lfxue72BLVrCV0o94M8vW7KFVMEYz+kPXhp9+BsiiTzJ5
	 zlMfwGVexrQIJs35aKtfGgbWJX0Gwi767XyEUEuLDCfBY8qDvfA4dGGTfYZGUFB23G
	 xfmwmnA2w7ET0OJCnO3FN32+Z5gAwYIZE2+VnvawGJrpphIWFDAkhozufzFCBywkLT
	 8liUrf/pHFZuw==
Date: Sat, 01 Jun 2024 12:23:16 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 2/2] rust: net::phy support for C45 genphy helpers
Message-ID: <c67b9654-cc6c-41b0-9693-b8830ec42e78@proton.me>
In-Reply-To: <20240601043535.53545-3-fujita.tomonori@gmail.com>
References: <20240601043535.53545-1-fujita.tomonori@gmail.com> <20240601043535.53545-3-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: e2d6fb77f1657057b7aeb9d9776f52d78096341c
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01.06.24 06:35, FUJITA Tomonori wrote:
> Add support for genphy_c45_* helper functions. Instead of adding
> genphy_c45_ methods, this unifies the API for genphy functions with
> trait.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/net/phy.rs | 49 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 10 deletions(-)
>=20
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 286fd5a7ec91..aabd714ae3f6 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -248,16 +248,8 @@ pub fn genphy_suspend(&mut self) -> Result {
>      }
>=20
>      /// Checks the link status and updates current link state.
> -    pub fn genphy_read_status(&mut self) -> Result<u16> {
> -        let phydev =3D self.0.get();
> -        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Self`.
> -        // So it's just an FFI call.
> -        let ret =3D unsafe { bindings::genphy_read_status(phydev) };
> -        if ret < 0 {
> -            Err(Error::from_errno(ret))
> -        } else {
> -            Ok(ret as u16)
> -        }
> +    pub fn genphy_read_status<G: reg::GenPhyOps>(&mut self) -> Result<u1=
6> {

With this change, don't you also need a change in the ax88796b Rust
driver?

> +        G::read_status(self)
>      }
>=20
>      /// Updates the link status.
> @@ -446,6 +438,43 @@ fn write(&self, dev: &mut Device, val: u16) -> Resul=
t {
>              })
>          }
>      }
> +
> +    /// PHY helper functions.
> +    ///
> +    /// This trait is used to implement some helper functions executed e=
ither
> +    /// via C22 or C45 registers.
> +    pub trait GenPhyOps {

Why does this need another trait? Can't it be part of the `Register`
(currently named `Access`) trait?

---
Cheers,
Benno

> +        /// Checks the link status and updates current link state.
> +        fn read_status(dev: &mut Device) -> Result<u16>;
> +    }
> +
> +    impl GenPhyOps for C22 {
> +        fn read_status(dev: &mut Device) -> Result<u16> {
> +            let phydev =3D dev.0.get();
> +            // SAFETY: `phydev` is pointing to a valid object by the typ=
e invariant of `Self`.
> +            // So it's just an FFI call.
> +            let ret =3D unsafe { bindings::genphy_read_status(phydev) };
> +            if ret < 0 {
> +                Err(Error::from_errno(ret))
> +            } else {
> +                Ok(ret as u16)
> +            }
> +        }
> +    }
> +
> +    impl GenPhyOps for C45 {
> +        fn read_status(dev: &mut Device) -> Result<u16> {
> +            let phydev =3D dev.0.get();
> +            // SAFETY: `phydev` is pointing to a valid object by the typ=
e invariant of `Self`.
> +            // So it's just an FFI call.
> +            let ret =3D unsafe { bindings::genphy_c45_read_status(phydev=
) };
> +            if ret < 0 {
> +                Err(Error::from_errno(ret))
> +            } else {
> +                Ok(ret as u16)
> +            }
> +        }
> +    }
>  }
>=20
>  /// Defines certain other features this PHY supports (like interrupts).
> --
> 2.34.1
>=20

