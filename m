Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3704535F170;
	Wed,  4 Mar 2026 16:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772641093; cv=none; b=gM14WBhwx1xucgYFQTOLolqJK2QBEHlts1GKZZ1ernLxx18Wfc7aUJnwapn8P/grog49tr0sEDydM3HDhPsLEryUaTsDu560bCTfYjSwJ05Mlmcl0bHCC71B8ULBnQ/DCVqc2He2aVQ9aKTMN1rmcKGOQX57ULOklT8LXoIUziQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772641093; c=relaxed/simple;
	bh=5p/5v6t2rr7Z7bDzsGSHpNhN199WTAKf1G5yx+mYi60=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ILU4rexlObQLdJ6f+s/H6SMT0KLC7JTytfvkUInfYrbYK/1WgHPqSbZ0qTInUA/xnMiAZg9sL0fnOLYV6vEH3D0Ti1d0DglA2mOgXjMQ0XoHzW/Jx6dQg42SqsycAoFizCtDqy74Old6t1CipShnbILO/8iS0AXNaPUarGd7cNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSehqj3W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSehqj3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB7DC4CEF7;
	Wed,  4 Mar 2026 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772641092;
	bh=5p/5v6t2rr7Z7bDzsGSHpNhN199WTAKf1G5yx+mYi60=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=DSehqj3W22LDT9gZforPHOxf1eYJaDDdTVvciGu2puP0S8rnOuJKf+DH3WpnW2Wnl
	 EYZsGDxQcKPvfIzdN1IRvNGQCp4ay7abnXdRe+2U3wyodPksnptBanRl2Jv6OWa1qq
	 v7IW3a46UcsCkY/Sv+dUrWS7Xh0Pt/HeM3/Cgh8WVk+uMQqXFVgrlPq9MlTFBXgCKf
	 87skIMgYGiEzitcJjTvkVxIqS3HYSsLMqrfOSz6N2IRZmmxfRu5kJNm0B9+rSH31ej
	 PH4WqY2A/kRC6FXVhpIRfZg08F+3SDW3vstAMoGuBmjQX/fHb0d/YzQt1eVDRTBYCf
	 ltZ8ENFZ6AUIQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 17:18:07 +0100
Message-Id: <DGU4TLDMLFN8.1KKSL2WATFZ7G@kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
 <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
 <DGSC6U50TCHF.9FKDO3AWL3Y1@garyguo.net>
 <DGSZWZCI0H7H.2EM8L04YH0YRP@nvidia.com>
 <DGT09KTYDCU8.3BBAZBGIYRGWV@nvidia.com>
 <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>
In-Reply-To: <DGT8FQ97BL8O.1VC1JEXIEBDRA@nvidia.com>

On Tue Mar 3, 2026 at 3:55 PM CET, Alexandre Courbot wrote:
> So, to get a better idea of these two options I have converted this
> patchset to use the 2-arguments `write_with` method. Here is the
> difference between the two - it is particularly interesting to see how
> nova-core changes:
>
> https://github.com/Gnurou/linux/compare/register_1arg..Gnurou:linux:regis=
ter_2args

This looks good to me, but the fact that this turns out nicely has nothing =
to do
with write() now taking two arguments. I.e. there is no reason why we could=
n't
have the exact same write_with() method together with the single argument
write() method.

The contention point for me with a two arguments write() method still remai=
ns
that the arguments are redundant.

I.e. you first have the location in form of an object instance of a ZST (wh=
ich
in the end is just a "trick" to pass in the type itself) and then we have t=
he
object that actually represents the entire register, describing both the
location *and* the value.

So, let's say a driver creates a register object with a custom constructor

	let reset =3D regs::MyReg::reset();

then the two argument approach would be

	(1) bar.write(regs::MyReg, regs::MyReg::reset());

whereas the single argument approach would just be

	(2) bar.write(regs::MyReg::reset());

So, if I would have to write (1), I'd probably be tempted to implement a re=
set()
function that takes the bar as argument to hide this, i.e.

	regs::MyReg::reset(bar);

I also can't agree with the argument that the notation of write(loc, val) -=
 or
write(val, loc) as the C side does it - is common and we should stick to it=
.

This notation is only common because it is necessary when operating on
primitives or when the two representing types are discrete.

But this isn't the case here, a register object is already distinct in term=
s of
its location and value.

So, unless there is a strong argument why this improves anything on the use=
r
side of the API, I still feel like we should keep write() as is with a sing=
le
argument; having an additional write_with() method seems fine though.
