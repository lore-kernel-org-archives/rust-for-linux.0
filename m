Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B11A0BD6
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 18:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740509708; cv=none; b=Stt79VhKWjRxznf75wEvHNvptnJb6jMKtpyyNzG5kIQfz3j9hH+7+dPgoSHCkq+hWdZuFmRqTMPhtl5c2huEdDp3c/k3GKQhNEIInnKpvQBjaqHQkBlTKKbPkxP0GKpp4UL/2N9RW6Za50lSnuAQ2imSL2lfBWJoioztsMKy+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740509708; c=relaxed/simple;
	bh=PYHSgLO7lQsS8Kx+B9mtZoE1y7zDRkButLc9RwemdLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REBE6RHYw05zKbp5dYlQbLW0tsiWQlqKt4y1fkT+cn222oVACpG9iqTNC1kTlPzFp59L9XjMkJnRpS8radWJz/xjEZuGwQOWVuJeoBmozPI5Q0YrWGOwvXwZ5/+iPv1KgEh5jIfhsJerklXJGqnpQoF7JDhsy/hyA3om2PWfJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hHNq/Wot; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hHNq/Wot"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so9538344a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 10:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740509704; x=1741114504; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i+rWhtD5x8D6XUhYZf1P7I+awMTvGfoNgd9n4DqDTvI=;
        b=hHNq/WotNYTl3z7a+5CNnaT3hnGJuXTtwQmwKDbmKzrg/75nP9y0CA/38MGzA4YuaV
         /0lpfjR/1WyxszTo9drZgCx1PFms6IUe7xzEeaklxeGgYNQ+3pzkE+EtlNHIwYhfaXBk
         FeOtZx2s7jfJnzJDcKB+yA0edvPj9xo9Z/1LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509704; x=1741114504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+rWhtD5x8D6XUhYZf1P7I+awMTvGfoNgd9n4DqDTvI=;
        b=GvV7RbmJI7kT/37MYdAL+5JC/wvujpAtBimaCK64EvSHtLIIe4ODR7trUUk/NFk7kz
         S6qa3uIf6U2NwmXNwc4Dq5fr167bBN0cKA0WmNESfzkkoPMkRI2jA7cNk60ZC2u0hHrH
         5uv2VwmCaPprwtbc3d1z9iuh/JbsyDF0tRc85x5r9q6lADC99SHTrotPPwMH3zsTr0YM
         6V5IElr5IhOF/nC7UpnEAiEvipEpNALa0f/EmS2ud8jK+BaRkix0xnVKQWmXTGKKQHfb
         gj+2mzPw6NJr8yPgZA7gKfuecKE63E8sMKegJyH0W2TRHX6NWXiVd77wb1+Ew8YOJD0j
         bwvg==
X-Forwarded-Encrypted: i=1; AJvYcCWvI0BfrUPysTQ5484FMwQGPKY/PfPqbZQHMq35GMEJJ3hzP342DLC5+Qmj6KmuVZBUOU3OHghPXL2xFK8buQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlxTxaoQrOtg0NYZ+UTutEzHzMiRQ39RuCeobg9TpqMUHeSMGo
	v5ETaHrcfXkF/jBliGeTRGqK78T2uZvb9KyfkYUa1T6swRkmeP/4mv3876ictoibB0JurBl3qpp
	Vu9U=
X-Gm-Gg: ASbGncuRaJUUedoQcDnQzA9c6Tn1mPR8fa2dX3eAIyiSoKqzU6iSp/WK7zWSf7TKmpZ
	rVeYGsF21phHj3dDJNyz0j3WU5QnMl8fz0+DaG1b7VXjWkp4pOw3/Q0atU4FfhZCa6H/bHUG2TZ
	9pPECpB1aUdrlNZyx91LQpJCgj3WmGRTHhBA0g7Z1YOh0WtiUDLKIAU4pstDLliwZMOLR6CLBBG
	nKT9P3FzcMLiSm6h+4XOorL1rAbS0f5kpcGkYTdv4xRZlH8MRYbiCABFrANKi0kb9ngDB4xDDY3
	a612hmn3KmSTBgVk8knR+4YkkL1q7LSXTf9dJ1utUe8C9ufbQczNgwOo3YrB8lQrOZoxEybykmU
	n
X-Google-Smtp-Source: AGHT+IEH8BDfnODoXc5USWk6r7MRrFtkKtpQR7hNClGkLo4fC+N4CacTKmkkiZTTK7Hepibt6w8rdw==
X-Received: by 2002:a17:906:c103:b0:abc:c42:5c7a with SMTP id a640c23a62f3a-abc0da2f10bmr2098743566b.31.1740509704337;
        Tue, 25 Feb 2025 10:55:04 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20466a6sm183341966b.127.2025.02.25.10.55.03
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 10:55:03 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so9538296a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 10:55:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUX4qxiSad0KlTTi3JrItjSCiIH3lLMvpbTuWQ9qLUom2X5Q98y0EyoqKdU4KOlJsG5OmqAxCQzM2GGV51lIA==@vger.kernel.org
X-Received: by 2002:a05:6402:2b86:b0:5d9:a54:f8b4 with SMTP id
 4fb4d7f45d1cf-5e0b70dc05emr16845178a12.11.1740509703150; Tue, 25 Feb 2025
 10:55:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com> <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
In-Reply-To: <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Feb 2025 10:54:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
X-Gm-Features: AWEUYZk0cXay_isXRx72KKy4FfsgUiBHKihS09o_3cl8pFnpf_e0Ez6oe_KpUXU
Message-ID: <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Alice Ryhl <aliceryhl@google.com>
Cc: Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2025 at 08:12, Alice Ryhl <aliceryhl@google.com> wrote:
>
> I think all of this worrying about Rust not having defined its
> aliasing model is way overblown. Ultimately, the status quo is that
> each unsafe operation that has to do with aliasing falls into one of
> three categories:
>
> * This is definitely allowed.
> * This is definitely UB.
> * We don't know whether we want to allow this yet.

Side note: can I please ask that the Rust people avoid the "UD" model
as much as humanly possible?

In particular, if there is something that is undefined behavior - even
if it's in some "unsafe" mode, please please please make the rule be
that

 (a) either the compiler ends up being constrained to doing things in
some "naive" code generation

or it's a clear UB situation, and

 (b) the compiler will warn about it

IOW, *please* avoid the C model of "Oh, I'll generate code that
silently takes advantage of the fact that if I'm wrong, this case is
undefined".

And BTW, I think this is _particularly_ true for unsafe rust. Yes,
it's "unsafe", but at the same time, the unsafe parts are the fragile
parts and hopefully not _so_ hugely performance-critical that you need
to do wild optimizations.

So the cases I'm talking about is literally re-ordering accesses past
each other ("Hey, I don't know if these alias or not, but based on
some paper standard - rather than the source code - I will assume they
do not"), and things like integer overflow behavior ("Oh, maybe this
overflows and gives a different answer than the naive case that the
source code implies, but overflow is undefined so I can screw it up").

I'd just like to point to one case where the C standards body seems to
have actually at least consider improving on undefined behavior (so
credit where credit is due, since I often complain about the C
standards body):

   https://www9.open-std.org/JTC1/SC22/WG14/www/docs/n3203.htm

where the original "this is undefined" came from the fact that
compilers were simple and restricting things like evaluation order
caused lots of problems. These days, a weak ordering definition causes
*many* more problems, and compilers are much smarter, and just saying
that the code has to act as if there was a strict ordering of
operations still allows almost all the normal optimizations in
practice.

This is just a general "please avoid the idiocies of the past". The
potential code generation improvements are not worth the pain.

              Linus
