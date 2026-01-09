Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19E2FE563
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 22:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767997096; cv=none; b=iPeX+f2O5P9YmbA6EtTvML4BwD4NU/NLojozKQNvJShFcHSAjfax99Zyqh4iviSGnLNgrcy9DRWtN4/hCg+rFfR9DGLKx7WnxHIcglFdByI2p4KWfDqywfGm1Ris+UN/FjpIwj7IeA16yTikhByGfDmu65nwoUGTHDbz677HhsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767997096; c=relaxed/simple;
	bh=yE2tH8TsnVy6RQHSkQW113xmGBSt8FNg+XD3GUtJ2EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kDmKPLiGyKXCrlObkkHqkpMbTy3cJEUaLLF8knW68cX1i2qKuYg28bvlLIxw3XYc4nTJvPjPseuPH9Ew2IjwfCHVsAsO97888OZY9I7y1cmjBcPYr88tpKCCRj+orBUVNIFil8RDIMtp6U74Aiu4TDIFk4kWUZq0nNNjb3P/XPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=We+RhK3E; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="We+RhK3E"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38305d006faso25610061fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 14:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767997094; x=1768601894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE2tH8TsnVy6RQHSkQW113xmGBSt8FNg+XD3GUtJ2EI=;
        b=We+RhK3Evs69OyHskAEc9H36PsWpkZM2jnYw0KzK4X+uzKOpS5TJ0jIbhVOEaLuyIf
         gn7rgkUe2owxYMgcW0dp07vgyzAlDH0D2b+VCWaDMD2qW6BqV4C8pOmlCn4/CqxrRBei
         T4i5sMJJagidb+2JF0AdeLEv8ba9huH9/MOIxKNrZ27/GF8A0Le28v1kBbOFRADCUCWM
         9YzWW+yoLGofBgapv2iXs2qJdCWlFpOIxlShj5FPZDnYN9+c7N05eUvAbAI+TLi3+cOn
         qkum36zn7WAEIY+z47BKhhk3QXvWVvhqrMcqOz5HtC47hUiocF8TePzPpCAAMQr8nmyH
         32NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767997094; x=1768601894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yE2tH8TsnVy6RQHSkQW113xmGBSt8FNg+XD3GUtJ2EI=;
        b=TwmRv0yGw9HM0+hUSJBpX7ESUJ0BnQoT4pChQaP8IcfNAPe3IhJ1wXm62JDfLYlzoo
         8nVu46kA/s1f8m/ChVR9/pVZAp8HRCpI98wfw1vFGgLXt0WJDKdBac98xYqXJgZT4F6Q
         4g2QHUf2BMfGoNW3EK6zSaQX6jpg4TU0GWuEs4cEbB348lCS1lQ7M/F9/h9i1gYNI6fA
         DjKWpO/Hb3Lm0rRiXWDJvsbR9NlpDdzCV0xvCtKuIsNymmJRLiwTGhsYyO//yujZRSXA
         WKgP9ywVFUw/i3YzQcZlLMmeEfqS+1elxXkoNcXp4NIfyGVhh18cffemLKHCCk7ETAMY
         YLGg==
X-Forwarded-Encrypted: i=1; AJvYcCXGIDvLmNozf7AojNgvYo85IIiZrk/uu12qeScLRT51KCepbawc7/GRL5i74BcdGOuK/K/R2yq1L19xmzNTrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykBiQ1kK53ssB58cAgCJDmXBO4cRVlcr5Vw+CcdSDxH1RweFsX
	jWm8YM39l8t/HPBO1bcT41MH/9AVj9AzB75jPlrNTe5j2o5bjzWFAKhbaoIHqUyh+EW81VKZw4X
	5p6lqxohjqPVnT5DAJCyLdHTc1p4UVdQ=
X-Gm-Gg: AY/fxX5p5cSTXPun3tPTcOvUpIob6PHsocv31a3gYFybkbFs5DTV+gJDJBhQ/PF5VbB
	XC7PgrwIGce+6zgdKm8+r+1W93SwvXDQZbt3e5ukikNORYqwwvGJ3jhg23yyI+Dryou3Owk2i44
	wDIeaLefeMsi/J6ex+zfU++qHaY3W0W32dMMxy3vtodaxmQxBgjeltC3dmGMXDNXY21SqkIwAei
	LCj5t1SKbDLRQKHqDYOfxWTez7PBJ3Z9Qhmobp19FtU+wf4hkFjueoMHTbFfvH2GjyiPN92BZKz
	1OT/ppwJPNe5aEsxNnfa7aIKZ8fO/ksijDwXC8vK3ykQI54lsEcXmhA3eD6lTCY/uSkpxBm08VL
	UHM+egCK5dw5CcJ7g8brS5LN+ohc4I64iDKFdHy+TVw==
X-Google-Smtp-Source: AGHT+IEDNK9xGdVMnrYjfkntzd2OXPWE/KqXynDcKpelhSCpu/2Oqgg9dND+zNy86LRSPcmPtYZLDwFA2YWnS6ZA04I=
X-Received: by 2002:a05:651c:b10:b0:383:3e5:2379 with SMTP id
 38308e7fff4ca-38303e525fdmr32703681fa.27.1767997093297; Fri, 09 Jan 2026
 14:18:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
 <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com>
 <CA+tqQ4L1j=oy87e0DC-m9YA9wJ6fR+PKtVBcnWH9iitNsVqG0A@mail.gmail.com>
 <CANiq72kezzBVKUyqGwSuJ5ct86a1ZoGJdh7xt3=3TG4+B+Vq4Q@mail.gmail.com>
 <CA+tqQ4KNPeyAkUbrhzbd1bGSCFSRjOYGNiAjHi+6F1OzBgQRUA@mail.gmail.com> <CA+tqQ4+kGwvT80j4TvFq+Dy9ztm+yu5nTT9TLAznG0OQ9F28ug@mail.gmail.com>
In-Reply-To: <CA+tqQ4+kGwvT80j4TvFq+Dy9ztm+yu5nTT9TLAznG0OQ9F28ug@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 9 Jan 2026 17:17:36 -0500
X-Gm-Features: AZwV_QgoUIDT_kitWemdlV010WSlwNU4137hi7xaSFeJWtnn7j3woOVar1h6XGc
Message-ID: <CAJ-ks9nJhRxto-cAgz_JL=__fOrsMqC_W2Z7Ob_EA6sY_xPpCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 4:47=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> wro=
te:
>
> On Tue, Jan 6, 2026 at 12:30=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> =
wrote:
> >
> > I think applying this series as-is and revisiting the `std` removal
> > when we eventually upgrade `syn` (so that the PR effectively lands in
> > our vendored `syn`) is also an option. If there's no upcoming upgrade
> > planned for the near future, I would personally prefer this approach.
>
> Ok, [1] has been merged to the upstream...
>
> I don't have a strong opinion, but I still think it is more natural to
> drop the `std` dependency when we actually bump our vendored `syn` to a
> version that includes the merged changes.
>
> Miguel, Tamir, what do you think?
>
> [1] https://github.com/dtolnay/quote/pull/318
>
> Best regards,
> Jesung

We have to keep the std dep -- see
https://github.com/dtolnay/quote/commit/009af09c8252bf687e7f49e281fc47bc7d3=
c0749.
