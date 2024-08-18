Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B97946C
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Aug 2024 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723977762; cv=none; b=SUR+T0HMygudFJLlclrZgEFhudVQqVMc7Fl33q+MK2pVWIWYhZDKbsrsCiMjpWohO52RVhqXK5B+egiR/mUs22WoF+7WiANj/KN/mSljTdsDapJfdQ1lXSdvwADSyh01SAI7cbjtpZ+vjS3apbwDecmJtwaqRVeo31uM9Hvj0BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723977762; c=relaxed/simple;
	bh=2egL+Ky23yFuzHrB5dZbCUemIke4rSwVle2wTUegfG4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s53kSpk1L/T3iNye4LRz15l7XgvLdC1CEPL9+6ul5d8MIthhOUa+s+dC+VBIgFRS7y5GxIDO+PX0XQ89IpYegKuG6qcflbph4mq6IPhWAAGWvkEx1OOcH6P4ufcfE/+raOGUZxoziZWxV4WMP/sYZzIuhjYFrT0qL1e7AWeUo1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Va9QItBb; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Va9QItBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723977756; x=1724236956;
	bh=bMn8CxedL+voramiWQ8F4CJ2Hf3kxMy2dTvVlC4VAk0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Va9QItBb87vdsBKJx21e4aw7g1Tr15fbKQNGOvRTTKnAlo6iuFx3TRoMeiLXBWJ8X
	 xPKdI3G0T7KXebqxi84+HpCiezFJTkkoQ4AkD/MHc7leGJH0tS2raR3qRGbf8cxU9m
	 So4YONRc7sRJo5WhZI0KwtsjsZ2DVE/4ks645rmgWw4FNkGbI1b1jbNRpE7ZjfkGgG
	 uW9RAl5DzWt7QWGFpbRSyIoDpmsz4Uqvbu0ci/DOVf3i6OjUg1PHZignHfGT4EszTE
	 K+FCFyn+wXkz+x4qmhfxsb23MCrd5VpRiBsXaXxb5o4q6KCxtUoJB76ZDOao6uiXBi
	 3OjJeWsUIXDuA==
Date: Sun, 18 Aug 2024 10:42:32 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v4 3/6] rust: net::phy implement AsRef<kernel::device::Device> trait
Message-ID: <dc644e0a-516b-40cb-8c33-cf98ef0111c9@proton.me>
In-Reply-To: <20240818.091533.348920797210419357.fujita.tomonori@gmail.com>
References: <9127c46d-688c-41ea-8f6c-2ca6bdcdd2cd@proton.me> <20240818.073603.398833722324231598.fujita.tomonori@gmail.com> <f480eb03-78f5-497e-a71d-57ba4f596153@proton.me> <20240818.091533.348920797210419357.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a50eac65254dd63e397d3f7b8a1d0e8fc00c9233
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.08.24 11:15, FUJITA Tomonori wrote:
> On Sun, 18 Aug 2024 09:03:01 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>=20
>>>  /// PHY state machine states.
>>>  ///
>>> @@ -60,6 +59,7 @@ pub enum DuplexMode {
>>>  ///
>>>  /// Referencing a `phy_device` using this struct asserts that you are =
in
>>>  /// a context where all methods defined on this struct are safe to cal=
l.
>>> +/// This struct always has a valid `mdio.dev`.
>>
>> Please turn this into a bullet point list.
>=20
> /// - Referencing a `phy_device` using this struct asserts that you are i=
n
> ///   a context where all methods defined on this struct are safe to call=
.
> /// - This struct always has a valid `mdio.dev`.

Hmm, I think `self.0.mdio.dev` would be clearer.

>=20
> Looks fine?
>=20
>>>  ///
>>>  /// [`struct phy_device`]: srctree/include/linux/phy.h
>>>  // During the calls to most functions in [`Driver`], the C side (`PHYL=
IB`) holds a lock that is
>>> @@ -76,9 +76,9 @@ impl Device {
>>>      ///
>>>      /// # Safety
>>>      ///
>>> -    /// For the duration of 'a, the pointer must point at a valid `phy=
_device`,
>>> -    /// and the caller must be in a context where all methods defined =
on this struct
>>> -    /// are safe to call.
>>> +    /// For the duration of 'a, the pointer must point at a valid `phy=
_device` with
>>> +    /// a valid `mdio.dev`, and the caller must be in a context where =
all methods
>>> +    /// defined on this struct are safe to call.
>>
>> Also here.
>=20
> /// # Safety
> ///
> /// For the duration of 'a,
> /// - the pointer must point at a valid `phy_device`, and the caller
> ///   must be in a context where all methods defined on this struct
> ///   are safe to call.
> /// - 'mdio.dev' must be a valid.

Also here: `(*ptr).mdio.dev`.

---
Cheers,
Benno

>=20
> Better?
>=20
>>> +impl AsRef<kernel::device::Device> for Device {
>>> +    fn as_ref(&self) -> &kernel::device::Device {
>>> +        let phydev =3D self.0.get();
>>> +        // SAFETY: The struct invariant ensures that `mdio.dev` is val=
id.
>>> +        unsafe { kernel::device::Device::as_ref(addr_of_mut!((*phydev)=
.mdio.dev)) }
>>> +    }
>>
>> Just to be sure: the `phydev.mdio.dev` struct is refcounted and
>> incrementing the refcount is fine, right?
>=20
> phydev.mdio.dev is valid after phydev is initialized.
>=20
> struct phy_device {
> =09struct mdio_device mdio;
> =09...
>=20
> struct mdio_device {
> =09struct device dev;
> =09...
>=20

