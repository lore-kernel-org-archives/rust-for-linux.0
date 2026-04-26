Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910721256C
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777211430; cv=none; b=svQAGzPzCDWRjvmNC95l75UQeLOUVG8XInidxymdhfYxjqlqjuv6jtmHMCBtHqBtJyg69eCXZ7DJjFKoLoEFv/m+xmZ+cOHGhsaMVLIIJjM0DYiPzemppEykFDS5WTQRtgojzjZS5dtwO67AvreOD/RnwMTO62uhght4mQDiWtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777211430; c=relaxed/simple;
	bh=y81tSlX76RzbrR14UQxLlJAs2rIdy7SvY+u7qnm3lX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jv6AFveVyXYP6FtUdHap1O4oTsWYfEYRT3PkoYxUXpd5BSkPXpNOyxnp4dJHDzWxAJbOco/ihmSVy9r8XW9dxtKU0eeOi1FnxxV/ShajpvWimQUJjZMIs0kH4ZWvFOMTMsGS0CsOo3oa6PSHCwN3HukNP6PABg7tuwU2P0sSsbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+lXqc6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+lXqc6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A58BC2BCFA
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777211430;
	bh=y81tSlX76RzbrR14UQxLlJAs2rIdy7SvY+u7qnm3lX4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a+lXqc6pmfklwUxRybwrkn5hGTkiqePbGTmvneP1Owu+dodk6cyeVZKG/cL9YadN2
	 jds2zqkFp0+yQW4wsxwzXUyy7Pfj+iD4Z+6d7vY4sAIlKJc/uKVhaKy6ULpZRtJ9BT
	 11AXDXTakbfhBsg1gMnaudnnjchJc8RgX1m6xTngm1GskZsI3v0LLMY8HLo+jc3cOI
	 fPjY1JNZRbAW9TNqi4bbYmN8ItOOypXNyd2E6PjOdipecSIXzi819zP1GwahQQjGLr
	 ohIS2Trs9QuXmXPZGCdtXeqPyx4wIQD0efbAOETDU1Q+LgnkwdBbM3BOVSCoxYo3Jt
	 Meumb+RaM7CMQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38e7d984096so102506951fa.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 06:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8zHaplKmosF0oaMRtTIB02FGWKoP77tzVn91hRY5HtqFjEuUC4fuDlzo3s04ornvVwr4D9wqYKIxvrxskjSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsuA4NZnb0+wA6yOHvO0MWq7iu7qgWTP3JGYa6jwc/dqgC0Joe
	6/mFcPht8e80rGwRWG5a3HtwNAmBfCh8uA8gBj4xqc+pIMsNuhhDl9l/fc/0Vw9J/gQd+4ntkju
	zAPflvZo/C4OzWXlDV3N/M5epL+EWHog=
X-Received: by 2002:a05:651c:2120:b0:38c:374f:420d with SMTP id
 38308e7fff4ca-38ec77f6795mr130501461fa.2.1777211428951; Sun, 26 Apr 2026
 06:50:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com> <177393252080.237.233380198774445367.b4-review@b4>
 <CA+tqQ4JcmO_E0xHJPX3HxgDiqv+KQk4q-xBvYk7DSEkifWhtWg@mail.gmail.com>
 <177712995819.98244.11409833540971152770.b4-reply@b4> <CA+tqQ4+dBGDToYESFedHmi2hjwZaQL4LK_HZaPqRw18Vt0mgQg@mail.gmail.com>
In-Reply-To: <CA+tqQ4+dBGDToYESFedHmi2hjwZaQL4LK_HZaPqRw18Vt0mgQg@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Sun, 26 Apr 2026 06:49:51 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9=GUgrn4paEXfcume2iUbyhfoM5=qp_SFfK0PLrS9HPAA@mail.gmail.com>
X-Gm-Features: AVHnY4J4U52GNt6H_s73yYB9T0NckGKAFKR2sT30EdJPuwAfqDv-81dY-vqjj0c
Message-ID: <CAJ-ks9=GUgrn4paEXfcume2iUbyhfoM5=qp_SFfK0PLrS9HPAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 8:42=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> On Sat, Apr 25, 2026 at 3:12=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> > On 2026-04-25 12:15:03+00:00, Jesung Yang wrote:
> > > On Thu, Mar 19, 2026 at 3:02=E2=80=AFPM Tamir Duberstein <tamird@kern=
el.org> wrote:
> > > >
> > > > It would be great to avoid having to sprinkle this everywhere, thou=
gh I admit
> > > > it's not immediately obvious to me how to achieve it. Maybe we can =
live with it
> > > > until the MSRV bump. Again, would be great to structure this in a w=
ay that
> > > > makes that cleanup simple when the time comes.
> > >
> > > I considered using function decorators, but on second thought, that
> > > would just be another way of sprinkling functions around.
> >
> > Can you explain how function decorators would help? Not entirely clear
> > to me.
>
> The idea was to augment all `append_*` functions with a decorator that
> contains the `sysroot_deps` logic so that we don't have to call
> `sysroot_deps` multiple times at the call site. Something like the
> following (not tested, just for demonstration):
>
> -------------------------------------------------
> def filter_deps(f):
>     def wrapper(*args, **kwargs):
>         args =3D list(args)
>         args[2] =3D [dep for dep in args[2] if dep in not None]
>         return f(*args, **kwargs)
>     return wrapper
>
> @filter_deps
> def append_proc_macro_crate(
>     display_name: str,
>     root_module: pathlib.Path,
>     deps: List[Dependency],
>     *,
>     ...,
> ) -> Dependency:
>     # ...
>
> @filter_deps
> def append_crate(
>     display_name: str,
>     root_module: pathlib.Path,
>     deps: List[Dependency],
>     *,
>     ...,
> ) -> Dependency:
>     # ...
> -------------------------------------------------
>
> Since this only touches the function definitions, we have fewer
> things to clean up.
>
> Note that this isn't a clean solution: we'd need to keep mypy happy,
> `deps` isn't always the third parameter, and there's a discrepancy
> between the written signature and the wrapped behavior (the latter
> effectively changes the type of `deps` from `List[Dependency]` to
> `List[Optional[Dependency]]`).

Right, and also the way you've written the decorator won't appease
mypy; you'll need type annotations. If the goal is to change the type
of `deps` to a list of optionals, a decorator is a nice way to do that
without polluting the git history.

I believe the proper way to annotate this kind of decorator is using
ParamSpec (https://docs.python.org/3/library/typing.html#typing.ParamSpec)
which might not be supported in Python 3.9. That might be OK though -
our minimum Python for type checking need not equal our minimum Python
at runtime.

>
> > > In my view, the cleanup should still be fairly straightforward even w=
ith
> > > the current `sysroot_deps` approach. We could just remove the functio=
n
> > > and let mypy (or an LSP) flag the undefined function error/warnings.
> > > Does that sound reasonable to you?
> >
> > Mechanically that would work of course, but it would result in a
> > flip-flop in the git history. I was hoping to avoid changes at the
> > caller for this reason.
>
> That makes sense. I don't have a clean solution to avoid this right now;
> I'll keep mulling it over in the background while we finalize the other
> points.
>
> > > > There should be a note here explaining that this should be bumped w=
hen MSRV is
> > > > bumped, and how to obtain the new values that should go here. It's =
really
> > > > important that the string MSRV appears as it's a likely grep target=
 for when
> > > > that pointer is updated.
> > >
> > > I'll add a comment about the MSRV bump. Unfortunately, there isn't a
> > > reliable way to programmatically retrieve the matching rust-analyzer
> > > release AFAICT. I typically follow these steps:
> > >
> > > 1. Look for the commit history of `src/tools/rust-analyzer` in the
> > >    upstream Rust repository (either locally or via GitHub [1]).
> > > 2. Check the latest merge commit from on the rust-analyzer side, whic=
h
> > >    usually starts with "Merge pull request #<PR_ID>".
> > > 3. Search for that <PR_ID> on the rust-analyzer release page [2].
> > > 4. Grab the version string and release date.
> > >
> > > Perhaps the better approach is to perform these manual checks upfront
> > > for versions 1.86 through 1.94, at which point this version
> > > infrastructure can finally be removed.
> > >
> > > [1] https://github.com/rust-lang/rust/commits/<TAG>/src/tools/rust-an=
alyzer
> > > [2] https://github.com/rust-lang/rust-analyzer/releases
> >
> > I defer to you on whether or not to do this up front, but I'd like us t=
o
> > document the procedure either way. If possible, prefer to describe it i=
n
> > terms of the git CLI rather than GitHub.
>
> As a best effort, we can do something like this:
>
> ```bash
> git clone https://github.com/rust-lang/rust
> git clone https://github.com/rust-lang/rust-analyzer
>
> RUST_VERSION=3D1.85.0
> LOOKAHEAD=3D100
>
> subject_string=3D$(
>   git -C ./rust log -n $LOOKAHEAD --format=3D'%s' $RUST_VERSION \
>     -- src/tools/rust-analyzer | grep 'Merge pull request #'
> )
> readarray -t subject_array <<< "$subject_string"
>
> git -C ./rust-analyzer log --oneline --fixed-strings
> "${subject_array[@]/#/--grep=3D}"
> ```
>
> This provides merge commit candidates that can be searched on the
> rust-analyzer GitHub release page. Since rust-analyzer version strings
> are only available on GitHub, a plain local git CLI cannot retrieve them
> directly. The GitHub CLI (`gh`) could likely automate the final step,
> but I'm unsure if suggesting `gh` as a requirement is the right choice
> here.

The rust-analyzer releases are all git tags; once you figure out the
right tag, you can navigate to
https://github.com/rust-lang/rust-analyzer/releases/tag/<tag> to get
the version number.

>
> Best regards,
> Jesung
>
