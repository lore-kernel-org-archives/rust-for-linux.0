Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F11F1A08AD
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 18:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724784512; cv=none; b=u8hj0AExem6U1PUSJReP8t5Uv//plHkZfCpOzzCmGwhSL/uxl5N0uIZtsCq+SI9nYNzrQILb3jkhDa17GSdxcyIOeej/YMKCvvNXP/XGZpggBImh/pxoUlBcLR5Xpa5XguTUjq5/l2v1M3EFT1wdGXRjPJcXs2z5VoQqU2UKP7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724784512; c=relaxed/simple;
	bh=I5//Ha3NSD2Wtl/0jjx0iRpYd7vI5TxmgjMPfRVQ1/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6D5jKZkBB3mdvewEof9y5HAHeljbDqYcYKAK8NcSXoB4VqzFDA8LgGVWYSDDjt7/Wk6Ksz4RvoG5CHBExmIbzndIl3d9lAoWaibR1xgu/p7SleIjlQj5TtX6JOruZk78mFb/maKtZAl60M5ONjD4H9ndwnvHHM3j933ymQHVwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4eGRhfl3; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4eGRhfl3"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-45029af1408so39141cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 11:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724784510; x=1725389310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LidQY3N7TAVU7mz++A4EWJV/Qlk2ObRsexeEqCJH/sQ=;
        b=4eGRhfl3kXUoAYV1Enr6mzC5351bzICnr6nhNH48IsRwaHVU6z0s5mLq9fPrOcJH8x
         XHvrX8i4u70ltCZhnNQVWkQWZbJ8OE4ye70pZwN5v7GnrptJCtO0qNmrDQI1pnzMGlXg
         T6aLawl8+TaQPwcQ1YagRxdQ25I2Qo671YZLLrBTwSvscdTk6aHmFH0WIkdfFl9aj8Md
         tjImVw834O50hhLLMltKfGrs603HfCFL770DDl3BVSrEfxZK+88hb8ix86u09xJ2F6m4
         BLPqVXfNF0UHtMjF8LkmHNtrktVfPF7JdZ9k7VM/j2T4JtEl+KlH3xDdCeb3V7zoAdh6
         KRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724784510; x=1725389310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LidQY3N7TAVU7mz++A4EWJV/Qlk2ObRsexeEqCJH/sQ=;
        b=FdEadwXWr0Eugsv8XDV/TWSqYiSdHj0Lo0gMHRgJirpM6PagdQ/un4TJkSOE/2plLn
         e+7HKl11ZkopKsvRGftAkqu6FT/HW0L+t+8+kCKdOXYmOmoA6QLRCdQIubzj4GtRQMu1
         jvesgl+N/dKBL7rpgnvRQrWzypnTWdvtH+Fm9gBARKRKPaK4WWBZImtd+ajFl92PsDQU
         aImbxnQ6ULEk+dHClpyRiWZTMvG1ZUEO+v+tUtx9CA0jFP/PKnPl4WClT4rCSJEsWIgM
         gaaTtqqaiGqrBMX83XIgGcgmC3zO/sYmb1dqdL4/GLAnl7x7SDTQaO2X1FlyL7FWUoDF
         RQog==
X-Forwarded-Encrypted: i=1; AJvYcCW/zGGds/KfGuRxHo6WmgnIMsyZHnU32NgkodcDml/7gqn6fmZ28fHwR8kGfeBBqb/3DO+0YBzio+oZs3QtpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSR1WU9hgksQPE+y1yTPBhTEqXZw+aXUciFiKZrH/WMC/+bAsp
	mzoPFcsnaDyzVg5c8ySj1SZ1blz8wLhV98dif4yGG8ye+FRK4s+cuXJBM2Bbq3iS+MpkkbxmnG/
	R37ZrthIFS9QbEDI3P9eWhxQnllvVqkayE0td
X-Google-Smtp-Source: AGHT+IEYo3wpUDQ07W+N/9n1FFu7R6YCMxlFn855GpjF2BmicavhNUlzTFwLoKagN05qtS/bFGVksEONLKfLBTPt0T8=
X-Received: by 2002:ac8:5a45:0:b0:453:5b18:817 with SMTP id
 d75a77b69052e-4566caed6c1mr336721cf.6.1724784509942; Tue, 27 Aug 2024
 11:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-23-samitolvanen@google.com> <f9ad5fdd-25d4-4d98-84d0-84dfba2a75f2@suse.com>
In-Reply-To: <f9ad5fdd-25d4-4d98-84d0-84dfba2a75f2@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 27 Aug 2024 11:47:51 -0700
Message-ID: <CABCJKuc8fOmsbpqOJXwYstwc+7DEf-Bf26_n5_ai2Pax1tXqUg@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Aug 27, 2024 at 2:16=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > +static bool is_export_symbol(struct state *state, Dwarf_Die *die)
> > +{
> > +     Dwarf_Die *source =3D die;
> > +     Dwarf_Die origin;
> > +
> > +     state->sym =3D NULL;
>
> Nit: This assignment isn't strictly necessary, the value is overwritten
> a few lines below and isn't used in between.

True, I think this was left over from refactoring.

> > +int symbol_read_exports(FILE *file)
> > +{
> > +     struct symbol *sym;
> > +     char *line =3D NULL;
> > +     char *name =3D NULL;
> > +     size_t size =3D 0;
> > +     int nsym =3D 0;
> > +
> > +     while (getline(&line, &size, file) > 0) {
> > +             if (sscanf(line, "%ms\n", &name) !=3D 1) {
> > +                     error("malformed input line: %s", line);
> > +                     return -1;
> > +             }
> > +
> > +             free(line);
> > +             line =3D NULL;
> > +
> > +             if (is_exported(name))
> > +                     continue; /* Ignore duplicates */
> > +
> > +             sym =3D malloc(sizeof(struct symbol));
> > +             if (!sym) {
> > +                     error("malloc failed");
> > +                     return -1;
> > +             }
> > +
> > +             sym->name =3D name;
> > +             name =3D NULL;
> > +
> > +             hash_add(symbol_names, &sym->name_hash, name_hash(sym->na=
me));
> > +             ++nsym;
> > +
> > +             debug("%s", sym->name);
> > +     }
> > +
> > +     if (line)
> > +             free(line);
>
> The loop leaks line on a potential sscanf() error and name if the symbol
> is a duplicate or malloc(sizeof(struct symbol)) fails. Additionally, it
> should be possible to avoid allocating line by getline() on each
> iteration.
>
> I would change it to something like this (not tested):

Good points, I'll change this to your suggested version (after testing). Th=
anks!

Sami
