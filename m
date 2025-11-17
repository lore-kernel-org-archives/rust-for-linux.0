Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93A63446C0
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763413379; cv=none; b=Uy0o/RdpbTcxIWHsZ6MRIEwZ9isT+zWLDkcTBYzAQSt0H0ovQK6sh7wdkhoIM3Mp0FDZ8P90KzCRV/4OdDr+GPD5uhc9R0U6cZ5tPklS/Jvk+ruh+xCgzyLcVaYKn3wU2NNjmbaWgQllG9RY/IAxTF0vZt591/e10uCHGsTk2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763413379; c=relaxed/simple;
	bh=Jx+mIImXSNDfgYqmNpofAZfv7KprXxOGtDGrhRPT+Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7PJ1TWYN5TvG7z9RanXg1yzOQod6F8XMovcxhEpDVF4F73h+7VIEXtQde1nlqMd29WAhzVd9gOfHHnxnYc962DqN3U2XpliO4IoYS1LGyIo5q6xRb32Jvx6fctrpMKiF3l+X0+1OdDtPpEz3mQPDt4uEIzBrExhlp0UEqzHxfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiDcj3U8; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiDcj3U8"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bc144564e07so147622a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 13:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763413377; x=1764018177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jx+mIImXSNDfgYqmNpofAZfv7KprXxOGtDGrhRPT+Hk=;
        b=TiDcj3U8S1ILsINQTFqWE77jKsVa1DujxNR/mdKTXMf8opUF3fY+AMG4Jiwzz4Y3SZ
         gJrbSncbN/8t1u+Boy8ODZvVqqQelGRbBRaimG7Z9hbK+UncdL3SgVaBYOztv0XNuqb5
         fwzSG4jgpPM9gN44l+mSKD2P9QqJ7v8giV67zIPIRxj/wMDlU4rKEQvN1mQZ7K64eo6B
         X8mtShRHo2pPeZ7Msyr/r5MRHvHzlAj2w4XMUTvyvAQAmzSjJQKQatFHnP2PgDTGdp0D
         oOcqbcYAlU7jzRVjlJeirfA3mwJtQfWxDbdbQGmu6IjfvuC2TL0qcpKxX0VBPELYEFON
         +fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763413377; x=1764018177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jx+mIImXSNDfgYqmNpofAZfv7KprXxOGtDGrhRPT+Hk=;
        b=USZlPoM4akxsuPD372esTGYG1qs4FHVvbfAb1r/Xy4p/doPGuxvNbMOz6pNDhEtctH
         BjeiXTySLVjroRvcmr6DgV6a2nJZhG+RyLj2Z9IuhWlSW7Y+49v+r2QfsgvOzPAkIlBB
         +IqDum5be73UNHy14fbr3ldaL7pR8reLW2YFAX8/FPhzXqZ2OqMS07z2dST0KE3hmpt5
         4S/07r+xCdyX8+rbJ/OHS+moXz64BnAiPUl+X49gviIxGa9jBi2o8DCu6c47dCyDdfwD
         YgiIJ+FwgEW1BjBZDDZ6obTFnwkrcmRKMVhYWzUVHqkWVYgtxWWRUPvDTKHOW3lBhpAc
         WuYA==
X-Forwarded-Encrypted: i=1; AJvYcCXdihA8fjO9VyY/1Dy4Fu5zlB1tNySYmj/3g4Bzoj+Hvo7Mje4luRlUgy60Cj4DzABlqcj0am1snZoPqg0OeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIKVEXJRP7fQjU/wBVHgC5RtAOZxlAoUnoPATmq2GXeKKpT0t
	BUZ2DbNa3udrIPPy1yx/3jLj2EutzkQzUK4pbB9pDAtleikPTMh2qCe2rgRF1TfqRxyoZo1QCnE
	z1E42/nsUYMegR96SkDdZLGL6o5Q+52w=
X-Gm-Gg: ASbGncswihyBx536//YXuPLWgZz/VH8c0umMU+tZ9dVnsrXCeoiCd7gs8KdkJFJgEzH
	nk6H5tRMty4BfeFBrUErCbyCkB0yoIFlEcxTq7wJwt6vHPlL2Pi+92ACcX8e1PGP6F+MsCW9EOr
	ExGqWUMK5FQ/bUNp2a24vRexozv3AylCG438bng+G3wMAvNZ/nZax+gkOUtLu2jxUe6yVRAvSNh
	Z8RSbY1p9uylU1OnnhZHHtiHSswX1K3bBIs79Vuf/CZ4riV723ymZOMRwR6ADf+bKaPyvbnUDl+
	u7BFS+kBoHHrj2ZYvMBLGMytj2JO4oezsR8zDN0xgJyuoLv2yo/O0iVznRj5YNl5oUctj7SgBpW
	bmvM=
X-Google-Smtp-Source: AGHT+IEfpg5rcBX3WhvIWQ/UIkVD2lfXwiuAfVldmSreQrz3l7c83vqeEp8kW1iCh0Sg9GCSFOezGN+qgrUI5cjThig=
X-Received: by 2002:a05:7301:19a3:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a6c9b2447bmr78698eec.2.1763413376824; Mon, 17 Nov 2025
 13:02:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110113528.1658238-1-ojeda@kernel.org>
In-Reply-To: <20251110113528.1658238-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 22:02:42 +0100
X-Gm-Features: AWmQ_bkaYzRIEOl89GTZlEKTMKuZ_To2Yp8qyNl_-3c2oE8WhLT2HaZf1WZMoBI
Message-ID: <CANiq72=n3DGg0gfrVq9+b41Ri6M3efWZxnzqwXkOFRt4ozN3dA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: allow `unreachable_pub` for doctests
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 12:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Examples (i.e. doctests) may want to show public items such as structs,
> thus the `unreachable_pub` warning is not very helpful.
>
> Thus allow it for all doctests.
>
> In addition, remove it from the existing `expect`s we have in a couple
> doctests.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/rust-for-linux/aRG9VjsaCjsvAwUn@google.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied (this one only) to `rust-next` -- thanks everyone!

Cheers,
Miguel
