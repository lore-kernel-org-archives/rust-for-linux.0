Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB5134CC4
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 16:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708014163; cv=none; b=jFaO6ro0VkcTxs56pTaf0uWYUyRmAK0on5U5wnoLcf86nMB8keBYHlIAH2Xm6y8wbiHJGVZl/NHyC63O8/8ObVcVIiJjdv3+/eGwTInns/B5bcyJ9pEqI0QLSnW9jUUl/7rLrJGU9eIS0cYk2rDzi11F1p5Vt/N5xudGPZz40mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708014163; c=relaxed/simple;
	bh=7AyjKh84fOCvKiTmuhjSM71fcPvLExae8y+tbYKHq0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmsxrRZaa+aiDl8kF7GaAGl4BH594p2JFzuHwRWo+B4MX7Z4UI6UMgsoG6E/3AqDTqqDHC1y0mxdHwz8xtqf1BlnbUr+Ny8I9Cx/sXZECjfMgsbrET9oKhdt5n6H7NrD1JKede9knNilneHCs7LBwA8GeZUbFCMeXQZ+bIXlb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SC8xVZkc; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SC8xVZkc"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbc00f6c04so973745276.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 08:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708014160; x=1708618960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGvGfrrYLjrlEnkQvO8Soq6v7mfeS0qmtn6sNjFSZ+A=;
        b=SC8xVZkcfjYrGI+cd3kLEONBYOW7Gv6CKemTRrsLU3P5PX2G6k4XKgHZlirmGEeS9m
         fRUeSGRjwAUttC+aU0kLXFZrnA45AKEVieHI1QVQRQfH4LaRmFwHucXJWgP8aYQPjldn
         4ZHM5wqvjImFtmTz2zzig55zrWl+N5zxPoi0hVo04PGD4qHXA4+AZdQ+mfJr/1Rj59ld
         0RX1I8+Xz+3fImHRrZ0ymDGVtg+2D89b/WCkF7ScjbK0uh7aJfS/sRe9kz5uKiMe3w0A
         BX19XSQifLwBztVbZMt9oDnH1POLR1Uc6imurQV7JRACHqRcJDgVyechNR9fkZ1+HkI5
         d74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708014160; x=1708618960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGvGfrrYLjrlEnkQvO8Soq6v7mfeS0qmtn6sNjFSZ+A=;
        b=w7ap/s0Bsq+SXGZqwyTVAacB0mWm9QgM6mTcbIGHiiLVtHkJ5iAxwfTkmyQdyhVBft
         TmeXHp3X5Ur5miUbPew7Ijs/eqcbdz0649KuLMjSxsrCZlpIu7C9pvXJNkltcE5iP0Ml
         R64hOYOfViwpgNWtPn1KDlH6pHijGUAhWyMuQjpzgWPf2mUog4YGNjUfBJNWk6tnb5tm
         VRoLz5wnld0N/Lhg0rUK8h2xLt9emQcOxzObfGp/PxQ+TisAFlEUgBDAYk9pklmqByv7
         jV1E6ZI5r0v4QNWMxOvRDYJv9nCR95ObiDbdBHm3CBku8CcjkSZNl4YKhfYH0C/E95iH
         8fzA==
X-Gm-Message-State: AOJu0YxJtkmLDQtLHw4zc3tR4mEty6zHJx1fWY8RV37EEd7GH69GR1SD
	wAI87lxDt+rSCoN4oj/ClaUjsAw4/LQswggD/FBLFQ4BWB0WYsezNurmq96hut8tw2HrmjAguKO
	JV/IFUnl2JaOZuFwy+nub5r3gB/U=
X-Google-Smtp-Source: AGHT+IHzjXTzVI1xOq0yK4LeInNN0KVE8pVxLMx/TIrutZJmVvox22Z1nXoorder1s4BOp3/W/t7M1Flbhj0HQVuueU=
X-Received: by 2002:a25:b20f:0:b0:dc6:9b89:3f75 with SMTP id
 i15-20020a25b20f000000b00dc69b893f75mr2213125ybj.40.1708014160690; Thu, 15
 Feb 2024 08:22:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <803d666dcd5b1f927590719c10bdd90ce2ba6dd0.camel@redhat.com>
In-Reply-To: <803d666dcd5b1f927590719c10bdd90ce2ba6dd0.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Feb 2024 17:22:29 +0100
Message-ID: <CANiq72kQ52nMEhe_-_vxRjV0-BOBU6DbfYUni_SCEaAyrZjc5Q@mail.gmail.com>
Subject: Re: RfL currently does not integrate very well with some Kconfigs
To: Philipp Stanner <pstanner@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Andreas Hindborg <nmi@metaspace.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 4:24=E2=80=AFPM Philipp Stanner <pstanner@redhat.co=
m> wrote:
>
> Recently, I've been trying to accomplish some work on the rust-pci
> branch in RfL.

For the `rust-pci` branch, please create issues in GitHub, ask in
Zulip and/or contact Andreas through Zulip like the website mentions.
It is not code ready for upstreaming. Please see:

    https://rust-for-linux.com/branches#rust-pci
    https://github.com/Rust-for-Linux/linux/blob/rust-pci/README

> So, it would seem there are some "deponds on" entries missing
> somewhere.

It sounds to me like there are missing `#[cfg(...)]`s in the code
(i.e. conditional compilation), rather than missing `depends on`.

> Is this problem known? Any plans or suggestions how to deal with it?

If you mean the specific issue, Andreas may or may not know already
about that one, but the suggestion would be to simply add the missing
`cfg`s -- I think Andreas would welcome a PR.

Thanks for the report!

Cheers,
Miguel
