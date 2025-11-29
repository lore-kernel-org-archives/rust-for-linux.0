Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C89C21578F
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434023; cv=none; b=qyjSx28SiCWOEmC+5XqiBDmzTxmdlrV5+D7KI+KQLgOGlQLYMCF4npxoBZY5h8+OkbZq2D5mXoeflbGcPfpdqROOLWbCz79mWjKX7EzZSwx10tS5LEF8BuxiqvVew6yezqYbrDDnuwFS2kA9EAYTx9qfPZVoLgkNcPzy9+2ctxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434023; c=relaxed/simple;
	bh=NN6TsbyX4hoaLw4GcnUn6O9qdmHktPN1Jm/84Hdx790=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSVVtqlxDYFL7RAeUHiNGea6GKdrJ6m3nwgxGYPJ5uY7TN2ZWvDol6nI4m11Sg0tR6Z1ezg9f7bXtAtcvzopW0mBM5BAKoYpJmKh1qiISM/bBd+bw2TmXc7akECGdPvVP7oWg4vuzuY07bBYrhgDaCiCT+75qbtLPqlzEEvzCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFixP53b; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFixP53b"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bd2decde440so188813a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 08:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764434021; x=1765038821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhOBbFh8ow7X2imKToVAD05coCDy5tKXEov4Xs65o04=;
        b=DFixP53bzdkelakSqRM8MX6qWbTbEZ30OgyEQPrCNBXPGigZnbBQH957ylKMKK6vW2
         HbitSPSrytXtNEgtMc0U5HHruLZD/i/ZcrN/sYPipYn5ZimwFqT8Jagh1QL5UG2N1Pgn
         1alLENb/tYSFP14tQxGucS3IqEwJ3tWiN+9AyZIGSZWxa0wKfHm+JBAeMHlk8q2lS/Fj
         qXHSXV8MgJhcSBl4wIM3ViijbOoDoC1ND9UQbutWNywJOI7S5X9N1+toJ7SchYmdm5Dl
         t2pRbN47eMh4yozY2fe1ksDCH0BsTvCpZsz09Dxsw+s4jxCXBA3DyxK1gxJETg+RwiHP
         ftGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434021; x=1765038821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GhOBbFh8ow7X2imKToVAD05coCDy5tKXEov4Xs65o04=;
        b=hI4jE9sMgWVS2VDE4ZlgFePURIlSviwtpgK/n69i0WifwlcAoDqobvGsVCF8Jhrpps
         c5kBoE2kMCRoTpcmpszRF/nfEkVUiPAj10AiWVcJlm6UsFzdVahXhg4x0iu6eWKdf81i
         Afmlv7GOm1f36CfE8rC2Bfbekz8Pxf7WklVqENSU7nx/8ehQSfw548Ug7mBaMS/q8UGz
         MS4yLdICy6VbyqURnz9dpmV+zg6C/g7axvx5GzMOfaE4NKv+HlOLnf4sR4FUBIUbX9iP
         0TfYGroNoc1UmBZdB4Vd4fnV4iouCm6W5kI8eYZJUxZYrjMeVdcixh5ju++rxe5UPsX5
         2EUA==
X-Forwarded-Encrypted: i=1; AJvYcCV4u0HswCy4+PpEvCR8KbzyOtjJw9VtevtMY3HfGNF29u/OkjxSJUMKskvhQL4DcuHxQnXSOg/7ikGBmd8a6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdYrDH9PQGCOOuKn8El9Y9aSd2TQJbBjIxx665SBG50D8YaSuk
	W2MMagb5yAUE8ZHe6WJeObSeKV/wlYL7lzgXEzSq6nq2j0MLgrH51fSx2fnew0hlD8CuMMIam3c
	VqKCYAtlfZq0zwNZJYcbSfNZEulKLbjefl9EgslI=
X-Gm-Gg: ASbGncvzoGKs7E1qmCuBsHp9EU83Jzc5uEF2j/3qGRcwvr0ho6I2IbuRkTsWO+V0KgQ
	bItUljLTRrt8syI+nrwE3JbWyapzXmD2MO6QzD0I2Nw0d2RJfS87/UyJo9+QWQUCgysRKBbfC7K
	GWtK2TZamTOnyNk1sBheBLdwTncOInZuti3msVoxVAGCXOCzF//lH9u+UsziinY58ACb+dcQZFd
	6D19ELo2/3hFjaRu2zgBQBmycOrWvjKMyc7HF0/2qRl3ZgOxLEz17SOg1qMJFM3zhK/EZLh8PlP
	ypu733O2cRZScwtfMMfBBDHgaIAIdVQahsU4D8Yz0P1YKI/qSls8iAogWRkeH4u5GbOWYKlVVOO
	RyuJq3RbqzyCcseKaW1nK4v5u
X-Google-Smtp-Source: AGHT+IGTqcQKy7rLtqhjEsQSLrdV+A2VsK3ZeJBWnJWZllDP305V4XRk8o7jBg18Bf76w0nSvs4p5M6Ue1CDpmGWX70=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr18576163eec.2.1764434021400; Sat, 29 Nov 2025
 08:33:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128162337.12082-1-atharvd440@gmail.com> <071c5fcf-bd7d-40da-ad7c-c0edbe780671@gmail.com>
In-Reply-To: <071c5fcf-bd7d-40da-ad7c-c0edbe780671@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 29 Nov 2025 17:33:28 +0100
X-Gm-Features: AWmQ_blT4G5NvQnwlsoNtDl4ecYNzfzyXQN_aVC3u-oLpKHGuLDeWKLIvvQbjIA
Message-ID: <CANiq72mh=7nf7P67GFKpeO5temn+QCStPbwjGG2OUxDLPL970A@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: use `pin_init::zeroed()` for C type initialization
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Atharv Dubey <atharvd440@gmail.com>, arnd@arndb.de, gregkh@linuxfoundation.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 7:46=E2=80=AFAM Dirk Behme <dirk.behme@gmail.com> w=
rote:
>
> While getting rid of the `unsafe`what's about dropping the `SAFETY`
> comment as well? As done by Benno in [1]?

Yeah -- Atharv: please make sure to check your patches with `CLIPPY=3D1`
(which should detect that), `rustdoc`, `rusttest`... Some notes at:

    https://rust-for-linux.com/contributing#submit-checklist-addendum

Thanks!

Cheers,
Miguel
