Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A744102C
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991688; cv=pass; b=IjBWMxElUfNDd1OiYxx0okM03Tw+1yda0c6RTEDr1+grLkuj86ATmlZkyjaMt1cCXDxQlVmN87IiX7lrDIbqn/ltdul61NrYI7sX2taDLxf8pzWGT8pO1y1Ii2bd2iPjGHwG0qVbyWW9gP8oK3uuhn8jDbbqYUA6lrAdSYx2hr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991688; c=relaxed/simple;
	bh=+JxsCBfymivBX08sGiCuLcobIN7cdPrVFtFlzFTvswg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxS9glY21c3qfrf4U+gUiZyyuIglHiLS8C4NdBaRHSQ3GcsCRKqWY9hpUNfLuhka3rs2JdvJRPPn2WVqsJv91kWyxScpFwY3Y2TtQJTxGcQzcnbTkNjObxP8r71RBBgTZt6J0Kc1fvpYUibMfdW4zQBANXKna3NPn0kDe6UKlvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgpZbKDP; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgpZbKDP"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a3fafdec5so3623081fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 14:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774991685; cv=none;
        d=google.com; s=arc-20240605;
        b=YoZ9TazhFRRM64/L5JYicnjFjUZAKav8Z1i31AEsYgpiNBiG0BzZerIEMiwgEdrWGt
         Z8EqUdFZBFUTj9AGuoTCmW3yVSrZVQ0Zf04PSnpLvddKw0rQUMgsAoEhlY2X8i4zA1Im
         zr8HQsevUNfSrIFjCLZX9EIx47yR4QUfElRU8vK1jBw5zp4niIHnweTC4vz88GJiSeUS
         geHhV1KbV6hnN+dvThqbx8Z5O37w57N3ffFALqnANm+ujioaGW5ALzQdWRYGq5/iSYbR
         SVSAsJjcWHfbEzo/6ih2Le+qgOfHCXJg9e2WHZ5Xpi/RFeA0JMp2QrTPBDkpAtPYwEae
         RctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+JxsCBfymivBX08sGiCuLcobIN7cdPrVFtFlzFTvswg=;
        fh=CAzrscvfqw9OORZM+h/sSNxhrsqtraVaZAn1LwxTjSA=;
        b=NNS1tn8WYeQhBVTQhknroSjrWKat2+WxPxjYYjY879MC0QpLwUKyPDF8HpGdffwThw
         ZeLnc4Dd6c7HSxKs33uDPhVG/CyR5TfnTTHSETmbOY0JKbRSHV78THXegZsGTY8bAADf
         fdnHTBozeyTWZBEplvoQTPVVHxEqrPloxI2yy9sZtZ7Ryyfmm211KATRYBq8X9duYl8w
         yQwD7JgOpajAJVZPusyzGcbL86XdURnIGkz3hLsHBwRkR2yfIWYA0PLaTYivwEmX6f9L
         d2KYkZxrXTECZlAD8hiCu5V0g1gICkFnZrYGkSZ5VV9nTwsGxzMNFq1jyP2F2wmOzXLg
         10Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774991685; x=1775596485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JxsCBfymivBX08sGiCuLcobIN7cdPrVFtFlzFTvswg=;
        b=pgpZbKDPX5rw9ZhtnZLPYXW9O1nqFMJtqu7lejQhRDIbHBVvV0da2co4vmSlry6L2U
         J8K/AMGbwV80DKFjqhkL/rYszDWgGcwg3KjjF1CACaPU6qjZPhr/Jy1ceiio8SugpPlq
         /0FgazDqRin9FOJh1VwutKYbFG8BpKcVJUejLGGTIs/htQNMhbpQ4iWbTjY8mCCTSpIh
         LZi/OgOhJoVaO/IzY0bprpXMwM2kfITgLN7BlSVjq6DbIWrDstq7M6/W0Qot2d0hy0uQ
         6OddvKRfxFfDDLKC9Rr2/RMOG/Nszm98C61h7IoJY65AjF6fKxJORf0/+Tjnu1O2gw2J
         6W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991685; x=1775596485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+JxsCBfymivBX08sGiCuLcobIN7cdPrVFtFlzFTvswg=;
        b=Ay0jka2wF77NtWfzlat4ddUSAh0B37jPSBUK6uQvIL2wi1lBIoeIpqrz8xAeXCnTLz
         QzgD7pMnoE3puppVhRQzDTk+f5ky2mVZd9rbVI7QiaMPkRptUtkdVlweBkAb6Yei6h0U
         7NUFXuXuPONlCfEj7rbA+Vy7xE7hxSTrTnx9kGvFHmB/SAV9vtAA/U66pF3HB6X2yUuC
         aBtEo7627+NXoXFG9iddTG3ih+yHHaPrIvG0JDPhpiD7I3+Elsjqy8qtSgLc/xp7MhOV
         0cqjT2oc/t3ucJFfMZ1T5xKlx0hNE6CTkXWkUKH8YW5hluTV4Wosq6dRNb1sBp18uEsr
         qNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV46UNjsVrdBlpN0Kwm9fSsQQtzuG1ZL2oBuIjPSu5VxDDu8h8ttT2NID6Nk9wE0yrseflYHn62QAOPapkFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUhgBlQifhfNhNS472qfkr4v1VOW0jW7wc8W/T1U3QQAPFF74
	Kw5J2NAKOHvhx04EQbzOAe0RO9lmSo4uZxq9N/VWyQUfo2K5FNOetDSdn8FvGz16Guq1W3OseTM
	adxpq4ahVr4RI0r9YR+gwbFF5IImGZZc=
X-Gm-Gg: ATEYQzwpD87jJFQoriXET+A6fcEPAb6icagmxRHkfUF3GoZSh9MRm8LK/m822s6jC7B
	5dR/yUsBI8TcVHt7zyDbkD+HvpIpgGEdeQLOjLJxPaJw53lbNV8S+Bda7EtfnhhI8/CDhQulcbN
	JdLF6OQH1PK7P7QWhE+79Z4yd6WCMjARjdkUneoZR1NsfwNrhXIBtxcTZfaNdohIUtG0opd7gP2
	hArQGIxL2hBpTT6+nWjX14JgjrrnQzjTSIGfftmaa/WgJDWCcnb9niNRvNj894VkKdFzIwQdaXb
	osSmX4HXEwsC30EXUIyL36GCB77hobl/Ojl3D+Ixj/SGoF1qYQ8P3CZzn4PDBLGO98n6LvF7o9Y
	D5gdCgEYV7Y2pxviy5eA/Rv4=
X-Received: by 2002:a05:6512:68a:b0:5a1:3921:ab52 with SMTP id
 2adb3069b0e04-5a2c1ee0fccmr147403e87.2.1774991684307; Tue, 31 Mar 2026
 14:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
In-Reply-To: <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 23:14:26 +0200
X-Gm-Features: AQROBzDi8zFnFshWYLfIMPc2xGZV-8btLPSlxaPEnVYkLTlH9_dpustOMhcwwhA
Message-ID: <CANiq72=wsdJf1_qwAADhmKA2i7y9U+3WOm+9utE2rv52_eqnpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:07=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Does it produce a false positive, or it's a false negative? If it's the l=
atter,
> I think we don't need to disable the lint.

If you mean for custom macros, then I think it is just that it doesn't
take those into account at all. So I guess you could say false
negative if you consider that it should.

In any case, originally I just cleaned it, because it wasn't a big
deal either way, but then I thought it would be best to keep the
behavior the same. So either we disable or enable everywhere.

Cheers,
Miguel
