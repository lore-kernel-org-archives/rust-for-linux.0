Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B83156CA
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765645737; cv=pass; b=tz8bug2M3veGhxMrPZJw50Qh3TW+S+FWrMar9/vmmoWA29LY16qREFE62Wqew4S6ZdrPlpRJHA1hbEnUiKvrdYPgDTqUhvsOWYnxh9T76oij2l4zbiCsE8Dohc0fYb17Vgn7vgUGqnwAVT1gytLpKOGLP0EiH/LVIcZaG+taG9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765645737; c=relaxed/simple;
	bh=t9JIb8QO135EY6M46vjmO0ixlchRQbC1rgVIQHJnezk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAPTakeU6NyIN7uxHgVf452bomRLZ+ridc8xyHX9cVZDmUVmodribYUzWM25LIVWu8SfsfbFkGxsWaQ8lK/jIfMc0bTakNuAj5isrWsvKpp3SvKw2NUOWxKDzPAl17Q6aX3hAvimwMC8NqHk4fkj8s7ltIpcc+jgm05DbfMV9eY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1j8UIb1a; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1j8UIb1a"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-644fbd758b3so30388a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 09:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765645734; cv=none;
        d=google.com; s=arc-20240605;
        b=PMo8Ls6LEUOqjpUGny/RyCxJHPXKN7/aS44tmPSMPy3Y+5TqbEk5xagW+FpZYiYBOB
         HtgFTDu8gAStIlSz0Zw3Xx+J9cnYGhnGOBcr6dO8Q+k6wLLkqNv9p+Gbqnfi0mWUgqYq
         JgCu1nerDmwB2ylcvLMnrNlgU6NGFG8MZsVv6L3JjknsR6CYREa+Q0/Rrju/Fq2rDxr1
         aOOx84FJJAHAiy9B1aPZcg6bYZRrrqxUAOyEL5s7KjJLnEHjn3ZdAVj71DNy9/TcYH+y
         z7TRiSdrCEHLIijjq3I8cnkwkpElT3QuGuqQ/tjNlgP1ZOpaGJ5/zrc0Rfnpl4Iuff4+
         glWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PR6IrNem4+1GT63TbNNE6XIVgBmCZ50K2RrZ5zPf7Tg=;
        fh=VDqTwBpeEAvDsPe/1VJPbrCGjEy1EwOjdWecazI/aQw=;
        b=FEWLE9n/TM62Rj3wtf04rWJ4ZeAQ+snReu0upf0H3YiL0pok4EkpUsCfC/YRWVgJVu
         FWKwX4UVUb3uYcRjxcBxamjFEmCkvs16Qey2djAK+P2HznzAQsXysIkStUWQLpNj1rOA
         521dWg1zevD0gPqBvOfX7QTpdBmncdgBq67OA7OXQJ8kjUBAijhVLpycAS/t697Y8mKk
         nMcQQduvJI1yzc+jE2Iav8ahDON/w9wQ+YYygALPpN6yIZ22G7n3RT2/MkbWitVwosVR
         /RRNc69CmOrjy9irCqO6/S3n/kVl47S7yI1MrmaS0oMR2hc+KLnRV0OIfc8fUhzYcc/I
         +RrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765645734; x=1766250534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PR6IrNem4+1GT63TbNNE6XIVgBmCZ50K2RrZ5zPf7Tg=;
        b=1j8UIb1aQ3IMGr0l0Q7aUZ+2F4J2M6Aj1lfSpgRMn0bviucOYJMRrhjyB8h7/1uPIx
         Qwdub/Nfskx9Ec9dG9rAv68KV9SGYxqdeKJ26AkP8sB4KdmJNzscp38zPotcOzl8Qspg
         4fLzZi5LrqD/6pJ1E8AIGVRVQmSQcNEUTA5AVH30jHtVeeLpnJ1/0zRLUp3arsUKvGOl
         00k6slLaeLMQfuwCJn771MuG7dluGkZ2JmIeKY9zwKP0QfbAK3w1LgsUJCa+yjJAub/3
         LsgfI1GraUx2HAY3yObz8+DLS/spfdWTbC6w6r6uMHapmvDyrSbiyR8z04A4uvBIOphp
         cZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765645734; x=1766250534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PR6IrNem4+1GT63TbNNE6XIVgBmCZ50K2RrZ5zPf7Tg=;
        b=FRGR3C53yAYKJ1j95g/9CEoz/ZXs/L/wEjU52tSrHwIq3beknFugHuOipC9R6P0tb+
         wqXcOGEyCgG2MObBWAUbieX8szSkMZmI14pdQMkhJidIIP3QEL7d7rnz13J98ebySdwm
         lpd6/B7/cNfzJ1nqEmNGDiQjCDlSYK3y248ZOey/0Xpfvma2k1wrIdrEhcJ9H0YW0CBo
         E4M83rKXUXh7h8ZwLZdPBAfWE6TOlTuvYrmMKcHpDWihyrNeXVblRP01P6lfEpFNRxP8
         pofgWo8okOUYRgqbPvqODHurcWVfipTBzDE+Zo6yDnHAlb9bjSbaFpYb3MRW2/iuAX++
         CzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQI3AtOaWB/sBeJAfj211dtzIDZbk8sHzuVW9bzLFoQRkZLNTAg4kVUU7wJEmh8AJSxZAGwBY9KpGkO6wfIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7fwEUmzfJq1kQRQgWCPBW4lTkyZFb1KpinCDptCRthreNOLD
	I2UZVRd1RTpPYS/ErG+Vg9CqKOqZIM1fGnIHGYSslTEabW4IfcQOwSFGlO6fMIzdzGR9pqLNWuP
	O6yhuzFqyHPVL+891FyE6aGJHUf3hovhWDFSY/q7H
X-Gm-Gg: AY/fxX5z/NmRrRrnR5MjQo3AznYWl0zZgX5W44ecaOaV3SOYlZx3VdCScngVGjrSMRE
	ohkkKQgHQMeHhmDvIp/Y6uhOhbmN6QP+J7GVHJkPT7DHI5XIHot/Tju0ArWOT3M1egluopwh8Wl
	glrZM1tuylij8xHiyU2tsLGYA5n/+pzfIrV1Lmqlcej0W3x2AmR102LmS7dZ3WKNZjMxV4ysBr6
	eJpz02UMRWFiHiF3u6zEh6UHGIw0aX/edYBwbvgceLAYfFoA9mbfX7txZjHnizCZs3r7SDXXB07
	+DbS/OOorc3RnIzFWx3k0lnYWIz3
X-Google-Smtp-Source: AGHT+IFRpFp1ArfchM3fI2xzUyKVKtpZwa7VqhYBXnP4tk1+gimkbuC910Uk2M+v5nxqKnd9Zh6AYAxMvH4zJbJzwYk=
X-Received: by 2002:a05:6402:4546:b0:643:6975:537f with SMTP id
 4fb4d7f45d1cf-649b08ea5c1mr44819a12.13.1765645734148; Sat, 13 Dec 2025
 09:08:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com>
 <2025121303-railing-fountain-bebf@gregkh> <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
In-Reply-To: <CAGSQo01yhgPVRzeZjGu=xV-eHMARRThYL7bbD4o=VskG3mYLCw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Sat, 13 Dec 2025 09:08:42 -0800
X-Gm-Features: AQt7F2rqSGpO1-alELZxkgJyqvorGcv7dwi7ALlvc2OyFXBCFXBTYmlRhepfD-E
Message-ID: <CAGSQo02gw0hB8gBYTpEmkaa9GfDHQ82-J6q+ksBb29zukkDeFg@mail.gmail.com>
Subject: Re: [PATCH RFC] soc: qcom: socinfo: Re-implement in Rust
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 8:24=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> On Sat, Dec 13, 2025 at 5:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > Shouldn't this all just be in 1 .rs file?  By not doing that, you have =
a
> > number of public symbols (that are very generic), that will "pollute"

One other comment - unless you see `#[no_mangle]` on a Rust symbol,
don't worry about the symbol name being generic. The regular symbols
are all mangled with their path and some Rust compiler info, so for
example, `SOC_IDS` is actually a mangled variant of
`socinfo::data::SOC_IDS`.

> > the global namespace of the kernel symbol table (unless rust does this
> > somehow differently?)
>
> Rust produces one compilation unit per "crate". In this case,
> `socinfo` is the crate, and the other files are included as "modules".
> Symbols defined in them are not public unless annotated with `pub`.
> `pub(crate)` makes them only exported within the scope of the crate,
> i.e. inside the single produced `.o` file.

Slight further clarification - putting them in a separate file doesn't
affect visibility in the final `.o` file that's produced, but it is
technically possible for functions or data which are not public at the
language level to be public at the object level, usually due to
polymorphism. Additionally, an item being `pub` in a module doesn't
necessarily get exported at the language level unless the module
declaration itself is `pub` or the parent module re-exports it
explicitly through `pub use`.

>
> > But putting this all in 1 file should solve all of that, and remove all
> > global symbols.  Especially for just a small and simple driver like
> > this, no need to split it up at all.
>
> I'm willing to put it all in one file if that's preferred for
> organizational purposes, but as explained above, this shouldn't bloat
> the symbol count in Rust. If it were my own codebase this would be
> separate files, so up to y'all what level of granularity you'd prefer.
>
> >
> > thanks,
> >
> > greg k-h
