Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0274170A15;
	Wed, 22 Jan 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737537123; cv=none; b=gDzgqtbD+QLWbkPkGfLajP2ogd7wtCsBIRUWxDCHlwCYPfjIluhwYTLavj/xZltepRW4O6fSv6Rya40hnScT8jywUI5km2I6scDSw3oVly7r9Wln0Y3PAvi/XsGCuL1kTA6ob2cuXfMfHSqG6PqbX1JbNaad8zO3lmoaH0vx9ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737537123; c=relaxed/simple;
	bh=unpQXLZCEmfpZAq1qhXn9KX3puIZIAE2o9bp+zsRMUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpilgSQm7WxD6fwIp/fjIQZOJuHdNZfYmI12SPHpZn8P0jhSTFjYU3sOaOl8oh8cUf5cPXRuu5leKI8wkATjqhA/FzGqnL4RpXBVJKNjypex9JKNFvJ1ZhINR+40u6pgC8qHCjYKPRe2PjkvPNw3PoZwtMdPu45DtjgEUcpZmLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS7NfHfT; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS7NfHfT"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so1428215a91.3;
        Wed, 22 Jan 2025 01:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737537121; x=1738141921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unpQXLZCEmfpZAq1qhXn9KX3puIZIAE2o9bp+zsRMUc=;
        b=CS7NfHfTrjbx2kvDhJpju3GpYEZbtVTtIcKixB0hVCasmlXXB4t/+w5AcYBJPmteUr
         9NCWDHBpetel4n7LdUMvKx2qcpd3K0yeuQEym0glIQvt305d3XrP39xe8fN48e6Kfa0y
         oVMJr2lm0BhJRXeoIS+Tet++Kbuhkq6lOgjh3TGp4gUJhI/Itoud+m3tkscxrFL10nel
         FUUUyh+csVVqJN4OUo8X4kYOgnnK724LmXUXrqJCFzOR2zx6/l189R20UmKSP6N1MLBx
         almFAydPq7BUMWKPMzPS8q0EYRGWfIp8UjdB9x2WKh/gUppx2ZajChQZ2EHoFanxn9Au
         ewBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737537121; x=1738141921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unpQXLZCEmfpZAq1qhXn9KX3puIZIAE2o9bp+zsRMUc=;
        b=QEL+UQMfowZUJpxrhhFRWXolvDRFS8WCdEOSVq3FjWZcxIPwO3Q4gdlLCZpCOW2eL8
         lj6BrBXqp8VJbiJYfHHmObRFw8I4HfWo4mv3l3Xt19gyBrTMavW6IS3ZPsJuqTc5QyHL
         QEqnKXigCvirhd3LPRWDNg2xXEA5fxVymOq2esFpM+i0xqlQu3Rdp0VqvSHxYZF1Jjgr
         uz/Zdq5egvYpMajpDnfHBZaGBNZNht/YZeWvp3zwIt+NqkuBPOrhHj8hPPyf/wBS3lYk
         +GRBpXRubgbaZ4X3xTGNMw5SHKerYUnuUJJADVYn+cizWY1701mP33NgqOr6Y10jRoUB
         gkAg==
X-Forwarded-Encrypted: i=1; AJvYcCV54EHfH4goFGMBX4IW8vqYuq+N2nO/JE7jxTWMgg5VGysFOg/7EfFH/5nfR9KdEjSL7065HATR+ev5POqrrIo=@vger.kernel.org, AJvYcCWfoe6KQ06/1mFbW8aSBZ/SsLdoAH/EL9akMk49XE5gFCvc7Gmw2c9SQMT7vvUJL3xw4vBQM/YXFCjF3EE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRekXeJQ2zTDFYT4bPjp34Uu5QSej/2Ghf8Ij3hSM9ThEblCFP
	dO8LoMhivaugZZgQf5HHtmOfcM1YwWm1xx8Abz4sjiU9RSGtS3ak8arv3A2k0fY/pHGBLU1y7sE
	xsNRAAORAmuVANurT6hGeOiao/Y8=
X-Gm-Gg: ASbGncsERVsMH/2L1UtrUhBUgD6pVfsqkN4RcEHnw3QXI7tOvphHGGmF7HtoKsg+ye5
	fnM3G160qk6ueTq04udf2vmfsTGSN+GmSmkcMJpZcTU0evjvNT2Q=
X-Google-Smtp-Source: AGHT+IGvMkzYeS+M2Zs4H6d+gUAbhzSisYgxxJR1o/VmxNkEUyZnwchVP5tpcBr73gssYBNEpIC06QEbT+e401xxRQw=
X-Received: by 2002:a17:90b:3bcb:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2f782c82684mr11737161a91.1.1737537120928; Wed, 22 Jan 2025
 01:12:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
In-Reply-To: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Jan 2025 10:11:48 +0100
X-Gm-Features: AbW1kvZclPiC4R5ekXjFPDnbpnTdPwVHT7PR2P2wCXbI868nl-kHoewZ5EOtNCA
Message-ID: <CANiq72nr9vTgUF9u0uyypzprQrEpGv4qbOUJS_QgYbMZhTTrRQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:14=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> ASAN generates sppecial synthetic symbols to help check for ODR
> violations. These synthetic symbols lack debug information, so
> gendwarfksyms emits warnings when processing them. No code should ever
> have a dependency on these symbols, so we should not be exporting them,
> just like the __cfi symbols.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Sounds good -- are those generated unconditionally by ASAN to check
for C++ ODR violations and so we get them anyway or do we benefit
somehow?

I also wondered about whether we should search for an extra underscore
(`__odr_asan_`), but I also see mentions of `__odr_asan.`, which I
guess that is the reason you used that prefix. Is that right?

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
