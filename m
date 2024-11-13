Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B152E1494DD
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Nov 2024 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520134; cv=none; b=W+7WE/b7IwviZkNFrNU8+rcRVFyHe8fsxAorLQ9Qw1H10nOoWlvDOdlDlgf8lnsufhLaAhqgicW9Q6Bo3AfdEUjhGTPZmMw7qCovkogvlZz0fRJA/7WQH4sPamWw7UJVYQOc4NospiZiAwPVd3Wp84HTDnH44IQheNAg88Nkegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520134; c=relaxed/simple;
	bh=2vvecHebovoeGzhdxA64vP0FIVcZsrzn6/S2UuTdzUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEMWnNsZV6gB76EgqqMzlwxS+IBsV/3YyP76q1qFgDVGkbHiI5tDQTAYHk0zw8Bk+Q49gRbleYzdBNxCxxO3xAiPTqwnWxs1DXvchXhaCXQyPrMHfVP2Mk9DyZm8v/byu1lw8ilzlJCvivRWbNR1PjjOneppqfndvG3E0DI4MFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q5agB2me; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q5agB2me"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c932b47552so9050a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Nov 2024 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731520131; x=1732124931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut09l0p4ejZD65rK22Do5DdJADgIGvLTdDvLpb35Lpg=;
        b=q5agB2mexx2fJ5p1z3Xx8YR2q/Zt3BQwdxy3HYl87xBtWPT1NCrsUcJwV6KeCrgi82
         WmYboHZe532UOtuz5eBh3dBn7+H62L9QIzWHI4ugSiHfSY/Cp4JfVBTEzpMdo6VBc0OJ
         nokiwrPS/IYH2YvLIe2RLaINnfd9xlryIEZi4OEEEHZOmmHIvrGY+4gIlj9vS49nQHdO
         7RrXs/TA3AeBBd9p0iNXut3YiDw6reUo5V41UaqgTPgnm0YPZoWox3Zm7N2USLs9B42M
         fZgUNn0qA1J0AgtmWtf9UD/hhLfAqbq2jTNX6NFMzM2LgmE3au5sZc16sLkg6VXvJ9KW
         uG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520131; x=1732124931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut09l0p4ejZD65rK22Do5DdJADgIGvLTdDvLpb35Lpg=;
        b=UHZguDdezMcaIb9YAhJV+acMNVLtDKL+46wJjB3hOWtAMphNX/lGuspWGxIS8Fa5O8
         qSVd+GW4oNthFMgJRah/v2nqfCp2TKEKgglwxB6xzpzr8lBIFjUC2DNtUMSZNbAThQWz
         kEgeW9WHlINL+gllXPHAOOBDOwUdZvBwjfknIf4s1fcrx9RHf7C1dzujuDb1hxzcdGZ3
         AjTnzfdZVzxXpaUCdwdSjToPUb9G8jxJJNtM1mAeVuxW/1E/UY0hfAt8tsQOtPsMQuZj
         HScvPhP+Jalb8SQSs2jPJlhX3NQfzBj4lkKjKvqc1f/jRuMVX0HhH/wZbIh0EvVA6gmw
         F2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCW3a8BqvZS5Gj7GGkYC0HH5zw6LN3uL9IV1DDcE5JCBoRQtMNGNuLl+aKjFz8Krr6wgrzDFA34RRPIfgrEqKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9fBeFNbnA5tDec0Mlc0LpEFqJf5BY1FDzVwne1xdLo8ktgtrQ
	U8MqU3hVNWO78TFvyQBHZKuSr2HsKHTbhoRtLMUYBbY5ZUy/T4GMpqGoK15mYkt12RZJcvCQnTt
	yIbqTB801JaEmo7H/RfICDcjfrQMjWhuN4fm4
X-Gm-Gg: ASbGncuVRpyGtMgzeYFv/0WGovAOCViTQL0O+IfASUJgNvX6Zd37oTw3I1NixrXGOsf
	maQA0mFcgDyHLbzSEmHJSU4bebu7h
X-Google-Smtp-Source: AGHT+IF+3cQN9o21cQiIysZAB4NJwFjVHmftEWZ1JWnUJZdbBdxTB+kUQux093XqXmTqkJPQ2rghtkSNf6aJlDPPoDk=
X-Received: by 2002:a05:6402:886:b0:5cf:7145:be96 with SMTP id
 4fb4d7f45d1cf-5cf7145bfa8mr145258a12.2.1731520130908; Wed, 13 Nov 2024
 09:48:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-39-samitolvanen@google.com> <CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com>
In-Reply-To: <CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 13 Nov 2024 09:48:13 -0800
Message-ID: <CABCJKudWUBE2ZboktcBEykBReor4T1Cf8dfRCWJYEryoT81OEQ@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] kbuild: Add gendwarfksyms as an alternative to genksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Mon, Nov 11, 2024 at 8:09=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> >  # These mirror gensymtypes_c and co above, keep them in synch.
> > -cmd_gensymtypes_S =3D                                                 =
        \
> > -   { echo "\#include <linux/kernel.h>" ;                              =
      \
> > -     echo "\#include <asm/asm-prototypes.h>" ;                        =
      \
> > -     $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);=
/p' ; } | \
> > -    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
> > +getasmexports =3D                                                     =
           \
> > +   { echo "\#include <linux/kernel.h>" ;                              =
 \
> > +     echo "\#include <linux/string.h>" ;                              =
 \
> > +     echo "\#include <asm/asm-prototypes.h>" ;                        =
 \
> > +     $(call getexportsymbols,$(2:.symtypes=3D.o),EXPORT_SYMBOL(\1);) ;=
 }
> > +
> > +ifdef CONFIG_GENDWARFKSYMS
> > +cmd_gensymtypes_S =3D                                                 =
   \
> > +       $(getasmexports) |                                             =
 \
> > +       $(CC) $(c_flags) -c -o $(2:.symtypes=3D.gendwarfksyms.o) -xc -;=
   \
> > +       $(call getexportsymbols,$(2:.symtypes=3D.o),\1) |              =
   \
> > +       $(gendwarfksyms) $(2:.symtypes=3D.gendwarfksyms.o)
>
>
> I do not want to see crazy suffix replacements like this.

Yeah, I agree. It does get a bit ugly.

> I decided to delete this.
> https://lore.kernel.org/linux-kbuild/20241111171753.2917697-2-masahiroy@k=
ernel.org/T/#u

Cool, thanks! I'll rebase v6 on top of your patch.

Sami
