Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815731B3953
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jan 2025 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735852849; cv=none; b=Ygf97rCu8eC3fofLAntRiEU+M/zE9bRmraM3BntYCxw/79VmV/EGi5OmwX/GtpIBk2r2sFFFvgZoSbmCQNd3r5ArICbApsCB2H1TSLwuOgP0QwcFghcJDY69EcB6UGFauzMQ855ek60QmO1gwAIjY5MKsCDyKJRWn4KbnK+5FVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735852849; c=relaxed/simple;
	bh=vTo1ZqsPUMCCaQufaEwYjzzgT7pASANYmiKJQF8QkVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPucDldPw1PVoNms02lPbbSXdMZS9AUFOktClRlkCZCnlpgkFCpd+f6UsP+fgZutnRGvw6SljxoGmmZaw8SnhOJ8DNu/ohLZrPc/gv2+r6TLbMzd1qWx+SzkaavmwqZa2eJTdWmA0hHvgcgiqnxgg2I5wXc/x4/ItWQag6e8aQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wzqCA1Jf; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wzqCA1Jf"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3e638e1b4so381a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jan 2025 13:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735852846; x=1736457646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9vFdZ7IDOzdE65bXGsMPSe6IPVaerxNKtrCtifyzwQ=;
        b=wzqCA1JfFUy3DHAmtzOcruJUdCbI50aFmZaDBV1Kq9ASXmx0Ev/oL7Qz96otNkIzQh
         sUVpWt1mwpacGEjdVBnU/MU/lkILA5/Rhy2IK8oHwiGrfbZ1D/qYODxRWxGADoINXtnH
         GilBlNTbZdjq/wxTQQhvkIUyNjqkollmOJ2dTC+ZXmRtqdDFxEXSNIhFTsffKIkPqqtS
         KcD7EvkonLnVOAjNSNTKEgQfNAze55qCXl5zPPEzy5Ay0FvmsRLpeaTYpnt7KeKG6geo
         uZ7f9csmWII/7Oxxl2a8rfBBmQ2E23wyS+KlYTLivINwulUci9+11HOfqvJZ7h8FnmL1
         3bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735852846; x=1736457646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9vFdZ7IDOzdE65bXGsMPSe6IPVaerxNKtrCtifyzwQ=;
        b=oNP0NjCfLCH2CG5Sfm32iYmevs7R1s7nXhhbKg6KCfjdb945mtQc5d8VLNKJ26aDmE
         54ctXpyL6fWhMeuEdesZhLcoT1FVBcBPBA9yQxwiJamWzdn4vy4H0vdODGq2RXzVTH6W
         2RrUAyXaeIXSmyVwLcwEvu4GlYZ3ewn6fjbYyaBJKysK9qgRP2fdCwlni3C+qSuDTMMe
         g8CZIdR4Mx7CEQXx0PlGwcm89YwSG9WsQJk1Sq11KnpItNx07Ufgt4hPD0ro5AH4MSHH
         BRS5c1DCz0/SJpbYhulQeMUBN86LWpjnFlvZ3dC1I8KDw8pu+F4DiEfm3+xQbpTmKdiR
         JeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3LDdUt+clvR2MpqdlaPreiTTewG7QLBaYO6fMkogs3jw2z34guEs2CsN4kwgYGjoJnmOgyqsZYbi2ACm++Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxysQX1mwQHz+35kE9lt+aWWFDd/gva3OJRDTJ7gydsFoFV/ROn
	md5MbBPqyJyblOOehtA/GM38zTmnI6FPyUZIkUeMrwJxh1BJQlLq7gCFVUnAzZknElDnDmZw1G6
	Gi4k7zS3X7JzlxQsVdOWfPMSKuT9rTJMFgmJ8
X-Gm-Gg: ASbGncv9hRuRu8CbQkhlzM53vgWf8qX8mNK9miN8JX3U1SCL/xYjg4HG6DlW4L0YnhI
	qYzSzE47tNr3CbtJ4yCqaaMqzhMIlMtad8MDYx4ewUL1EohRMlXmYDFaSkK3yscZSBA==
X-Google-Smtp-Source: AGHT+IH9SygaaxBqUPclTbHe3MzYjU7Sn3gBDwj+5VIodQhhpoIxsAYg0gsp2U2WhePi8dcPSYF5grOygMRJ+YBwyjY=
X-Received: by 2002:a05:6402:538b:b0:5d0:d7ca:7bf4 with SMTP id
 4fb4d7f45d1cf-5d9156e2c80mr23976a12.0.1735852845570; Thu, 02 Jan 2025
 13:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
 <20241219210736.2990838-22-samitolvanen@google.com> <CAK7LNAR=kBi_LN7UkO_qzUQh8fMd1BMf=ZZMQMPph5smZRzSSQ@mail.gmail.com>
In-Reply-To: <CAK7LNAR=kBi_LN7UkO_qzUQh8fMd1BMf=ZZMQMPph5smZRzSSQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Jan 2025 21:20:08 +0000
X-Gm-Features: AbW1kvaNjKx0eH_u3SVWBJidzerXL7V3SCKDxDD6r1mwb7-uASHbuJoLBzWifzg
Message-ID: <CABCJKud7qojuvkcGtOKsXjd_g5A7aS0AT611GVMGtsw5SHyJ5A@mail.gmail.com>
Subject: Re: [PATCH v7 02/18] gendwarfksyms: Add address matching
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

Hi,

On Sat, Dec 28, 2024 at 4:29=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Dec 20, 2024 at 6:07=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/sy=
mbols.c
> > index 7adf2ed9b89b..98febb524dd5 100644
> > --- a/scripts/gendwarfksyms/symbols.c
> > +++ b/scripts/gendwarfksyms/symbols.c
> > @@ -6,8 +6,39 @@
> >  #include "gendwarfksyms.h"
> >
> >  #define SYMBOL_HASH_BITS 12
> > +
> > +/* struct symbol_addr -> struct symbol */
> > +static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
> > +/* name -> struct symbol */
>
> I think this comment addition should belong to 01/18 instead of 02/18.

Yeah, agreed. I'll send out v8 with these comments addressed.

Sami
