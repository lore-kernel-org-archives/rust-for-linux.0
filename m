Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E392022E2
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Nov 2024 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520462; cv=none; b=Ugp562kyPN+PBV9R8Qr/Xi5l3uleiSBUrS9HoD2gkeQlsR4FU0jhcRWF0vbJQOZyOgaJ4UnZsJlqvaCOjPQLkB6IbOgAC6AiCjKucPKihX7zNzVIc7r4FCuXpEcpCqxiDll+wgMOskYFaYuhHjrc+84vaRNpp6Wa6zqaGCIaWcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520462; c=relaxed/simple;
	bh=GLNEdJnIJ8LZnbahpw3kB6Ri67YbLsla73/1yEoh83E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1zVxkI0mlLaCs8H1vDnZ6Jd6hivxFQyBI8iO/XCKrIO2Uzhhg8i0TzP6iAXP7apruoepdDZ8U+KccpcaRklQVcwQNqrkAmdwfCSAMd5MZfYVF4kZrlqtsY6UPXJw2+lEQlHgeC3diqHv0FDb8pZOs1lokeWVGxVXbm2+52daM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hAPk5E7i; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hAPk5E7i"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c932b47552so9265a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Nov 2024 09:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731520458; x=1732125258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY7wBsUbdQcWggybLDq37KJ8DaxAj5d11PMFbvDEhAw=;
        b=hAPk5E7iPdRGDjWTmDRRHcxYpnDfw+d86PJtJkK9kPXpYgcAGWBnOh5J8LTQf3juXK
         ncOnA0KbRXw2OMxatjtWQRRfg7RR3fZM5YgHCzIWPVXgrn+Ba4UYr5hnmXc3E8ShBshL
         jRe9+PUp0g9kTFXkEt31FcOpGFxqZRUakp+0LwiyrlM0ycmpMUkzGZJHf3ANlpr3PMGh
         8l0scIbHmGUsHR7q0EaOTd/FCxikK9xWs4X+m6T08czYuaJLpbDpKU4/C76yw0pxwEtp
         02EPuiyVLzOvKGSfGmEe4XePJgaF5OQCsgmzQketJJbIkvnyfn/sOAQmkfGfcAJxOBYV
         eu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520458; x=1732125258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY7wBsUbdQcWggybLDq37KJ8DaxAj5d11PMFbvDEhAw=;
        b=dbH64G/Xu2LPG+AtHAhnJEWOnOJKIc8ccxNrLYUZeZ9cybN9Sj9rP9ot310/W6U0tX
         l5p+17cBVU9bvoZYU73vpzLdqWYelPNFTA5qSuKax8v5NUNKPz6EoG3j+9bjL1GTseO7
         cmgcqTAZSxVvbIDa5fOxlk1QAEVShLzCvsM3lkJjSyltgL3EBwdzewIXD/zQ0AQM++Gu
         zdMAX13tBjzjxBiJozBGhi22qf+O2bruRnUH/k1pmdCOjmFtPbjkgET49Ar9Wt/w8WHw
         gP7m/Ckc7Mcn+yEbsLWaNGKsjmJPUy8G2tTK+g/V3CjxZ96DJ/jBmLgt/qDIQs3XwIpI
         IB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrek05Yg2a1yrGxNU3oB1NrSZDbymZ2hGHrcyMQWf8vIc2qL+Vepvb5xa4pnNf/C4sE9pTlyuA0JaqKfgggQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCORTAgHK7lrJ1FjotFN96305QdU+3ihz+ZPP2mAYegQz1jLJX
	p2z0f9+j9oCt69IvpKbYA6sxVHAQtWJmiamRl38KEDk/xAoE53CkZzGlE3Wmwb4yIXtbBnG79sW
	8q+EKOk4fMYAN9I9R45FxFgoiDnWDhfGXQ5jD
X-Gm-Gg: ASbGncvhL0s0xTH1M5FCCR8ZxfvwSyzUH5tqy/cZj3hQw/e1PRZYYaohBRwkEN9jRcD
	QayoufdFxEdd8hHteA0wC6T5bByqt
X-Google-Smtp-Source: AGHT+IFXLnHsfDYTpS01K6b79CsIuzgS6MULqvEjuFdWIkvmBmxgPffAF9QVNOOGzikrvjwjQEp2QY0dMQ2TSECyW3Q=
X-Received: by 2002:a05:6402:5308:b0:5cf:659c:abb9 with SMTP id
 4fb4d7f45d1cf-5cf659cadbfmr209409a12.6.1731520457717; Wed, 13 Nov 2024
 09:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
In-Reply-To: <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 13 Nov 2024 09:53:41 -0800
Message-ID: <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
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

On Mon, Nov 11, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > To avoid duplication between host programs, move the crc32 code to a
> > shared header file.
>
>
> Only the motivation to use this long table is to keep compatibility
> between genksyms and gendwarfksyms.
> I do not think this should be exposed to other programs.
>
>
> If you avoid the code duplication, you can do
>
> // scripts/gendwarfksyms/crc.c
> #include "../genksyms/crc.c"

Sure, that sounds reasonable. I'll change this in the next version.

> > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Acked-by: Neal Gompa <neal@gompa.dev>
>
> Does this Ack add any value?
>
> Acked-by is meaningful only when it is given by someone who
> maintains the relevant area or has established a reputation.
>
> $ git grep "Neal Gompa"
> $ git shortlog -n -s | grep "Neal Gompa"
>      2 Neal Gompa
>
> His Ack feels more like "I like it" rather than a qualified endorsement.

Like Neal explained, an Ack from a potential user of this feature
seemed relevant, but if you don't think it's meaningful, I can
certainly drop it.

Sami
