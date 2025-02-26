Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB8218591
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 21:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740604494; cv=none; b=N/rgSxtMLvNdYCzDfYiU6pZOYTaZyqT+x9Xfy+XljBUxPs28gyGpZBDV9DVzL/87RjXx3gfHR4n2wWVh5QXpSEoLb0GQx9526X90pSIlFKzFC0Ra6yM2ihlnQctWn0Lq7chUJTfKhHjDC6pXhDoJoImUPzxrW/drC1djMdJTE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740604494; c=relaxed/simple;
	bh=A5PaH4enkrbYDM7nXZ+Ass9AMQsZEd0mjSntP6Y0BCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYuTEVc5JwnuubrzZV0MsqWE+mJ/fV8tZ2WIi0xWBaAB4k6xRMw8OgdOjEvTHTTQ7FiC/iCol+6QpT0qEREKQANi/wgG6lLE+rWIlSQwF5Gv18UcbacM1Ln8SicGx/hU9z8fcKTBO1RB48LE1McO9XV2P8SnJJpdnTF9psgegnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=e6Wh99xZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="e6Wh99xZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb9709b5b5so31311066b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 13:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740604490; x=1741209290; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=plHH0IcN9eXsv1E/PqFvNYQwN4wb6pcqv5JKjVIOwQQ=;
        b=e6Wh99xZy4b90Q7DpKTPbyuSmDUmu9yj7VwowMLVb5okQdwTa902MfT0aJtgRdzC6n
         YUO55/NUwkTR+rM4OxQmDuk8ZToyZJ7v+AkrAiVf2nc6CxLzMUKW7Mcd/5YfwWSmjGvK
         +DUFBEEIWThdKd8WUrn58nt6gMC1YgdGjEZXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740604490; x=1741209290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plHH0IcN9eXsv1E/PqFvNYQwN4wb6pcqv5JKjVIOwQQ=;
        b=id3MGXwk/cgTAHj2Kha0DT9EQOEM+j9nfC6jfEfoKZcLaOk9gep3k+DdPDQXFIyrv1
         1FnwghVEa/xHV/jiA9SEPJLE0FgUgt9y3cF/QgG5gR6dCLkOSntlkhrcrMCOwQPLbNv8
         F02sLsysKY8FA8QsbjPUXSrF73nFyQpf/WhmPfYBa3wCnqhe0Gljoy/t/r54KlKtGCyY
         A0jWvp1ywD762+geClv8csaFX3ckBXWD08r0VYka7AP5mL0Tzk6CzmyfEffWbZie53Mo
         /jWlFDA/JZSbB8f+JQHk146X0YmWh1mYq8L9ouSlPOXKcSiDNy6CyaUZ2iVsA1uIvHha
         +V/w==
X-Forwarded-Encrypted: i=1; AJvYcCWV9b4F1uRmck1MQMVovZ9Xmu7d+kdiJpyDWObEVyd9YhArLDbzLY3lK+RnbjDga/Bh51KS5AglExpTi6Ilkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykWmQErZ4qSu5WI9zylmV5TAWrTI/aHyH/S3nQvAo0vdv2zgPa
	VN2ps/+bamnbE6lc18fbVzK6138tWwzxh0QlhhX1n+Uvk9zIllrVZupBqw8YmhrUcXchsPePnxZ
	iOPjXng==
X-Gm-Gg: ASbGncu7ZQ46XHQRgmTdlrEGzNx5WGTkKrXX6pUXSJAbn7dQzB9mh/bwusuVG83Tc+4
	jT0L0EypYYuECCxMkWfcYw9k0o1iJNduz4r2I8r1y5ML0ndCJ766cLS3W3wbNGZdE6yR48BddfM
	lIlLjAE6m2jObVWT4JMvwa2/VB9lguDsKgrA+igQ3HlNngraBRg8XtmmRQK6EnrT8hB4AHBxI08
	pUqymjqcrkV3fETFiuWXmCrf5MWf5aq4jnwofTscYa9iBQDmTgFPCem/lSz2R+sugC7HSclvbdl
	t2RAlsCDvIJpGo0kZ4oAVhQ7cellKwyUKykwyaU8JHcykguTGaQd1DcH7AQdFhccpBmHNcHDJ9W
	F
X-Google-Smtp-Source: AGHT+IHb0PXxSyXPGYW58vtCeprYKT013nItsepMI/MycXZjHokYDZGEoFvD4P9IHhWE4WBinRpHvQ==
X-Received: by 2002:a17:907:988:b0:ab7:6c4a:6a74 with SMTP id a640c23a62f3a-abed0cc4e16mr1142979266b.16.1740604490340;
        Wed, 26 Feb 2025 13:14:50 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0ba408sm5932766b.37.2025.02.26.13.14.48
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:14:49 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abbd96bef64so32648666b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 13:14:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVS9BvBKbl5zd5bMHXzAeXYNk+6+1vIDskiKV+4TZgumJrZ3Mk+GuVLyCU9NwpLo+Srk6g+6DOyT/YDONecZw==@vger.kernel.org
X-Received: by 2002:a17:906:3150:b0:abe:c894:5986 with SMTP id
 a640c23a62f3a-abed100adb1mr883763566b.39.1740604487746; Wed, 26 Feb 2025
 13:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
In-Reply-To: <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 13:14:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jq-snYj9HKjCJh9QYG9k368Ub3WE-vsH9QCuPSV36deSRojSaVqyhZUuTw
Message-ID: <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Martin Uecker <uecker@tugraz.at>
Cc: Ralf Jung <post@ralfj.de>, "Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 12:00, Martin Uecker <uecker@tugraz.at> wrote:
>
> The model is exactly the same as in C.  One defines "observable
> behavior" (to use C terminology) and compiler can do whatever it
> wants as long as it preserves this.

The problem really is that memory accesses (outside of volatile, which
is defined to be a side effect) aren't actually defined to be
observable.

Yes, yes, the standard _allows_ that behavior, and even hass language
to that effect ("The keyword volatile would then be redundant"), but
nobody ever does that (and honestly, treating all memory accesses as
volatile would be insane).

> As Ralf said, the difference is that Rust makes it much harder to
> accidentally trigger UB.

Yes, but "accidental" is easy - unless the compiler warns about it.

That's why I basically asked for "either warn about UB, or define the
UB do the 'naive' thing".

So this is literally the problem I'm trying to bring up: "aliasing" is
defined to be UD _and_ the memory accesses are not defined to be
observable in themselves, so a C compiler can take those two things
and then say "you get random output".

THAT is what I am asking you to consider.

Pointing to the C standard doesn't help. The C standard GOT THIS WRONG.

And yes, part of getting it wrong is that the standard was written at
a time when threading wasn't a prime thing. So it was somewhat
reasonable to claim that memory accesses weren't "observable".

But dammit, doing things like "read the same variable twice even
though the programmer only read it once" *IS* observable! It's
observable as an actual security issue when it causes TOCTOU behavior
that was introduced into the program by the compiler.

So I claimed above that treating all memory accesses as volatile would
be insane. But I do claim that all memory accesses should be treated
as "USE the value of a read or write AT MOST as many times as the
source code said".

IOW, doing CSE on reads - and combining writes - when there aren't any
aliasing issues (or when there aren't any memory ordering issues)
should absolutely be considered ok.

And doing speculative reads - even if you then don't use the value -
is also entirely fine. You didn't introduce any observable behavior
difference (we'll agree to dismiss cache footprint issues).

But if the source code has sa single write, implementing it as two
writes (overwriting the first one) IS A BUG. It damn well is visible
behavior, and even the C standards committee has agreed on that
eventually.

Similarly, if the source code has a single read, the compiler had
better not turn that into two reads (because of some register pressure
issue). That would *ALSO* be a bug, because of the whole TOCTOU issue
(ie the source code may have had one single access, done sanity
testing on the value before using it, and if the compiler turned it
all into "read+sanity test" and "read+use", the compiler is
introducing behavioral differences).

That "single read done as multiple reads" is sadly still accepted by
the C standard, as far as I can tell. Because the standard still
considers it "unobservable" unless I've missed some update.

Please do better than that.

              Linus
