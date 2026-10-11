Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBEE40A940
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708016; cv=pass; b=pF0gOO7N5ymScsLnYZr2FO4iEp5I/VS6I3ufx9Cfbqge5APRJ6Yc0pGpgBAUFPEZl+DK08fAWnUPcJasc0mLed0eMNUpP5sKVs5wJo7E26f1Z7WD/c01xrt8GoEkZWG1tVnE4IznVdO20RNZvUDwOa6c+hsX86z1RbfgYo+jiX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708016; c=relaxed/simple;
	bh=eTWmk3cQVl2ob6GqAajL7Tv+HxO0u5fkw7B3AhP5ecw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxdBeU0XqT3+xCzD6cP3c42e0BLbyige1wUB8oinEpheDO2O+4tFkcgiafuKQaEvArQ/l7PQgFHU6U+VedR+RLuf/ZMBnht3aMmt2XgaF0bozXpH2uMdFBgLmjgBdVac2f+dQyqJwb9eNJA+vwOD6udoLyj1gyCe27tO5fxmuAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nN6Ntb2K; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN6Ntb2K"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-313bab9cfe7so94035eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 01:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791708014; cv=none;
        d=google.com; s=arc-20260327;
        b=oI7fC1pv22mOydngXhPbUsrlJ6fpVocfzB76E6MhgevJmrPUpQOICqRESrrBd73ecS
         U8/Uh6uflxjP2NdbN187JNtzumwloIJOBeH7i0VeYeYXT60MUS9HdVgYfc3FDO1cy4Lc
         zajBkawJTGdDoea6WZOjHrQsCAOJWAHhTLkyeNuabrvChHHDJ6rRX5rJHnAmUrh0ZPko
         GD7n5cAwUVYD5iZq7SiyWXe+DKOH+X0FQzlFSJF8CQWOU9RMalVPygr5WH4H72SKCoLD
         4kTCXWXZwum7wajMtiiTUJAuwPGiXzmuSBE8Y1G/3Z1WH/Uo7vOKjXrQ6nFzhaWgjTdv
         gpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eTWmk3cQVl2ob6GqAajL7Tv+HxO0u5fkw7B3AhP5ecw=;
        fh=/m5qNyGcXmQclYbGYdYrME1G5A1HAIwruZCjDtXKuYw=;
        b=HeVzQMkXQRK/BdgPmo2X/mFyltb/Mlmqm7XTFFoxzZVbeUT7zC8bGFrRzJ7rlB61ks
         pqPQ/cmq7O/BUzxNdR5D3lISXinjqYAl6ef6hxblE3pdnel1o0hjuol/SodBc1XI//Ey
         qqTFIf/UkROZxMw4nReHnoZ74l9uT6W6ol0NPTvr5m8dAdeJclc3AzuzKFWrsyangcek
         GEaB9nfbONOVOwBe7xx25sA8uw/jFetHkktmEtZgK5n2wBwfRMtLLn1qm7Njx9oH6NQE
         XnQNPtTIsVNV01/AMkPVZlHBcedK5eHRw+tIMOMtyuD0MgqoFg64bt7cJOygS4PyrhZL
         U7og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791708014; x=1792312814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eTWmk3cQVl2ob6GqAajL7Tv+HxO0u5fkw7B3AhP5ecw=;
        b=nN6Ntb2KprPYe9wmPA6b8YaCZygd41O+cruDqROLyNvSJkWMDtUYMWZRE+pYm2tRt3
         NHaklGz0SBzG/hzvQCnbXvGU9O+KZkDnBp0gjN0x5P9a+bmgPjuJEhOYnp+rbH1+lFNI
         /pAv87yQaQc5Zaqd8SkDiab0zSuqH3zLmmxVFubiUbLGMU5YEauJpiIST1nGyqOD3Ag9
         CPVCeD6seGvGS7YsRudlY5dMqDoF6fWRDnoSoXx5QbZgu7oENy2FjoJ25hS1EKsjKclc
         GjBDe8bXNu1bYvEXxnhj9tG3G3fku2T6LbVHfLJ83S+tOZ235b9pTWTB4U7PFpUM+Acj
         6siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708014; x=1792312814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTWmk3cQVl2ob6GqAajL7Tv+HxO0u5fkw7B3AhP5ecw=;
        b=BGsQ8x5CSJp0Fb50KDQpBSQIwSaI/iMcbAd/sDMOYdCuRV4sAbIQ4qWdi1kmjF1y2n
         eizBKc9iLr9rXSrA/q194nBBayfOX6IdD1HmLpQ0uRBD0ePGRwTelI9Mx26WuG74MHnx
         E7C1v0i2uajNJC4V8cDUTuPpcF0TW/zjaAZIlrz/QcZuf9jW2W5o7hGpiZhslBVWCMLt
         guIgJEj8HVOoFCdpJDQ0Z10KnDu5k3B8Lnhki5fHTJv4M0EyVyERzRK+XbK2nqaWIvRG
         hHJwKMEkwjA7tfD3scd36CU4q22YGir8FVCDcYfNkzbFqelmtsmvZUwZoZssuN5M5fXx
         nv5w==
X-Forwarded-Encrypted: i=1; AKwUvBzYtbM7Djc67TOcMqavVPdbhUJiaxUbyUAAzdtvb0ZfDTTPiUc/9eBcvkUM+SwtILH5A4d7fIFMgNQldbbQ8A==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOi64wmsGMtUAqm4eox7iohlQPbH3bEaaUpP9x85YBMjB9w5nv
	P8D/+R7GUsHJ4RSRvn95OCAbCR7E+iQBxZDpRZLJMZ/43gRhueeVlZiyyuwoNqRMMeOlmbzulhx
	sLA5kSaQWpVapHXUbJuccg2hOEs/h2Tw=
X-Gm-Gg: AYBFou0yUSB3L6e9G8QMGAuUh7/zh/YH+AkK7lI3fPSBdagy0lKIwYNoy/amVqYIVW8
	HIXkJ91qTLu0aKokA0KiDtFPuWuQLBO/iJ0RSoyIs9YI2bim3wCmRBH3+eufyxr9H3PQzoTHFhP
	hxrFAmxuz/DBR4HgLq+AgXX+bWqo3ZYRTuIKcEXwFpa12glszNsGxTGM+fVsq0sQm1X5MF767/u
	6aPQIRUqnDTlUg/b4GSIMLGB9qXuneEyFM3/GMteGP1MxxRdXE0ekqXUKXy1OC4kSUsm21IdcFi
	RneUdI0psvuv/KoJX/l7q3YZZOBIdH4U6S9yjdpLYTwjU12GlLto+ceC0Z5TDKDyVPole55vnTN
	ZA4YsgX4dvgPOFwyWUOdHe1zuSFtQNO2KCho99tqBfQWbLw9HnuO4qmrF+Dc07PYRSIPWO+gAuf
	WE+cmErc40f8pj//1RP2MUl5KoxMrATBmv7WQ9f7TX+VsbfF3O4mA=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr14508544eec.0.1791708013983; Sun, 11 Oct 2026
 01:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008061326.177841-2-blum@kernel.org> <DLZHGS3GBIT9.16N0JVOTMONZO@nvidia.com>
 <asflx_blsGkQ7Obn@kernel.org> <DLZPAM0YRU3L.2TDZ2GLI7AS6S@garyguo.net>
 <DM0C9ZEJA9EF.12IOGM4R4QG3E@nvidia.com> <DM0D9TERQAM3.2Y3HV6P68E2N8@garyguo.net>
 <DM0T7FHCSQUD.2SEUSVP1QJUXQ@nvidia.com>
In-Reply-To: <DM0T7FHCSQUD.2SEUSVP1QJUXQ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 10:40:00 +0200
X-Gm-Features: AclHuK9-jIeBS8y2bRr-0D0cVzd5X7vM0ALo0OC9UdqtGxoCspUQEXjCpgNlbDQ
Message-ID: <CANiq72=rwnogLqmpxnsvhsPWX+mBtH62=Yu_avQEYEmkWSVidQ@mail.gmail.com>
Subject: Re: [PATCH] rust: uaccess: avoid unsafe unwrap_unchecked() in strcpy_into_buf()
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Thorsten Blum <blum@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 4:40=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri Oct 9, 2026 at 11:11 PM JST, Gary Guo wrote:
> >
> > A `NonEmptySlice<T>` which is `[T]` but `first`/`last` can just not ret=
urn
> > `Option`?
>
> I looked it up hoping it already existed. :)
>
> That would definitely be an elegant way to solve this issue (and IMHO
> should eventually become part of the standard library). This example is
> actually a great illustration of the panic/unsafe/result dilemma we
> discussed during Kangrejos (and yes, I'll follow-up with a proposal for
> guidelines soon, sorry about the delay).
>
> Until we have `NonEmptySlice`, I'd say the current unsafe or having a
> panic are morally equivalent, so I don't see a strong justification for
> this patch.

Sounds like something to explore; filled:
https://github.com/Rust-for-Linux/linux/issues/1262

I can convert it to a "good first issue" if you guys prefer.

Cheers,
Miguel
