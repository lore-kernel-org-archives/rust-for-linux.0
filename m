Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B867431770E
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594614; cv=none; b=CdRyliZoGzcZReQl2o69qnoiftNoIKyLnvYODa6O7dfIwMbf0eEdTCtC0CQb5e3FxU0WKqcL3oozbUtjx97c9MFBQjsbLhM+M9Qsxzf0rgbd2uCR6ie9DoXL4F8BdGZD7s3FycVtXD+feZWk1Bz+Z7rEdV4dO3nlp34X4bs9fcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594614; c=relaxed/simple;
	bh=7ek/XcSlPOTA9wFSe80Ag3IAFpD2dLzpSLsq/5EQJl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yg7aZHOYeLuSAZcuX6A8hN4669y0od52UG+RlAMzM0Aj0s16boC9VO0wMUsOytFOAYzcdK7CVhdm7iF9nyeknAfoX3oWaw/ohP6A47SdOYO8i65jxBj+vt5tkeSuh7EuhQZO6MSwqXSrbWxTVWgl2AcR1CdaWlEiqhJeEXVZS2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TRCq3NN5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TRCq3NN5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so40390955e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 02:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755594611; x=1756199411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9/jnxBS7I1AR5e/02apEhjBpEazFeyENxAvH1Nm6yo=;
        b=TRCq3NN5tnBIwhZrMkR+sJlPFKenz+qWGBX+bl3NfNUEhlJP/8C1VNTmGhGVhVeA/2
         Ibf21hcyYiiBYi4Yfsj5r8XJ6gkAs0x8/1Fa3doALXvDAeFhqPJbJvzTJCNzihPd5qEL
         Phcp8MvkANhjtIs+jVTQwaNzNs/IKUJAVG+tci5FNioLwcLwTJi5zOkSp4bgo4Fh3970
         KxLIb361iAAj8wmtWzgmy3Xe9FPy82nG0+v641XeWtZahD0bKLMgWhbd3BbKVzj+eLZ9
         bx2kevEpJa+XSar4/pWQGYvmu3ZpqA3fRCp1K6vb4Ikj4NjBLtvKNhvU9SrF2NB9kF+j
         P14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755594611; x=1756199411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9/jnxBS7I1AR5e/02apEhjBpEazFeyENxAvH1Nm6yo=;
        b=lilBnUT4z9fXZYBVanYcmUMrRDNaTgsBxZo9jCeRpdmBEa9I88dESolkBe7FL/SKY9
         y6LM3KGG7vt4oI0tuIUYdvBV/IVngEGEYgZUkXUvxfZOQqCSzmZDRCFXzHLDuTcg9l/u
         lJ8bqFzME6gtSCV3wHPufDgNtcxGvfJsU5s+S9jAw8aCIfI3J5gAw96ITRtDxekujBij
         +ugTWd+cPS2+e+VTCkNs1h/nUbCIxPm7BTXgSI5PU5/Yy9Jhz9inKxxiM8sG+3UQw83g
         4hnAiZBVkvtudg2r8pZ01eSzCjyvIc9hoydOSuorXRm0IhdY12heJso7M4ny9PyFpTRN
         Y3ow==
X-Forwarded-Encrypted: i=1; AJvYcCWqbP9KtvVilWE7HYvBWx4STqDdLGX0rS9/lCXr6iYD6LBP3Mv7NPvMM35i/E/BKWD26u4gbZGUiTlw9fARNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHp1+YCm9gu79KeQ/qE6eFOwsJJIY+1fT4bDdT3iQ8F7EZJLX
	3uE7aCv0Cbd76hhsf/hIQZg0/j/pRnh9Ovpk5GqVPrzVYYOCWa/0G4o6HKwEAbiLlVgki+/Da5m
	EisYmn8y8mdzQT8v0HER3/EUDd/PsfzfSS1yl+WTh
X-Gm-Gg: ASbGnctKcnIkI5eUWCqEAcsEKSuUmk2auaHRhQEZ/TyBH4DxFErCE8hdstADQaiN91n
	pyL68L0Qc1ZxyGZF6llUkxcgFncm+oxMuc/yc3/251Wd58hkO8EX257klM1r/10/BQzlNKzxnjw
	CB8essLvG6hj16gyVTwp/DImZQoGQKQNsOgi++ERpMDt1dw2x26juRI/rp2QYDZz6xmMGD3VlMA
	nWZn/wd33gSHnaasFOHNE8UMgY5eo1mYpt/xNYA4P/MuG7WvbUGO6o=
X-Google-Smtp-Source: AGHT+IHVUVNrk5qRTajk434+TVEPOUXm04X7Uh+fxd2pvvGn/JXpX/RvG9pR2tzt3ATebxLW997HovRzB564pm6TmpA=
X-Received: by 2002:a05:6000:1ac5:b0:3b8:fe01:cc29 with SMTP id
 ffacd0b85a97d-3c0ec476b13mr1451794f8f.45.1755594610630; Tue, 19 Aug 2025
 02:10:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726-maple-tree-v1-0-27a3da7cb8e5@google.com>
 <20250726-maple-tree-v1-1-27a3da7cb8e5@google.com> <20250726164527.6133cff6.gary@garyguo.net>
In-Reply-To: <20250726164527.6133cff6.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Aug 2025 11:09:58 +0200
X-Gm-Features: Ac12FXzIjOR60cK89wW_NrK29HmSiiv16L1E4oN_6vVa5petNytsfqPo9w5zs2E
Message-ID: <CAH5fLgg=_rfx9mBn6GbF9S0+thO5kGZOvOFT77XKJiGG1iozfg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: maple_tree: add MapleTree
To: Gary Guo <gary@garyguo.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 5:45=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Sat, 26 Jul 2025 13:23:22 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > The maple tree will be used in the Tyr driver to allocate and keep trac=
k
> > of GPU allocations created internally (i.e. not by userspace). It will
> > likely also be used in the Nova driver eventually.
> >
> > This adds the simplest methods for additional and removal that do not
> > require any special care with respect to concurrency.
> >
> > This implementation is based on the RFC by Andrew but with significant
> > changes to simplify the implementation.
> >
> > Co-developed-by: Andrew Ballance <andrewjballance@gmail.com>
> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Overall looks good to me, some nits and thoughts about the error type
> below.
>
> Best,
> GAry
>
> > +/// Error type for failure to insert a new value.
> > +pub struct InsertError<T> {
> > +    /// The value that could not be inserted.
> > +    pub value: T,
> > +    /// The reason for the failure to insert.
> > +    pub cause: InsertErrorKind,
> > +}
>
> Hmm, we've already have quite a few errors that look like this, e.g.
> `StoreError`. I wonder if we should just have a generic
>
>     struct ErrroWithData<T, E> {
>        pub value: T,
>        pub cause: E,
>     }

I don't think we have any existing errors that look like this?

> > +
> > +/// The reason for the failure to insert.
> > +#[derive(PartialEq, Eq, Copy, Clone)]
> > +pub enum InsertErrorKind {
> > +    /// There is already a value in the requested range.
> > +    Occupied,
> > +    /// Failure to allocate memory.
> > +    Nomem,
>
> Given that we already have an error type for allocation failure, how
> about
>
>     AllocError(crate::alloc::AllocError)
>
> ? I know we're getting ENOMEM from C, but this would match what the
> error type would be if it were from pure Rust code.

I don't think it makes a big difference, but ok.

Alice
