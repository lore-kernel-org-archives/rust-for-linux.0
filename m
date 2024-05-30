Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B3176AD2
	for <rust-for-linux@vger.kernel.org>; Thu, 30 May 2024 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056360; cv=none; b=dI1b2ARqWaUe5B9/MZ2u3rWEfoZo+muhFffKo78KlUZEwHAhpG53sYewsX5ZIDSnZ1CHXe1bd+etVFYr/hiGefQTcvZUaKtacw5TcewjDfWb8IJUbXitZl2vTxNnaYav1zDo56wHnHiYio4a2ej+OD3cSZSVzVt9zp2lf8sTw0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056360; c=relaxed/simple;
	bh=qM+iLIdWE8bY8jd3Hm4lN0A/icwxDI/IxA93P8PRIek=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pdLCZr+7fQJwZNSwZ3aG+Hvak4GxGqmLunwN5wkBVLkKo7mfPsP0GJPWWjeYWCeRQaBLDDf6vmYDp1OzE9veHET/uzv2ZkmuBwGhniT7W5L/q9WkqJiq9PLcyuuecsYXWIOcO+ZabW+2s5tt4axEBP1BaAwLpFxZRpRh3n9P1bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=clv09kSU; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="clv09kSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1717056356; x=1717315556;
	bh=KSmXQmJWbV+Kd8IYUU0vtZRIU6a7kQ7T40+6yTs3+p0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=clv09kSUkSFWYn104rpRhhvPsESG/HiwPITPJ51M4Ctxl3LhkFogFPHGR/G58gu7p
	 mq+ltDuLkvzZvm7DDDJsNgcH9A/pwf3xF0i13k1a/W19TAuQoNTctvY3iVc0tDqeKp
	 52NX9aZ7Mmf26FtkKlSmJhgenMjTP2SkLe1ruKzxRhfN+DWVfSNWvW2A/slP2RUTlS
	 GXxdGoPQxt0ozuw1uIgjswCVdca2HJ4jUUloXW/8x0UgFn1PkSWw3MoXa7Nq+DgITn
	 EIGSqB6cR7pClqOyEZop/txrQsnQShr0o1u29uwJANT/9DAQGlfqheo3xpqteuMMgY
	 ELXocWVyCbgIw==
Date: Thu, 30 May 2024 08:05:50 +0000
To: Andrew Lunn <andrew@lunn.ch>, FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
Message-ID: <4a6aba6c-3e52-4ace-be88-58f9c1b44693@proton.me>
In-Reply-To: <8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
References: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com> <8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 2a84a6afa3eaab1119891d7d0d8ffb8fda9bf0b1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 27.05.24 23:57, Andrew Lunn wrote:
>> +/// Accesses to C22 registers.
>> +#[derive(Clone, Copy)]
>> +pub enum RegC22 {
>> +    /// Basic mode control.
>> +    Bmcr =3D uapi::MII_BMCR as isize,
>> +    /// Basic mode status.
>> +    Bmsr =3D uapi::MII_BMSR as isize,
>> +    /// PHY identifier 1.
>> +    PhysId1 =3D uapi::MII_PHYSID1 as isize,
>> +    /// PHY identifier 2.
>> +    PhysId2 =3D uapi::MII_PHYSID2 as isize,
>> +    /// Auto-negotiation advertisement.
>> +    Advertise =3D uapi::MII_ADVERTISE as isize,
>> +    /// Auto-negotiation link partner base page ability.
>> +    Lpa =3D uapi::MII_LPA as isize,
>> +    /// Auto-negotiation expansion.
>> +    Expansion =3D uapi::MII_EXPANSION as isize,
>> +    /// 1000BASE-T control.
>> +    Ctrl1000 =3D uapi::MII_CTRL1000 as isize,
>> +    /// 1000BASE-T status.
>> +    Stat1000 =3D uapi::MII_STAT1000 as isize,
>> +    /// MMD access control.
>> +    MmdCtrl =3D uapi::MII_MMD_CTRL as isize,
>> +    /// MMD access data.
>> +    MmdData =3D uapi::MII_MMD_DATA as isize,
>> +    /// Extended status.
>> +    Estatus =3D uapi::MII_ESTATUS as isize,
>> +    /// Disconnect counter.
>=20
>> +    Dcounter =3D uapi::MII_DCOUNTER as isize,
>> +    /// False carrier sense counter.
>> +    Fcscounter =3D uapi::MII_FCSCOUNTER as isize,
>> +    /// N-way auto-negotiation test.
>> +    Nwaytest =3D uapi::MII_NWAYTEST as isize,
>> +    /// Receive error counter.
>> +    Rerrcounter =3D uapi::MII_RERRCOUNTER as isize,
>> +    /// Silicon revision.
>> +    Srervision =3D uapi::MII_SREVISION as isize,
>> +    /// Reserved.
>> +    Resv1 =3D uapi::MII_RESV1 as isize,
>> +    /// Lpback, rx, bypass error.
>> +    Lbrerror =3D uapi::MII_LBRERROR as isize,
>> +    /// PHY address.
>> +    Phyaddr =3D uapi::MII_PHYADDR as isize,
>> +    /// Reserved.
>> +    Resv2 =3D uapi::MII_RESV2 as isize,
>> +    /// TPI status for 10Mbps.
>> +    TpiStatus =3D uapi::MII_TPISTATUS as isize,
>> +    /// Network interface configuration.
>> +    Nconfig =3D uapi::MII_NCONFIG as isize,
>=20
> 802.3 C22 defines 16 through 31 as vendor specific. Most of the
> #defines appear to come from the S390 driver. We probably should not
> add them in the Rust API when there meaning is not clearly
> defined. However, a driver should be able to use them, e.g, by
> defining their own vendor specific name to a given value.

@Fujita, you could fix this by adding a `VendorSpecific(T)` enum variant
and add a generic parameter to `C22`. Then the user has the option to
declare their own variant. You will probably need another trait for the
`T` value to extract the correct register number (you can try to use
`build_assert!` to ensure that the custom registers are not in the 0..16
range).

---
Cheers,
Benno

