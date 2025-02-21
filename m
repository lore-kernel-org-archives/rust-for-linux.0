Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B124253B64
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 20:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169583; cv=none; b=YTLCgidae3vFpAMBmQTrzzI0+H/DD1WI7pkx+7ghWaEWjbJmLCeMnCNzRyoIog0M3wn8YnM+Ce43eSKL8Vh4vXAjd8jaqSta1jr3vmrt4AlFUfCjPdy9Eyf7idyLnbyLRMIqYKt/qobRGlwdy03ANO0dpgy5wFvf0pFb4WWAj/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169583; c=relaxed/simple;
	bh=giBBo4caqx8Tf9a93T9eGadcf7q3hJroPXPmYCW+yTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXjQ4YeOmN+A7Ya+/2/97zoxMvQZA4y8YZcStx+eWGnaqt0cZa5iYwQqsXWNF640/9W7As2S0maowW3UOyDM2IICN1hWlMStZiEZAa9ROWiMme0Enw+UjrIwG4PZg8tMVGb+9vlfQYG8A6YSMUNIfTKbOq6K3SjZlD9ULZocTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VNFSVJo2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VNFSVJo2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abbd96bef64so403599066b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 12:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740169580; x=1740774380; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5rQmbjlwBbLwDXvN5+jqJigL+IoD9eonvyj1f9icKNM=;
        b=VNFSVJo2MSZLpZDZ9wf/Ya5pZMH0HadRqVSMyB08pPGuib/fFLvWdjsm5VWPwxwq/R
         rZRCBrtdqVoprn/J7V1r2O8ku6r/oAbPRn9jAnGyGB6zS12k7QYIaX16SClwUXq9k7co
         Z4xe18aN3m4vVn4x5Sx/e+CBy7qNlh+iv2X+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169580; x=1740774380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rQmbjlwBbLwDXvN5+jqJigL+IoD9eonvyj1f9icKNM=;
        b=hJS/hwr+AsU51A+MA7r7oEhoe7r5TspTQ88tOR9ZW3wZFYQrj1FzHgXZ1jIUXx1tRC
         vItY1WsEzB0a3tL0A+8ppYKQdB9Dx884HDhWWNOmpCotT564YWfaPG3TsExM47jlwE7V
         SiJvxPwUM15QSgvvMlh2OR+p+2n3zYdpLqFBxTLYRqAHB6ddyDKfiKMMo3mfMbgeN0pE
         GTVAJ0qG1aNj1m+NPu8sSPiHfaLWmhrLx2qPVzY6TKPvV5f1WB6EWQaLj+1vXULcvjCU
         H+rZ3eMhq6E+P3PmD+/l05Ehw/i/hTTy9uRTbvrgmRQ+hzX8TlhL460AJEo/NFOx+zYh
         EE8A==
X-Forwarded-Encrypted: i=1; AJvYcCVvtU6ayEMTS8thTpMGNHJUMXfM3/6ffmA3Ch0gIJy7g7rwLzDesw5SYrVXGz31+R8xVU4PQMU/VSXlUtjQdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPt2NRwSIln/ljooadScWeJxuiv772TEOdrlS0+CN8LK7RF7t
	adaT3rCfmACM2u25lyb+G4n4wExtznqKuqZpqQkzTyx9dIFOvhhveKxhycDWQF5ll0u7p61GZy+
	JvQ0=
X-Gm-Gg: ASbGncsOXeOWU63HDLTN+P1nu5LpagtoMS6QzXfwrJRDdl/BOznAMCA9yAZ0bDn0mLC
	Xxrip+hNSRbcOTlOQzXGGIMMRZTzbelD1NkEYm6PHztBI4k5GNigrkCXB3aXOlzJQTtSI/CUOtH
	6hRSElXW5OaM5Z5uCIcTfHdc9t8kfgW+HIHt8YHXi2Am9x5KhTyQ0+j5ZSyWwmlGQgoxIpZ3HD6
	V6rRvTK223N2KenC1S/s9fjZIyEF4y1Oy/RehZHVvcdmm0x0A7s9cbPdrSSEoRhWXA2pkX9v8jF
	beGI9DajAocdJ8FvwK1YH467lFOvx2nHSOHFflaYrGnBv/4plTNTGEPoXurNhLO60lWw63SeBtJ
	S
X-Google-Smtp-Source: AGHT+IGgSinwF9WA2g74XxWTTs4a858vnGZwF6t1pKciXs/iJLfgAX5UbcGEfANcLjpQ7G+V/OHIrQ==
X-Received: by 2002:a17:906:3293:b0:aa6:7091:1e91 with SMTP id a640c23a62f3a-abc099c9caemr452516666b.11.1740169579624;
        Fri, 21 Feb 2025 12:26:19 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9d19feaesm1006674966b.48.2025.02.21.12.26.18
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:26:18 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbd96bef64so403594466b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 12:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRuDnlmvfLnHRLQ4pbVKpnTBquJG617bzyC+6BD45uy9XjQUU6ctOxymUsy5q4Yg2Czua3eWILLV9jGEXXJQ==@vger.kernel.org
X-Received: by 2002:a17:907:72c1:b0:ab7:b356:62e0 with SMTP id
 a640c23a62f3a-abc09d3615bmr497772366b.53.1740169578296; Fri, 21 Feb 2025
 12:26:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com> <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
 <2025022052-ferment-vice-a30b@gregkh> <9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
 <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr> <20250221183437.1e2b5b94@pumpkin>
 <p7946077-rn30-n3p3-ppp0-80o9n9p07718@vanv.qr>
In-Reply-To: <p7946077-rn30-n3p3-ppp0-80o9n9p07718@vanv.qr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 12:26:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=whZwXK9shqeV5fpRF9CRqApVy5wz6myNeAkyuFm-ERTpQ@mail.gmail.com>
X-Gm-Features: AWEUYZmxOG8LoPESIjY5QVAnSYfcZ5a_0i_NpT_k6tEamu_ExBz05y6DOubwg3k
Message-ID: <CAHk-=whZwXK9shqeV5fpRF9CRqApVy5wz6myNeAkyuFm-ERTpQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Jan Engelhardt <ej@inai.de>
Cc: David Laight <david.laight.linux@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, David Airlie <airlied@gmail.com>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 12:06, Jan Engelhardt <ej@inai.de> wrote:
>
> >(Apart from the fact that c++ makes it hard to ensure all the non-class
> >members are initialised.)
>
>         struct stat x{};
>         struct stat x = {};
>
> all of x's members (which are scalar and thus non-class) are
> initialized. The second line even works in C.

Sadly, it doesn't work very reliably.

Yes, if it's the empty initializer, the C standard afaik requires that
it clear everything.

But if you make the mistake of thinking that you want to initialize
one field to anything but zero, and instead do the initializer like
this:

    struct stat x = { .field = 7 };

suddenly padding and various union members can be left uninitialized.

Gcc used to initialize it all, but as of gcc-15 it apparently says
"Oh, the standard allows this crazy behavior, so we'll do it by
default".

Yeah. People love to talk about "safe C", but compiler people have
actively tried to make C unsafer for decades. The C standards
committee has been complicit. I've ranted about the crazy C alias
rules before.

We (now) avoid this particular pitfall in the kernel with

    -fzero-init-padding-bits=all

but outside of the kernel you may need to look out for this very
subtle odd rule.

             Linus
