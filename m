Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7962DF134;
	Tue, 18 Nov 2025 19:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493122; cv=none; b=R6HYW0gU9edgylt92jdE6VRpRiAyZyTrb2Ng83ElGtlT0f5xDmF6xw/3oEcpqUKS/CRZQYq8YYhyDGRxi9WUsIicryK0KwHh6XifRq4x292Ic9RNoeca4fyj2kRYRHW/XAxNM8QX2wAQ41NB4gZidVsAZfjaSsTi9r+OPFkWMCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493122; c=relaxed/simple;
	bh=l2fYwGFWlIEufuEKRvAwBbF9fZw07CYrmG34lJeRu5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BnqGktwMLIxpX3+y9fquTBhnrVn223ZL4KwL0HdiKve8TvlMljTOmHyd7iQipD2KSyIBjwM4l/C34AesYacQpT3vxoYrZuEtS4wOMSHcOTtHZERT7t1DZsMhYSzD0Fq1/HUBcgaestkJ1yMELD8IMMisfMvb9GI/aSsFPEq5AZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edKUdFXW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edKUdFXW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37364C2BC87;
	Tue, 18 Nov 2025 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763493121;
	bh=l2fYwGFWlIEufuEKRvAwBbF9fZw07CYrmG34lJeRu5Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=edKUdFXWswXk8KgGZ2FEUOaVUeIMBROcqQIEBDoxyq+0pk4vYaVEH8snwmywGYczG
	 JESsGtYs5pas6wSK9rfghGcfwq822QPRG4r+Uz/8oe1hGFI02CmRG8baQppmP5xmhd
	 wFN8JPX8Jqt6rNDOi93P7oHAyioypMxx0biw6CyXJ1qr2AZ84Oq5HgW+ZdCFvlZ0dr
	 skOQ2rmt4vYwjTmPWdRlPbZ5UBDYAEOYqb01jGdlWM/sTNhyfpUHi96oKuu/OSu8/P
	 rLnvd/PYFTsSmaqWj0napFkbRw7fSC7sm3cn5FHLp5An4KnOjUnaF3WADz6E0hytGF
	 BZENH+lnEmZ4w==
Date: Tue, 18 Nov 2025 20:11:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Alice
 Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Benno Lossin <lossin@kernel.org>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, Danilo
 Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build
 wrapper
Message-ID: <20251118201152.038e2749@foz.lan>
In-Reply-To: <87seeb47pk.fsf@trenco.lwn.net>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
	<a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
	<CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
	<kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
	<87seeb47pk.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 18 Nov 2025 09:38:15 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>=20
> > On Mon, Nov 17, 2025 at 10:20:46AM +0100, Miguel Ojeda wrote: =20
> >> On Mon, Nov 17, 2025 at 10:13=E2=80=AFAM Mauro Carvalho Chehab
> >> <mchehab+huawei@kernel.org> wrote: =20
> >> >
> >> > The makefile logic to detect if rust is enabled is not working
> >> > the way it was expected. Move it to be inside the wrapper
> >> > script. =20
> >>=20
> >> Hmm... Could the commit explain a bit why this didn't work and why now=
 it does? =20
> >
> > I don't know exactly why this was not working. =20
>=20
> I would feel a lot better if we knew what the real problem is before
> applying fixes for it.  Otherwise something seems certain to come and
> bite us at some point.

Me too, but the bug is very annoying ;-)

I'll try to seek for some time to better understand it, maybe
next week.

Thanks,
Mauro
