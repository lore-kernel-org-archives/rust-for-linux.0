Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0218F2FC
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 19:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740251935; cv=none; b=JkiLV+CvOGBbsnWoSvrH4nAJn6M/H3yhedGSgrUJ5yVmZM+FIx5BFJThHZaq4V2P55xOLV+hWcRK8QGrPxmWmDHctsVxQdw0ANAuw4+hBzF/HjzP80GE7lTcBp2G7S5ri8KhL+rfHEmw/n43vUXooXRG/nSlnOHxhoee+KtZm+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740251935; c=relaxed/simple;
	bh=EzT1g5FwFw69UDBYQDzjBiLobs2dYIYvZzFfhBYPdIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/KAg5s5aWpJ+DCI2A57SVs3dKwZQ65GCvkmtD73cEBn/R67NTez2uJAKAkpHAYu/weqBkJdd1QlJwMkVwuvDLMJnBc9BKqQSeZzeVmheE6Cjsg8CrG3eRPfOZtpm5XeGyFrZxyE8dgbyKluRrTY0dZOJHnrPZ7AKONrrwys3Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Accz6j5i; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Accz6j5i"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab744d5e567so549346366b.1
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 11:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740251931; x=1740856731; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Xzl2/w9nsMmIh5i8j2sKE6LkAdctHwz3MFgW7DcHyk=;
        b=Accz6j5i8i6i46XbkwlMhQqI65hjjHBsb0eep0hlBetjkFcX+r7SknuMTGHPwdIHDJ
         azIP3PDuDT1oyu7tqSdwWI38LCmOtErJJpsUwJpCDb0PxCw4T5XKqvGvo505uojHoUuI
         2qIm8eJnEqMgg1ltqJQ0fb0nul5e8PZqm7xzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740251931; x=1740856731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Xzl2/w9nsMmIh5i8j2sKE6LkAdctHwz3MFgW7DcHyk=;
        b=ZfCWFqbgt8H76S6JRmXdnflHP+dRXLrbIINw1Y2UMP+wFuNm9IWhqcT5igcu3PJtm0
         Rff0Ic+1zUfnpPMZQnjY23ftMoJUYn5VG4uKiptrrwAGM7URKee+w/hXUlJSjmuluLNi
         DtmiHRQ/USShJE+cPObRRds3EGy2l2zWm3h0s7G+EdOb7xbXtPS8CsPgUyC9uqj9k2St
         KOaPGRime/hoXQdzqVczx4DNSNDW4hFZ7COwCH85fI8Hd3b3r0SJRePSzPgIFyTi27bv
         FzacMkFL61j9e5XRu3G/PPnXBHmh8YJs+ZAcKwpZhK6eawMqHdsP1Jxiq+4vGMDVXBqg
         QTjg==
X-Forwarded-Encrypted: i=1; AJvYcCX5hCj0fvA3ifuF+h1DxskVNIZ5+6zEUV+6PEHez9Mf5Y3JPyORIiWLt7zKPamnsWkRd2L9ejhfRSvRztluXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztwFCKri8axXYX6LW0B8S8o1qNYGjXmap489GMkg1/DVcaX640
	uWoEnIT4FjUD618rV1toxJmi7piDWK55aPGL5yNnkhRazTo0LajZI908WmoWPI81A8I7uQygYGY
	av1o=
X-Gm-Gg: ASbGnctsfqm/mEsu+IWoeP7iHYZhwJDoyMMZs0KN/pkBPzBk7fWHQE3VirjyTnNVtU2
	ee6IoXcEeBEOIc9KHOjrL0QEsiqTz5Roi6bfRklCVouxQ07qNbSplCF8seTGaDu775hKs/IdpUz
	PIA6m317OmmEkR10KNf73vqTX90mzTsc3PDyPwUor7cBvtQWW/WqfnfiwpHuLJIhWDcDlnAjlc5
	n44J7mzZn1xGohCVuNYjqFeA406FBy8uld1KFe2ddUxZxM1FE25JoETBlY3aHFZm5pRMKB28vVr
	dla8ufy4BjdKRkZABVeAolcUyVzoEGucpEu8N7bJGc/mvTI6pnkXrEZ5GKgInfURxCfd9hfaac7
	I
X-Google-Smtp-Source: AGHT+IH4B4pV1cDbCvNifa1W6/p8qBVj9K7Gnoqtj5+x/Lcg36rwXyN8vQpR6yf8AC41AleC+2bggQ==
X-Received: by 2002:a17:907:780e:b0:ab7:798:e16e with SMTP id a640c23a62f3a-abc0ae91168mr661931266b.15.1740251931216;
        Sat, 22 Feb 2025 11:18:51 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53232039sm1889559766b.9.2025.02.22.11.18.50
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Feb 2025 11:18:50 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbdf897503so715341566b.0
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 11:18:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0dhKts8uIT1x9t/7JJ2z5E9ZNUhkhwNYiJs/sbXrnRn7M4Nd2hb/oChUO6L1eoOD61QoBBaUYTHG6n1hEIg==@vger.kernel.org
X-Received: by 2002:a17:907:7744:b0:ab7:d34a:8f83 with SMTP id
 a640c23a62f3a-abc0ae94ed6mr697861966b.17.1740251930006; Sat, 22 Feb 2025
 11:18:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
In-Reply-To: <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Feb 2025 11:18:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
X-Gm-Features: AWEUYZnYn9FC1D3iPga4e5fosxwJzgzYfFpxBBvQVXYxwhFF0dkV8v7eiQuqia8
Message-ID: <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Feb 2025 at 10:54, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> If that work is successful it could lead to significant improvements in
> code generation, since aliasing causes a lot of unnecessary spills and
> reloads - VLIW could finally become practical.

No.

Compiler people think aliasing matters. It very seldom does. And VLIW
will never become practical for entirely unrelated reasons (read: OoO
is fundamentally superior to VLIW in general purpose computing).

Aliasing is one of those bug-bears where compiler people can make
trivial code optimizations that look really impressive. So compiler
people *love* having simplistic aliasing rules that don't require real
analysis, because the real analysis is hard (not just expensive, but
basically unsolvable).

And they matter mainly on bad CPUs and HPC-style loads, or on trivial
example code. And for vectorization.

And the sane model for those was to just have the HPC people say what
the aliasing rules were (ie the C "restrict" keyword), but because it
turns out that nobody wants to use that, and because one of the main
targets was HPC where there was a very clear type distinction between
integer indexes and floating point arrays, some "clever" person
thought "why don't we use that obvious distinction to say that things
don't alias". Because then you didn't have to add "restrict" modifiers
to your compiler benchmarks, you could just use the existing syntax
("double *").

And so they made everything worse for everybody else, because it made
C HPC code run as fast as the old Fortran code, and the people who
cared about DGEMM and BLAS were happy. And since that was how you
defined supercomputer speeds (before AI), that largely pointless
benchmark was a BigDeal(tm).

End result: if you actually care about HPC and vectorization, just use
'restrict'. If you want to make it better (because 'restrict'
certainly isn't perfect either), extend on the concept. Don't make
things worse for everybody else by introducing stupid language rules
that are fundamentally based on "the compiler can generate code better
by relying on undefined behavior".

The C standards body has been much too eager to embrace "undefined behavior".

In original C, it was almost entirely about either hardware
implementation issues or about "you got your pointer arithetic wrong,
and the source code is undefined, so the result is undefined".
Together with some (very unfortunate) order of operations and sequence
point issues.

But instead of trying to tighten that up (which *has* happened: the
sequence point rules _have_ actually become better!) and turning the
language into a more reliable one by making for _fewer_ undefined or
platform-defined things, many C language features have been about
extending on the list of undefined behaviors.

The kernel basically turns all that off, as much as possible. Overflow
isn't undefined in the kernel. Aliasing isn't undefined in the kernel.
Things like that.

And making the rules stricter makes almost no difference for code
generation in practice. Really. The arguments for the garbage that is
integer overflow or 'strict aliasing' in C were always just wrong.

When 'integer overflow' means that you can _sometimes_ remove one
single ALU operation in *some* loops, but the cost of it is that you
potentially introduced some seriously subtle security bugs, I think we
know it was the wrong thing to do.

             Linus
