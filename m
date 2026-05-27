Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4323E3C44
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872044; cv=pass; b=TQVFxJCTx3SirSPNoSmGU1MNGVbHdGG5Js05DB8jZu7cQobD9ZRVkhttTKoxFyTT5aHCKh3Bb+yMsGNIQqFg0fPOipzDXTrzplZjsEXwGTY0nxfioGLBy5LQMWY8+KZ4uGuAV+0gQYxJxucK3yTsTo6pNdjiLB/IA7lXPR1kdDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872044; c=relaxed/simple;
	bh=5kQqVgy93vtmWq/iqHHy5XJl4YOKgZ0WOXtnpQSKI20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alwTObUoCbwMMsFhXCDMPheA8+qMyeXHOHUB+0gP1oqP7jwff2+iSUaNMvmgGpDPEzNHE02v6bR3FnJviXD89Mi4tBPJwoKFvY//J/tjBT1HedYXbeBX7NPvU9u7qBJPrkT/4oRfObW6agykPw7roh78SL5zjT0x4083bMHdqVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rt7Z0rlE; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt7Z0rlE"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30436e8f582so651532eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 01:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779872041; cv=none;
        d=google.com; s=arc-20240605;
        b=BBCWWKg/qJZpjQYIC2t9qbhGjnrssUsp1Wgix43foRSZOskslv+2qc4/GmjNDuFGtR
         TsJK82CHM5lq4en0cauc5XOhv0ES9llamRSjLyBEHznJ7W2qBNbtQPI/aKuucmHt2DCg
         g3cPkNbtwIfFuRCzmH13l1KhOLfh6h1Vx4ImGKyODHrT8dBmSvD4vJGb+6ecd6mOeRij
         G+u+KCeWCwRGJJPEsxcq4Uw5v8vWT0yBgSQl91p/fhAwV+DFxDSzgdoVIkrddHaXSvuq
         Y09rlHoDAhyRuwZtOQk4CddA01RahRyO9zDSx/g7dv5ehh34XE+GMaE9wUk1CitXInLS
         nBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTtdTbKyDzrJWvdQmNFiYIjMxA9o3eokdgv/V7n0//c=;
        fh=OsZk5ommwTpS96Jtv2GN+hnla+58X0QHtiQ+Gy2X+bU=;
        b=YTt0Uctg/VqsLBNW+x5deCHUv4J+vfyD8AzJKPxRLLgfDSBiiPJeGLCizdgdrXEvmQ
         JYa1xRLGqfnjz5OHVpReR1eRzcIwmNeYT1BcJcvwujs64vyRRq+O1C71LwQuXxRNVFZh
         Or3ja9MPQET2AxhQs4xOnU1OgD36NHx8cKfQsO/aE5NfoZbXMiz6cCncBTVgvHWnj7tG
         oL8V/kw3tY2D00W5OXUUtgDMI/CgPicKIEHQPBQ6LegsnuiCKV1wUqZ227AdP2XtGuR7
         OvDqnSpZ6apO367oYEK3rttlaPgBwviRqAsuFwKgMWA5nnLpCtUYbWtXEBdYqWtw7VzS
         3okA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779872041; x=1780476841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTtdTbKyDzrJWvdQmNFiYIjMxA9o3eokdgv/V7n0//c=;
        b=Rt7Z0rlENpctX+ur94aNcaN7JTSZ6io7CxllsB+qLK8UoLZMJK4Z+xU9a4fPJdioff
         o8FT4ersr3EmCq1ysWf4lZwTl4vFy18XxzQxoOQsBJmdmJ6tFFAnCysJ4HkpXHWiRFRj
         hz+FNxxM4LGSUzL0IYlTwscOgKKc1T7dzrjvuv9NqvDu+sH6hluStIekJrJt3kQK07po
         SF9Hh/ES/7nvAqDEUL5whtO3IP518k6eXRIWZqJGb3J2pnTktlJy/idjdNHSPtz8RNaM
         7bCdR5deYJULUUgmjdSGG8VfoiEz/ajqnv/paLrpN8zX5VXzbc9KQu0U6SDCWNzxjttT
         b9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872041; x=1780476841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTtdTbKyDzrJWvdQmNFiYIjMxA9o3eokdgv/V7n0//c=;
        b=LA+VmPk6Ye2tIUyFHh+EKUS9O2IZL5wUZhGpcYxddBLmX59arjO5MwpouS8HUw5Qkz
         9/8kwObGtKrR6mmoNxhx9U4QU9n4MPTmwZjQo0x/6I/74Dr/4/Aln7ln6qEpuuHNQqZZ
         HlQSJbrR1jlvF82b0qMoSoQx7nhs57VmKCmxJO22i8YrklgKx6ZOBFYK7BQIEHQzazNZ
         7TT2qVqXnetII6WhmFBqEViA/CopyXj5xkkooE1ahUdSY9+JSvygrwI9YSkkwcr6wEEc
         IYDJJmI8hkbjj7IgpE00xOfVGgnx1TqpJOppBFZKf2/S56g8Bsr0C+kmyx2POwcxvNe8
         +FGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tGiVrLWTaPHAvCqdwOjXxl8UfVceoAjEiqGaKENAZrxyAB5dlCkYiTEK1+Y8+v+Gi5Zn4axQWWKi/ilwH1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6N3EjU6qDmfm7yMXYmm0JbEKEDXq7+1PSMcrZ2EGa4oCr9MoF
	a/omkU+KSU1VJFodXP/np4oQceCT3PrXmm6OIsh5szCghdb3GgnY37rieeapklH0pAlQ00qYonX
	kxsTWiFuWl/LWDPahfuc3oVRIGJeXKAY=
X-Gm-Gg: Acq92OGXXSC9mukUwgrSUotziFo2i2JZ6bne1XxtsWlAli8j/FeJNZQSA8iZLmaq+1m
	jOkCjnKZoFYBGsMEg4etw/qFoiC61FesLKWqIMZArlyk2Cq1HjCXPE8a4s4FCM55Imm+v3OZP4P
	rFf7No7f0loxvka0TFRe1raCl0AxQEllekSvuyb5NoYywVLBHyqy9e3+b7sPLRnvshHMvtWUKpJ
	+EsGJtudel7lEexst4y1vJRu1EXsmYQuNA73XU+ai06uFoD3hbcF/no11TfCKxb5iiJ9rp+qTHb
	IcoLlABi3r4U07nz6oEK0XU8+Yq49dE+CG/684wV2wNs4etZ+fY14bJzsg8n4/ueh/9do8os4/N
	hNJurubwChMz2sIMRCfSLLy/tGuk0OiU10Q==
X-Received: by 2002:a05:7300:27a1:b0:304:8860:74d6 with SMTP id
 5a478bee46e88-304886076aamr1840509eec.1.1779872041455; Wed, 27 May 2026
 01:54:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 10:53:48 +0200
X-Gm-Features: AVHnY4KWow-yXcwxHqbER2pSQEuTDAe0LrH93MgzWao3M9DArcKY015HW7Z1bkY
Message-ID: <CANiq72=Ar5gOb4Gj+f3AiNh15tVpYBzRc7K+3DW1NS7pnxLipA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: add support for Software Tag-Based KASAN
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 10:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
>       rust: kasan: KASAN+RUST requires clang
>       rust: kasan: add support for Software Tag-Based KASAN

Applied to `rust-next` -- thanks everyone!

If KASAN/Kbuild doesn't want that I take it, then please let me know,
happy to drop them, in which case:

  Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I will keep them -- Acked-by's appreciated, of course!

Cheers,
Miguel
