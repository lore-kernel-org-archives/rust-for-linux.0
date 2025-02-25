Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB420C48E
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518705; cv=none; b=ZHp6vOnV6nc983o/Pd8rO3MUQtxlUeyirXJUEGsTtdhnLytzLOSUqbGCh1zJw0S362gDEkKmW4c/OjhXjHCtDgkpX0nSaD1ALLhbzXOt5g++JKBwYrchua3yA5gvJwUG6XkrqWRsyJJW7FyQ5Nex8/inetHwSEeRxTKPiMYHLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518705; c=relaxed/simple;
	bh=TT313L3NHuTIEIP3Ta9oDB6MUWAlR8LnnBX8lq4WH7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heh1xtRhsBln5fX2Wf83YptSUSp+kD/7Iq9Iz2R5bD/5uKbx5vZn7f3ibzAX4XDGhNCcJqfcZeV8wkdNEOE+q1muEG8jkwLNFucA7jl9hd+qWsoQnulJlUgXM+MaxWj18W5qbZB7bUxh+TDiMCK2ustVP6yeqrpXpUMF2/7fGY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h7DIY8tW; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h7DIY8tW"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab78e6edb99so864416966b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 13:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740518701; x=1741123501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVCy8UyD4kIHBFsMDFYHTvvtj3ZtXS1BkBR61VGCyI4=;
        b=h7DIY8tW8KEOiYiKTAqPXHnVc/aDTbpMSaS6uKoKwAFu2cYFA02PfJksrOcC9KzbXl
         6OOD1XcVbuakbz0qi3d35E14t7VHUd84ezydlN3Q3qCa43PgUKLoWDF7NxdGmdEZb0X3
         AbBhtq6bwet5hYOI2AkC6iRbK2SpjCmuyKw5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740518701; x=1741123501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVCy8UyD4kIHBFsMDFYHTvvtj3ZtXS1BkBR61VGCyI4=;
        b=lhsAAX5nCjv0Iu6HxhZcbE8I7mYXTjPxDac9BcRQ/5gm+WxPjIcN7DDgGvUH+OlyZt
         hqM/RTfBi7E50PMSJoy9bL0Gzho7g1wEw9J3DDZhc3vtPvZORxNKZLXiZiN7lmYOQsV4
         bdttjaZ7fXtBP1ckq34tbLDkxHOU7mhYHFIC16r1f8/fECr5hiuhBDqxK+mvwpJv9HW8
         djuaSU+5fTl8qHD8dCaHhocxy1E1JIQ9D4JRynwCTxBuBIhjGvVdjHBJm47Gz90H2N7s
         ckXfrSDeMy9FpaCRVWYq2SyhH1C9QpE50fdmRiXnU0rqORkkcaIzadEt0pVEPZ3IPZaB
         RwkA==
X-Forwarded-Encrypted: i=1; AJvYcCXoTryfjJaSNPZnhimowkNZNUA29IVmcCYUaqm0u9DhrDJEO3+vlzS5dUV6zLUYaMXk610/59ZhlfzhH32/nA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd9aq/l8RAv5uEGJ4EHTfWQiwFTrfza4RMSc5X71bFb4BQ+B51
	wBvu9rjc7FlSTTWJdowFTDdxK2G/uC8t+7dgAITFSQZ5aWI6RPES1B6ekIWdTRJ2GXLz+alRBfw
	MKVE=
X-Gm-Gg: ASbGncuh/kvozBvcx7haP2nrGsEhBjtlEzhUXqp/IwnOPY+96novNq7Vw0lOsRCfggc
	8vkDTanwNu/E+UeWcHMvWebaP1mK3cZTJddPxnn4SpbDaOfEfrQosDNPzvCZqKW77CWzcI641ap
	tqdRszV14EOliAM8/gWDVpAiPRNGDvADxBbJ6lpcAD8i28kZUYXsgalmorddzz/rUlLZAazvnUT
	MHk2oFfxpnx0gCc/ZVMcaCwyHZOy63pYfOWes/KHj0IJ3uo7ZK0gpkGd6va0XPmYadEc/m4OzGI
	i9inLRmxl614w7PPAnpMgpVr7C/zySjQMsM2eGyVzbj+KshzPwca7p/B0ScS1B40rtoUUC8QOeY
	U
X-Google-Smtp-Source: AGHT+IFEG3AMCav/cjnrF6kBhXnGj9/hdn15HUykaWiLgj5gOwRd8k2NJf+qz3ocfAsAtWBU2zYt0g==
X-Received: by 2002:a17:906:32d6:b0:abb:514d:1f39 with SMTP id a640c23a62f3a-abeeedc2519mr66751166b.23.1740518701097;
        Tue, 25 Feb 2025 13:25:01 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45a8b8b48sm1776140a12.20.2025.02.25.13.24.59
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:24:59 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e0452f859cso9639357a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 13:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWWPmyuJuFd+lIauiLrBRrhYqt0P+pIBCuVTSFaBLv0dsI8Rqaou2Dkk0vAnaqtCcrj2jHJaVFrmfgUNCr4w==@vger.kernel.org
X-Received: by 2002:a17:907:86a5:b0:abe:ea8d:a8a2 with SMTP id
 a640c23a62f3a-abeeee40ec6mr75902266b.33.1740518698732; Tue, 25 Feb 2025
 13:24:58 -0800 (PST)
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
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
 <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com> <4l6xl5vnpulcvssfestsgrzoazoveopzupb32z5bv6mk23gazo@qn63k7rgsckv>
In-Reply-To: <4l6xl5vnpulcvssfestsgrzoazoveopzupb32z5bv6mk23gazo@qn63k7rgsckv>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Feb 2025 13:24:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgMnSOnaddFzfAFwjT-dGO9yeSkv6Lt21LgWmCKYCM7cg@mail.gmail.com>
X-Gm-Features: AWEUYZmB_Wr6TV7gwJy_39meCdZ0vPmT0Ykzda91InpP6j1aByc6OUNdAIm7q8c
Message-ID: <CAHk-=wgMnSOnaddFzfAFwjT-dGO9yeSkv6Lt21LgWmCKYCM7cg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, Ventura Jack <venturajack85@gmail.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Feb 2025 at 12:55, Kent Overstreet <kent.overstreet@linux.dev> w=
rote:
>
> The problem isn't that "pointer aliasing is fundamentally unsafe and
> dangerous and therefore the compiler just has to stay away from it
> completely" - the problem has just been the lack of a workable model.

It's not entirely clear that a workable aliasing model exists outside
of "don't assume lack of aliasing".

Because THAT is the only truly workable model I know of. It's the one
we use in the kernel, and it works just fine.

For anything else, we only have clear indications that _unworkable_
models exist.

We know type aliasing is garbage.

We know "restrict" doesn't work very well: part of that is that it's
fairly cumbersome to use, but a large part of that is that a pointer
will be restricted in one context and not another, and it's just
confusing and hard to get right.

That, btw, tends to just generally indicate that any model where you
expect the programmer to tell you the aliasing rule is likely to be
unworkable. Not because it might not be workable from a *compiler*
standpoint (restrict certainly works on that level), but because it's
simply not a realistic model for most programmers.

What we do know works is hard rules based on provenance. All compilers
will happily do sane alias analysis based on "this is a variable that
I created, I know it cannot alias with anything else, because I didn't
expose the address to anything else".

I argued a few years ago that while "restrict" doesn't work in C, what
would have often worked is to instead try to attribute things with
their provenance. People already mark allocator functions, so that
compilers can see "oh, that's a new allocation, I haven't exposed the
result to anything yet, so I know it can't be aliasing anything else
in this context". That was a very natural extension from what C
compilers already do with local on-stack allocations etc.

So *provenance*-based aliasing works, but it only works in contexts
where you can see the provenance. Having some way to express
provenance across functions (and not *just* at allocation time) might
be a good model.

But in the absence of knowledge, and in the absence of
compiler-imposed rules (and "unsafe" is by *definition* that absence),
I think the only rule that works is "don't assume they don't alias".

Some things are simply undecidable. People should accept that. It's
obviously true in a theoretical setting (CS calls it "halting
problem", the rest of the academic world calls it "G=C3=B6del's
incompleteness theorem").

But it is even *MORE* true in practice, and I think your "the problem
has just been the lack of a workable model" is naive. It implies there
must be a solution to aliasing issues. And I claim that there is no
"must" there.

Just accept that things alias, and that you might sometimes get
slightly worse code generation. Nobody cares. Have you *looked* at the
kind of code that gets productized?

              Linus
