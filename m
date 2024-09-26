Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9FE16A397
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727375853; cv=none; b=c4DuJwYbMFH80d6aVlHJ5EyJG7ab7XZ55eC4d1Z1kt2+Ir8PBUBTVlYBQIsU9RhsjSrAKAQEjFBfw0d/N3S0nJeSu6oTbrYlJkXHSPK0zdMVal40WmwqDv8j6Z2h4/4KbqULIGcZl1nsRx3FMTjAEpWbM2npWMBh0+zVGJDDOc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727375853; c=relaxed/simple;
	bh=qge/ypv3jnq9WkpUdpRE7x8QIIC6GXWB3609FUVVm8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gy4+ztnbxbVrT5YcP4AosfQiR3AAA6JxcQs+CrEqNq/uhiiG/MKOAKwFgp+uneemhiVHjkonpt419iU1hdBVP60uQgJ6Rv+eu4RAJdbchH8NlLh0uiMLBfeVavpAy+MpT3srTDCNauhX19XSX1F7lhV6FwxYyqCe6kSmdEoUlrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DK/5vjrI; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DK/5vjrI"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4582a5b495cso46191cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727375851; x=1727980651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
        b=DK/5vjrINJRnrkXe3JMVA2ku6szcsEliriK+KN8cQY3FpVMsbmkmycPY56xGBQItSL
         ibQ8Z4uWK2pii2zWS0HA9AvCc3tUU6f55c8CJsAUyr2P+V24XWfOk5qxTuNr8gTdVeAG
         x5iBsYiAvvRILVTxnokzS5OItpWcLnvsXYagWT4afcqtVcjguOGRzwv9xWM9TpJQtw/g
         R7GAGqOMJ0L1BhaNT8Zd6JCryyMjnjiurgWIZ3DNj5Ou4wRTBxpWcVhZct60XRUdUHUd
         snIJaR8UJpEE6aNpdTRZQytK0yRCi+AlJrLfGWVwDi/JdZMdmluvcKTnmRWBDcGpDn6P
         c6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727375851; x=1727980651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
        b=j36jMssIBdn2Xa1l4C2ZoBDYavDRdpWt4zjMgodhyORFKkdlgiuK0uAAzqfjZIn1Q/
         FVf3F8B+6wCzN4RMRXp5h/AFa1pXfpfgAV1FNpDCJyksUaVODlQpkKd9k+sHur1d/Lwm
         wv40TKs063v4jWu2XPUGnUsEyrtt5qood5eFxgAgDG7eZEgu4K4ZZM8nhItlIo7HifyM
         hdqTisjxbzUxZ1o8eYv+5e1EBaFqsE4Tup7WZH9djXre8UfZrCiLGi7VGAh3grICPgWT
         sf3Nn5X7ibNJKInziQSZFxMfujCdTVUrlumxmG3pnOu11owhARVNQhqg3Ql3G/+NxoLo
         ULZA==
X-Forwarded-Encrypted: i=1; AJvYcCUmETvpxEuwO08YU2fqZ+N9lOgeAY5GScDV6iuEfYZO18GBacms3tygiANo1cEWVeC+ic3fftFTBdTK16wptA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCbUPj0nefe01vXAvRnpcI2jwqvKP89HwKQgv0Js9S45USRAy
	Iwr+cKJlhyJUTCInlG+ga+5Y4caxVEmF/i2Gbp0xHG1oDh8IiEhAkH11UaPR6MhZ3NeyL5eadcE
	sjPRWmVtR9ilsXx7+XVDwYW3p7XLuDaQ+u2Ov
X-Google-Smtp-Source: AGHT+IE5luy5UBQ185BJWoPqDDM1TnLd4PCqV2DLnc+LIC9QgkGZbzUPxUEZLm0+v/dLWn/IHMzUNmnXBY+ab/kjVpA=
X-Received: by 2002:ac8:4904:0:b0:456:7d9f:2af8 with SMTP id
 d75a77b69052e-45ca03bd89bmr245591cf.7.1727375850392; Thu, 26 Sep 2024
 11:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-15-mmaurer@google.com>
 <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
In-Reply-To: <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 26 Sep 2024 11:36:51 -0700
Message-ID: <CABCJKudyC_EzRTtkJSSQqQhLdUk_9tYBtoq62tjmghFyi8omWg@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Matthew Maurer <mmaurer@google.com>, masahiroy@kernel.org, ndesaulniers@google.com, 
	ojeda@kernel.org, gary@garyguo.net, mcgrof@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 5:22=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 26/09/2024 =C3=A0 01:38, Matthew Maurer a =C3=A9crit :
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduc=
e
> > the munging for the new format. Other architectures do not appear to
> > have architecture-specific usage of this information.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >   arch/powerpc/kernel/module_64.c | 23 ++++++++-
> >   kernel/module/internal.h        | 11 ++++
> >   kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++--=
-
> >   kernel/module/version.c         | 45 ++++++++++++++++
> >   4 files changed, 161 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/modu=
le_64.c
> > index e9bab599d0c2..4e7b156dd8b2 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -355,6 +355,23 @@ static void dedotify_versions(struct modversion_in=
fo *vers,
> >               }
> >   }
> >
> > +static void dedotify_ext_version_names(char *str_seq, unsigned long si=
ze)
> > +{
> > +     unsigned long out =3D 0;
> > +     unsigned long in;
> > +     char last =3D '\0';
> > +
> > +     for (in =3D 0; in < size; in++) {
> > +             /* Skip one leading dot */
> > +             if (last =3D=3D '\0' && str_seq[in] =3D=3D '.')
> > +                     in++;
> > +             last =3D str_seq[in];
> > +             str_seq[out++] =3D last;
> > +     }
>
> Why do you need a loop here ?
>
> Can't you just do something like:
>
>         if (str_seq[0] =3D=3D '.')
>                 memmove(str_seq, str_seq + 1, size);

I initially had the same thought, but it's because this is is a
sequence of multiple null-terminated strings, and we need to dedotify
all of them, not just the first one. Here's an example:

https://godbolt.org/z/avMGnd48M

> > +     /* Zero the trailing portion of the names table for robustness */
> > +     memset(&str_seq[out], 0, size - out);
>
> This seems unneeded.

Strictly speaking it shouldn't be needed, but I think it's still good
hygiene to not leave another null-terminated fragment at the end.

Sami
