Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE43382FF
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836177; cv=pass; b=OXbn9Pk5kFQZE65NdS6Tdnw8v38nz3rx0mWS5TCygtghe6I31RKnwYY+dC98xWiYxxgNugE/lSCmXu7u6XlkyIq00X3+yRB5EkbEZDb9YcuZJEtqN0a0ac45vs8pJ+KqHGj029230fRKRINyDZQHFMDCTZrmjgijk9gFF6YG3zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836177; c=relaxed/simple;
	bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3igIvzeVDCGp/S5aPR/QbkVkYcmDglSpBuOjbOX9hyi+xJ7AVz0w1kj2mZljUoIYjjmyTZQ+vDeELQBgszVxr7E98DGdyX/5aaaM0SDgB8C3j5fnzSZB0SdVZlCpqy2C74DuT4hMZ04kfXPp3nu/08EPzdoOWYXj7xGf8M5RoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AitzS9lM; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AitzS9lM"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233e05c77bso176898c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 07:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768836175; cv=none;
        d=google.com; s=arc-20240605;
        b=kH6r6XurTwTBF9gCytSJ7nWCD8TYQsY5nSusQ2jucp2nASVYG8Et0XIpGN2V+EtUbh
         ln1fGBFQNts9QpD/wMdr3JoIKQbSr9ZZGq3L0ATP6IcK0HKO9800nZpUEJ6f2jcO0Xsr
         UcJ9OI7smYMVsN5wmOrQVADAeQtDVBg6PUHIuU0PAta4UAc+yxP2T1hm4TMuaWY2aqOG
         O0iTvCj3YlrQQfTgIPPS28Bwv5lMXTeE+OVp80ow9pOFaFfIbF0bNicWppRw8WgcZctQ
         D5To7+zQT9vfBJsa79Xomj4J4+sM3hztRFS+5l303FTFhxEZFeFCkuA0QSbCbQB3teUx
         zN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        fh=wLIyOV2hXZHd4V7Fl/EjPZMZ3DO3P5pY8cAEG+MgFOU=;
        b=NLF4wEyYcSv4JQfwAN/tN9qgzP6Noz06ZsUl+WD4bsyheh00U2Z0tvhbpN3tTBnsI1
         zg7ABiRyJuFXgrXyP+ltGO5rv48zacAIE+H/NLPBwfOSS5pyWvxZVzSWDiVv2Fu+6E0U
         HT0TfY97e7G56Bjhl0s6Qz1DSsUIablwpbW8DRbk58zQAikbXAcG/dYVA6ROjGdWrFaL
         7Qd44bSJYtcfH6GyWCUY6eCF+FYeJaepwWTPMIxur5WbeTXEsINj+T4qT1PW3uCJQSi6
         /JIY+5YwH2La8V51yC6BdVIpehlsAQuYndM2Nb2j6DtM0PcnHGGfGpk7tIe25IFx+HXA
         jLUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836175; x=1769440975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        b=AitzS9lMQwv4+fdWYBLW4qMQFvS0PfAesTfFeFGvl6x4XWg1Y/WFr1kTmFIDODAIrT
         OsJ3v6RHnxP8T7v/xmPcJA9AvmSAxKKeK7k/YTdlf8rSOfSNqEiMrZUis1XRsW/5TFTU
         I42ndpD/s+RX+n1G75OsTnYR92yrNDKQa7Nlb3Iym2/QxjJu8vwbU+7Wp17DxDeU4wDd
         TmMjKSlZsub+p2JSB9288ug/ipPwFzsDd1Ni1l7h9CtWRRnodPCrXHzd07aUIb08+ovj
         iFcB29jKkC5RjVwPsgTsq5r8E/m5iWgLSgdd9oXoJmvy1qA7PSAHVTb1Hhxf4ctF4H9m
         Pvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836175; x=1769440975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        b=QUt+yJ8qiTpZCTdbzo0nKDKxNETHAT3FaUH8iXz9vQVMWfcVopIzsOThyZ8XL4aZoK
         wN/Cu0ghUARa+tNaDLDajfXTgyBfESdVQsB4NiTrpB/mNPXn2RcDvF6xl8CYXqqLasgH
         SCQjSEUI1IcIjYW/r73c/Re5Kj355YGCmCrg9L5S3OpXFHOsG2bToL1rF8x/lkIFgsIM
         +nH08FcK/zGbVbQUMXMe4BfWnfi4WZr69RIy17MyYNNKtt0Ry3Ch+5hEfkm1IoWK0Bu3
         AlJoOySWj7x9qwAJLMUGgIxGYHn3yDWhqOtiYsOSRlGdnAqoabTeKUPE1mOD1H4AYc9o
         ul0g==
X-Forwarded-Encrypted: i=1; AJvYcCV4FfNtNdBVJOZVc+lqUzgaI+j97/iyGWuG/+sa1xhSYWLlmMxjBG6WY10wl5WaNv+h2qL8p2Zt3WKoP7GgwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn3n5ogEVjOx/Bfy0Tnd1hCmNkb5X12Kv7cSuJB+0HxR0oqT0D
	j1nCR6iqCb550bO3DuWIqwUw+Wa05sFTs/bq5HFaxBcxPc8pP0NcueRZH51WuNzxScKZyIXMHeN
	NB8NbD9YpDzvUF/otT4dza5dj31fCARM=
X-Gm-Gg: AZuq6aJ+w++AY8FdTLg90MkFirU2BQdE+0vDeCA3ekavKu8MvzSm+VWdcWzzK6P2vzR
	Ao5zYV+SiGir/YW6ca24+XHPAESw8OZEEk4t0h2KorsC2VgB8sTKxtUrw4NzcP6YXDruhicFj7W
	01pjcXHe49QESLupQJDCnCvX7vVmnltiN8bW7Kk+0c6H3DfbHQTfP32sQZb2mdmO+z/Tg6B5JUy
	Kh3icNe7/Ed8f2T/Xwffv5GaczF0d18UqEPmKybo5Qi2bynMS1dVEFPQc8t5qMA+DNEthEQlLg5
	3NqFzYOABf+J8xl2tLIJUUjJzcdPKTVl/0i0Yn0CtViu7PG9QI9LSp9oxMwLUMMay3i7XXFf8bR
	TyFw0H24xDUcI
X-Received: by 2002:a05:7301:228e:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b6f613797fmr27366eec.4.1768836173425; Mon, 19 Jan 2026
 07:22:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
In-Reply-To: <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:22:40 +0100
X-Gm-Features: AZwV_QgNN_SRIlYoHUy-qlXXeVjMEAqzZugkTtOGHbXvqJ3qT7hNtgfXtF3Q8KU
Message-ID: <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 3:20=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I guess it's time for me to work on a `#[sealed]` macro...

...and perhaps pinging upstream for the language feature... :) I added
https://github.com/rust-lang/rust/issues/105077 to our usual list of
wishes at https://github.com/Rust-for-Linux/linux/issues/354.

Do you think using the linked crate in the commit message would make
sense? It seems to be a couple pages of code, using `syn` 2.0, which
should be fine now.

Another option is a "good first issue" of medium difficulty if you wish.

> I wonder if it makes sense to add a general `ErrorWith` type for errors t=
hat
> carries error code + data.

Sounds reasonable...

Cheers,
Miguel
