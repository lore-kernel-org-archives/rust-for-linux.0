Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72CD14F9E2
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733764186; cv=none; b=mv9OJClyJ7oUUOd7a6FaB/Gj3Ic60RzLVG043sRO4uffHv5KLUxGaFt2Zk+FyR58zNL0VRnGzmjxlwbAyQqyA1uZyHcabzD66ejJtldy+xQ1rLjP2co2GRmSU0v/kFv5AMf0LdeZ4ebIsIEAAvEw2f+TDQcFfXFrKlnPRJ080TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733764186; c=relaxed/simple;
	bh=IxldwZyWmjuvlyEN/qWnV3PW0F6+cjUAqPUPOOibocI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=DcRuUeAtmS1WwU37/TFKcq0DvHw4wLBXkcSMphlyocWu0jULqT21Ln59VnqsXbaYMrnQXEp03i2sHQtp08COpCZxgyBWTgNFqN37Lr7i/Z5z0nnWitQgMaG1ZKmYxuwVa3d8lVCiXlqhhqRMoMemfTIHlUfnRbIX7mjXuACPSSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QetRFMGC; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QetRFMGC"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6eff0f3306fso19247407b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 09:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733764183; x=1734368983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3HuezRHPFMlkaEOsevzJT1yDSMBG/XxB5dMFT9DqOQ=;
        b=QetRFMGCZEqygNE0FYMczCOaqmfwsg7PtjRckKzG8Zq46/Ogx/S/hOkeGXzVnC5713
         UYugfr04EJyuRul/SWCO//DiGXvZy3Edwd6zpr6zopIZcN6JA+OwzbRthpUhdFvnWVtJ
         6ywie1dOhQ2SD//JOsiFhA5TPyexBzSnzym3nnDxGxAZFObY2hSpagYYNoFA1lJzxIeN
         cSHo9n4CEWOSxXK+8OtTyXZAI1bVyseCFwVR8M2JNh5x8x67Ho91E0+rlTJBLOTQ4Mdt
         mCMI8fZF2ZorC1RxHuES6uUeZT+Asa+FY6ugx70G+KUnpJGkooU50eVbPEr99ouzdLuB
         Y4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733764183; x=1734368983;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3HuezRHPFMlkaEOsevzJT1yDSMBG/XxB5dMFT9DqOQ=;
        b=U/2xq2sFLy4ajnV8pmWj26B92kMQpARKu+dGVoyCkihZ1dchfvRbNE1CaInhu0taMC
         OPZBAS1xVrhSWP8jn+sbzf1cZ5Z2gmV8myJXw84j8jtBcw2H9qSkPT0mjFoEsFRRmnwM
         KHxpuHu2MbHMurq367d9U/XQcZtOEVoL4RcvFM9Jz1CW5f5AIqp4jypVdPuEtyx1Jwiz
         5Erh3V+aNGikbWnJs+8x/sh6dJ74odueyaR4qrYN1HNR6BpkTfdM2cB+/3wr0RrPtga8
         XVO6QtANTHfjeVVdWscHZ8xAQSSenmiTpO0BD+uo+C+PdYa5t2rDl1LRcNa6Ii5BURcv
         B2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWBZxY2T+CFPIlHbMViRrsSLbjKoLuXnMZ2f+Rg0/TJ6Izndoa6bJ3A1/pM//NVhpwuX60XWMHXpZulhylHSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs/M/3pP/esNpM4+83BpE7vO3ah9MdvnGM4mFVRb8RbIu1FSPV
	LP+KfMXd80IpyxYzxvP/XxKgoqI3pM86beIMUqwaT/gxyKCweb/uqNBRDwjZencRnBxXiCzFtHI
	s7ZC8eAFf6bBq6J5jjb67KeiCzFk=
X-Gm-Gg: ASbGncse3aiHKcqXCcVGLueMsgNyZKHUR32wPNdqrO3TS0GkjSfSgA0az/bvMgwz+td
	lDCzGefmETM77OVgU0jdPtV/dSg6gKPQKfv+JkKd2oAvYUiylkEHCI9XT4BRb
X-Received: by 2002:a05:690c:6103:b0:6e3:37a7:8a98 with SMTP id
 00721157ae682-6f022e840d5mt14396447b3.14.1733764183700; Mon, 09 Dec 2024
 09:09:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
 <20241208222623.54714-1-dev.json2@gmail.com> <CANiq72=F1WCFbU6XuZNtXj97eQ7Pd9kh4sxVMyZVkJv4Eedbpg@mail.gmail.com>
In-Reply-To: <CANiq72=F1WCFbU6XuZNtXj97eQ7Pd9kh4sxVMyZVkJv4Eedbpg@mail.gmail.com>
From: jos <dev.json2@gmail.com>
Date: Mon, 9 Dec 2024 09:09:31 -0800
Message-ID: <CAOJvc-b0HiRUs7SEGcCbk+T+G_PDW9cKaoy4TbLLdm5FsERYyQ@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Boris Chen <boris.chen.czy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I use aliceryhl@google.com for kernel contributions.

Sorry about this, I will update with the correct email!

> Please use the version option of `format-patch`, e.g. `-v4`, when you
> send new versions, so that they are tagged as such. Otherwise, all the
> patches look like they are the first version, which is confusing for
> tooling (and people :)

> Also, in general, it is best to wait a day or two to give people a
> chance to review your patches, so that you do not need to accumulate
> too many versions.

Will do! I really appreciate the patience and feedback, please
continue doing so :)

> +    #[must_use =3D "if unused, leading to an empty critical section"]

> I am not a native speaker, but this sounds a bit strange. Is it
> written like this due to how it gets "rendered" by the compiler later
> on?

I agree this sounds a bit strange, perhaps it would sound more proper to sa=
y:

`#[must_use =3D "if unused, leads to an empty critical section"]`

Will give it some time to receive more thoughts before sending an
updated version.

Thanks,
Jason


On Mon, Dec 9, 2024 at 3:58=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Dec 8, 2024 at 11:26=E2=80=AFPM Jason Devers <dev.json2@gmail.com=
> wrote:
> >
> > The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
> > currently does not issue a warning if the return value is unused.
> > To avoid potential bugs, the `#[must_use]` annotation is added to ensur=
e proper usage.
> >
> > Note that `T` is `#[must_use]` but `Option<T>` is not.
> > For more context, see: https://github.com/rust-lang/rust/issues/71368.
> >
> > Suggested-by: Alice Ryhl <alice@ryhl.io>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1133
> > Signed-off-by: Jason Devers <dev.json2@gmail.com>
>
> Please use the version option of `format-patch`, e.g. `-v4`, when you
> send new versions, so that they are tagged as such. Otherwise, all the
> patches look like they are the first version, which is confusing for
> tooling (and people :)
>
> Also, in general, it is best to wait a day or two to give people a
> chance to review your patches, so that you do not need to accumulate
> too many versions.
>
> > +    #[must_use =3D "if unused, leading to an empty critical section"]
>
> I am not a native speaker, but this sounds a bit strange. Is it
> written like this due to how it gets "rendered" by the compiler later
> on?
>
> Thanks!
>
> Cheers,
> Miguel
