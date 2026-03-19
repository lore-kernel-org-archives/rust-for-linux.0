Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221223EDABA
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938052; cv=pass; b=fXB0VKPHY5jCN2Vjv5HGyfSbZQd7t9OKd99pFbYErJa3D1Ri881IBlTQhHsI/B1dtZ5T/zncjBnupv1fR5br87BvoXphIq3XcRLPt/KFG459DzfblsxCpXC7rmfpl3UHETtwYMY0qojroJi7KTl8wHRBIiO2mzd/jM3JHwQtbHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938052; c=relaxed/simple;
	bh=G4AinYb6gHY1qhJMnjZ72OjGwE4OFYuFz82X0vYoG74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFc0fO7f7fpiiHaazqiCzi0unYyjrize85/4czZKySxL9N14uqVmSOtEmylPS1LMGMhAwSpWqVio5/01bl5wKMy3CW0w2JMwLjYZKFT/4T8SlD8uBKgmhVMMaSRN2NMFCT/Wv+tfgeEU95cia4NQwWd02ANJ3rcGy1kKNFoTpZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qfb/BU9X; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qfb/BU9X"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so1141991f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 09:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773938046; cv=none;
        d=google.com; s=arc-20240605;
        b=X3aUqpWkI/evgqJlUFkuZX0U8EQEHYLV56mBBI9/diFXDHBUh+4Q3TkmQcMyqxw01k
         L4OHA7Z8BI5EmXeqOoVWZUYvy6PNtGoUez5OdI6ZcXjZt0GDihMyTxr7kPzydQkIgiQl
         U2okNs31rC5ukXhc0RgxOq31qZjJELm6l0GRw29yvrqbToYwCajrE21G09nUEpSL/SMm
         yU6w1dVB3w6c8lScoO+4c7Mp2G9TGdRV0AKFFNpeXnR/7VZxawTN5UOz1pv6hK5qzQjC
         rZr/TrwYVShJ78cTEFAI/p4vpfZ7AWeSqz+eGM+OYebBHQx5TQ2CnwITKaZMPQvamwLP
         a2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDPj+nvQil9tbingL6d7Y1//0Z2Ud77+LgwX9GEIeUY=;
        fh=ZY/LV4aqjCYtxNwxLIbk4j2wcjxAhf/TU5YZTBH4xpU=;
        b=Wqqbts1NXmUblzpkkqJkyFMmKhnfuyJY+9Ou0xxDzHeSH7DGkHL3XsCNKPxbbReB+f
         2WrL+IeVMBXUElY5FpvkNo/yXei5rddKv69SwqoLmH9LiGBOuAFE7S3mHXvbFn7usk7h
         Rp+dOtsNccJ1wI3AKuojDzzyCbCKgU4tcmWqC9+aV1Tf2s0IFHi6ZHrzcwNDgkB9lP3D
         hUBCFdJkiRqmBR2sLAz0/6a60lfIhIW2JPHarjUcOCSpQ6wMPR0ZMkwukRCMc4oJDDWu
         p48QJVxke92AmMbq53TX2bx65VZ1vZSul5+17CR+gM0DuYCdJGoSBkrAl9Q3GsYKJCB5
         A4Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773938046; x=1774542846; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDPj+nvQil9tbingL6d7Y1//0Z2Ud77+LgwX9GEIeUY=;
        b=Qfb/BU9X7l1GeSRqSpfv070/nNw58kU4YLeu6jrLyfq6bdvkhAD7vp2bNDLLK7WQ+c
         nVPn7sO2/kgO+3BtNqSj+xWpB/cQKT2CDQP87E+n+uav43qbQBf5f8oFC1yav2MMrQmV
         FhEIIpZi9YoBHFIIxhvIlBw8KqxU5QaHwypQjE068WRU6GxpMhrFzMhV287crCec588C
         q4axoBWGlKXHJnJPkYJBTqicl5CvxZZHQWZaMhHig5u76GaMKdbUlA+yzWWh97hdKoiI
         Os/ELux+MOF2xaPR6wH4wlM8SDqbnlR9i9qOISDmpp17T6v0yOecFOLynb9kEHzl+P28
         dS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938046; x=1774542846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GDPj+nvQil9tbingL6d7Y1//0Z2Ud77+LgwX9GEIeUY=;
        b=eKu2+pLHKpko7zg2zg69R+oEtwp4LdWMR4fpwHD6NpNufu0oSKjw20PlbCCK2RCM/U
         y7uCa0U+DtAuhtiwklUxNlZIgQjSU4KyPXhnK+RGfIcyHMD2tRDstmjMIrBCdxQm56GI
         rtaF7F7L/fD6VZ3UgTre0ysfYqQo4KoqmPNAXhBFtAdKJuhVCKoG8ogsmSzkGASvlIVr
         +eqZtOuDxW61GS9LH/gINfWWalqTT8qSu464aPwLv42YBoEPHairzzlgteCZZ8o4EQD8
         MjTMlQaRDwyvur3lb7T33kINQtddmPqkV1uXE/GIMHNnOPHUD6Cy1VoZ15MH6dFYH9XR
         bNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+VlseGAFy4E07GLGF7iaKml9oeSfX+meTsY71DIM6EqaWevbwzfU6BwXeoBC1FX+7kIgDITJcU36xz9qzcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEKb9XkfMU5JWY9tpOSCmU4eYoU+/hvQP349MXkcKvPy3UeyZS
	Duq53BghFky6z+mMF1cbBYziKInKbj+KLUFmG2siMol+pYIeZyVFfBtL5alDxpWIwXhoiim76a6
	mxYATIUPl8HBGGu+6/m18vseNFV5NJZgRxO1KaWLk
X-Gm-Gg: ATEYQzw1mNXJrWlqhi7xM4ULPHSDeBs410UwXyraflCkGQkx0MHZ1L5U4jzp4AyEwYm
	NVHyL+x8sUT0IQL3L9pU9Szh6mQfHSjib3RBfw1DrXWevXjuVSsZIc1zRLvmp0Pof6VGonFBSWL
	FMIP39Ni+/C4rKtMm/PzH7hZTe6b2vfuwzeqNSifZXRQq//SkOpq9/bn1vK1eq2Z16XjfNlzJIk
	AOFRddTRFZdD0p2rvQEHQ8o2c9qHdlb5d45DSRm3rOMpgMRzLDIJaiImvnpaRoaIBfaAeV6C67f
	qk8XJPFom1i/DKkmlr98JQ2i2kaXaUQ1YldOaQ==
X-Received: by 2002:a05:6000:2c10:b0:43b:498f:b039 with SMTP id
 ffacd0b85a97d-43b527a463fmr14121260f8f.9.1773938045711; Thu, 19 Mar 2026
 09:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net>
In-Reply-To: <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Mar 2026 17:33:53 +0100
X-Gm-Features: AaiRm52igaWHP0PtJKMIDt1AO6b8_WSVHZzCwNzgTVsmtygwlr-ZUME6FVw1c6s
Message-ID: <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
To: Gary Guo <gary@garyguo.net>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
> > On Thu, Mar 19, 2026 at 12:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wr=
ote:
> >>
> >> On Thu Mar 19, 2026 at 11:22 AM GMT, Alice Ryhl wrote:
> >> > This patch enables AutoFDO build support for Rust code within the Li=
nux
> >> > kernel. This allows Rust code to be profiled and optimized based on =
the
> >> > profile.
> >> >
> >> > This was verified by inspecting the object files and confirming that
> >> > they look correct. It was also verified in conjuction with my helper=
s
> >> > inlining series, and it also appears to have worked correctly when
> >> > combined with that series once one missing thing [1] was fixed in th=
e
> >> > helpers inlining series.
> >> >
> >> > Link: https://lore.kernel.org/all/aasPsbMEsX6iGUl8@google.com/ [1]
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> > ---
> >> >  scripts/Makefile.autofdo | 6 +++++-
> >> >  scripts/Makefile.lib     | 3 +++
> >> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> >> > index 1caf2457e585..3f08acab4549 100644
> >> > --- a/scripts/Makefile.autofdo
> >> > +++ b/scripts/Makefile.autofdo
> >> > @@ -3,14 +3,18 @@
> >> >  # Enable available and selected Clang AutoFDO features.
> >> >
> >> >  CFLAGS_AUTOFDO_CLANG :=3D -fdebug-info-for-profiling -mllvm -enable=
-fs-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue
> >> > +RUSTFLAGS_AUTOFDO_CLANG :=3D -Zdebug-info-for-profiling -Cllvm-args=
=3D-enable-fs-discriminator=3Dtrue -Cllvm-args=3D-improved-fs-discriminator=
=3Dtrue
> >>
> >> I get that it's currently named as AUTOFDO_CLANG, but this really ough=
t to be
> >> AUTOFDO_LLVM...
> >>
> >> The flag translations look correct to me.
> >
> > Do you think it's worth having Rust not match the CFLAGS here?
> >
>
> I think the C flags should probably be renamed AUTOFDO_LLVM too. After ca=
ll, all
> the perf tools involved here are called llvm-foobar as well.

But isn't it just called this because the config option is
CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to that
particular config option. It may make sense to rename
CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
this change, in my opinion.

Alice
