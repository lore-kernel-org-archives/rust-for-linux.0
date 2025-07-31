Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9881267B94
	for <rust-for-linux@vger.kernel.org>; Thu, 31 Jul 2025 22:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753999836; cv=none; b=rJanOOEcSbq+2bS7EGcpklrGRi/GiqoV/iotmU7qyc6vRjRkvWYg9o3pl1HW90vx8p6EOmUEY2hSM7gyfnOZkSNnTe8nBnRQ9tSvAkH7thUUYwxdjZYh0Ukt7YnL5w6d/JwhdhhaQJUtv+x3vPm0ZxUeCNMT8wtNMRvFS85rM5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753999836; c=relaxed/simple;
	bh=ph5z1M2S5YizVVxfT2cZN5Knu3Bzp40XCiHbEIYjOQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZXUFVgG/8mkgjw0Y685UBJBuP6trE6dl7lq3DIaP8Tzqv12trdJZbcFmzFJG7DK6WofHoH955CtFBEGBH8jXSHnDyTqbV4XhFav2LyJL6E6DYgDMIqe67wVPrWQ76QptqbgCmUdypPlmLGvetUPu0foI2spf+/3JHXCAzPMJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wPWTKeHU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wPWTKeHU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so7608495e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 31 Jul 2025 15:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753999833; x=1754604633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph5z1M2S5YizVVxfT2cZN5Knu3Bzp40XCiHbEIYjOQk=;
        b=wPWTKeHUFaYIeDa+UA/iwYQZvC7G23gBv5UpU8TXIC1v77JJP+j3aXpch+OAiBa5zd
         oBotDTDu0Kt6JJOg0XkkZ9ieHtv9xIvATwZy6YnlFTb4p1x2RpmP1kfeCGljzQswR757
         oKT3wU8DqosKKaCBDqIdupOKu1EW+SiXPffMmu34R61OQoNvomnPjFUqU6Mcd7xdYMi2
         NOz9gi3PnlpF4A5cb/aN6vZuXbu3Nj4Es1Sz4NO//0u20xEsPi5nlRZwl2IWsq6QyMNM
         TBjBhOnwKl0Mq7N0ZFaYPn0EyiGJO5fQ9yFMWi+A6eJ01gFj2QR8rsrZvT4lttCwbcHC
         3qAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753999833; x=1754604633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ph5z1M2S5YizVVxfT2cZN5Knu3Bzp40XCiHbEIYjOQk=;
        b=Zaszu2Q6/Ax+/xglPq0g20/8YvnaBT8N5lkivtFnKRfvL2DnWuRYRvG6mgAyDKWxHV
         raORl2KjQ6q7HHNJ93FjAxq/r8jyCCLQ6XL8gVta+zmPjNj1AwfF564vp3KUccWy8Sam
         aTfOTjk2M1MQXbC3tzGPK62zwi/Je9gcLRBT2IDJFOI0WEa7BvPNUClXElBJZdFaezhL
         99Vqv+L8spnxAYpKD3lml7MtAiY46Cxq7kxZzRBrXU9FuKZjZ2s6SwfLUwOL4ALNZVMP
         /BHa2MsB5y3nX3huIGHlxdLb/kQNnQbufntB7ZnS/+TcGHpiHdb5sNC8qcCFK0d5nK7v
         GQuA==
X-Gm-Message-State: AOJu0Ywr7v1G7hTd6pXXm51ELoMAoWMgz2ScIwVw7dJxuR92A49/KqpW
	c+sn1Cyqu8Ze7idUCm6zMM8BS1LOoKEPEGoNUdFrwEu5HNmp5fuS+YIQPdb9CwC5fqn1SvkmyFx
	ZthrquWoQs9Si0d+o9DpMxqSGSBoFTzbFMjvCf2qT
X-Gm-Gg: ASbGnctdBPAej4Sm5EUnVbIBdIOAN/sVDJC7+vdxQZv8eaT09IF2tJmKzGwOAo0w97/
	Mxd6MuE0UXl6BcN+BIb8E2LViIo8mX/vndqWSSKkOiNI3NxwpybnulbuDrZjAVyViwBGYSZf4yq
	3YXQQ6fZiFXuwvEC00L1CQfMJsgDY9E12vOBPoZhBEOMqKvPhJyIh/1UoYLIacDedu++xr/i3Wz
	FCzsxEts5eysW6rK8M=
X-Google-Smtp-Source: AGHT+IG9B0/HQlauhDbtCrGKa7ynRKgDeqJvzuE8GgWceuYQmfiCERcW4fPwXRCQWhfYOBwEzppTY71T++u/o37D6WA=
X-Received: by 2002:a05:600c:3589:b0:456:2bd9:5126 with SMTP id
 5b1f17b1804b1-458aa450ac1mr1265735e9.16.1753999833128; Thu, 31 Jul 2025
 15:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724185700.557505-1-lyude@redhat.com> <20250724185700.557505-3-lyude@redhat.com>
 <aIXVzIwBDvY1ZVjL@google.com> <f92b5f82b3ad7bb8d5bf60b272aac8cf1e6ced24.camel@redhat.com>
 <aIi7ZycRtmOZNtcf@google.com> <ddea64af3b845d2c32d807c5aab6146a9ce3c2bf.camel@redhat.com>
In-Reply-To: <ddea64af3b845d2c32d807c5aab6146a9ce3c2bf.camel@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 1 Aug 2025 00:10:20 +0200
X-Gm-Features: Ac12FXzxjd0NufhNJUN1k32xZsCsJFCJt20asGSegoCOtjrXYYOZvMfs6p8b2yU
Message-ID: <CAH5fLgi63Avw2VYvaOEdZhw93Qb+1isuW-CsyaD-_ask62_tcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: time: Implement basic arithmetic operations for Delta
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 10:47=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> On Tue, 2025-07-29 at 12:15 +0000, Alice Ryhl wrote:
> >
> >
> > The reason I bring up the example is that once you add code using these
> > impls, you're going to get kernel build bot errors from your code not
> > compiling on 32-bit. And as seen in the linked one, code may be compile=
d
> > for 32-bit when setting CONFIG_COMPILE_TEST even if you don't support i=
t
> > for real.
> >
> > > This being said, the kernel does have a math library that we can call=
 into
> > > that emulates operations like this on 32 bit - which I'd be willing t=
o convert
> > > these implementations over to using. I just put the CONFIG_64BIT ther=
e because
> > > if we do use the kernel math library, I just want to make sure I don'=
t end up
> > > being the oen who has to figure out how to hook up the kernel math li=
brary for
> > > 64 bit division outside of simple time value manipulation. I've got e=
nough
> > > dependencies on my plate to get upstream as it is :P
> >
> > If you just want to call the relevant bindings:: method directly withou=
t
> > any further logic that seems fine to me.
>
> Gotcha, I will do that. Ideally I would at least like to have us only cal=
l the
> bindings:: method so long as we're on a config where we really need it. W=
hich
> brings me to ask - do we actually have a way of checking BITS_PER_LONG in
> #[cfg()]? I would have assumed it'd be simple but I don't actually seem t=
o be
> able to reference BITS_PER_LONG.

There is:
#[cfg(target_pointer_width =3D "32")]
or
#[cfg(target_pointer_width =3D "64")]

Alice
