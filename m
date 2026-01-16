Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E96133A9E0
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577969; cv=none; b=IhHRwVp2l3HM23pcPiYw2l5kxXXp5KSuS/EoOL7gkIeB4DWrX3hnehSDUg7OXTejMvcZ35/USCLpbys/ohX1WPjfnhMaH5kpmix62j56jVPI7/4EPbcqN4JrCx2Fvt0BFyEz5mimIqrJ/ux1UVPjuu2p9cZFfzzvoxMKnOmnYao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577969; c=relaxed/simple;
	bh=9XmCP3eUnm/tItC5fIf2duKirRvD2fC/LUT42TJMyTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6k52P6nXbwSkHZb26+EdM4/s9Q3EMj4I5xn+QfP4looQ5qvy7tLTTidqksmqMqZvlqpLLkSbzxweU8ecScA/rCooEl4eYRnvpP4rxxzHHyvlmv06rCw8lEr9BRYCrSZQlPwHBy2KPWhctRAjNgeaXAb2mUex2m2ru0wFIvaqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4vDfnIx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4vDfnIx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CE4C4AF0B
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768577969;
	bh=9XmCP3eUnm/tItC5fIf2duKirRvD2fC/LUT42TJMyTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h4vDfnIx7X7OTYL/qdM8ACmtWWoYtK12xTh0j8XvBbgogcTYovU4KDvjTYIAsWrOc
	 keCWsF7vmok2Wm0j5XTncznKsZ5AKxvgtWBdNGLc9HKFaNys1qzsdPWuMgUZCpShB4
	 aDXokL0CQKZfbveFhUVrZHAO7BBRsDqbo7SyoNhvXCVim0wfTB+pwe+nhxgW3tqj1F
	 6l53Jfw4iBLkEFG/utLT+lq9bzn37L4wSF/YQacMtfL2P8gNM7q8d3ADZE1hs1yLKu
	 tCbeLODIwAypUiZQs5ImEcdKrKczhiQC7OfKvoebHxSQSu0iVvRh9nKecEaqZM5oxp
	 pyrLkj+sc+jrQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b7073f61dso2714249e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 07:39:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDz8gj6JIu0VrqTGY0doybSsQ3W13GCtm2fcKJG4KgLuOMHc1OHKOEEEY6I1ycsFZxOlZqPckSOa52IQpcWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7k9GPrLx4RUn25mM4OmJl9H4DUx061cXJHDS222K/8jHmbEcs
	9FgXY0F5oXi8pvVOAsa0xGctp7bP4xubiRGnhPX6vb7VvDWUoMRy4XvrxLwKbxCjnFK5+irgjJd
	BGdJhUERDzLYuZhNWc6/PlLfnIvWvyhE=
X-Received: by 2002:a05:6512:4015:b0:59b:b0f9:53ed with SMTP id
 2adb3069b0e04-59bb0f9545fmr884747e87.3.1768577967693; Fri, 16 Jan 2026
 07:39:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com>
 <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
 <DFPQG929N5CE.34Y24PGBZN2ED@gmail.com> <DFPZRKQC7ZHT.BVYWCE0GGW96@garyguo.net>
 <CAJ-ks9k_VLyJyxL_pXrq2dW2r+0birOWUmW72Zq9QLXPNjabrg@mail.gmail.com> <CANiq72kMNBm8AJwDAQz3D9yq_Gy9iAKoQ2bpoJ69yTpW86HCsA@mail.gmail.com>
In-Reply-To: <CANiq72kMNBm8AJwDAQz3D9yq_Gy9iAKoQ2bpoJ69yTpW86HCsA@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 16 Jan 2026 10:38:51 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nfMiizMAAnybtY2k5bUf5dsc4bzA__gpa_hq5NP7kxGw@mail.gmail.com>
X-Gm-Features: AZwV_Qj6G4-R6O_2qevD3_Z7AWxB4l6GbMPTqzndtMAoN2Q2ywMwgOyPK_oGS6A
Message-ID: <CAJ-ks9nfMiizMAAnybtY2k5bUf5dsc4bzA__gpa_hq5NP7kxGw@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 9:43=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jan 16, 2026 at 3:03=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > On Fri, Jan 16, 2026 at 6:53=E2=80=AFAM Gary Guo <gary@garyguo.net> wro=
te:
> > >
> > > We don't build std nor proc-macro ourselves in rust/Makefile, so I do=
n't think
> > > this should got there.
> > >
> > > I wonder if we should encode the fact about Rust version -> crate edi=
tion
> > > mapping inside the Rust analyzer script? then we still call the varia=
ble
> > > core-edition (which is the crate we need to build).
> >
> > If that's the approach we want to take, that would likely build on
> > https://lore.kernel.org/all/20260109-ra-fix-primitive-v2-1-249852a4145a=
@gmail.com/.
>
> For fixes, we try to keep them simple as possible in general, i.e.
> like this patch. Or, actually, even simpler: we could keep the
> variable name but use it as the sysroot edition on the other side,
> since it happens to match at the moment.
>
> After all, it is a script call -- the script wants the sysroot
> edition, and we happen to have it from our `core` edition, so it all
> works fine.
>
> i.e. we can just drop the `rust/Makefile` side change for the fix,
> which also means a smaller backport (if we don't use the
> prerrequisite).

This makes sense to me. I can send v2 if there's consensus on this approach=
.

> Another option is dropping these, if there are no practical
> consequences (did you notice anything very broken using rust-analyzer?
> It would be nice to mention those in the commit message, if you saw
> any), but it seems best to fix it, especially since it comes from the
> sysroot and thus I imagine it could have an impact later on due to
> change in upstream code.

I didn't notice anything specifically broken, but I did confirm that
things break generally if RA is configured with the wrong edition.
This prevents it from indexing sysroot crates (I tested locally with
edition 2015 and observed broken navigation in macros).

In other words it isn't known to be broken today, but a new Rust
release could break it tomorrow.

>
> Cheers,
> Miguel
