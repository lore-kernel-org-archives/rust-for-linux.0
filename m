Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="O1wQ04m2"
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C206B9
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 09:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702402543; x=1702661743;
	bh=yYYyEVfceeIkJgL3YM5c5bx1Yypx0l6dB7B0gX5JUek=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=O1wQ04m2B22DpwbZ0Ob+JnayGOIUoZzHZFoMYxPxACK2RnDY72Rsw1OnMRxB0rnNf
	 dg48pgy7yhDOWS7T57JAbNm2t9KdMUEMVomuuW/SCqaJhn6OnBF0sIlQlWT9SaLvOe
	 CcZFfu9TMt15/hSlZ+y2Xabw84mB34H4q7cycZ+xFqnTlj0hVDUjj8GZgvXTRX9Z5R
	 GVStXsXxPPNV9oJIX1udLj/sNZraz+BUs25Xf4uxR8bDBW9pOIPr/fhpxb4IQI6WwU
	 RIV1Rs9gJ5zRWF1hsedWyRyBauo1mch0Qmf4Fb1jkRnREJV3nH1nE8boz7+FpJo/Z9
	 Y+UQhoasgdUAw==
Date: Tue, 12 Dec 2023 17:35:34 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, boqun.feng@gmail.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: alice@ryhl.io, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v10 1/4] rust: core abstractions for network PHY drivers
Message-ID: <544015ec-52a4-4253-a064-8a2b370c06dc@proton.me>
In-Reply-To: <20231212.220216.1253919664184581703.fujita.tomonori@gmail.com>
References: <ZXfFzKYMxBt7OhrM@boqun-archlinux> <20231212.130410.1213689699686195367.fujita.tomonori@gmail.com> <ZXf5g5srNnCtgcL5@Boquns-Mac-mini.home> <20231212.220216.1253919664184581703.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/12/23 14:02, FUJITA Tomonori wrote:
> On Mon, 11 Dec 2023 22:11:15 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
>=20
>>>> // SAFETY: `phydev` points to valid object per the type invariant of
>>>> // `Self`, also the following just minics what `phy_read()` does in C
>>>> // side, which should be safe as long as `phydev` is valid.
>>>>
>>>> ?
>>>
>>> Looks ok to me but after a quick look at in-tree Rust code, I can't
>>> find a comment like X is valid for the first argument in this C
>>> function. What I found are comments like X points to valid memory.
>>
>> Hmm.. maybe "is valid" could be a confusing term, so the point is: if
>> `phydev` is pointing to a properly maintained struct phy_device, then an
>> open code of phy_read() should be safe. Maybe "..., which should be safe
>> as long as `phydev` points to a valid struct phy_device" ?
>=20
> As Alice suggested, I updated the comment. The current comment is:
>=20
> // SAFETY: `phydev` is pointing to a valid object by the type invariant o=
f `Self`.
> // So it's just an FFI call.
> let ret =3D unsafe {
>     bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnu=
m.into())
> };

I still think you need to justify why `mdio.bus` is a pointer that you
can give to `midobus_read`. After looking at the C code, it seems like
that the pointer needs to point to a valid `struct mii_bus`.
This *could* just be an invariant of `struct phy_device` [1], but where
do we document that?

We could make an exception here and treat this differently until bindgen
can handle the `static inline` functions, but I am not so sure if we
want to have this as a general pattern. We need to discuss this more.


[1]: Technically it is a combination of the following invariants:
- the `mdio` field of `struct phy_device` is a valid `struct mido_device`
- the `bus` field of `struct mdio_device` is a valid pointer to a valid
  `struct mii_bus`.

> If phy_read() is called here, I assume that you are happy about the
> above comment. The way to call mdiobus_read() here is safe because it
> just an open code of phy_read(). Simply adding it works for you?
>=20
> // SAFETY: `phydev` is pointing to a valid object by the type invariant o=
f `Self`.
> // So it's just an FFI call, open code of `phy_read()`.

This would be fine if we decide to go with the exception I detailed
above. Although instead of "open code" I would write "see implementation
of `phy_read()`".

--=20
Cheers,
Benno

