Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CC12E40B
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769805157; cv=none; b=V7JTcI/iWcvlGivGVF8C1sE/2Zodbeqei9MHL2gWhbKlFzzvRapRrKWwPgEzVbxv92TAFjYJxQRUUsXmWvUin2bur5miVgQV1BpUmkfOXL22DnQt6iTFKk65YAZTM73liNNg0LxZIfNmGolKz7LZycJIOb7cRMvT3gssLBf4+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769805157; c=relaxed/simple;
	bh=ALbhgfzsQ7GOxze5XHApPw2mYCT0Y9ZO4HoBTuDG+wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1zXnr5Zlfomxz5bCBjpypkKGTBHIUmSHfF/gVscxd9wWgfnaoGn6tDsxI4Bia5+RM+peDUXHe/zhXuVENwyGbp6K6BSjGEf+QHDs/qTJF/SsHXz0hiycbnxNuv+QPJNObn8hwqJ+UJQe709CGVzPpbJ4TMrT0KsFUAiG7aAKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrSAkUte; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrSAkUte"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DFCC4AF09
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769805156;
	bh=ALbhgfzsQ7GOxze5XHApPw2mYCT0Y9ZO4HoBTuDG+wA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BrSAkUteNRZlM4CzPR5kC8Zt2lSHGecVi3f9PyI6gFpRxDufweL1bb/Rv18v7/caG
	 HLO6c9JIleso5gZtbDUC0m1h0GG7PaJNRfPf0NCoB2htKS+9WcLmvy3/SHnnmP9784
	 vOpYr8i+ebnJXGX2x4Hw5YpcJT5QpavRLef8i/ectl+xSH3RuikHh3taO0x3GShrB1
	 dpEo7+Bsg12LzvZwEZqTYdEGHRh8qJJhBSvTcgMP4t7A5CynQN8AziMxiYDmBf6kUy
	 9BEChJb6nrU1prZMXaBXWUZRe7IP9zxPDNjbAzteUllh11Y4GFSQbgLygFN2gy2iwP
	 Hzlg9hpXTYnTg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-385c7507bc0so21553491fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:32:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWw1l7HLcwtoF4EG55AyCg17ehuuMx15/Tz7FU0MnLTT8i0m9CQset5lyvV9JD7rlGVQtXuntf/Rlgi9RiuCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDLuG01jg03rMkFbztTSp1GDZEfE4qM0B2n4zCGUcu2ceCmEn
	Nbb76gud6mA16qKXNw3SdJyKT/OvNdIx1RwHvxQoiTmQ95bb2CX9J+HTpDMOV2/lrfVyoYEMdLb
	+O/9Dw55hZJdeOvrIuEl8tCoqj4Y59EA=
X-Received: by 2002:a2e:9bd0:0:b0:37e:6b29:111b with SMTP id
 38308e7fff4ca-386348cd8bbmr26983171fa.2.1769805155447; Fri, 30 Jan 2026
 12:32:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
 <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com>
 <CANiq72k=WkiuKCQoOQFewbCcKATm7KZMV4jYBFmSSFryNKEAhQ@mail.gmail.com> <CAJ-ks9m7A1GcSbcUJ4AF2NjQvC2k5TgJBCPbBJA68dJUxZP=cQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9m7A1GcSbcUJ4AF2NjQvC2k5TgJBCPbBJA68dJUxZP=cQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 30 Jan 2026 15:31:59 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=h9qTU8Lwf8YGziE2Go800+Qqt2h=5wafYd2pedhSc4A@mail.gmail.com>
X-Gm-Features: AZwV_Qg7dIZdzOoH8BquEPbij8glO5AgW7_clfz6YDi5UNn3F6ts1A_DbPz7_ds
Message-ID: <CAJ-ks9=h9qTU8Lwf8YGziE2Go800+Qqt2h=5wafYd2pedhSc4A@mail.gmail.com>
Subject: Re: [PATCH 0/4] scripts: generate_rust_analyzer.py: tidy and add type hints
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 3:24=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> On Fri, Jan 30, 2026 at 3:12=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Fri, Jan 30, 2026 at 8:57=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> > >
> > > Applied to rust-analyzer-next, thanks all!
> >
> > To clarify, in most cases, branches are supposed to start from a tag
> > from Linus, not something in between his tags.
> >
> > In addition, the idea was that you would start applying patches next
> > cycle, i.e. normally the branch should start applying patches with an
> > -rc1 or -rc2 base, rather than at this time of the cycle, and e.g.
> > finish around -rc5 time, and then you can send me your PR for that
> > cycle and so on.
> >
> > Let's talk about it in the next meeting or we can schedule a call.
>
> Sure, will plan on it. I've updated the branch to start with a tag.
> Because _this_ series is so invasive, I wanted to get it applied
> sooner rather than later to unblock Jesung and Eliot.
>
> >
> > (The patches seem to be applied with the msgid link and with tags
> > collected, so that is fine :)
> >
> > Cheers,
> > Miguel

Apologies for the whiplash, I reset the branch back to rc7. In the
meantime, these commits are available in
https://github.com/tamird/linux/tree/ra-next for folks working on the
next round of improvements.
