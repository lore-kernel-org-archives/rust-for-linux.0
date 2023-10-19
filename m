Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30E29CF1
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Oct 2023 13:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Vdc4EPP/"
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FAACF
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Oct 2023 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1697723864; x=1697983064;
	bh=Pb0R4T/1SOTsseEXhRfOEpdgjgxnSa0K5iwL8Pm4cM8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vdc4EPP/EJ41l0ORJzEBweTA1pgUll/HjaLTyyBlKOtMiEht3V/GaPryZ0NeJAtKF
	 FyomKccTwGWnHf063kh7uNtqakae6zk4BQr12q5RryJJxKwI+y+DiFbSwwm8BB7jdf
	 4bb3mrEJ8kcQR5Nn3QAzuF5AeayMT0vOm3hevE7QRohObnOQBR4thH1GnCiqwCq3i9
	 agJFHTU9ev83kvXQbSoO5JeAjmoOGsAQAadsOsTOSXJ3qVPLscPf/7B7FKRc6iIKR+
	 wsHsT3K9U+6bX/VfmmdNJ8etjdYEGuhjKpaGqW3CP6FQ1ayD1aZbGZQiufQpCLqzIp
	 jIcDQ8sU6iiiw==
Date: Thu, 19 Oct 2023 13:57:39 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, andrew@lunn.ch
From: Benno Lossin <benno.lossin@proton.me>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, tmgross@umich.edu, boqun.feng@gmail.com, wedsonaf@gmail.com, greg@kroah.com
Subject: Re: [PATCH net-next v5 1/5] rust: core abstractions for network PHY drivers
Message-ID: <64748f96-ac67-492b-89c7-aea859f1d419@proton.me>
In-Reply-To: <20231019.094147.1808345526469629486.fujita.tomonori@gmail.com>
References: <20231017113014.3492773-1-fujita.tomonori@gmail.com> <20231017113014.3492773-2-fujita.tomonori@gmail.com> <de9d1b30-ab19-44f9-99a3-073c6d2b36e1@lunn.ch> <20231019.094147.1808345526469629486.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.10.23 02:41, FUJITA Tomonori wrote:
> On Wed, 18 Oct 2023 22:27:55 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
>=20
>>> +    /// Reads a given C22 PHY register.
>>> +    pub fn read(&mut self, regnum: u16) -> Result<u16> {
>>> +        let phydev =3D self.0.get();
>>> +        // SAFETY: `phydev` is pointing to a valid object by the type =
invariant of `Self`.
>>> +        // So an FFI call with a valid pointer.
>>> +        let ret =3D unsafe {
>>> +            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.=
addr, regnum.into())
>>
>> If i've understood the discussion about &mut, it is not needed here,
>> and for write. Performing a read/write does not change anything in
>> phydev. There was mention of statistics, but they are in the mii_bus
>> structure, which is pointed to by this structure, but is not part of
>> this structure.
>=20
> If I understand correctly, he said that either (&self or &mut self) is
> fine for read().
>=20
> https://lore.kernel.org/netdev/3469de1c-0e6f-4fe5-9d93-2542f87ffd0d@proto=
n.me/
>=20
> Since `&mut self` is unique, only one thread per instance of `Self`
> can call that function. So use this when the C side would use a lock.
> (or requires that only one thread calls that code)
>=20
> Since multiple `&self` references are allowed to coexist, you should
> use this for functions which perform their own serialization/do not
> require serialization.
>=20
>=20
> I applied the first case here.

I will try to explain things a bit more.

So this case is a bit difficult to figure out, because what is
going on is not really a pattern that is used in Rust.
We already have exclusive access to the `phy_device`, so in Rust
you would not need to lock anything to also have exclusive access to the
embedded `mii_bus`. In this sense, mutable references (`&mut T`) are
infectious.

Since C always locks the `mdio_lock` when we call the read & write
functions, we however could also just use a shared reference (`&T`)
for the function receiver, since the C side guarantees serialization.

Another reason for choosing `&mut self` here is the following: it is
easier to later change to `&self` compared to going with `&self` now
and changing to `&mut self` later. This is because if you have a `&mut T`
you can also call all of its `&T` functions, but not the other way around.
`&mut self` is as a receiver also more conservative, since it is more
strict as to where it can be called. So let's just go with that.

--=20
Cheers,
Benno


