Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867D635A38D
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 06:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773209530; cv=pass; b=mbeROgh6HYTAHsanEHsi6ELqboSRROSfKV5WivuzSXFzqp0RTMExiEJL2NEt5Qp+dyBZ7ow8G8AhvCCTM8wkGjvh+UtGASXbqdWnltIhb79gHiYwkouX1dMTZw6iTGyNV5ezWOaZIf4IhenQx9iJqXmRfxp+8Lb2iQKXxpnfZsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773209530; c=relaxed/simple;
	bh=yIRuISDEoujZqBbzxtC/xzKKJ1iPngAjpiJCNBGIUVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShirEAZADChPRA5QVDlwKJPqjR/eIhu1sbMOsQGMhr4nmUaDO8uB5WfCfgNXRLgHiZDT6uun5+bXm9sO5thBuv8J1f1dfSttlM5pEQFb9A0PuYdzWdFVo/TXrcVICpmZmYL57qy72ldZ3nQj9wdbriWBLPGyxnUdvSF6yOu34U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHensFEh; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHensFEh"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b8095668ebso954820eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 23:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773209529; cv=none;
        d=google.com; s=arc-20240605;
        b=T7dYaHtu7bsg+mVtpYomyZhLO0B0HJ2IjfdhxFm1c2nkMc8dZxbeobKVETUANAJuRu
         HWCsy3FL+mVy3A7jn4NfHvux/usuV8v8T/yzPiCff4IQBmgInOp0HY84LRDWmtYmE0r1
         AU57r8PS+8vv2MJgvLrJY1bezza+6bo+7oQ8lrNdhAhVlrzLDajczgguxEwIUbfCuVFi
         X9rzX3fqx3Y3YDDWfewyTWF01PYONpa5QCKJCu+G9yPs7qKs2lfOu0PqtF0/kS777t0E
         kNGdtGPvqh48PqC7wfFxAkprroHCmmNPGNR04UUXoo43sfUADlFE/nHKOphlxYRzVlev
         59MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yIRuISDEoujZqBbzxtC/xzKKJ1iPngAjpiJCNBGIUVs=;
        fh=NNYsIwTU55dl7Dz8UxW8a0UFSfOdvG8eFkyUB7lRrFg=;
        b=RWgyipsitthYEmq7pC6k7xFu4IWy3OffSHaa2TUujvBh9UkdRDtyM/PWOrsHLsg6KO
         NM11xPdm6kkf9gLAjYfm7u1dREs8ZlnmWIGurlo28Ad0qRG22m+nVenvrnMD9pRVKLOD
         C2aCC1nIVcnbtVciFKTKoF7u6QR3h68Gnmgvi9yxk95ltKOJbIoW5j6epG1d5KMPRdBd
         feoSWx/W9wPmeI+hP9idPTmJfaa9AQzyjQTfNKmPlt0HDljexX7Z/DYaw8QxPSxyJoPn
         6Rb2Qkq5r2c6a/RLBbZsH67z2dpfek+8He7tNFpWWabusKIwz6bLuDO8xAR1SNS5bGr9
         p8zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773209529; x=1773814329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIRuISDEoujZqBbzxtC/xzKKJ1iPngAjpiJCNBGIUVs=;
        b=lHensFEhNe6rNbDt5a8VCqKemEsGUS9JZIY7SmWwiDcYTmMRAT9dnEamhdeTLjVxIA
         DckDQI0cIG9NUFL+qFxvSpg5hVdaZmkhxlK5LKGuk2o1VjigHhMV3Ulndfz5sLrCyxDG
         vt9ZP1GXWdgsNwp3ji94SsrAc3ZSZooHM1xtm3ZJbClz89J2jIuOPE6g9Cxqlpf0vgg+
         U+hI2SfWRHp1YGTWXqGfSt+D3gjTrTlA4zbYjeUT5nmFEPFDreOPF9B08OJBChOLCAPm
         rBvl2pPcBOGVrMg4ngF/aCNA8htL9Vtj0h/iZAoqOvDrLKq2fZMfnMdgvAaX88h6HZaq
         +uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773209529; x=1773814329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIRuISDEoujZqBbzxtC/xzKKJ1iPngAjpiJCNBGIUVs=;
        b=mdXJRAEnrjv8V6Q+6qP5V8GcHaPM25/zJssqXAoPfWy1djUCNz7ZKUfq55FCWcSVvu
         Vy3OEjcr2K55JjyEjbc1fBWit2Jss6borH1AXQfa7aCsP5HwB9EAaPOT+CkHBauzf2H1
         rUPY6Qc0oWWT9QLsb219aCEaIC6eqp8byJ2oT/EhpHN1aE3zrGK7xvjWDpHoXDLVZGQi
         QR7vllwlwgCjPPJkcU+GYimOnMKyJXo8POcCOND084IGYeQB7nDtxTe5b0+Dc9nrt8U4
         2gb6TGa7jspRkvSR7svir/OM2XtlNKAzP+mVe2v3DCOxgM5GBNfn9eDL9pEbL76h9Qh4
         fH2g==
X-Forwarded-Encrypted: i=1; AJvYcCX2MbgFV0xt+Dx7YWTCK16c+eNFN/YbquPSX7hVTEw2gsGFhr4t48wt+MATBcFSZ0D6muucFMTskY11KI5FKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfU3zckl0Uol4ZdbsCC3Pg7FidWoZpcFJAN592fLXi25a5n1UJ
	FW2YudTtwOttTvd8M3N+4Ev09cH7rAdfkAY9yCB5rmXISUqMnzdD1dNMNHOVTPsDIbXsnKn18+F
	e1/349a0fwhV+9MlJkrL2fFhUKcKrkSk=
X-Gm-Gg: ATEYQzy7/EqlAwuy5qfI8xlK9RT6X7ePvKoC+6Lv2rvnChONFrHAodZft5f9MLb2T5u
	unjBc4/t5qAoGlxDWCeDzj2XOakBBj7lboZ3q8a9WJsPLrIxYWZHBjp40th7uybSN6Az4FZQ+Rs
	NuVFuZYaUdOI0cNMTJlxOxrKCYGjS6KQxZPDNG2+pEX2r0o8I9xucgE/xNiHk8xnusQCnR6fjv8
	WDPGi1009YJPmLOSRIridF0WkkfOg4dNS75DdoGT7K5PruwGL2ppoDlfi6HgFICMMy6KpleAXLU
	dS8Wj03PjYAE0EzTeTHGu84w0IwMKUEzkq54gczYsUj5068ZZeLmsglK463fVZbzuUEzW1EI45K
	bXOzRgzRRiym6T4Vaza3XUMg=
X-Received: by 2002:a05:7300:e607:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2be8a1e3690mr321671eec.1.1773209528551; Tue, 10 Mar 2026
 23:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com> <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
 <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
 <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com> <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
 <b6558f4d-e424-464a-a9a7-ad14a174c542@gmail.com>
In-Reply-To: <b6558f4d-e424-464a-a9a7-ad14a174c542@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Mar 2026 07:11:55 +0100
X-Gm-Features: AaiRm51tvmVu2LjyICksrWjXhLEo31iTgkLHbduLiBjHYdZRdlDZUJ6pwrQ-fxI
Message-ID: <CANiq72mvzMnkwhGV+_srz=kLazpHVg5+-HaOtczaTzgFdaYQiQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 12:57=E2=80=AFAM Carlos Bilbao
<carlos.bilbao.osdev@gmail.com> wrote:
>
> Yes, I suppose one day I=E2=80=99ll work up the courage to use automatic
> translations for what=E2=80=99s left. But I=E2=80=99d still need to revie=
w everything
> carefully to catch mistranslations (the classic Spanish example is =E2=80=
=9Cdriver=E2=80=9D
> to =E2=80=9Cconductor=E2=80=9D), though in practice the issues are often =
subtler. It also
> means resisting the temptation to skim large paragraphs and trust the
> tools; something that=E2=80=99s probably more tempting with docs than wit=
h code.

Ah, I didn't mean to commit change, i.e. not for maintainers. Rather,
I meant a set of suggestions for readers about how to best read the
English side of the docs.

That is, when they are done with the parts that are actually
translated and humanly reviewed, they might need to keep going and
read some English parts (or the code itself), and thus perhaps they
may appreciate suggestions on how that may be best accomplished could
help.

And for those nowadays using AI for translation, perhaps what could be
added is a set of guidelines to guide the AI while translating (e.g.
to have a greater chance of not failing on the subtle points you
mention), both for all translations (like whether to translate
examples) and for particular languages separately (like the "driver"
example, though I imagine that is handled by context nowadays quite
well).

Anyway, like the policy across all translations for whether translate
the code snippets, these are also just random ideas that came to mind;
and perhaps they have been suggested before. :)

I hope it helps, and thanks!

Cheers,
Miguel
