Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9EC3A784D
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951332; cv=pass; b=crZC+JwTYnDmbEtbRwozHAAmDohOUzGj55tGjSQ0yT9B8lxY7u1VHwCSMP5Vvl3d4x0+TkSl5w7ElYNIltzFoztj4skbXE6GtDRT7MEC+P+68nOMQN6vIdi15zYZ9pe3qHtfAazUsAL0IsgF0fzXI32UkM89RFArYdxwAP3Pco4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951332; c=relaxed/simple;
	bh=NcSXw2HJsJraWVfV0B2TsfnQhljzimFsSoywmgza1gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHi4VdxmlyxPxKSleWhppStDjSF2BlJJH6vO3I98F5hHSRI1tBAVw1WhwOwWb0u18TpE5TDfdvfs2nN6aGU6ud2UV30foydvyNQMvaE38AOirQ+GvcwS6Hsv891StAx5ya5aqiPBNgX1h2lxQqxfoKEJ+GNkvZCYTabNdsJK2fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ga2i+hAk; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ga2i+hAk"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1270fc2bdf2so1326c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 08:42:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771951330; cv=none;
        d=google.com; s=arc-20240605;
        b=ZJOwFXS5jiYrKbF5ZE79mFYYMz/tUYlzzeIuNQ0r2TKksMKOrGikPobcU942XVxS4o
         dJq+nnIs1HoBg8AUgXWzepEt4jOtZK4FlWH/UtW3KG9IS4+Zvw1SuxURMco0YOlO6fM6
         cbbQj5ghnN5IIuja1/CXzI25Q7wJl80xc6cr5QBP53jyczibt4UWId2dqahNdQwvGies
         fOBP0A0U/3lPTIT6QE3vLDIPTNodZDPGVtRPtz5Gvuu2y0Swb8i/3txH4WAwqh63DM/7
         zxhq+N9cxV2igFZcDGQq66vsckWSAtivzIvEiEsKQ/qoC3j6e7lD9Y3yj1+0LHo7ybSJ
         pMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kgwg6ZY+UwlSzzQ1IYs4ifU8gB4nY+Z3oaeaPRk66as=;
        fh=61UbtXigHOsmh5BM/ysIRaR19+VVNMiHYRxGYtbMnzI=;
        b=G1wNiVTKWR+deu7A8TApezGRTG7y3Tga9QxEzpmL7/Dx6yxx4qT0ygkEb0kib31nHp
         ulLPJVmKZzoacs3et8EygFoQJE7WDPV2nE+NGkSHvOIXIl/fStBdH9BBjtc/4Yk3iQlw
         wO2tdM5uyt3iII+dT84mhkAt/whbJOikgfZHyzXgr1jmr9GB3PIdoNko1tYOhFT/Dmny
         2IwiTh9my7g6MCD9B0sYcOmEXj+Nf/k8G1UiKifGI8Vxcuy4QZoXyZpoLcxLVSq0r/oJ
         r0sxBnRtBpFwezhZU/1K1uBnG02XGCj4+aqmmV7OVXBl5O7Oczp5Ah8fjaOyVYlJ5UYr
         OCYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771951330; x=1772556130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kgwg6ZY+UwlSzzQ1IYs4ifU8gB4nY+Z3oaeaPRk66as=;
        b=ga2i+hAk6LMY1v8koWH55XO2reuAdvuR9IeV1EAWFRzu80wZb1/XCsxOnIStwa40hw
         MYzC+sFdDr3TlHDdQyJRwGodNvqDlw+JhRItPfujU1SkgSifgxBL+Y5cxqvaLkh6IdNF
         X49GZn8Ig+nQmCNMrj/wrn06+b9JTzSBG5LCoJkoUTRBH3VI/au9qQ5t1WoQ+HUeYog1
         ErwRP8ZHLERokM7X8Gd5/u+pDVeOY1tV7pOwm5w28a14dURzLazMNNKG0UQ6QqhwD7Uj
         Xvt8N1ir22gJby+jdoaRcZ5ln4+ydHDXcyfM8ZiDANzg16OnQemIZH7pWqu6DQ/OJezf
         Rq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771951330; x=1772556130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kgwg6ZY+UwlSzzQ1IYs4ifU8gB4nY+Z3oaeaPRk66as=;
        b=w/ng9ZzDyWyD8kVdOFbtARxZBOqYL5kDgvvvXoSDAHmULNQ0PU8//E6BsCgfy4iSc+
         dh86KRTPOe+Aaugb0yESZHX6RD+pCcVDvxulrzTSUDuWruEDnMd6ni8wet+c8SwEbp8b
         EXAy5zXYduVVg5Cf71K17DJ8H10wgvnyUcYnUTSEIUzT0mwlv3UVjmTH10aA2/j5k+cn
         cTOQJ/cICOmuT1hRKY2aIZZRGuquoR9FaL6bSp5djWuhM0+ZdVZRpBHk9mtvjSSrpaaN
         btGOU3JQGzmRui7ZodmR/2wrces2b6hIFf75SFY5urXmY1KbCz9rpSXn7dYnLqqRuZj3
         5k+A==
X-Forwarded-Encrypted: i=1; AJvYcCUdVbWuj1xKjLPcePUf4fAvl0T0/uadOnMvjamBY2sJ7L4ECpudhcrLg6THowrfzkckKkeysvjPoRfjjniuPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxysDq9RM+xms1pMzBz69nEichk+C38ejWYAVxIZAzkMQ/5yCIn
	WtaK6Yw/DfLV3gZ1G3Kgv6ebxEUtdnHIbjIlPskiq7LE0F46DTg6ASP4zK7g2nlluIVhtXQO0BY
	iPGOCnSCFoY4NwHMOY6hKQCeCIcpNvhhx5t9IJV1W
X-Gm-Gg: AZuq6aIiHJb5D/p3NHgrabFXCJU7Ct3HcKainwyU2NK/ALyzXkb8oK8ylIWv+uwWWBB
	k3/qFHt9+ZNOhD6m7+nP5ZZGZ0p46jmsoehRvbhdexuDVV7dkJDvpFPiIOtZeYMhoIdsA9c5d/l
	MKGRyq1zv3AUfBkiAt7EjbdSCSDi7Z9zOr7i24fSgXXXiq0vpbHqDvocROm9dbSTnos8cilbvm0
	Rz94VxEBd2TR7eT1/pxafwYdLAHKdVEkDKWU2lvoDczE9yBV5XYzrXVB5KyKPKquzHShcIBMdOy
	kFNQY7SuIcS4QTLZeFoATNNOKRNozVZlUQId
X-Received: by 2002:a05:7022:1e10:b0:119:e55a:8087 with SMTP id
 a92af1059eb24-12779ca1e66mr162200c88.4.1771951329849; Tue, 24 Feb 2026
 08:42:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218154800.367720-1-9erthalion6@gmail.com>
In-Reply-To: <20260218154800.367720-1-9erthalion6@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 24 Feb 2026 08:41:57 -0800
X-Gm-Features: AaiRm51usgiRE1d1KtF1udatehmVlkbDM9zzDjPMxJJwgnnXlY4zfmGsIkXNl18
Message-ID: <CAP-5=fXLNybYv08dDfAqAsDBzbOPzQY4EZQvdY0WZsfrMu9Yyg@mail.gmail.com>
Subject: Re: [PATCH v4] tools build: Fix rust cross compilation
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Levi Zim <i@kxxt.dev>, 
	Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 7:48=E2=80=AFAM Dmitrii Dolgov <9erthalion6@gmail.c=
om> wrote:
>
> Currently no target is specified to compile rust code when needed, which
> breaks cross compilation. E.g. for arm64:
>
>       LD      /tmp/build/tests/workloads/perf-test-in.o
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(cod=
e_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in g=
eneric ELF (EM: 62)
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(cod=
e_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in g=
eneric ELF (EM: 62)
>     [...repeated...]
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(cod=
e_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in g=
eneric ELF (EM: 62)
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(cod=
e_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in g=
eneric ELF (EM: 62)
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a: er=
ror adding symbols: file in wrong format
>     make[5]: *** [/perf/tools/build/Makefile.build:162: /tmp/build/tests/=
workloads/perf-test-in.o] Error 1
>     make[4]: *** [/perf/tools/build/Makefile.build:156: workloads] Error =
2
>     make[3]: *** [/perf/tools/build/Makefile.build:156: tests] Error 2
>     make[2]: *** [Makefile.perf:785: /tmp/build/perf-test-in.o] Error 2
>     make[2]: *** Waiting for unfinished jobs....
>     make[1]: *** [Makefile.perf:289: sub-make] Error 2
>     make: *** [Makefile:76: all] Error 2
>
> Detect required target and pass it via rust_flags to the compiler.
>
> Note that CROSS_COMPILE might be different from what rust compiler
> expects, since it may omit the target vendor value, e.g.
> "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
> explicitly map supported CROSS_COMPILE values to corresponding Rust
> versions, as suggested by Miguel Ojeda.
>
> Tested using arm64 cross-compilation example from [1].
>
> Fixes: 2e05bb52a12 ("perf test workload: Add code_with_type test workload=
")
> Link: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/=
 [1]
> Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
> ---
> Changes in v4
> - Fixed incorrect target name for riscv
>
> Changes in v3
> - Improved commit message, add an example of the compilation failure
>
> Changes in v2:
> - Map supported CROSS_COMPILE values to corresponding Rust targets
>
>
>  tools/build/Build.include  |  9 +++++++++
>  tools/perf/Makefile.config | 14 ++++++++++++++
>  tools/perf/Makefile.perf   |  2 +-
>  3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/tools/build/Build.include b/tools/build/Build.include
> index e45b2eb0d24..cd0baa7a168 100644
> --- a/tools/build/Build.include
> +++ b/tools/build/Build.include
> @@ -98,6 +98,15 @@ c_flags_2 =3D $(filter-out $(CFLAGS_REMOVE_$(basetarge=
t).o), $(c_flags_1))
>  c_flags   =3D $(filter-out $(CFLAGS_REMOVE_$(obj)), $(c_flags_2))
>  cxx_flags =3D -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=
=3D\#s" $(CXXFLAGS_$(basetarget).o) $(CXXFLAGS_$(obj))
>
> +###
> +# Rust flags to be used on rule definition, includes:
> +# - global $(RUST_FLAGS)
> +# - per target Rust flags
> +# - per object Rust flags
> +rust_flags_1 =3D $(RUST_FLAGS) $(RUST_FLAGS_$(basetarget).o) $(RUST_FLAG=
S_$(obj))
> +rust_flags_2 =3D $(filter-out $(RUST_FLAGS_REMOVE_$(basetarget).o), $(ru=
st_flags_1))
> +rust_flags   =3D $(filter-out $(RUST_FLAGS_REMOVE_$(obj)), $(rust_flags_=
2))
> +
>  ###
>  ## HOSTCC C flags
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index a8dc72cfe48..214d8f6d9b8 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -1163,6 +1163,20 @@ ifndef NO_RUST
>      CFLAGS +=3D -DHAVE_RUST_SUPPORT
>      $(call detected,CONFIG_RUST_SUPPORT)
>    endif
> +
> +  ifneq ($(CROSS_COMPILE),)
> +    RUST_TARGET_FLAGS_arm      :=3D arm-unknown-linux-gnueabi
> +    RUST_TARGET_FLAGS_arm64    :=3D aarch64-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_m68k     :=3D m68k-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_mips     :=3D mipsel-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_powerpc  :=3D powerpc64le-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_riscv    :=3D riscv64gc-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_s390     :=3D s390x-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_x86      :=3D x86_64-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_x86_64   :=3D x86_64-unknown-linux-gnu
> +
> +    RUST_FLAGS +=3D --target=3D$(RUST_TARGET_FLAGS_$(ARCH))

I'm wondering about lesser tested platforms like loongarch, csky,
xtensa but I don't know how to concoct a triple for these. I wonder if
there should be a test for a missing string like:

  ifeq($(RUST_TARGET_FLAGS_$(ARCH)),)
    $(error Unknown rust cross compilation architecture $(ARCH))
  endif

other than this:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> +  endif
>  endif
>
>  # Among the variables below, these:
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 11b63bafdb2..f7b936deeaa 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -274,7 +274,7 @@ ifeq ($(PYLINT),1)
>    PYLINT :=3D $(shell which pylint 2> /dev/null)
>  endif
>
> -export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS V BISON FLEX=
 AWK
> +export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS RUST_FLAGS V=
 BISON FLEX AWK
>  export HOSTCC HOSTLD HOSTAR HOSTCFLAGS SHELLCHECK MYPY PYLINT
>
>  include $(srctree)/tools/build/Makefile.include
>
> base-commit: dbf0108347bdb5d4ccef8910555b16c1f1a505f8
> --
> 2.52.0
>
