Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036350;
	b=tg70+56ofFDBHGr4PFeo/J6swFUnVSKaBhyYJ/29cH9DSdnVrR5gUa/IiuqfasHUU75F
	 fZxyPi5qXmvrsyM7c4MRxxLqNRsVcHV0oTeoFb/4i02jD13+rT9S+AaISKMrlOGeYPBI7
	 6SZc0ftbboYKZIpDyTDuNaX1vMRIJ3hKOdIfBI8R0lLZVcVE1/dFbtWqEJzqji0Aq+in5
	 H0nInjJSiBYX0q0vXJmvDAxqZ+o2IwgpUMbm9h9Y8JQBspYGcW3ijrz1Zlyrekqpsd88W
	 2PZ5s+X7mdINEeA+EnN02ZTI9fXaJxbvBXcUCCzSz0ItC1VQ3N8RJ5ypEU0AaHPR4ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
	b=BW/7D0q37YJK2m/aVpPtZJhuaLSs4uGos2Odlf+8wtl8Cxhq10/z5a7WBZQ4qAloGFc0
	 8sTAb7TibFTo/2AdKCxT8ZQbbaLT6T3EzX4vL7N4cn4h5O6pVrblZJO1WVjqLYMeFk7aF
	 MnOqjow+UiWyCC74oxCUNWNT68SHmYPhT04zWBtgRMBiKzFl4FFO+71kGC1UA17GsvFih
	 yuSyKaFpgfyzTvw/ni/VXlsVvzeZgAFawdHxNUdkBUlHMkahrT+5dSlz6glqvwqVFx/PV
	 Ih34n5fUgWsdqZlxbL3sPOSFosQ9Kv5OKNOI22kl88XT8tPUeZBjuovbcEDb9YVC+9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dmlfi5TX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58403606A33A
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 21:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58403606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dmlfi5TX
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11942545e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 13:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036348; cv=none;
        d=google.com; s=arc-20260327;
        b=Q/gV/Jz/HW5wvFKNkiX0EFM6dOYgvYcLu8WLOaP8Ulw3Egovz45fibkR/VWAmzpoOT
         VliU59hC9rMgS6bom3qLbUJqbcXEtQyDyYUAognl+vh8LLu+dzk6MgDbl3mZa1l7KoId
         D59tmSab2PR8FCagq1JdCb/5FBpRU4Xn3yU54kifdBN6iXG7FvhtsudYUSKuMh1SOZb4
         dhXUFkpcH68m1S6+dsyBexHUmqAUsmyoGIhTI0Ah0rszP+eX98gw+Dy48MQSMLnG1SLW
         AZvJASEo/neT6TCpnI7ALlaenMappAbFsH8JMhMQqFsIXHj4HoulkyPvaeh78MlAP7fI
         Ok1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        fh=x9SchXs/uc9g7tyBuBDzlC9S6IrKZ7OrQ4Xyn6minBQ=;
        b=Gy6rKcdEHZIybsety8ynx6HV+UmXdyo8azmeHVllo+Xco89oFWsXkLS1dlPGEVZcSR
         6DpZhhcXX6t4L85jePWKHFcgQdRAE7v9bqD8XUxo2AQMp+gX55IM7qvQjlGde2UEy8SJ
         zl+yVlwtm20Z1BpAo64rXz2jTNIwqiAEzU1vpqckBVGLWL2rEXytcz8hsuw9E573MZPN
         PN2neVmNUaEIxJogJlyB5nOXl95hUQSet74LEk0/54lIelTubTfSwANFCkP4ql3VadIh
         hX5o2Cm/kA52qzJnzuJXa8VCZiYrYUcwcSrlqfQHJ3CmebZRCXg2di8QKaRoZXJRumBd
         Y21Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795036348; x=1795641148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        b=Dmlfi5TXCpgDfmBFbH12jFEe+eCqYa9u6tv4aC1RqtyZ/ewYF1YnHznurBJhjQI/DQ
         u/dcKvXcZeaJqWBCeOn7NVywvmG42klldHAPVRQFasYnZXYwdzbYpEhTu6F8vm03+Ta4
         SxNefPrMhaJ8G3t+vmrdMY42SH5aPl3kgAzRl9bPNzKhx+qwkjBv6piDBvcFUyEdbGLW
         deLwCvXb5Y+o7OEwFLA/O1yyR95FRCCyxncKkMnMxivGphWF+NZRspdK5GnRPdB5zrT6
         GDBJ7tmEVuQ8DA/aMMdu622h11nPCWWWgOKjTKEZtGPSw+0PORvcGF2feFgXpu8WHpec
         IH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036348; x=1795641148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyuJEUSnhfZBYucVp4eRtPGdLz1TIibG6v1tSdR3rQU=;
        b=Q15YoQg9NMDVM6L/w+7CXSoUKuNxg1VV151JrD9besqhK5wsQGJ0ZzvZR9CpOWZvIR
         zDXpMfpj3PW9EE/VB5TchUm72SbS2hXhhXjrFlMM94k0i/95dcb6SAFq9nwfpcdz+oba
         1smaMO+goKztRRN5w8g+g2+v0/0KEFHuD0nObjLdX54QBkDSK18HYuLwQ/OxUeDm7BQG
         i2wDbvBl5S/3fM/C6JHcAK2u0EzuMrLjNFF5J1MOgYBjNea+LA1CP9WM76rbwe1EMQ6y
         rK6LLwOgd6YJ2VdokYd2on0qDvx68LFdrnI5tiFrt+FKLm8NnivcBHMbsXFr9U1LaKuv
         rAPw==
X-Forwarded-Encrypted: i=1; AL+hErFhK90RBQXwS7cHlne8arDQb0AINB6z+vAABNlkld4RWhW/NHdVzngTdtelGizICfDvva78/lurIrerXWPKcw==@vger.kernel.org
X-Gm-Message-State: APuU4Z929frZNuYOunTStX6poEyqpPR3WgpUAtd0nadVftAlqYcQMu7P
	TX+SVj12DvsNV804ejBLm2gh/r7Qjas7GQo15CCTTlISkkmwJxxOdp82dCL3bmaTMEMHeeO3RxI
	0+9JfoCIYbJlRv4jVT2PmiYPmBHZH5U2XHZ83qzla
X-Gm-Gg: AYBFou2NOm4XblyBJ3o4jOCXkeTm/uiX4JCh4+/1jYKgkoo3vLl5a+NfhCQbQ2LSSpf
	fVj9uFrZ3teER5nPygF05JLxZJhG9bvWGGaKLD/DnoXNkp8Kq4SMuSPwJObST1mfmpXYx6ulxEI
	+oKyKNmii0UkV37+4oBbqB7i5SfAiqnsPbUVbI9+5Zo/LUX3tlxM+DR397vr90ftlasVwKdVhPa
	R0Z+Ps+1FJqCR63XSzQ/eNRiExOp7OVJWbytiof7NezPWwr0Wz6dNNexRDkNsdCR87OZeR2Z4ie
	gtMk4TYdJYOEKUsfKLn0VDppXM5rNGomLuCDsneLThNu37D0IfiSwbXd5KgVNv4rdqk8LY9WNc3
	bmpswraQKxFUk3yeI7Fxi0kJm8BWI8EYNCiweaEaHxdtTOSuU/8XPrigZJR7dzVLj4WMN6Qh3HZ
	oA4jZNanDPlwvM2wS73wrSpY81OY16oQ1bNoY2mozvofvQNZ7NaUcbiMbxUatXSGelFJcRyDC7r
	mfqmSz+kvdiRmb/dlFNF9k8RKok+v/uxcWjSQ==
X-Received: by 2002:a05:600c:c8f:b0:4bb:69b2:d3b3 with SMTP id
 5b1f17b1804b1-4bb7da3f50amr85274465e9.27.1795036347018; Wed, 18 Nov 2026
 13:12:27 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-rust-merge-functions-v1-1-fe86126522b9@google.com>
 <CAKwvOd=iOXmF9DS8iopFZEgsqORe6eHokpF_-3-jEfD7yPuDFA@mail.gmail.com> <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
In-Reply-To: <CAH5fLgidhnPbP=xXQ3162w6q0U6rWHPZ9Mu6-E5va4_CXyanOg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 18 Nov 2026 13:12:15 -0800
X-Gm-Features: Aa3M54rwqBnTNo9s7KzOH39H6ui7-iQszvNlrDcPs70i2RE6J983km-iNd7m9tM
Message-ID: <CAKwvOdkNWp4us-zNPw8Pp3J6TVev3nTRsjPrjd9w9M66w2Qbzg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: disable function merging unconditionally
To: Alice Ryhl <aliceryhl@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:11=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Wed, Nov 18, 2026 at 7:48=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Nov 18, 2026 at 5:09=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Function merging causes various different issues:
> > >
> > > * For CONFIG_CFI there's an LLVM bug causing functions with different
> > >   CFI hashes to get merged. This can lead to crashes at runtime.
> >
> > Do you have a link to a bug filed against llvm?
>
> https://github.com/llvm/llvm-project/issues/217629
>
> > > * For gendwarfksyms it causes functions with different CRCs to get
> > >   merged. This leads to broken MODVERSIONS information if the functio=
n
> > >   changes in the future so that it can no longer be merged.
> > > * Wrong backtraces when a crash occurs in a merged function.
> > > * Possibly also issues with pahole/BTF as the merged function's debug
> > >   info is lost.
> > >
> > > These issues are new to Rust because in clang, function merging is of=
f
> > > by default, so these things have never come up before. Because of thi=
s,
> >
> > I've never heard of function merging (in clang). I've heard of
> > -Wl,--icf=3D{none,safe,all), a linker flag.  Is rustc setting that by
> > default, implicitly?
> > https://github.com/ClangBuiltLinux/linux/issues/1598
>
> No, this isn't linker ICF. rustc doesn't pass --icf, and in any case
> kbuild invokes rustc with --emit=3Dobj and does the final link itself, so
> rustc's linker arguments never come into play.
>
> What I'm referring to is LLVM's MergeFunctions IR pass
> (llvm/lib/Transforms/IPO/MergeFunctions.cpp). It runs as part of the
> optimization pipeline, within a single codegen unit, before any object
> file is emitted. Clang only enables it with the cc1-only flag
> -fmerge-functions, which the kernel never passes, so C code in the
> kernel never sees it.

Thanks, consider amending these relevant links and details into your
commit message.

>
> rustc, however, enables it by default whenever optimizing for speed or
> size (opt-level 2, 3, s or z), which covers both kernel configurations.
> It uses the "aliases" mode: when two functions have identical bodies,
> one is deleted and its symbol becomes a GlobalAlias to the other. You
> can turn it off with -Zmerge-functions=3Ddisabled.
>
> Alice



--=20
Thanks,
~Nick Desaulniers
