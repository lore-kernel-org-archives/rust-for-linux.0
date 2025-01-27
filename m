Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1671FDA6F
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737974634; cv=none; b=FEnTDMhuc3rtH2M0hryD7cWnjVuD/B8K/lLS1KQeYV7l1SCykx+J+bBoYBx9SY0QGFpX7y1FJb5yLYx5VLo32NTTNZv7ub1mlZVTJEVpMy0kSyW5Voi9z1mYu+EwM739eUs1RNbqs1+jbNSJI8Ljkf7sQ+8xxcKDSOYu774dmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737974634; c=relaxed/simple;
	bh=DpUlU+5e0pdlWnss+w/btDiCXvNZm4M2kvgGwmjvQJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKE8KiR1ChQQLM3vOxt7yjE5M1RjW4pD1a9GoGMJiZ5RkzeKjuVLeOJV+WeHEKqZ2rF1BqFlz59MFDAVHmLQ05JiBStOMqsktSzU3S5MBNVItRrzhHtcmvgSHsyQwbtIAUiMQy8OdJzDoQLOdoinVzK+UzlDcF2H/rw0TieLbns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aSK743Gb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aSK743Gb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4765532f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737974631; x=1738579431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npu9NWyCRH5wSGiN1N/OtKrtIsdcWA0kJ2CT1AR1D88=;
        b=aSK743Gb3/ognsEsd9MXf3cSA7jJkgpT3tDNWy2Enw2wC7NLP+CM8E94NKJgnackAv
         KHdm0TzGU32nCZAnnSjArUKwogrydn6MeOKzyt8jBts0hQWy9tq97UwmMnTivVQPuRBE
         r7opwOZLtFfVQBiUxdd1NEzPQQ4VTF7yGYQ15eO7BTrI++sPnhf4eyBXWDcjTUKqySiS
         NctI2pwx7HTglMyoq0n0tgNxqSwuaVE7akL+RZ36sS41V8pIXRMKHZYdUfLX4gRCiRK+
         ZKtGZr1zc6mfbCjwVWaSNAAuObdLZgL+56+PIGV5XkxzApEBqPU8tv8GZg4/MBPSfKXk
         mQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974631; x=1738579431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npu9NWyCRH5wSGiN1N/OtKrtIsdcWA0kJ2CT1AR1D88=;
        b=T9yH6tQT53la3beVGRdenbkJNtAOv1hPfMZr+waLhitFC+DwuVc7bd8tzqBn7NgQjK
         UQ9PIYUKCoknUaf+HEQhTqVmL/kD5ALKJ2mW6PZ3ED3QozzrPzwoODUO42Cr5hSqmz6H
         dCTRTDyTm0K6yKNdf5OkYlu3bH1zxU16XHqPs9/smuV0ksT5mn5VshecXYQcGTDIbDpt
         pAEHuZeVXg73nCiWowgGQ1KozP1v9gaMkmCNaTCgXnTMVMbMAVKStqOBk36/7znBwThA
         yYO8EL7hy+7mwe6qIwgZzcq+f98dp9jISwE3hvg6o6s1ES8w0C9aaUPJ2x/hPGT8+j2G
         278w==
X-Forwarded-Encrypted: i=1; AJvYcCVHKcSMWkdOZujpEBEfVSouYA4pgaatZssHlKP0nu6xk48uCDiNuT9ZYLvw6KN12KX7S2OFzydHrf0dgZXX8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykw73qQ1BkZHcEQjaL8Yvzucy1doVK//ke7q60b3cL5mWh5tAS
	8PZx9plHHpENd6QzNw7TE/LxYDA8l69XR07FMVNn1L624SL2sy8F2JjwQR75pVOBl6qq/lBEpQO
	pOCFCZru3U4KAk/bt85EiFIyB/0eDb1Pm6b4W
X-Gm-Gg: ASbGncsW9MWW8BsKhHAOb6Cg0qu32a2ESrbuD7s9fT/VZKAL++Fg5J2+WcR1NSi6wXZ
	Ep3nrC1Wc4pdlCi1mb8imnnWIfTCwSi8X2MrHdp75S88taS0hC0Jp4MunlAhGTn1pBl8XWCxvVY
	6LPnzyro/t9bGE0SwT
X-Google-Smtp-Source: AGHT+IFM7Dw/e5+F8lZxBaUZ6G/EpfUegKdVXE/TEthH2HhoJ4KDJIugbRveHggQNeuR2C5cWej8okeF5g/vsSLS2ZE=
X-Received: by 2002:a5d:47c2:0:b0:38a:888c:7df0 with SMTP id
 ffacd0b85a97d-38bf56494e9mr37942323f8f.1.1737974630993; Mon, 27 Jan 2025
 02:43:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com> <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <Z5dh6cSnNxwbefJX@pollux>
In-Reply-To: <Z5dh6cSnNxwbefJX@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 11:43:39 +0100
X-Gm-Features: AWEUYZkUcfOxL3CR6BWSP7MUerjFHyQvPZlQ_CIfDjEwqbZsip6hR6LyiFqgpFw
Message-ID: <CAH5fLggMSiHZwHJ3md0eH7smyDNVL3L=Sre7F0SXSSnPrJiO-A@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
To: Danilo Krummrich <dakr@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, robin.murphy@arm.com, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 11:37=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Fri, Jan 24, 2025 at 08:27:36AM +0100, Alice Ryhl wrote:
> > On Thu, Jan 23, 2025 at 11:43=E2=80=AFAM Abdiel Janulgue
> > <abdiel.janulgue@gmail.com> wrote:
> > > +    /// Reads data from the region starting from `offset` as a slice=
.
> > > +    /// `offset` and `count` are in units of `T`, not the number of =
bytes.
> > > +    ///
> > > +    /// Due to the safety requirements of slice, the data returned s=
hould be regarded by the
> > > +    /// caller as a snapshot of the region when this function is cal=
led, as the region could
> > > +    /// be modified by the device at anytime. For ringbuffer type of=
 r/w access or use-cases
> > > +    /// where the pointer to the live data is needed, `start_ptr()` =
or `start_ptr_mut()`
> > > +    /// could be used instead.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// Callers must ensure that no hardware operations that involve=
 the buffer are currently
> > > +    /// taking place while the returned slice is live.
> > > +    pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Re=
sult<&[T]> {
> >
> > You were asked to rename this function because it returns a slice, but
> > I wonder if it's better to take an `&mut [T]` argument and to have
> > this function copy data into that argument. That way, we could make
> > the function itself safe. Perhaps the actual copy needs to be
> > volatile?
>
> Why do we consider the existing one unsafe?
>
> Surely, it's not desirable that the contents of the buffer are modified b=
y the
> HW unexpectedly, but is this a concern in terms of Rust safety requiremen=
ts?
>
> And if so, how does this go away with the proposed approach?

In Rust, it is undefined behavior if the value behind an immutable
reference changes (unless the type uses UnsafeCell / Opaque or
similar). That is, any two consecutive reads of the same immutable
reference must return the same byte value no matter what happened in
between those reads.

If we manually perform the read as a volatile read, then it is
arguably allowed for the value to be modified by the hardware while we
read the value.

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
>
> I really like how this turns out.

Yes, I think it would be a nice API.

Alice
