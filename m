Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0069536D510
	for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 12:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764504136; cv=none; b=b6HEVizquqHKcu55ekB0oG3oyh1PrgI8c6j6UH5bzN7dN4CJLada1webY7ThxokY/vw/0SC6fHRbeg32moLYEF+1pHJznPiKqIUo2bUdh6LLJqx7RCAneZZWJGtIskOiBVRklEFIibdq3QxUngj/V1XUb2IptVk3N8dVxnD179A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764504136; c=relaxed/simple;
	bh=o+SRJTbLd4lUYf+nsBm84PoEwTsknCDPgXg2fNCA5Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBqOYuGHxV0biSdN9hxeyesQVL+CxKQ0qx9WEltgJgs2v9QgDwVZMIbgYzGRTWBv2DUkwSQ51EGKDRnla/PCYlQ5IsuYziMSSZWzz4GRxZEhPSi07cihgCLaEATYB/uwd4sxJ9P/BjqYEVyF5PeW7xONA9HyHreXUcak9UAbarU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d14SP8/N; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d14SP8/N"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a492d38e0so4215411fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 30 Nov 2025 04:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764504133; x=1765108933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZddOjsK7VjxheIWo5UHk5Pjcb9V5S22XrNbEE8Qjmy4=;
        b=d14SP8/NheIegMZoODYRzFgqYGoIRFWaWVtuZuSBMRpthuoSXbKWVmoRzX+bhTz29P
         9uz/ZYgxN6ft1vKrjTJpji2We7UjHixr66Kf6l7eeDbW+ENhN1+D2WurIvGeqX5vBbZs
         vJ/wjBY1+NY5HmkfFbeETqmPobb33rB6aCUNBz3ivzuAdNuSeIt3jtAWS6kl8P/68Hxk
         1QyyUhY21aQWRGoRPfPLOapr8UZePg0oRZ1GdaiVGhdOX/Q9fcYNb4NnqcM0bl+Hz1Bb
         533bH9bJ/1KWiteVldqGYLBNE42So/oCiYqe0T3KwXpBdlnZS5NENjxbMm/Yhtk8pYrJ
         tLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764504133; x=1765108933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZddOjsK7VjxheIWo5UHk5Pjcb9V5S22XrNbEE8Qjmy4=;
        b=sMZjXVZE+xLxKHlWRJYDn4bd6oDgh8F92wPvz+SQW/NpjSfrlrBRWHy+WOT1IU+RC7
         g3T6uMHA13aj+PSQmteA62G3EcQ06Tc6OkXWQvOsu/ayZeB2Emyf4EAV1+5wkQTNIuwS
         LSyuhiLfDNa7BS5t23X+6gKXViWNXebtS2xKKOPJZODEdyqrAstuVp+G3htjJGHnvnbS
         IbnhEmnwiobtxk1s8cYx5f2JnV4+OfLZjLC0/qgC4E6N4mOzmY6zTlwHP+s5w+iteLid
         wF4pyeXN6eVlTECIOxrphcJA9GERAMsZPkDsTqRZp6qt2eRcUK2i7GyXOJEV+1WUo+nQ
         1VHA==
X-Forwarded-Encrypted: i=1; AJvYcCWMa2NOfaZbVf796TRlo9cDgXZYXRRHDNn+HeOzymMVeZRFeRF81lo5rqn+JjP9wnBJ8U8P58rjOG9jfAo8Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkzgeO0HZ6PyrORNI4mRWSUIZGY+Zt7ZcLrOlkTyPffuBUq4PS
	PyEXdIjOsMfvTvpN34s3AjaSkr3luM9rtq+hI6SMzjbLJK2tP5a7oFAaPseRRKTnKC8kK3roNZ/
	T522IxpqYEUTC4aAU091F8zqmi6g1Crs=
X-Gm-Gg: ASbGncuWcxpaofYvQwm8xhZmP5DZPONDgpX1VrUd2Szy57wGg7dNHsxvUwKcJIxZn1s
	BMNQFj2NdeAKtpGxoIgZzyumASb3zQT4TS6JOCDbb5pxBhOnmLGxz7yDrawQ1somytbUtxovLFX
	PbgxvgwW47acjAv88fqyoJw8kIBH60sXM2IjAcA1vHo6DmmkOPpFfRHdkbcYUnv5bB5qKfvi79l
	ZEZ2rsubXjaTOQCR2c/3nCAc5Fdr4rZMQLXnU2GVjmEHSJrUAkt5YDzgi6s2qwGiNPMRLP1zOJZ
	XzuqXGI7cP1ehBTl9/hs0R5ne0NPa+uJ4d5NRc0dXkMvUbB2sWRA7kj95Z+h9nfPGt73viLzS6u
	pPGdQTAnOyNN/Q4vIZAey6/Qq
X-Google-Smtp-Source: AGHT+IH57zuEYrhUIS7/xlv1wua0BBCXgqhbHTIKrv5YX7pi7TFpWc0dk0iffbwLT8TawSpqUiO97s2bjGmxmt94LWE=
X-Received: by 2002:a05:6512:e81:b0:594:2e4e:6996 with SMTP id
 2adb3069b0e04-596a3ed7487mr6237889e87.7.1764504132834; Sun, 30 Nov 2025
 04:02:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aSpEWf8ytDn_laHh@fedora>
In-Reply-To: <aSpEWf8ytDn_laHh@fedora>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 30 Nov 2025 13:01:58 +0100
X-Gm-Features: AWmQ_blf8tzWZUO3s-Gr1Yf-RN-BOyERORoB1Fshh2oouBQCJFE9iKkdbga-eJ8
Message-ID: <CANiq72mLPvB_6Ow3bW5-V4-km=RyA59chQ1g1x9qUt2P-zZweg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Return Option from page_align and ensure no
 usize overflow
To: Brendan Shephard <bshephar@bne-home.net>
Cc: aliceryhl@google.com, dakr@kernel.org, acourbot@nvidia.com, 
	daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brendan,

This looks much better now with the examples!

On Sat, Nov 29, 2025 at 1:54=E2=80=AFAM Brendan Shephard <bshephar@bne-home=
.net> wrote:
>
> +/// Returns a page aligned [`usize`] in cases where the value can be ali=
gned. Otherwise, returns `None`
> +/// if the aligned size will overflow a [`usize`].

[`None`]

> +/// # Examples

Newline before `# Examples` header.

> +/// Assuming a `PAGE_SIZE` of 4096 (0x1000):

Can we assume that? i.e. these tests run as KUnit tests and we support
architectures that allow for other sizes, so we may need to guard
these with a `cfg` or `if` (which may be hidden), or perhaps better,
you could compute the values based on `PAGE_SIZE`, e.g. something
like:

    assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));

It would be nice if you can confirm the tests fail (and then work
again) running them in a kernel config with a different page size:

    https://docs.kernel.org/rust/testing.html#the-kunit-tests

> +/// // The check asserts that None is returned when a value is requested=
 within one PAGE_SIZE of
> +/// // usize::MAX.

`None`
`PAGE_SIZE`
`usize::MAX`

> +/// let overflow_addr =3D usize::MAX - (PAGE_SIZE / 2);
> +/// assert_eq!(page_align(overflow_addr), None);

Is there a reason for that particular address? If not, perhaps just
using `usize::MAX` (the maximum value) would be simpler. Or perhaps
the edge case (the first value that returns `None`) would be better.
Or even better, both.

Thanks!

Cheers,
Miguel
