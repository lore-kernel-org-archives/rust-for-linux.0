Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AB516938E
	for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164274; cv=none; b=nSp5sRq1AumBWsY7uEDXQVmJc5fF37VI5iUx0acr/jZ98ZXhREn6MbIPDY451jHMIRBTc3jtGXDuwF41xwVu710nycgfQ3Dt3xmu8o1DtUPLMBn/ojf7ftjksmYZIeByiSTHpNMG19h7PT39O8aI0KFkT67A/U5yi91WNicCHok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164274; c=relaxed/simple;
	bh=QD5g1ns8xxdJ+MmrrhnHBuTTgCXf1A7odojoyQX/zNs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IT3o1Gjp4o/cbMZPpkUC5wjF0k+7wDoq67ycVLKf+1xnLFOUMFqyivN+bserSJgjzhbUp/mXUaU+ituYhN8T9DiG4a3stOPuSlaDNFoFIREv5CxkHbvi3lqiC9zYZuWhcTK2Di9srW+1r0fgCROHCDh43xh/XEJjpTn+CCnvCt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JVpCJbbh; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JVpCJbbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1717164263; x=1717423463;
	bh=HAuPcP9JRdQEyrmN3xi5eQk4QNRddJ7Y45Pxq5xUzTA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=JVpCJbbhr38iam0pcrl1dpJ2vlKjd0aI8Oyp5ifOdPlWV1OYHVBDcZfrCSyWFKMOu
	 sDEODp93+C5DO/QiAFd6jo2s4QvrMAT0dNJ/27CTLisAMVMxOfKRGNYLQ8/9oqxw9v
	 otYisQUG8ioDPpz9iBvXxxwP21L24Ul5pQ/oiWIwPHxGguINjxN9wF2wplpWfCeFL/
	 UxW7ICVxxZs6HYIXS3knZRc+41QtVOeV3BO6AGC//CIR5gD7lJvbT6Jhj7T75hi0hJ
	 lwYL0U6gSHX31USaeQ0sY8EV30FDAwR6NYsY92wf9KSxbejzcqACPIiPNiJm5ERyUE
	 /1YFJqRLMBuag==
Date: Fri, 31 May 2024 14:04:18 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: andrew@lunn.ch, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
Message-ID: <310b155c-9f06-4748-85c4-cd8c87f196c1@proton.me>
In-Reply-To: <20240531.225857.1252492134294581333.fujita.tomonori@gmail.com>
References: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com> <8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch> <4a6aba6c-3e52-4ace-be88-58f9c1b44693@proton.me> <20240531.225857.1252492134294581333.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d938dc7d1479bd35d255fcb8e281b674f9a961fb
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 31.05.24 15:58, FUJITA Tomonori wrote:
> Hi,
>=20
> On Thu, 30 May 2024 08:05:50 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>>> 802.3 C22 defines 16 through 31 as vendor specific. Most of the
>>> #defines appear to come from the S390 driver. We probably should not
>>> add them in the Rust API when there meaning is not clearly
>>> defined. However, a driver should be able to use them, e.g, by
>>> defining their own vendor specific name to a given value.
>>
>> @Fujita, you could fix this by adding a `VendorSpecific(T)` enum variant
>> and add a generic parameter to `C22`. Then the user has the option to
>=20
> I'm not sure. You meant something like:
>=20
> pub enum C22<T> {
>     Bmcr,
>     Bmsr,
>     VendorSpecific(T),
> }
>=20
> ?

Yes.

> Then it's not handy to use the defined registers?
>=20
> let ret =3D phy.read(reg::C22::<u8>::Bmcr)?;
>=20
> I prefer:
>=20
> let ret =3D phy.read(reg::C22::Bmcr)?;

Hmm I guess that it probably can't infer a default type. In that case,
you can also try if a struct approach for C22 is better. So:

    pub struct C22(u16); // choose the correct size

    impl C22 {
        pub fn new(reg: u16) -> Self;

        pub const BMCR: Self =3D Self::new(uapi::MII_BMCR);
        // ...
    }

And then a specific driver can declare its own constants.

---
Cheers,
Benno

