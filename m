Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE730F543
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649942; cv=none; b=fDwiGTYk6cA1uyPIDECeNzvXJLLSxohffqhBGOwAOrmjoEoUbJYyhdkvUB++Rv2EvheLyLJi7rtEqIwap+628Wj83Hc9Gxu8bfT1aHJpRbQ/BkrT70S1IS2zsE55Xfp6CQ/ZfYGAo1wAQ4j17i79QwsJRM+VVFuyh4M1tlSgz1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649942; c=relaxed/simple;
	bh=W4AUVCcAZ+Yo0dLjGYPxhtBEcVoYpaGqh4tldLjfjFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uj4kIdu1kbJ7DAldH4DgSCUX8xMyn0Lsdm83f3idRI/YEgk9Khg4d2YR4XOhYlHNt9yGKQHXhVcMEScp/mpXZgIVbfp7+rV60WVMPtuQCo0OiKWi+5CZCwEMMIWHPw8XcwORNwnjwLznoiGOE/DRMcAyhyszW58juMOfz0as89g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNqmXXmF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNqmXXmF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B18C2BCF5
	for <rust-for-linux@vger.kernel.org>; Fri,  1 May 2026 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777649941;
	bh=W4AUVCcAZ+Yo0dLjGYPxhtBEcVoYpaGqh4tldLjfjFo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DNqmXXmFsL+DvFLAKuHUwemuXFMNRjRjPZAaAchj0JvVd85k3ygYWCul0KGz7gyQP
	 eaIvP+mBlN4PcMm7W+yEhqrSNkDCaaxyfuuBJnulfH2WLpFih94VR7BINOGKSIFQhM
	 YJBFzr1jqGWu1gPMCgnG3k/T1Mm/mlb1LN3SkW9SIqzSeS6H1o1bMpOa8aseqX+58e
	 9YAcLh17WfAKkqxcV2NXKzRCJlGqAdQ1EJ6VhdC1KGRb2AvIjIisvK8rACM2hYGD+l
	 SLdJDGA7vbSdjMwU2woBOALGNplOpr3A9hkZb8+mzVNb7PqUScYKIXN8LzkNC5yDur
	 JV8932E662tjg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-392445f11c5so28073291fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 01 May 2026 08:39:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8iAezZZ33dcCVoAFcjhdenF8k51QGjhhAlGhFEz/+H7BWJX9YCR/+UmGPdCAUPgOps+8CN9yFGWKmi5djteQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycDL+ojumMeNRjH8SU6Kh8Jw2svaW5oXkki0Q6n44LZYBgq9nb
	Icz+hWL0AH3yl6q8dtkB1h3HW+9QBzLRQZwGKtVahY8O74cKodgv7yVgO/Cs4BkIDfOeJ2WzNHQ
	GIHU7B1RuVFwZbkge5/dd5JE9SfywyPQ=
X-Received: by 2002:a2e:9bc9:0:b0:38e:8aff:b657 with SMTP id
 38308e7fff4ca-39350862941mr16985711fa.22.1777649940353; Fri, 01 May 2026
 08:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com>
 <20260430-ra-fix-primitive-v5-1-6364d2258e14@gmail.com> <CAJ-ks9kwpz_NzH7=xMhMvKNHCYhAsG=sR2pTAKuyZVhTb8Pnow@mail.gmail.com>
 <CA+tqQ4K+A0fh7B8LrBi6XAZDg6iLKcAbf31B-9+Kto==LsWVkQ@mail.gmail.com>
In-Reply-To: <CA+tqQ4K+A0fh7B8LrBi6XAZDg6iLKcAbf31B-9+Kto==LsWVkQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 1 May 2026 11:38:23 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9=OY2gL1ne8s07x_E19RO0cXGc8A9UJPWqLLmhbXbk_ng@mail.gmail.com>
X-Gm-Features: AVHnY4IxT1-6itHlmOLF3eoqcTOG4H-1cbSVvTukIbWglxI6rI01Tl6CzAzW6U4
Message-ID: <CAJ-ks9=OY2gL1ne8s07x_E19RO0cXGc8A9UJPWqLLmhbXbk_ng@mail.gmail.com>
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

On Fri, May 1, 2026 at 10:27=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> On Thu, Apr 30, 2026 at 11:14=E2=80=AFPM Tamir Duberstein <tamird@kernel.=
org> wrote:
> > [...]
> > With or without the `--merges` change, this always takes me to a very
> > recent tag. It seems like `git log -- src/tools/rust-analyzer` in the
> > rust repo never shows merge commits?
>
> Perhaps the MSRV wasn't provided as an argument? I see the nightly
> release page if the version is missing or unknown.
>
> $ ./check.sh 1.85.0
> # This opens:
> # https://github.com/rust-lang/rust-analyzer/releases/tag/2024-12-23
>
> $ ./check.sh 1.94.0
> # This opens:
> # https://github.com/rust-lang/rust-analyzer/releases/tag/2026-01-05
>
> $ ./check.sh 1.85
> # This opens:
> # https://github.com/rust-lang/rust-analyzer/releases/tag/nightly
>
> $ ./check.sh
> # This opens:
> # https://github.com/rust-lang/rust-analyzer/releases/tag/nightly
>
> I'll add `set -e` and a check to make the argument mandatory to prevent
> this confusion.

Here's what I see locally:

% cat check.sh
#!/usr/bin/env bash

set -eux

RUST_VERSION=3D$1
LOOKAHEAD=3D50

subject_string=3D$(
  git -C ./rust log -n "$LOOKAHEAD" --format=3D'%s' "$RUST_VERSION" \
    -- src/tools/rust-analyzer | grep 'Merge pull request #'
)
readarray -t subject_array <<< "$subject_string"

hash=3D$(
  git -C ./rust-analyzer log -n 1 --format=3D'%H' --fixed-strings \
    "${subject_array[@]/#/--grep=3D}"
)

tag_predates=3D$(git -C ./rust-analyzer describe --tags --abbrev=3D0 "$hash=
")

link_prefix=3D"https://github.com/rust-lang/rust-analyzer/releases/tag"
open "$link_prefix/$tag_predates"
% bash check.sh 1.85.0
+ RUST_VERSION=3D1.85.0
+ LOOKAHEAD=3D50
++ git -C ./rust log -n 50 --format=3D%s 1.85.0 -- src/tools/rust-analyzer
++ grep 'Merge pull request #'
+ subject_string=3D
% echo $?
1

So it seems to never get past `git log` in the rust repo. When I run
that git log manually I see nothing containing "Merge pull request
...":

% git -C ./rust log -n 50 --format=3D%s 1.85.0 -- src/tools/rust-analyzer
Disable some incorrect rust-analyzer diagnostics on beta
Backport rust-lang/rust-analyzer#18760: internal: Workaround salsa
cycles leaking
Bump rustc crates
Preparing for merge from rust-lang/rust
Revert "Auto merge of #130766 - clarfonthey:stable-coverage-attribute,
r=3Dwesleywiser"
fix: Fix flycheck workspace when requested but package was found
fix: Delay initial flycheck until after build scripts
fix: Fix empty check diagnostics not marking files as changed
fix: Properly check if workspace flychecking is allowed
fix: Don't trigger paren wrapping typing handler after idents
minor: Tell the server to stop prior to restarting it
fix: Set `result_id` for `RelatedFullDocumentDiagnosticReport` everywhere
fix: only show debug lens with a valid root
fix: remove always! check for file_id in runnables
Revert "internal: Drop proc-macro server support for ~1.66.0 and older
toolchains"
Clear all check diagnostics when the workspace changes
Arc the package ids coming from flycheck
Arc the workspace root flycheck
Clear flycheck diagnostics more granularly
Fix a case where completion was unable to expand a macro
internal: Split serde derive feature into `serde_derive` usage
fix: Reduce applicability of unnecessary_async assist
internal: Set `result_id` for pull diagnostics
fix: Consider both completion detail fields in to_proto
Fix AsmOption rule in rust.ungram
fix: Do not ask the client ro resolve for non existing label details
internal: Cleanup label structure of `CompletionItem`
Taking a raw ref of a deref is always safe
make no-variant types a dedicated Variants variant
Variants::Single: do not use invalid VariantIdx for uninhabited enums
Remove salsa from proc-macro server dep tree
Fix pretty-printing of `@` patterns
Stabilize #[coverage] attribute
Use a record struct instead of a tuple for each namespace in `PerNs`
Fix a panic with a diagnostics fix when a keyword is used as a field
fix: Fix path qualified auto-importing completions not working with re-expo=
rts
internal: Don't serialize empty fields in completions and resolve payloads
internal: Simplify ratoml testdir usage
Report unresolved idents for implicit captures in `format_args!()`
refactor: simplify `edit_tuple_usages` in destructure_tuple_binding
fix: Fix proc-macro dylib names on windows
internal: Show mir eval errors on hover with debug env var set
feat: Use string literal contents as a name when extracting into variable
fix: Revert changes to client capabilities in `bac0ed5`
feat: improve name generation in destructure_tuple_binding
Bump typos
Fix a few typos
Show expansion errors in expand_macro feature
Do not require a special env var to be set for the proc-macro-srv
internal: Implement `naked_asm!` builtin

What's also interesting is that when I use `--merges` I get no commits at a=
ll:

% git -C ./rust log -n1 --merges --format=3D%s 1.85.0 -- src/tools/rust-ana=
lyzer
%

Something strange is happening; my git is not behaving the same as your git=
.
