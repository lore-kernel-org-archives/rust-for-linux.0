Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC76126C03
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661337; cv=none; b=vGVb5FNkyokgqFUqQUo+XzcQemUP4LgqW7HrMCMJViD9tV+r73J5aFB/dbZdWQTxnTsKPUMveSJ5yHTRSuFlyH60PUjX3sg9ez2zFPW/NALu/npQHe+hRE6QHiD2w34uiQAwJVXUmjZQ1J8vP12wf6Axkmy8pohx5cwDqRdyNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661337; c=relaxed/simple;
	bh=Zquk4fZlqugpMITqeHfl1rKNFO7IlOev+ik/svkOUIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSU4FiBE2tmtrcG2z1k86gimR4o2L1n2nyFddvZyGDiGxdfT/qOM2m8dMGx5XjZzqsYKL+IatRLG7Sa/RNaehcjFm3RkYkmOH3ye6HuQqtmidDTGFUcNMhQwJ+NYXyOW6Mpu0Gzv6kSb2ZwFavCCkkfKoUc3zA2v9tDSGjdO5qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=K2Mzkubw; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="K2Mzkubw"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23ff92d05acso3836685ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 06:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1754661335; x=1755266135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQqhwMu97JOF+Dnp4Yu6k+ZMIJjBNPmuuiSPr14eUoY=;
        b=K2MzkubwRH2EvE2i8PEaTpBdJwSCEMaG3fpUbCChQxi2Yh0ccANvO5FjQND0N7s+i9
         j2i3PHRd0Ls9MrDoGGe484n1BYDb31MM0n1kuMAJ5Cz2K4Vnm3MziHN1Vl1ZB5BVFsIP
         qRQph51Qvi3SBVYtv2WjcA48fw6ztPuy4iiu8Gg7n1skjCv73vxQSsv8KLxfDvxjkmWK
         HajajFYoA4JPcJXvKfWq07R894HiqXQqkzkJs2V3Rj8RLDFTsqshXxgHND7jqJzPhkqp
         0ErG5j/Bt3rNlSDO486PT8CjiyEDrDdpucWqxsu6S1LSpoGWI4upqixVE8eOFbZwkSfq
         3Kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754661335; x=1755266135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQqhwMu97JOF+Dnp4Yu6k+ZMIJjBNPmuuiSPr14eUoY=;
        b=gE1SbKRkXpf3KzPlqXdqBYocdF8A7Tlovqx2mGfEpW8Roa6mid/yPw8Tph+HWI57q5
         GJ5FtGFJMYw79EY6caEQxTn9JaX1iw1WNzfyBp4/C03oj5ogna9F++ed31KX7VGtTz30
         3+GLnlmWogia6ForoL4TusD3D6VT+j5shVVNu9+mWWxNBL4qEbDrn0b0adBqvOKSKenG
         d+SkyHlc9ERi5SPzOdzCvqsGHGXqBXGwB5FvXxYeHo9dNK4sWKpaKkaRBanEznCR2hRa
         KXWR9vYhCVus51T+6y7gEhvLkZ2qD9uA0y0AJWpXmNecgkyPb2Dk1Ja8GfZcu4lDWE1j
         A9GA==
X-Forwarded-Encrypted: i=1; AJvYcCVJcaZJL3M/ugLT2BAEdUr17zZfwnvA63loqy/DMr4ilKCNlMI7/dq7RbBzQQGktAHB69w++/Dn2F+wqECN4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyveS12/jy8ELrE6lSRzD8vlq0nKtqaLfRITxpdUZZQC92RoQC8
	TkznY9aAPfBNpLRbUc3TmWTCkg4cCAr513vuysUp1nAo5zR/1oYShcveUZ2UbmxTm7tyYgJ7rDl
	ojqFzQLRgN/PvG2ewfIlNR3sWSme6hnwYoM2Lm+vEZA==
X-Gm-Gg: ASbGncsNb7GvpxGqHbQVWdAq+kQF2Dc+UH4wPv0gjCAz23z7G6P0uBRYP/3+I/xY4fx
	FFoE4jXQZdTdYya+V+kYDhgzpDuy1gnaqaxAIYxE5NYayRy2SYGls/xgbXUmRn1LbKkkEbUMx9V
	3bDltxONcxOpfLbArRE2U1/r1F+iV18nlfnllBxR0f1UAI+dCpJDjs06woqZ6es07/d6TjnXekq
	wgB4A==
X-Google-Smtp-Source: AGHT+IEvTRGuSdb6pbkCKd1y4iUXYP9fAjyHlvC+AqT0WWCcjOtTZnbw9hq9BOfJC/3n9bkUYLQYUhb4M8CKh0KADFU=
X-Received: by 2002:a17:903:8d0:b0:240:764e:afab with SMTP id
 d9443c01a7336-242c22135a5mr22357765ad.6.1754661335094; Fri, 08 Aug 2025
 06:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727150329.27433-1-sidong.yang@furiosa.ai>
 <20250727150329.27433-3-sidong.yang@furiosa.ai> <D6CDE1A5-879F-49B1-9E10-2998D04B678F@collabora.com>
 <DBRVVTJ5LDV2.2NHTJ4S490N8@kernel.org> <949A27C5-1535-48D1-BE7E-F7E366A49A52@collabora.com>
 <DBVDWWHX8UY7.TG5OHXBZM2OX@kernel.org> <aJWfl87T3wehIviV@sidongui-MacBookPro.local>
In-Reply-To: <aJWfl87T3wehIviV@sidongui-MacBookPro.local>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 8 Aug 2025 09:55:22 -0400
X-Gm-Features: Ac12FXxoKSbsPg1hWv0cG4s-zPj6j-EgqHK_XsFPK4Xy1_Cr-9q7QSTYWD8saXY
Message-ID: <CADUfDZrWMrECM_LSh-nsurRBadskq_Z9wh_7nO1FUUxvOVHmKg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] rust: io_uring: introduce rust abstraction for
 io-uring cmd
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Benno Lossin <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 2:56=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.ai>=
 wrote:
>
> On Wed, Aug 06, 2025 at 03:38:24PM +0200, Benno Lossin wrote:
> > On Wed Aug 6, 2025 at 2:38 PM CEST, Daniel Almeida wrote:
> > > Hi Benno,
> > >
> > >> On 2 Aug 2025, at 07:52, Benno Lossin <lossin@kernel.org> wrote:
> > >>
> > >> On Fri Aug 1, 2025 at 3:48 PM CEST, Daniel Almeida wrote:
> > >>>> On 27 Jul 2025, at 12:03, Sidong Yang <sidong.yang@furiosa.ai> wro=
te:
> > >>>> +    #[inline]
> > >>>> +    pub fn pdu(&mut self) -> &mut MaybeUninit<[u8; 32]> {
> > >>>
> > >>> Why MaybeUninit? Also, this is a question for others, but I don=C2=
=B4t think
> > >>> that `u8`s can ever be uninitialized as all byte values are valid f=
or `u8`.
> > >>
> > >> `u8` can be uninitialized. Uninitialized doesn't just mean "can take=
 any
> > >> bit pattern", but also "is known to the compiler as being
> > >> uninitialized". The docs of `MaybeUninit` explain it like this:
> > >>
> > >>    Moreover, uninitialized memory is special in that it does not hav=
e a
> > >>    fixed value ("fixed" meaning "it won=C2=B4t change without being =
written
> > >>    to"). Reading the same uninitialized byte multiple times can give
> > >>    different results.
> > >>
> > >> But the return type probably should be `&mut [MaybeUninit<u8>; 32]`
> > >> instead.
> > >
> > >
> > > Right, but I guess the question then is why would we ever need to use
> > > MaybeUninit here anyways.
> > >
> > > It's a reference to a C array. Just treat that as initialized.
> >
> > AFAIK C uninitialized memory also is considered uninitialized in Rust.
> > So if this array is not properly initialized on the C side, this would
> > be the correct type. If it is initialized, then just use `&mut [u8; 32]=
`.
>
> pdu field is memory chunk for driver can use it freely. The driver usuall=
y
> saves a private data and read or modify it on the other context. using
> just `&mut [u8;32]` would be simple and easy to use.

MaybeUninit is correct. The io_uring/uring_cmd layer doesn't
initialize the pdu field. struct io_uring_cmd is overlaid with struct
io_kiocb's cmd field. struct io_kiocb's are allocated using
kmem_cache_alloc(_bulk)() in __io_alloc_req_refill(). io_preinit_req()
is called to initialize each struct io_kiocb but doesn't initialize
the cmd field. As Sidong said, it's uninitialized memory for the
->uring_cmd() implementation to use however it wants for the duration
of the command.

Best,
Caleb
