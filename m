Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691013CA81
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737124282; cv=none; b=pwEh6RQmNCqiQA909aBWZ5GoNj6JpyIgN7rusYvswu+1U4LdX8oPyqcwNUoujolPPJyKbrEv/lk3fzAmaswQQGtyKWhb790iDZhc4tOGXLDuTdfrt3Mhm8as5LFscr5nesiioTkUrpBOIlrDNUF4vIneQNI2ONefN2RK7lKNT1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737124282; c=relaxed/simple;
	bh=3ao/GWH5Tc2xAnwaRzHtnnwvVkVRW9lwqtS8ByvomIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CulZP51vozMG7fJV0LQXqPFNKfrXDVVJGbpvKgsed6BwczdTt39Y1lZ4Sy/FnATC+Vjk9dfptC3XiXKuDN9uNjitkRzzMKXb0UD1PYuIffV6gh58BzJSHI/CXewbQNcmTinTAXEoHxgnsJO3qd/dxjfARrjOJXBpCme1NK1olcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rSxBdML6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rSxBdML6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43618283d48so14814675e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 06:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737124279; x=1737729079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR55i3HkYctE7pnXIlYdROvAQkAqVIwUg/mFNkzAzc0=;
        b=rSxBdML6vUtDXjGNOQefMmw+vp2iczk7QX6SeqbM2/iRpEuEc740x6SMjVwL0osccM
         0RM8metTvwvQA8DwgfGaHcHhY0crrDMwFKHio0PF+49TJCHkz+JW3KMlcsO64fUUzAco
         URBr8G4wEumubQRwJcjyLHLLosyrkIGJpSvuXnP/hODVm92IobrmkGvpmqaZHLPna8w2
         kNujZDyHxDQZdcC4XIhyQq6AgT06IPjTunWC9s29uRkJKSVdykCT7mQSVEU2lwlBwpOV
         NgpgMuW5QfkdPuXV1kEg2YbZDKRSDOxMgfKQ++QnF5JU+HrG8P8pOw7kVRvs3sRVQHQ5
         YS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737124279; x=1737729079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SR55i3HkYctE7pnXIlYdROvAQkAqVIwUg/mFNkzAzc0=;
        b=vPLgEevgWXIhGJ05E0gdlmtOAODFu5fxa2f7pUg0dt+eLdMKcrDHjOyu2TiT8Y6Vcx
         PFCZ+Lqczs6exmAqJv5QQ/60RQuUGzDzyA+nPLhwoTuBk0KzCPP3DpRYMBzrPp3SqQ1i
         mxdt4IsfkoyiqxdyE0ry0ETLdqUBycyh36/4F1INIlyj8+cbnd1/0cC4fFvTXYQLV/MP
         xtkaK1eApCdMscHtUpc0CO64t77CMPDugvgVIEUJyehhBZGFy2nKZEqHRUJ8oJu2zdgx
         r4pB/gO5f8S+DNtMQfEe8RCdqMWAlhqeNaC+bsWhlSO5vbrF2rc14RfCrM8SBoUsZNYJ
         TGWg==
X-Forwarded-Encrypted: i=1; AJvYcCXms0vM3E0ETY5N+HHv8sf1DEaTNoYrDLa/QL3ZtGLXyr5TTf8UDe2N8S1GuXgpxBnEW+LbyMn2T84b2bKrkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtajENc2IFI20FgI0f87GmZfY8mqF3645WpxXNRcHICDGVtaqR
	3uvtmlK/R65arncwBY+V+2cPO9lFKcV3808zSzq3y9Py+kGOqgDt+xV9bnShAm8RNOOHUrAeh4b
	HEOwuLw9f/Jt2MCBffaiscZoGueBPlg51GPH6EIkRFmYF/kX0RQ==
X-Gm-Gg: ASbGnctGKzNSTRtTK4Rnht2UoBCXPKWBl37lROUqaJjXAXMrU491VtHX3gyKrLd0gSq
	/zNmADKAtw64Ub9fGOxzlAaG215uXIVHLJw5NcKM=
X-Google-Smtp-Source: AGHT+IGODadZTBAPzKwgax05vY9NUHUfkPNs+7IG+444xS58i4EJ6Pre/dh+yQmUcOszmxuzeJpeMHnIsaQ/pkp5F+c=
X-Received: by 2002:a5d:508d:0:b0:38a:673b:3738 with SMTP id
 ffacd0b85a97d-38bf5688e01mr2489905f8f.33.1737124278795; Fri, 17 Jan 2025
 06:31:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLggUGT83saC++M-kd57bGvWj5dwAgbWZ95r+PHz_B67NLQ@mail.gmail.com>
 <20250117.185501.1171065234025373111.fujita.tomonori@gmail.com>
 <CAH5fLghqbY4UKQ2n1XVKPtvnLfJ4ceh+2aNpVmm9WxbUTu8-GQ@mail.gmail.com> <20250117.232015.1047782190952648538.fujita.tomonori@gmail.com>
In-Reply-To: <20250117.232015.1047782190952648538.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 17 Jan 2025 15:31:07 +0100
X-Gm-Features: AbW1kvYSufSejqtJamYDlgBaixJFLn8sr1F6oBphlqAd7AYJWrHcRO2_8GhIn5w
Message-ID: <CAH5fLgh7jpDyOGJPpasSK8E126YUUL+gj37_2RQr8m2fE9ifVw@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] rust: time: Add wrapper for fsleep function
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	anna-maria@linutronix.de, frederic@kernel.org, tglx@linutronix.de, 
	arnd@arndb.de, jstultz@google.com, sboyd@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 3:20=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Fri, 17 Jan 2025 14:05:52 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Fri, Jan 17, 2025 at 10:55=E2=80=AFAM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> >>
> >> On Fri, 17 Jan 2025 10:13:08 +0100
> >> Alice Ryhl <aliceryhl@google.com> wrote:
> >>
> >> > On Fri, Jan 17, 2025 at 10:01=E2=80=AFAM FUJITA Tomonori
> >> > <fujita.tomonori@gmail.com> wrote:
> >> >>
> >> >> On Fri, 17 Jan 2025 16:53:26 +0900 (JST)
> >> >> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> >> >>
> >> >> > On Thu, 16 Jan 2025 10:27:02 +0100
> >> >> > Alice Ryhl <aliceryhl@google.com> wrote:
> >> >> >
> >> >> >>> +/// This function can only be used in a nonatomic context.
> >> >> >>> +pub fn fsleep(delta: Delta) {
> >> >> >>> +    // The argument of fsleep is an unsigned long, 32-bit on 3=
2-bit architectures.
> >> >> >>> +    // Considering that fsleep rounds up the duration to the n=
earest millisecond,
> >> >> >>> +    // set the maximum value to u32::MAX / 2 microseconds.
> >> >> >>> +    const MAX_DURATION: Delta =3D Delta::from_micros(u32::MAX =
as i64 >> 1);
> >> >> >>
> >> >> >> Hmm, is this value correct on 64-bit platforms?
> >> >> >
> >> >> > You meant that the maximum can be longer on 64-bit platforms? 214=
7484
> >> >> > milliseconds is long enough for fsleep's duration?
> >> >> >
> >> >> > If you prefer, I use different maximum durations for 64-bit and 3=
2-bit
> >> >> > platforms, respectively.
> >> >>
> >> >> How about the following?
> >> >>
> >> >> const MAX_DURATION: Delta =3D Delta::from_micros(usize::MAX as i64 =
>> 1);
> >> >
> >> > Why is there a maximum in the first place? Are you worried about
> >> > overflow on the C side?
> >>
> >> Yeah, Boqun is concerned that an incorrect input (a negative value or
> >> an overflow on the C side) leads to unintentional infinite sleep:
> >>
> >> https://lore.kernel.org/lkml/ZxwVuceNORRAI7FV@Boquns-Mac-mini.local/
> >
> > Okay, can you explain in the comment that this maximum value prevents
> > integer overflow inside fsleep?
>
> Surely, how about the following?
>
> pub fn fsleep(delta: Delta) {
>     // The argument of fsleep is an unsigned long, 32-bit on 32-bit archi=
tectures.
>     // Considering that fsleep rounds up the duration to the nearest mill=
isecond,
>     // set the maximum value to u32::MAX / 2 microseconds to prevent inte=
ger
>     // overflow inside fsleep, which could lead to unintentional infinite=
 sleep.
>     const MAX_DURATION: Delta =3D Delta::from_micros(u32::MAX as i64 >> 1=
);

Hmm ... this is phrased as-if the problem is on 32-bit machines, but
the problem is that fsleep casts an `unsigned long` to `unsigned int`
which can overflow on 64-bit machines. I would instead say this
prevents overflow on 64-bit machines when casting to an int.

Also, it might be cleaner to just use `i32::MAX as i64` instead of u32.

Alice
