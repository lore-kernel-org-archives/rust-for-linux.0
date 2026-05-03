Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14F43CA488
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777814503; cv=none; b=CGAxD3KkZNmA6jO9aa6e4xA5aNh+BtnbiM1nnowd1SCwNqxWWttTEqtRZyA7c7UenlpqBnBj7fmw9ahJnUJx2tOwFSdVavgHjGOa1cnWVlXBg/1vXrxG6400FxXiduNp0xOfhPcjhtwmV1UDU9Y65fXs4ZVr75DX0gM2Jwtm/dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777814503; c=relaxed/simple;
	bh=0uKguI39S2zKOU2RxcVCywntKqlbIWU3SgcUXrzqaHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oND9PcJ3YXMlEd1DIJb978rzJeo+G6CJjNUuGYZ4PJgv9H12EKsOp6DI16toDiLczz5EGmzwmT324en4kgJ2vQRmTNBZ9zwFuE/6p/LWO7nA00Ys8VffxXchk9zEsjXvXXNm2jHZQuqzeAapDo3VZ3c+jlLIq4KVf46HTlFnZOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UaG6Y/Ds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UaG6Y/Ds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82698C2BCC4
	for <rust-for-linux@vger.kernel.org>; Sun,  3 May 2026 13:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777814503;
	bh=0uKguI39S2zKOU2RxcVCywntKqlbIWU3SgcUXrzqaHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UaG6Y/DsDHvWxe++Y7AA49Qbtw7AjkHXl3owjytQRHfaiqYxKDFqISx/BxRTi5Hcl
	 NLmxMSQimXNydeShjLfpxAkxSGLUS63367IYeKXT3RXQ6Qnp8u7N6O11Rle9LyMVlf
	 bBDrG7ycAMamKuDmvitENo5EYd7p6ugFeKLdpdDS01WaDazlTtm9j4PEeLxrw/FhZj
	 dmHUBd2nY+WI+MLyvzcvPrRhf/MXFa4XZtgA5JDMzXdYGBhbOUG9hU/Xs8aU6Mwc5J
	 NCqKjDxgCNzGHUpXfxFFvVMetJiw0x3e1TAkiFOdWJ+GlGArid1HHWVZJxx0Rk+2QV
	 M7fEp57V6rjnA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38be5e86918so40320511fa.3
        for <rust-for-linux@vger.kernel.org>; Sun, 03 May 2026 06:21:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LkjYVIFZbFxI2QjBm+ZZhFlEsABGKj//TU4f1XTc1Ogi1+KUq4Q+qnoTGOv+N0haM362mosBo5H4oVETYNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZbxXs6FIznfGlhrllh+Du6HBtBi98ojxXwEtl3PFPx+tnHKJL
	fgciAdkLLWz7N66m5h3D42F/UXhPZgbgP+siC/M3QXF8ZFtf91avjvJERASv2XH7fLODBlxjqdt
	fhv6+8BVzAXYjKKrkb6jMAp0TYEuS/z4=
X-Received: by 2002:a05:651c:4191:b0:38e:827b:98f0 with SMTP id
 38308e7fff4ca-393784aa305mr15001511fa.9.1777814502209; Sun, 03 May 2026
 06:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com>
 <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com> <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
 <CA+tqQ4K+A0fh7B8LrBi6XAZDg6iLKcAbf31B-9+Kto==LsWVkQ@mail.gmail.com>
 <CAJ-ks9=OY2gL1ne8s07x_E19RO0cXGc8A9UJPWqLLmhbXbk_ng@mail.gmail.com> <CA+tqQ4K_St=mF=4Bscawq52K+Ky_6-=-p2uJ8N7CA+4tXn_rDw@mail.gmail.com>
In-Reply-To: <CA+tqQ4K_St=mF=4Bscawq52K+Ky_6-=-p2uJ8N7CA+4tXn_rDw@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 3 May 2026 09:21:05 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9ki9ncF-6xkwk9UFqJcsCAgCeZe_Apt9=Jb7jfxEK5sTQ@mail.gmail.com>
X-Gm-Features: AVHnY4If_Tqcyr_Pr4y97moUqmJS9ojUZufUwRlV7HE3aYwbETOQAdOZZ3MxnJk
Message-ID: <CAJ-ks9ki9ncF-6xkwk9UFqJcsCAgCeZe_Apt9=Jb7jfxEK5sTQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 2, 2026 at 2:26=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wro=
te:
>
> On Sat, May 2, 2026 at 12:39=E2=80=AFAM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Here's what I see locally:
> >
> > % bash check.sh 1.85.0
> > + RUST_VERSION=3D1.85.0
> > + LOOKAHEAD=3D50
> > ++ git -C ./rust log -n 50 --format=3D%s 1.85.0 -- src/tools/rust-analy=
zer
> > ++ grep 'Merge pull request #'
> > + subject_string=3D
> > % echo $?
> > 1
> >
> > So it seems to never get past `git log` in the rust repo. When I run
> > that git log manually I see nothing containing "Merge pull request
> > ...":
> >
> > % git -C ./rust log -n 50 --format=3D%s 1.85.0 -- src/tools/rust-analyz=
er
> > Disable some incorrect rust-analyzer diagnostics on beta
> > Backport rust-lang/rust-analyzer#18760: internal: Workaround salsa
> > cycles leaking
> > Bump rustc crates
> > Preparing for merge from rust-lang/rust
> [...]
> >
> > What's also interesting is that when I use `--merges` I get no commits =
at all:
> >
> > % git -C ./rust log -n1 --merges --format=3D%s 1.85.0 -- src/tools/rust=
-analyzer
> > %
> >
> > Something strange is happening; my git is not behaving the same as your=
 git.
>
> I tested the procedure on a fresh Ubuntu 24.04 container using git
> 2.43.0, and it works as expected: merge commits are not lost, and the
> script provides the matching release page link. What does your git
> configuration look like? Perhaps some local settings are preventing
> merge commits from being displayed?

Indeed. Codex figured it out:

The cause is your global Git config. You have:

git config --show-origin --get log.follow
# file:/Users/tamird/.gitconfig true

That affects /Users/tamird/code/check.sh:9: with a single pathspec,
git log ... -- src/tools/rust-analyzer behaves as if --follow was
passed. In this non-linear subtree history, --follow drops the merge
commits, so the grep for Merge pull request # finds nothing.

Best script fix: make that command immune to user config, e.g. add
--no-follow or use git -c log.follow=3Dfalse -C ./rust log ....

Secondary issue: after this is fixed, macOS /bin/bash here is 3.2 and
does not have readarray, so /Users/tamird/code/check.sh:12 will hit
another portability failure on this machine.

Mind incorporating these fixes in the next version?
