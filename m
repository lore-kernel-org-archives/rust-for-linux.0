Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B121F76BB
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729012644; cv=none; b=p8DPVnAvII0t27hWQQFTFxRpEm7BYRYOJ5LALt1EB/bMxvrLg2GKTXiofhkKgHwLfY6C8A0nIzV0Jo2z01bOP+OL9J5bCBC3/FjfvxWl5ytLepuWH+Fonqd7nEeNwTab0JgWAXczftYkVPy/gPAmUNpNBq1javUymrl71po998Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729012644; c=relaxed/simple;
	bh=9dO6kLfKx5n+cB/N+dx9/jVakSIyCSGOQANs4+mCwvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=laVtO0Jv8ec9HiauvxOqc8wnjFyBJlSmBeVnNKx7igyBCWH2AkCvMDqG6Ez4lN+EoKkatfvEJ+7aFtyTdg8b9UaIf0De1nqRHXYsIwZnBTE7q2KD0q0ZpJkAFKrJ5hY+rHfa1e5bFZ0G2UzUcp4jm/YkcOrLURC2iigu3S1dg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dE5LRDZC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dE5LRDZC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so4838545f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729012641; x=1729617441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuhQaen69BVGr6S76H7dsi1dhnSW9t3zaR8BLBdDHwc=;
        b=dE5LRDZCxQ+9MOOq0PhpCSZN8OwctdeG/ScDPyM+XV3ans+gIxoKTLKtnhGX/SurPJ
         X53vvsn6ccMqi0YjUX9i/4YAtcvws6Nr9juifo5XGGr0NbISqyqQGfb5s9ZTzHdF7UqF
         5qnA2l68P/tebMn/6GXlCNhspHWd1N1zML4syAcn10ONRKqbA2IWFKTUAOXDo/PMwHRW
         WbSDZjwFJOPXd5VsuNNIXICh3/u9DoYdeAR9W9vUVV7tOKcTaUZrvRZfXfiznf0rdia5
         VKB9tQg4k1c7u4/01wAMEkH93QWvfml2neJjsUKJ8q7xZetcjuM4uH6zY0T3BwHu6UJP
         AeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729012641; x=1729617441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TuhQaen69BVGr6S76H7dsi1dhnSW9t3zaR8BLBdDHwc=;
        b=W7Pi13KVKcSatzFs6fZOOqR9nFH+++dsfOlm5xTtstQINTD4lxNgY1QZ1oYl7Fnzhu
         jiPJN5OPz3gU9L55CKswxXqiIrjFr1nc0T/6qmRX/rLoGXwDSe2Uqi4nQ1S8yl+g1VOH
         I8aLgrOX6o07dvkXzsUKhsL50FUavCXxyzciDT81+RNV9bdJoSudfe11Aecyk1I7TT+t
         v212rAXH+Bk/OjK3gfDHPdQsEWmhNiGNysBBFENvijkSQofU/yGwqw55t7CzHEnMtoWE
         oXyaphVvOwLUQ5LiBgXhYT3tjcGOEzUY5CfDRfRcK7t0KExcs//jAHTmmQ6YAxTS/Wwg
         C+XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzktzUiNwyWPMVBgcQhku1/VeFnONO4Mok3feio9chw7aCEMzBcsEugZMm8Fu3FcHQJRvIH6Q1YwUd9wQ5ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyD7RRtHrDmNJP4q2XPLqsWsJ6MDMIGZMmv3Zz9fbKGjmAN8Rk
	XTfbhgAdM+3x362tQdA6CqMgJUpoCiwvLVHNlnfLjMKxOAeXAaqUHSTajAkl47NkmVYTbKaCgzw
	kbORoaYqbIPRGgdwzLq1Sq2GmjiegpwxD1Qcc
X-Google-Smtp-Source: AGHT+IExgSozkF8anpYsmhke6TphHpFpmFt6KSSrlZ0ptH9TNGIt7Ob73wUWFT8/LhSsvrqNXf6NfZJP5rWxJezZ0EE=
X-Received: by 2002:a5d:4f8a:0:b0:37c:d1ea:f1ce with SMTP id
 ffacd0b85a97d-37d5ff8db28mr9582074f8f.25.1729012640808; Tue, 15 Oct 2024
 10:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-miscdevice-cint-cast-v1-1-fcf4b75700ac@google.com> <2024101545-reentry-extenuate-58ce@gregkh>
In-Reply-To: <2024101545-reentry-extenuate-58ce@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Oct 2024 19:17:07 +0200
Message-ID: <CAH5fLgjkDJXq6jGL7SuoyaBr6TWWcRgev9=1mT+soSK4SJBRaw@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: fix warning on c_uint to u32 cast
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 7:08=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 15, 2024 at 02:13:22PM +0000, Alice Ryhl wrote:
> > When building miscdevice with clippy warnings, the following warning is
> > emitted:
> >
> >       warning: casting to the same type is unnecessary (`u32` -> `u32`)
> >          --> /home/aliceryhl/rust-for-linux/rust/kernel/miscdevice.rs:2=
20:28
> >           |
> >       220 |     match T::ioctl(device, cmd as u32, arg as usize) {
> >           |                            ^^^^^^^^^^ help: try: `cmd`
> >           |
> >           =3D help: for further information visit
> >             https://rust-lang.github.io/rust-clippy/master/index.html#u=
nnecessary_cast
> >           =3D note: `-W clippy::unnecessary-cast` implied by `-W clippy=
::all`
> >           =3D help: to override `-W clippy::all` add `#[allow(clippy::u=
nnecessary_cast)]`
> >
> > Thus, fix it.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > This fixes a warning on my patches in char-misc-next. Greg, can you tak=
e
> > this through that tree?
>
> Will do, thanks!

Awesome, thanks!
