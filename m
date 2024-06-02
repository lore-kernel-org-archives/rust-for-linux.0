Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD1364A0
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Jun 2024 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717322390; cv=none; b=c8uZl9GHaOkecO6RpQLO/t6BBhS0Y46jh24VAVUpHYPSz1tATor1pBipMJws4GNOcIiH8PjSUqsvpzpFm3qIsHnBWmOf3AkLlvxi29o9WxxGvufr5+aJLUiW2HegkVcp8cR47Lcg5gX7VYd0qLYGPOb5O8BQ2ivcubrq5jXPVeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717322390; c=relaxed/simple;
	bh=I+lcy1iy3yse9UDkrMq3oEWp0sOMJgA1rIBuJyUv77A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bkVn3KEWq5RWCDRNG+ahudzIpU7uJyNVztioV17kB7Mhi8hIG9mgNFodDou0SeIWSc+HePMBmBDEljkZsuP5ZRm1gCNFM1h//ysDctYhN2vckF2H9UvOGAOvXaU2WEMiYAJtN5fRdWSHIC+MvOVtxWBI9TkpJ4XAKKuFrrZbg/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UE0ogCoF; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UE0ogCoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1717322381; x=1717581581;
	bh=WFmoZDov05RZKehNu/3AbGUtcM5VjzrTGN4WsiMMPXw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UE0ogCoFjEOl1efVujmATg5sliRs9gNtkZal5KnIy4dlyjzcTJRnr+8dQN3L+chG9
	 1tZlqLt0jyindESG4/Vda6uJZCMLMYZxP8ll2NiEilTVQvN0Cpkxc+HyY8e5eE9sQY
	 fMtKIP2FmbDjBxozBexdxjImk3zMP3f/Xqi5jQVmi8uJFG2dwmzSdzkovXsUpbNOx4
	 Wn6E59/it1du0w53OA0l/QmmUBO8rdyIxzK2MJv/Il3Gtcs7V9AWiD/+zoEwMvtCh3
	 EJM5xfZH0Fx2qCn7BztKgBuXtf2i0BjxP5gfkfj2HuhkmoetevJUO1iSfEQp8JJlDC
	 fXA6JxQLCQ8Pw==
Date: Sun, 02 Jun 2024 09:59:36 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 1/2] rust: net::phy support for C45 register access
Message-ID: <0aa2f303-2fe1-4496-8abe-140a6e3eafad@proton.me>
In-Reply-To: <20240602.162428.1539328419375401243.fujita.tomonori@gmail.com>
References: <20240601043535.53545-1-fujita.tomonori@gmail.com> <20240601043535.53545-2-fujita.tomonori@gmail.com> <1def4559-d812-4426-94bb-b668f9ccb824@proton.me> <20240602.162428.1539328419375401243.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 57a9fe970b32be06dcbb2de98848cf114dc2c129
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02.06.24 09:24, FUJITA Tomonori wrote:
> On Sat, 01 Jun 2024 12:21:14 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>=20
>> On 01.06.24 06:35, FUJITA Tomonori wrote:
>>> Adds support for C45 register access. Instead of adding read/write_c45
>>> methods, this unifies the API to access C22 and C45 registers with
>>> trait.
>>
>> The short commit message only mentions C45, should it also include C22?
>=20
> How about the following?
>=20
> Adds support for C45 register access. The abstractions support access
> to only C22 registers now. Instead of adding read/write_c45 methods
> specifically for C45, a new reg module supports the unified API to
> access to C22 and C45 registers with trait, by calling an appropriate
> phylib functions.

Sure you can use that, but my comment above was about the short message
(ie the first line/the email title. That one only mentions C22).

[...]

>>> +    /// MDIO manageable devices.
>>> +    pub struct Mmd(u8);
>>> +
>>> +    impl Mmd {
>>> +        /// Physical Medium Attachment/Dependent.
>>> +        pub const PMAPMD: Self =3D Mmd(uapi::MDIO_MMD_PMAPMD as u8);
>>> +        /// WAN interface sublayer.
>>> +        pub const WIS: Self =3D Mmd(uapi::MDIO_MMD_WIS as u8);
>>> +        /// Physical coding sublayer.
>>> +        pub const PCS: Self =3D Mmd(uapi::MDIO_MMD_PCS as u8);
>>> +        /// PHY Extender sublayer.
>>> +        pub const PHYXS: Self =3D Mmd(uapi::MDIO_MMD_PHYXS as u8);
>>> +        /// DTE Extender sublayer.
>>> +        pub const DTEXS: Self =3D Mmd(uapi::MDIO_MMD_DTEXS as u8);
>>> +        /// Transmission convergence.
>>> +        pub const TC: Self =3D Mmd(uapi::MDIO_MMD_TC as u8);
>>> +        /// Auto negotiation.
>>> +        pub const AN: Self =3D Mmd(uapi::MDIO_MMD_AN as u8);
>>> +        /// Clause 22 extension.
>>> +        pub const C22_EXT: Self =3D Mmd(uapi::MDIO_MMD_C22EXT as u8);
>>> +        /// Vendor specific 1.
>>> +        pub const VEND1: Self =3D Mmd(uapi::MDIO_MMD_VEND1 as u8);
>>> +        /// Vendor specific 2.
>>> +        pub const VEND2: Self =3D Mmd(uapi::MDIO_MMD_VEND2 as u8);
>>> +
>>> +        /// Creates a new instance of `Mmd` with a specific device add=
ress.
>>> +        pub fn new(devad: u8) -> Self {
>>> +            Mmd(devad)
>>
>> Is there also a range that makes sense to exclude (similar to C22)?
>=20
> Not, I think. C22 saves 0x10..0x1f for vendor specific registers. But
> C45 has VEND1 and VEND2 for the same purpose.
>=20
> Andrew, we need to allow a driver to use reserved addresses (14-28) in
> C45? If not, we don't new() func to allow a driver to use them.

You can also just leave it out and if some driver needs it at a later
point, you can just add it at that time.

> I overlooked some addresses in 802. I'll add const for all the
> addresses in v3.
>=20
>=20
>>> +        }
>>> +    }
>>> +
>>> +    /// C45 registers.
>>> +    pub struct C45 {
>>> +        devad: Mmd,
>>> +        regnum: u16,
>>> +    }
>>> +
>>> +    impl C45 {
>>> +        /// Creates a new instance of `C45`.
>>> +        pub fn new(devad: Mmd, regnum: u16) -> Self {
>>
>> I really like that the first argument has a proper type now, do you
>> think that the same is also possible for `regnum`? Or are there no
>=20
> I think that it's difficult.
>=20
>> common values for `regnum` (that also have the same meaning across
>> devices/drivers)? In that case, keep the `u16`.
>=20
> Many are defined in the specification. Drivers might use registers
> undefined in the spec for some reasons, I assume.

I see, well then just use the `u16` and the drivers can define their own
constants.

---
Cheers,
Benno

