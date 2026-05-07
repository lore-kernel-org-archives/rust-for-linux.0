Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721593F1655
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163385; cv=none; b=DolvM/pp6DqBFz3EmXW9wOS/JD7LAYOeS7ylKauZmpt0L/PQCD8COa2jcECxcbMxId+kTfPlDJIRodri/BoLNTQfRcQG+TEZRoyTfciJRmgLmQwsT9lBOe+SMLqQNst9FdJW1cDYZpp2b4eZHwo1mQTMjFuviTURFzVSfOGbVnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163385; c=relaxed/simple;
	bh=iteT2Fzs7dUDmjhdPeZMoTQoJn2B0lIMix3ec45K8B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdotSOPt+9tC0j6wnxyhFYuxVvJvMPttrSjeuHfgfaPAV29liAh8lFf0tg447iJku+cG0+Fn+z3XmbB0xGK+hACMkkXx1j+fplRRm8Tft6W560MoE5Nw1ob4yHoFw7tG2FlYp8i45pL1MSvzFoA/ApEsGXzDOEeli2QRz6ojJCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iR5a72v7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iR5a72v7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C818C2BCC9
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 14:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778163385;
	bh=iteT2Fzs7dUDmjhdPeZMoTQoJn2B0lIMix3ec45K8B4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iR5a72v7KWZWDpGbxaDF/JN31AC9MINxWKBwPJoasQS7qb5xKnAM62jGcHnfdEPQJ
	 8XSf99ax6QiQsfZfnFZyyOYJPuRQum/UCEAmNoF007YN43G2ifCg4Hm/nnOExKpRmU
	 zd7nXnina5lQitonddDN6KSOS8KUH6WXaSYVTZX8Z617rc7U8TQdsawpw0BYq+9jwg
	 ZXrfsKdltGOfz/zSibWewhBzDfaRHOKWJs8rTtiSrOYZckLhYKRQsfbeUHkpxbg86a
	 d8hVtQ3eYsNwAQuU5RIWe+3Wn7Z1cVO+NP/IVBs537NVh29/tSQpJDtJUWu3zsErlx
	 TXNxulwK1gH6A==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393d07e8938so7849821fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 07:16:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ArJG6DBtOQiFc+cTsCLB33M39gu+vK09X5B9H3coD7Q0jymqY85zt1GkxsSsPGnvFdiU/t6PZpIvPZ77Obw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RK4mYHoEzD44jxaQxrxr9Xl7Hd0+dgmaBdTfOJn1Qok5ugKl
	kgPd8MzKdS3uZl7wILiEntBGBUjljtd9n2BEVbYu1/qRGX2Qmrsb05JYXMRJ4lIHey2nKo76HYF
	/pSDSu3oF2qvCsv+dPlYrTOfpTyVNqvA=
X-Received: by 2002:a05:6512:3a83:b0:5a8:6e64:e88b with SMTP id
 2adb3069b0e04-5a887add6d3mr2668718e87.4.1778163383948; Thu, 07 May 2026
 07:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-ra-fix-primitive-v6-0-74cfc1e862d0@gmail.com>
 <20260504-ra-fix-primitive-v6-1-74cfc1e862d0@gmail.com> <177793208554.80529.7376377202991122733.b4-review@b4>
 <CA+tqQ4+McKwrZ7rHFs70Jh+CG1eMBciB18Nnt32ebFGzH90kaw@mail.gmail.com>
In-Reply-To: <CA+tqQ4+McKwrZ7rHFs70Jh+CG1eMBciB18Nnt32ebFGzH90kaw@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 7 May 2026 10:15:47 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9n4v-=Ou=AVX0c5qCbXY-ApyvLrpNTb0UPErsk=B0FuPw@mail.gmail.com>
X-Gm-Features: AVHnY4IjC7pCONGZHAWRccyCl3w1nGJ0Zi_wGTEG2p4nHHW-RoB47Y6K6ZDiTR4
Message-ID: <CAJ-ks9n4v-=Ou=AVX0c5qCbXY-ApyvLrpNTb0UPErsk=B0FuPw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 8:57=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wro=
te:
>
> On Tue, May 5, 2026 at 7:01=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> > On Mon, 04 May 2026 22:20:59 +0900, Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
> > > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rus=
t_analyzer.py
> > > index d5f9a0ca742c..934698c7eb95 100755
> > > --- a/scripts/generate_rust_analyzer.py
> > > +++ b/scripts/generate_rust_analyzer.py
> > > @@ -343,6 +346,153 @@ def generate_crates(
> > > [ ... skip 46 lines ... ]
> > > +    #        git -C ./rust-analyzer describe --tags --abbrev=3D0 "$h=
ash"
> > > +    #      )
> > > +    #
> > > +    #      link_prefix=3D"https://github.com/rust-lang/rust-analyzer=
/releases/tag"
> > > +    #      echo "$link_prefix/$tag_predates"
> > > +    #      ```
> >
> > I think we talked about this being a bit more defensive with (at least)
> > set -eu. How's this?
> >
> >   #!/usr/bin/env bash
> >
> >   set -euo pipefail
> >
> >   RUST_VERSION=3D$1
> >
> >   grep_args=3D()
> >   while IFS=3D read -r subject; do
> >     grep_args+=3D(--grep "$subject")
> >   done < <(git -C rust log \
> >       --fixed-strings \
> >       --format=3D'%s' \
> >       --grep 'Merge pull request #' \
> >       --merges \
> >       --no-follow \
> >       -n 10 \
> >       "$RUST_VERSION" \
> >       -- src/tools/rust-analyzer
> >   )
> >
> >   tag_predates=3D$(
> >     git -C rust-analyzer log \
> >       --fixed-strings \
> >       --format=3D'%(describe:tags,abbrev=3D0)' \
> >       --merges \
> >       -n 1 \
> >       "${grep_args[@]}"
> >   )
> >
> >   link_prefix=3D"https://github.com/rust-lang/rust-analyzer/releases/ta=
g"
> >   echo "$link_prefix/$tag_predates"
> >
> > Note I added `--merges` in the first `git log`, inlined `LOOKAHEAD` (an=
d
> > reduced it to 10, now that it's only merge commits), and replaced pipin=
g
> > into grep with `--grep`. The second and third `git log` commands are
> > combined.
>
> I don't see the `--no-follow` option in the man page, so I'd go for
> `-c log.follow=3Dfalse`.

https://lore.kernel.org/git/20260507-document-log-no-follow-v1-1-46ce02490e=
ba@gmail.com/

> Should we also use that for the second `git log`?
> Otherwise, merge commits might be lost, right?

The man page says:

  --follow
      Continue listing the history of a file beyond renames (works
only for a single file).

So the second `git log` is not affected because it doesn't pass paths.
I suppose it doesn't hurt, but can be misleading.


>
> > > [ ... skip 60 lines ... ]
> > > +        return ra_version_output
> > > +    except FileNotFoundError:
> > > +        return None
> > > +
> > > +def map_ra_version_baseline(ra_version_output: str) -> RaVersionInfo=
:
> > > +    baselines =3D reversed(RaVersionInfo)
> >
> > This is an iterator but it's possible for both `version_match` and
> > `date_match` to use it, which means the latter will observe an empty
> > iterator.
>
> Nice catch, I'll wrap it in `list()`.
>
> Best regards,
> Jesung
