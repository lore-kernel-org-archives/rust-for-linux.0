Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BA435F5FE
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777207447; cv=pass; b=rywTA3aU39GA2IQ8RYeAfyI1nzQ9+OZH9wEnwOxwp2btQLa6kAg3L7KrCt8gszxBjdgdUbIspSutUH7ymG/+Lv4y2SYu5+zaqVkBUqLuoOKZcqUFWbsvgMrUYGOrYmCYcgendz9zhOHNQ5M077bJoMN3vFrbUSeB6rtUfip2PGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777207447; c=relaxed/simple;
	bh=Fp4It4HmEgApqaxROWu0mtfxlxyrxcFZQ9SZCe1LntY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clumD/K4QWOLumfJbi0aBESruVtyp2/5pins8jp6gKLycDa3PMQGOjeXRdM+gLWehms6QE8Q/9BPgT1tQPOjOB/aIwlCUOvgIikP+n7Qd6fBnAbynghFF/WWnXb9RFn0cxDRyA+cVsejx0NX9BFGIqOJF7kuS6FaPyr8D48GGX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2F5nuFr; arc=pass smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2F5nuFr"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dcdca9aa0bso4239049a34.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 05:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777207445; cv=none;
        d=google.com; s=arc-20240605;
        b=GLN/MsfFhRdTdN1/83E5egaW4FEU4FMNACp1gcVnyjk/R3Sti31Js0yOOfw4PTKlee
         upWlkZtvNCgMNTi/mifMPTauFZmmCT3+rdS7A+rEOa/i6uqQDVGMzij+u/GimXzNI7Zo
         S+vmJA1TLTwwYfLAceHjUbaK9KBl5DT5NwFd46WTF7vPEgb2NzWsqJV/0ozrqfSAGcwA
         18PZTTMZZiOsha3TC3PvEmUWJQBrFncZ0PH91IRxWh0H4jhjcGCvwRO+gAYCAArLtHjJ
         X9xJWgZ9Wh22ACNBE3/OQyJnKwNAVZH+7tHM5BKd/ZUoz6opX4g4Da0Cjwi4fZSuH3nA
         5kNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wn0+7ArnVhPx2m5qBhAts9SM0OHGsVDDiW7Ty3ksevM=;
        fh=11K7h6/A8DQIJ7Gg+L69kUNq9FUM8ILHlS2Q/bwax5E=;
        b=Oc33AbnwPCwQ6DChWDSQFkOWDYvCQ/rwItkylCdFOg0t4itFm/1dxrazozhQte9u+/
         qcwI+J1QnnoDnIiQHTNFM4oN5Ztw8NxKSIwJJNWvupQWrA1b5zfaeZYyEqRmPUe+S5aB
         ai7Ln8EYIdZXW3ZJvy+S75ZgEz2w52KgJ0VEcjrjTNWZ+H3grrfpHNqwuMSR3sec4SB7
         JaLGLOfnxNXqzmeV0GuMmvpycCXLXWGY5ECOqwZsJaz/VdVJiyBHhRsBLLNgD9abrjub
         V6lA/TMn6ECl4et9nal7CgElqE1mc+MurSTQ2y3Nhdh/VIJFwPcVcLVwcVVqnSPC+i3E
         VAFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777207445; x=1777812245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wn0+7ArnVhPx2m5qBhAts9SM0OHGsVDDiW7Ty3ksevM=;
        b=m2F5nuFrDzDQ/ZR1zx7LlqcPmHC/llmVVFTWlBQNHN0YSyk41AXDP5uiUjLSwXS+PC
         Ymjsvd832dIiUUH7vZCe/LPRBFG+7ta0AEyL3ND95a3ecPRr9Q6YI+YidMjKJFRt/tWA
         GWGvSOJj5nOBT2EJF8Ws7Yn4rVdE420IK0j114gAo4DuEtYqnjFKoo5KTnoPYGXg3v8D
         Ee7F/HrOYYqRQmhhvkAKIb3zFlOD4zGg9UInrocQQ8ycl3pNgvaNDLOjnfM4lzdP7h4t
         Snr3gkGAx/dslpcCuZL6ZS8jFJBsIW2dvBC91zxxqTY0aRyAG5hSydF3OdemNWxbYDXF
         kICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777207445; x=1777812245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wn0+7ArnVhPx2m5qBhAts9SM0OHGsVDDiW7Ty3ksevM=;
        b=FWreVaeJJMKt/UHg4sMLjP3OqyjkebVg3CNEJkA7MnwayMzncTiyMDirgqvT6asjmV
         qWtIKvs3PiMm9NMUQWBdZNmVyrEnsaDDrsS2QGiqcbmkgOynPCLsLnqAj7IOI00093fW
         40rdAZJr2vpJ+4E2vJTOiQxYR8lm3nzHrTldvsXzbu3SImMQsSrOggQoBa2EAq8W5rEg
         mCQHbKZoaUKerwCSjeLKaNZjCyqShPgV7FN6ekbFd7uP5s6EeQpFnwWc5VzRbKESQaVX
         JcH9VQCCtG13hjG4QPqq0pwsN+ik8k6acxwP2f26ADHI/0aWcikXr+rFJdl4NiAFRVk8
         v+LQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fyVbBdPmHEgJwxhVeOfu+ScXsdUnqFh7TWiVeBFkNWj0Y4/urPVoETzVGuqk9w+gOhnBFkJRU7NlHubwxRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1xjiMhrt1sXbePFZLYi7VplwaUWqXvgVEch/2F+hgv+UNDTps
	KJ3pBoQsGBh/9mPfEYZhgTeQbClHqWNN8zTNWLclowspr7MHrDCtLM2aVJ18busHScUFenjA74u
	wCwxSGnFH0I8adKVVeXPdzlbmX1WDzZ4=
X-Gm-Gg: AeBDievZrE8jBIN38ALQHF8ug7+3GSPgBmbQklg9v6lBzFSn8+yAen7RFUtusCuBT92
	SK7Af6xkklS2dCYPO6/fwLCxLuXZ/v0A0Osy1uQXn9lfe5d97kDfhrfL6arc47iEM0pL5saCsAI
	2BuAdx4ICCVeueLlAfB4y2QHhkwTG7Ao8WMm3w7HuSEXhzccqEM4XWzNnjIm9GrHac++ASqgKTc
	tRmEv+SUVBlrxh3GK7YpAxu+Y508FONhFGjTaEAkcmmR7Zg1uFYytYazUSP5/g4sfRftF+dMIXl
	ANjaVZCPsDx4Cjajvw==
X-Received: by 2002:a05:6820:83da:20b0:694:6559:e2eb with SMTP id
 006d021491bc7-6946559eb06mr12095934eaf.14.1777207444926; Sun, 26 Apr 2026
 05:44:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
 <20260317-ra-fix-primitive-v4-2-bc06709c8243@gmail.com> <177393252082.237.17419844885611963902.b4-review@b4>
 <CA+tqQ4KK=Ukma8-S47+Lr_YK94Pz76BRD5cfwxSxvYytFiy2qw@mail.gmail.com> <177713082412.98244.16931124285886474486.b4-reply@b4>
In-Reply-To: <177713082412.98244.16931124285886474486.b4-reply@b4>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sun, 26 Apr 2026 12:43:53 +0000
X-Gm-Features: AVHnY4J3pKmsMWW9O0Z19YQHPDkTeUFvSe8TZgLSwesoM3yr-jGwpwLPV_4OFcU
Message-ID: <CA+tqQ4JrdxiwV4OLJa_Qq_dkqf6LjSdxZLyXFx42S_9cZVR6XQ@mail.gmail.com>
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

On Sat, Apr 25, 2026 at 3:27=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
> On 2026-04-25 12:17:04+00:00, Jesung Yang wrote:
> > On Thu, Mar 19, 2026 at 3:02=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> > > On Tue, 17 Mar 2026 18:29:55 +0900, Jesung Yang <y.j3ms.n@gmail.com> =
wrote:
> > >
> > > This seems to be independent of the RA version. Is this broken today?=
 Should it
> > > be a separate patch? Maybe that patch need not be in this series.
> >
> > The primary motivation for the versioning infrastructure was to
> > incorporate the `crate_attrs` feature introduced in the recent
> > rust-analyzer release (denoted as `RaVersionInfo.SUPPORTS_CRATE_ATTRS`
> > in our case).
> > This solves the side effect of enabling `sysroot_src`: `sysroot_src`
> > implicitly brings in `std` as a dependency, which is undesirable for
> > driver crates. Setting `crate_attrs=3D["no_std"]` is a direct fix for
> > this.
>
> I think I understand. Setting `crate_attrs=3D["no_std"]` is a no-op in th=
e
> absence of `sysroot_src` but required for correct behavior in the
> presenve of `sysroot_src`. Do I have that right?

That's correct.

(Technically, the standalone `crate_attrs=3D["no_std"]` isn't a true
no-op, but you've got the idea; in our case it's effectively a no-op.)

> > I could split this series into two separate patches, but I prefer to
> > keep them in the same series. I think a standalone versioning
> > infrastructure patch would be unjustified in isolation without an actua=
l
> > consumer of that logic.
> >
> > > Is this broken today?
> >
> > If we enable `sysroot_src` without `crate_attrs=3D["no_std"]`, users wi=
th
> > a fairly new rust-analyzer release would see, for example, auto-complet=
e
> > suggestions for `std`.
> >
> > To provide full context, here is the sequence of issues:
> >
> >   1) Inherent impls for primitive type have been broken in recent
> >      rust-analyzer releases.
> >   2) To fix 1), we need to enable `sysroot_src`. There are also other
> >      reasons reported by Eliot to enable it, as we know.
> >   3) A new problem emerges: rust-analyzer thinks we have `std` in the
> >      kernel driver crates.
> >   4) To fix 3), we need to use `crate_attrs=3D["no_std"]` alongside
> >      `sysroot_src`.
> >   5) However, `crate_attrs` is only available in rust-analyzer>=3D0.3.2=
727.
> >   6) This means rust-analyzer<0.3.2727 would still suffer from 3) if we
> >      just use `sysroot_src` + `crate_attrs=3D["no_std"]`.
> >   7) We need an infrastructure to conditionally include both
> >      `sysroot_src` and `crate_attrs["no_std"]` based on the user's
> >      rust-analyzer version.
> >
> > I hope this clarifies the intent.
>
> Oh, this contradicts my understanding. Forgive me if I misunderstood,
> but aren't you populating `crate_attrs` above unconditionally? Unless by
> "only availble" you mean it is silently ignored by earlier versions? In
> that case this all makes sense.

The conditional guard actually lives in the first patch:

+        crate_attrs =3D (
+            crate_attrs if ctx.use_crate_attrs and crate_attrs is not
None else []
+        )

... and I don't understand why I bundled this into the first patch.

Apologies for the confusion, I'll move the logic related to
`use_crate_attrs` to this patch (i.e., [PATCH v4 2/2] scripts:
generate_rust_analyzer.py: fix IDE support for primitive types).

(As a side note: `crate_attrs` is indeed ignored by earlier versions,
but since this behavior is not publicly documented and is more of an
implementation detail, I'd prefer not to rely on it.)

> > > This bifurcates the handling of RA version differences: half of it is=
 encoded
> > > in RaVersionCtx, and the other half is here in the presence or absenc=
e of
> > > "sysroot_src". Can we keep it somehow more contained?
> >
> > Fair point. Actually, the presence or absence of `sysroot_src` should
> > depend on `manual_sysroot_crates`. To keep things more self-contained,
> > I think it would be better to embed `RaVersionCtx` directly into
> > `RaVersionInfo`, since the values in `RaVersionCtx` are solely
> > determined by the version.
> >
> > I'm thinking of something like this:
> >
> > -------------------------------------------------
> > [...]
> > -------------------------------------------------
> >
> > This allows us to remove the if-else branches and the `assert_never`
> > check altogether.
>
> Looks reasonable to me. I'd rename DEFAULT to MSRV. Its value should be
> the new MSRV which is 1.85.0.

Thanks for the reminder!

Best regards,
Jesung
