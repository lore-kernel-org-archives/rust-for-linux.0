Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CB51E282D
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 23:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740179066; cv=none; b=pEjbY9nmG+lCaR5Hv3rLNXZln4cM/K1zBXlAeVbAI0R9Q0Nz8iUltY7lxLFwq8D/NlPuCDoOLzHnolTlwFla8hWWZ2MXLpswDJKhpPO5XNQrbXV7P6abyuonavdOgmmKjRPjCbjOlwc0m7RnHYhVjLGMoy+6075Zs3K/GPwXNXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740179066; c=relaxed/simple;
	bh=TpbP32x3fqhhq+Cun0agcs/GSxbQZ4+wDorQANa2i5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGs7rxFRwK/HuYy2+JaRRk40HvFcvq4Ophd5yfvKvxrOFLAvosIt3nsc0gocN9A/KzsgeJV4VY6kP0gpY1UiOlyWVHV250SG05amLcZFBEICS/EPypMiYQJRMk/uN6q6rjfr2svRPtmx84SHx3l/pNnI18G7qAL2ROPH3dRcQiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UouiXF59; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UouiXF59"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaec61d0f65so519559166b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 15:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740179062; x=1740783862; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IYwQB8m9ANwEOGQVayzecy1Wa9/uVkJW9TozXVMdMGM=;
        b=UouiXF59Bg8RYZmFE0FqlJ3i5h/PKmltmLr0CE48cUGBUHE2s6j8nsvP3KvkNOw0BK
         Np6H8BoICBFoEe8fkOx4qilS17eFLZSoP4S5kB1B+baWPildYRTE5bSP/S6do8YgEyP0
         v7fiiHSAQ6OsAbKTXG9m2ss6BePiE0FDEE8/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740179062; x=1740783862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYwQB8m9ANwEOGQVayzecy1Wa9/uVkJW9TozXVMdMGM=;
        b=QpazxX+ccg5XAnlWT9xexZ1byN1Li3dTKtnH8SLEoJrzYcSVlcYQcLySKQbmM6ZJbl
         ENtm3DVTtw2arTQKIjAM2ecHDwsRdsvMzTHR6g+JZIZ5GJqboG4NrFEpngxuziq5L1Gs
         zk67pufSxhGTOZmw8kZs+gRzwj4Ce3ejonqLYzNagYtLAjkVEAXq3mS8zYy8ePBek41u
         lPrxpQMRVIzEXymsEbE3rBX68cqSQ5jCsR1tWFGQzuaBMayWArlqAH0bHGd3IkUJiSMP
         ZlBE5hr1s0QxtHuqT1/jaFRhJ1xJoUSPKp8AQM7l9PQPaAMXSMBAhzFcBwikxgJUUyJF
         Ru1w==
X-Forwarded-Encrypted: i=1; AJvYcCXIhINxA21ILmny0i9o5LiZXPr7Z41ya4sdzSGoKheQidI4bK12nowZpfDHrr9sma6Nx6dCDhdIlXgWTQWBNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx3mlE2P1VQAByjSP4Yl5e3MvpNRvepUwHd3rG7RECXCDVMU4R
	jRd4vPgMkZARhW6LiLkZFx7/ktg+2j+GmKoHfYIVfiKXff9OUoxy6EpdFV/12xYt2bpuIzudV3m
	Hc3k=
X-Gm-Gg: ASbGncs+AHTUGMkf0W36ZP9everDZJ8F6DfbRRH5T02478ov0JQZMh+TwxoNQNRTgc/
	9giySO1RZ03o+lCnvnwwT5brTweLsxIm+soQ+5cYbG3rRnR+IREqsqFZhhDuAh3s9tomjC0CbDC
	8zIVOhCSGZGaSmnlTN6PXpI2+b8xdUVUZJCPYRk1sBALyQRH1RK35THl9+V2aeGGrPtyGCB6GHl
	uWn2JVPpfG67lzMA3SoJchNUjVagQEmzv/wKenKwFPeKdUXCKGA2elzoRPYQTez7A3DmepryjTw
	A4yb/yDFn2Tj8N5N7Df0+oziTakOJBnoXizgvMkJkAnrVgRYEP/9iWWzsh1Ny5NQU8fjlmixpXw
	O
X-Google-Smtp-Source: AGHT+IGz7nbUtcSF8/MOpH48GhV9rWtsJbfUJAyf1bhP6fXTkCYaujIbMTPXDhDsPNIf1ghjioFVLg==
X-Received: by 2002:a17:906:6a03:b0:ab7:ef48:1668 with SMTP id a640c23a62f3a-abc09e2fa7bmr581111666b.57.1740179062300;
        Fri, 21 Feb 2025 15:04:22 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532323cbsm1754594466b.14.2025.02.21.15.04.21
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 15:04:21 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e05780509dso3762351a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 15:04:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWxMNqUVk8xcvWum5HvDaKN+KZjGFGOM5yrR8FTNmGHzr4a92/PUMJYL1MAZz3eZN5LTCfobJvpXeyqJBvxg==@vger.kernel.org
X-Received: by 2002:a17:907:96a5:b0:abb:9d27:290f with SMTP id
 a640c23a62f3a-abc099d60famr532638966b.9.1740179061249; Fri, 21 Feb 2025
 15:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh> <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh> <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain> <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home> <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
 <CAHk-=wg=pZvE9cHJUPKGCajRUCtDoW73xwY5UfJApCWms_FgYw@mail.gmail.com> <20250221172415.5b632ae6@gandalf.local.home>
In-Reply-To: <20250221172415.5b632ae6@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 15:04:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
X-Gm-Features: AWEUYZnMjA5m9nYAw69o9RC1JcJoFjtIPhAhLMih9-38H4I5IZG87DXfXWjPW04
Message-ID: <CAHk-=wjQ94GipftbNo0PbfuUxFMXFyp2bWGJJPNUngyf17Ai8A@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 14:23, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> If I could just get a warning for this stupid mistake:
>
>         size_t ret;
>
>         ret = func();
>         if (ret < 0)
>                 error();

Note that my main beef with the crazy compiler warning is that it
literally triggers for *RANGE CHECKS*.

IOW, it's literally the "if (a < 0 || a > XYZ)" thing that absolutely
MUST NOT WARN. EVER.  If it does, the compiler is broken.

And gcc still warns of it with -Wtype-limits. So we turn that garbage off.

It's worth noting that "-Wtype-limits" is simply a broken concept for
other reasons too. It's not just the "unsigned type cannot be
negative" thing. It has the exact same problems on the other end.

Imagine that you have macros that do sanity testing of their
arguments, including things like checking for overflow conditions or
just checking for invalid values. What a concept - safe programming
practices with proper error handling.

Now imagine that you pass that an argument that comes from - for
example - a "unsigned char". It's the same exact deal. Now the
compiler warns about YOUR CODE BEING CAREFUL.

See why I hate that warning so much? It's fundamentally garbage, and
it's not even about your error condition at all.

Now, what *might* actually be ok is a smarter warning that warns about
actual real and problematic patterns, like your particular example.

Not some garbage crazy stuff that warns about every single type limit
check the compiler sees, but about the fact that you just cast a
signed value to an unsigned type, and then checked for signedness, and
you did *not* do a range check.

Warning for *that* might be a sane compiler warning.

But notice how it's fundamentally different from the current
sh*t-for-brains warning that we explicitly disable because it's broken
garbage.

So don't confuse a broken warning that might trigger for your code
with a good warning that would also trigger for your code.

            Linus
