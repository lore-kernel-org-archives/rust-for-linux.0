Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0B1D6BB
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 16:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349430; cv=none; b=TcjlR8Ego2cJe8dvEtYpbOVxrgkusnUy1r3MWXlCOY+QdE8UkBzIxcGg9gseT+v/6JfX+IiGn2Tu98Hyy3n3RjgOV8sSsfMYWJn77rIy44lx/4SW6b+hdslE76bxV7bE48hGNUiPogtwxvsCxiX2Ab8BJV08l22GZKZBvWClBLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349430; c=relaxed/simple;
	bh=GD1rockcPLLPoutAyUyCLTlyfHITwp2bLmYUsEhn5Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/7pRgWoXvu/i/9E2tVlG5x5Z0vZIEvkygmnarSmofdeLFM9FordQn++JH0FfbMmcnp5L82mxXgME97YAicxTOH63lbJ2+H5SHCnmkQB5XoTDlbMoaB7o2LpE9uUoIdRg32RrnArRAiaqnYg+DrE5QdkFwydsyckX6vbcpDe3QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yyy4cZKc; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yyy4cZKc"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b475b63ab66so216060a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757349428; x=1757954228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD1rockcPLLPoutAyUyCLTlyfHITwp2bLmYUsEhn5Rw=;
        b=Yyy4cZKc8crY90mGnCGCNfXPuTsDlQb8/rXT99TkpyadAPH8+oVvqGpEKA7uM5XHsM
         jMdsMqM4D489/sDYmBiDyIHpASB1bnIMBxxztk3loEW+skb9JZBwMm+y0BFJlAi6WKrA
         66s6+Ywqw7lFWwY4VP/zn7TOXsUlru9m4i7MqcVpvL8i0mDDhmzJ8rs/JqdPi4GTObHl
         ExLD6BxY5cNeYNULUCDFLbuo5qRaVWyhMzUB15I9acKSF2cqJs3n1/cQiYDXLQN29u+U
         xwS/Ma+WoA7La5REQb8WiDJUbjuZzwePyYkNUiMyxCqrABYDbxCj/INlX72xz/ujdVAs
         UCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757349428; x=1757954228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GD1rockcPLLPoutAyUyCLTlyfHITwp2bLmYUsEhn5Rw=;
        b=ZV/3u4eYF5YtGx1oxSbSNTtjj+cAyG5NqfjzZgb+QobHaCQXwrSvnxY7f+GgiCO/1B
         Q9UZtwKGsIEBnl2Il0Jfhvw3xiwKshpa2xUU3tahsT4P7c3ef9DxfSWegHdRyZ9xvysS
         hmDrFppxoXtWA66oCuofp8uZ6rsHu3a4P/AuaShKdKqYDG12RPTzTi+1EVWBjs4oFgg9
         UUbrkyWUnD5grNhCiIea9y1zgzSwyCInBVoSQu8irbwD9QxmlCW9fXC5z8Y3V3purpQk
         10QrJm7Mhg+fdVsBp8XZAc73hgdkySkYpct5aud7t7ZsyIUul6FV2NUdlsKXppShfsHr
         DWfw==
X-Gm-Message-State: AOJu0YwB510iBoxO/TftjCbYOg4CVbxstKmm9HK1EX2CZ0qJpzQQJDTm
	+bkyOWLV8jS76LcUd9ZyUp2jL4YWK2OHIPl+gX1G6e++imNe29iZoaGuzC4VB2q5H373NPB8ooi
	jRqDh4qp9fc69zyBbGv4hvp/j/6HZmLQ=
X-Gm-Gg: ASbGncs0TPLVkduxzbxKPliqNDFr+trPUH+9vYyCgdhUBmY4Tgc/5G1dwE435b7NJYY
	3TgY4dE1hCd51znoYPdRVgmgTKJIYWZlgw+eA9WhraHt3u1cRrs0ptYa649SHo5RMsjvitzLeB6
	IQrKRjR7TzeDDiZDvZxwxPepHm+5VnX+eb1QWd+tRrfeJ7kL12/p55QcFkcbVb/rVGL7/PoNb2K
	MLa0gl0vcnEdFzZpumPIV0GnmghtwVBbWUCk3jlJwflL+S37qf1qti98eP1BxwtSXiC8AXyWO95
	BoLrjwXhIb0hD+aZ+Pda4JhcdA==
X-Google-Smtp-Source: AGHT+IG2myJ7vzeUyIz9b/rwozFXjQ9JQF/2Y9pLORdR5ksocCK1zUif0LUhypbVeitvwClaHWMsNtcB6ahJXXZ/3H4=
X-Received: by 2002:a17:90b:1c89:b0:329:df65:de88 with SMTP id
 98e67ed59e1d1-32d43f9765bmr6140000a91.7.1757349428321; Mon, 08 Sep 2025
 09:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908125339.3313777-1-vitaly.wool@konsulko.se>
In-Reply-To: <20250908125339.3313777-1-vitaly.wool@konsulko.se>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 18:36:56 +0200
X-Gm-Features: AS18NWBiOfnr_oE4JYJeMuf8U4qWLrtNvA_XHCFt0ZnpsbVAE9UetqtcLRqpwkM
Message-ID: <CANiq72mekzqaNak+KYxqzxOeKpmNDYPO2bvATw6FkOjHWO1w0w@mail.gmail.com>
Subject: Re: [PATCH v3] rust: rbtree: add immutable cursor
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 2:54=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.se=
> wrote:
>
> Sometimes we may need to iterate over, or find an element in a read
> only (or read mostly) red-black tree, and in that case we don't need a
> mutable reference to the tree, which we'll however have to take to be
> able to use the current (mutable) cursor implementation.
>
> This patch adds a simple immutable cursor implementation to RBTree,
> which enables us to use an immutable tree reference. The existing
> (fully featured) cursor implementation is renamed to CursorMut,
> while retaining its functionality.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>

Could you apply the `&raw` operator suggestion from v2 so that we
don't have to migrate those later?

Thanks!

(For some reason I am not Cc'd)

Cheers,
Miguel
