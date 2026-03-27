Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86583E7173
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609526; cv=pass; b=qCTHVfiKHUYd2WRlBqx5rd6XUWNFBkC0yWFAiUXfd33yYC0yLXyhXw6dkvzVL5NsgG+ZowGns3q2Hahm+Iu7pe7ZmZioWw6+FIxx8l4cs4zCvliC76+J+rxQbsMhjd8ywxeyW+B656W12S7lpR2WNz+oeSyma/PYYNOohoYA3r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609526; c=relaxed/simple;
	bh=h9siRtKXpLMyFHd/Yu512FTxbLNqK390CG0g8l6RsiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZA9yXF9BuDCNGtFKvV1ANbum1zdP2eXyh8hf6RnubDypAEytVd2zBFHigWhRNpm9eMN/yaa2/eK3lo1KZ3UBSWlq9MMYxpkIzwajml1CKlmzNrNskq9koh0Q2ZE6QTh4lzCFP2+7460uDUe/LpHKZIkACa8AGk40Gk/b2ovjduQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gygmyt9g; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gygmyt9g"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b871dd06eso1147041f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 04:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774609512; cv=none;
        d=google.com; s=arc-20240605;
        b=YStW1TCNIMTMNsfWfpo+omogqU0O/p/cEg7ATBJNHiTHZXJB1YStNNkCAntmYZdbzN
         hL8XeLTrs4SSozKXjhrcT21VmR+qbVE3k2kfgHuGoVxbThVBW2BcIE4LzRtKv6vG1zC3
         eBcetmwdQVnXgsDF7QqTz+eq2SQiAb8dE6GSEUVRyFfefYlK9lvjtDgky7O7N2R7wCnG
         xzzU+/31Uq85Na74bCsAeTNhnHtBylSol46WqRbWq7uyk0JxZe2iEX4MX2t95J/PS2J0
         4l6uklWd+vEeJxuWirJxKOT2/+CRwv/JxaL4tGX+pQ+XO40ODPWWWWl9xT9lL4NSVzVD
         Ev1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e5TaIiGMBg7uV6k3VlsV1iyi5Emois20mtQaHQh3Xm8=;
        fh=m1/QYeO/JNU2upsfDivgcZrGqFK4rRw8RaCKx+cGrwI=;
        b=c58yiJ5Seokw5PHLDhPLfSu+EarnJZ65XA8aJ59cwZY3zLR+FG+dSQ09SlWVLUhSYQ
         ahiXdBPxv5Mn+e4/lqJmiNP9HjbNfvuGRgPd3n70dXLCHGXhbVHuqk3u5m6txj8EAB4W
         twL8735L16BrvYWvzb3TRi/MeZ2cp61nba2+Ih+a7XGBDuSgfrE/00DaG8kmhXxlOzt2
         glBBsngJVRHA1oEocvXt9o3qPJap/m8T+ldMvz2Cx1avQk88YDbvazYa8s1k53OXzrAo
         peQ1mItbiTMNfvd4rnyPTd38uUxrKCQUO5t8ayM1H5IKfbtWu2RE+hLs4lvvDim95fqS
         TTIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774609512; x=1775214312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5TaIiGMBg7uV6k3VlsV1iyi5Emois20mtQaHQh3Xm8=;
        b=Gygmyt9gwZJ9pcE6D2gekcjsNn+UvAPXJ25Al1dYJRen7ZCi3lzEY3mZ3bhKfPDWbn
         JpWyDB69TmIbwsrE8FbVs4Ywb8p6RxzwMhIOporF78hgAyu3RrZJ+ci04SKkqO/NMiO3
         ckO/wL24uI7+TRYZ6wVwucGp71lHdbIIAHg+TnZ0R4WdR3IIiZubHl8Q9DVhWtocOY7/
         DWk938dbNTCyjTB4uZPGbgG6Y7RY/W4hJIhP8Ad1ISj98U3+CFgXAx4MzJAYlcPLW320
         Mhqy5O17S5Fv4r4EhXQDZiEXaEfb0UX1m+t5q/fX66/T5Tf/bWfOgbRcbf2NyFNyJYbo
         97+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774609512; x=1775214312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5TaIiGMBg7uV6k3VlsV1iyi5Emois20mtQaHQh3Xm8=;
        b=FZViukwVnEc6g2kcTzaLmiY6xf7M0KLqirtmiXDTwioeT7PBehbDCRdqdyb2AWxNQi
         ADEBp4WGwPzlfzJ7mY3wMDjHqAifxncBhrErDwmrknABLqOjDRx5Gh68EAOxfa13a1Qc
         aIsRd3lhzFe0nVFpgsjQ+WpA/l0EB1Yd0SZedoZuhHd4nscMnjAHZyTqsJQXGEBUjABt
         g1mqMr1Q9cERf+p2XwWALwPIvvqQrxJPXiajX/1kXgsnMrXZa8djGmdJmkPGkR+yBaQs
         MfX9P28AlFdv+gNiVu4Yxv95+LknuldsvFbB+sZCc+jFG53kCiy0wkoQMHwAqimza2xw
         /Ehg==
X-Forwarded-Encrypted: i=1; AJvYcCUbfkNZAMcfoBdFUw6/S1iDvACTroShtCWcoRqx2B7nubkxNVG1KjQvofpyXJ7KXkufD/CLZ4aYwNItEsmtcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6JBHbf8tNd62fw4KHFovlNlfe+MmK2AyP5k3Ar1qIp/mpyo/R
	B4N08ZZBguxdsEoEyq6TJOA6yeGKWuNRm6u+j7n6QqN19O7qWDx8UJgjoXAj2kMvQQe0xr7F5Gb
	zbe2hHU9j7QMvIaZ0vmq5U02PQ8XuM6KKMVq469SX
X-Gm-Gg: ATEYQzwh2PjHrkCQ4s2pGNv6larpWgQ9FnkEn5eJLZWIRZye+sYi63jWfToIonmFGOo
	8tdQUYa/GJf3pgc8pF2UJcysHKyg1jBxZmgIyL6pMX6Jem527glcnAEa2dQEI0qDOwN8sA4EqPA
	p5yrMhwKU9IcwAG3Ug1Gykuw0MwPsUIIeujuB9hR2RUewz70MN3VsJh+aR/0WMs2FGzi4bE8Oh9
	/G/0cS8hydKe5zJigGRC56YF0wSMAOXj940SWdv/fCnBPGZ+NDFjo3/BS1RrzQI4eknEZM7pPs/
	PtDd5yxzWF9mdFuo8XhdC37NXRkqV/csbKhlItYGUbFTsvWFl9z3FCIE3D43crrAyUlDug==
X-Received: by 2002:a05:6000:144d:b0:43b:94d0:4d8 with SMTP id
 ffacd0b85a97d-43b9ea4af78mr3268991f8f.34.1774609511461; Fri, 27 Mar 2026
 04:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
 <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com>
 <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org> <acPLYM0HtGfW1Q6X@google.com>
 <DHBX4GM8TBIY.1BPXJPVQAQAKH@kernel.org> <DHBXOLR9OYWZ.22XQBZB3NROCF@garyguo.net>
In-Reply-To: <DHBXOLR9OYWZ.22XQBZB3NROCF@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Mar 2026 12:04:58 +0100
X-Gm-Features: AQROBzCcXzCaxciGj2rRaqYN4eotQgnG0hZ2O8Zhq9gJgC-_bbelUFgakozcZJE
Message-ID: <CAH5fLgj+pDm_VzNGWZ2Js9EVmH2xahP9V3bj9KXqnnARiVzHZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 3:30=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Wed Mar 25, 2026 at 2:04 PM GMT, Danilo Krummrich wrote:
> > On Wed Mar 25, 2026 at 12:47 PM CET, Alice Ryhl wrote:
> >> On Wed, Mar 25, 2026 at 12:06:50PM +0100, Danilo Krummrich wrote:
> >>> On Wed Mar 25, 2026 at 10:26 AM CET, Alice Ryhl wrote:
> >>> > We do not pass -fsanitize-recover to clang, so for consistency we s=
hould
> >>> > not pass -Zsanitizer-recover to rustc. Thus, remove these flags.
> >>>
> >>> Isn't this because clang forces it regardless? Is this true for rustc=
 as well?
> >>
> >> I forgot to mention this in commit, but I'm actually a bit confused
> >> about the situation here. If clang forces it somehow, how?
> >
> > I previously had a very brief look at the source code and came across t=
his [1],
> > where
> >
> >       static const SanitizerMask AlwaysRecoverable =3D SanitizerKind::K=
ernelAddress |
> >                                                      SanitizerKind::Ker=
nelHWAddress |
> >                                                      SanitizerKind::KCF=
I;
> >
> > But again, I only had a very brief look and it might well be that I got=
 this
> > wrong.
> >
> > [1] https://github.com/llvm/llvm-project/blob/main/clang/lib/Driver/San=
itizerArgs.cpp#L750
> >
> >> I don't think rustc does anything like that, but not sure. If it doesn=
't, but
> >> clang does, then maybe rustc should too? Depends on how that happens.
>
> It looks like there's no similar logic, and Rustc is passing recoverable
> settings based on the command line options:
>
> https://github.com/rust-lang/rust/blob/8a703520e80d87d4423c01f9d4fbc9e5f6=
533a02/compiler/rustc_codegen_llvm/src/back/write.rs#L644

Based on
https://lore.kernel.org/all/202603271853.RhfDTdOp-lkp@intel.com/
it seems like you all are right. There is a rustc/clang difference here.

Alice
