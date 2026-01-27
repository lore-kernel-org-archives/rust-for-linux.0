Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E71358D35
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521146; cv=none; b=Jl87u6F1fG2Tnd67IoR/9aqs0/0gAreGxE7iKRo3UOPc33nx/SfLA3Z7ED0Dp9a+2VEYCzCYrfulI4HD5p5dFsDBwxJBC2lQhS5ynEUIQDNBhLAdFQe5jBuvr7ZVy7LUct9eje4l39njgV78vSGZMFWr93waQdwJd+QErvDVHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521146; c=relaxed/simple;
	bh=W3ncEy9a8Jtsn/YFVICZjeEx0lP5dJLgOuRLqpB1sRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKb0CBZD8Vp1kmbTHjIBxBA8dka/f9svjWl4HwGEqY8e7S8vnGvdBeOaq0ebdbpgO/Ttdu8rOgCpCfM3hvHME45HxYiuV2yZRxkXIZmBIB41t0YWcxKWRwdaxPSd7FXzQoEE9COivh/KHEnIEw3cDs4YI+FUm4rvmYjCbPQGiw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTXa22+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTXa22+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D63C2BC9E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769521145;
	bh=W3ncEy9a8Jtsn/YFVICZjeEx0lP5dJLgOuRLqpB1sRM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZTXa22+au5I5ZLt47WDsmM1p5pirmZwSy2X+ujn4nqvPM5IOdwmJBbchDr1R9IohM
	 1sZZzCbdGbkSTUirzwCe0SIdOEgZPB4hE6GuOr1p30smsWmxvMy5cZIor734+yOJ3h
	 r1RViXDW/79VeYd+vzpP2frrad71xevIo6xxyp+J21ZkRRTZnk15ZPpoYAp5LoZu2K
	 dou7g9d6pMFZprNrcjjsf+5aGee1QzEy6BKJC/FNt6uS2COI7tX4nVmOBDkL4wAHUA
	 Y/eY05YeIxBsiwQ0QuDyvnLL3uoQowW6CBiIv7l3EsIcXAce8Kc1U0Cpl3MNDzV8To
	 uekIkAiKTK24w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382f9211cbfso50650131fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 05:39:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGKaM+4LWxbRVgmyVxCkyT7Mw+VZtaCgk2OudJ0qRlmWfWtWk2rSbTNU02JlDUiPgPUS5x4J9JTM+YeNgV8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YypTFl/Bjg6q0dhRFZpXoqDo3U6lZXGGUTdilW8xiZKQY8XNB7t
	YnC/ZxGh+J9Iw3XqwdORhbp22ZGS0KlExof+aBxk7haKAi1IDFXVKREuKp7HQKQ/P8zF1zDinZq
	/diHdNzCv10fWG0X3ba7fRniah++1MEA=
X-Received: by 2002:a05:651c:f19:b0:383:2537:f126 with SMTP id
 38308e7fff4ca-3861c9501fcmr7462361fa.30.1769521144472; Tue, 27 Jan 2026
 05:39:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-fd-leak-v1-1-945577813b20@kernel.org> <CANiq72=+2s48M5imZ7tZj-0SN==f_mLmw_2cWfQYKtBhD1ROCA@mail.gmail.com>
In-Reply-To: <CANiq72=+2s48M5imZ7tZj-0SN==f_mLmw_2cWfQYKtBhD1ROCA@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 08:38:27 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9kps0L-VenCoHdYuTvRphe7-dk75koutbiRfNUKGi5zjA@mail.gmail.com>
X-Gm-Features: AZwV_Qg5EEzZEI2IZcg-m6JFd8zwfTCNpTO2RKhI6OEG4s1yR5i6L_9uyd3Nccs
Message-ID: <CAJ-ks9kps0L-VenCoHdYuTvRphe7-dk75koutbiRfNUKGi5zjA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: avoid FD leak
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 9:09=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jan 22, 2026 at 5:44=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Use a context manager to avoid leaking file descriptors.
>
> This may have been intentionally written like that for simplicity,
> since I think CPython closes them immediately in practice even if it
> does not guarantee it (and I think the kernel may be assuming CPython
> given the version requirement?).

I'm not sure how CPython could close the FD immediately - it would
require the GC to run, at least? Anyway, agree with you below:

> Nevertheless, it is better to be explicit and proper, but it is not
> urgent, so I would say let's put this in rust-analyzer after the merge
> window even if you end up considering it a fix.

Works for me.

> Like in the other one, I don't see the Tested-by from Daniel, so I
> would suggest taking the chance to double-check that meanwhile too.

I think you're right. I'll strip that tag.

> Thanks!

Thanks for reviewing!
