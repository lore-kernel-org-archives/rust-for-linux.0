Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB2317143
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777207323; cv=pass; b=iXPG9t1g+n+0mtG3YXZ6Y5yX1KvWkePZr6DOZWCOQoKwtmmmTaCJ0a+2rN2Hf2giMQTXNp1LY3O0KdIIf9l2isNuB0eT8W+fTF/fKYic/SEbucJN+VWKJhXPadPB4lNTKGOwBAFuOP/v1X+8VGQ0wM+Y2xdcdL9vhDqShmuFUrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777207323; c=relaxed/simple;
	bh=K3tN3mAwnsDzJAZtwAFOwFaaWmNFrYFiTlt7WWQ3mz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBw0GEb1H/5vD7ekx8cW4RWBqQxbzBV/5QZ1R4l/7KYLnnCuPYiFbExbHbeBlx/uXCkJgtDf4IpvI7BA5YLRr1XGKo/6eQsiEeszzEva/5V3tblnQa+cimei5pz9lUIrEwjaQqu5TRRbXlTLHY1kCX4k97KwHLAt+KcLZ3ySLAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3TK2f+J; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3TK2f+J"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7de4ed0593fso1687769a34.1
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 05:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777207321; cv=none;
        d=google.com; s=arc-20240605;
        b=GEmQN/0AadLe7bHt+jG+8pFSP9E6ZtSeStzqdPds9oPrVL+yRs5WU/FpkGd+z7wI0j
         F/K7A1FHicb55h9t2an6IYzvgPdJ7qPdUTuSUTJ/1n2UiMaPBZc9YgqFipCSYI7q29Jw
         3qleyZjxsTjsG2oSSr38mPHbW4nIP9UKp+ecA9SCVc2yN+QkoQxXIhP2jGrVmyfn+nyE
         cy4fHygB8znarJ7JYpYNXCcYZwrxZodAcwqSi0xz0QbSYKokxbG6sJ7e9CbzKGZ0UFHV
         ZdMLivkOk4ffJxcR1VyR+LhCVhml4+zpxWfWbZ6Uq6onkA2gISzzKRXMt1cKneRYlbg1
         lFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XsicEUMAtXDj2pNSpjEc0C46xxV4v+c8fX6jiXUFiMc=;
        fh=MsydZD797S5PTJ7t1Zww72TD9LVtGKtPbi9G5IcFmzA=;
        b=gWRey2z8XESaD8Qj0nUNb5IVQzYLJMQU6jKqLDdBRC9q15UdOUQ6h/nJu/n3X9E1GH
         dLiIB94XrUELZf1CgXHZkLRQF9l7IMRMAZnjgl6o5GFC5aL9YS5ZeRjoOSqDcMk8T3qg
         emZX1hhQ1n+cM9ddwhqwryeQSMSv25xT6vQAdDoi/Qw0Ek/w+oxGRltr6mMkbB707Y+b
         TGNZR/OPhW30IP5w5MV4Sat0ok5yltjt+Zph3UlaXPQVcwPwvaFd3TerWRKdMkzRbOOm
         hyRfWX2t+3e7AqOov5h7Cu5Flpj2s5SwaVMq3DnGQfJMy4XZQspjhJFpGvGaGljT613b
         2ZwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777207321; x=1777812121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsicEUMAtXDj2pNSpjEc0C46xxV4v+c8fX6jiXUFiMc=;
        b=Y3TK2f+J7bEYw8PJi9CTzGLPeSlk/O1KGWrZbD8VRDqN8SPaMgc0Sh+CcvZwErI4yF
         P/WKe4AttKNwOXwgjSN2P41+FrCIApUgn4vHh5u3Dpj99s1xjgBfDYdAfEXlnZ2Fz2ul
         OxmQnhLg5OfLg7kwxJ3Pt0cBe/Pj1fHmodIHxwZlEvg1PDQsXJ0FIkxojDQeTX3LKxyh
         isH5ODQ7/+ZtCGIKPgR+dKBSOSoOTnYKuKpWBRMelbGhpkGWqSqAIgt+nq4a5eOFyuNM
         EpdDi8vrp3Y4fLWl1XDXSwUFyOTRskJj96wu3CJvF8rZMLklzrZh0piZLx0eYmRqupXK
         hBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777207321; x=1777812121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XsicEUMAtXDj2pNSpjEc0C46xxV4v+c8fX6jiXUFiMc=;
        b=Jp4DX2UrmDaR4w5HF+DnUVQarqzC4gGEbWBTA1vTLpJq2sgxfNz8I52XQ8ane7Q7/H
         7Np7LSVgpriOF367Pqj1HG0wBB47AtaupSPWB8sRy3vK4olZETQ/+Ro6FaGuABRCJ7+s
         SYxkR4gtIrbfiIcgm/bkXB5kfHBR/s6vetnDwMz3OvxkpMpz9nL0JplgLiL3m1MteXw7
         PZS2mYytyHpjCsV9wQrsniPSTSMyTO8zHYivGb++mP3hCvlXz5y8IUUHPfoqqT7VHOiJ
         6X7DfhDs/t2iPf3+Lk9CQEC9bW1wox/zugKxGTKqLd9iLGWXI2fuYi6kEKD3uLXvJqOw
         C95A==
X-Forwarded-Encrypted: i=1; AFNElJ/xWn/uabpmwKBZ0n/OLCMwNFdU53y6nBmbBC6msDxiN+AZ5i1RgNHLZLIcqIBI27OoXmMmlWozx2eAIQ4LOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzuM5XO4gizJIcwJcaU5bDLFPV2RW7qwQOzH+eKFyhwl7lVuJP
	7EsQweNEpw3pa5iUcBrD6KqXgbVx3/gM9KPL6gT9mv1+nPGoGC67chODqOClWT3Y5vjU0GQkgR3
	Tf3dDkanTkKdJkDuH6cjnCNJf5O1UhsA=
X-Gm-Gg: AeBDieud4dxzRFzz2ncY1q/0CAQay0YydzKmcrv6sdDKfwv19l5zlyWGPYjOUINGNAK
	S4HR+xG6ltlMybkYchggTGGV0WHRMEwsmF/jma+Zf3EP1wjlEkPwZ8Udhu9gEni1sMrbDVq5gHC
	zRdGwv1/vOE85O7//2Xkvo+GIixdYE5aGckCrkmT66v8exblBxQ54KrjMWnwQEpKJZBZsHKe/jg
	e4/g+YOTFc266T8xoB2l/5ascRJq9FXpmBVHR3jPPSe2i/v2ukbNQWXzIbiFraPa1uWxvU+PeDg
	2ce5wiKTOb66v3GCqg==
X-Received: by 2002:a05:6820:f016:b0:695:3a00:853c with SMTP id
 006d021491bc7-6953a0089c9mr10409588eaf.12.1777207320818; Sun, 26 Apr 2026
 05:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com> <177393252080.237.233380198774445367.b4-review@b4>
 <CA+tqQ4JcmO_E0xHJPX3HxgDiqv+KQk4q-xBvYk7DSEkifWhtWg@mail.gmail.com> <177712995819.98244.11409833540971152770.b4-reply@b4>
In-Reply-To: <177712995819.98244.11409833540971152770.b4-reply@b4>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sun, 26 Apr 2026 12:41:49 +0000
X-Gm-Features: AVHnY4LbvZNY-DKzMkd7Jit7OIrYR4WGXzIar_r0rk8FJLX8oN1XFewNtmUV4TA
Message-ID: <CA+tqQ4+dBGDToYESFedHmi2hjwZaQL4LK_HZaPqRw18Vt0mgQg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] scripts: generate_rust_analyzer.py: add versioning infrastructure
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2026 at 3:12=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
> On 2026-04-25 12:15:03+00:00, Jesung Yang wrote:
> > On Thu, Mar 19, 2026 at 3:02=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> > >
> > > It would be great to avoid having to sprinkle this everywhere, though=
 I admit
> > > it's not immediately obvious to me how to achieve it. Maybe we can li=
ve with it
> > > until the MSRV bump. Again, would be great to structure this in a way=
 that
> > > makes that cleanup simple when the time comes.
> >
> > I considered using function decorators, but on second thought, that
> > would just be another way of sprinkling functions around.
>
> Can you explain how function decorators would help? Not entirely clear
> to me.

The idea was to augment all `append_*` functions with a decorator that
contains the `sysroot_deps` logic so that we don't have to call
`sysroot_deps` multiple times at the call site. Something like the
following (not tested, just for demonstration):

-------------------------------------------------
def filter_deps(f):
    def wrapper(*args, **kwargs):
        args =3D list(args)
        args[2] =3D [dep for dep in args[2] if dep in not None]
        return f(*args, **kwargs)
    return wrapper

@filter_deps
def append_proc_macro_crate(
    display_name: str,
    root_module: pathlib.Path,
    deps: List[Dependency],
    *,
    ...,
) -> Dependency:
    # ...

@filter_deps
def append_crate(
    display_name: str,
    root_module: pathlib.Path,
    deps: List[Dependency],
    *,
    ...,
) -> Dependency:
    # ...
-------------------------------------------------

Since this only touches the function definitions, we have fewer
things to clean up.

Note that this isn't a clean solution: we'd need to keep mypy happy,
`deps` isn't always the third parameter, and there's a discrepancy
between the written signature and the wrapped behavior (the latter
effectively changes the type of `deps` from `List[Dependency]` to
`List[Optional[Dependency]]`).

> > In my view, the cleanup should still be fairly straightforward even wit=
h
> > the current `sysroot_deps` approach. We could just remove the function
> > and let mypy (or an LSP) flag the undefined function error/warnings.
> > Does that sound reasonable to you?
>
> Mechanically that would work of course, but it would result in a
> flip-flop in the git history. I was hoping to avoid changes at the
> caller for this reason.

That makes sense. I don't have a clean solution to avoid this right now;
I'll keep mulling it over in the background while we finalize the other
points.

> > > There should be a note here explaining that this should be bumped whe=
n MSRV is
> > > bumped, and how to obtain the new values that should go here. It's re=
ally
> > > important that the string MSRV appears as it's a likely grep target f=
or when
> > > that pointer is updated.
> >
> > I'll add a comment about the MSRV bump. Unfortunately, there isn't a
> > reliable way to programmatically retrieve the matching rust-analyzer
> > release AFAICT. I typically follow these steps:
> >
> > 1. Look for the commit history of `src/tools/rust-analyzer` in the
> >    upstream Rust repository (either locally or via GitHub [1]).
> > 2. Check the latest merge commit from on the rust-analyzer side, which
> >    usually starts with "Merge pull request #<PR_ID>".
> > 3. Search for that <PR_ID> on the rust-analyzer release page [2].
> > 4. Grab the version string and release date.
> >
> > Perhaps the better approach is to perform these manual checks upfront
> > for versions 1.86 through 1.94, at which point this version
> > infrastructure can finally be removed.
> >
> > [1] https://github.com/rust-lang/rust/commits/<TAG>/src/tools/rust-anal=
yzer
> > [2] https://github.com/rust-lang/rust-analyzer/releases
>
> I defer to you on whether or not to do this up front, but I'd like us to
> document the procedure either way. If possible, prefer to describe it in
> terms of the git CLI rather than GitHub.

As a best effort, we can do something like this:

```bash
git clone https://github.com/rust-lang/rust
git clone https://github.com/rust-lang/rust-analyzer

RUST_VERSION=3D1.85.0
LOOKAHEAD=3D100

subject_string=3D$(
  git -C ./rust log -n $LOOKAHEAD --format=3D'%s' $RUST_VERSION \
    -- src/tools/rust-analyzer | grep 'Merge pull request #'
)
readarray -t subject_array <<< "$subject_string"

git -C ./rust-analyzer log --oneline --fixed-strings
"${subject_array[@]/#/--grep=3D}"
```

This provides merge commit candidates that can be searched on the
rust-analyzer GitHub release page. Since rust-analyzer version strings
are only available on GitHub, a plain local git CLI cannot retrieve them
directly. The GitHub CLI (`gh`) could likely automate the final step,
but I'm unsure if suggesting `gh` as a requirement is the right choice
here.

Best regards,
Jesung
