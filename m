Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248EF258CD0;
	Mon, 17 Nov 2025 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763375578; cv=none; b=p6jwLdMyvrmk3BWUxMxr2wrPLzYa/iHhRg2pJO+8gBP8XA+4kURnmEnGPgLC+6t/TjNcjRLlJ756mbti+y3a2IxB2fV+aCUGW20bxC1X+LmFAUkRZ3mMpsRzOXtjiaum5o/rr3eFCwchre4Q/nqFzEq2d78DhPnGqOB3ztx3Hok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763375578; c=relaxed/simple;
	bh=aF6Nr+Vcdl599MsM/JCZgonmxBvML9jaegR4b4F3ue8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lPzM2Bzmyaq7ideAs+6SMwDPs4sISoaYb/2TlA41Q9hGZ4KQUAlchLunzny0zdMbHw9G0y24nOuQv1xnMQyfHJcd7nM73pZSxGAFstP8Fj9R6RKt1r/tr6OTRB7hsncsxSGoe/TeGpXz15h8YZUORUXJXSh/BWizIUdQ2ZDehq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=ONDk+p82; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="ONDk+p82"
Received: from mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:4f41:0:640:844:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id C95A9C0A66;
	Mon, 17 Nov 2025 13:21:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id nLRZT5rL3W20-Ehc5E1cz;
	Mon, 17 Nov 2025 13:21:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1763374913;
	bh=Ig6NGs8607itnXq2NoXGIXNi0i/2atJv5AtsqE9To2U=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=ONDk+p82tj99ybWxImohHnQY4u+47LXDXxMeIgmAIutAjhF6n4cLGflarpYPAQ9Qb
	 jQs2PViaEFqS7GsOOZ/rTr3zp4sVZIQ50wrTALffY3q7ZX9d92tLilYX3opwba3KQe
	 6bLFGLgsQj03byaCW/TpAUm7+H3TGQdf9ZKEAxSM=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 17 Nov 2025 13:21:47 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] rust/time: Add Delta::from_nanos()
Message-ID: <20251117132147.07424ca6@nimda.home>
In-Reply-To: <CANiq72nueMj-4nmf=s44=AskbRFzHDQgmqfd12Jo89CMyySOnQ@mail.gmail.com>
References: <20251114184207.459335-1-lyude@redhat.com>
	<20251116093805.7918b83d@nimda.home>
	<CANiq72nueMj-4nmf=s44=AskbRFzHDQgmqfd12Jo89CMyySOnQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 16 Nov 2025 12:06:41 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Sun, Nov 16, 2025 at 7:38=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.d=
ev> wrote:
> >
> > I wonder if it makes sense to remove all the `from_*` functions from
> > `Delta` and replace them all with something like this:
> >
> >     pub const fn from_duration(duration: Duration) -> Self {
> >         Self {
> >             nanos: duration.as_nanos(),
> >         }
> >     }
> >
> > What do you think?
>=20
> `Delta`s can be negative and only store the nanos -- i.e. there are
> many `Duration`s that do not fit in a `Delta` (`as_nanos()` above
> returns `u128`).
>=20

I didn't know, thanks :)

> `Delta`s are similar to `Duration` in the sense that they both store a
> span of time. It seems reasonable to support similar constructors,
> since they perform similar roles and we may not use `Duration`s.
>=20
> Now, I agree that other types should not start getting things like
> nano parameters or `from_nanos` constructors -- they should take
> `Delta`s instead.
>=20

Yes, that seems like a good and simple improvement.

Regards,
Onur

> Cheers,
> Miguel

