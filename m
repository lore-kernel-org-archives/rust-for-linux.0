Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47721145FE0
	for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777119437; cv=pass; b=KQzfJUxWnN0pIMK0ymEme7x5UQ5Ok2iR1R5Qgvz72u/jfs4pnB6dGVS7GM6QCBJKMuQZY44f8XU5OoyxuVTaYPP19n2PLgFDErRjlRwvfW3vdFSwR65YcP+SkN9xnQtTC4JyR9cFM0F974MLOUGlbhVrLr8P/E510t2qtOGLYMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777119437; c=relaxed/simple;
	bh=uaMufP9AAPusxDfJqzzHeiNGlpzhC2XJZc/kltIq9qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUHyt2fCTHDg082wdZYcK4BYHYdzmOkh7fPj4uj3hLXoF+oFS9vCsn2BU8A0gZH54nrVTZ77uWz41Tud1FtjHJaJeAei8ojqn2IdpXt50I0OJMaFkFgnpP50i9Tnp8y5+ewVQCwhXwlUQVbxEEBKEpaHhqBTppH8CmwC0DKZdwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnwPgQWh; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnwPgQWh"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-67e0d3f288aso5382146eaf.0
        for <rust-for-linux@vger.kernel.org>; Sat, 25 Apr 2026 05:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777119435; cv=none;
        d=google.com; s=arc-20240605;
        b=EbYkMWDVjOl3zVxbUB65gcEkDwCEgsTvZN3KoTP7F8QDwDEXhuptcG1BMy4vqwZSST
         1tVUcgzDvWnS+/qiRE9JxBWwtSOm6nhspKypJUBKeBqEYWcXHNRzFWK6f1f8U6Yl5lBr
         EkXD7FWTI+baIXqlGg3zoz4l9nd/yL20mVEtefbAm/mE5cE0gDD1Pz8rfWbD/uyvKaUH
         y0SrQjlVHuKZlQjF/HWe+lV+9kOlwGXFmwo/flEi71eCe2YbU5R2Q8xVjwYeSeIFJsUl
         2PyHfwfYsGeB+aM/20MwR3BrB9uv7XV+fdZQwvS3Q3oodLUpzDec3KAomSrnuypk86o2
         9+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CqcN749NginOrLru3ukrHtJURfOsg8Vx7djCOAXOdqo=;
        fh=U530rVydvrdsg4XA5x2zFx829Ikuc2KOC952Yeyx6/k=;
        b=BqkAp+drHRaLr+YkgOWKhHqwvL3e44v8r7HCEHDERne2/BmyeBY0N8Kx3EqCUHRTs5
         s8IgzwBfgDfUO3yBovtdrN0UI2I1EQbf2lvDqWwHiayrlPGX0VQZIAxTk+jrWWxJn3AV
         QukbdHBhvxlfhZWJCLY2CjbLyxVW1Z78bGS3W+A4izoIZ7nqEYSvhcrbP/D2A4y1O7Zd
         Or4ka8itAJ9MV2aYrwwHFbbooISk2S83PjbTXSXVPW6ba8mQNfIu+88kfUzqlKuFiOzI
         XCtu5mCCtMIxR8ttbvjaAHH7Ptc+gjwS5RdDPfTmz/tjwlACUMlo4CDeFCHA8Q7mtCKQ
         z2ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777119435; x=1777724235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqcN749NginOrLru3ukrHtJURfOsg8Vx7djCOAXOdqo=;
        b=mnwPgQWhjJC1P7d63qAPlquE6WQOg0K4rBLzfvus5xY2BMo6UlFGNXNU1yEZF6O0Ns
         lMTSmFqkwVjijW3rjk1YsmtP1Eq0hwqkidl8VmwbZP/2oJagyyyZ+1xPPCWqm36Y+zg1
         eVncy3VsPSvjfKYrQ4HEUTEI9mDcktH51n1XGdD22YDZCHar9EWL2kwNMNybWU3qML/Y
         Eq3OcCxYyenpdxUOIyQRLJOk7QoO6uicQ63i2J3NTJJAw3yQ4iZ8X2v/T7MbxrBNfnat
         DLM9xZBJYnMVAaUbTvWb8+5Am1Knn+M4x5Xh6wrZ0TEzAUvmcYQGsBmC9hBQh0PKH3BO
         Izsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777119435; x=1777724235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CqcN749NginOrLru3ukrHtJURfOsg8Vx7djCOAXOdqo=;
        b=GZFu0rRuOcb5PaD3ILppUBABQwVv0425btickaj9JnglfVCtAzAKtUo77lPgg5xhfM
         mjMzTO77SSXBT3ciZhmyZ+W2qPHVlS8mPvzYiTufe4qm1ctTgnrU3cwMhSkad8jKFvhW
         XEK/3aNKk1aKObPEb1kMbScaiYiUPtKsTar3gG6DRqI5LaqIkcStpSLM6xagzCjCkYYP
         9qbcrUsMgWC4+Fwxil6R8dx4hIjM1Sh1+T6SqgLZUfoJwhDcGIAJpHwCzzITqC64fJgb
         KHdmFXEcE0kL6Lq9Zz+capKuUDfyT//Z1jQMwHFAtrSs3LHoRrhUn0W8vyehnfM3ntR/
         D3bQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EwJ+8JlnRpOeaueKO7aY6/Rw9r+U0FZh1ftygoWe+jzxqa0oNJ5WxHaT+h8sCFDrAhwXZyyLOmJPNTLrC+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVHW2ve1CGhh8uJseD/AL/+tW5ZdE6UE094nI1x24a2LH6I+y
	04oX2cLTAT3o8idJHsokyhMGLtwDMOpqcxoNTJVZwBdGwlpKxmZ/fjbiLhfP4K+0dWsV0F8+eOK
	w8ZzLgMdS7irOwps0bn0eDPATbTUqx98=
X-Gm-Gg: AeBDieukqhUHyTA+yBbtIcVxc1dT2Z3a+SNRtHvAW9kM8lmn2D6k4eF0CKopvhrRHKI
	Ev7EOuWrqwKCc/5eljXg8DoRPwPecTKnY5BIwFeZfrUyq8qUmQJVMKq7fT+rX5vxo9UrdENCrRf
	/VqdbJbCZebcepkMBgZm+Obx3ixWTOp49TzQLA7T1slGoPJPfYInsfj3kcwmuf0o+POEQeCHdlJ
	IxG8B8L6ohSKKui4/AvggiaCBkIWVMQzbQAaTruOJ8HdBoVMqVcmGVXxqNe0IGcgdJ+IQ9mVFDT
	Fm7blk64lE+cAcj+IA==
X-Received: by 2002:a05:6820:1610:b0:694:8576:5d7a with SMTP id
 006d021491bc7-69485765e63mr15186696eaf.30.1777119435088; Sat, 25 Apr 2026
 05:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-2-bc06709c8243@gmail.com> <177393252082.237.17419844885611963902.b4-review@b4>
In-Reply-To: <177393252082.237.17419844885611963902.b4-review@b4>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 25 Apr 2026 12:17:04 +0000
X-Gm-Features: AQROBzByOqUQ4ePZZHCqsJirwaM7rQtSS-IdK6FR9tKDjXRIThqU13oIUZ0_aPY
Message-ID: <CA+tqQ4KK=Ukma8-S47+Lr_YK94Pz76BRD5cfwxSxvYytFiy2qw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] scripts: generate_rust_analyzer.py: fix IDE
 support for primitive types
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
> On Tue, 17 Mar 2026 18:29:55 +0900, Jesung Yang <y.j3ms.n@gmail.com> wrot=
e:
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 21832763c5be..bf5a0f16995a 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -372,6 +374,7 @@ def generate_crates(
> >                  path,
> >                  sysroot_deps(core) + [kernel, pin_init],
> >                  cfg=3Dgenerated_cfg,
> > +                crate_attrs=3D["no_std"],
> >              )
>
> This seems to be independent of the RA version. Is this broken today? Sho=
uld it
> be a separate patch? Maybe that patch need not be in this series.

The primary motivation for the versioning infrastructure was to
incorporate the `crate_attrs` feature introduced in the recent
rust-analyzer release (denoted as `RaVersionInfo.SUPPORTS_CRATE_ATTRS`
in our case).
This solves the side effect of enabling `sysroot_src`: `sysroot_src`
implicitly brings in `std` as a dependency, which is undesirable for
driver crates. Setting `crate_attrs=3D["no_std"]` is a direct fix for
this.

I could split this series into two separate patches, but I prefer to
keep them in the same series. I think a standalone versioning
infrastructure patch would be unjustified in isolation without an actual
consumer of that logic.

> Is this broken today?

If we enable `sysroot_src` without `crate_attrs=3D["no_std"]`, users with
a fairly new rust-analyzer release would see, for example, auto-complete
suggestions for `std`.

To provide full context, here is the sequence of issues:

  1) Inherent impls for primitive type have been broken in recent
     rust-analyzer releases.
  2) To fix 1), we need to enable `sysroot_src`. There are also other
     reasons reported by Eliot to enable it, as we know.
  3) A new problem emerges: rust-analyzer thinks we have `std` in the
     kernel driver crates.
  4) To fix 3), we need to use `crate_attrs=3D["no_std"]` alongside
     `sysroot_src`.
  5) However, `crate_attrs` is only available in rust-analyzer>=3D0.3.2727.
  6) This means rust-analyzer<0.3.2727 would still suffer from 3) if we
     just use `sysroot_src` + `crate_attrs=3D["no_std"]`.
  7) We need an infrastructure to conditionally include both
     `sysroot_src` and `crate_attrs["no_std"]` based on the user's
     rust-analyzer version.

I hope this clarifies the intent.

> > @@ -432,6 +435,18 @@ def generate_rust_project(
> >              ),
> >              "sysroot": str(sysroot),
> >          }
> > +    elif version_info =3D=3D RaVersionInfo.SUPPORTS_CRATE_ATTRS:
> > +        ctx =3D RaVersionCtx(
>
> I think you forgot to define RaVersionInfo.SUPPORTS_CRATE_ATTRS?

Yeah, interestingly, mypy didn't complain about this. I'll fix it in
v5.

> > [ ... skip 7 lines ... ]
> > +            "sysroot": str(sysroot),
> > +            "sysroot_src": str(sysroot_src),
> > +        }
> >      else:
> >          assert_never(version_info)
> >
>
> This bifurcates the handling of RA version differences: half of it is enc=
oded
> in RaVersionCtx, and the other half is here in the presence or absence of
> "sysroot_src". Can we keep it somehow more contained?

Fair point. Actually, the presence or absence of `sysroot_src` should
depend on `manual_sysroot_crates`. To keep things more self-contained,
I think it would be better to embed `RaVersionCtx` directly into
`RaVersionInfo`, since the values in `RaVersionCtx` are solely
determined by the version.

I'm thinking of something like this:

-------------------------------------------------
@enum.unique
class RaVersionInfo(enum.Enum):
    DEFAULT =3D (
        datetime.strptime("2024-03-11", "%Y-%m-%d"),
        (0, 3, 1877),
        (1, 78, 0),
        RaVersionCtx(
            use_crate_attrs=3DFalse,
            manual_sysroot_crates=3DTrue,
        ),
    )
    SUPPORTS_CRATE_ATTRS =3D (
        datetime.strptime("2025-12-22", "%Y-%m-%d"),
        (0, 3, 2727),
        (1, 94, 0),
        RaVersionCtx(
            use_crate_attrs=3DTrue,
            manual_sysroot_crates=3DFalse,
        ),
    )

    def __init__(
        self,
        release_date: date,
        ra_version: Version,
        rust_version: Version,
        ctx: RaVersionCtx,
    ) -> None:
        self.release_date =3D release_date
        self.ra_version =3D ra_version
        self.rust_version =3D rust_version
        self.ctx =3D ctx

# ...

def generate_rust_project(version_info: RaVersionInfo, ...) -> RustProject:
    ctx =3D version_info
    rust_project =3D {
        "crates": generate_crates(ctx, ...),
        "sysroot": str(sysroot),
    }

    if not ctx.manual_sysroot_crates:
        rust_project["sysroot_src"] =3D str(sysroot_src)

    return rust_project

-------------------------------------------------

This allows us to remove the if-else branches and the `assert_never`
check altogether.

Best regards,
Jesung
