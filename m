Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AD3344056
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804681; cv=none; b=iMqM0Ht0LUCoQZ8QovPXA11n7NjwDXP4IUfXprR9515+tTWvSwl4QyGGzCJoZpqxJFd8ORP8O2GRNeD9bmfTTPOJpefz3k/Bje9/jAgWKHywdinbEbB3HMLc8i7Me5pkevZ8WJM50KYUWFk5fnFvdggC/mKsPflOqEXE3fjzIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804681; c=relaxed/simple;
	bh=6cg+W14BNslbAQJd3JcXzdsKAeWmbKKOJhrw1rNzmLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Exoq+IpECOTSUxrhsMUuCvCqWabXTpf4xodFm54EFwu344DMb4r6Gd79QR+mkkFuHl3BA1Dtcg3HzCpo43i+jfix3Yx9XM51Yh+2+bEXeaD5S24/zNz645/hFWjMNpRKqMsL+6IRomTbvwfxAhU0/gI+ePXK8e9qw2PlPUlS30I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psAP73rO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psAP73rO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00A2C2BC87
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769804680;
	bh=6cg+W14BNslbAQJd3JcXzdsKAeWmbKKOJhrw1rNzmLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=psAP73rO0F+gT370sWBvGNKXGPajMtiMVa+pbENTJTVVchg1D0xgXAFQkkPfSCnkQ
	 8EYAZqZ1esXBE3BOgbosMlzvLcJjzdIn0I2JQfl/fP5fr3a/EfLDgkTbcjNvwCAG+E
	 t2RyuWTnzbyhSLJ84kwIO97xdEjhVrGeljr8Y9Qd4yPP8lmV0eFcwifMqz2NACpIXw
	 6KlmBxWWpfd5DgKNAiloXuLvYRASzbs7zCLxIz2sz3AmN/F+M6kelzvou2S7Nmu6zS
	 fpbC383sS2xL7I/IdjifhwQskNojil9HQ2mYQCTqptMDqcF2EJ0cYFmW2s+77QoJ4y
	 oSp0xW1n/zosA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-385b5174f54so21697711fa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:24:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrLV7vAnIDvBEVnhbytCDrKEvhoaOMoXc5Fh83u6eVOEnqQhhJ6CwY3zojgIapzKQNCQHawvH3PSpFuiMYoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+NMW9ZJuBHKgubYmWQ7+QfVJEbMjcYWjXC9u9Uxm8viet/YuN
	4wUj/vmCtQdyKFYGANCZrzsc7uC4NiMJq+F1q01vZ5hA/N8tYtI5fN1uGcSb4FO+KqIgi2XmE51
	IahqIrkkS0lwTdOLghFg867nItohaUJE=
X-Received: by 2002:a05:651c:547:b0:383:1232:379b with SMTP id
 38308e7fff4ca-38646629f54mr14727841fa.27.1769804679466; Fri, 30 Jan 2026
 12:24:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
 <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com> <CANiq72k=WkiuKCQoOQFewbCcKATm7KZMV4jYBFmSSFryNKEAhQ@mail.gmail.com>
In-Reply-To: <CANiq72k=WkiuKCQoOQFewbCcKATm7KZMV4jYBFmSSFryNKEAhQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 30 Jan 2026 15:24:03 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9m7A1GcSbcUJ4AF2NjQvC2k5TgJBCPbBJA68dJUxZP=cQ@mail.gmail.com>
X-Gm-Features: AZwV_QjCmGvrWnKlyorYOLn8eoGsCS--lGOswdmLg-aO3btNP6lV-RSoEcBdoXw
Message-ID: <CAJ-ks9m7A1GcSbcUJ4AF2NjQvC2k5TgJBCPbBJA68dJUxZP=cQ@mail.gmail.com>
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

On Fri, Jan 30, 2026 at 3:12=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jan 30, 2026 at 8:57=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Applied to rust-analyzer-next, thanks all!
>
> To clarify, in most cases, branches are supposed to start from a tag
> from Linus, not something in between his tags.
>
> In addition, the idea was that you would start applying patches next
> cycle, i.e. normally the branch should start applying patches with an
> -rc1 or -rc2 base, rather than at this time of the cycle, and e.g.
> finish around -rc5 time, and then you can send me your PR for that
> cycle and so on.
>
> Let's talk about it in the next meeting or we can schedule a call.

Sure, will plan on it. I've updated the branch to start with a tag.
Because _this_ series is so invasive, I wanted to get it applied
sooner rather than later to unblock Jesung and Eliot.

>
> (The patches seem to be applied with the msgid link and with tags
> collected, so that is fine :)
>
> Cheers,
> Miguel
