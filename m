Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D4C344056
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804774; cv=none; b=NC7rauRzu4nBdp3Kn9ZQmwzZ2F/7KFTN1QbORv+/3n7iq+Z3W0PY2lrgU9WR6NwJvTwGEQumjrrwlKbeVzdHYAvuYoFQvdlTHNJdS0QDIVfRMi92XUTuu5R86XUZ0kDztoOr/VV1EHnSR9dT++wIQYm7++n9x1CKsSvzNeRNMCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804774; c=relaxed/simple;
	bh=h5ewnyvlu0xsde8dH+kzKb4XaSR0fvFyJX/BP9nEfqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEMkRsBf6O4pztgGMmx5KI61qUbT/fC3pCgJ8FawfHtVvOlUiKoIVwUQCZIhV4ZmMltxcSIs/TG955mtQUV5bMNB7L/Njs736Z2SJ1iIX9QK7vjOp37AUHPYylDKImAGeQ6sW3byke+I4E03S0I47PyTZpbHr4FRZtx/alVV8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQMk6z1O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQMk6z1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35ABDC4AF10
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769804774;
	bh=h5ewnyvlu0xsde8dH+kzKb4XaSR0fvFyJX/BP9nEfqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TQMk6z1OIwulNZhMPl9bEDldBgeMbhYaWhUQrD6wtJgjyvKbrrY6jFKW0HNq3d0PF
	 iAO6Ngt4LIA/60zH3UZ9UY327PJX0qfGgmdZFc5z/QFVbnEBLg0Ao1LDAkyaA3fsQK
	 Fj5GfGJNE32NRB3mCs1zKwyKajA+ZZoxhlG5AC4GIwd6SoSlfhyJt2FPqcda5oB5qS
	 RAMtJV/ocerj75Nj2Fiui/6u07yjbyP7XghbMvM0hw+uEMt7bb/yY5aQ7epDmvDcde
	 CimZLw5dkF/i2TjxwJ12eC+sEn3QRe2hTw6OAQq9TON5z/QJZVW1QftbScH1U/uq1m
	 1fq45O9Jxpk4Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso20135061fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 12:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXy0n/RLxEWZHeY/bwpxVD2tKASx7MNFD1jI0Spt9/6Iyhz65G3P/x/vvVhjDAEltP688/eSuSE6WrkT3k1zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJSwzD7XLqhb08LFd9shqAEVAn9n8eDuSwnq0NVIz8xjIsKMei
	xTYheAPzhc4RTcOyemfg5uMs+sbmUq/cSnuYqvOHyePQe7rPIDTg0QRBX1bS17zOAI25h8i8N6G
	PokCvJ02q33aIBqJYv4D9flmNBTD6ScA=
X-Received: by 2002:a05:651c:547:b0:383:f7:1057 with SMTP id
 38308e7fff4ca-386466b3237mr14787081fa.44.1769804772887; Fri, 30 Jan 2026
 12:26:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-scripts-v1-1-ff6ba278170e@kernel.org>
 <CANiq72kkxS9ACvR52q03AN+WdFV96cK+tvejnnDXKZTKuKZH9g@mail.gmail.com>
 <CAJ-ks9kiWZr=82sztLfYqtp-fvsQ2QTgTYqNg5hSsZMKCsvjZA@mail.gmail.com>
 <CANiq72m8Bx=1s1+_OFxE=PFOjKrtuh_uhsomTA9VwQ4=Fz4d0g@mail.gmail.com>
 <CAJ-ks9=zWmVnspkfCqPH=+-_qZ0YZVyNrs2xMvRRvEmr-mNMcQ@mail.gmail.com>
 <CAJ-ks9nMHtAaLc_LHOWqa_hTRqVcBNpGsaC49VFh2O+_3AoY+A@mail.gmail.com> <CANiq72m43pEweeWdg0qiGH8Yq6MyMJnFYsxhfYHeZu6LPxFPUQ@mail.gmail.com>
In-Reply-To: <CANiq72m43pEweeWdg0qiGH8Yq6MyMJnFYsxhfYHeZu6LPxFPUQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 30 Jan 2026 15:25:36 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9kk_zqO-7JiaWGPP8+EOsC_iutGEOW7hZtmKTF6W4oh7w@mail.gmail.com>
X-Gm-Features: AZwV_QgBZ2E4czdZQN3pQDd7z8RjIjyj4ntoIpUiDXh9c7ieEVqekmu1Wm53-bg
Message-ID: <CAJ-ks9kk_zqO-7JiaWGPP8+EOsC_iutGEOW7hZtmKTF6W4oh7w@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: define scripts
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 3:23=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jan 30, 2026 at 9:15=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Applied to rust-analyzer-next. Thanks all!
>
> Please see the other thread (and please reset the branch to e.g.
> v6.19-rc7 for now -- we should avoid giving linux-next unneeded
> conflicts).

Ack, done.
