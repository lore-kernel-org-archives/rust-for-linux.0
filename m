Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8073E32A3D7
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437942; cv=none; b=nVdVOV9CvSsB8oMruxYP3BYoBePeqFyo85RKUCIX3kCNhjkIwtRvHZe5Yv6m+97NBGnadSSRc5eNXMpUZ/0Wq+YI1I8kPJ/jaiu8w4laT52uvRG3c3NGL7zA3jnT4Y5xux/bIWSIYVRVK9aoYGcYMiUOjjwL/OCtVgAf/zkpR68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437942; c=relaxed/simple;
	bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZimXn3eBCCTU70PrBCRZ4ibJq4FRW4FxmRt7KMoNT+reQCm9KQkVQ+snz0cdvZ5X9PpgPaRnPT5SvNe2kRjEfcv8CFfiznvj34svmwAIUIASSJ+12Y955wPculK/y8Kh+NkabptyQHRZ+O5q9YAWP8Cf/1FNzI/Ob4AaVJ8Vv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQHgqusb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQHgqusb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24cb267c50eso8817695ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757437939; x=1758042739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
        b=RQHgqusb43uEsiz/Qq24KeTT+MdFr5ccsOa9UTnWOOLEk8F3LVY2TglbSVdpWqvVWl
         NtfHKVZAs/i/OZDclB+jYnRKTuHEN82chf6QE/eOpdGIDn8u0QqhGXuwG8aBA4Okj95P
         zdG72TH6jETBVDLZ6tZzWKYSGL5+m23FW3FavHe/pSLojZiEilhaotgrP4RszInAB9gg
         CCFlud/LUeIiJ1owocLE2Qib3QaOlGKYEYyk6+vDYrz5LB0+6CsiPZa7xZqvvibQScbr
         Yd8qOrmIUhXp2s22rez+UIMXsixe/nrp119PbSIjktxN2lyU6qKDMo2M33HI+1B/lHyA
         Fi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757437939; x=1758042739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZl9KmUTOudQy15/vr3pLhP7rnPAj40pW4802s5NWJg=;
        b=wE8WTI6xAzY7zL2xQjZ/qFDliStNhnyeIaTYXwviqTtAXHqyRk3sVRqHxl79qM3wHY
         LPgnk2jO3VmWbM8RBRWyYXtnIksPtYVJRR/+Hmm0uBV6HrnJu272W3C8Tc2QY6P4jIoe
         jihoI6IbAA2IuvE9idTnRW2ai77Lk0NJwTvJNdZcbVqqAqZhWe37SqpFIfSTs49/LBSd
         pIxYFYc/wnSz20+IXLY/6EmHPc/rQEer9clysd/aDd0uK5leKGrADPZZ2Di93VX9T5g7
         gb1EWEhMwXsxktfbk54YLoowc+LXRoqBKchBPfuRbUed6V7iawoSZqYBDy2H7uI0CAHg
         A1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWZOrt9ssCezsylkxicfFPnUw4ZPNMCKMIVSTzAPMcev+UFmS4k7OMfs1o6gWl0PW9BIn2mSGU63Uak5EUAoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AcSXtAotyPyPV1TGS9v9xq73edoo5P9oMOiUjys4/dpmGDOk
	0leiPDumajChUi3ZV1m1ZM73C55c3OUYngRBeeijRYkT4mYq4kiTXEeVxo64MbRgVP6i04H92M5
	LoPL40wPqKzuFP4ekLINMcbepXAp6WUk=
X-Gm-Gg: ASbGncuznISx7oMBklF0+nIVzFZu7uHoyGCm5jDu9XSh4I8/MY5AbHHvDOdhAuaUTP8
	KFnrfim8U4LD7vLHiFikLVRuU3SjamM0TtFmhv5vAz836l0Es84R3v+FJYbxSyJJYavkZz2AGFs
	uAmClstAxmUzlpai4HKsKyRhlIwmimW/LVZwbqFl2tOCoPW1MkVLdA0E5Mnv9203hjSGnxu6UFu
	bI/CJ/SZD6GdsMiaKpEQxCFHmw718T0RgZclIa9vUfOHay6js1GCE/wewlEjtYscN6knCDJwnNq
	udDVlRx+CAZfjgIT/EU7ZdcB+A==
X-Google-Smtp-Source: AGHT+IHd4zHzKJHiSaDYt+fas3wn4v2M9LloxztcReggEbdZvs7nvGHlisZ6Va1BAVyt7RDoMvRIKgyRryjYrTxDWWk=
X-Received: by 2002:a17:903:1cc:b0:248:a01f:a549 with SMTP id
 d9443c01a7336-251771d5b61mr95742675ad.11.1757437939384; Tue, 09 Sep 2025
 10:12:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
In-Reply-To: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 19:12:06 +0200
X-Gm-Features: AS18NWAUC9KOXLRVuptzGWpY6jU98Yraxc-lyvHQvj-0Ea4KpP1HNw-UevG-aP8
Message-ID: <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 6:55=E2=80=AFPM Asuna Yang <spriteovo@gmail.com> wro=
te:
>
> The separation of get-rust-bindgen-libclang script is reverted based on t=
he
> concerns raised by Miguel. However, it's worth noting that we now have 3
> different places rust/Makefile scripts/{Kconfig.include,rust_is_avilable.=
sh}
> where manually calling bindgen rust_is_available_bindgen_libclang.h + sed=
 to get
> the version of libclang, and in particular, for our newly added Kconfig s=
ymbol,
> we now use awk to canonicalize the version to an integer. I would still l=
ike to
> do the script separation later for better maintainability and readability=
 if
> possible, which can be discussed further later when Miguel has time.

To clarify, since this probably targets the next cycle, there is time
to discuss and get feedback to do whatever we feel it is best
(personally, I can take a look after Kangrejos at some point). Is
there a particular rush for this?

Having said that, this v2 looks substantially simpler than v1, which
is nice, and perhaps RISC-V wants to land it already. Up to them in
that case.

(I see the `ifeq ($(BINDGEN_TARGET),)` is still there -- in general I
would suggest splitting things if they don't depend on each other, but
it is not a huge deal. I would also probably have split the
`rustc-bindgen-libclang-version` into its own, but at least that is a
dependency).

Thanks!

Cheers,
Miguel
