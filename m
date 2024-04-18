Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F20941C78
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713444434; cv=none; b=tTNNNGO2Rrn6KOcZa1bB3+rkGZyp+N+lFK0SFyNy2G/J3IGw4vJjdAfc7kxL4oZow+FuXlTZ+AyPrl6X7Oev7AkI1MKVKlzw/p9lp0gzjBrLWIj+1nvvolFRMpvoPikQDJRddrErFV5jTP/Eg8N1rO2lo0gUMiYFNFGY63t2nUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713444434; c=relaxed/simple;
	bh=OjM2+q5IrJPgChlmxtugg0H+0Nb0jlZfH7lYr+xWFu4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgJBy7rTMvePwT7a51J6jzHAJj4cik/xiZ8s8eP3tZhix/+znK0ZT37BJCyHIR51YOZrW73dGIU6Wrn7I69FcpkIIU1teNs9CIl82bk2UZdn+HuYqSFh8hntAmrc7iYN8TsSc1crxKz5knlnD2kmfnHCIZCWgns9Mrvd+3SzaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=OQFWOT4n; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="OQFWOT4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1713444425; x=1713703625;
	bh=FtZD2Q+I7uEMMS0HuDMeXjCn3Hzk9KekmIGEGtElOmA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OQFWOT4n7hQKYh/WtuVLTkWuicl2a7g7QVaRl1U0PTQvwRQz8IDlFjpc2vsMHds6u
	 tjeHywzj/ysunVZCQLGTg09t1utLz+JpOuXdyATwz1Q8rIuaSPnz4n0CC45o+B/+6Z
	 CrKYx4gIdyWToWAtG5Tz3ffrXMkb+7UQ2nGSHpXMrEgPZEE9L1OUqFGPBcsi6KKqyD
	 7D91lCfMo1BRU6s9xvTaw3lRBKDyKrje1LznhlW5ywgTUWtIu7GG6Dpp2NyD/HiCRE
	 uE9ptWWX/KlpgnXBy1cwIBRPAfZVunaElHvlDQTHUg9OWOefVXXKYRujmG/bBVtiq1
	 yWWpkSinOIjnA==
Date: Thu, 18 Apr 2024 12:47:01 +0000
To: Andrew Lunn <andrew@lunn.ch>
From: Benno Lossin <benno.lossin@proton.me>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH net-next v1 2/4] rust: net::phy support C45 helpers
Message-ID: <903a21b5-38d1-4d7c-8eb0-610b629c9856@proton.me>
In-Reply-To: <49c221e6-92d0-42ef-b48b-829c7c47d790@lunn.ch>
References: <e8a440c7-d0a6-4a5e-97ff-a8bcde662583@lunn.ch> <20240416.204030.1728964191738742483.fujita.tomonori@gmail.com> <26f64e48-4fd3-4e0f-b7c5-e77abeee391a@lunn.ch> <20240416.222119.1989306221012409360.fujita.tomonori@gmail.com> <b03584c7-205e-483f-96f0-dde533cf0536@proton.me> <f908e54a-b0e6-49d5-b4ff-768072755a78@lunn.ch> <92b60274-6b32-4dfd-9e46-d447184572d2@proton.me> <49c221e6-92d0-42ef-b48b-829c7c47d790@lunn.ch>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 3792599aafbe9dbff3b9f38b5134902b4bcc77a4
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.04.24 15:34, Andrew Lunn wrote:
>> If the driver shouldn't be concerned with how the access gets handled,
>> why do we even have a naming problem?
>=20
> History.
>=20
> The current C code does not cleanly separate register spaces from
> access mechanisms.
>=20
> C22 register space is simple, you can only access it using C22 bus
> protocol. However C45 register space can be accessed in two ways,
> either using C45 bus protocol, or using C45 over C22. The driver
> should not care, it just wants to read/write a C45 register.  But the
> current core mixes the two concepts of C45 register space and access
> mechanisms. There have been a few attempts to clean this up, but
> nothing landed yet.
>=20
> Now this driver is somewhat special. The PHY itself only implements
> one of the two access mechanisms, C45 bus protocol. So this driver
> could side-step this mess and define access functions which go
> straight to C45 bus protocol. However, some day a non-special
> device/driver will come along, and we will need the generic access
> functions, which leave the core to decide on C45 bus protocol or C45
> over C22. Ideally these generic functions should have the natural name
> for accessing C45 registers, and the special case in this driver
> should use a different name.

Thanks for the explanation. What about having the following register
representing types:
- `C22` accesses a C22 register
- `C45` accesses a C45 register using whatever method phylib decides
- `C45Bus` accesses a C45 register over the C45 bus protocol (or
   `C45Direct`)

Or are you opposed to the idea of accessing any type of register via
`dev.read_register::<RegType>(..)`?

--=20
Cheers,
Benno

