Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840CB1FF1DB
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737119169; cv=none; b=CGczq3N6FNH9c4MdJkq4MWKlSwx+iBJwKeFWS2yVPykrKcfPAyVK5bDYFni1oqsesTlW6XlKCr5SUWUOqcql540qtJwC++TLvhanRR8JaaCmDRhGlvziHIkyT3fQlXPQc5GQ8r+FmGkVC5m9ovv6M4ptz98LMXqaqzsjN56LrTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737119169; c=relaxed/simple;
	bh=hQ9e6rbR6HiF0VYlbEEItopkOeT1txabxJnTwEAQWtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7zxYeHKz6Zpuo6C6mocsHcGQXwwFFB6HyxkGv0kwrngypfe7mXgTte5zOGH3HZ+aVQRN4Tlm5+0b+LMDa3NogVoVUjoS32PxnSUforQWbhaFL4tJUI3QQwanSJ55wFbjzsfIltwIMy/gz40XUVS35Wml2yHzvuOqTvKI0eV9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HkBoyQep; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HkBoyQep"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385dece873cso1147119f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 05:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737119164; x=1737723964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MffWZy2qG7Y6JWmoh4iHVpcAaSZTVr3Q5Le/78Z0tU4=;
        b=HkBoyQepFj8rA5LGyw8tTJKgtRmFNoVD9Y8hi45fLgT11oV9fEnnPbgx94MHnRmjcH
         09lzG3ZtHg2HBruL6G57oD8pLqWF/ECuo/e37bNxraU6ZI7BgjEV9QsP7Lh01bDOwQoJ
         zD/xbykgjgMct0c5Nnjb2wx9TO6oLm+5jz7f7R8shtyhJf6uEf6quonrXHeKuAe5642N
         SIGgBb6FkDIB9zC7uGqBWDHSOocTevDQ1uzZohY754ItlHOG3nrtAA+Z1k9n0XSmSMgZ
         Syn7BCgX4S8j4yynsJD6LFGWzCH9/y03WkPwFmsFEB4AgbJY0dDsKDiJfIt4B4siNaCW
         Qs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737119164; x=1737723964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MffWZy2qG7Y6JWmoh4iHVpcAaSZTVr3Q5Le/78Z0tU4=;
        b=g11T5wzDNbIycnsmGChYUYLarPgiT/SMoNkI5y7RChKtv4yC124s6mdVSda0kRH4aH
         8pwY+ABjHErk/EljiXpY4fZD1e5ej8yLEd4wzRye1Ojs9TD6CPVrkKWf2TEGAbzYbJ8y
         NrcaJAaGlPoJsepQ3HZ1ju7nb3Wu7Jv+/TMPeJ5rFpaba9IDZeRVN0wF85v8HZ/dqA1j
         cOjZ9Pf1t4c5/1QPRukWBCtK+CPyjd2xIXRLhdJuIz8saN8Q9g+YwU7vUDWeyD7prvt7
         5UKDdaf8+dMI/ywVDzxzlcROVnJNn6WNnhpx/Y+nnjRueiEFQ0Egm6cJxBcif0Aw2juD
         /aow==
X-Forwarded-Encrypted: i=1; AJvYcCUQWZNpIMJoFMRgta6x6GQ7zzgo1jTtBGRlZqiWRsRJFwyfFVtQ0BNAMUghPkt1EeOHbbwE25Dr6wmNUxGuxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yweh2DHtE0RilrISUdMfoWC6FKutkHN0wTlvSOcNtYsLfWR/16v
	0oEbhikw5ph9tQ0zMfEKscmzwwSIWn+weAyvdCD5TaGLtTSbRY8iH2FCPE0VfxLZXxRtViOTZ2T
	iqS593QI6dsVftouS8YtwXXpEfn2SN351szSy
X-Gm-Gg: ASbGncvp3f9gPmvKebDXY+QjBlvszv1aqC68UaTqDUB299cCphpycnnnveg+Q1qQEPY
	Kx3dcW00ZmhnKmNXTe4tH0iemc6EUvZhIY3tJYMA=
X-Google-Smtp-Source: AGHT+IFIrgN0kXkKi1laseLg/MV2oUQuJQaUgpoC2ZJDGiSWy3dT9jT1ButtO2C/XovaEoCIWMhN7wBieoH1VVtyfF8=
X-Received: by 2002:a05:6000:2a9:b0:38a:2798:c3e0 with SMTP id
 ffacd0b85a97d-38bf57c9b83mr2372799f8f.54.1737119163705; Fri, 17 Jan 2025
 05:06:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117.165326.1882417578898126323.fujita.tomonori@gmail.com>
 <20250117.180147.1155447135795143952.fujita.tomonori@gmail.com>
 <CAH5fLggUGT83saC++M-kd57bGvWj5dwAgbWZ95r+PHz_B67NLQ@mail.gmail.com> <20250117.185501.1171065234025373111.fujita.tomonori@gmail.com>
In-Reply-To: <20250117.185501.1171065234025373111.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 17 Jan 2025 14:05:52 +0100
X-Gm-Features: AbW1kvbrFl85FFffgJR887ohWA8nRSfhdN_SJdP7V78TZ56SODUNWQNtZKv4CjU
Message-ID: <CAH5fLghqbY4UKQ2n1XVKPtvnLfJ4ceh+2aNpVmm9WxbUTu8-GQ@mail.gmail.com>
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

On Fri, Jan 17, 2025 at 10:55=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Fri, 17 Jan 2025 10:13:08 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Fri, Jan 17, 2025 at 10:01=E2=80=AFAM FUJITA Tomonori
> > <fujita.tomonori@gmail.com> wrote:
> >>
> >> On Fri, 17 Jan 2025 16:53:26 +0900 (JST)
> >> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> >>
> >> > On Thu, 16 Jan 2025 10:27:02 +0100
> >> > Alice Ryhl <aliceryhl@google.com> wrote:
> >> >
> >> >>> +/// This function can only be used in a nonatomic context.
> >> >>> +pub fn fsleep(delta: Delta) {
> >> >>> +    // The argument of fsleep is an unsigned long, 32-bit on 32-b=
it architectures.
> >> >>> +    // Considering that fsleep rounds up the duration to the near=
est millisecond,
> >> >>> +    // set the maximum value to u32::MAX / 2 microseconds.
> >> >>> +    const MAX_DURATION: Delta =3D Delta::from_micros(u32::MAX as =
i64 >> 1);
> >> >>
> >> >> Hmm, is this value correct on 64-bit platforms?
> >> >
> >> > You meant that the maximum can be longer on 64-bit platforms? 214748=
4
> >> > milliseconds is long enough for fsleep's duration?
> >> >
> >> > If you prefer, I use different maximum durations for 64-bit and 32-b=
it
> >> > platforms, respectively.
> >>
> >> How about the following?
> >>
> >> const MAX_DURATION: Delta =3D Delta::from_micros(usize::MAX as i64 >> =
1);
> >
> > Why is there a maximum in the first place? Are you worried about
> > overflow on the C side?
>
> Yeah, Boqun is concerned that an incorrect input (a negative value or
> an overflow on the C side) leads to unintentional infinite sleep:
>
> https://lore.kernel.org/lkml/ZxwVuceNORRAI7FV@Boquns-Mac-mini.local/

Okay, can you explain in the comment that this maximum value prevents
integer overflow inside fsleep?

Alice
