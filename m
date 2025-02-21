Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724982512FE
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161285; cv=none; b=AZqi6iRap/nD2p963APhwlNu7SyyTRzMWcmXcFFpsvfIBhFrdAWcs9E04pQTzD6XR4U/5fQPGgt1VXy41bKCSKcrteATkObfpjsNugL7Uf9VrB4EhgqDYxbDqXor8okMfMQooXZMIT/lAObeXI3ZH/9ZWGQH7PnwfsyctRtD8wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161285; c=relaxed/simple;
	bh=EAsGt2EqyVTOElAZitReGYYY5iRcKkQxdM7stcUnkZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJxIYwzhHJIwSmG/vEFZOIlrOcHvJ1vTFM3r/SHrb884UNadaOR0hz7GKy6o3BWareAzAHyljs+PBjRsrvIBG+8/60qPbsuDHhHExSNTHZ63AkXgNcd09FlSB1gLmHcF5IlU6Ix1+LfVgFQXSQKxIpd7W31weAnM0pvq5LGansY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JWtjuPLc; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JWtjuPLc"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso367694266b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740161281; x=1740766081; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0AG1owJnX9rC5c7qxcIfiTiPqKW23h3ZpuLUTgVKvNY=;
        b=JWtjuPLcEE68mCjlADxBYimC1bjbkJD1L9dJ7B4IPnz0C1MV72EwTRDbptGvzf0in3
         h7RhJzlNDeLxfL0wNWbSFGXMzKIkijBjy0Dued1i83IaNQeB5pSRkX4pM0H2dAWTCfu2
         ntsBpmClS/YRh09TjItJ7cx1lQP3toJVpzVaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740161281; x=1740766081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AG1owJnX9rC5c7qxcIfiTiPqKW23h3ZpuLUTgVKvNY=;
        b=EfqiKGn7H2brTBubf4GJwdfWUA92wFE1sWI4W8DKA7TezxOKSw7vmFKPOAi/m0b/9j
         pmepZ9kSujEOZml16XhQXxyXG6kxmw6jPfRMMw48M5fuEtaJ3Z9DW4JYJabC8zkws6Tu
         5ChYA6c3iuJiB1egMIg/osFSTp3PqIiZcuOlUmupLf3ssW8tMZTpQflWLIxuD7nwe1zc
         zsPCVxJGHJ2hOwLZgN8yOEDa4vbbSdiS4x9RNQ/DA/Q9YmOATZs8Z9fHIqo8BrXYmFjH
         zw6bzPPyIuhxFkkwPOFbLHmDgWBDzZrB5cT2blVWz/yX76Ovxy9GVvIKyNSHoP/zpVmz
         QqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx01C8QlyyMsQVIgktkIbSySC+eFbkdMAPPdXaPdni2MIEmIwmVSATTLT6nXT83S0L0qlGp/QmzUp8GCy/Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+bvTSPj5ID+ubSooqm/1HSzkzIcrVrd/1Z8x/mV2MZ8OZzon
	Lg6RE8UYh/UDxbjgDbNH3jWJWryMR9Rd7azl+ffwAOBTj6Tfyh7p1K8m1SXuO+XROWydCmgtd08
	qUmw=
X-Gm-Gg: ASbGncs3dltnR9APnroYAJTvSfgoxxYGcX+5wzb7/kjX3F+FMOFlYJXeJyGLT4o83uq
	4mKxwtAR6hdcbG57QHdFp+18N4m6TYZe6cASJ8ClTLht7YW1bQB2oUK/FsbSBM0SaysOHtT6S/3
	0fXhbHmFIzeI8s0vQt6mIOnwis3ZFpzA2ocTU+i5B2lrTf6gigourL5X1ahuPGZjOEw0LmOAIw/
	fGuS9Fxgz6iXuVwUIhQiPURrdzaFPRqU/+V/13IWXJhCR9nV00In7syPsNimv0fLhuAFiwNizKi
	+/+qs6lvi63jVzlzsCyMgKwSoOHN8Vj1ix/CHNc3q+2C8XxCpKlKRRnxQc29OgWqSwsewRe2yXV
	A
X-Google-Smtp-Source: AGHT+IE+S+on7M14RUEfxoXZ71obvj/k4Mk2PN86xodTl693YLuwxDqILKfqBJLUIu+4T61GRhQlxw==
X-Received: by 2002:a17:907:6d05:b0:abb:cb01:f3b7 with SMTP id a640c23a62f3a-abc0d988619mr389826866b.1.1740161281498;
        Fri, 21 Feb 2025 10:08:01 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbdf53d765sm508023366b.39.2025.02.21.10.08.00
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 10:08:00 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaeec07b705so384635466b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 10:08:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxoFy1EK0+OmsdP1o1hIIU8Td6w6fa7ue9rVSc++HyAYuBtZfCP9iHDbSNtkJNfMeFUBPYrm7Wk1Oq5xQT6w==@vger.kernel.org
X-Received: by 2002:a17:907:7eaa:b0:ab7:5fcd:d4d9 with SMTP id
 a640c23a62f3a-abc0de0e4d6mr364513766b.43.1740161280179; Fri, 21 Feb 2025
 10:08:00 -0800 (PST)
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
 <20250221124304.5dec31b2@gandalf.local.home>
In-Reply-To: <20250221124304.5dec31b2@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Feb 2025 10:07:42 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
X-Gm-Features: AWEUYZmQJ76LofvaADGYz9wDxturcIzFXn8JOYMJIs8qre83YpKfkEfOvP9lwxA
Message-ID: <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin Uecker <uecker@tugraz.at>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 09:42, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Because they are arcane and even the gcc documentation recommends avoiding
> them.
>
>  "Note that in general we do not recommend the use of pragmas"
>  https://gcc.gnu.org/onlinedocs/gcc/Pragmas.html

Yeah, #pragma is complete garbage and should never be used. It's a
fundamentally broken feature because it doesn't work AT ALL with a
very core piece of C infrastructure: the pre-processor.

Now, we all hopefully know that the C pre-processor is the _real_
fundamental problem here in how limited it is, but it is what it is.
Given the fact of how weak C pre-processing is, adding a feature like
#pragma was a complete failure.

So gcc - and other compilers - have figured out alternatives to pragma
that actually work within the context of the C pre-processor. The main
one tends to be to use __attribute__(()) to give magical extra
context.

Yes, yes, some kernel code ends up still using pragmas (typically
"#pragma pack()"), but in almost every case I've seen it's because
that code comes from some external project.

We do have a small handful of "disable this compiler warning" uses,
which isn't pretty but when there aren't any alternatives it can be
the best that can be done.

But *nobody* should design anything new around that horrendously broken concept.

> Actually, I would be perfectly fine with fixing all locations that have
> x < 0 where x is unsigned, even if it's in a macro or something. Those
> could be changed to:
>
>        if ((signed)x < 0 || x >= 10) {
>
> If they want to allow unsigned compares.

Absolutely #%^$ing not!

That's literally the whole REASON that broken warning is disabled -
people making the above kinds of incorrect and stupid changes to code
that

 (a) makes the code harder to read

and

 (b) BREAKS THE CODE AND CAUSES BUGS

adding that cast to "(signed)" is literally a bug. It's complete
garbage. It's unbelievable crap. You literally just truncated things
to a 32-bit integer and may have changed the test in fundamental ways.

Sure, if the *other* part of the comparison is comparing against "10"
it happens to be safe. But the keyword here really is "happens". It's
not safe in general.

The other "solution" I've seen to the warning is to remove the "< 0"
check entirely, which is ALSO unbelievable garbage, because the sign
of 'x' may not be at all obvious, and may in fact depend on config
options or target architecture details.

So removing the "< 0" comparison is a literal bug waiting to happen.
And adding a cast is even worse.

The *only* valid model is to say "the warning is fundamentally wrong".
Seriously. Which is why the kernel does that. Because I'm not stupid.

Which is why that warning HAS TO BE DISABLED. The warning literally
causes bugs. It's not a safety net - it's the literal reverse of a
safety net that encourages bad code, or leaving out good checks.

The thing is, a compiler that complains about

         if (x < 0 || x >= 10) {

is simply PURE GARBAGE. That warning does not "help" anything. It's
not a safety thing. It's literally only a "this copmpiler is shit"
thing.

And arguing that us disabling that warning is somehow relevant to
other safety measures is either intellectually dishonest ("I'm making
up shit knowing that it's shit") or a sign of not understanding how
bad that warning is, and how

This is non-negotiable. Anybody who thinks that a compiler is valid
warning about

         if (x < 0 || x >= 10) {

just because 'x' may in some cases be an unsigned entity is not worth
even discussing with.

Educate yourself. The "unsigned smaller than 0" warning is not valid.

             Linus
