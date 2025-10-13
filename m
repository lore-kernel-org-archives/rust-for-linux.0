Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA462C0F87
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382204; cv=none; b=SuPTDTEwAy60bG1+yKCZol4YO3nldN2Z/dRtt5+iO+g5PIkz2X6apKX6JAlMDEbO2H7fGaGD/sP/9+iE5cYx8Dy1wJsJFWM9IAVco88m3W65ywDNGc1u1bWlTOyjba7ag5xAbQxSESKy2/GuqJmMpfWq8hmtfi9BF9m1ts8GpnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382204; c=relaxed/simple;
	bh=k2OWhU1lGGwJ3iHr0MRl7hFteOM1d7W97pCqpxIyPdA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fz7U9AYmQbsP1gJgj2IEQ6dMYs/7mJvE1J3r8QLBFE1y3qXG4Zh/M4/8lGnfX2UjQXR/l2POQXyesGNJV7A2h4zyYmm4tmN+VyRvjYIrx3wWrzpT1ju10ApVr7UlH/aXlgR4vxFunB7tzQDf467WmReUQE827BOgxR/K07kYb9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=pjWeBZ0i; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="pjWeBZ0i"
Received: from mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:290e:0:640:f317:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id B430181282;
	Mon, 13 Oct 2025 22:03:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 63UdC3TL5Os0-OnU847Gd;
	Mon, 13 Oct 2025 22:03:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1760382190;
	bh=WCzISYGccMu5qhMqmS75TZUU/EKntQEWIbpOVk9rLuw=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=pjWeBZ0iQUZXKpri74Y6cg+fZeaEo6vd0gULnpFI8+jaHufoEwqSINtDtFrwEbEGT
	 NLnL7Ers47otlQqE+GhTRS7K8cEHCEm5j9XI85ud0Klm+Cijzqvv01f8Mm1GTzZoXs
	 rON/og/eWj4ufO7qtM2utUgs+VAzbYgTm3XMivuo=
Authentication-Results: mail-nwsmtp-smtp-production-main-94.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 13 Oct 2025 22:03:03 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, tamird@gmail.com
Subject: Re: [PATCH v3 2/2] rust: drop `error::to_result` and utilize
 `ToResult`
Message-ID: <20251013220303.15f95186@nimda.home>
In-Reply-To: <CANiq72kvNWT1fXYkXUwmyC5jHfYufdx+koD6Y2xsWzE9YhLLEg@mail.gmail.com>
References: <20251013124139.18809-1-work@onurozkan.dev>
	<20251013124139.18809-3-work@onurozkan.dev>
	<CANiq72kvNWT1fXYkXUwmyC5jHfYufdx+koD6Y2xsWzE9YhLLEg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Oct 2025 19:04:09 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Mon, Oct 13, 2025 at 2:43=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.d=
ev> wrote:
> >
> >  29 files changed, 253 insertions(+), 210 deletions(-)
>=20
> Something like this will be hard to merge if we wait for all
> Acked-bys. It is best to do the migration over time and split it per
> subsystem.

Sure. To do that, I need to keep the current `error::to_result`
untouched. I guess that would be fine.

> Also, you should Cc all the relevant maintainers/reviewers -- you are
> touching quite a few subsystems. :)
>=20

Right, sorry.

> > I haven't included all the improvements made possible by the new
> > design since that could conflict with other ongoing patches [2].
> > Once this patch is approved and applied, I am planning to follow up
> > with creating a "good first issue" on [3] for those additional
> > changes.
>=20
> I would suggest including a few examples of the improvements in an RFC
> patch on top. In other words, we need to show the improvements (or at
> least some key examples) to justify a change, rather than doing it
> later.
>=20
> For instance, with the changes in this patch, I see a lot of `Ok(())`
> added because now one needs to discard the value, which isn't great...
> It indicates that the common case may not be keeping the value, and
> thus we may want two APIs for this.
>=20
> Thus, similarly, we may be able to spot a similar pattern in those
> examples too.
>=20

Thank you for your feedback Miguel. I will wait sometime to collect more
feedback and then I will prepare an RFC based on all the input. I would
feel more confident sending the RFC after receiving more feedback from
more Rust kernel developers.

-Onur

> Thanks!
>=20
> Cheers,
> Miguel

