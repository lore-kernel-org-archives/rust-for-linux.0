Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521E9279DB1
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765432; cv=pass; b=GfvqnB6MQuZLAeUslAgOX6aDLAw4jNIyibFYmFha2I01Mk7iypPQiQKYYNeceSOdIW/r+41F+lmwGaQr1XwfvFwX7OpEUr1AyJgzLnRHOpaVkhVrKiMrFIrR+p61LvudCAljzdnwWsWHtr9fHlWU1QB8+mqlv0w7q6/6K/AlTnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765432; c=relaxed/simple;
	bh=F4WtBtG2uRw/Xzutcrw8PBBiAkS05j8ADGY86duiKZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMrqgeiW76jo8tUT0iVzqLhVZsT7yqEIdXrrXPTyAnJfF/smX1ShJYud7nxsCcopOz8Iw4W8vFqXKQWXvlbOBkbKeLCTFnh6hBq1lSTOtIM4Tit470nQYfLa2VPE+JgtI6woVV3TxVY4WvB9MDkRxqRAilXqJcsZEnoQ78oPoF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/uFYV6j; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/uFYV6j"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ae60d8a05dso413290eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 11:43:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765428; cv=none;
        d=google.com; s=arc-20240605;
        b=cdlXNDS/Yy4PP5AsnMagAfNGuj+AZK1+xyOUA3lO67/ozlaGPZWs43h7sQwC0E7yD8
         Vw+mPdUhgjG4C/eCwUsTQhBs/3cKiH9IL2B5nuS/K7xiqy9rbzfCHWynm/WzW5r1fSuA
         vWkD7pU6zJZc/FRIZ+Bly890GYs3Dbp6xW5V3BkxXsFkWF9V52mXO/UiFX+hnQH2kj8i
         oh6UmGg5WhXFlAf5cdmYQgbAIXrHOtlBLvHSw4zwqGEvBbq1Y//Hy6fWT7SiiNqsVZj+
         aZW6ps5ozRA2j2gW9IZG4taKSbAShg0ug0rQrqf8OXEbG2lG8CzexduwNXegf55UL9ta
         jfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lKWUUmUYh+0ckefyFjeA/Xoknaiwh9Bidbxp/W3Xc/8=;
        fh=GT0V0Z/8u20bOHii6+IQJHBO/3INv7chRiPn7PN8blE=;
        b=Ov2RIMqi/HYlmf02Q/+4RB+ncVJ3S/4u+pi3UujSmEMW/cbA28LB2+49AfxR8HKOwP
         WhtjJlwGtbtJwFy7qTBeMFU/o3eEVbXd7NhW/OZv9AI4WQNRuAK3QRtpttJXTF2Nv2dw
         XKJhWrpcHGT8L8Tkqwp6TX0142H4jp9xhx6Yfp9izTbVkJUpzn23D5EU+h++ssQZ58qJ
         GQyYUoTY72wkv+IkpZyghAszd9KJBLyCUgIqYngDarx3Agb/+ciwPaiLo3HKO9Bl1Dr9
         fU84cfQdSB1NWDstwjAiFr1dcMMBc5S1OzTnOzmMYMEl0Bu4c8i8vFB0RvkCiV3n3xIV
         RaZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765428; x=1769370228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKWUUmUYh+0ckefyFjeA/Xoknaiwh9Bidbxp/W3Xc/8=;
        b=K/uFYV6jHDJhVgBR87AApPuQhdSk3slQg1I0XW5XwXt3OsrcfUI3QI+f/3ZGPYUTgP
         W2kM7qZESlqOWJ3kkhXOH4sZMjoGlls5hFq6PUL7GSyO5PwFqbWFf7gJ2nrPmEeRMcli
         0CaIWQHHwOh42iNduzHjlU32/mJXgyeAXERg06CNwIeVmvGfADLlad0PgfmM8MhTqqFM
         5ugTnLviO1TRSqyg8E4P3xyIHrsf3/bi539LPvRj1s5mXBwl+i04hRe3tY682vizDyi/
         Dvu/XbBkMHYhgkVS+Ge9+2AYmlUrs/iIzqeaFtGuzaDux+cGHPye7LDs+3GtcZl9goUr
         2bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765428; x=1769370228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lKWUUmUYh+0ckefyFjeA/Xoknaiwh9Bidbxp/W3Xc/8=;
        b=sLcMGGtIm4zxRr2wK7Qf+OXzAqvuTaMh2HHhdg0F9qDjJoXHy1EOWpSY1nEEY0N9BJ
         yEUFQ3X2BzzKJ5aYQ59NEOHIN88YO8Xcxsm/KreesqYJoN7wn2uHtTAAmt1jvltk1E5R
         Trnms3UwtkzNK8BMCYVyyDtJlkb0br9TIWoz6Q/CUOlwMTbNnaji7LFoLQcTcfmJtp5x
         Nu89mb4Ysv08kAdabBM7kNt9hW+axB11eaA2cuWON/JB0slow2VkjhLLxDt5aMg4WF8R
         Qd8GL8kNLNU3nMWU7AdB7UMwC3sgYBKU1ZgaxCzbaTbmAEhcuT7+tGavKVfahp0tjAXS
         gdKw==
X-Forwarded-Encrypted: i=1; AJvYcCVouPZ8zICoeBNxmqaqN2eMjVhwThJwMClp3ZM5hUrYQJ3CPZniqi762NKrARnIFRxzeyQxVbwFdZduFtjqUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV8TNrmYszlp73F0rlaURbJ9Z/3lAOjVIwu7a4tTJIBJGkPJc+
	tWEgxlwEb+lguap67Hmo42fyl05lVWuGgFGQCB0ViZ7TfgemQ278EHIWJzTdeprQa0Uby9puZVu
	r4gVOTrqaMKP1j0SlBW1T2waVSwKyxkQ=
X-Gm-Gg: AY/fxX6c1SHfVI6r0swQjF5v1ZqNjJe/RnbcEHc21e/6wbC1yjJpJvvVc6QiooZR7Fb
	i3QxvcPqfTWJnSgoWaMyNt8ztsn7caD8pzSQS8hx8vLSD6+rQOBc0me6wfeqSrL+XVJmxgLPdKO
	64RA0wem+BYQQJpUsy0OOUWUTuwYNhgMEXTs5Gkr8eltDECGV264L3eR3TUBpa2aDC/QYGe9Mw/
	Vi3rpiIIvytI9n4bq7joyoSG11lYN4mhF4ifFhD3gJCSKawqQmzB89aNe2AgX10dBpwr7XChkzR
	4/T9JbtBJenLBkcxh+brS59TZgQ3aKNSE4E2fmtQaUAnXuxc86nHfK5V0L5MTbqszCiWiz8YCGi
	Dz61z8Cv/Kk0/
X-Received: by 2002:a05:7300:748a:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b6b40adeddmr4214503eec.4.1768765427965; Sun, 18 Jan 2026
 11:43:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
In-Reply-To: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 20:43:35 +0100
X-Gm-Features: AZwV_QhZx-PRrprYZmyWzXz6io81uN9ZgHtjl6uEXpslwTsasjN80NR_YFYMw54
Message-ID: <CANiq72nAQ=1noxry3P2d0DC0FDsXC77ZQfoB=dh-qLPSVyp=2A@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: syn: make rust-analyzer treat `std` as a dependency
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 10:38=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> Fix the `generate_rust_analyzer.py` script to ensure that the
> `rust-project.json` it produces includes `std` in the `deps` field for
> the `syn` crate.
>
> `syn` directly references items from `std`, so rust-analyzer should
> treat it as a dependency to provide correct IDE support.
>
> For example, `syn::Punctuated` contains fields of type `Vec<..>` and
> `Option<..>`, both of which come from the standard library prelude.
> With `std` listed in the `deps` field, rust-analyzer can infer the types
> of these fields instead of showing `{unknown}`.
>
> Verified the explicit uses of `std` using:
>
>     grep -rn 'std::' rust/syn/
>
> Fixes: 737401751ace ("rust: syn: enable support in kbuild")
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>

Applied (both in the series) to `rust-fixes` -- thanks everyone!

    [ Reworded title. - Miguel ]

Cheers,
Miguel
