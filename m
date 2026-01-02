Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7D926A0DB
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 20:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767386102; cv=none; b=TKHD/7S6TtA4oA/gjXurZ6PfO4y4czjn4X6B3hM2Q4UWBz8ZfvE16Rsvt7DVTrIl1w5NUhpmrLNXxg9VqAXwQAF0oVjOWlDOSPyHU/CNZPQ5sljH1ZI1jc2NysLrpRdkM0GHC56I7t7nNArIlHZnHNppnbpaukCopg1FNI8tHpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767386102; c=relaxed/simple;
	bh=47uonBl3AsOxR5NEo3R74TfUGho2LZvpY69Tg8Q7Zyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHoWiZlDzlPLb2EURhwhcYS8bLPBBXKm4CeBseFMS51Obuk85W3vSeSNzsx/5dKM/KI7ExB1EKL9ELjZzsdUxbMV0/y8L8mE+Pqv4BOsz2OyyHKkw7RFpGVJLc3d6N8wSZ406vm3sLtl9d5gG3SOPRxHSvxFeEkoEt5zQrXwZ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+4h4wLA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+4h4wLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3790C16AAE
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 20:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767386102;
	bh=47uonBl3AsOxR5NEo3R74TfUGho2LZvpY69Tg8Q7Zyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b+4h4wLAL3KVJ0kZJDObfHtzkLrAS5GmSBqapllqsWI7vI1EZu7GwHdnmjbuOD/9v
	 WABqC1DrCnkZbOU+8/Xb9qpJWa5eibEQKApShDL4fXbltjip8FnLdrKw3vIcHcKG0v
	 0ST7z6S0RICBRaCjUngt3FHImOwiF8QN/lCzDjw6XimdOrH1NOMn8RY60w7MdxysPO
	 a3OIl7OAbyGegj+YRzvXH+kl2SCWKallesx6LQa6FMo+HjNK5Ev3CHs9P2oLE9XToh
	 x2MW2IgD2+08BT4SFiJby54U+fHh2d8XNZ4Q2eGfbrgYNw0JN3yl38pXhd4GASY0gS
	 hqfWtBVSrxi0g==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37d275cb96cso114570241fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 12:35:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/gxUoK1RaAvTvXRVmFCA5jqkFcy+BL77J9uiYBkb5/aoueXXsizENcQIoGtoKnEX4qgHuPK/cKGBPWgW8QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHK2fBR8/dwq/Nhbb1WH9jzJBXJYy9lHN9aT3O2+nRMJCJsv3l
	Ag6qNyWC0BreUagnzTgtnd0gglO3l9dnb2jMtltXCD3uakcTi/UvcTZ54qMYC3uW68fdTJeF3oI
	oApwDuBPDDIGNvyI4gTauJ1Kb8ohAsWE=
X-Google-Smtp-Source: AGHT+IFCh8mYGLC/9hDW/2LMzKkLSmkj1V7tU5WIw94ygxT85pgndBMYDfLbxXIt6zrMUdoF+FQNFf+yYKjzuddoT58=
X-Received: by 2002:a2e:be10:0:b0:37a:2f61:5f19 with SMTP id
 38308e7fff4ca-38121552988mr138513051fa.2.1767386100562; Fri, 02 Jan 2026
 12:35:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <CAJ-ks9nJ149Dt2v5Dn0A3+Qw=TnzE84Lm3Ridrfrc=mdhFt-MA@mail.gmail.com> <DFEDG6TK5AY9.1Y9EPEYQLMCMX@kernel.org>
In-Reply-To: <DFEDG6TK5AY9.1Y9EPEYQLMCMX@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 2 Jan 2026 15:34:24 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9krE2+K0mVkG-Ao9VAuyDqdAoPbWAK7fHyoVZD6ww=zyg@mail.gmail.com>
X-Gm-Features: AQt7F2ry0C4BZK5VJSq9MvII_B1DPppjFq8-Ur7cvMW779gfiDUfpBa7u0RGJrI
Message-ID: <CAJ-ks9krE2+K0mVkG-Ao9VAuyDqdAoPbWAK7fHyoVZD6ww=zyg@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts: generate_rust_analyzer: match rust/Makefile
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 2, 2026 at 3:05=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Fri Jan 2, 2026 at 4:25 PM CET, Tamir Duberstein wrote:
> > @Benno would you mind having a look at this series?
>
> Oh wow this is an old series! Sorry for missing it.
>
> I'm not maintaining the build system for pin-init, but from my side the
> changes look okay. The commit messages are missing some context though:
> why do we need these dependency edges? etc. If you fix that you can add
>
> Acked-by: Benno Lossin <lossin@kernel.org>
>
> Also note that this might be different in the new build system.

Thanks for the review! I think the commits all include answers to
"why": the first two make RA match the actual build and the final one
does the same and also fixes navigation in pin_init_internal; before
this series, go-to-symbol from pin_init_internal to e.g.
proc_macro::TokenStream doesn't work.
