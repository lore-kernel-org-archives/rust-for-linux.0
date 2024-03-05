Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767259B6D
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Mar 2024 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709640516; cv=none; b=VH5OLFS7laJEXSBq7j9lm3tLygknLhOiXgt5gBAYUvFSlGMRWfprqcLHuMYWxANS6p0sJJ+Dx03b/szj+rk5D6GenaFceN1Z77BBGRC0rhL7s7+F8kUBAk168ODsALfxJECSzScOAkrJy3FZm6DRzV8lg9UEU9804shRvL34o3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709640516; c=relaxed/simple;
	bh=HcK0l/BHXAgqHPymN9fB15z0EqjWog4wSbLUTN9ixjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tT/C5sVJW0DgHm6U++S3xKzyNUtl1l6UBeh8kWeooA/JEd05QKT+y4jYlZ8i6EbndWYoEml2qNkkwCVrikfimXOKJYY1h/DT5SEeFla/frtYmpqOR9Wz41Pyk3U0GEUwPed5nUKH0kkQ4b6C5B3ZwimIS0ipE9SJmr1jmPRII6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=16TPWJKc; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="16TPWJKc"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7daf957595bso1513447241.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Mar 2024 04:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709640514; x=1710245314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ue0JJLooATJd4KIk6vsk/JW10lt7mv7VvgdOgn+vX8E=;
        b=16TPWJKcAuI0Abq7VndNv8Xa6dniCesiqzk26ySLiPFDzy5yfHmOFppQEgDbse/xzy
         UW/DqqqMIlMC7iUCAMFgxLBkRPBBMcRWhywIl70yoL3FcPIkSmnq4/vvsiUhxcXTbg2A
         T4qgI7XzuET+WmzPbl0IjYGKPtSMLPFOIH9t86ldrJpqQUifkMp7J/qrFSY1YGfBBkCf
         JZklGmuEpHRqbm9J0OTQDznqlQIObiuK7LpW15CohtN7yG7wbK6ym5DYhVjdrCsi1N+p
         ihluvnJBNippp2yZITtY2VnNCUeMSXkDebxCOChin8wLz0DICat/Tj09BKGrRHQLnV6i
         x26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640514; x=1710245314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ue0JJLooATJd4KIk6vsk/JW10lt7mv7VvgdOgn+vX8E=;
        b=qBA6HR1YMZlJPF8wPdnZiDZPVWReOrbkTxOxQQECNGqZemj1q/zrSmDbqh018u0hLO
         F3+K39cv9uzVZeexwYUopFJCxlJ8QkPrFvxi5KdZoGRrrG2zNT2pHuq2SmEUDG/biWHc
         AbkC4mD54xuAWTQTf5ylujkuty1TVgSuL71cX1aBk03QI7aYBKwepHOkITukXuleNAiS
         uC3ydtvVDobOhw6a9VAqGC2FunFczfwMwSWaiP6lB6oCvWl24cOBByJ/I9OXvGlLxwbm
         +PyAalQ/hjfM/qAPb47fPwCmSoW7s/NpdXpDU47Ai5Sc7BgP0R5mPxv31VoB80H7e+Pz
         ADfg==
X-Forwarded-Encrypted: i=1; AJvYcCWXTWil36Ucpdlrb6O3P0rvLp3aCuL4lAW7ZLg9VoeOd5OxxhcC94LcqfsPI70G7OqdQthfY6VdJPxnRdj9lKGwJN67LvQp1eiPTubMT6Q=
X-Gm-Message-State: AOJu0Yx2xwyLnW6/h1BISolv4hWrPxeQ3K3ZY8SOf4NgS+ug48uzrSf2
	36xijCsE47Hm6Nr3ciSKknqXnSHVvUqGdzeRqsXLtw4RUFws9HW36Hjm5lsAcyyITGUCPvGhXH+
	kXCRkQGYSgkMcew0YAzRqnfqcEuFh0mH1wl+Y
X-Google-Smtp-Source: AGHT+IHbXJddAFtZgczMoWL38ASf21YaUKf6g2ubRMyi2RXEGet0mKq/ySvl6G/8eICpZnqJidkQWIm5ONtKFU97er4=
X-Received: by 2002:a05:6102:da:b0:470:576b:62f8 with SMTP id
 u26-20020a05610200da00b00470576b62f8mr1404722vsp.7.1709640513797; Tue, 05 Mar
 2024 04:08:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgg0yGbuHnMbMB103Zssg4KSfXUR3kvhr0kuqTSah=6kWg@mail.gmail.com>
 <20240305112017.125061-1-kernel@valentinobst.de> <CAH5fLgis7Usg_cfWM5rBKjRKsB4857PkyuCMrCU6PmEqTOMFiw@mail.gmail.com>
 <CAH5fLgj=iuWNWy9jGvaD0SCcZg6GSj9XBgB0vZwL8EokobUPMg@mail.gmail.com>
In-Reply-To: <CAH5fLgj=iuWNWy9jGvaD0SCcZg6GSj9XBgB0vZwL8EokobUPMg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 5 Mar 2024 13:08:22 +0100
Message-ID: <CAH5fLggdR1UPNUa4R4CeJr+0cVRRr7cvyEQ3XhYaEqVD1cRtYA@mail.gmail.com>
Subject: Re: [PATCH] rust: add flags for shadow call stack sanitizer
To: Valentin Obst <kernel@valentinobst.de>
Cc: Jamie.Cunliffe@arm.com, a.hindborg@samsung.com, alex.gaynor@gmail.com, 
	ardb@kernel.org, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, broonie@kernel.org, catalin.marinas@arm.com, 
	gary@garyguo.net, keescook@chromium.org, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com, wedsonaf@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 12:31=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, Mar 5, 2024 at 12:28=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Tue, Mar 5, 2024 at 12:20=E2=80=AFPM Valentin Obst <kernel@valentino=
bst.de> wrote:
> > >
> > > > >>> It's not 100% clear to me whether this patch is enough for full=
 SCS
> > > > >>> support in Rust. If there is some issue where this makes things=
 compile
> > > > >>> and work without actually applying SCS to the Rust code, please=
 let me
> > > > >>> know. Is there some way to verify that it is actually working?
> > > > >>
> > > > >> Perhaps you could write a Rust version of the CFI_BACKWARD test =
in LKDTM?
> > > > >>
> > > > >> Alternatively, the simplest way to verify this is to look at the
> > > > >> disassembly and verify that shadow stack instructions are emitte=
d to
> > > > >> Rust functions too. In case of dynamic SCS, you might need to du=
mp
> > > > >> function memory in a debugger to verify that PAC instructions we=
re
> > > > >> patched correctly. If they're not, the code will just quietly co=
ntinue
> > > > >> working without using shadow stacks.
> > > > >
> > > > > Was just in the process of doing that:
> > > > >
> > > > > - `paciasp`/`autiasp` pairs are emitted for functions in Rust mod=
ules.
> > > > > - Rust modules have no `.init.eh_frame` section, which implies th=
at
> > > > >   `module_finalize` is _not_ rewriting the pac insns when SCS is =
dynamic.
> > > > >   - Confirmed that behavior in the debugger (C modules and the C =
part of the
> > > > >     kernel are correctly rewritten, Rust modules execute with
> > > > >     `paciasp`/`autiasp` still in place).
> > > > > - Kernel boots just fine with Rust kunit tests, tested with and w=
ithout dynamic
> > > > >   SCS, i.e., on a CPU that supports PAC/BTI and one that does not=
.
> > > > > - Rust sample modules load and unload without problems as well.
> > > > > - `x18` is indeed not used in the codegen.
> > > > >
> > > > > I guess we might be able to get this working when we tweak the bu=
ild system
> > > > > to emit the missing section for Rust modules.
> > > >
> > > > I suppose the -Cforce-unwind-tables=3Dy flag will most likely do it=
.
> > >
> > > Yes, enabling this means that `.eh_frame` sections, which are convert=
ed to
> > > `.init.eh_frame` sections for loadable modules, are generated for Rus=
t
> > > objects.
> > >
> > > Tested booting, kunit tests, sample modules (as builtin and loadable)=
 for
> > > both, dynamic SCS active and inactive. Backtraces on Rust panicks als=
o look
> > > normal.
> > >
> > > Confirmed that in the debugger that builtin and external modules are
> > > rewritten (or not rewritten if no dynamic SCS). Did not check that th=
e
> > > `eh_frame` sections are exhaustive, i.e., cover all `paciasp`/`autias=
p`
> > > pairs, only verified a few functions (in init text and normal text).
> >
> > Thank you for checking that!
> >
> > > > There's also an use_sync_unwind option, but it defaults to no, so i=
t
> > > > doesn't seem like we need to set it.
> > >
> > > Are those defaults stable or will we notice if they change? If not it=
 might
> > > make sense to set it explicitly anyways to avoid surprises in the fut=
ure.
> >
> > The flag itself is unstable, so I imagine that nothing is promised abou=
t it.
> >
> > I tried it, but I wasn't actually able to find a way to set it. I can
> > see the flag in the rustc source code, but passing -Zuse-sync-unwind=3D=
n
> > results in "error: unknown unstable option: `use-sync-unwind`". Not
> > sure what the issue is.
>
> Oh, I understand now. It's really recent and not in 1.73.0, which is
> what I'm using in the Android build.

Sent v2 with what we have learned:
https://lore.kernel.org/rust-for-linux/20240305-shadow-call-stack-v2-1-c7b4=
a3f4d616@google.com/

Thanks!
