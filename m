Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A641A9F85
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 05:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769403832; cv=pass; b=UfrL+HmOYU1oSgBeAKf8nkqef/EprD6L+w33qDO8JV2MJviCxPhKSidoPzBqt6bQ98CtR65ZhhEGSSunzcVQiHUc60vYPdpqEnAhiX6MzHGPtrqP1sBu/0euN8o+AFzUTPkIQISzIUCZJRhRho/f/2iEZnLxI8dePZHm8l9IaTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769403832; c=relaxed/simple;
	bh=KtbmKHfXc6Wc98D9tFTo4l5JGsT7kMBNHUunjjXSU1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZXo4pdnJ2uTbdPMZUIjwZ6z5Eks0+Fs6l6l2XkH+vcunClmUaVpTmeK56Z4af8oAHz4ggjGCY2rMJDC0+etqnmGTwjcp7nRwll296e0ZS/1tw5W4+B5x+nxBoaAOL/gKOuJWAM4EbDzqLWU8wvYXxRNC17jM6I3vZ9T+XqXBsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOR4o9l1; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOR4o9l1"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b6a868ad45so433970eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 21:03:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769403830; cv=none;
        d=google.com; s=arc-20240605;
        b=b1JY/T4Pz1phRoPEdnF97OxN6b83cGRJXQXt/a2z2dwvUzu0FLoMJPDaQzv09egmKL
         JXsanm3YUZZqC6cJpUpt3SQf880un6HcUnI4KEst+Oz//4OgT27+ZIY3cGayidmb/qKx
         5i5f0PjEgmrJ442oHM51OqoZNfRlxGt/8GIn1YOlbC0VzYPe/eFpt+uXDRRdVATfCLgi
         xCtYJw4nfOadAzuxcNTqp9LcHmGO3z6kYhXyYx4eBIHeDv+erqwgX4/LyDvRn5qPinht
         STob7eKF5HNu2Rjh4tGI8CrWIsSH7Yqq7s3fN77GbYzCP65xunxikIVrN9A0JSCBhg/f
         0UZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TURsRJX/l+dAMyGfeaEK1RXM6AayYYK3oCw7YaD5GMc=;
        fh=PyBCyux3Bu+EP+fTwlZW/a3B84X/dTnSY53ElTZe7Zw=;
        b=QE/CJFpcglrMremlIfTCzwu0XfXFmY0tZp52UAFNPvcTxQlYlwYpE86dZrgTpdjy4U
         O6ScNBKqxbwgd3roXtmsbMNAS164kITLz1ucCb08YtvGxLPdgbS9dkvnL7fnFFVz/2Xr
         bp9S+0U3jwMA2FjB6bVdmjqpewINpcoBU3zrGGvUjDmEqVJfybsayAF7lyJQxQ5zoShu
         p3cFwzHjYivT1IgTdEmx1xuf4ClvUtn43qgwc+GlxzS0QfFNx/o08aoGgGP7uTHPiV9h
         PWMlbW855ZZibagLKgnpl/mDCyFF4djTh63/6UOq11hZJo70Pj7jUL3WOWpupbH6NJTm
         wESQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769403830; x=1770008630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TURsRJX/l+dAMyGfeaEK1RXM6AayYYK3oCw7YaD5GMc=;
        b=WOR4o9l1r3UFyG+bbpEAGEe6TSE+CQHp3FGnvjxZXEzTcm5FWTzdQRM3BvWYKnKUsv
         5hhiaF7a9kXvJO0yY29Na4cHwxTr2tdvtogJJZqvzYbU2Qm8ZmKkT2cWPH/qqTrSis5U
         7vk1hhi6c+YNZzQT5fg4IgEfjFsxI1UvvhXoUHh6iufDejt0buTNbg5AHAkBK5QTo1IG
         3+wqkAL6/hvVHHsITBRBhejotULMMl7NrgazYpSeDpGOh3mvtwo3owkDgUeTlwCnuek2
         PwWTp4wM8uyMFaX8SIwRXfEEPG1QSiOOofGkviL0pFRV2wfIkSuT3rqzs9RXBPxGNe29
         0hVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769403830; x=1770008630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TURsRJX/l+dAMyGfeaEK1RXM6AayYYK3oCw7YaD5GMc=;
        b=SmOsbBkIkUqQsJSboimGPwPmRxHYMA43jkqTKicuP4Tx+bZyGQt2osVf4bFQU1KdB3
         5osnCeZT+RFd0mr7d+F1+zomUr3UWzFjd8fx7CzAedpVfLzyL0xMSlA6SVydFsa9K/2I
         Jba2+6hy82mix9T94Texb2j2q39WlJdqTvgH3oQhBCsdsIofayuKUL1l52j/B4ZhArTx
         butnHjgCE8/2kzJvgtX53B1fgIoJwsJVmLU7VK7V1N5D7sd+laywNfPp+wA667uHnYEe
         cAydAJc8eKLNmY2uJ+qh4cvA7fOX+1e87iV/S1QiVn5I7xYC5UvLPcW69skBkxnTVfrk
         sqoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2OyBGRFaKVqi0N8J94dxhQ3Iwz8VTMFfKn1YW7aXrU9eqHzIwzsV/dgLrORzG0OjpgGzCFpF5qQOY/6if4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZzMh8Q4+gt6kfr3fXawA90rtllfeM9sgT7E3JLwBhKRccMON
	NiilfQJYF4T/5XaJZ+qiAokunIDUxHvJ6v+fO/psWgKik2/QbdjZ/AZ047ZujXsgmcAuFTyr83J
	Ts77/kwJcilMLEYjVPTyP5zCbDu2D99U=
X-Gm-Gg: AZuq6aJY7uSz4RBI85KimrhH0aUXtAFb9eE6Qf3j6iVpn9iTnTo5IhExr4K64cuWkPj
	+aOO2anElcM1Ex+qwSrI37ZH9kg2z8dxpChE4EKsNzF8B8nO0kr2qQO3JoSxfSqiOJ6z1QD4+RJ
	jo9sBVgEuvnCWMe7053rNWGjWK3Kas+gklkC8aFspwRGOg6UzeTs9SPtV3DFr+yCsKW/ntPP5r0
	KYY+B7trcYYcxxlf3vpZNw8PiFq5tXi0nP9AIpWVCpFdkqDHngEGfvUqP9fdvaybCyX26VHs+Wb
	IVJWVBDuJyecu5C2O3py8w19DgGJuVepa2MoeVvS8RiRka3cryJa+G83NxzaOnfbV/yNgAfubge
	qbUYyQFtsDpbU
X-Received: by 2002:a05:7300:ca1:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2b764515574mr819499eec.6.1769403830122; Sun, 25 Jan 2026
 21:03:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251130211233.367946-1-seimun018r@gmail.com>
In-Reply-To: <20251130211233.367946-1-seimun018r@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 06:03:37 +0100
X-Gm-Features: AZwV_QiuIl35tIDZ9A2RvwX0KC6q9d9eWn8cmhcabuVX4oJ-xdCEj8prALkRTAI
Message-ID: <CANiq72=dKd4nkkCtML9T2RsrFVPVLqgLZBgxJZYeE=KnCh=eEw@mail.gmail.com>
Subject: Re: [PATCH] rust: use consistent backtick formatting for NULL in docs
To: Peter Novak <seimun018r@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 10:12=E2=80=AFPM Peter Novak <seimun018r@gmail.com>=
 wrote:
>
> Some doc comments use `NULL` while others use plain NULL.
> This patch makes it consistent by adding backticks everywhere,
> matching the majority of existing usage.
>
> This is my first kernel patch - just getting familiar with
> the contribution process.
>
> Signed-off-by: Peter Novak <seimun018r@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Reworded slightly. - Miguel ]

Cheers,
Miguel
