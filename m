Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793994273;
	b=kH02KtiWdwnWOPTr5oNx/hk8r0+P+QqSIZhgH+ize/UCMs0UL10je5GPa4hY5cpi0/+K
	 NZBb221tNo0nwdZ+KbU+URqEkVefd6HlzS9+XUqWzHrwEuKO99BuQxcj/FrIeXDRZzTOW
	 37qEooil0+0x1rZgCT6CcrFDwczrT1qpgWbfme8x8Lq4rW5eCoFLisO086Po0pTNrQGrR
	 Ur//w9zaNrdzvYakXDRmAcQs983eT8NLzdG92n/4kwCzxfmMtXAky3fjPqEPHo9xzcNEL
	 ILZm/qNJDk3E6+KMz/u5Etb26kL2A9YKXKpcAfeJkUHwFrS0mp44Ns+1CREnjb4CQBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
	b=LAjAyV48uvIyo2zFShMfXGpnyDNekTGRNjnzAdZp4sD//wwFrwSno2PccUkv3SsaESOJ
	 SQzb/ebXpccFGTRpgSugMvt4E/cC+6h1Q6+cUN7OTMe8lHuTkpL08y0Go09IcGlTzd59F
	 mwKI37X5tcij28muJz7612ZC26cP7Wq0OkfQ5nT6E5WAuoXoObbSRK8AbsddqAYALjw3h
	 lyY1UUT+F5Uv0xQSlBsBk0BUsPpaLW+Rq80Y8Imn8SyV7hEZ6/Y029Aelg1WlAXUOvyhN
	 /W/TqohJDiJB0Wn2COqlN3SmXW2rocYXszi8a/Wkt9by+XdnwCiFquzorAcgg7bvqSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gvGiICTn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8B606A32D
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 19:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF8B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gvGiICTn
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49134c8509fso905677f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 11:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793994271; cv=none;
        d=google.com; s=arc-20260327;
        b=fsm5Rj/Eb/JujjvHqS4HoMA7xKpxU7Y81Dv3Hr5q2gVnbVPUuLnFpmAWEqDWiCnKK9
         Y4HzQXQTvWl7dhJM5TA49ekrpHpsA6b03aewvembJhEEpy1ZmFllXJge0dcehwXNDmMc
         wSFoUntEakez4F2LoepC0RwVv5Py8u1fciJpvnQXQndN6r6PnYWUUi/nx29Q7+egHOET
         2HglmiHz7Y7pDJ8pm1WbTI/c/dr3ZeCTQJQtpxhpF3vWIp42pFM6JpZsJCHJ8Gc/oNtp
         NogZOhJsTAuqtHXlGPimdBSPljR7zA+UaBXiFwgwJLsWbJOi6z6FEsn1TPyJW93syeYY
         MVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        fh=DSMXSlyrRKemzH+0NHscl2vMip6YQZ5QH861DO2wOpY=;
        b=nDX3Xe4Lhvw+95EpRgdv+/aNyN+XR7FypIP9FGmzh+NpyicILu5sC1tEp46pOPxMfX
         SxSbKlwupzaKwf3lgm8Y8/loY3VPqGEvBMeoqfOr3qI5VfJ6BrcqMDIzFEFCyfWuio9U
         VuwJygRH+U/WF3JYvlHG2tFnrZt7FSTNSgLmRjtp+b1pEwzdl8iipnET4ci2jKKQ2zhi
         fR+1wmycfKqICFhJ4Ozbk4+CTe1EjRXt7hijTGHv3BOrEzwnS2r5djtEUXrtWjp6R6AQ
         ktqvzkfaNoHpHEf13Sf1N3iUw6nU6v4tKIzv6rSFThDobbL8NAU2Tycx55ZTGCGUQSCy
         2MPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793994271; x=1794599071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        b=gvGiICTnzCxuHUkMAvPjSTuWZIiFk8Swusu09/AmeTF8ZvFuXrcJhRLIcY+x3exYoW
         F8yUkxYY+efm/EEK1BYsyPJ8L9glXj9FOSUpKm6oIgqo96gg2B/tprxf7Zo+1nuwhQPJ
         6ijZt289CT0AhkP1KSZvtHAyYuLOHjwMjMzs8+ueD8xOqWSBMa5UKbQa8iANDPRMBhpP
         wKRy68tVmylxxmXKurkJkSeJUoYdTEE+gS5K04l3rvighmiI1bQyPSntaJhmORJBJysp
         +4rchM83WXR83dhu4E6bcHxEb4rCuQE23qiFaf6WcTXAmLpRJAsHpZkRzfGuHtlYZw8K
         6MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994271; x=1794599071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dA/SScrLhx0g1iQzWQT3zXqR6x/uBQevrzuD0FNFdOY=;
        b=SS/gc2xCfH7gVk9Y9gpTHaYuxZzs5EENSqkIt+G66Fn3++dtdm5ndWYpgf2RdrXxIk
         yXIl5UrnI9nT2cFUSUkLX00F6yhQhycJRr+9QvYCNmqr/Jmi/Y9jmVZTC3t3CE8ObB4N
         d8MY39Nd2dsp5NbUYALzNKT1KPPP6w7SqXf9c8P+Ss18UMYO8lDMBKHqkO05ETc9vNdx
         zeNTWctw9pna759K9VTBJXtxaW5ao15ocefutGSj+lFzOaUz0s8SEiYcYu9PKocbZzNa
         5v5v+1CdCBc0PzTD6gtiEb9U2+ndUqB/reDL7X85AV/HeSFlq1NwBD7ptRP9VoVGwzS6
         ABZA==
X-Forwarded-Encrypted: i=1; AL+hErFZlWJTmDWgRqKNvAznnYMt1B/6p5Wy/j2Xxrmhiz1E43TJyZ8yw47mch1wMT5SSFrejkj8aifnpLrzRTb2cg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/9Yd1+oLg7evs9XK1tnuK+r7k/HcClixVxsi5sxT2tUBir9s8o
	1y32s0OKdarDVHSIoCby1noOvCeN0B7KDlV3MIAWbsbEfdqAG/mdop1sM7gNAXMVxG6LEzDW1KD
	7l4Xd3f1k3aBLhzJLyw3+G5HU7p1wjFQlOq5xJy62
X-Gm-Gg: AYBFou1k+WGZ4Vzr8Zb6JcIVPnoH0jfGOshLwUm6VRNgKNMWDlB5TgWR2GMrIoPcsUQ
	gsG9aEcTFydP5OutRNCm35zMxTuPZiJoW6vAdtHx6eNXo3whiwnRCXmSRFSEpL5Bz2dCUQmJ6Gs
	dTVNX3h1EZolgUeyzJvl9Tr9VnZvDjF2sZTsBbtPHGGup3F3y0ICbchvO/NX8DePVYu86AcL6lL
	ULYDAGY/r4OYZPQzOd/v8tYm/S4ax8xp9bg7Oo+9yaV1+SOvxc25pC5d65uxOsJ/YPDMb8liM48
	cJHUfMbsrAby3R++qkpGQ5pO9ssn5IFSlkEnpSRH1e3cWZkVX0BALwl+SB7WSLQx3d3w2Bh5x0f
	kUnbnK2YAiNa/9AueDkU3p59a7HsaTAK9EWuJcsJuTjHI/5urHzLu739zWt5X3H96k72PAKSvqk
	7dhce8ilCTPe606BoyuBSCO6boO1nRmpZP+0C6WNsNm58HsTavlm7IoJ8hQgEOS0Q9fZZZVC7Ms
	VANwSm+tIXbjztabE+tvVicgLdL8bnycRva2Q==
X-Received: by 2002:a05:6000:18a6:b0:492:8dd4:baf8 with SMTP id
 ffacd0b85a97d-4928dd4bbe5mr7282358f8f.6.1793994270567; Fri, 06 Nov 2026
 11:44:30 -0800 (PST)
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
In-Reply-To: <20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Nov 2026 11:44:18 -0800
X-Gm-Features: AclHuK9lc1j_hydZKjHRaIqC6GPhtItrfzxvxTIux1kraqJqkaT_i4EQKE6q_vU
Message-ID: <CAKwvOdnnonRfRPPv8cJU5-n_N4JpJLsVixyTYOtmgMjWyz2LDQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
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

On Fri, Nov 6, 2026 at 11:38=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> automatically passes -mllvm -sample-profile-use-profi whenever
> -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> inference algorithm (Profi) by default.
>
> However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
> FS-AFDO that degrade runtime performance compared to LLVM's original
> profile propagation algorithm. In addition, Profi's min-cost max-flow
> solver (applyFlowInference) can hit pathological compile times (30+
> minutes or hangs) on certain kernel control-flow graphs when profiles
> drift slightly or when combined with GCOV [3].
>
> Pass -fno-sample-profile-use-profi to disable Profi and restore the
> original profile propagation behavior that kernel AutoFDO was tested
> with. Guard the flag with clang-min-version 210000 since it was
> introduced in Clang 21 alongside the default change, whereas
> CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> used to probe for the flag because cc-option invokes Clang with -Werror
> but without -fprofile-sample-use, causing Clang to fail the probe with
> -Werror,-Wunused-command-line-argument.
>
> Although SampleProfileUseProfi currently defaults to false in the LLVM
> backend and is only enabled by the Clang driver, explicitly pass
> -Cllvm-args=3D-sample-profile-use-profi=3Dfalse in RUSTFLAGS_AUTOFDO_CLAN=
G
> and --mllvm=3D-sample-profile-use-profi=3Dfalse in KBUILD_LDFLAGS as well=
 so
> that C, Rust, and ThinLTO flags remain consistent even if rustc or LLVM
> defaults change in the future. Unlike the Clang driver flag
> -fno-sample-profile-use-profi (added in Clang 21), the underlying LLVM
> -sample-profile-use-profi option was introduced in LLVM 14, which
> predates the LLVM 17+ requirement of CONFIG_AUTOFDO_CLANG, so no version
> checks are needed for the Rust or linker flags.
>
> Cc: stable@vger.kernel.org
> Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> Suggested-by: Rong Xu <xur@google.com>
> Reviewed-by: Rong Xu <xur@google.com>
> Reviewed-by: Snehasish Kumar <snehasishk@google.com>
> Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef=
25522aa17c2a71003 [1]
> Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMAoW=
h-dqLHii3Nig@mail.gmail.com [2]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Maybe we can credit a few folks with reported by tags, to encourage to
report issues upstream more in the future?

Reported-by: Han Wang <nesthanwang@google.com>
Reported-by: Yabin Cui <yabinc@google.com>

> ---
> v1: https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65=
fea2e1bafce6370@changeid
>
> Changes in v2:
> - Explicitly disable Profi in RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS
>   as well (Rong Xu, Nick Desaulniers)
>
>  scripts/Makefile.autofdo | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..55fda66ad960 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,13 +13,16 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno-s=
ample-profile-use-profi)
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PR=
OFILE) -Zfunction-sections=3Dy
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
> +  RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-sample-profile-use-profi=
=3Dfalse
>  endif
>
>  ifdef CONFIG_LTO_CLANG_THIN
>    ifdef CLANG_AUTOFDO_PROFILE
>      KBUILD_LDFLAGS +=3D --lto-sample-profile=3D$(CLANG_AUTOFDO_PROFILE)
> +    KBUILD_LDFLAGS +=3D --mllvm=3D-sample-profile-use-profi=3Dfalse
>    endif
>    KBUILD_LDFLAGS +=3D --mllvm=3D-enable-fs-discriminator=3Dtrue --mllvm=
=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto
>    KBUILD_LDFLAGS +=3D $(call ld-option,-plugin-opt=3D-function-splitting=
=3Dall,-plugin-opt=3D-split-machine-functions)
> --
> 2.56.0.455.g6c5a503b38-goog
>


--
Thanks,
~Nick Desaulniers
