Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E852AEEA8
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777119318; cv=pass; b=kx7qguEZvu5EHQTFdWleSr2Ib2mhViDh8gmtkkl0IS6zOUXts3rKvpHuOdsWhO+0V/CfK4g1sMHhRFa9033Zd8I/3hMotAG1OpOfonqX4f6QhFgnO85PJ5RvBP+bGRW+p9sJd+0qD+5XBgXtM+N5PASbXPiQwrI4yZK7taP05xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777119318; c=relaxed/simple;
	bh=G4T02eAhl5ity79baA7aoQRNywfUvJqOjq0SEX+UFKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQZ6DDBtEblUX8zAA2ye0Bg9HCFyQXB5iyxPJ2LMageYZ6AQ7w8WxT04VPde5OQ4rVeS0IQjbkHK5u9l++MyCWfK9ZoUgFHCTb1KMW9K1bFUyutLejBrrIvEGmMTyVN6IMjwL65X1pgTRiW0vKcqBoSlL4pKGRq5l975zTiiwzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0tjtPnd; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0tjtPnd"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6949f3eeaf6so1913408eaf.0
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 05:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777119316; cv=none;
        d=google.com; s=arc-20240605;
        b=GRjZYNtI9F9a1QNzHbU+r+PIOAp5QZ4oWej98XIS/q/VlcGqE3OzSAh+naAiD+Pf+d
         UMmMIsg8pKiagAzv5ePwFftFYxN06hqd6gUtliQ8jJr4M+VRku4bQcnaGJd1pNtOkbCW
         NmWqmxjPtQwtQruYGhDAPtEHo5i/t+Cefwr6sIADLJnHUk3ZT9jIMphZgFKvzL5OqKM8
         xFdDz2e41U5EkQr4yWIIEECDIhL+qGI7sFQOuuEWfcGaN9UMpj3JK0/epfWRkbzjeVoe
         /5cDscxdj6BCV9soAmj8tryY0ODcge5IeZGGQ9YxQf/KHTtyoiaugiQBGwip+/Z73s6o
         jrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBIrNyR/cr8VXpu2qIVG/KMwrGisYP2X4PdQ0EPR28A=;
        fh=mKzvX26y2+QJDpG/rc4apBE5IRIEFoKbF4xOhuhL8Q8=;
        b=KoX5wjl+nEBJKZh0HljeNqNq7+JD3I0KNF8O0JdaZ+CLYVONamjtP2hPlk7gVaAZGv
         qxSbrqTgMypG5tbbmL7ceWB2bbu7cptUc3eWWjDr3H1vOo1eY4w4KSzdGd5aUwkIDknA
         x6tRtAJJePI2kI/LKi7+gXCnMS6liMJlik8IJPgLOmZyIZCFfTc2p5dIFfqj209fGG7V
         vwb0oMMJ23XcnP2CIQFpTym3NREQkJX5VB0C4eriGkM/U6lHwXxFnCtoCPoqr0t1KFr0
         YQQtpcXS1UV02wyWKllCVAfR81QLzrTWu50fAreHUHNyZaRwCp0zm3huov6S12t7WEYh
         nJrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777119316; x=1777724116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBIrNyR/cr8VXpu2qIVG/KMwrGisYP2X4PdQ0EPR28A=;
        b=R0tjtPndFxhmhOgriC6dViwSbDtyF/QMGLwWFbyjIX4MvUKqdnm+K0wir26/bj1VZx
         DB4BjZjzhRzuYNVNbgmxUk3Y2G2L1fuUKXlz2cNxnhvSFC7xPH1xo7FWGAcc/dwzIJzl
         iX+/J9J4Co4mmlh0XYxlr2Iz2TeDLn7mYRculhfeHBSmKUu9y+utSW2LsbTGci+F5psC
         2aHeayzBMXVAc91KHUNj+YeFNX2ztvRG1yQD4syuLhQFd8Uh21a/KbbIBFiOmjc3EiNB
         l0PH1M59CJKYnc1is6XRZC1kmC+p8fHorfDZ7lSzbOgRRuKfQlnqc+enzdhXi3idnpjV
         oZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777119316; x=1777724116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vBIrNyR/cr8VXpu2qIVG/KMwrGisYP2X4PdQ0EPR28A=;
        b=G+KZsK/Q6wyw4EKcE+ZAGiAhLkppzH2gPGeKpa5MRNCv1qkBYIKmnwKbV4IVNRnKct
         fTn2kV587WfDnHuD9i5CAniOC3lVYzdTShuvpn9pFrg3I1hItwu0LMUgt6s1LPPZJ1Ad
         3x0AVmwTSibXUK1Lk4rkOFITFwzSe3Bky+qKRP0VU5J7X+bBLE2uYKwLow44aAweNbye
         LFbPVkmshajmVKD75I8H0slR1aDm8L7hnHX2Egtnoe4jM0uzP3V5pGBTYRTqxBo2bZtl
         JHCY7tcn8Dnvkr87uypz8Wo1Cz8PwYUXTcvkcNWQ4ubEJ59hgghIzukvO8BdodaNpKK4
         ZUcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nHHgW1vBX/l/+2wdic83F2sDwFbMajNvxufjnUgkHIaGDx6IwAx27G6iaOLrf7XxMOATPM/eGUpvSNICzIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxnqgW+JSwhcau8cMcAxNxyk7sILvYd1IZWcbNl+0XfXDeNpta
	iqb95XlzlZr/EStQEfUE9ZoCLQiaXAmGKFDblLsfq402sq4+a5z5zuxcDKliWdIJ3uG3KtDY5j1
	Puq/c5V87kttFBhtQmlzdS6/l5i/HeDo=
X-Gm-Gg: AeBDieuxYkD7AMF/c19+6lmNjo6sAgVQyCn9rFmn5T0PWceAne2myz5IIrQvUXjuLSN
	MWqPYEOMikXVuj9p1Xpxv/OFGM/b4m/kSgZcy/Y3UaS2U8HrRFfY6Lv5Dl8aJ8TLLUwt6JT5FSH
	F4+AYzSMwU+yKHV9CLk5oQMNjxNZheY6qPZM7hCfyFO8H2+JlOotuRUeIhevwzVl+E3S8ZLMlSR
	d0jooobqBRcwVttU5ty7AdfcOewdmLjxP2yEqv0oc5RR9nhnapuUePqySShghgO5JxBSnkf4Ezg
	p9u1LU5ad77anYJauw==
X-Received: by 2002:a05:6820:448d:b0:694:96ea:dc7c with SMTP id
 006d021491bc7-69496eaedc9mr8946790eaf.38.1777119315754; Sat, 25 Apr 2026
 05:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-1-bc06709c8243@gmail.com> <177393252080.237.233380198774445367.b4-review@b4>
In-Reply-To: <177393252080.237.233380198774445367.b4-review@b4>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 25 Apr 2026 12:15:03 +0000
X-Gm-Features: AQROBzBdgavSQ5-tRajNpuc_yULTKoe0WmqLUuhFeH-uLJ48Ur0Mn5nHCje5RAs
Message-ID: <CA+tqQ4JcmO_E0xHJPX3HxgDiqv+KQk4q-xBvYk7DSEkifWhtWg@mail.gmail.com>
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

On Thu, Mar 19, 2026 at 3:02=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> On Tue, 17 Mar 2026 18:29:54 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrot=
e:
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index b4a55344688d..21832763c5be 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -49,7 +54,19 @@ class CrateWithGenerated(Crate):
> >      source: Source
> >
> >
> > +class RustProject(TypedDict):
> > +    crates: List[Crate]
> > +    sysroot: str
> > +
>
> Could we move this type down so it's closer to its site of use? It's ~350=
 linues down.

Sure, will do.

> > @@ -200,67 +227,70 @@ def generate_crates(
> >              edition=3Dcore_edition,
> >          )
> >
> > +    def sysroot_deps(*deps: Optional[Dependency]) -> List[Dependency]:
> > +        return [dep for dep in deps if dep is not None]
> > +
> >      # NB: sysroot crates reexport items from one another so setting up=
 our transitive dependencies
>
> It would be great to avoid having to sprinkle this everywhere, though I a=
dmit
> it's not immediately obvious to me how to achieve it. Maybe we can live w=
ith it
> until the MSRV bump. Again, would be great to structure this in a way tha=
t
> makes that cleanup simple when the time comes.

I considered using function decorators, but on second thought, that
would just be another way of sprinkling functions around.

In my view, the cleanup should still be fairly straightforward even with
the current `sysroot_deps` approach. We could just remove the function
and let mypy (or an LSP) flag the undefined function error/warnings.
Does that sound reasonable to you?

> > @@ -335,12 +370,120 @@ def generate_crates(
> > [ ... skip 17 lines ... ]
> > +    Represents rust-analyzer compatibility baselines. Concrete version=
s are mapped to the most
> > +    recent baseline they have reached. Must be in release order.
> > +    """
> > +
> > +    # v0.3.1877, released on 2024-03-11; shipped with the rustup 1.78 =
toolchain.
> > +    DEFAULT =3D (
>
> There should be a note here explaining that this should be bumped when MS=
RV is
> bumped, and how to obtain the new values that should go here. It's really
> important that the string MSRV appears as it's a likely grep target for w=
hen
> that pointer is updated.

I'll add a comment about the MSRV bump. Unfortunately, there isn't a
reliable way to programmatically retrieve the matching rust-analyzer
release AFAICT. I typically follow these steps:

1. Look for the commit history of `src/tools/rust-analyzer` in the
   upstream Rust repository (either locally or via GitHub [1]).
2. Check the latest merge commit from on the rust-analyzer side, which
   usually starts with "Merge pull request #<PR_ID>".
3. Search for that <PR_ID> on the rust-analyzer release page [2].
4. Grab the version string and release date.

Perhaps the better approach is to perform these manual checks upfront
for versions 1.86 through 1.94, at which point this version
infrastructure can finally be removed.

[1] https://github.com/rust-lang/rust/commits/<TAG>/src/tools/rust-analyzer
[2] https://github.com/rust-lang/rust-analyzer/releases

> > [ ... skip 40 lines ... ]
> > +            ),
> > +            "sysroot": str(sysroot),
> > +        }
> > +    else:
> > +        assert_never(version_info)
> > +
>
> The call to generate_crates should probably be below the block that synth=
esizes RaVersionInfo.

Sorry, could you elaborate on this? Not sure what you meant by
"synthesizes RaVersionInfo".

> > [ ... skip 24 lines ... ]
> > +        # `rust-analyzer --version` shows different version string dep=
ending on how the binary
> > +        # is built: it may print either the Rust version or the rust-a=
nalyzer version itself.
> > +        # To distinguish between them, we leverage rust-analyzer's ver=
sioning convention.
> > +        #
> > +        # See:
> > +        # - https://github.com/rust-lang/rust-analyzer/blob/fad5c3d2d6=
42/xtask/src/dist.rs#L19-L21
>
> either "a different version string" or "different version strings"

Nice catch, thanks.

Best regards,
Jesung
