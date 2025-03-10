Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A8522FE1F
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741623652; cv=none; b=Es1Ap68u4Juqr/RQ1HPRiaePP30jvxRu+AIbzbGL4/cqnxgZJbITlZyxPP/aPLPIDTHmAu1xYvnS5SN0fFOPR5IbQVnuMGMSpObbZyf3L30NNUCOLcZRxBFuyyvqG61VMmO3vY8JyY2im4ojsmxrJD5aoCP1FYKlyEl0UIsuM3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741623652; c=relaxed/simple;
	bh=GWvcysIj9ipde7zX9vw47kLR8LC3UOaT8XwhuicY6DA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoAiGR3Jrg8PsntydcgojSB74A4IgOidS9/u+Sq4eLP/TnhSMU+ervRw2IIBbwiBhzgrYSfjSe8l55UH1AGjuZWz8T/kE8RGY6TMSsFro/3M3WMvpcgRW6QZS0tNoSEghTVwTlFJl0umfTbuh+fwZUiRgKdBiPxteR6rhuGruBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTcFf0ca; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTcFf0ca"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2241c95619eso8721505ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 09:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741623650; x=1742228450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWvcysIj9ipde7zX9vw47kLR8LC3UOaT8XwhuicY6DA=;
        b=GTcFf0cat+WQoNtX18ChVdM2v/NRBfene+Sa9zm3lLlSVAEqCXKgs8SVpKBUOYn5uy
         xGgb8Lszpz7PS6pbCkO54VjyQgsfaXxirkTbDFOzC3Sq3QA2O6OKfiabfry1hqfrqKb/
         GeLMpteiGv4VnqJ68Ic+8wat2NGLlnR85rCtpzm+lBXYdlSCcacXfj0RygOlbNSaAOOB
         ET9i/C/Ogd8x2ZRjZLOk+Xy9O5K2D1LVtg2JJ6nCd9Ouda/qpIUXT7gRxctRCWZqUZax
         CTXvDJ4jdm9DuHbOGw6kdI2px1qhHXx56vIDvqvTVhONFeKo9Ry5eUEo0pOB7I9myVxk
         22yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741623650; x=1742228450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWvcysIj9ipde7zX9vw47kLR8LC3UOaT8XwhuicY6DA=;
        b=K2xpzjVnEQoBt0JJRvSW03CZPu8FnpDI0kvRBxOzfycLf9TEH638w0A63jtTdlCDXF
         1SKPDEV9ps9xkhFS/nNYm5VWb7kAkwjuHzt1yARIoaGvE9651SjWM29/1L+1sXF+BJLM
         kZuNqki9Konr77Aw1AvpjehXdX0JGBcwSFQnNpD7dH/EchcUF7NcCcaBVEYo7/RJd8kA
         K7ZBmIkbiI6vljLMHdd8wrD3U4hizNDVvcFod7oYa6vINiStHmLhyaaXYbxih1c4PVtg
         o7gzV0m5splEsjIPNho6Jho82NXylmtHcrusm9Tru4sc+gYN3REiQFQBZbEFnkdjFEF/
         3jhw==
X-Forwarded-Encrypted: i=1; AJvYcCW70ZJs1lPzgvEXyCBZAmsT0TDN7nJO9TjBmnrYYMcHvNuAK8j7Nt1vgPDHe5RkfR+PY4vQPucTMo7mxI/KKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TuGbSwSJi212CJH75CSUR4dE1CLOrz0PpfB9CVPzWTGPPkDH
	Jp7O3GM6n0FJAvqkEIXf/P99CaPUtxqQs/fFRwtACgS9upElgrUg0HkdU51zgks5dn6GFilPrEE
	m0q2+gVrxys4/t6RgSL8BSSrPa80=
X-Gm-Gg: ASbGncsl/4WmxAi5WLB9FL07GBLkw0yHK6TB0xx1v1cXhf/KD1YfCClgLyJ+h/xP1JN
	0e3np1GvMgAxJD7JyKtQ8GiVrbYVTZC2u1AI3iQ81ymJWwozc/ujokWq0jmCnz8sw2DvEhsYzau
	lLdpiewEUsJjIhLGTa9qoG4BSc2w==
X-Google-Smtp-Source: AGHT+IEOHK9C+9doxU1WlboH+CzNq4ATiCYOZnEutyVdUL8PRWV5Ki2HjyC4Kkb8LmkQ+VT59ni/327mP6wpXpOpo0k=
X-Received: by 2002:a17:903:2d1:b0:21d:cdb7:876c with SMTP id
 d9443c01a7336-2259325b987mr2144255ad.3.1741623649921; Mon, 10 Mar 2025
 09:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
 <hVvs4-cEyMjFMKMMqergIA4OCAIJUIfXQGi2a_uisGZaLJHUWiNtGPNASjjeprDQrtNtasMOfTrRIiYwXE2zgg==@protonmail.internalid>
 <20250305053438.1532397-2-dirk.behme@de.bosch.com> <871pvbhqap.fsf@kernel.org>
 <eGDvv6uA00fjuGAgV8uknZos4J9VcrxQ7lk9brRpmdGEGIHYZlxk-ZRsGxXsr-SCZE6IVEuPKs5ko9gukJwo7Q==@protonmail.internalid>
 <Z8hwGGn9huDjyDWN@tardis> <87v7sn759g.fsf@kernel.org> <n0Uj2Z9c_20rMgNGkpHAbJ2IQS5ueeREBy6NHdwpCp8vg9V5JrRPJbP3xBFssuyDTcN1JUulMK3cwwDu0U0fkQ==@protonmail.internalid>
 <Z8icwtIpZ3PO9YcZ@boqun-archlinux> <87zfhz5gq2.fsf@kernel.org>
 <qqUZq9zoVyrNCibroh1KeNl3DjT08HYa0Qd5UGBQyN-uYa_Q2y7hLLmoMlQA9KaEkfB8YF1lTywfA1Y4KaeKuA==@protonmail.internalid>
 <Z8lviMzPiMzjQIE3@google.com> <87ldth5jxl.fsf@kernel.org>
In-Reply-To: <87ldth5jxl.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Mar 2025 17:20:37 +0100
X-Gm-Features: AQ5f1JqMm2JeWE2ccG1TDLvvqLOjaL44CpwZ1-ot_DKHP113xB4TqO8G3k84S1o
Message-ID: <CANiq72n6f1iOCZBVM0UR56OitzJONR94Ko2QW=NH=ZBhmmm_fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor description
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	daniel.almeida@collabora.com, Gary Guo <gary@garyguo.net>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 7, 2025 at 9:22=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Right, this is a really important caveat. Thanks.

Yeah, we should mention it. Ideally with an example of a concrete `T`
that is safe/not safe to swap.

Cheers,
Miguel
