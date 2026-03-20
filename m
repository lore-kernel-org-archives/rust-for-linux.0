Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DC36EAB1
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005137; cv=pass; b=Z9hT0P9tTVYHMh8jHyuG0m2u4qrhjMJjLIwyHptP90v7xw6P39V/DlqZz6oOuCjFYQMTOIIjs+O+jIdG+0S43hFouJtFNPScvzniwhZdU62ZqvfriYx+9KXKHoefzVgpq20k73XmO5MXc9h98L/P6RD2i6TVcV+PKqu3pEOPuEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005137; c=relaxed/simple;
	bh=cBoR52/7kFaK3PYAa1hExhI92PGowayPhy4OFExbwFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ra1ggP7XrAg3uEUmWlp7NApp/NbuUCxEjUever/ff7GxdrEEuqXmiMATSrQV3QxCZQaGLTknyJqvx1e3+A7irhsIUAFIqmelaiPw9dBcyL9F+eA3rbfIjyLKYoat9KiWUePml+oARrrFqkjfAazgDzsGvI3qNrstfQIubfiZ4AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Md8m8WrV; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Md8m8WrV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b40003d13so1170983f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 04:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774005135; cv=none;
        d=google.com; s=arc-20240605;
        b=Qm2D6tPkHoOlaOLQ4wE47h3GerH9orGydV2knVZnJjqYtCEJrdghGRCdypXDw0eIaJ
         1TbzoNOYnXGuHbosLg4wA15XVXZnqfjgClP8wR0CAJ9O6QbdIDZgToJb2A4xUIcVzXzv
         dEnhMWZiOtL7TVpAGBBm7dRGQJbawA/xM5GnCDoReyz5XaIFKTaGTPCAlc5rtYDJccly
         d9nAm87YhdkNDNoJiWn+/g7TBg3gbMfXlt8NhL2ceTHmzaVmO5ZcopGD5LK92cYagQ7V
         3zMIDBpA8IoU5ea0/kzc9bqn6OrRu256mRf2bZdX1NVB5RUlNcRnIuxVRS5X2ZHSwQ2Q
         azug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U4wf3gpgwGCAms28/6CAMfUfXejXEYFVg7tr2JGihq8=;
        fh=N2kMBBHyKNoAyxItXWEGXuaVfDdq4+ZOC7+ijd1wZmg=;
        b=W1t0Di/ZjaGufn3aKqOwoCes+iOSWoMG+KdsybUqLR6MqPkmtckcGfewEOPfu17BpW
         DLtCbxgYNrbHX2b6iahGwgK8ARLlhISG8Dzz7SIF6yw2k/x6Hb1pJstusm20E1rjo7zi
         UpCd+BkN6FnGveDDIsy+rEdtY5o6/7vhiVamyOJlXYOMP7Hcf8zKUQt5ov4NCa2t74M/
         cYMhFKQo910YSHoiHUgTelr7gMz0nUsWUsY2xWKU2o9Vmy2o1giErxZfzT41pVqH+wdH
         Bo8qomkP1idhAm/Dv06ISrJmGda4XfazwmR/Mc5kBH36RSjN29dL6mz0bFyArQcLUr1I
         ATWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774005135; x=1774609935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4wf3gpgwGCAms28/6CAMfUfXejXEYFVg7tr2JGihq8=;
        b=Md8m8WrVRIJQwMPpHMFEXipOGw+BP9Q2UlMHf5gWuhDRd9QRrYu5UZR9iiNPcV+7Qx
         jDgvlhFhx5aCLJ9BoMefQt1pIOHord/wgDOApDiL9GMI06ZvoF7JfnBfzP4r5UOFKjrz
         j1pCV+kaqqWCDiMk8eArVUBejP4cwnaJuaIEGps0rjX2mfXXt02qEom0ghDuXS/bOqHb
         uEtcqm+gHIhXgT41V/FoLP+GMOBV1hiZ+E1zlBFZ0dcHvrfDJbm6sls8CVSnMENOlgwu
         qyZ2WKk1CYdtulcKRZbQYMkx30+oeArgJ4kbb6s5fi4IHMPypS64oSMwSxvALR5RPMNx
         ONfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005135; x=1774609935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U4wf3gpgwGCAms28/6CAMfUfXejXEYFVg7tr2JGihq8=;
        b=IzTP4AM9x5WVQbSHK9PpQ7emYEUSqTqDxYaejv4hvpTh2XxlpmKrLPpjCNXP0wHrJi
         cbRyxqbhulT5tuhsPdCx0o07IS+UAKM7sqZGz4syeOWP6vfn1cSawGFktKcOoPaEHc7f
         8fh6kK/OoN2eTS5gtSrhvYZux7eC71Cu9YgtriGUV5nbDF7bAhTinaM/Od1xQIcGXDWq
         MHqzd1CUTwX2kwjkaRWliE8YuAXzdWJWwRz1Jo1jRdbkdhPXvFmRGl+VcSqXj7bSwcgl
         ULrIYeGJX1UPTp4MFPnrkU0pjIViQXLAVQsJzjjdEe8/1F6F1+/j5ObysDUs2BOnBakP
         /3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXp6WgzKk3UeAXbzbOhHTXMBaFyNssBu8upOc7/KZciwka9tGem0NfPWB/NNepOaE8gon6StCsEFbErOFw0Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1gKiXGvvHVSzImRShZxwWCKxlv/H9r2+QMpVKValaSzasSx5c
	6L4JVZo7hmk+zgwsZNwWDOa0HV6mxBkZ/DnTWENJ1LHs+D3Ddchn9QwI11/6ovhZo2qGl/9EY7b
	tiUWbgyVG8F2s3UG/86Nwz6ahnaIV7MYxuuWit3LO
X-Gm-Gg: ATEYQzyBTk4H8Ywn6CjTMtedpwriMveE0qXyFmWIy7PT+mjYZ72umILPdqAHHyAJbih
	50PsVTGPp6EIAH5eiXHnDP/RYZG2Yay7jq8/s8NXKdSry4rQew0/QIiUHldtNS7nPSAenXEgWUc
	bBwUeLYoverYzXrA9TVi2zQFwf8EwNHPrwgOpr53EB8r7JXWu9xYyKG7Yi4QCs8YvWYhZJ7rNr8
	yTBTKbq5Gv1Hozm/rKCJfTQuUr8sIRUX7m+A+kjEdLdqSf20JT0bQRMEVYL6EHewkDNRIdB4YBR
	NrmmTgGfMGl5zhWJxcWsINwsMZnIaD+ugJHQkjoq+/ZkEZ/GVHCvvQ6M4TLkeCsXbz6VgQ==
X-Received: by 2002:a05:6000:4382:b0:439:c5c5:4146 with SMTP id
 ffacd0b85a97d-43b64240753mr4849577f8f.11.1774005134172; Fri, 20 Mar 2026
 04:12:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com> <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
 <d766522d-ef82-4300-919c-fed89f2f04fb@app.fastmail.com> <CAH5fLggFsjciKKxv7_k6tXqL=_8JrgAVWq-+xVH1PkGOew44KA@mail.gmail.com>
 <6163dea3-fa75-4403-929e-8ba9ba22eab5@app.fastmail.com> <CAH5fLgh1WMaUpLGTGpWiVjrnTtgFt=hhoutQqxV5DOtrGVsfkA@mail.gmail.com>
 <c7e8c581-5072-4184-ba75-783233bd52fc@app.fastmail.com>
In-Reply-To: <c7e8c581-5072-4184-ba75-783233bd52fc@app.fastmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Mar 2026 12:12:01 +0100
X-Gm-Features: AaiRm52FpYdNHPOkC4SsmkfGjAApLhIpTtaEOXpxOLcLklq_NxfoeAxVn0RbIf4
Message-ID: <CAH5fLgh-2uQbd+EvV2RT3prp4LqzLsDb1DFkYgj2kWZX58izfw@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
To: David Rheinsberg <david@readahead.eu>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 11:27=E2=80=AFAM David Rheinsberg <david@readahead.=
eu> wrote:
>
> Hi Alice!
>
> On Fri, Mar 20, 2026, at 10:47 AM, Alice Ryhl wrote:
> > On Fri, Mar 20, 2026 at 10:27=E2=80=AFAM David Rheinsberg <david@readah=
ead.eu> wrote:
> >> Kinda off-topic: why doesn't `Alignment` store a u8 that represents th=
e exponent, rather than the power? The left-shift when needing the power sh=
ould be effectively free, shouldn't it? It would avoid all the unsafety in =
the impl.
> >
> > For one, it mirrors the design of the unstable stdlib Alignment type.
> > For another, it'd make Alignment::of and similar a pain to implement.
>
> Fair enough!
>
> >> Do you need this helper then at all? I assume it is added because `Ali=
gnable` cannot be used in const. But it hard-codes `usize` as type, yet doe=
s not reflect that in the name. It comes down to which one is more readable=
, I guess:
> >>
> >>     const_align_up(value, align)
> >> vs
> >>     value.checked_next_multiple_of(align.as_usize())
> >>
> >> Meh, I don't mind too much. Just wanted to point out that the standard=
 library provides this exactly.
> >
> > The stdlib implementation probably invokes an expensive division
> > operation in place of our bitwise-and operation when the argument is
> > not a compile-time constant value.
>
> Fortunately, it does not! Yay! `Alignment::as_nonzero()` has enough annot=
ations to produce competitive assembly. If you care, see my example on x86_=
64 below, which uses:
>
> align_up1: v.checked_next_multiple_of(align.as_nonzero())
> align_up2: const_align_up(v, align)
>
> Thanks
> David
>
>
> align_up1:
>         lea     rax, [rsi - 1]
>         and     rax, rdi
>         sub     rsi, rax
>         lea     rdx, [rsi + rdi]
>         cmp     rdx, rdi
>         setae   cl
>         test    rax, rax
>         sete    al
>         cmove   rdx, rdi
>         or      al, cl
>         movzx   eax, al
>         ret
>
> align_up2:
>         lea     rdx, [rdi + rsi]
>         dec     rdx
>         xor     eax, eax
>         cmp     rdx, rdi
>         setae   al
>         neg     rsi
>         and     rdx, rsi
>         ret

The conditional move instruction still seems worse as it breaks data
dependencies in the cpu pipeline, right?

Alice
