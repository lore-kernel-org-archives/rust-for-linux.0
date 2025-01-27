Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A61FDE20
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 11:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737977689; cv=none; b=lXXNXxEHSOV8W3u46/eV+HQOLKOziMEOhWCwvzuPoezrlIHmEiRgb0yYga13ab1LB2PKstmbAJ9lNbNz7rfcBAifvNLv9nPXvLO/5no4zqhE75lTS5xDNsunFibpoHZxqsrad1vkAFvNlGe+y1gDol9B7rclg3J1jyEquWxHOMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737977689; c=relaxed/simple;
	bh=gNVtdgapZ5exCANsFWbc3cXypKKKyoCZB+fVUU/rAF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4qCsrkT7yJWOpONBn7GWZPzOxIURusWCy2xf+zQOhJjZJdlRd9A+23ozTE9fxnnZR1qeaugocyNr7iZKTOwWESSU9i/TckdJHHi6KpLT6iRXTIQgGUn32fn6VmduVtcbcZTIzsA63giXhFm+hf2vv2Y0JkklQPPQv9IVp9ElWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GY2DXmGX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GY2DXmGX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3863494591bso2385167f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 03:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737977685; x=1738582485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNVtdgapZ5exCANsFWbc3cXypKKKyoCZB+fVUU/rAF0=;
        b=GY2DXmGXKdbsN6uqr9ylGg51xFW46z2Qkn75MbrmhHWCawPvohHshb4DKFxNx/zqIb
         Q7Yxd2HAt738CiNvJ7frWoAqEQtQiESuAP7xtcvPM1Ixx9+z0d0HVpmRbKimAbF025GB
         AnEC6HLvptkncFQTs3dUPO0XVAd5kiDEcgL/fwmfmGPgLm4xbFVIMEgD5wpqJO/Ur4dM
         pzdgfw9fZOCF/pdHjwWK5wha1K1KRvWRzcggP452l/fMW1uM4zjgWiqNRws/6hoZZ2eb
         +ORJpHinOmew9VRdICrhdF12FtoSzmv9GpRa6geNMz5tZ8QO4nRn3WpSs81wwN1RUQDk
         HcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737977685; x=1738582485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNVtdgapZ5exCANsFWbc3cXypKKKyoCZB+fVUU/rAF0=;
        b=B0yuwB2U7J6QCGpGqcbY7/6zJXL53ov6oV6hI9kwsrC4AaMbnMQHkIn77vIcVwSWxt
         rw5lSkpNbcwrUe3bQE+vY16CkW7WaoVROa6X8vOMmOlwVrJBrPQ+fC+WrE1AjVe6sJO9
         9nVxKU0rmobvwWy2sm6+29MD4Bb9qAdRyUoIVmGItgQQg5XPvebpkYWCWTNb03AQ6G/9
         g4KsI4j0OmbbuibdcqMfVxN4oS7ooRiwpKbKbdAQvEJ1ZphCw+NnLxaXIcSpobGB7E2z
         iopzaWxgU87LeAX6xrb/3o+s1rxQs78L282/amFv9lNXZ1g7L/WNDTBfivYpHepUr9bb
         rZAA==
X-Forwarded-Encrypted: i=1; AJvYcCUSwuJjPiTkH1Wtqn7BnMSAh8ZeAWzm388fywbhvFFi/wmGvG8cj5vwodD2eo1Y4LovePiKamA8z9MABbSSdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNt9r6zW+GSaAzVUUnWX88HxAvt004QZaWBPMlOgajn+f24gOI
	1FLAB7xkXSOZLZ6o9wYNlF0c2MYQZA0ozDiAW7dvXl+jzYmU8+CBNH5gVVNAJ34ABRGzNzB4AKa
	IkmcqxdMRPaER2KSM1RVudFoIVNCe/AVz3CMJ
X-Gm-Gg: ASbGncvKnjdjBWT/mNt98hLfJqnDPOdcIKCnswHjCMra/Z7OwAiafOQ4Htuw7JyUfVI
	aHN5K4EIU1LV9MxyhIFJ5CJdFln3By/2HUmyVP42/HjKU1nG/cycTvEc55cHLRWqN9wE+FEFHfU
	0K3hdO6LZo41ozIwi5
X-Google-Smtp-Source: AGHT+IG4AJoJm61Dd6qVn/iF2+n9hCNabmmWWcn00TPeCKQaskwq3/ly+i1XzqQhv/UobqvqO7pTQRQhGN4UhdDmYac=
X-Received: by 2002:a5d:614b:0:b0:385:f13c:570f with SMTP id
 ffacd0b85a97d-38bf57a1e51mr30959048f8f.33.1737977685523; Mon, 27 Jan 2025
 03:34:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com> <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <0E0FC88B-95C0-4DBE-B497-AF9101BACE70@collabora.com>
In-Reply-To: <0E0FC88B-95C0-4DBE-B497-AF9101BACE70@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 12:34:33 +0100
X-Gm-Features: AWEUYZk_b7owRl7Iq6kR1FnsqMI4Ec-Hweda-DvvizWUthOSqWuwym5xDeFvFdg
Message-ID: <CAH5fLgiW6n82hMhbmJ-ynd6329mEDFX6TzxXQZaaoG47HAWWcA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	dakr@kernel.org, robin.murphy@arm.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 12:00=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
> >
> > You were asked to rename this function because it returns a slice, but
> > I wonder if it's better to take an `&mut [T]` argument and to have
> > this function copy data into that argument. That way, we could make
> > the function itself safe. Perhaps the actual copy needs to be
> > volatile?
> >
> > Well ... I understand that we did this previously and that we want to
> > avoid it because it causes too much reading if T is a struct and we
> > just want to read one of its fields. How about an API like this?
> >
> > dma_read!(my_alloc[7].foo)
> >
> > which expands to something that reads the value of the foo field of
> > the 7th element, and
> >
> > dma_write!(my_alloc[7].foo =3D 13);
> >
> > That expands to something that writes 13 to field foo of the 7th elemen=
t.
> >
> > Thoughts? I'm proposing this to avoid going in circles between the
> > same solutions.
> >
> > Alice
> >
>
>
> I think I missed something here. How is this any different from the *safe=
*
> functions we currently have?
>
> Anything that involves a copy is basically what we have already, although
> your version seems to reduce the amount of data copied from sizeof(T) to
> sizeof(T.field)?

The difference is exactly that - you reduce the amount of data copied
to just the size of the field.

Alice
