Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8511FFC6C
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 16:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070040; cv=none; b=kg7+6herT09mM0PchoH5rPA5fwTVUaheK8d/VcUOFpiSi0sx+za12e/O/dFZroFoQdMJvp1uxI/i7RG1k0Pd+LHLDxGkGwWk7u1fQYdGfAoII1E1xTbDvqHP6fSwxIycpCP45702Zvx1RQ3RYmr7cxrv5RLD8HWfzcdaXdUiT0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070040; c=relaxed/simple;
	bh=dQbcpcb/Fr1fg1CoD0pZkGdNzzEl80AydjsiI1ZsQkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJeRND2ZZo2GnRxkkXm7kRaFQMGtAli21/OjlS8mplk2WE6UyhGKcUT5ZQcSG/0BnKUrzV69uPhV0iKL35DpuoO2KevDK/cVrIho8lV7dN9nsyL5qlNnClRqurIhL/eze2B6EjbjphZXMSj4/SN7DoKV82o2cREgSmdTTF76itA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YL5CHTuc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YL5CHTuc"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaec61d0f65so248223166b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740070036; x=1740674836; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YZPfZYNg8NOtUAiK1S11L7/kf32fZfQ/BKwR+IkGA/Y=;
        b=YL5CHTucO+0iTnKBuNAcx1vkPolAbqVV2jYc5nwzBsrS/UEtQD2eGPDNJDMi/DJowA
         eyxA1el94w8Tmtu2AaJssChpvA7P82JCE40FMD8+tbXLwZW6rCu26APGa3JYwZoDngIA
         d884ZF7iZ3T97mjXSuKx557jJirkjpENOkXRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070036; x=1740674836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZPfZYNg8NOtUAiK1S11L7/kf32fZfQ/BKwR+IkGA/Y=;
        b=J+jC/dvhL4vCeyRAWwsELRhyvXEQsA8VZM/YwfF8idr8PCBXQoGX5106I/ffEaZ5gR
         4OUraaHauivVDfv/OCehpM0Ibp4dpcQpB1u8SG9x2MTW03k0/KzgY34QnCF27aZp4KQr
         QRVeTRFsZxS9sD4k3mqSQ5ZnT6uCFm2wjbQkRw4sPKOj+I5YVjIYGFbGEx7eRplxIsTa
         LDpnvL0gyQWXZ+2JciR3yUwcZVnxKR4CTQWeQAUzLDlrJDGCiOZTmuhV/6mSdkuW/450
         Qv4Vuaz4Jpx2fqQ+jQoljKgCwm35DclXxQ60kLoX47LjhpW+AZQTLl9+UOE8mtRaq0Wp
         FOzA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ssKjU6CJt94PB9vsbytoW+m1HYu9l3jy3MlrMh0HlxjM1b31nBgMw2g7pqE5+SVKDTxDuZOEG3L1OxTihg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEwq//9TbYgKGmnpAIrCuPFvvzVFjUwAVCG2CWVB/UcOdVkqXg
	K68N+UxF5KjJTc1xOKwachssRcEq12A0L+WqwwHz4OFKlP2Ad7K9gogg1Wh2ZKptHUZEywRHciO
	H1o8=
X-Gm-Gg: ASbGnctknn0xAeUdsDPO/DglakTr9+Mcm8ylgdfINjGpDEwn2WrKJWhh8CjdClP8ij+
	xfMpkxmRmadLWHfSbPTJGOPXyoCJSokxV9avB3jpFSLcXPnnAsWydWi/n0TATh0wme43SPkNpUY
	il0WV0rz/VGjxfRlLNSha53ayAhWWWh+dAlskv4wGBNVx7XCvabZZuxJbKH7Fr/pRuOhYbvGI5i
	imo3P/+xvFqSs9LKDNy+I9LmcLPNA00EKBelv7cbpYKUDXVgYyiaxMCN3UIr4WHeAhdn/eDCwLB
	FDckQnV0z8Ix0K7zsYSanKYHyTiGnh9hDE8TXB98KZdfPXMmy9xZh85XCuIFs7q7WQ==
X-Google-Smtp-Source: AGHT+IHwJj9pl80EvrX7bYo54QNICieHhAfvwHRp5b8rBXQu01nGMgA8J4HNRPlsBpvS0WQ8jYOplQ==
X-Received: by 2002:a17:907:1ca2:b0:abb:eec3:3941 with SMTP id a640c23a62f3a-abc09c10d29mr836166b.45.1740070036008;
        Thu, 20 Feb 2025 08:47:16 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbc0d0b882sm521693566b.109.2025.02.20.08.47.14
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:47:14 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abbd96bef64so190018166b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 08:47:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUj9Z237rKDP5B9oIfVjNMhxNXRSVQG4lDYvWJgFppe1XIjOKBGT5TzS4Mkz+YRdEf/W5NSPEymFzZSK+MAzQ==@vger.kernel.org
X-Received: by 2002:a17:907:7743:b0:ab9:137d:f6e7 with SMTP id
 a640c23a62f3a-abc099ca6bfmr2068366b.7.1740070033907; Thu, 20 Feb 2025
 08:47:13 -0800 (PST)
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
 <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
In-Reply-To: <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Feb 2025 08:46:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgb1g9VVHRaAnJjrfRFWAOVT2ouNOMqt0js8h3D6zvHDw@mail.gmail.com>
X-Gm-Features: AWEUYZnMkN-x0Rtej4417GBTUm2ZZTOyavgfNoxIwCkZFobkcHssn8sD-O-61LI
Message-ID: <CAHk-=wgb1g9VVHRaAnJjrfRFWAOVT2ouNOMqt0js8h3D6zvHDw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Jan Engelhardt <ej@inai.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 07:17, Jan Engelhardt <ej@inai.de> wrote:
>
>
> On Thursday 2025-02-20 14:23, H. Peter Anvin wrote:
> >
> >People writing C seem to have a real aversion for using structures
> >as values (arguments, return values or assignments) even though that
> >has been valid since at least C90 and can genuinely produce better
> >code in some cases.
>
> The aversion stems from compilers producing "worse" ASM to this
> date, as in this case for example:

We actually use structures for arguments and return values in the
kernel, and it really does generate better code - but only for
specific situations.

In particular, it really only works well for structures that fit in
two registers. That's the magic cut-off point, partly due calling
convention rules, but also due to compiler implementation issues (ie
gcc has lots of special code for two registers, I am pretty sure clang
does too).

So in the kernel, we use this whole "pass structures around by value"
(either as arguments or return values) mainly in very specific areas.
The main - and historical: we've been doing it for decades - case is
the page table entries. But there are other cases where it happens.

The other problem with aggregate data particularly for return values
is that it gets quite syntactically ugly in C. You can't do ad-hoc
things like

   { a, b } = function_with_two_return_values();

like you can in some other languages (eg python), so it only tends to
work cleanly only with things that really are "one" thing, and it gets
pretty ugly if you want to return something like an error value in
addition to some other thing.

Again, page table entries are a perfect example of where passing
aggregate values around works really well, and we have done it for a
long long time because of that.

            Linus
