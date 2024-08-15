Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394E14F9D7
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754908; cv=none; b=JqhOQmZ+hhVfqGLhbzsjqjs+I9sCakV3ZvJK96kbguP0sbatn9BcIKkj6scH/Gx/r9rab5i6A1KGMc96lWICVPZAjWburJX9+QUBw+RE4w2RWK749haIW1SIUEcwrlY6AAIFfGpky3e/T1PXni7qkIMcZFRS6XtZ2fgYkzsuuwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754908; c=relaxed/simple;
	bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A38FXBCIJOx5ENKK1e2p3D0zf62H6ttGm1SPM+YtWKcP+dUhWUsZKspmxR7891b6pJZbsHNsoqPk1dnl7Dyw7J3mTlbHEkqpfd7gL5WpwqFWQpbyXLA2eKsibL7Sgwt7uEtdZSGKTExjGOMEn4gX0hwM/4IqNaMrkpQ/WOyu7Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OBD/ahOG; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OBD/ahOG"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-842fd4e4de7so306143241.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 13:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723754905; x=1724359705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
        b=OBD/ahOGj+5fGqX/GCCCQTfdWEAnUgKQKT+Sd6w5eEB5nZlXJPqXRIam8j+7yKPx4n
         njES9omzgf5ihdA3NriJLGOvoD3AwFU3f5pRDs9b2rJbRCdLf1oRF0LsT1L8X/wAqc38
         tNMFnuS7Xrj5AaoMtcFLHg7frtJ+TsFmNFfzE8vDong1Yd5lWegJpnZcZqNN0qnqRDMg
         da7etcpFhJcOSQtOWfyHstSvvoitNTd8/q5LsWs/XeDhf2o9YXM4VkhwfeJKopLpy8GK
         tZPatHH4sIs82lEiY1UAotnrMr/swjB0dbC4R5XmTWZ6ldr7RkdZ1HtYcZaOqG5JbLsb
         zREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723754905; x=1724359705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
        b=lmKXGqddKReFBkvx+wdoKRnr4nRllHXZD/E/EK95txM9RF9jkQevoBEUYXh/dyX49/
         TQXZcGNlEwDTV47AJylVhm4yxbEPNJ2otzeakAy4VW7xJs+/xWobg1giBwNgTnlaPyBK
         H3STNVPI6gQWMLAVi6AySX++ykPjHY7uPPXYZUoQdpm1uj6NEcoFL0T8csTieMBdxQz+
         lkUhtp/RDByxFYRPaibY1E4f66o0G1jmJx0odIuy0HCjI4jW9CU+8GDVm5Jm4fgzY0n1
         A528q0a9vrFkU0LLtzzREK2ucYS9W20ZD9T6etJC26n34/fzuoQrht5ZpbfQsFCvIL4y
         i5EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSzJxbYJrxoHyEJD1Mm7hawZCEKHXr99QtK4keDvblLdZNv/FLNM3p2bR8iA9d+FSERtCTDq54j7VJoWUiC8seQCmC97zJyrUuU19Oppk=
X-Gm-Message-State: AOJu0Yyfs9XRfc8BwUmdghKDmXFajAl41TrnIYTC9hA70krPQSc6JxP+
	tasNPPOjsMuCE/pEYab2aDkReyEWGZpQ3sBwneOTcEcNYGWJZSgoJC+8f6fYndKuVS04fNzKLvn
	ki5CE7EoRWB+JPqIYLyCiUmewORFmnaofNGmS
X-Google-Smtp-Source: AGHT+IGVnfhBG4W19/FTRIrb1hsBS75Egz6aKroeRS9ZT/fPOBGhFknbNSjR/FE1Ln68gXD8vpeEUMfZUXOrDt+XP5Q=
X-Received: by 2002:a05:6102:f12:b0:492:773e:a362 with SMTP id
 ada2fe7eead31-4977999b09cmr1311619137.25.1723754905259; Thu, 15 Aug 2024
 13:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <CA+icZUUdevE_n4+PgwisFdpxz=7XwaMciVKn+XnDHo-=UqRZ7A@mail.gmail.com>
In-Reply-To: <CA+icZUUdevE_n4+PgwisFdpxz=7XwaMciVKn+XnDHo-=UqRZ7A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 15 Aug 2024 20:47:49 +0000
Message-ID: <CABCJKueVBE0oZuvsDGy-etK-LcK5p5RJg_CQJQnPQ8MuMpGyEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Thu, Aug 15, 2024 at 8:14=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> so this work is on top of Linux v6.11-rc3

Correct. git format-patch also adds the base commit to the end of the
cover letter.

> can you tag it as gendwarfksyms-v2?

Sure. Here you go:

https://github.com/samitolvanen/linux/commits/gendwarfksyms-v2/

Thanks for taking a look!

Sami
