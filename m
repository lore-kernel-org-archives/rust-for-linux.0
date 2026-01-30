Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE3B1D6AA
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804124; cv=none; b=Nn2dSfESyCtF7gVpjGbspNbm2MjrraxZuTaxroKkh+5jD32ryPey+JtHWYveshkyL0sr/WF7YtFaleNkhtO7vs484hXH/Y8BZZNM4atRrP2Gva5gPQ1psSPegtwyKYAW1L9s78EZcmJ7dq4Oee3fj6Aqb2Ico19ABi5DB0BzNYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804124; c=relaxed/simple;
	bh=rDxpBa2wQbBmAcOx3wZdYI5yW3Gufe5SwgazwffXj5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQOqIR63F1dd8bYDp+WWtIsHUM90aZDPHEY9EvFdtqpPlYvItJZMyGRaWs90iAIG+3DXZDZuHRpHvz4AbMXLV4EDn1qgX5C2RmeXYsiN5FQrtNmXer5TZfJG7VB9whtwTD/lCbIaUfec5m3AMd2hbwLNEcUQwDFsxNHpea5v19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXRR1P1e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXRR1P1e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABA3C4CEF7
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769804124;
	bh=rDxpBa2wQbBmAcOx3wZdYI5yW3Gufe5SwgazwffXj5A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QXRR1P1elSoPSRoPWCjHLjHHkt3Lgl/1Fr0Ot8ggOenQwvgbMoga9DVY88BTtJZy4
	 xyqVfIk96W1cuRDtQUbl3QxdNdjm7FwkRXbuIpdTC4JRgcghoYyzKSI02AGdplTFRY
	 Z8LzJ1Ho/e+sJ0dJwEjHrG8M3ZZkF1G/jNF5E9N2oXJpKMMCMwh1SO3Xe7S/8ooLSY
	 DNiJ5bX8XZcTNZfaWHv12IISR5vME3IgcbI8WIQLhBqRrn4N/8afBc8H9B8h77m68m
	 OLgt1Qnxp1gJSlytXrsviS8umSML0FkbfCaXAZLSbSOLYsyE5vD9t65GUaFJk3fupd
	 0aBa4NkQlD4+Q==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-382fb2bb83dso16246631fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:15:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4qEFBV8uxPHXCFACyY5kujHIYm2C5hrr6zutGLNQcxitvUrW7Qsvkm1McbVRwAh6aHD1u+vUQD5rygNBp6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnbGLeItTR1rSq9e8ni1AglcvmUfct8Oj803NDxl3nxSfXn/gW
	s1vjQjKq2swtu/yypMzRO/SY9OyDQpQKVYBQVEtLX4IWCChPdC/PUdKvlVjR7ibnXhnntgy9GMr
	wQk0pga8QzfziJp2cLpXZyONUqi5oWsU=
X-Received: by 2002:a05:651c:a0a:b0:383:5ea:e9c1 with SMTP id
 38308e7fff4ca-386464e0997mr14206801fa.2.1769804123007; Fri, 30 Jan 2026
 12:15:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-scripts-v1-1-ff6ba278170e@kernel.org>
 <CANiq72kkxS9ACvR52q03AN+WdFV96cK+tvejnnDXKZTKuKZH9g@mail.gmail.com>
 <CAJ-ks9kiWZr=82sztLfYqtp-fvsQ2QTgTYqNg5hSsZMKCsvjZA@mail.gmail.com>
 <CANiq72m8Bx=1s1+_OFxE=PFOjKrtuh_uhsomTA9VwQ4=Fz4d0g@mail.gmail.com> <CAJ-ks9=zWmVnspkfCqPH=+-_qZ0YZVyNrs2xMvRRvEmr-mNMcQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9=zWmVnspkfCqPH=+-_qZ0YZVyNrs2xMvRRvEmr-mNMcQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 30 Jan 2026 15:14:46 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nMHtAaLc_LHOWqa_hTRqVcBNpGsaC49VFh2O+_3AoY+A@mail.gmail.com>
X-Gm-Features: AZwV_QhncK0We1zFUkHB-_4kfr0Qvxn-w4b_0QxwXlk2gLz6yBBl0VkZfg9wrck
Message-ID: <CAJ-ks9nMHtAaLc_LHOWqa_hTRqVcBNpGsaC49VFh2O+_3AoY+A@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: define scripts
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 12:07=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> On Tue, Jan 27, 2026 at 10:13=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Tue, Jan 27, 2026 at 2:53=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> > >
> > > It depends on your perspective - I framed it as a fix of the commit
> > > that added the first script because that script was added without RA
> > > support. What do you think?
> >
> > Yeah, I see.
> >
> > So, on the implementation side, I don't think we expected scripts to
> > work at all, which is why it sounds to me like a feature (neither the
> > linked commit nor the one that added rust-analyzer overall support
> > mentions it that I can see, though it doesn't say otherwise either).
> >
> > But perhaps someone out there expected it to actually work and thus
> > may think of it as a fix. I don't recall someone asking for it, but I
> > haven't checked. Perhaps someone would, when we use more and more Rust
> > scripts.
> >
> > Now, for the backport part, according to the official rules, I think
> > it wouldn't fit. But those rules are often relaxed and who knows what
> > companies out there doing out-of-tree work on top of LTS kernels
> > want... (Commits can be submitted there even if they are not fixes, by
> > the way).
>
> Thanks for the context. In that case I'll keep it as a fix and take it
> through rust-analyzer-next with the backport tags since I expect it to
> apply cleanly.
>
> Cheers,
> Tamir

Applied to rust-analyzer-next. Thanks all!
