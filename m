Received: from smtpout10.mo537.mail-out.ovh.net (smtpout10.mo537.mail-out.ovh.net [51.210.91.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5399388885
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 07:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.91.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790142; cv=none; b=XEflauy853kBq6QKhwotVLlQPdnNtlPDYCbV71Uh6zINzt4v7JR6BJ9iHK20qQoGuQY18gxTGSgntnwbDfxC633Kkr/+ceJlD/eAHQuq8EPFkgyNpHA0sIjxDJDwxjB4DU/VECl/yBWjZDzU4wYDnUYE0gVMAqRXFwjepR/oJK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790142; c=relaxed/simple;
	bh=lMQLCAwmv3R4vR2qIrb5qpm1ig3FWzezlb5CjyNsWHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTPrt2FszpH8Kbk5hT7AN60M4DZn5mxI307d6kOZw1eGkL8UXP8Wq/f+/hJpBanoXFM1gtnESRMoLb4jKRktCXiLg3BZn7QqNAY3RoU53AaA/B9NxcZ+SIvS6AHiw3BzulbnmKx78EVQlebtMHMKoE4BgsrTaqY4sfYTtGKKj3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu; spf=pass smtp.mailfrom=npnm.eu; dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b=lL2n0605; arc=none smtp.client-ip=51.210.91.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=npnm.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b="lL2n0605"
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [79.137.60.221])
	by mo537.mail-out.ovh.net (Postfix) with ESMTPS id 4j37tn4BT7z490j;
	Mon, 12 Oct 2026 07:11:45 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <daniel.almeida@collabora.com>; Mon, 12 Oct 2026 07:11:45 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.37.103])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4j37tn3BPdz6MYl;
	Mon, 12 Oct 2026 07:11:45 +0000 (UTC)
Received: from npnm.eu (unknown [10.1.6.7])
	(Authenticated sender: laniel_francis@npnm.eu)
	by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 3034DB81F8A;
	Mon, 12 Oct 2026 07:11:43 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-104R005fcce540a-157a-4ea9-b25f-804a47fc2453,
                    49321548602EDEEB7E8F78B99E4F89B1D2AE6B16) smtp.auth=laniel_francis@npnm.eu
X-OVh-ClientIp:149.102.245.166
From: Francis Laniel <laniel_francis@npnm.eu>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 Thorsten Blum <blum@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] Add NonEmptySlice
Date: Mon, 12 Oct 2026 10:11:42 +0300
Message-ID: <2854339.mvXUDI8C0e@pmachine>
In-Reply-To: <DM2FHZGKS6OA.W3GBZJFVVIVY@nvidia.com>
References:
 <20261011191540.56199-1-laniel_francis@npnm.eu>
 <DM2FHZGKS6OA.W3GBZJFVVIVY@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
x-ovh-tracer-id: 9813625064122361302
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE21jOL8mLTsDuZgCpO3Kkl8EC2AbeUwvuGcf+ytvLNM1XTBpuga13YC4eXXP/gPYP3wynOnyyeG4UaX7E1n4OFCktbsga2cxpxBE/+BDPqU/ZWL9suCEuQ79Ihx85FuWpisBsbaZZGIm0hWlH9UbwYwgtzd18CoK+tK4EToRZg8LRFjHMeszf1WXfHmnDJQtLqjF5XRsq2sfQ1jAwkEwFWB0vV5Fp/342yz2Mc4YmIzQraL2Od9Yt01koEEKqiqmM60+E+ax8z0ubDJL7rua92D2opQ1M2bUdh79FpaT0BE36F34Io7AEv4lOwadvZNjAbdfS7FX0ZUomlDEgJhUIfWHCsj6+SbQ9WpgxsiesHVVxScv0CwY+zBvtp0kuoFvUOqLgZZCB5E3+lCYEmU4ge+tLZH6DTJOnyuXpH5n2d0AZs6u0lGSjCAjXkJU2UlSARZPxB3NRWjJkvcFO9+B6bVaqqoaAQ//d+bleDtYTxiJj+ZjymAJBJglyiJ2AhspOmnnll2uZBVmdTJuMKhassJqKjTHpT9csPPwUtInGXWyD70PSU7PxeaqstipqpveK/SxukZ1yzQokaDR7ISILfiZGqTDok+MKe1oGUi/eHwr8UsMyATIgcOyGyCIO973LEaarmzIIkT06mcyQQCUdbwp996ivB09iF8P9SHLFGaw
DKIM-Signature: a=rsa-sha256; bh=lMQLCAwmv3R4vR2qIrb5qpm1ig3FWzezlb5CjyNsWHw=;
 c=relaxed/relaxed; d=npnm.eu; h=From; s=ovhmo-selector-1; t=1791789106;
 v=1;
 b=lL2n060516ErZlzodDXqZkYrZWW0yBYAmcgcwn71arZk8V9NtHnquD0p0gC9SnibawpkRwoe
 cK90rTdx98KknHkKsaqAUQT4n1fWKSzIzG6TdFRwSrQQQG0xqvIVwNmc/ph83i3Hy8ea89f+mMk
 51O/d3b5dNr0CM+FRduiStlXHhAkprFmye4/aWm98kQ9+zK+wlED8gMMRtdnOHuzx3WDuDb22Sa
 cQ5FIfGjfJjI+sONScE7NR5HcXSqe6Dkvmf5fNOH4S9WCeV9LAkLX4WQwZ69Ge5W0TMG6/+Qom/
 IScSo9cbcssqYGRFxaOHL0SxR7q6InruA4HziKw5kliEQ==

Hi,

Le lundi 12 octobre 2026, 03:21:21 heure d=E2=80=99=C3=A9t=C3=A9 d=E2=80=99=
Europe de l=E2=80=99Est Alexandre Courbot a =C3=A9crit :
> On Mon Oct 12, 2026 at 4:15 AM JST, Francis Laniel wrote:
> > Hi,
> >
> > Following the discussion in:
> > https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@garyg=
uo.net/
> > I wrote some code to add a new NonEmptySlice type which ensures the und=
erlying
> > type is no empty. This way, caller can use first()/last() without relyi=
ng on
> > unsafe.
> >
> > For now, only new_mut() and last_mut() are used in uaccess.rs. Please l=
et me
> > know if I need to remove the other functions from slice.rs to only what=
 is
> > needed.
>=20
> Thanks for looking into this, but have you seen [1]? There is a Github
> issue opened with some comments [2] and you might want to coordinate
> with Lorenzo about who is going to work on this.

Sorry, I went faster than the music! Let me coordinate on GitHub with Loren=
zo!

> I'll try to comment on the code later today.
>=20
> [1] https://lore.kernel.org/all/CANiq72=3DrwnogLqmpxnsvhsPWX+mBtH62=3DYu_=
avQEYEmkWSVidQ@mail.gmail.com/
> [2] https://github.com/Rust-for-Linux/linux/issues/1262
>=20

Best regards,


