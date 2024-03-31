Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD914534E
	for <rust-for-linux@vger.kernel.org>; Sun, 31 Mar 2024 19:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711912650; cv=none; b=I2iMD273xrUE82cT6snx+Cff9evBwWYJxf829Tp/grkCpemcY8Aqiw63EQWIbQb+5pk5bpLuasevGrRwcM5izFrEanb3srzGwai34RsoKYncccnSv0EThFTecF8uB/wfEQBMPrxtICv2j7vFND0lFjgBVmRDS6dL4RfQSi/X/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711912650; c=relaxed/simple;
	bh=SYmvik/fqHvEzHm6pvkK7TqfWET1zzN3no8PyXvMmc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAkqiYxJWFOVItxZfsYylVHqOVxg9qsbzUwSWYnfGGtNijPV8zGaNLSahOb5o3eJS/6vIwUpEb5v7SsqoVinbCNzuVbJHuyWKGwSo/YdKRQnE6r8pj6ye7VI/wasndLFkXXv/vjEqmdQ1PaBIE539kpZiANhiXp5FsayVl3KEaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wv9jGN/a; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wv9jGN/a"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d718ee7344so29168671fa.2
        for <rust-for-linux@vger.kernel.org>; Sun, 31 Mar 2024 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711912646; x=1712517446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ/Wgmylc8R9Vu7/stPvLAUd76qAZ8Jvq0rKjpMVKY8=;
        b=Wv9jGN/aABCZG1zMEfAT6e6l4zIhTNApnMLcJzXT6RO3q38Jm6DB7chGkRQ4rPOhiQ
         6bkzyiU/C4Y4tILZFlm6/OF2TRaOt/Q4nrgQIFGw5O5fZZKQ2bnjFnuIojLEaT/+RTj8
         qpXA3SeFKoUpy+JKHsMI1Kg/Vx0xyeMMq1Z1ZzI32t8IY+KDBEaLUIoDovttmjdMqWRc
         rb99SWkOWoutRXu51wd0ql/Uo6ePcr8egRs6j/fKmoceSLFKLW2YCnMtrWzSMx9f2oiV
         8REvl9mAC4CSO7QhxTNTtL5wDWOgcLbzENiUlTePnolSuPEKu31LSeh2PQPLCIO/04Za
         Nqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711912646; x=1712517446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ/Wgmylc8R9Vu7/stPvLAUd76qAZ8Jvq0rKjpMVKY8=;
        b=vKF2GwAfsi18H1nN2rrv5fNcnpkKy20QPbprgSBdumyvGzK9OwivF4DO2mWEMJ8c2H
         TkiE011+izsJkI6VUaHtVQGBScAbfb0LTzk3dF+RC4RubfXlwbdsrO4sMtNkP4qvHVzM
         lBmOuP+gfIaEvsPgaSz6E7prKQyEjlpZjVJRRh4MdF8h9oeuJAtb4x6ZHwZ4FReY+wnX
         TSEHltviLylUVw3soS4l+FidOUteCbH8wTXixg5w1Xwd2sKq9OjsNnus0JmdLd9XLcOp
         6DF0FiBrrme0asfu4Tkd1HbTVuPaR5qzxq8WAu7/0Gzi5sfoRR4b1daF9jSGttQwk464
         xBeg==
X-Forwarded-Encrypted: i=1; AJvYcCVz7kxV39AhHfcYHcJaSPpAIJy+2mENFNFdizEZWUyNdK9Ap3li4n9mDe19qhYnFQNxA9l8DHZvqfnHS5zlTSDz7LfG5wvyuHyALWw9koU=
X-Gm-Message-State: AOJu0Yys05vOm2S4m+stUJm3T38DfcmwU0UPYg8Nyvp+HsHzrgwAfjGW
	UpI978HD7K3PVPz+uWSF2UwM3722f19T+2JsM5a2/USyML2VZwggQAm7B1TQyeazp5ej40NuKj7
	cKJW1Jq3NpiBWgcY41ovaVH63gsuKg1pf30TUzg==
X-Google-Smtp-Source: AGHT+IHpOYLCBQZmMac/uuUyrUixnaKLgKA0eykw1mNyLzYNq/N1jRkXAkWnDujHj4Yyh3oFmyzXRYGwcKcWRj2UlbQ=
X-Received: by 2002:a05:651c:198c:b0:2d8:15b1:7256 with SMTP id
 bx12-20020a05651c198c00b002d815b17256mr1067114ljb.4.1711912646151; Sun, 31
 Mar 2024 12:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-5-dakr@redhat.com>
 <2024032530-fester-dedicator-a8a9@gregkh> <CAMwc25ryKE7tqA4WdOeQXWJJ5Z++s+p8=bMBAXPKQiw_Stov0g@mail.gmail.com>
 <2024032601-deceased-premiere-1c02@gregkh> <CAMwc25omcj6_OKdcBkke5yzC2M5oNO=E3EG4aezNfEMRAp9Wvg@mail.gmail.com>
 <2024032606-dutiful-tusk-5da3@gregkh> <CAMwc25ozHGVS5jE3QnDx7EgryL+=dCdUbm6PNBcsy5P8CtX8Lg@mail.gmail.com>
In-Reply-To: <CAMwc25ozHGVS5jE3QnDx7EgryL+=dCdUbm6PNBcsy5P8CtX8Lg@mail.gmail.com>
From: Fabien Parent <fabien.parent@linaro.org>
Date: Sun, 31 Mar 2024 12:17:15 -0700
Message-ID: <CAPFo5VLoYGq_OgC5dqcueTyymuSCsLpjasLZnKO1jpY6gV7s2g@mail.gmail.com>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
To: David Airlie <airlied@redhat.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, rust-for-linux@vger.kernel.org, x86@kernel.org, 
	lyude@redhat.com, pstanner@redhat.com, ajanulgu@redhat.com, 
	Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[re-sending as plain text instead of HTML]

On Mon, Mar 25, 2024 at 11:35=E2=80=AFPM David Airlie <airlied@redhat.com> =
wrote:
> > I don't mind 50 patch long series, those are fine as we can see how
> > things are actually used.
> >
> > But for complex beasts like DRM drivers, perhaps people should stop and
> > implement the tiny "easy" things first, with working users, to verify
> > that it is all ok first before biting off the big ones.
> >
> > Like implement a "simple" bus, which means that you have to have the
> > driver core bindings all working properly and correctly.  Once that is
> > done and merged then move to the next thing (i.e. a more complex bus
> > like PCI or USB or platform).
>
> This is just reintroducing the chicken/egg problem. Implementing a
> "simple" bus usually means implementing a "simple" driver for that
> bus. Implementing a simple driver for that bus often means
> reimplementing an existing driver that is already in the tree. The
> "simple" bus driver gets pushed back on because it's duplicating
> functionality that is already in the tree and nobody reviews anything
> and we re-enter the deadlock cycle. We are actively trying to break
> the cycle and get stuff upstream so this can be properly explored
> rather than 20 independent trees carrying out of date patchsets to get
> anywhere.

 I've been working on a new driver [0] (not a reimplementation of an
existing one) that uses I2C. I2C is a "simple bus" and the amount of
commits is quite reasonable, maybe this would fit better as a consumer
of the device driver abstractions for upstreaming purposes?
The work is happening here [1] and is fully functional. Right now the
branch is not based on this series but based on the device
abstractions from the old `rust` branch + a few others picked-up from
the `asahi` tree and the mailing list.

[0] https://github.com/Fabo/linux/commit/64a35401316aa9d77490eadb7c4bb731c7=
901f69
[1] https://github.com/Fabo/linux/commits/fparent/rust-ncv6336/

Fabien
