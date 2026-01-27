Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4035CB7E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 17:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533684; cv=none; b=HGEMzlTdM/SP9mhkKrYxveqWeAVSlVkCngb5ulMP/T9EHSJWetVSxLzqAdxqUdsOmHP1wPWnI8CsGpfKUzd4aIeklbQhp9P1fhuVC1MtUY3pzmw9mSBj0J4wOccPsHd5uFBHSaR5dMAZG7N4viWwb0vXmuoiRCbi/UfRAIOnHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533684; c=relaxed/simple;
	bh=Ejtz6CIjbRNKEdV0uomOsNBcHYybs/Hzdma07BXPRQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W29Txdhql4qgybe8Ii9J26ke1QAkRyWA3+6lPmhPfZKkV3shfPx84lbkhG1PtLuU/nceumwKjGut4jWzy/KPxnQnp3m9pqbZYfT1ATChzNGy9nKef0r29PsU+KqY8cxegbuBU1tsX6Oy85NFcCGpLtd6c77zKHCZm67o1UiLBf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q81odNXH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q81odNXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D222C2BCB3
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 17:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769533684;
	bh=Ejtz6CIjbRNKEdV0uomOsNBcHYybs/Hzdma07BXPRQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q81odNXHB5SV1BqOUms6fA9w9dqyRvXn5pit62x12fffqI5zmiSUJA7Z32wLMxEek
	 qa7zgDrUxle/ehRpprXlmjeD7prBP0HGd/CGIS6Ffocgfj62/CKDqz0ATntBpRDzvZ
	 dspW1j5ukHkUL+bBH317fiJUuzJkZZKnmIgjLyJNJf6lIPfRzCKcWMUiABVOtJOwtD
	 mYgOulCVAQNvHY8lwB213BKIm9VRdIZX/g4LSBwKbr2CSvRDKoy9RcJno5Huc9z1IH
	 RXQuz3amsD00YjwTTw+iX6V9qMhJpqLOf0IjJzbmdhNt5q3ljlrIXBtdjwPgFMRaBi
	 l/bHYb0ym0mVw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-385b6e77ef9so54271811fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 09:08:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoNz5tw+iDGfVm+J0wcCPIPM5PIT3/kZiBwmJtOdfqHw/4XV1SrC8fRxa0kOUCitfoGB+hqP9NSm6svKgq2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZ3losI0iTnvO26Xpg/ZDL93Pw7LDf5qthrQ6PGTe9tthkRdu
	lxzSieuT40hWfPpAx1FemoTDc+VrIic7VLf5+nv7rC1JcAcQDqRjx39NgjqqzmR1Mv47hRqi6E/
	SdErIWRhTvR5BMKjyqjOfhtapyHQpF1c=
X-Received: by 2002:a05:651c:f09:b0:385:fccd:70e5 with SMTP id
 38308e7fff4ca-3861c91f541mr10369101fa.28.1769533682616; Tue, 27 Jan 2026
 09:08:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-scripts-v1-1-ff6ba278170e@kernel.org>
 <CANiq72kkxS9ACvR52q03AN+WdFV96cK+tvejnnDXKZTKuKZH9g@mail.gmail.com>
 <CAJ-ks9kiWZr=82sztLfYqtp-fvsQ2QTgTYqNg5hSsZMKCsvjZA@mail.gmail.com> <CANiq72m8Bx=1s1+_OFxE=PFOjKrtuh_uhsomTA9VwQ4=Fz4d0g@mail.gmail.com>
In-Reply-To: <CANiq72m8Bx=1s1+_OFxE=PFOjKrtuh_uhsomTA9VwQ4=Fz4d0g@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 12:07:26 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=zWmVnspkfCqPH=+-_qZ0YZVyNrs2xMvRRvEmr-mNMcQ@mail.gmail.com>
X-Gm-Features: AZwV_QhthezCoKKdVwlCKzBvyCSCtd-Kb6xYsa03jBnKOyQfKq31mRTrtoDCNdM
Message-ID: <CAJ-ks9=zWmVnspkfCqPH=+-_qZ0YZVyNrs2xMvRRvEmr-mNMcQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: define scripts
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 10:13=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 27, 2026 at 2:53=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > It depends on your perspective - I framed it as a fix of the commit
> > that added the first script because that script was added without RA
> > support. What do you think?
>
> Yeah, I see.
>
> So, on the implementation side, I don't think we expected scripts to
> work at all, which is why it sounds to me like a feature (neither the
> linked commit nor the one that added rust-analyzer overall support
> mentions it that I can see, though it doesn't say otherwise either).
>
> But perhaps someone out there expected it to actually work and thus
> may think of it as a fix. I don't recall someone asking for it, but I
> haven't checked. Perhaps someone would, when we use more and more Rust
> scripts.
>
> Now, for the backport part, according to the official rules, I think
> it wouldn't fit. But those rules are often relaxed and who knows what
> companies out there doing out-of-tree work on top of LTS kernels
> want... (Commits can be submitted there even if they are not fixes, by
> the way).

Thanks for the context. In that case I'll keep it as a fix and take it
through rust-analyzer-next with the backport tags since I expect it to
apply cleanly.

Cheers,
Tamir
