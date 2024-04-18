Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA9E15FA6E
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713446287; cv=none; b=LgPAVPMajyzLMIpCSHopRZlVCku3lwWmSXERffYG0qoAwXzxHi9AsLDTedRq2JN7m47aUZWak77s1plig9H1J8OUOS+12JEqnil2LX7kir6TioAbv23zAcCFMIZO3iRJ3BxQYPQLWG8KYXNqHDWTSKOTD0Iq80TvZFXO9fvk3ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713446287; c=relaxed/simple;
	bh=g0lDcg5sk4wjgWLkv294Wu+ievcxVOJOIGYTzRJialY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaWWkeedzOCheNPHqv8SyMoUdl7T/r0Atuqc0d++6IQVtd5POfoog+UzjCjUF3XScA2Omvp4tDiRy6b04DeFtR9xaK177woF75O/62yMLHeVVCaw30f/3x8xpYVkGjI5IhXKmhZ3LB/Xq4en64JjZrqbNT9hP9YE/BwVhud844g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tFyHH5p3; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tFyHH5p3"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61ad5f2c231so9347647b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713446284; x=1714051084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNRbWAZ6Q5MqN+iLHn0qNU1jdPOPQHBoqFwuo6lZ8Oc=;
        b=tFyHH5p3JQxDb9pVBlV7RW8DnMEMtJSJTzWVUaWoBUQYgmr9G8wovoubNwfsbK1od3
         1Efg2QnShvFAC+csWW+nG7Zyq8/PfKJ5YQ4h/7GAkjF7RLdbqgc4OACUHzfOYYrw52DH
         /ZTqmcSzosWRqRdtUha3/eu3dnfB8z/UrS47uv/wiuHZdYz8BqcaJSHxcLrhIwL56mDD
         rH3w2zUdGC9yQLridnhBrOc1TAhUqCe2u0o9GGsdIYmVSLRW72J1wrPwcVrVLPkDIkNP
         MJczmmgYwVeM+J8zOCnmmS4hlDEeMaTo5c5VaVfsh6jwvVirJ2a23U/2yYDLfkPRtcL1
         bczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446284; x=1714051084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNRbWAZ6Q5MqN+iLHn0qNU1jdPOPQHBoqFwuo6lZ8Oc=;
        b=wBgByvTgCRobknqEtDbGkXY10033y8epitMS/PgGujVHtGmEHqUg1eS0vdVQra/LAd
         JrpAWI4jOevfAwgW0QLKE5cFBj672CZVs2PasXgIcLcYHkzQ7jfIHnGVVY05nKFTIgfE
         BUb+rze4L5OXazYP5Ru1nziw74ABW8qRIyt3m1lPVIi7uU1co6SyUTJRt4oJO+5aERio
         PErmoD5JTcbH0lczPiLdsLwotYp2+KLiz1EtXiL5oGvlvnCj/6vaJri6TDtCBMCLx6VN
         bAZPq8TZrckpiIpqIXNeSLp/iYbk9/z6PwakI9E8H3wAjceIkDEUwEktIjzcZwp2x+iM
         478Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnTfqBTK5/ixKDSYn+K5/YePCYS26NoDEQdMpiTAlSsMacUn++CPbQuPR93ARJx2O9Jle0FGSTeaIdfWsJ99wVsX4M8fpf/6CuuOwITL4=
X-Gm-Message-State: AOJu0Yx0EtoxCnUjdUlL+Hm0qM8LHRyp4ii1bz1EaczHR5x7GhGb2qEW
	aGQPQn2EZdkvtOnomzKVzVhslMo/Q01iknYRPHWHALWfTq+xxWwE3YZaF1MfdTkBwKiBnIKuvtB
	9EQ4OZ+IqRR8bqH5R67+D+xrYHC8n+IVZsE57
X-Google-Smtp-Source: AGHT+IE2p3Omlwm3EzGg+l2X0TwISReBp7wfKSeqHifZGecA9H/wvlgdStZ8NcRwsmoz0C14lmxeng8EglXkjwSno5E=
X-Received: by 2002:a05:690c:6206:b0:61b:1be9:bbcb with SMTP id
 hl6-20020a05690c620600b0061b1be9bbcbmr3057153ywb.44.1713446283553; Thu, 18
 Apr 2024 06:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418-alice-mm-v6-0-cb8f3e5d688f@google.com>
 <20240418-alice-mm-v6-3-cb8f3e5d688f@google.com> <5fd684d8-d46d-4009-bcf8-134dab342322@proton.me>
In-Reply-To: <5fd684d8-d46d-4009-bcf8-134dab342322@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 18 Apr 2024 15:17:51 +0200
Message-ID: <CAH5fLgiMLxmmm0AVX_5HQF61FzzN69GCKabrr-uM_oV-rRMuHw@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] rust: uaccess: add typed accessors for userspace pointers
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, Trevor Gross <tmgross@umich.edu>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 3:02=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 18.04.24 10:59, Alice Ryhl wrote:
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index 8fad61268465..9c57c6c75553 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> > @@ -409,3 +409,67 @@ pub enum Either<L, R> {
> >      /// Constructs an instance of [`Either`] containing a value of typ=
e `R`.
> >      Right(R),
> >  }
> > +
> > +/// Types for which any bit pattern is valid.
> > +///
> > +/// Not all types are valid for all values. For example, a `bool` must=
 be either zero or one, so
> > +/// reading arbitrary bytes into something that contains a `bool` is n=
ot okay.
> > +///
> > +/// It's okay for the type to have padding, as initializing those byte=
s has no effect.
> > +///
> > +/// # Safety
> > +///
> > +/// All bit-patterns must be valid for this type. This type must not h=
ave interior mutability.
>
> What is the reason for disallowing interior mutability here? I agree
> that it is necessary for `AsBytes`, but I don't think we need it here.
> For example it is fine to convert `u8` to `UnsafeCell<u8>`. Niches also
> should not be a problem, since eg `Option<UnsafeCell<NonNull<u8>>>`
> already fails the "All bit-patterns must be valid for this type".

If T: FromBytes allows transmuting &[u8; size_of::<T>] into &T, then
it would be a problem as you could then use it to modify the original
&[u8].

Alice
