Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F131957FF
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749920925; cv=none; b=uKDaGyQ+i2ZRBInG9RoObDKTI91EkcsHEvd+e9sIyXAi4bbRL+kwjQi96MV35uiUUXUl2HKH8vmmETtQfJJIbZ7I05Jw/rwMUSqR0XKDGeY5L7R145QrNoKvM2FWYJ/XryCD7MDdUcxauvg0KDUE9J61Z66EP9LE0nxsrtDuELo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749920925; c=relaxed/simple;
	bh=3A6Fv60ZnbB4gj2rk4YkT51MgDHIkZ3NkK7spT/h5pA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=ojC70YYHF4pYY09qMlGRibelx09FEqN71zPCJmU7KpiDSPvtybZcwmrJaJs4woMGb6DAkCqFlLDdnEv0t5Bccr+roF0QVl+xOh4cywLUod0euReolCSbi5m5kU2QAr7V/4d3mZoCvV8L02bP1tTcXQ+HKj+7HYObYK4v9/1U7Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc66KU9F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc66KU9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9014FC4CEEB;
	Sat, 14 Jun 2025 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749920924;
	bh=3A6Fv60ZnbB4gj2rk4YkT51MgDHIkZ3NkK7spT/h5pA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=hc66KU9FoS//CtvqeYOAYsJ/0GdmLO5Q+Fz2HlLS2mFuWf1BVf3bHgXWujFsDUpxZ
	 AzhgBFsB+WmzAtDnJ3zW9P5vpQNM0ecTZC2JPsb74ruw9eX7piV4cNFetajp1ihV0Z
	 qbzxzfuhNdc5r808Y27o1DD829TbECCy0/xI3KEvyIkr3FNZVh4RGBxoOLwkBwLi60
	 UXmvNR/M5Emus9F3xdthdfpXv40Sy1ZxPzwrhuzIK7ci9JOJH85urlCuZ3lkJpeyh7
	 605HROIsJMk1S88fxVViAt5utsKFn320/ukhbmy1/ek2PBYl/oBnJe9cRy5+BU8rRB
	 ue7sTaNvIWUOw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 19:08:41 +0200
Message-Id: <DAMF71ECD17E.7C58IZHG946V@kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code
 tracing
From: "Benno Lossin" <lossin@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250609223606.2897030-1-ttabi@nvidia.com>
 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
 <123f682b56e1ecc24bb2dcc351f536641920fcf0.camel@nvidia.com>
 <922a39510eb74ebb2e463d20d7d5cc5c23316155.camel@nvidia.com>
In-Reply-To: <922a39510eb74ebb2e463d20d7d5cc5c23316155.camel@nvidia.com>

On Fri Jun 13, 2025 at 10:06 PM CEST, Timur Tabi wrote:
> On Fri, 2025-06-13 at 14:32 -0500, Timur Tabi wrote:
>> On Tue, 2025-06-10 at 10:45 +0200, Benno Lossin wrote:
>> > > +
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // [`.as_bytes()`] does =
not support non-ASCII filenames
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert!(FILE.is_ascii())=
;
>> >=20
>> > Also here.
>>=20
>> I can't get this to work, either.=C2=A0 I've tried all sorts of things, =
none of them work:
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert!(::str::is_ascii(FILE)=
);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert!(::core::str::is_ascii=
(FILE));

This one should work (you still need to make the `assert` use a path
though).

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert!(FILE.str::is_ascii())=
;
>
> Never mind, I finally got it to work
>
> 	assert!(str::is_ascii(FILE));
>
> Is `str` not part of the `core` module in the kernel?  It seems there are=
 slight differences in the
> module hierarchy in kernel vs. regular Rust.  Is there a document that sh=
ows this?

The kernel uses the usual `core` so `str` should exist. What's the error
that you get?

---
Cheers,
Benno
