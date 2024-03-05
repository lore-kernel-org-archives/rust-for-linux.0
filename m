Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C15A796
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Mar 2024 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709638152; cv=none; b=nowb8XJYWHfxKxSg3Tn9xKc2ivbviNDSIJwl+ta0fxubhoYaktIo+uQ9aTlJ5z6QQYH30t0UMaq5weZZdQqejjydQG2L+iKUMij4ngH+7diYPC/GxyVqd90yvkAgLKyiAJ7ef+BWfFWtbbiohFVo1Wl7QM/bqz30vU0mjcIebJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709638152; c=relaxed/simple;
	bh=nqzoNTG+LLeNiBfLhT0nlU8pKlZ726spH2PvYWAFk0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gU42BoJOa5FhUr3TjZpRGzIDQh7wqlmQ2vEyjgp8KYyWBPSwFjnCmRPzPPbLjl5gP1bJ57sNnZoEl+tJpXhEXW8mhr2XwQy4lUXlEnf/i3F5IiaiQf5ox5lyKRo5JSlpSLi0WzFFkoRcXh7ohcp4qZmhsI7ap1aNZ9QXygmYuYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3nDV6Xk; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3nDV6Xk"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7dacc916452so1668501241.0
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Mar 2024 03:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709638149; x=1710242949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgbr5zIypJOtvJjvWIQrJ7ktGBfwrxJAGehWAgkpIdY=;
        b=T3nDV6XkSMVWcfAfCw+DNLx11mzVgyjaJFR0MJ3LXowNwj8mpqZKbJBr3yKD42bnLI
         CWAk/3Phrb2h8Z/52/UGWdDiK04PcaYZzlg4n+7tLISm9jpLRTuyPPQKHkg4cupSzNPx
         8tC/64GYrVyrmYXMjr/xrodFrSz1JfYWGwvejY3PNP0N0A8eSgYvkhXzISTQsI2yDdxA
         xqgcXtO8HNt1Q6+r5fFJakscZAUMjRemM9NN4dfGROhCDoGXLoycJ+RZmcy4yUQ0Au49
         hzZCnQ0RlYJ8q03p/ZL6xOOkubfZdb5oqe6lMEzt96Df97ew72k9yp4jMXGfHFXDfSaw
         S7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709638149; x=1710242949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgbr5zIypJOtvJjvWIQrJ7ktGBfwrxJAGehWAgkpIdY=;
        b=AmRwyL9S8O2ELd3CMbGcUAXNnlHrSA+Gta7ZeuPUYYN4WQ+zp3REKlZsb5VvUnZs1F
         s86Tc0guM81nyltp9key6LSBcCqrvVZpjOLdlP5wAI1itaYDyNk6uYtcoDaOHXkp77Gi
         FsNnGIMW6XyOuwxsRanJVRo6hTMFbpDjDNRkyTTsJDrZNeI05ZDkipwpaAvY0vTzym/E
         IyfHnBF59hlng5fu7ZXAJklN/Q9ncybpRJxLj5ZRY7VzYqJEn0aEb+mJz/DK+RVVkQIR
         V2rVeMbbo3ooegn53u2qMCQV8aaqleDghwc6XIPPP6Dst3oYF7dByKpSAQRPWMuUVDMc
         iPgA==
X-Forwarded-Encrypted: i=1; AJvYcCUs9GCIkPko5i+WGqXxsbDHodPwCM5vQK0ZutW8ggIhwaq9MDVn23yi8PZ3fsrUTtudg64kM2sxWuFtuA4bImt52dKMNUcsGGK36Lz7tec=
X-Gm-Message-State: AOJu0YwI0JPw/gP5ZdbporQz47dEi4kkZjxuVkoa3CyJZWYc/BgvS7RR
	pwQCCHdPxYiG1CufziRfby1G66py7WRXHt4FT1b617nblDC7JmTfKDJC+ZWYEJPoKWzDyuL0x3b
	aNa5Fp+0SB6Br6lGMNbmeD1bJhiHkLoEUiW9W
X-Google-Smtp-Source: AGHT+IGpOBLC+BbLrOgfHnkyOiT9gLxOmmAlS/esniw2+8StXRgbvjg2B3geQPomCQ/pfEeaCABQERW98DtU6agL1VU=
X-Received: by 2002:a05:6102:1284:b0:472:a8e0:49fe with SMTP id
 jc4-20020a056102128400b00472a8e049femr1088907vsb.35.1709638149135; Tue, 05
 Mar 2024 03:29:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgg0yGbuHnMbMB103Zssg4KSfXUR3kvhr0kuqTSah=6kWg@mail.gmail.com>
 <20240305112017.125061-1-kernel@valentinobst.de>
In-Reply-To: <20240305112017.125061-1-kernel@valentinobst.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 5 Mar 2024 12:28:58 +0100
Message-ID: <CAH5fLgis7Usg_cfWM5rBKjRKsB4857PkyuCMrCU6PmEqTOMFiw@mail.gmail.com>
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

On Tue, Mar 5, 2024 at 12:20=E2=80=AFPM Valentin Obst <kernel@valentinobst.=
de> wrote:
>
> > >>> It's not 100% clear to me whether this patch is enough for full SCS
> > >>> support in Rust. If there is some issue where this makes things com=
pile
> > >>> and work without actually applying SCS to the Rust code, please let=
 me
> > >>> know. Is there some way to verify that it is actually working?
> > >>
> > >> Perhaps you could write a Rust version of the CFI_BACKWARD test in L=
KDTM?
> > >>
> > >> Alternatively, the simplest way to verify this is to look at the
> > >> disassembly and verify that shadow stack instructions are emitted to
> > >> Rust functions too. In case of dynamic SCS, you might need to dump
> > >> function memory in a debugger to verify that PAC instructions were
> > >> patched correctly. If they're not, the code will just quietly contin=
ue
> > >> working without using shadow stacks.
> > >
> > > Was just in the process of doing that:
> > >
> > > - `paciasp`/`autiasp` pairs are emitted for functions in Rust modules=
.
> > > - Rust modules have no `.init.eh_frame` section, which implies that
> > >   `module_finalize` is _not_ rewriting the pac insns when SCS is dyna=
mic.
> > >   - Confirmed that behavior in the debugger (C modules and the C part=
 of the
> > >     kernel are correctly rewritten, Rust modules execute with
> > >     `paciasp`/`autiasp` still in place).
> > > - Kernel boots just fine with Rust kunit tests, tested with and witho=
ut dynamic
> > >   SCS, i.e., on a CPU that supports PAC/BTI and one that does not.
> > > - Rust sample modules load and unload without problems as well.
> > > - `x18` is indeed not used in the codegen.
> > >
> > > I guess we might be able to get this working when we tweak the build =
system
> > > to emit the missing section for Rust modules.
> >
> > I suppose the -Cforce-unwind-tables=3Dy flag will most likely do it.
>
> Yes, enabling this means that `.eh_frame` sections, which are converted t=
o
> `.init.eh_frame` sections for loadable modules, are generated for Rust
> objects.
>
> Tested booting, kunit tests, sample modules (as builtin and loadable) for
> both, dynamic SCS active and inactive. Backtraces on Rust panicks also lo=
ok
> normal.
>
> Confirmed that in the debugger that builtin and external modules are
> rewritten (or not rewritten if no dynamic SCS). Did not check that the
> `eh_frame` sections are exhaustive, i.e., cover all `paciasp`/`autiasp`
> pairs, only verified a few functions (in init text and normal text).

Thank you for checking that!

> > There's also an use_sync_unwind option, but it defaults to no, so it
> > doesn't seem like we need to set it.
>
> Are those defaults stable or will we notice if they change? If not it mig=
ht
> make sense to set it explicitly anyways to avoid surprises in the future.

The flag itself is unstable, so I imagine that nothing is promised about it=
.

I tried it, but I wasn't actually able to find a way to set it. I can
see the flag in the rustc source code, but passing -Zuse-sync-unwind=3Dn
results in "error: unknown unstable option: `use-sync-unwind`". Not
sure what the issue is.

Alice
