Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B2A17E46E
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Sep 2024 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725274029; cv=none; b=WXFofBPInaW1JyadRecjS5h2J4zzaLaE56Gnc3zbXHof1YXJFpdgwN3QGdrCShBdyRwFNNmJSXAXvh8MKy3omYNim6q6b1yp8ZFfSwLMhIXOAfYIw0cG6s5Q20S9ckGIyeyEsZCF4mGA3+OjgTsaem+r+3exTrZnwac0yzNvA4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725274029; c=relaxed/simple;
	bh=tDah0EiX2QJRFB9Cf/8cXLOBVOtbqSnLW1c0fNSrnDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R91uVyw4wUxktnlxHTQJ+98J6Md3R2gsoy8A+7RAmbIF6OSarlrOKzU753JoYzP98C/wPC+Ly1nyFufRm+ybLdWoh2r5aru/nm0zq4Rf30daqmlAa/V37H3JsB+Gv/zMeyLAYfv2+K4PNcRGZ8uyKBya001iBXTHfWT4lT/3oDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rUwEktDk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rUwEktDk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374c962e5adso493091f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Sep 2024 03:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725274026; x=1725878826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDah0EiX2QJRFB9Cf/8cXLOBVOtbqSnLW1c0fNSrnDM=;
        b=rUwEktDkHulBV0pS1DHhAdkq8vI1nvHYkJ1ftcseHEsnTQveiPA3IqFqGegCqS9svB
         ffW6HUGwmu7BVrrKNf5Lke0vwNb7T/lb7ulE+7I0I8+ypdoJ1ilFZrCgKlS3ELfIy5yM
         Ut5CnNxmdE8GIQShI4LdG8Arv9GtH+1eXUMQwrOgrvk0pe550SpQ93jr0PZQY3ScskOa
         FKmJfZNDzFuWlwIFzkip4J0Q3EJIjiEI/VKeb9SGBhUrsKj56Buv7PLA5q4RTYdf23BU
         ONC69c+8zZFoLVvgqeVc/ZWnINKgXyBBvaPIkNNrYMxZb163HXlIQbBRB7+40+T0EosJ
         vvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725274026; x=1725878826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDah0EiX2QJRFB9Cf/8cXLOBVOtbqSnLW1c0fNSrnDM=;
        b=skHw3E97APvJjzWD/sQ38WVSqya9oVlrDofoaMbtJ6r/pM7D/ch0ZheUtxx0EyJzHl
         c0Ff7sE7WrsBvou1R7CTTwW09uM3SWvthiGet9G+1MLVYClUHKXmoKA0oIAfpBdpQ3u6
         6zqPJYAiv2t+dclvepLhQJH8373nLbN1US5f8QJJ3wo2/vQE+QxrB0/tCUEpdK4sGHV2
         EPBosUpu8cU8V1mELhdqPuad1uarUxTO4tBFmxJrPfuYJ0A2NrSJUJWZIBJJ5H3Qmra4
         vSn5WwCpnUfrKRad/hJj4JUkDKOw++tVMfhLq66IFLNEcQTEXjbqE3Bw8IKwUPMPVBCJ
         TvEg==
X-Forwarded-Encrypted: i=1; AJvYcCWHrv0JiXNmwPHNDIldz5wI2LbEMG3LF6OPnYpe7V4TgmlLRoefxPjrUWOXNq9dIWXkzX2EZ6h0M8Qck8IMJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVAn3w2l7ZW+zw0Gib5vh6X1O5TZbgmYccL9sJQYYVhvzAlrW
	HK/YQ5gwbycBftckcoJxllsKepM8yknmCvDS0SKUvGwpto9329J9F8c/fr6rJe/D4b+kkKmN0uP
	P2h0S/HVIVsk/3z8LTnRimvB86gjUbaC6aDXg
X-Google-Smtp-Source: AGHT+IHIqV4yykcuSDh8/L9j2xuNA7UB6o306ceirl6YASbGc8rNGJOeqVEHOSBb9wDUJJnEZZEv+Rd0P/hFLHw6zjc=
X-Received: by 2002:adf:b31a:0:b0:374:c618:7fd2 with SMTP id
 ffacd0b85a97d-374c6188127mr2867899f8f.8.1725274025625; Mon, 02 Sep 2024
 03:47:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-static-mutex-v2-1-17fc32b20332@google.com>
 <10453342-d269-4b78-8962-821ef53d3cb5@proton.me> <CAH5fLgh-DYvXobXQVaQ9txYS4Rx8QhjyVvfTphk6vvnUOGzPnw@mail.gmail.com>
 <20240830160953.768e38c2@eugeo>
In-Reply-To: <20240830160953.768e38c2@eugeo>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 2 Sep 2024 12:46:53 +0200
Message-ID: <CAH5fLgjasg1UKyF84f-6dnzGZMKgjgZ6n7e+bL7nWkJoYBsSyA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add global lock support
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 5:10=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Fri, 30 Aug 2024 07:34:00 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > > > Due to the initialization requirement, constructing a global mutex =
is
> > > > unsafe with the current approach. In the future, it would be really=
 nice
> > > > to support global mutexes that don't need to be initialized, which =
would
> > > > make them safe. Unfortunately, this is not possible today because
> > > > bindgen refuses to expose __ARCH_SPIN_LOCK_UNLOCKED to Rust as a
> > > > compile-time constant. It just generates an `extern "C"` global
> > > > reference instead.
> > >
> > > Ideally, we would have support for static initialization in pinned-in=
it.
> >
> > I don't think traits work with const today, so pin-init would need an
> > entirely different mechanism? If you're talking about using
> > CONSTRUCTORS, then I think it's an undesirable solution. C code can
> > define static mutexes without load-time initialization hooks. We
> > should be able to do the same.
>
> I think I actually prefer using constructors to unsafe.

Constructors are used pretty rarely. They're not enabled in the
Android build right now at all. I could ask to enable the option, but
I think "global mutexes" are a rather weak reason.

I also think they're a can of worms safety-wise. You can't run
arbitrary code in them since otherwise one constructor could use
another global before it gets initialized, so we will still need
global-mutex/spinlock-specific functionality even with constructors.
At that point, I think it would be better to just strive for real
const mutexes.

Alice
