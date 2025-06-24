Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77929548EE
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776374; cv=none; b=oIDRCVu8SmI5gSWCarqqb9cEEW57YPaZYWCCMQ4kPS7B5IAU00/cyDN4LUgMaL0qKt6FMb2YvyGEmuUuGjQXEyVHJLeAWjTd/Zjkpj7wMvJtrcipVS5gVd2iN09F8MLtbLERYbg3kPZRfXfYPhg+aCFD9osNBUA6Pg0aVebufyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776374; c=relaxed/simple;
	bh=fpQtH3m+Buy5V0o+6pHjXk30B76hPNJiMVvgv6xQqyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbYcrblGPfjECDcocxx84KE8rnNIzrYnmJzThTUMq79hQEOuT2xnaRWuN9usUbQrmQa80HMr+SDaGlJmkyVGp2wQTFDvNRXijnE6Hb25Cyw9DGOfxId3f7qFaW9z/3ADCjngtNCubr71hNciQNuzxWFPdYyZmd5MEnaDMIExHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TXAzOaKH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TXAzOaKH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450ce671a08so35656675e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750776371; x=1751381171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B17wxUutzGipZBNrlcMNl3UtuYA1TkBjtVYOtdCY5U=;
        b=TXAzOaKHGyOWtFsL387yaBkF5aHmPVQKABupRR0ICweAX6SsBn734ZX531IYn0P/UV
         tA3ATzIREmE2ptjhwia5wlH3fyVrNATcCFF8EsaTkOeeCwK+6OaGk1C7sE+7bN8DUHmK
         MJ3IYJhXHjXRWbs9Bzw6nVuqv3bXfrlK7iRWdwIiq+QrhLEzFOO7qc8GE12PBZmWD5Sd
         esf6tlJa3mCh/aB79yrBgMbmNbzLdpeZn2bRCzs4UuoSYTYmMmlsOK0L41H/B0pRz/y4
         40RUrqMRjpUnuQlCG1Sb1XTSSa122PvV2S7OKXme0AznTmLOXQYSXLS60fXT4D+CU9me
         KYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776371; x=1751381171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B17wxUutzGipZBNrlcMNl3UtuYA1TkBjtVYOtdCY5U=;
        b=OyN9icKIUvirD87w6IgGjj8M4r9B5XqyEKj97FA61pHgPIof91alKarZQzVOH8o8v1
         Nrm+UyhQOfMX8VIgsQ88Qd8NcoDQ48IfUWr0szI97Eohgzgp+r7bIN71r7OUUJ7ZvNdz
         fFiQV62ucYuQDJpHDrKzoOglqc3bmlDgV4imCwa9VwP1koKOgybm7eqd978cts1HYAbL
         nrAOIW/aHHHuTH0eST5K+EK5b2K2/gFu3BYagYmLNDfiVQ8NARvPZLZ4V6ij/HJdnDsd
         saWUfU/2Q/XBtjJOWBP6zMRBraWgCs++Nq1eWSkOBz3WLu/lmuojB8HybhDWMZI4X1Xa
         yr7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/0J3bMNjVop3j27EsDhKo1rvthVDnWP5iL3ARnX9KBcZ3k1K471S4o2FgJL3omUYPI+nxTNFKsnhODgVfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZwVwO1EDz/4eEppy2DSOep0EEW8Kv66KXdGlQZLeCbnMI5Ur/
	bw1JvjnNqDE6xYFTjWR98NWKNCFqe8V8+viovkgBf37l03XwdDdhdwwZatBEX9kJII5TVH0j5Lr
	D0duFxrCyFKlmznsLu0CtmNg3zmyoUMJncxk4wmBn
X-Gm-Gg: ASbGnctTa6IiJw0xVmpgsfUc/uk35n83/DLQNE0Yf9zQtJk83RyJRtb4M84iGvcU6h+
	3vvefaITO9Ml9IVKPC5DO9dzzmEFqxdHWBlVEJYAOHjV+CDisIO5w6bbrxbtYnlB50OPI1wxArR
	WCbauVkujMIzCERHJc52Pa5WJHNd9sU0seN2+K3JChJDU3JiG8HOsbBC3yM2hGVpcOnSDaGI23P
	eWqhnbq09U=
X-Google-Smtp-Source: AGHT+IGGEmbBkLAeQIpZqVAS8Ho8nmfsMx3x32gEmNIuKsK216VxXuTQqNoiOeA6GmRO962D5XNQECF2AhVfeUhb1Sc=
X-Received: by 2002:a05:6000:2182:b0:3a5:8a68:b81b with SMTP id
 ffacd0b85a97d-3a6d130e818mr12513027f8f.44.1750776370669; Tue, 24 Jun 2025
 07:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgjJRbjPnN58RuaBtNrY1A-tif3ohETLxdbaE4b46Hjbqg@mail.gmail.com>
 <20250624.224923.1801832299260163743.fujita.tomonori@gmail.com>
 <CAH5fLgjttTnev2h4J-hF-LdUTJCoryJyFm5_LqJ6_GBe+=An5Q@mail.gmail.com> <20250624.231428.764205178512881259.fujita.tomonori@gmail.com>
In-Reply-To: <20250624.231428.764205178512881259.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Jun 2025 15:45:45 +0100
X-Gm-Features: Ac12FXwClnNuGLTT3yqGfd5t9mEBU8F0w4jwSmqRtUpckTCZ-bsUZFevPpAelbM
Message-ID: <CAH5fLgi7R9iVXwU+k6vvQYHyxix-sU_OL0nKZsbnuuFDJjAMTA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, ojeda@kernel.org, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:14=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Tue, 24 Jun 2025 14:54:24 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> >> >> So would the function be defined like this?
> >> >>
> >> >> fn as_nanos(self) -> i64;
> >> >>
> >> >> If that's the case, then we've come full circle back to the origina=
l
> >> >> problem; Clippy warns against using as_* names for trait methods th=
at
> >> >> take self as follows:
> >> >>
> >> >> warning: methods called `as_*` usually take `self` by reference or =
`self` by mutable reference
> >> >>    --> /home/fujita/git/linux-rust/rust/kernel/time/hrtimer.rs:430:=
17
> >> >>     |
> >> >> 430 |     fn as_nanos(self) -> i64;
> >> >>     |                 ^^^^
> >> >>     |
> >> >>     =3D help: consider choosing a less ambiguous name
> >> >>     =3D help: for further information visit https://rust-lang.githu=
b.io/rust-clippy/master/index.html#wrong_self_convention
> >> >>     =3D note: `-W clippy::wrong-self-convention` implied by `-W cli=
ppy::all`
> >> >>     =3D help: to override `-W clippy::all` add `#[allow(clippy::wro=
ng_self_convention)]`
> >> >>
> >> >> https://lore.kernel.org/rust-for-linux/20250610132823.3457263-2-fuj=
ita.tomonori@gmail.com/
> >> >
> >> > Are we missing a derive(Copy) for this type? Clippy does not emit th=
at
> >> > lint if the type is Copy:
> >> > https://github.com/rust-lang/rust-clippy/issues/273
> >>
> >> I think that both Delta and Instant structs implement Copy.
> >>
> >> #[repr(transparent)]
> >> #[derive(PartialEq, PartialOrd, Eq, Ord)]
> >> pub struct Instant<C: ClockSource> {
> >>     inner: bindings::ktime_t,
> >>     _c: PhantomData<C>,
> >> }
> >>
> >> impl<C: ClockSource> Clone for Instant<C> {
> >>     fn clone(&self) -> Self {
> >>         *self
> >>     }
> >> }
> >>
> >> impl<C: ClockSource> Copy for Instant<C> {}
> >>
> >> #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
> >> pub struct Delta {
> >>     nanos: i64,
> >> }
> >>
> >> The above warning is about the trait method.
> >
> > Wait, it's a trait method!?
>
> Yes. Clippy warns the following implementation:
>
> pub trait HrTimerExpires {
>     fn as_nanos(self) -> i64;
> }
>
> Clippy doesn't warn when the methods on Delta and Instant are written
> similarly. So Clippy is happy about the followings:
>
> pub trait HrTimerExpires {
>     fn as_nanos(&self) -> i64;
> }
>
> impl HrTimerExpires for Delta {
>     fn as_nanos(&self) -> i64 {
>         Delta::as_nanos(*self)
>     }
> }

If it's a trait method, then it should take &self because you don't
know whether it's Copy.

Alice
