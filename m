Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="lHurQAAl"
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE4192
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 16:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702425693; x=1702684893;
	bh=3x51AzWsJ59PFrlgGbN+RTbEalkmX7aq48wqQb6pGI0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=lHurQAAlgssL0HO0Kt75e4difzN0RITCRmFbGKQ4nHfGB/022WlZPOlX2F5RbQYWT
	 e4WBltU/Meq3t40B5YLaEoCHis3vHLcxpYDWwfr707HDID6zAAUUNllWuA4U0w0V0l
	 WgpBrfFLPbS9fOZsKvF4x0Iv2L9wYCd+Eu6Z+h3RDjxSVVQKICE5/PwonmHFvBSobK
	 ecuAsdcPrA0xaTV7nPrIkjYyyes2GU8zGVRj+rllrclmI7x1bf1Fa4Z8xc1YvkZj+F
	 bMk6H4E5nLYBGCeO3jXPjqms62SxteLRqx3yFMz6sMr4Pcmal7OjovzieefhOANf/G
	 QOR62ZO3RvwDw==
Date: Wed, 13 Dec 2023 00:01:15 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, boqun.feng@gmail.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: alice@ryhl.io, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v10 1/4] rust: core abstractions for network PHY drivers
Message-ID: <e633456e-dc97-48bf-b204-0003b51a38c7@proton.me>
In-Reply-To: <20231213.083109.2097548498951503416.fujita.tomonori@gmail.com>
References: <20231212.220216.1253919664184581703.fujita.tomonori@gmail.com> <544015ec-52a4-4253-a064-8a2b370c06dc@proton.me> <ZXjBKEBUrisSJ7Gx@boqun-archlinux> <20231213.083109.2097548498951503416.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.12.23 00:31, FUJITA Tomonori wrote:
> On Tue, 12 Dec 2023 12:23:04 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
>=20
>> So the rationale here is the callsite of mdiobus_read() is just a
>> open-code version of phy_read(), so if we meet the same requirement of
>> phy_read(), we should be safe here. Maybe:
>>
>> =09"... open code of `phy_read()` with a valid phy_device pointer
>> =09`phydev`"
>>
>> ?
>=20
> I'll add the above comment with the similar for phy_write(), thanks!

Why don't you use the `rust_helper` approach?

--=20
Cheers,
Benno


