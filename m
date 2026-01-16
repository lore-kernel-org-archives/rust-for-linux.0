Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F96284665
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768572209; cv=none; b=V/mEaqRxBNhYsLLiNOpiLK+GSOW4/UZlgPL/j5d9qJoO+sMIq9PU4w8wzX5KZdq9Las6ImgogccGTTsRvlNuOHhrL5aBlrFGQMcZ+/0LjkhNajFNzVJH7gUbifH803UvS/QvgvFvDNRQJMdWiNKBVlcHzc0at9ayHIxIji8nqbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768572209; c=relaxed/simple;
	bh=d6XekRFpFbC24wVpSWktZt2sB87rdVYmhA81AsP/zSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3u0m4usRxkB7L40173n9yETYGh1PsdtprFJHioNrBrVOR2eZTtKu4WPxoUlJeo2Czj31iCrK3J/MRQE3bCLk3jjfxgtQoXEjM/95Khwwa6iks0TQzFipPj5NYeEIfnFvu6d9UcKJddnpNM06Vl06ti9Tyk14BUNoHNAZVIZiaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHbH8zF7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHbH8zF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9E1C2BC86
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768572209;
	bh=d6XekRFpFbC24wVpSWktZt2sB87rdVYmhA81AsP/zSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SHbH8zF7fZ8ro2o7RAYJ7uQwfeQbQ/9vgWUP18VkuF9e35BqMuQnizzYECzv4ine4
	 IQekXivAozBsefAPVQstP/f+QshnmVW6LCCgr9V/8Ln5tfe+Kj5OP8HAOH8IdKrLjV
	 w1tCrcNqbDxgQrXyZpu/Bv7sU9EJJIctmYP5ZIUumZ+17FghJG8oeuP2L6+DvPZ55F
	 YToU2LVJ+58lN7Ju/k6xKTM+SY1vYVJp4sAb093ClJF66rad2XqHQeWp2wSi1heVs7
	 SBy66g8OiPNkE2KPc/RCmOBzAJPnfE8X3CCR8Ja3o1GG6HlwS62DMuNpWKHR8MariW
	 wcCRtcDKTa0ug==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so3146002a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 06:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGx6yeb1NuZt211/hH3sQxOeT0vGATEnTlzMM9S9mnlghIZQRGl1iTu70zOsm8bT64Ej34fH7vbN/EUx8l2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXEmYWdJhLQ7UT0LvLRNx9AJYj3BfwfIExBX5eBV14353v9Av
	0n9CygdwcnlCEtaByPA22MM68FFGES2MJXzvavhVLkjCf69hrLb7XpN3qqYcfYdGluyTDdYi5j6
	LiSBuTIKZmgjdkGFxLLvQ89r+TBU+eFQ=
X-Received: by 2002:a05:6402:5242:b0:64b:6007:d8dc with SMTP id
 4fb4d7f45d1cf-654524d1c5emr2557406a12.7.1768572203288; Fri, 16 Jan 2026
 06:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
 <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
 <DFPQG929N5CE.34Y24PGBZN2ED@gmail.com> <DFPZRKQC7ZHT.BVYWCE0GGW96@garyguo.net>
In-Reply-To: <DFPZRKQC7ZHT.BVYWCE0GGW96@garyguo.net>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 16 Jan 2026 09:02:46 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9k_VLyJyxL_pXrq2dW2r+0birOWUmW72Zq9QLXPNjabrg@mail.gmail.com>
X-Gm-Features: AZwV_QhzyTKD8NoAXqd1hQhuEX67ZG-QwHx-QZBawD7O0ZGCJ5N3vwir8KBWj88
Message-ID: <CAJ-ks9k_VLyJyxL_pXrq2dW2r+0birOWUmW72Zq9QLXPNjabrg@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Gary Guo <gary@garyguo.net>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 6:53=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri Jan 16, 2026 at 4:35 AM GMT, Jesung Yang wrote:
> > On Fri Jan 16, 2026 at 6:22 AM KST, Miguel Ojeda wrote:
> >> On Thu, Jan 15, 2026 at 5:35=E2=80=AFPM Tamir Duberstein <tamird@kerne=
l.org> wrote:
> >>>
> >>> Rename `core-edition` to `sysroot-edition` to align with the naming u=
sed
> >>> to refer to standard library crates in `generate_rust_analyzer.py` an=
d
> >>> apply it to all standard library crates rather than just core.
> >>
> >> I think, in principle, even the sysroot crates may have different
> >> editions, which I think I used that variable name.
> >>
> >> For instance, in the move to 2024, it seems all happened at once in
> >> 1.87.0 in these upstream commits, so that seems OK:
> >>
> >>     0e071c2c6a58 ("Migrate core to Rust 2024")
> >>     f505d4e8e380 ("Migrate alloc to Rust 2024")
> >>     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
> >>     993359e70112 ("Migrate std to Rust 2024")
> >>
> >> But in the previous move to 2021, `std` moved in 1.59.0, while the
> >> others in 1.60.0:
> >>
> >>     b656384d8398 ("Update stdlib to the 2021 edition")
> >>     06a1c14d52a8 ("Switch all libraries to the 2021 edition")
> >>
> >> Hmm... I guess the new name is fine, but we may need to go back to
> >> separate naming eventually if they get updated at different times next
> >> time.
> >
> > Perhaps we should introduce `std-edition` and `proc_macro-edition` in
> > `rust/Makefile`? Passing those down to the script would make things mor=
e
> > future-proof.
> >
>
> We don't build std nor proc-macro ourselves in rust/Makefile, so I don't =
think
> this should got there.
>
> I wonder if we should encode the fact about Rust version -> crate edition
> mapping inside the Rust analyzer script? then we still call the variable
> core-edition (which is the crate we need to build).

If that's the approach we want to take, that would likely build on
https://lore.kernel.org/all/20260109-ra-fix-primitive-v2-1-249852a4145a@gma=
il.com/.
