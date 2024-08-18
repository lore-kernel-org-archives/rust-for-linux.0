Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D671494A9
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Aug 2024 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723997987; cv=none; b=Te8+JOZ+Q0r/lte5A7m3Z3I2aFDVm6UGbAa01Qmg7ITpUgCBXhEtjZfeSH9ZzWlFqjANqQcoFoSFvbImSkoGN9auz+KV/VcMrDyxEYxRVafhrQFXk51uDauaRQ7VD8Bk/3Zfk+9j45efIxIFHxzpubGwocKU7CRhF5z1MVx9M3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723997987; c=relaxed/simple;
	bh=GrnrTDhAg4vrMh89kjREW/INf+mkJ9kP/bZs3jMFZCU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPi/yfQvVbQmUHxa0z+pVltbLrF3XM5BKgiBHmexI1Qu8WLb7cUB2f27bPMEdwCDGA7fRqUbl9Y+IMMxNYWYgO4vmCgfO8m4k7J3vgBRtQH2eM9tgW+ndyvZRTcuqR4DMhHXq2Y4lHn3uCZK4hH6BYTVuRah9CookZgzuBO8+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ckTCPvOV; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ckTCPvOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723997983; x=1724257183;
	bh=LitlIKGpzYjKLBsxkg6+XkLgSoHnyKImzlT9kOFjJik=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ckTCPvOV33E7I7FuOyb3l+W/1TXoHsj+dGVC/+6a3Ks7wYnLnnwFjJAsb45aYgo+N
	 Cg6uoKDXVGKF6VCQ6Hp8zpGuTjUhOraImAdkSybzvszUaSvkDK/KZhOk6tLQ5Pa31D
	 F5lwtNHqTaxN9+5QJkj3c1XYXxKse4vsgOBNM19rpZeGulaCrRbZ7vZMvw9qzkzcim
	 CejqDtpIl8qq99tiSEBAqH9823Fb/eCujf28kntIbeb6XjS8aPPp/XJwWWg8d48o3D
	 ViLHA7dFja4VezZpwKrKaEomalM3iDBBvlz9fwlUnzbEQNfhxsEX76QQqN7ABHPyzv
	 5/nWHeACcIi/w==
Date: Sun, 18 Aug 2024 16:19:39 +0000
To: Andrew Lunn <andrew@lunn.ch>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Greg KH <gregkh@linuxfoundation.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v4 3/6] rust: net::phy implement AsRef<kernel::device::Device> trait
Message-ID: <c2002c1b-9e01-4d4f-8426-8baa49614786@proton.me>
In-Reply-To: <cbb9e253-499d-4b11-93ae-63ea7cb9cfa3@lunn.ch>
References: <a8284afb-d01f-47c7-835f-49097708a53e@proton.me> <20240818.021341.1481957326827323675.fujita.tomonori@gmail.com> <9127c46d-688c-41ea-8f6c-2ca6bdcdd2cd@proton.me> <20240818.073603.398833722324231598.fujita.tomonori@gmail.com> <f480eb03-78f5-497e-a71d-57ba4f596153@proton.me> <1afb6d69-f850-455f-97e2-361d490a2637@lunn.ch> <2024081809-scoff-uncross-5061@gregkh> <fa0534e5-a4e9-45e5-a202-e4647c99c514@proton.me> <cbb9e253-499d-4b11-93ae-63ea7cb9cfa3@lunn.ch>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7c0b98d318791f2530f6455752de645d86580ef8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.08.24 18:16, Andrew Lunn wrote:
>> Thanks that's good to know.
>>
>>>> So i have to wounder if you are solving this at the correct
>>>> level. This should be generic to any device, so the Rust concept of a
>>>> device should be stating these guarantees, not each specific type of
>>>> device.
>>>
>>> It should, why isn't it using the rust binding to Device that we alread=
y
>>> have:
>>> =09https://rust.docs.kernel.org/kernel/device/struct.Device.html
>>> or is it?  I'm confused now...
>>
>> It is using that one.
>> I wanted to verify that we can use that one, since using this
>> implementation users can freely increment the refcount of the device
>> (without decrementing it before control is given back to PHYLIB). Since
>> that seems to be the case, all is fine.
>=20
> Any driver which is not using the device core is broken, and no amount
> of SAFETY is going to fix it.

This is what I did not know, and I asked to ensure that we don't
introduce miscommunication with the C side. (i.e. can we rely
in our SAFETY comments that devices are always used in this way)

---
Cheers,
Benno

