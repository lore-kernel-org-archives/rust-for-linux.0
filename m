Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125074A21
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388705; cv=none; b=KzSFGIddPDXPsDWdDEVd8RQRuU814hpUWkj7vKtHzdUtZzEhRggg88spOV9kV0Ue8D/gG8uTciasmof+U5xRwZ7K/TepOyu/P2COCHkTgZSKpSJ2DpgYBZcuMiz/DauEjbUf1BzeMKB+KZx6jm00+IF9JcduxZZs7yOqyFs7Px4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388705; c=relaxed/simple;
	bh=TpmJTEOgQOHM9HmdS/G5PTDNlrGN/J8csNvsXEYpiFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mF2aIa4Z/ONke/O3es6Y4PqMlLBkXG0oaNJpMEJJZLOlEv/Dlq8trcDtfQU67Js73WI3nlx0mWggCD55RAYRVigGG0hBSR86uSFyrLgDuOfSwZNb5c6174DkhWqogW06E/WTsKRlkV4MRRO/di2g9VEWFk22uTdj+m1/E6eQQWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=H7bFykcs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="H7bFykcs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a467d8efe78so551671266b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711388701; x=1711993501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sd/wp9UpBSQuIXx6uQdvepokZABl7yLFwM775FKBHzQ=;
        b=H7bFykcserJ5cGU3RMufzlfQFC8FF2NhXcdeQJzj825g8dMPPYchUeKeKMwUPHkqO+
         VvLA+1PpVES5qmEoH69NHwBsIDT+M0Fve9X+2kyfIUvfMYKo0qBieY/2oK2gGYhmu4QS
         VEMKhJaZwy3Sa/Di3yMnhMw4+D1GxvE6qj0NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388701; x=1711993501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd/wp9UpBSQuIXx6uQdvepokZABl7yLFwM775FKBHzQ=;
        b=aQfqmJijbF3MGYpaZzMu+gbbhavXeKhXJtb3OPejPmvorDV8A+61eN0BNpFYNCXEvP
         xAK8ezHb46RhyAO1R4IKw2oKnj/JD/leRKHlekhVxS9RH1g/ul5Y5A/8ygmAGtuPu0YJ
         uDKsVamneAvw7PZzR4d9Y4rwDCap7VqawwRWiZDBETmOHbraJaxBxB1BV+klCVlN67Pr
         Mzf67KpsJl2qMhUWz1yIUSoplDFLgdVt/ZP76DlKd1Tgl1LF1YFhphzbd2C1T49/iowK
         XpODGclUQzXq0I8y9M14BLBI/1hiG1t5BN8vLuiLJnDjKNX5mNKld1zb1WLkKK5eCkIV
         yW/w==
X-Forwarded-Encrypted: i=1; AJvYcCXoiGEzpaDXQCPC2Z7bkb7B4HYx/Pwfu21dq5pe9nb/C5DrRd9JsRfrStRs3UaaZsc4F3lHhmECQmda4uUslNLPVNR+flrivCGKs3ks/Uk=
X-Gm-Message-State: AOJu0YzL4DeqHYu0kUwYSO6Ik/a7d8iZsa2aRm3nZuEllgZ/fNU66H9A
	aL+u6zqCin3isH9VtR/kKBa4MWM9YhtqVYXvuxmNXupi/Q3dGt0nncbeuiJCPzaTwarWQW40Z0t
	aSCGYqg==
X-Google-Smtp-Source: AGHT+IGJgXIGAZe4bEQKN2Uoj6A4YEgqs5um+X8HQ99yGHo6a3qxscGHRs1wLFvoDwQwSsUhd7s7RA==
X-Received: by 2002:a17:906:4a56:b0:a46:9b7c:c962 with SMTP id a22-20020a1709064a5600b00a469b7cc962mr5625424ejv.47.1711388701104;
        Mon, 25 Mar 2024 10:45:01 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id bh9-20020a170906a0c900b00a461b1e814asm3268821ejb.130.2024.03.25.10.45.00
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 10:45:00 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4a3a5e47baso134147866b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:45:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAqoC/41p0oyOYd2PQqgdsuYvuG99aothhqbRUQ7ruwj2mtulkTZM4ZL7FzQpnIkWWEearbMu3XUcsvpiZWFNOtsDapjpj2MSgiR9JGxo=
X-Received: by 2002:a17:906:6dc4:b0:a45:94bf:18e6 with SMTP id
 j4-20020a1709066dc400b00a4594bf18e6mr5614781ejt.73.1711388700462; Mon, 25 Mar
 2024 10:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
 <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com> <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
In-Reply-To: <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 25 Mar 2024 10:44:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
Message-ID: <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
To: Philipp Stanner <pstanner@redhat.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 06:57, Philipp Stanner <pstanner@redhat.com> wrote:
>
> On Fri, 2024-03-22 at 17:36 -0700, Linus Torvalds wrote:
> >
> > It's kind of like our "volatile" usage. If you read the C (and C++)
> > standards, you'll find that you should use "volatile" on data types.
> > That's almost *never* what the kernel does. The kernel uses
> > "volatile"
> > in _code_ (ie READ_ONCE() etc), and uses it by casting etc.
> >
> > Compiler people don't tend to really like those kinds of things.
>
> Just for my understanding: Why don't they like it?

So I actually think most compiler people are perfectly fine with the
kernel model of mostly doing 'volatile' not on the data structures
themselves, but as accesses through casts.

It's very traditional C, and there's actually nothing particularly odd
about it. Not even from a compiler standpoint.

In fact, I personally will argue that it is fundamentally wrong to
think that the underlying data has to be volatile. A variable may be
entirely stable in some cases (ie locks held), but not in others.

So it's not the *variable* (aka "object") that is 'volatile', it's the
*context* that makes a particular access volatile.

That explains why the kernel has basically zero actual volatile
objects, and 99% of all volatile accesses are done through accessor
functions that use a cast to mark a particular access volatile.

But I've had negative comments from compiler people who read the
standards as language lawyers (which honestly, I despise - it's always
possible to try to argue what the meaning of some wording is), and
particularly C++ people used to be very very antsy about "volatile".

They had some truly _serious_ problems with volatile.

The C++ people spent absolutely insane amounts of time arguing about
"volatile objects" vs "accesses", and how an access through a cast
didn't make the underlying object volatile etc.

There were endless discussions because a lvalue isn't supposed to be
an access (an lvalue is something that is being acted on, and it
shouldn't imply an access because an access will then cause other
things in C++). So a statement expression that was just an lvalue
shouldn't imply an access in C++ originally, but obviously when the
thing was volatile it *had* to do so, and there was gnashing of teeth
over this all.

And all of it was purely semantic nitpicking about random wording. The
C++ people finally tried to save face by claiming that it was always
the C (not C++) rules that were unclear, and introduced the notion of
"glvalue", and it's all good now, but there's literally decades of
language lawyering and pointless nitpicking about the difference
between "objects" and "accesses".

Sane people didn't care, but if you reported a compiler bug about
volatile use, you had better be ready to sit back and be flamed for
how your volatile pointer cast wasn't an "object" and that the
compiler that clearly generated wrong code was technically correct,
and that your mother was a hamster.

It's a bit like the NULL debacle. Another thing that took the C++
people a couple of decades to admit they were wrong all along, and
that NULL isn't actually 'integer zero' in any sane language that
claims to care deeply about types.

[ And again, to save face, at no point did they say "ok, '(void *)0'
is fine" - they introduced a new __nullptr thing just so that they
wouldn't have to admit that their decades of arguing was just them
being wrong. You'll find another decade of arguments explaining the
finer details about _that_ difference ]

It turns out that the people who are language-lawyering nitpickers are
then happy to be "proven right" by adding some more pointless
syntacting language-lawyering language.

Which I guess makes sense, but to the rest of us it all looks a bit pointless.

                  Linus
