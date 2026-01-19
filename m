Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79748242D86
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810702; cv=pass; b=pAorB71CNiDwheJIWIiGaOaWCMucTpL9veOK/ufkAz1cQ93TTMV6+R3Kf2unyNw9Ge4Smg8O2W6AB7PjNZr98CShJjs8izbuLgsSYGDbeBnA768P0AVQVrveeeojUtDACaUG+U+KW1L48O1WB03S3pLfJa0Y1ez6+aZw/tZ5aIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810702; c=relaxed/simple;
	bh=maAQVKbKqgIgs7oB9/ReM0VrYz7wvUl2hqrokJJIIA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLacsd9T60tWFVAPxl7HpaIADuDa9a1EwgvKxHIutOV3aTk9oFQXbRQwZnK+NgewPUiU7pQeNT7wZqXGeXXkg5fiLkIfie7Yieh83eNZFeVVRYpl+p86pGK+bwTRGOhcG2CbdVZcQCiMeCpxvhd0l08tZH2wx/i/KVL2h7rwbKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brMC3R9T; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brMC3R9T"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ae2dfd9eefso227941eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 00:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768810701; cv=none;
        d=google.com; s=arc-20240605;
        b=CxRxFal46WRBMK3Dh1oAnR2V3Fq1N5YyJ/YrvjARDI6nuyKjh7WGIH6Ja9N6VZR/EN
         Y+qJtyRt+aSG0V5OQjqjEqy0O5svlFsIrLbv0j9K5YieQGhI2ys0PrqNj0YIkaX4HERv
         Qp60hzlPt/SPTlgy29TczwFlPRxUlQXwnyt1Ar8oOWrliBkDhxhhuvoKAGX2dKt6gewO
         Ip4YlufLZSTFC60KCpp8rUnN7xNzTuvfUGaQs1PmDZkmDUkmFT0/7UslJWdbpie3HYmC
         0yRzkXyGwfG51wUsaFoWxh5mRz13jkqEed/X0nMHcz6KdcUKKfk34zj+6jumbUgvJQK8
         Glmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=maAQVKbKqgIgs7oB9/ReM0VrYz7wvUl2hqrokJJIIA0=;
        fh=DwLUgZ2a51WXfj8XMgwxJ9wWn4+9piz3Itk5pKv5OS4=;
        b=PRh1ZoPZhzOiYWMy9c5VP3LaWB/JTBqPHD0z/Ge30my8n90salGkfA5TAfO/09phqD
         j8LL14abL5yLe3cJOUoRyMAb8sUoHg7gu5KonwVtQMctHqnhwNxz/XOf90iqz0njHEvG
         5ed6p6XwLOSMOyJIiL9Kk7MIhMrQciFhDB+j9QxsJwyfr6bn8PqljuMRPoIfjETeWSKx
         /s3bwULk/xYIbIF10IjA9b7SfCQ5tuo4Qq5PGOTLEdTiL3Ll9Ytetp2ltYJzqxelp6SY
         6adYuakTEhMdzCpWl691u6bjKIkT8PGxBhgrB1lT+pcsWU5XoQlzkZUI+Ye9TQUdy9xK
         O1Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810701; x=1769415501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maAQVKbKqgIgs7oB9/ReM0VrYz7wvUl2hqrokJJIIA0=;
        b=brMC3R9T6245hHst3qO9wktUEldGYvdJ9rH/XawXqE2V7RB6SYYnXh48c4KjevDdVe
         fffATqz6iPSqUu8xY3y4M260d5k5s0puKeo6l5Sh6LXxNl6perdNeE+Q0dhwX098l+Ug
         J7/+pKxCCCuD6P3hGeAVv9hzxIKSitj1TuGY0nNzMHjBD1dBsIB1TUo/eRa0zIKGkq9L
         cEaRIHQp/4NEPfifqY+aL934k3uhUOqAjMqd4v3mHbzynfNifArmmlDB7vD+OfLKZ4F3
         7x3EI+R8sLT8RvV9m/uOhao1g386ndeJF6DTlrS0wmGCSqZXPZt19dy7cr5GkHF+lgXr
         o7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810701; x=1769415501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maAQVKbKqgIgs7oB9/ReM0VrYz7wvUl2hqrokJJIIA0=;
        b=rECZW5ZDniPG2fCjmJ3uOK1Nhz5nwpIwulxUAlJKLhFpuCMYE08pN5YG6YfiJKAjmi
         jNZimbQiApKrJOeYYMf9QPJV7z5ycVKB4HvFo376ino+wjWxtxalxJNb3k9bvVUhoW+k
         HduJMKQGramTd64fKcQ9qVdR2zICjVraK0HjI0LtGcM0zzjlvtBF30bipr9JtImzPZ4V
         n2YRhKB0cUQu1Svr86SpdXVKcZX74lUPzXWLKYJ+JD91/XEKpnc9yQ///1vHQsiBK+04
         hCB5SJUFO4p728fZobWPskwYwdA06zg4kEGusqVOm4RzgTllnZL9w3YdDhFHnH+ovyx4
         +Opg==
X-Forwarded-Encrypted: i=1; AJvYcCUPvkyY13J5emtkDmqJRG/hx0cgn1RRKnrxz+t3QWHKdL8aePetpckF0RSfL3hI20kz4Y8JihH6lLwVCuD+EA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrB1dNSdBklegERAj9hchBCZXgD7tLjGChY3gwWY9+QYZHBEV0
	kyc6DMbl6WE6wAGk2EX1X+52Xp9r6k9v9Ft5VOc9JdUPUNnk4KhkAXNqlf8daTGSDyU06qhgEBm
	KmOJmrXFP7W3pRNJcCRMVljWxtQA3llM=
X-Gm-Gg: AY/fxX6iIVoAfV55lHoDn+khZ7lFxb4Kh6zsLZXYM7Y2UhwTvKm98W0N0ruh9DW1y0Q
	vkO16eIKXzi5+HZmeLgGIOIUIMUj5PEhN8noHjI+p2SSjtE/OVIxnD+XD1Bk/hYlHjym8bEG0kw
	bczutDg4uSStUeWd1Ff+rEkQj1+tVUg9GeXMlkuyBQllb6VL6emEwOsgJ59Xa392YquUtOBmaSB
	cgP5Uvb+7/MBxgxTv/ZlOX2iuJHpJ5AuATwDez4Dp7kcajvOJKec1w7Fmh/rkvO0zUeOUkkhch/
	2IgwtTWb+xDYDqOHbdQ6fW/h0uzmXTVB2mq+0OHOcjSmmlSAkiHwJEZ82zPODB6g4y32qTc+qjL
	6xFWkK/3A4RB6
X-Received: by 2002:a05:7300:5712:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b6b3ef8367mr4916072eec.2.1768810700155; Mon, 19 Jan 2026
 00:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251213000042.23072-1-ojeda@kernel.org>
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:18:07 +0100
X-Gm-Features: AZwV_Qjp6-0GaELRN-Wci8Sl7E_p1ZIDKwdi9Cf2hy6IKhNGi3u6rxq7Ho3vrOU
Message-ID: <CANiq72=Y6p=uoJWiV0ph6P=YV0XDjWbx-P2uDMS88R+QmivdpA@mail.gmail.com>
Subject: Re: [PATCH] rust: conclude the Rust experiment
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 1:01=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The Rust support was merged in v6.1 into mainline in order to help
> determine whether Rust as a language was suitable for the kernel,
> i.e. worth the tradeoffs, technically, procedurally and socially.
>
> At the 2025 Linux Kernel Maintainers Summit, the experiment has just
> been deemed concluded [1].
>
> Thus remove the section -- it was not fully true already anyway, since
> there are already uses of Rust in production out there, some well-known
> Linux distributions enable it and it is already in millions of devices
> via Android.
>
> Obviously, this does not mean that everything works for every kernel
> configuration, architecture, toolchain etc., or that there won't be
> new issues. There is still a ton of work to do in all areas, from the
> kernel to upstream Rust, GCC and other projects. And, in fact, certain
> combinations (such as the mixed GCC+LLVM builds and the upcoming GCC
> support) are still quite experimental but getting there.
>
> But the experiment is done, i.e. Rust is here to stay.
>
> I hope this signals commitment from the kernel to companies and other
> entities to invest more into it, e.g. into giving time to their kernel
> developers to train themselves in Rust.
>
> Thanks to the many kernel maintainers that gave the project their
> support and patience throughout these years, and to the many other
> developers, whether in the kernel or in other projects, that have
> made this possible. I had a long list of 173 names in the credits of
> the original pull that merged the support into the kernel [2], and now
> such a list would be way longer, so I will not even try to compose one,
> but again, thanks a lot, everybody.
>
> Link: https://lwn.net/Articles/1049831/ [1]
> Link: https://git.kernel.org/linus/8aebac82933f [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next`.

Thanks everyone for the kind words! I really appreciated them :)

Cheers,
Miguel
