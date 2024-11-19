Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18E21CDFD7
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 16:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033731; cv=none; b=ub/M7Ovi566K/yfeDge4zxmhmFiUjeQndzV8oTmnIVYZj81l3OFO9QJGPuanF8WJf3tKXWtmXcLNvHEJqLtnIx97F6APEDMqXMqahD778PRMhm/v2oMP5IkwTfAh35lqR4qRI0S1DkFdMtERCNY19k8y14lID4Q5ziDOMr3+9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033731; c=relaxed/simple;
	bh=cWYXDPgO3GIzCLE7AXK/wXRdAjbM0VBPuYzEaBBzd94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9rJdg25BjMe4V6gA+3sNRMx0rFEk41L5EimoUvlEeFbXNRlO+QG8KRVmaA9S+dRmQFf5M9FC3rTowM4oDfatl+EC0HddRj7kKgZ9trqknslP9isXnLuTT3yv23kJWRup2fBop/8DJYjvow6o6llQQ2T/OfgJvPtgRLGMVsSuw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zjcrhs8I; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zjcrhs8I"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-432d86a3085so31901755e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732033728; x=1732638528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNIGL4TBmG79cNhapAW7na5a/ZXkm+77k3iLSneHF0E=;
        b=zjcrhs8IfhpDAWsCgLa+NkTGoupEBdzdLRii/O9/QcH87I2g3nbpgH7suvcCLVL7hx
         eI60DfeUALq8EUUWaQIc7lvaui38ozHmrfh2+qSZgqFtJK8JgOiDWO2/Up1MimdcK04a
         QkMN2Hhgth9yXjawEsAlZLTQjfY8SBF4XLoOM9/NwJTCK/7v91UdPKjn7yngdfDVP/h8
         s0BO5HaYxpSKVuYnYUTTaBg4b0efEVrtDRMa+DrVmAkI0cVhuSghS2wyeCJJpjPLros1
         bybg8yK/4/iOggasYq4mm33w6MWSe/iQM82eoBXCPX6Vd+is0754W6bOlUaBxDPsqL3V
         yDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732033728; x=1732638528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNIGL4TBmG79cNhapAW7na5a/ZXkm+77k3iLSneHF0E=;
        b=pN1Cp7oPeQmAc8wnEz/dXqQoIDluf570s7xb7fsWDE2pBOzGdsi6aJYR8rP5AM4SwY
         o0s1rDlARa0i4jGdvspNxLBci8Ram7EtXw2ngWccDJKg8HaVUMHpK7dscf4t9pU60QXH
         JRqYygMFtp9SwjP6SOyJU1lA0I2bkNyczffJcvy7FWmpXV5sv2j5kcKvGgaF8C5sla0J
         dD8l2y79lvn2sadtGCmxQbC4UyX1Rt8VgsBYPlqWKZILwsd0yTUtXGa2QHyNXWQJ+qo4
         /QCLXihP3wfPSocqO1ROkdSpuq+cn8oFLyHdewc3cuZ2CTfLpmQCIVJQfMgfZSqaN41Q
         xx3g==
X-Forwarded-Encrypted: i=1; AJvYcCXF7K+M5GNlmTASrVEcu3aO7aR6c+VafJkOhleGXQOKUQOlw3A3AL1yixcxDYK1E48rGRg8gnW6AY8zbNCFdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzplU8nIlRfRVrTfJHh5PrVVvjI9d0kzgYkozb8LBr0afGzvse6
	IcXVzZcVWEgqJklsEJsoRK5goUtic/n/Uk4v4lGWVhCIRRSC+8ud/AHh96aUpgJ0amWfH6fexkA
	SmcBfGf1f7/JDvtdefsIfD/i1HTRLtItGySVT
X-Google-Smtp-Source: AGHT+IGH4JSOEfD1HbHMvcsuZeTTnF7GVtu19F8wmLg4uCfMKhVnl5FetT5En4B6arRYXki6OdQNmsQobYCw5vHhAnc=
X-Received: by 2002:a5d:5c0e:0:b0:382:4a4e:25bb with SMTP id
 ffacd0b85a97d-3824a4e2883mr6368707f8f.46.1732033728228; Tue, 19 Nov 2024
 08:28:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118-rust-xarray-bindings-v9-0-3219cdb53685@gmail.com>
 <20241118-rust-xarray-bindings-v9-2-3219cdb53685@gmail.com>
 <Zzu9SzkDoq_1YQnJ@tardis.local> <CAJ-ks9mKArX37VzhcyymDoE-MsNxNcO8VvP4n3Xu1mdfOKiuag@mail.gmail.com>
In-Reply-To: <CAJ-ks9mKArX37VzhcyymDoE-MsNxNcO8VvP4n3Xu1mdfOKiuag@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Nov 2024 17:28:36 +0100
Message-ID: <CAH5fLggL7MTLVv2ym_tCCKH9hQtL=GpTwXjDUQzKQX9UdT7SkA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] rust: xarray: Add an abstraction for XArray
To: Tamir Duberstein <tamird@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:24=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Mon, Nov 18, 2024 at 5:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com>=
 wrote:
> >
> > On Mon, Nov 18, 2024 at 11:33:36AM -0500, Tamir Duberstein wrote:
> > [...]
> > > +
> > > +/// A lock guard.
> > > +///
> > > +/// The lock is unlocked when the guard goes out of scope.
> > > +#[must_use =3D "the lock unlocks immediately when the guard is unuse=
d"]
> > > +pub struct Guard<'a, T: ForeignOwnable> {
> > > +    xa: &'a XArray<T>,
> > > +}
> >
> > `Guard` would be `Send` if `XArray<T>` is `Sync`, however, it's
> > incorrect since `Guard` represents an xa_lock() held, and that's a
> > spin_lock, so cannot be dropped on another thread/context. `Guard`
> > should probably be marked as `!Send`. Or am I missing something subtle
> > here?
>
> I didn't know about this requirement, thanks for calling it out. I
> have added `_not_send: PhantomData<*mut ()>` in v10.

You can use _nts: NotThreadSafe. The type in question has landed in
6.13 and is available in Linus's tree since yesterday.

Alice
