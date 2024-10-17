Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B14B16132E
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729186548; cv=none; b=FBmLgbqY1o/aTBETRYzIQV+E7uVq8ui032C0NK70+2qJ7T6Tsrr2dIuYObEkn38hqEWZh6XciuH5589pHukmyULVCgNEyI1n0mjc1RVNnyNvCcQIsS/xiJaF8XBpTZ+QCesmWALfdGqoZ6cwvOSBnrffySbJ/Ne4i+l/EYavqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729186548; c=relaxed/simple;
	bh=HuLw3XyUw5DMqXb931/MX/8kxOX3NCDGhGfWHIZsYUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpkFaeAi7iYI1m77/dajqzS3b7uaSz3YSvLWJmtEL02SaNU6d5JWu3rgsf13RUq+8w84xPLzVMv8PLiNfC7z04y9R84TQFiW1e6Mx5aEDh73KJh3+2IoINUPba02QNaWeRNCKVD+x/GtqgoFJsQzye22h0ku4L5ENv6aeuxeXNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJzkGIHj; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJzkGIHj"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4601a471aecso14091cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729186543; x=1729791343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dURRoBcg5xdc+sfdygcMDdcNIH61rDVf7UQMeP0ptwg=;
        b=FJzkGIHj80CeJYXMnKUMhfmYg/9wAbXJxmDLj00C2PAhETZZ/U3t2NBwLcNDXlA4JO
         KZ8dmvRgVJgNj+CQq0dzXVcOc2gC1+OF2ztrJO6dBrc3PxXr6QbJGh0h82/jYshRaBBD
         +f5g02XA6cgVr6uTH46VwWtb68CojEZiKfCioVBhO76uU8lyTQELcoKSoRfycOMtlgeZ
         /Y750xp3n4o9YoV3HX+yTQF9t3689goBZmSsG+whOvXNch5W1sksaCKVTEWCQ1F3NT9h
         Q/jdYC/S70Fv2kBIQCalBHu28+RbAbSIokp7ogmZLNWhYoZ4L71SXiRDOmUOTKrrotZe
         DTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729186543; x=1729791343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dURRoBcg5xdc+sfdygcMDdcNIH61rDVf7UQMeP0ptwg=;
        b=NsDBIyqkKFg5LAl+GgWD7riqnWwAVKsGYrs/qhJ0yJQJl0nc3YmynD34Ctxge9tRLw
         Vb/VUTeOj4UBocJEC15/+tWbEan78242qzGKx4MbqLoyHC7i1Ho+Qlyl0gNaXihLFGXL
         3eBJ1YBDriETsXfYFtLuyFOov0C21X0HEwCnKF56p6xrt4IWYkQcEC3qulBlSrSUBY12
         VTHga9PFNFSiFz1oO5ckBc6gdwKP+sACd4YmsXHih0gNh/9t5aV8BKrt0WQ+evpn0X3b
         NAsAXe53cAbBthELedTd1C/lKyVQH/rrGWVH9vL2OfiUBaqcfAjslRn+XmPoYC1NSd9R
         81Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUkwSuXK0S1taQbUGL4GOSbXBBYG+pj1bDUhvR6C8299NXdslknGqCcgB6Ar1yUL1lLSdOP2kfOGYOr//TZmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrsOVsjmmKsHqINlob0Olb0FOZC8I/WAKDemBFLzYR34KFQsYl
	Lb5m1SsgmwTxxP3TWPNLNxlFfCr4QlWL5uFif3OJvcnvJZZd7H3/PodwxCiDyieN8WiO5yqsJsB
	19omImr1FPlWYtTvZIWR+EhoFvz3YIGPof4w2
X-Google-Smtp-Source: AGHT+IEaDSNEXF6UDd2rD0Gd9sSzpU9Rg3eq7jFfKlAmBkK223IeHgDaarxW/TGnC4DSXNdPeOYFY1DS/4zAFx3ebnw=
X-Received: by 2002:a05:622a:a64e:b0:45e:fea6:a3b1 with SMTP id
 d75a77b69052e-4609f69cb5dmr3909251cf.19.1729186543003; Thu, 17 Oct 2024
 10:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-33-samitolvanen@google.com> <13be9260-1799-4255-89d4-65d56358e348@suse.com>
In-Reply-To: <13be9260-1799-4255-89d4-65d56358e348@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 17 Oct 2024 10:35:06 -0700
Message-ID: <CABCJKueKHy9XmpRVG=HkJaJWAQvtN6OvnnW+Aag4Hd1dfif5SA@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] gendwarfksyms: Add symtypes output
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Thu, Oct 17, 2024 at 7:13=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 10/8/24 20:38, Sami Tolvanen wrote:
> > +     if (symtypes_file) {
> > +             symfile =3D fopen(symtypes_file, "w");
> > +
> > +             if (!symfile) {
> > +                     error("fopen failed for '%s': %s", symtypes_file,
> > +                           strerror(errno));
> > +                     return -1;
>
> Nit: The 'return -1;' statement is not needed since error() doesn't
> return.

Ah, missed this one. I'll fix this in v5.

> > @@ -107,7 +108,8 @@ static void get_symbol(struct symbol *sym, void *ar=
g)
> >  {
> >       struct symbol **res =3D arg;
> >
> > -     *res =3D sym;
> > +     if (sym->state =3D=3D SYMBOL_UNPROCESSED)
> > +             *res =3D sym;
> >  }
>
> What is the reason to check that the symbol is in the unprocessed state
> here?

At this point it's mostly a sanity check to avoid extra work in case
we run into more than one DIE that matches a symbol (or its aliases).
This actually happened in earlier versions because we handled symbol
type pointers (patch 17) as soon as we found them, but now that we
just save them for later in case they're needed, this probably isn't
strictly necessary anymore. I don't see any downsides in keeping this
check though.

Sami
