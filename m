Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1E1194A52
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 21:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731792527; cv=none; b=kWkGpMsmW0omeT02ukWXvYx4vy/e9RCF8mHxf0gNeTWPgC7OSCXt+NwgPJZvjmpe/yfSSkjqvQMi0AQOQ/+Y3xTdP60/x9mdq5/K0KfJv0au4O0co38wl78jv0wDNfvfxa02l2xcJdDX2K5ZDlkVOsPVUCsc6eQnQlqVW5WswtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731792527; c=relaxed/simple;
	bh=56BwKc/MxEf0PbJk6JnsJL77he89XvqrbeKoJzQPAqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKtfwkMV8aOSybzXiuWNIXpEWGrIJadLcDoCeCG9A72v1u1loxEkwcfCYczJ52HUxtfZWPfcIi41rmxI5QQGFRAJMJ1FhpfpXHmTqKJHz0ICOQ1p8gEMQMpPXJtPaZw+VcZRRV+4LyYbZUmM/imPtjNpdVnKDBxl+izqBD3hmJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKbYEC0f; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKbYEC0f"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21160c8af77so3797185ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 13:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731792526; x=1732397326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTcYXnSaN7DrQ4Gd65uQHUwH0z1JGwhZYjTDtBPEi2M=;
        b=bKbYEC0fTcLKlYaZjxVEJvFWEc6/InjpMctFNCiqRxeCzvtsUyoCjKHrrEpeyrOwDq
         u2npOfjs9l07G+VhN2DUCiQ9g+CNM7yKBMxVBkjf6BLLPIDzDVehRVmiLfwWNar0eTZC
         HPnDJDeywf/lt02uuqAtG86CpLz2SCODAZU4U/Ip0h2H4u4UsYBDuc05sK7yTov91Lgx
         VQmr6IFda2aFF4gdC6B++5dgfUQifer/oJqXiGtS0OwP6MYJtoqZDzO4KsIg/RgcK3JY
         r65XJKbgsKmztRaDzMsq1srQGLD3m1pYy5VtGUrEUbEnexQ4B7pHXheYJIf/GIeu0cXJ
         8Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731792526; x=1732397326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTcYXnSaN7DrQ4Gd65uQHUwH0z1JGwhZYjTDtBPEi2M=;
        b=F/SF2fazXX99BwvELNl0b6umYpJdD7/JzkTZWI5a+QFdb79DdZRpncTU8M9RB6tpJL
         xJuN2WyEuwAx7hLvNYj4EDwH77xxSA9SyTCfk9hIMIcOocsUugdcjXFBBAVUpCw90OMy
         gDCcnP5aujOL0nLtsT9HR3dQF7eAoZ3Ax/cSnUB9WJtKmLhclbfsI1M22gGZwa1iyffx
         W4nTTqhp4L9K1zUEGn1h2EU5idEL25u4lC4j5b7ELRVhFBuUd5k66sPAj5O0sNoTmiOk
         3FXUN1l4RMv6YBquT0iOFmCTEZVDS5kZk7TSxDupYTfuiIf1LZUMZywQ3JTF4/NFwNqm
         VlRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhsf1m5edYwrH+EWdfXSiv3O1m+qIKyNh5f5GhkNlDICai5GQ3BxxyUBUFLv38Z+Fh1hldyjNmsrqGRvNeow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzweZ/b0SltN6y5UdFdReo3OvmsYZUx2fAEvIE2JMTw3WcIEElx
	oKeiOG5ANBVClHB688FqkEE00MxeQFSjYRSmLpB3+1MIucX/JNimXPfGiouwmf5xJTlj0ARolpW
	H+TtDHkJZsZR2pXi7xEa13alqsyo=
X-Google-Smtp-Source: AGHT+IGYXE07qwNfCGVlRprR5NaODiCKRvmOnBehGqMcseArUOJUOF1qrMXTCoYia8W4dyABRdNFQUQQqeDnJSIyigM=
X-Received: by 2002:a17:90b:3b45:b0:2e9:5e1d:3375 with SMTP id
 98e67ed59e1d1-2ea1559bafbmr3649675a91.5.1731792525668; Sat, 16 Nov 2024
 13:28:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116195221.373332-1-daniel@sedlak.dev> <20241116195221.373332-3-daniel@sedlak.dev>
In-Reply-To: <20241116195221.373332-3-daniel@sedlak.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Nov 2024 22:28:33 +0100
Message-ID: <CANiq72ndAQs4EyY22pAJdjD2x+eXsBJGYXFebuVj_zD77nqfYg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kernel: rbtree: replace unwraps with functional
 programming paradigms
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 8:52=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
> -///     assert_eq!(tree.get(&10).unwrap(), &100);
> -///     assert_eq!(tree.get(&20).unwrap(), &200);
> -///     assert_eq!(tree.get(&30).unwrap(), &300);
> +///     assert_eq!(tree.get(&10), Some(&100));
> +///     assert_eq!(tree.get(&20), Some(&200));
> +///     assert_eq!(tree.get(&30), Some(&300));

This looks fine, in the sense that it is simpler (less characters),
more explicit for the reader (on what `get()` returns) and avoids the
`unwrap()`. Plus some examples of the standard library examples do it
this way too.

However, I am not sure we would necessarily want to do it in all cases
inside `assert!`s. After all, `assert!`s are already panics themselves
(in normal code, and diverging in doctests anyway), i.e. it is
something one would normally not do anyway.

When I suggested this, I was mainly thinking about other places that
we may have `unwrap()`s in example code that could be easily
misunderstood for "normal code", i.e. places that should probably use
`?` or handle the error somehow, like the one in your other patch.

So I am ambivalent about some of the other cases. On one hand, it
makes some tests noisier. On the other hand, it may help to show how
one could do things without `unwrap()`.

Thoughts?

> -/// *tree.get_mut(&30).unwrap() =3D 3000;
> +/// if let Some(element) =3D tree.get_mut(&30) {
> +///     *element =3D 3000;
> +/// }

This change looks wrong to me (not equivalent), because it is changing
the semantics -- this one continues if it couldn't get it, rather than
stopping.

Shouldn't it be `.ok_or(E...)?` or similar (or `EBUG` if we had it,
like Rasmus suggested) if we really wanted to avoid the `.unwrap()`?

By the way, please double check with `CLIPPY=3D1` (it warns); and if
there is a new version, please Cc also e.g. the author, in this case
Matt (typically one would see what `scripts/get_maintainers.pl`
returns).

Thanks!

Cheers,
Miguel
