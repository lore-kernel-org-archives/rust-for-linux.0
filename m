Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11B2220F5E
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 09:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326561; cv=none; b=oiqCXFq7xmtl97ZfkwS1dwxBXPFq4E2nSgEMSQIejx4ltN2u1m4ZnWCuQOJCU7LlBBm/BgcUbppdrESwrwPqiBUfGtW1Kz4Vl4S5LT+/0rz1nHlUEgMfblKoEq9oVLzUq9wFKEjrfkuiZQQsP+kb5FEWf6solAErL/Up87mLOLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326561; c=relaxed/simple;
	bh=oGgNbIXl6T2if3214aOKJS8wjoi+YfhpFcEFUg4nfOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKg6J1DefO69yxXRe+ofDmgBeoCKiWePHzFM2UaHklNbqYBnYdvLZDOrDGLULxH7c91iPp+ciXDNkbSo1g5WF47v/2iS/5MLyBf7J3mRbdsudQK1QCYYsB0iFsfkMfXEbPOc/08PD3TQSh+CSfl0WLUuKxsardoIfWU4J10UjYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Px1HRRr7; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Px1HRRr7"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c40235c34so152275a34.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 02:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750326558; x=1750931358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJl6uGqaCbQBaMQQvNPvxbNOxoHo/eT5TsgwXHD3osA=;
        b=Px1HRRr7V+E1w1EyOWb5RapwyhMHzmqdDJIoawJt6gXpyGlwDH2PMW/sJjTuF6+Mz6
         rwzNcbgxhVr2LP9HRFuiEzCyHSHpriG9xkBJX4tKpL8dI8N8+5wgYptJC+EwnmIuZZLk
         qS57Bxxo6P/est1jKh4jJo2zNPU+g2q595w/owrYD8HZlJRJIJX04JoSWKSNE1G3ZZxf
         WatzMKjhVYkpZ3zrcMMSenPK+9H/1EiZtuS0ls9GumP1qiNF3frZxvvAtXM8BHvrBXr3
         sTbzJpgN1anQ3OetKCbVQ02ZD7nKvJpjc8uci5ewS3TYDTKeCgFOiGCm3DsDdGsWDcO8
         g4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326558; x=1750931358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJl6uGqaCbQBaMQQvNPvxbNOxoHo/eT5TsgwXHD3osA=;
        b=F2OvrA3BuW1Cm1rYjc6WkfZ5JpVaYcEaBWePyiCZMvHxo11NlOL+U4+2TrIra6Gx61
         hjNFQsrl1qkwQ1BPILd2IZXRedMAofAzWyzjIHz9WFcQjHjD2MQ/5GzfkaHhAFpGoefa
         Y0okgxacWKR6TnZjmeFHIsLH6CYeiVgAKWH8CdRgF27jgSQUgTjx4LGRqVO7i40qXo2A
         q5z9ebYLAo11Nk8aMtSB/NXinNjsolPi3m4/MgpaywODLJUkraiLSdXotCy4tFECw4Ho
         YLqXWd5YhkAu1gbGytcu/+iRhluqUa+q8mYHEJ0DbI9DOQhRjoBt4T5wi/AJywBhyfby
         eASQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL56p5FU8gkog6X97/VJ1YxKT6R52qlDwwmyRUngShsC5DpM0RcD786w8SAsyED/H4QGGPxIDCGApR7SPe/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb0i3Z7Mn3S0Q44pbs5rWkNJzYCpgZBMNOoyh3CCnrDwauay+r
	o4ObyiURkDgGnMALDJN/02d2Tn7Bjoge4VeSdIqJcxNL2++yoG2lMonp6Pgukr++x15HmaaPSaN
	1shEgN22pFCpLv7HaFP1HTXbRwSs7zloNM1KMxHZo
X-Gm-Gg: ASbGncstkrh7jYsRp37P95jGSQQ0LHNS33fcj2X2PUg5kYoj7zF+hjo7FPjPlku4MQc
	H0n9GA02uN8e180WGz3vaueN52staKfmEp2Gi4Wl91P8deKkNs6uBBdsv7cfdEDix5DNi2qHQKo
	LEqSTxdzKsCqrkRXVtHoTMwZfVwqxIKSuGy9LBovlxe24p5iwamHG/S4qQVI+3Zc018X3m79LcO
	Q==
X-Google-Smtp-Source: AGHT+IHPHYRmKnHOsCVbSKhmMIjCUnO2bXpi2Qwr76anVtQSsYyUsTFZp5bLxrDV1U4X7C+0Wvz26zEAZlgrLMDZAdM=
X-Received: by 2002:a05:6870:568c:b0:2d5:c61f:c2db with SMTP id
 586e51a60fabf-2eaf0ba304dmr13059233fac.34.1750326557882; Thu, 19 Jun 2025
 02:49:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com> <20250611194840.877308-4-bqe@google.com>
 <CAH5fLgiMCZuaCSYRDLCpZjaa=EZ=Zaw4y54zDED-7ox9K9++2g@mail.gmail.com>
In-Reply-To: <CAH5fLgiMCZuaCSYRDLCpZjaa=EZ=Zaw4y54zDED-7ox9K9++2g@mail.gmail.com>
From: Burak Emir <bqe@google.com>
Date: Thu, 19 Jun 2025 11:49:06 +0200
X-Gm-Features: Ac12FXzSuruTt-Nyax2FrVAzCnnuEi5Z5jbM694g7SGeod-KmRRuCItsoAZiTfY
Message-ID: <CACQBu=UHdyxiqngiqE-5KPVyn4VFmCDapKiy2W27ic46uNO6sw@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: add bitmap API.
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 12:49=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Wed, Jun 11, 2025 at 9:48=E2=80=AFPM Burak Emir <bqe@google.com> wrote=
:
> > +impl core::ops::DerefMut for Bitmap {
> > +    fn deref_mut(&mut self) -> &mut CBitmap {
> > +        let ptr =3D if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> > +            // SAFETY: Bitmap is represented inline.
> > +            unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
> > +        } else {
> > +            // SAFETY: Bitmap is represented as array of `unsigned lon=
g`.
> > +            unsafe { self.repr.ptr.as_mut() }
>
> Nit: You want NonNull::as_mut_ptr() here.

Can you explain? That seems to be an unstable method that exists so
one can get pointer to slice buffer.

The repr.ptr case is NonNull<usize>, not a slice - though "morally",
it is actually an owned C array.
Are you suggesting we could/should represent it as a Rust one?
However, we'd like it to use the C API to free etc.

Thanks,
Burak
