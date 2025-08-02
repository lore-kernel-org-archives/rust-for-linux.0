Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C50A920
	for <rust-for-linux@vger.kernel.org>; Sat,  2 Aug 2025 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131916; cv=none; b=bQ9vm1eIZTKR0ADqWVS409crYoTd28brJl80e47heYjdKKuraKhkvGAn1gQFkk8kH6c210R5kTf37cu3SpKnYC6tp0YLSzvHgyoO21JtKAnKHo6/efC9RJOW/tqRwVrSmsx6B174Joo4dj3rtDqr5Vd4WT0XYCArAzXBQvrqux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131916; c=relaxed/simple;
	bh=Cv9P9ZgzB1YTGVsji0ErZcOTv+yTJdn/lGaaRhi9huw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=fbOALWNf/Q2mi+020mHa/F5u0C+0C1cij8iQH2CQVgKqDgg4/TAM54RoqfMO3wqr3nffBeLjXuG5jSRbOKHsq8D7+UEtT0BcTxZZIiXK0E+cpOJwz2pNQfUu7ab1sqwcxBcD1LEb4WQiSBsaBdH+iACGc/64z/y/DFmGn3H/Fmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNy2InRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNy2InRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E73C4CEEF;
	Sat,  2 Aug 2025 10:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754131915;
	bh=Cv9P9ZgzB1YTGVsji0ErZcOTv+yTJdn/lGaaRhi9huw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=iNy2InRXxRCBvAGVU0HpA58rAFZZ7fwKjADd2a5KRlF3CQ2zng9NaqFrK5BXVKSqB
	 YYvPbJ7oGBWbrqwloHozy/UlmmOgbDlxtoZfADdr/MaxNTisRcDxQrrdWf5VAOc3YT
	 66Ei8mgC0dralqWAuaojmlitCXlh5AANM8O9kgVq9M7xIE/LWptU4fiRK+TWLeQVAE
	 b2nzMBGup9q9NAFU5Ck9/MfiDCQQ0UwRrIhiOnoNmYqVoOh8I80W9M/h9KIAQgZqOs
	 zYCcFXTD8EYyQg9VXYQxhSrbCFKIr5NNSLmTYWxoBghR643ajpgpXxtMbVhDBHtJMq
	 SNBIw4dNGDzRA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 02 Aug 2025 12:51:51 +0200
Message-Id: <DBRVV7MYEJD8.2LNT14LTDOXSE@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
Cc: "Igor Korotin" <igor.korotin.linux@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org> <aI3VN8WxZeu_DN9Q@shikoro>
In-Reply-To: <aI3VN8WxZeu_DN9Q@shikoro>

On Sat Aug 2, 2025 at 11:07 AM CEST, Wolfram Sang wrote:
> Hi all,
>
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index 4f03e230f3c5..767beaa0f7c2 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -11514,6 +11514,13 @@ F:	include/linux/i2c.h
>> >  F:	include/uapi/linux/i2c-*.h
>> >  F:	include/uapi/linux/i2c.h
>> > =20
>> > +I2C SUBSYSTEM [RUST]
>>=20
>> Has this been agreed with Wolfram off-list? (I'm asking since I haven't =
seen a
>> reply from him in v2.)
>>=20
>> In case you just did not receive an answer yet, it's fine to proceed wit=
h a
>> proposal as you do here. However, please make sure to keep Wolfram in th=
e loop.
>> :)
>
> Thank you for pointing out this thread, much appreciated. I think (I
> hope) I said previously that I am supportive of the bindings in general
> but I can't help at all because I don't speak Rust. Given that, I am
> more than happy to see this MAINTAINERS entry for Rust I2C. This part is
> definitely:
>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
>> In either case, which tree should patches flow through?
>
> As long as you don't touch generic I2C header files, I suggest some Rust
> tree. I guess patches will have more dependencies on what is in that
> tree.

Maybe it would also be a good option to take PRs from Igor? I think it coul=
d be
a great way to get in touch with some of the Rust work over time without ha=
ving
to commit to maintaining it. (Of course, this is entirely up to you though.=
)

While I encourage the above, one fallback alternative could be to take patc=
hes
through the driver-core tree -- at least for now. Given that this is a bus
abstraction and hence most infrastructure used is generic device / driver
infrastructure, there's some synergy.

>> > +M:	Igor Korotin <igor.korotin.linux@gmail.com>
>> > +R:	Danilo Krummrich <dakr@kernel.org>
>>=20
>> If you'd like me to keep an eye on this as well, this is fine with me.
>>=20
>> > +L:	rust-for-linux@vger.kernel.org
>
> I think it is worth adding the Linux I2C list here as well. Other people
> there do speak Rust.

Agreed, maybe it'd also be good for you to be listed as reviewer?
