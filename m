Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983E36680C
	for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 05:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779170302; cv=pass; b=okyaus36AM4PveSeuSh8QH82rcO4A3UemBxRr4FTNKj9nC01tUqZ6Y9Lwik0zAQu0LiUIYHXkCWv9SAOX60BbWk2V2NpHkRaTWjuXLmzzz5OgjVfwqTXdvGSpu/0pRSMtO3I+2LnR3CihcibvlEvMspd4DdF9XOcRgVH42+Onk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779170302; c=relaxed/simple;
	bh=+VPbqTQT2HGL7tfsjipLyErjpTKUS6idICMcd9gXQG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MO+23HbbrNQzgJKMyd6qgMrI/AWD2kt9BsmwwUM6k+2K/3lmXrhSnYu3SR6kghmR+yLCgL2KCKWnOkIziNWQClYywJgsS2gW3jbP9VFWWt3ASnSwtred9Q1JFbyar3/t311cLWnUQdKrhRX3suMHV9SaLpTA77sDio2G9w/ssp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3fausLk; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3fausLk"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-303c0a57d55so228445eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 22:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779170300; cv=none;
        d=google.com; s=arc-20240605;
        b=ej+r7vhAwF5ZeMeDdjcFCMVV2P9NKzT7Y529nvMj/f6DfpaSzalyaxNyNd3jY+ejBe
         iQ8SY8wjpQgOtG1bCMHByLi61HwOuXfRK4oHs1X2nTXNjoyJAblXP/4iOE+WGq6Qbd8M
         pnfzw9YVRZslINj9VBozJqUXJAks9ceoDKNsUrSfC/m7s/o/E/olJWE9J1e53d5T1p8z
         pN35mUtWmlZMRCxecuVXNgKcbY/3zXwwIodfkYZy4MZnRAxMiY/Y+i4Ea/2kaEWHuhjp
         sy1XVzXXv4oyQnboY6WQLdXRhPBvPx1mxVDRkv9prKN18KVTkatongbE1vemcvkreZ/H
         4sKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+VPbqTQT2HGL7tfsjipLyErjpTKUS6idICMcd9gXQG8=;
        fh=uWbOqk7V26ESfehi/pZmiEoOzqCeA4PFZqDbS3M0BUg=;
        b=k6AydmR1yionJGBCBOIeiS0KVz60LiqKPIUOkmKgxmSuNArCt64D5lICWZDEYji0Gf
         TO0+8wO9PmIo7w6tXVXBb+VuvAA21M+aEyPPdndWbAEusLnWpm7UxZI4Naqa6j91CDEQ
         ds3hOs7EyV2XhJd3WZS/hWWR1mBOeMwU7opYfwLhXiwZ0GdlL9asjYUyT0oL0MVZeYAc
         WH6PLldyODA8OKcj42jAXzgfGLLUtsgzGWkU5soGLScsP90OGkGbZqDN2tfKdhqYoI4t
         fRXcgVeVgpkN/e4TImSBwulra/4Ghbj897JUpDOV40Qjeg/6I2tFjhrsKl8jhg285roj
         KMLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779170300; x=1779775100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VPbqTQT2HGL7tfsjipLyErjpTKUS6idICMcd9gXQG8=;
        b=A3fausLk+EsNDFSCjgnn6x/mWagzqoCt5KLVAW1b83JLX9hVQIIs4Y9WShanziC1et
         MunJkg4t5AxhZtkleNm+DDX2cKPzBVf+eraxCpyal5EdM3rVLdH2kj+Zvp2q1M2/lomQ
         zSrNT+bI5NzKPeCBb7pUjL1O80758GD4kOVYVt3Ptjs2wDD6FKGGnWmVh59wdTuNsvlL
         XfabgIn1/sGKfGQDqcftYxgPI/97wp9QYgNeF8qCpEfMh56LTDxixjpZBbYtGSSEt5yK
         Z3HwhHoDjpwjR5qhrMWEkTPb+tBKp9HGF7qbOFuOHalpUXuXIGaYh8x1K5m/TVCRajJL
         Cp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779170300; x=1779775100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+VPbqTQT2HGL7tfsjipLyErjpTKUS6idICMcd9gXQG8=;
        b=i+rn3XeUHKDuyHuxHR4vuOBWoG8ebu3oKTCtcG6eWqDpCa4LGjrIzVsHdA4eBmYn4i
         AHdMDZJJTxPhEZaKknuvDoVQRANx94ccTVtqw6aL/N0tQU+p3h42jXba9Evxjt8rvNJF
         M9QQ++ZMXRkXVbqpwSBSZa0nMxGRv5x9uee3H/PjxyYbCVjpxvrli9ARx92KBEYt6Ahv
         htud9S5xx7V1il9zKcmSRwlccTksnloh5RxNfbulDUQ9oANtaEIgCRQ4Y5s6m3PcnXJy
         7AO3jCe6Mjujr/GjPEwYAqHfRVdO1Cv7QIZ5U9Uuf7j3Ja3iJb9ySwKocpB+WZETEXCg
         KHbA==
X-Forwarded-Encrypted: i=1; AFNElJ+e+/Aa34waZSFOgYK57Jvgcn7jp4cgNfbDrwiOpShqDsU49tAyENaBoL+d3iHZGsmdPqkOFMcAGzNQiItFGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVXNBEMLBQ1PIRXNDSxZMsERUiC10MErDVWymEq6zSsqgcb7lH
	HFn9Z+psIdxSHYy/MuX72207SzqS3T/Vs+Z8kCWFYrBEsWlC0iddgGMMmS0vAjoNnK4vb0gbYAq
	VUQ4yI7q5U9yrYGOrW0IWMgxJb5WcQr4=
X-Gm-Gg: Acq92OEAx/u0EZdNlUUxab3+thL02vYqLtu7ncMo1neA2IwaVRuJGpERm8VnLTD6gE3
	xFZXR4pc0oTgJXQVtvROetJJtL6FsHnNZ0/kvX2JGXcg/iikpFNRitM61gioOgG30st9AZ9EouW
	59Hgay8PJ0qT4oLM+7Wa26yBiowjRVPN0KVgI02HbHTqkfXUozD+xa2vd7Jy1F4TALJ0v2tMToY
	oQST+avlR+cnH/AvVIQpFlwTd1j6p1Ji/Z7WpoF6AeU9hSHoP/2om3AKBa/CauUuL0/jEhqknNl
	BSbzP8tdFZ2huodsWbV7CJcWs92n6ZDk+Q/URgNNhwxxnqsZhKIgUbAHIzpQPs3s3gK/mZNizST
	MbC6ILdwfFmeM5S8/JfkZgtg=
X-Received: by 2002:a05:7300:ef82:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-3039873814fmr3673095eec.7.1779170300293; Mon, 18 May 2026
 22:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519-miscdev-use-format-v1-0-11d526ba0edc@linux.dev> <20260519-miscdev-use-format-v1-1-11d526ba0edc@linux.dev>
In-Reply-To: <20260519-miscdev-use-format-v1-1-11d526ba0edc@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 07:58:07 +0200
X-Gm-Features: AVHnY4J5f0V1co69asYfWAte70hd7stIfUfSM99y15-hVKLdamtx-DvBJFji8z8
Message-ID: <CANiq72mFYDxd0-aX0o-Aa3_d-kq+S9SbzRjXSyppSZya_UR_zA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: miscdevice: use vertical import style
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 7:35=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> Convert `use` imports to vertical layout for better readability and
> maintainability.

A bunch of these are already available through the prelude, so I would
suggest taking the chance to clean those up too, possibly in a
separate commit.

Thanks!

Cheers,
Miguel
