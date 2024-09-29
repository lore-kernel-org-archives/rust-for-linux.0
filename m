Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BE48F6D
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 21:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727643790; cv=none; b=L3iz2zhCQxhLA3g552nPPQQdF6dc1TtmQraBx0OerICile0R4XuakttSn/Ax9/Dhm+6lPn3VKDKP3eZxpK4Hl7g3YnUMCdnepVfPS9snmj5JkQw+NSAyF7ULEKxGgKbGaB9cLkCLeK5g13T76/NgsmJhsDgJouLLbHTLa2Ejcyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727643790; c=relaxed/simple;
	bh=0TXbBf1Imx3Td6KYXZyFDLk3bd9iodrCA/B/FjBVlh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mp8W1I1Q/uQoUuw5g6fmHTkbMVhR8BESHaf2ZdxoNCka635mLA7BUnLwBXmWMWrJ6CD4W1hlY1Tx4UJWmpjsuohE2KOXZ88qUevCKgwMziPKauGJbZ3dAqxxtkpzEm+mb+t98Cx9mQO8vG/0qWKt1mFkh7+sajpl5ZxoHsiavb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=epL8BVEk; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="epL8BVEk"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2326896cbso24067907b3.3
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727643788; x=1728248588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TXbBf1Imx3Td6KYXZyFDLk3bd9iodrCA/B/FjBVlh8=;
        b=epL8BVEk1w8590kbMgQNWkbVwaHExf7C+VKoFck3zi2kqhYG+jLHehqlNCvmW9EOyb
         Bn0ZwQKT8Tu9pYy/kP/cQM/ItuCX7Z86/LkunLIe6EtK76UqrwuZf3sndqxeg69k61SA
         PTda4+b5S73BUJ855KqpHRoOPEPdDY5jeW4fGpa/PYVXL+kBwPYK3mMhtv9Z5QAMrQCn
         Y1iNWpmkCtpAbvj544FAuiaH5Zgzigw8Ci4IZacRyNan3Kgrt42ufcm1NXrBCCyxN1VL
         tNovLt7j4B3SihftevpZqTW57Zp9JCkq6mm/d6vO1kOSZPx9LUxNXj0jjeBIea+7ZJ9N
         50Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727643788; x=1728248588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TXbBf1Imx3Td6KYXZyFDLk3bd9iodrCA/B/FjBVlh8=;
        b=CjFCeGR/0R89AZRUePiphQTpx7XCRpYGSh2tnjnRmhRgsyyymDqiVLjImolxhn0Sqp
         r9AumfKYXgkHlub7EI6Guucu81uzilbsWuY0WnESyq7kym2MxLY4BUnou19VzY7FMxUY
         psnL9IsV4AjMK109gCefC8W2GlVQDE6Vvu5gN6trQEIWEhjl4jIx0ccpB0FqMv2qHc0t
         54SLAXwQ04k7Pz4mZaXejVVHH6QkqApxZUkn1LdANe6xIJ23ikCgMYLSnF2QNlinK64B
         TVBABa9Wcyz6zgEFvfemO2fBtDIgTSJ2j5jeECGyyZcVSi/JhvjK5jKYdMFm4ISgxTz9
         52gA==
X-Forwarded-Encrypted: i=1; AJvYcCUUKEFgJTJU2iriw5Hk7UFwUzwR+OnFtfXGfGNxJm/zpz3bT/HnI/c/i/1DYWQCPXpD5/rUk2PQyu5kaYa7IA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQg0R7nzDrqmgg5gVShwB7aaquBMJA6XXvEM2Gme7t1JwKBXwq
	AovRB78qmynZhakXsj/ycZ0/2TtUpzVpaHpKiYDHr6D7y5t0hIiBFChYZe2oOoL/QS6Pa35Ul3H
	43yZFAh9BO/Ry4uLMLJcZHtdXZ1RWJa4FWfdlVA==
X-Google-Smtp-Source: AGHT+IFMGkBzz/SyirbbBicEQiCEDdlE69dd7HQlE0bRpTLL7qi430Yjizc9GEL10Kma/D0byBjMuTTe379MPpH4iqQ=
X-Received: by 2002:a05:690c:6381:b0:6db:a7d3:6410 with SMTP id
 00721157ae682-6e2501b1b7cmr66633147b3.44.1727643787839; Sun, 29 Sep 2024
 14:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <20240913213041.395655-3-gary@garyguo.net>
In-Reply-To: <20240913213041.395655-3-gary@garyguo.net>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 17:02:57 -0400
Message-ID: <CALNs47t9xTymmFnwhUDkHypb-ftK+ukDrcGe_80mKyv6cr6StQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: map `__kernel_size_t` and friends also to usize/isize
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Finn Behrens <me@kloenk.dev>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 5:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Currently bindgen has special logic to recognise `size_t` and `ssize_t`
> and map them to Rust `usize` and `isize`. Similarly, `ptrdiff_t` is
> mapped to `isize`.
>
> However this falls short for `__kernel_size_t`, `__kernel_ssize_t` and
> `__kernel_ptrdiff_t`. To ensure that they are mapped to usize/isize
> rather than 32/64 integers depending on platform, blocklist them in
> bindgen parameters and manually provide their definition.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
