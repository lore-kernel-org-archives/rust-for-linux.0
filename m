Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994361;
	b=1477L5LeFsgrRJA5D4UOtor567SwEr62ReEk4P7itIxsBTSqxPD6/g0acXMWqjxb6M7c
	 z15i5KfaFfnCwUeic0Hrq10oCiXQELEz8DTqbOZwJOtVdIjrg9o2xp09elzDFk4ExCQSf
	 XCRP27hrPr5U2ex3jtATd4eoK3MUCWOgl4UmZktYq81dCDDODF/DoCzGhYINm62ajiMVD
	 bsk7QsfT/M7ep3vwfqkwF4o3fo7Tt1iMTR/X1emSuyaVLxjfYxHHLor0P99c9ZdEjK97x
	 w/tHJndw8cGKWT7JIxbgsUAdLXXWjZO521t+CqQvFjrWCA77q0dgeXsiOa+uwZ08hew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
	b=ewhuVN5iSmBMeKLyvcsBH5YqJRuNIBQOqUiaiNbViEI+ddVwZaDge12YEEX2GCOyD9ks
	 6vWQnwYioe9e0Rc/93KRpJzmEsgsDveq6J0UGu3qVA6w7Jh1VqoSqx67bkSAxWRwQr54c
	 Ocwp5HCwb/PplilrAhhEj9M3yHbtpgU7n2GHRrz2psKk0EZ3FqrwYfvCjeM9uPHOU5ZFL
	 BNJTvHtero5GW3CHMyGefzSbgUE6L3ewFC7MdzO1yRxlubGWMCb+/2vbDT6/AnR2gJ0ov
	 nkQJInX+M52Va4slR5Lys1RkSxF4wCkIFJcm+Ci2JmeNn7KWkaOTpXgAGi8Ou6yAlVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0lSW8LL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DCF606A32D
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 19:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DCF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b0lSW8LL
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso441a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 11:46:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994359; cv=none;
        d=google.com; s=arc-20260327;
        b=QCsj6atwL4FXc+ufBw1BBuwuHQRnJdpwoUqD+P+M7xyUPMA3lq29IbMIaK/WrACQk5
         fNH7sjpVrHAQBUPnZzrPYzLSiTpgNIpSrj3mwDaMmlutAZG8fUAIvIM+lMbqdsqx2AfZ
         YLp4P3n+w0C0KOEmWAHNXKgOoUj1JycnnF2PhUyqzaMoKwabizy2wVzlgbkMUYcgBQhb
         EaAwYhYbK480TwMxrvcyfV1Qdp8Xfkh0QvCTdwPKAeQQNr43o8DRyjUl0S6XsXeR7jem
         svG9r7RhDxLp0nUa9NLG4GrpPlPGd5VKMudsL2z6SwUTFUnJPl5tQyb9NGEGZwloWzR+
         YBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        fh=PaIYozWoUMwX0P9YCtS1wvh4ybi3Dw0yFpeUa0nIj4E=;
        b=O/bMIQyr1mZ7zy6/JFWmLThpqhgD1EPKJ4xxgG8HmF3u2FvFweoQsi0AaeXHIRcmpy
         E27EXNv3oVmThTuCwmQukpMmt0TT2N91tslBw/u2YxIyzSSI+bhfyN0S5KjVSbN1Mxw5
         IChArQmPDuhu2Bh0GlarIhp9eXX4sKza5qGJOAHV1u1Fcel8y9zoTi1mIFOqOcx4vgO0
         HLN9D7JXwgMc2feGc3m2QRLZGt2dk38wWyQv1hIstrp5PNMgvF2gHezIyqvGDPNBJcKK
         Sszu10BLvthvJ8E71P4Prx1V+M6kpA0dIVGlavH3k2CoC70Dh0jb7uCVMNq64uuQyl5s
         5qqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793994359; x=1794599159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        b=b0lSW8LLban7Eer3WywvdFdQTbSrylW92pzpB1SznsBnaZEiz/E/mE1Ip9NJMfFT2l
         XjywJ0NDQ5ygvJ7ZXsfY2bkMJK18bVrY4MR6mWtzjuUiGOQauJxr54tkPLPipTCreCgn
         7+E7Wfev4B/SHsI6VGpf4Zfl0AjwC5Cg+74fNxZM1rk1oN8hIWWGUB/S7fy2mGS1l5uS
         moqnrQ2FWyXKqMHLqVC6QSNNKbcbqN+GP4/Syip1H9nFT4/PzdLxC80+nzHB69HS9dSZ
         eVxcLRFY+ZeyjSnuCy2tC2UHhrZ4xUKkftFfI+QiM118IjMWFAceDTjo5rzdOJAsyjCQ
         iPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994359; x=1794599159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MtW6cUlF0xWQVNMRbFIZNlbptYiDw1CO/QxWvZcoGes=;
        b=xuJpwte1TfOj6RMLUI4YLSfYBcX4rhJO1Bu3BY7ysZ4Z0R1JyQ7bbIYM5YVJXpDHe1
         EEoHPSLdgbmtNSPwOirz07JfY7Gipauasc/XOwRFI9t8po1Kgbx5WrBFz6TN8T1hVNfA
         3XaK8eWtvQ5UnVN0Ujy342nEXT9B9PVpq5cskFCA3mdWAv1wjMxA4ScC2/0wTbeCQeGx
         nhe6g8Hy/HYrtQ9bgseBDxQl9/iX4xKqJHBK82ZQV+MGwJQSie9w7fFC5zCvudFPp+Hw
         0qwCvEvkqK8/iGpFp9HaIqrjIpAJL+7qGTA37QOxKPoP62/GDEAvNiy+3Ii2CbFovhx7
         A4EQ==
X-Forwarded-Encrypted: i=1; AL+hErFdmdumgoiV2hAmwOAKviMdYaXTZmJUjFTPxMHApO6QwWOA/6Nbu37jkrHEvwiRf0PlAeDI3/Cgjgqr9hEB2w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8CO91ZmlaqKY1VOgI/ZiF4C9MB7hPq1l3RtmIVbU65qyt7cE7A
	b/8wzYUQj4c2e5w1BjDv56qqLv+7nUzNRxTMNX33CAHDidw+JCS394uanGoFWFVpXUCzpLyZuOs
	59sGf6UCxppHztlEo+Ly8OpD5uftEBVZhV1LcdUzZ
X-Gm-Gg: AYBFou1V7KmSQjyoIwT2FifE9wzAXWfeEmnYxJxyjNfWi3x6jLbT22/80Nz+1v3R18/
	iN573lrafenzbYCrlu9cjs/MAkYl2Ty8Aph6veKJ/AGEVPy14ACFj5d8e43b1JNcOGW6MiAWTML
	S6HC8VjejyYf67Cp/Ou1ajb4oCI3r2getoPgpGruPODwcU1obQCJ/Q7RhBDoUh9ks5IDIJWS2A8
	b0EKlWIaVHaK4iJrD/ID/g80XaI1To8+7kOec6EUohv+4QTr8NkIYoxTJJZIOB4tzcde0K5qw4A
	0BWB5aYyiBkupwrXLPU5WsZCgwTI8lA84nMNK9Jcqbf+JEkKJJA2kXdGMR5QgG7P/ujKQaiigEb
	fM15f6lPLndR+nuQD40ckmfcMzJQ7aA5Qf0s1fZpfK4rDEA9hGrLzkJHl9OtjI6wK3skC
X-Received: by 2002:a05:6402:424c:10b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b6fad61dcfmr562a12.5.1793994358649; Fri, 06 Nov 2026 11:45:58
 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 11:45:45 -0800
X-Gm-Features: AclHuK-y7Snn7fa_RHpKW_RqOSo_pYKXo3yMIDsQSg8EuPiGD_nqwOFftAAYja4
Message-ID: <CAF1bQ=SFw4GR3_HagE6k08ipFebgmxqE8UDJGmOQq9u3-0ZOnw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Yabin Cui <yabinc@google.com>, 
	Han Wang <nesthanwang@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Snehasish Kumar <snehasishk@google.com>, stable@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Look good to me.

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Fri, Nov 6, 2026 at 11:44=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Nov 6, 2026 at 11:38=E2=80=AFAM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > automatically passes -mllvm -sample-profile-use-profi whenever
> > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > inference algorithm (Profi) by default.
> >
> > However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> > flow-sensitive discriminators (FS-AFDO), and Profi has known issues wit=
h
> > FS-AFDO that degrade runtime performance compared to LLVM's original
> > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > solver (applyFlowInference) can hit pathological compile times (30+
> > minutes or hangs) on certain kernel control-flow graphs when profiles
> > drift slightly or when combined with GCOV [3].
> >
> > Pass -fno-sample-profile-use-profi to disable Profi and restore the
> > original profile propagation behavior that kernel AutoFDO was tested
> > with. Guard the flag with clang-min-version 210000 since it was
> > introduced in Clang 21 alongside the default change, whereas
> > CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> > used to probe for the flag because cc-option invokes Clang with -Werror
> > but without -fprofile-sample-use, causing Clang to fail the probe with
> > -Werror,-Wunused-command-line-argument.
> >
> > Although SampleProfileUseProfi currently defaults to false in the LLVM
> > backend and is only enabled by the Clang driver, explicitly pass
> > -Cllvm-args=3D-sample-profile-use-profi=3Dfalse in RUSTFLAGS_AUTOFDO_CL=
ANG
> > and --mllvm=3D-sample-profile-use-profi=3Dfalse in KBUILD_LDFLAGS as we=
ll so
> > that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
> > defaults change in the future. Unlike the Clang driver flag
> > -fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
> > -sample-profile-use-profi option was introduced in LLVM 14, which
> > predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no versio=
n
> > checks are needed for the Rust or linker flags.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> > Suggested-by: Rong Xu <xur@google.com>
> > Reviewed-by: Rong Xu <xur@google.com>
> > Reviewed-by: Snehasish Kumar <snehasishk@google.com>
> > Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48=
ef25522aa17c2a71003 [1]
> > Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMA=
oWh-dqLHii3Nig@mail.gmail.com [2]
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Maybe we can credit a few folks with reported by tags, to encourage to
> report issues upstream more in the future?
>
> Reported-by: Han Wang <nesthanwang@google.com>
> Reported-by: Yabin Cui <yabinc@google.com>
>
> > ---
> > v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b=
65fea2e1bafce6370@changeid
> >
> > Changes in v2:
> > - Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAG=
S
> >   as well (Rong Xu, Nick Desaulniers)
> >
> >  scripts/Makefile.autofdo | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> > index 57a3aba6ffc2..55fda66ad960 100644
> > --- a/scripts/Makefile.autofdo
> > +++ b/scripts/Makefile.autofdo
> > @@ -13,13 +13,16 @@ endif
> >  ifdef CLANG_AUTOFDO_PROFILE
> >    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PRO=
FILE) -ffunction-sections
> >    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> > +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno=
-sample-profile-use-profi)
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_=
PROFILE) -Zfunction-sections=3Dy
> >    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> > +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-sample-profile-use-profi=
=3Dfalse
> >  endif
> >
> >  ifdef CONFIG_LTO_CLANG_THIN
> >    ifdef CLANG_AUTOFDO_PROFILE
> >      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE=
)
> > +    KBUILD_LDFLAGS +=3D --mllvm=3D-sample-profile-use-profi=3Dfalse
> >    endif
> >    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllv=
m=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
> >    KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitti=
ng=3Dall,-plugin-opt=3D-split-machine-functions)
> > --
> > 2.56.0.455.g6c5a503b38-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
