Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D322A4F3
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592805; cv=none; b=QtkUygIZBhJDcgiU3DOtneRyFoY2ic7Odq6m9fN1oyNJ5yHOYjMirJr53iY/2bk89ge4MVkBXwqu0fB9mQaO9EydEpCMrNFlVQ7KVQqMe67WI+CeZJBnWW+3yaX322KLKgRJphLUBemK3F/8E4yLUyMoRyR+dddpADO7nPKkUcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592805; c=relaxed/simple;
	bh=OcHOvGQB/t3qwwXBib/RirE/KtrFLYIGCcrfx/cQcj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imHIaYwaLbI7e95pk3bwbmzq/lbT/wGRCwZ87a1g5hQCKH73CHMmcwwnQn3/lAfFEoICjR1ZkobvoJYQnyWuIm2htzs3z4FoHdnILn2n/Q1jTeq/r9rQ+uhzPR52Kr1gNT1KMTQADRYwvYsyHodxcL0CAC/N8DDlAOLImXEqKwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=X70DgwB2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="X70DgwB2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so12741976a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740592801; x=1741197601; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2pF5VtPLvizqkjhJdWgYLaGhWqd4Ef/Qdw8QfNuuuk=;
        b=X70DgwB2ur1Z70svgW0YFv6J+YVxsgj4U9lixgzuZxnl9/oJ8DlD4HcsxbZjorjEX2
         VhdNQpn6XcNoh8NS/tjGhcjgtlp40HZprmVkkzleIaTVNVsjI1NjcXVpdmuqI+UXapmO
         YbsBo6c/OTUPU9Mg1pv5mYIbXjHmZdh1L+4yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592801; x=1741197601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2pF5VtPLvizqkjhJdWgYLaGhWqd4Ef/Qdw8QfNuuuk=;
        b=aaSNiNIXZ2xlipxX1ILqWTff/PSx9LOI0SL4+KYPCKhRprNcsAGXzPMg4eA9FtMSgH
         wpxrzurKHfe6FtGbnvNZYzGnnZqcY9EdbLI3xcO3w+ZxxKVbp3bR8/uhQgJ5RWJmPole
         8SMIJvoBc7E0WwKEhHGnpmkfLoBQLlvWig6hgi6omDOjwdrTPduUtPTvShRr9GoNZSuA
         +KM1Ddslccs4yb9IEi32DefB4Bl6Cfxk1thg1xnphQzo77lyjaBv0MzzsGj5l5JGcU/6
         0k3x45gcwR+t3yHafwUvT1pfhCEXqPobeVCglE44MdrzwPWxpoICHvzYN2y2k+obuYMR
         glsw==
X-Forwarded-Encrypted: i=1; AJvYcCWoQQPDnjV0Hx2gW/7Ku3QHJQ9nxWpcKgoLrgzcch5tSKhd2CjjWdtw+QplF2Prr/zxIDwVNzANYtT8mOOnCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvxfhflee7pwpIAiGUmV8aPROuRXgdC0lvpCdUBy/u3Ry0PB5W
	8eSN6DoKD4v9UTZnxsnPTBm/DjvxZ4dNxfQAzpFxXyCY95gTR8BOZNzqsmpLA/NvkERaQVyTRHI
	sblQ=
X-Gm-Gg: ASbGncvQgAdC0l3ABlHW3iThYMjfiYGJLQDSt1tkRd233ymJX7XK2XMjeFbWFsmRgM4
	t2iFQ6oGzfD+00aV2Rp9/hxhPkalrMvOCTUMDbjoEzpejJiGqCspyq2itDEkqUoIWXTMIkcaT8O
	cD2sgVEZZLUbmAjzCZW+A928n1vZN6JDw7B1Bh9U56N8rOdTyoa+uFQh0wrys6SdmVgGouNP7hw
	pdZTAWA1hVVSnEiBbn90yXwwPB8zMeR98q6V0z4k6wrfQPR9LZMu5+/Jrd9ljeDg2pI8/VyNEtE
	JMJCXwXYkWEPQi2urS79pyWqROFiCeMZOThR/SQ3nWL9SgDg+KwWDYgFgMcEYGtas05vUdkE3yb
	r
X-Google-Smtp-Source: AGHT+IHW3pluHvZkBqG0ap3s+GhgRLaQtnOcVWmyDXm4FPmep7YnqvIMew8H4P0yeKNgwafZVYx3+Q==
X-Received: by 2002:a17:907:7d89:b0:ab7:d6c:5781 with SMTP id a640c23a62f3a-abc0da36233mr2761865166b.24.1740592800664;
        Wed, 26 Feb 2025 10:00:00 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1da35absm365559266b.84.2025.02.26.09.59.58
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:59:59 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7430e27b2so1103713666b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Feb 2025 09:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXX/jvYfow9rJC6Z1LBZd0oDi9HzP25i4Zv9VyesQ4rFyAZDJLylGXKa+H2SMhiDSkYuF2faBY6wxuuMVDDIA==@vger.kernel.org
X-Received: by 2002:a17:906:308e:b0:ab6:511d:8908 with SMTP id
 a640c23a62f3a-abc0de19516mr1960252766b.40.1740592798401; Wed, 26 Feb 2025
 09:59:58 -0800 (PST)
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
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com> <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de>
In-Reply-To: <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 09:59:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
X-Gm-Features: AQ5f1JqHaF8iBdXsZjiLGeP-Wg76QW9xhjWAhICZNldwiZDCjoY2SKOw5r5wwWM
Message-ID: <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Ventura Jack <venturajack85@gmail.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 05:54, Ralf Jung <post@ralfj.de> wrote:
>
>      The only approach we know that we can actually
> pull through systematically (in the sense of "at least in principle, we can
> formally prove this correct") is to define the "visible behavior" of the source
> program, the "visible behavior" of the generated assembly, and promise that they
> are the same.

That's literally what I ask for with that "naive" code generation, you
just stated it much better.

I think some of the C standards problems came from the fact that at
some point the standards people decided that the only way to specify
the language was from a high-level language _syntax_ standpoint.

Which is odd, because a lot of the original C semantics came from
basically a "this is how the result works". It's where a lot of the
historical C architecture-defined (and undefined) details come from:
things like how integer division rounding happens, how shifts bigger
than the word size are undefined, etc. But most tellingly, it's how
"volatile" was defined.

I suspect that what happened is that the C++ people hated the volatile
definition *so* much (because of how they changed what an "access"
means), that they then poisoned the C standards body against
specifying behavior in terms of how the code *acts*, and made all
subsequent C standards rules be about some much more abstract
higher-level model that could not ever talk about actual code
generation, only about syntax.

And that was a fundamental shift, and not a good one.

It caused basically insurmountable problems for the memory model
descriptions. Paul McKenney tried to introduce the RCU memory model
requirements into the C memory model discussion, and it was entirely
impossible. You can't describe memory models in terms of types and
syntax abstractions. You *have* to talk about what it means for the
actual code generation.

The reason? The standards people wanted to describe the memory model
not at a "this is what the program does" level, but at the "this is
the type system and the syntactic rules" level. So the RCU accesses
had to be defined in terms of the type system, but the actual language
rules for the RCU accesses are about how the data is then used after
the load.

(We have various memory model documentation in
tools/memory-model/Documentation and that goes into the RCU rules in
*much* more detail, but simplified and much shortened: a
"rcu_dereference()" could be seen as a much weaker form of
"load_acquire": it's a barrier only to accesses that are
data-dependencies, and if you turn a data dependency into a control
dependency you have to then add specific barriers.

When a variable access is no longer about "this loads this value from
memory", but is something much more high-level, trying to describe
that is complete chaos. Plus the description gets to be so abstract
that nobody understands it - neither the user of the language nor the
person implementing the compiler.

So I am personally - after having seen that complete failure as a
by-stander - 100% convinced that the semantics of a language *should*
be defined in terms of behavior, not in terms of syntax and types.
Sure, you have to describe the syntax and type system *too*, but then
you use those to explain the behavior and use the behavior to explain
what the allowable optimizations are.

> So the Rust compiler promises nothing about the shape of the assembly
> you will get, only about its "visible" behavior

Oh, absolutely. That should be the basic rule of optimization: you can
do anything AT ALL, as long as the visible behavior is the same.

> (and which exact memory access occurs when is generally
> not considered "visible").

.. but this really has to be part of it. It's obviously part of it
when there might be aliases, but it's also part of it when there is
_any_ question about threading and/or memory ordering.

And just as an example: threading fundamentally introduces a notion of
"aliasing" because different *threads* can access the same location
concurrently. And that actually has real effects that a good language
absolutely needs to deal with, even when there is absolutely *no*
memory ordering or locking in the source code.

For example, it means that you cannot ever widen stores unless you
know that the data you are touching is thread-local. Because the bytes
*next* to you may not be things that you control.

It also *should* mean that a language must never *ever* rematerialize
memory accesses (again, unless thread-local).

Seriously - I consider memory access rematerialization a huge bug, and
both a security and correctness issue. I think it should be expressly
forbidden in *any* language that claims to be reliablel.
Rematerialization of memory accesses is a bug, and is *hugely* visible
in the end result. It introduces active security issues and makes
TOCTOU (Time-of-check to time-of-use) a much bigger problem than it
needs to be.

So memory accesses need to be part of the "visible" rules.

I claim that C got that right with "volatile". What C got wrong was to
move away from that concept, and _only_ have "volatile" defined in
those terms. Because "volatile" on its own is not very good (and that
"not very good" has nothing to do with the mess that C++ made of it).

              Linus
