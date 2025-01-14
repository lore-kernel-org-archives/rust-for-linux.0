Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D91ADC84
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736849060; cv=none; b=tOwvN24S5X70wH0n3Aa4qd7CbVZ49WFC0qJ4Y1E3qoptIeYwZteFHU5aC1uotY8jvzAa+jdS2xNAjVGq5lRlt2axDxgPK0Hjgfs757kf7lc5GgMTNKZaXvCHbAFEbWsny2yCGqYLZWr4jjkTmcDt6preIQn6rfLlUBcG4Di4AUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736849060; c=relaxed/simple;
	bh=OGkawDsutnheVGAJShf4vRYIzljf0x01uJussxKUKhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClU8p92RhNYTzmkOiwpglJrvC9A3K4IIXUlNDEJpvlGOviIPIOve/8Ci0+E6740JmPDItx9AxIdNLpvdpnRhDEgK3m4SyQRi9ZrV9KSNZZ/wUvkUlrlUD0ZbTevMr06IY46j1jxICD/bLXcoKR/Ppi/JC6Ib1p6liOf5McECV50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asJnQgsd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asJnQgsd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862d161947so2639634f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 02:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736849057; x=1737453857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGkawDsutnheVGAJShf4vRYIzljf0x01uJussxKUKhM=;
        b=asJnQgsdrWuVGxfsmcCZ9vCNcjbYgdtfjfeMofs5l7663x8qUVTQj+Qht74+6tJVuq
         l0uNoCCYcX/Nqct2dhTRyLyxYQaVqQEQGgxdNJb5uh2j4bVG/lYXV9+N3HcdOO2lYwam
         VDZr6zKns3wpl0IhipCenyOj41DR+gus1ir0WqczD4s8tJlOImCJoPuaWEx9i/976Vt4
         VVM8d3qvKfcT4W3b6abIFOA+dzcSBTUy6nAhTqqP35gN5NudZhr8fOK5Y0+k/gRRBfoW
         rxLk1tWcq3SZ1CYVwyJ75OGvys2d1EegzpUxb7vFqG7M2XfI3NRUXfNO4JcRHg7UtZXP
         IIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736849057; x=1737453857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGkawDsutnheVGAJShf4vRYIzljf0x01uJussxKUKhM=;
        b=dScbQsVgZ7NpAYkUgUfMlhD1RVnw1LOgNxbug4K5h02jD+4dhxLEqz0O4pFTCTMukp
         MGG3POq0F8pFwhH7fLbWo+YaGOZ+F51Tj0Z5abo9P/6hKCZnhCHqvY/gn+IWcy8COJay
         ZTr5zro5pTzi1QHsQU/cUiWg6PhYrxPqTpbKcNyYJ0ZmKFZY9QdrHs+jKvDmRVOAsvDa
         keiS6Vfmr29ZTRN/VV59O/bts//WC9Mz2nyU9Gs6SgA3EELAbZVekVE6QIoabOXjtU9j
         TercxlbjSyW1O5LZhQolCTk1pBoxXo3TbyO+M1KIdTWFaOwHMJBqywTRtzK9YiGLiM1I
         682w==
X-Forwarded-Encrypted: i=1; AJvYcCWOBrKCPBoYoQ9KS8q5YXCmejtknxVWgKZyfxPVVTgay3FLyC9TFaT1eMNvgbpK+WfzGsqdJcQYMXE/gmC5YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpbXybYUaGt4wCdWk5LCXPCZ5VWduwJN+J7jT2lC3ov2WPQsGY
	Fcw4wQBlrTWRtbpBz8ClgRq5Fk8ElTUURE/gp0+/gXLGSGLVOHBh3BSbkwTV/aUFkt6qe9rmfxL
	nzxccfvw5jrSZv7aqtbobSDiWnwsA4djN4XTj
X-Gm-Gg: ASbGncvSVUdm8XPB4qNvfoxW7yamFJV6AVBCXDxdcsMb7N5eAR0UUK2KjI0v6uEjAIO
	ScsmCHjwvtn/mfIlbmZN+wKP1N8vly3O4CtXe5mfTrCNPqiaM4/r8NFxwdUv2UlMwnBSa
X-Google-Smtp-Source: AGHT+IFW92OAiRVX2lXuhroyOOznRQw9FilQMJObkSGOGG79lEEH/GtW7bVfUikIx4iK7VrWdxZ1MVtDKWzWCXezX0Y=
X-Received: by 2002:a05:6000:1f85:b0:385:e411:c894 with SMTP id
 ffacd0b85a97d-38a873377b2mr21025156f8f.43.1736849056966; Tue, 14 Jan 2025
 02:04:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221183024.3929500-1-gary@garyguo.net> <20241221183024.3929500-2-gary@garyguo.net>
In-Reply-To: <20241221183024.3929500-2-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 14 Jan 2025 11:04:05 +0100
X-Gm-Features: AbW1kvYhbhQjMZQ2YGhS_5W3dwAnoi_mHI7IYMVLWZ2NfguW9m6QtM08HWyveLc
Message-ID: <CAH5fLggvgpk8XS6naG=boMDCfTCNTHTrs2qeRfeJZ7xWuAq+nA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: implement `kernel::sync::Refcount`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 7:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This is a wrapping layer of `include/linux/refcount.h`. Currently the
> kernel refcount has already been used in `Arc`, however it calls into
> FFI directly.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
