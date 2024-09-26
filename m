Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064741AED2C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347135; cv=none; b=UDsZWxb+4eT7UwIlGsAznDlckU+hVv4yQ+9VcuPVGnfhs/Jd7Sgwdl1vodVx6UCWBlot/bgptAblfUj6/EL5CN7+TlInVc1H2PU2SbMgvutsQo7E7eJcj3iC66fxp/Rgn8v8CyvcjkUJFTmDhu3zWlXhHA+6gVxFlGIAOMz6VlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347135; c=relaxed/simple;
	bh=8r1pcZkfw/tFfZR6si2jJmP1lsdT9fdbbtCLXQYgb+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEnDcMyQ6E0j1VuSIRq34OZxgAjG9XdNeh0n1z7Ok9w46SqF4ssIke1dBfLamJAGALWWgbMqYGHToyG+xF2fWRGfiCqooDYprSS97U95oUxXP05lThmb1wzqhn4ueGNHm0fOmVXhgaSlcai3mmj6+raGmcVOIaJqNzm3cU+dAAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I06fjO7L; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I06fjO7L"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374bd059b12so434059f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727347131; x=1727951931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsEcz1fbSNxPzlZJA2pt/9oZVDJuGBFj7OVbuqkmeN0=;
        b=I06fjO7LaKok3OIAYCTlgHRfm8QtC/FzLlACcjjGolR76AATX8bnk7s2B9q91pD0Sw
         INimwp/+vULcEBGor6PHdzSbzRlhAcoMNZFH8iAolvCwUndbyXXauxCwcMXXPERw0C07
         cOvtdthGT/GdA8ehMpHGbbh2WGQf6EQMN1HBvTKW/newkK6iCVHRxcYFPULxVNUK1KMk
         y6qiRalTbqGv+v/ap6EE+Q69U92zUGk4iuuwAy/6Ias9CuaXuRSkKkt+7gzLSwp/3pXN
         Z5rGBZs20J6NY4ln5XfzaWkJPs+2CSDas0vXnBWh8NWCNZN2aFJl6rZ7tMORfUMYmRkX
         ZH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347131; x=1727951931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsEcz1fbSNxPzlZJA2pt/9oZVDJuGBFj7OVbuqkmeN0=;
        b=gWtAlijbfbijuGKvhtkU3nVToWs4tKLLDF16kzX9HLEZfNKUfxKv0xrF59/IQ42+V+
         e4WrbEPH7zRkn6ahF0E7Ju6csDOEoJuR4ibrVxsMOKJVhpnheILWdtj5DA/ovBdJhJQV
         fPvPO2j//C6qNoSyiDCwikOg4FgmzEhRadoTlKKX72hMjiIgs4m73e/2XyJ4W14FWVmP
         OjxS6a13jCICodm3AuwhsXJN6HFown/axP4SgjNwDJ8ANoXCQEGQvNJwXNifHGH2OJxn
         76rVLSmTMb3O0B2+Ygyb8Qg7UYrd5V/vvpf4tAj2YkaJoBB01eQdDOBZZ2L2gOD6+gB4
         CTEg==
X-Forwarded-Encrypted: i=1; AJvYcCUBGmf/ZMyAKNoT2vHeEUEDFtoC5z3t8r2OMjos4lMiEIH3kYxB/Fepsip0q0YytRHZhXoYWkwghBhP0KhU7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64r4QS2kYizKl6u0pzEAB0efoRXByXYvdo8bwhbfRD2Fz3arV
	B1E1qcORnfQwilo/7/0SNc21QqWw/un27kXUAfFN1e03AZWzNiNMod41ugULxAM5xCp5I3JJ3rL
	IYsZFlsD+sQ/iJcuqH9vgnvTArJ5uKC40fHb+
X-Google-Smtp-Source: AGHT+IG5GKlP6TVqHse15LFnIap0YvbFb8l1DzbrYAO+qzwI5i5VHGfbIunMaThYXrhbKoz3QqKt8XmqA8AbgALoDCU=
X-Received: by 2002:a5d:4e0c:0:b0:374:ba83:8d73 with SMTP id
 ffacd0b85a97d-37cc245b82fmr3076607f8f.8.1727347131137; Thu, 26 Sep 2024
 03:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com> <20240926000053.GA3188344@google.com>
In-Reply-To: <20240926000053.GA3188344@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Sep 2024 12:38:38 +0200
Message-ID: <CAH5fLgjoQvxFj5S1s_fUsfSho9QRCV5acHsQxpZdvEztpaxqCw@mail.gmail.com>
Subject: Re: [PATCH] cfi: encode cfi normalized integers + kasan/gcov bug in Kconfig
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi Alice,
>
> On Wed, Sep 25, 2024 at 08:10:18AM +0000, Alice Ryhl wrote:
> > An alternative solution is to inspect a binary created by clang or rust=
c
> > to see whether the faulty CFI tags are in the binary. This would be a
> > precise check, but it would involve hard-coding the *hashed* version of
> > the CFI tag. This is because there's no way to get clang or rustc to
> > output the unhased version of the CFI tag. Relying on the precise
> > hashing algorithm using by CFI seems too fragile, so I have not pursued
> > this option.
>
> I suppose there would be no need to hardcode hashes in the test,
> it's enough to verify that the hashes for the compiler-emitted
> functions change when integer normalization is enabled. Still, I
> agree that this doesn't sound worth it in this case.

Future compilers could change it so that the same hash works in both
cases. After all, the signatures in question have no integers in them.

> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index ee58df8b1080..b8066bf43153 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -829,7 +829,7 @@ config CFI_CLANG
> >  config CFI_ICALL_NORMALIZE_INTEGERS
> >       bool "Normalize CFI tags for integers"
> >       depends on CFI_CLANG
> > -     depends on $(cc-option,-fsanitize=3Dkcfi -fsanitize-cfi-icall-exp=
erimental-normalize-integers)
> > +     depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
> >       help
> >         This option normalizes the CFI tags for integer types so that a=
ll
> >         integer types of the same size and signedness receive the same =
CFI
> > @@ -842,6 +842,22 @@ config CFI_ICALL_NORMALIZE_INTEGERS
> >
> >         This option is necessary for using CFI with Rust. If unsure, sa=
y N.
> >
> > +config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
> > +     def_bool !GCOV_KERNEL && !KASAN
> > +     depends on CFI_CLANG
> > +     depends on $(cc-option,-fsanitize=3Dkcfi -fsanitize-cfi-icall-exp=
erimental-normalize-integers)
>
> This looks reasonable to me. Thanks for the fix!
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Thanks for taking a look!

Alice
