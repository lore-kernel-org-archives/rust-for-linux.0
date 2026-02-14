Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7EB13A244
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 01:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771034075; cv=pass; b=oe+qEZItFidMxOH6eUVqoPr9PQh2AdvWJaiVB26Q5SsB7PR8Gu1NtwDpOO5G3N1TW7nFmjpssiU6BeIHNHdG7776NKRM4FP2sxmsA1jknk2AAR4/N7HU0aaK5CkeTi0GqshCDnybawdrCwxx/M/vjd5RyqIzLO7z8dgC524qUU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771034075; c=relaxed/simple;
	bh=fT8yVko0T01SSirI7BWFRLelbgi2G/8rd4uz2nDObqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=teT4oEpmXWNtVKoXMJAySJaawONuDb5ErLbzfCS74OHg3xm0ZQQiMlbgJNEOi9kYztoJz3HcB3iDAPfMr5QTh7dnBMoH31uFMyL4cJeK1qQIMiNBa1w+RUbG3LMeLHvA2mkFEmTZ50rTWbK+eib7qhYBO9Iq94O30y5zR7damZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmePTNQI; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmePTNQI"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ba76e80509so135730eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 17:54:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771034073; cv=none;
        d=google.com; s=arc-20240605;
        b=bYUnCSBMxxgh8fXK2xZi8CcWsBkRcSxmuXxt/EiO0s4AZpZWAlA9N3rPIp/F+E9oou
         CTWO16rs8ZHVhUCftaHCubAsMFpwKcxMroKT2IHtzjv1QrX7qQmMhikztAsXTCt/F8xw
         AbFXumSJYK7W5+Je8P9hTdb7+/CnNO5dQJZP4+uA8p7eXtrGH9SQcgPALsTs+YPBC/fc
         IdGcJ77ST2yWFMewqBywBpsLKjBWR8lp4NTmRf0NXjusDut/323qb3CPQapJxlcpTD63
         Cmx7+cw0OZzihKicOHOMKFojbDxbKFwt35yvuH8/w8RpapjhkkiwVgbre+PtYn2YaKzG
         hzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fT8yVko0T01SSirI7BWFRLelbgi2G/8rd4uz2nDObqE=;
        fh=kPCGltJXoviiW2gND7PSQhaFvB7op5NOQikSdqZIgWM=;
        b=AOHTUKOF59WK88Iii5oVG/kSX86Zg4nTYpbi97oKfqUFK4C5s9UrVRpdW8AbH79MXf
         2RUPmugShkIzttI2EkdAo0jtRiJRouS0pAGVeBk5SILrQucR6PU/LVa2e5/YQTfGpLz5
         vD9ArxRm4/1+xBZlIrF8ypTsrvpSy76MT5KwM+WWeDRrU5pngljntFV3XmcBXpwqq4+q
         EeM5DDW46Ae1ZXirjTfDDxpSCojowWPZUFohxwEhbBBfLlIJtZvd86W/0oIaMEw2rN5Z
         HgqsbmMidnN0z4nfwqwrK6zY0AhpFY5oetFfVOBfgMIf2rfbVITa8hgT5/vWU/Uc23MJ
         /5lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771034073; x=1771638873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fT8yVko0T01SSirI7BWFRLelbgi2G/8rd4uz2nDObqE=;
        b=XmePTNQIAPeV4b0JhbdNjpeK9S+1zXXEhcbPeokcRrbOgHqMKhTArPplZoprDakSMn
         d79mM+3zXO06FRaoem4OMINE5NY3yGpyF4htQrFXWKZNEzxHrRNroc4T/FM0mGK644WR
         mXfwMqSyLafnJ7KcPIFcTLlVakV760yM7LCGRhmn6n4cqQPPbJLjY0XALz3QFifrDFJP
         ZbXg6t27yiHYQQn0U1bL4SSLIJ7iWI5otsiBAkRks/KieFJNqOUlwtkbw00/TCCSHgYB
         nBaUlWo6EiVlflu+ep4Ok23eeLvTO777D3SfBKEw3skjQqf/2xCxJ0roU03o5sIsTuHV
         BDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771034073; x=1771638873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fT8yVko0T01SSirI7BWFRLelbgi2G/8rd4uz2nDObqE=;
        b=sFDEvm8lIDiLIRAZmxojq37YgZXjhX7cH4FJqgPBrDAhbdhJ6j0yKh3GKykyt2qxBd
         KbFn/p6y/mS0H6ydYo0XzxT7dGV63ShVtz4IK0KWzmc45Tgobfc4LfaY/FpOJ+HlDX+T
         q+6wtD1VEQH6hamH7VJUG2P12pGYdX8G9n05PbKOexTh9CfQO1ij0Trc0xkppNO5WGbp
         nMk24LocTxekIS9T+6nsR5x+InqVO4ugMQh8Fn80IzCwzJ62TtUViSZAVPZVQmgtruJR
         cAWXS5fz0ZqTvu0g/H476O8+TLqmx06M64nAN5V7bydlZSoOB5MokCim5wEvSEYQwonB
         RqAg==
X-Forwarded-Encrypted: i=1; AJvYcCV15KOVsR6gC84gYIABfVCHMYzdNqACriq8y810OTf2GfXPrAmBA4sP+3Gs+dRe4N3ynVUZGVgGBYU+6jSmhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIKg4WGzmXUOa3cd2Sm4SDf/KESW4cc/DxXttd1K46XBvbaUUl
	7s9AgdBzYRzF273WK8ra9kfFeXAH+8b+iSuVeqafp7clYZ3D+NYpPhICm8Y0+sfUolyQhpt2ici
	oPdkJQW/w4oUa1EwmmrovVm30sGQh6J0=
X-Gm-Gg: AZuq6aJkjmXBp5/J4YjBWZbopKXRFUw9y+h4rIgmSXrFEDF4wpZ1qG2o70BPZqxbKid
	s7ZQ96Gg78FI9awkIo7Z2bHc8ElLKczRig5NC8lDdkayr6oYU3jXW4eWVEAwBR7EIRY/15QrcYB
	/Y4S/z8RjRXzpYsi5dM9h7wIbdqM35vEzs024NqH+/rkW60r7/uQQlsCJCxs4+r+m0oaqRxbYCC
	enSO4i9oFgqewTfMB6TACTZA2FtR0Ww0dFPq4HqqJfEibL6W3yE4Il2AwOhRK3ozpEpXMZ3lxLA
	qECTBLtP0/r1GSbaseJpekpXjOWsY+JE/+q8jUYiW2xC4ibzi6W05aVmZIjaox9kI/CnrFn56Uj
	/Fhzd8Jf1vJyQynEs8qSFVyWOw+ZEgEVxwHo=
X-Received: by 2002:a05:7300:fd15:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2baba0f2857mr810577eec.6.1771034073204; Fri, 13 Feb 2026
 17:54:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-rust-binder-ps-v1-1-6b90f83c0b4d@google.com>
 <fed9bf3d5d9681e1003536be6cd99088@garyguo.net> <CAH5fLgh7BsgJFAdayERCqP7D3688XQpj9DcfJrZci0kamPUNWA@mail.gmail.com>
In-Reply-To: <CAH5fLgh7BsgJFAdayERCqP7D3688XQpj9DcfJrZci0kamPUNWA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 14 Feb 2026 02:54:20 +0100
X-Gm-Features: AaiRm50VOd3Q8RQXb2Zz1-OwZsLpUDoom5qngwTJVB_Ui912DSYTMuiQ0gcrH58
Message-ID: <CANiq72k+ORTneDysC+iGeF5xnyyycNd2aSumfwn0xetDBW74jw@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: avoid name mangling for get_work[_local]
To: Alice Ryhl <aliceryhl@google.com>
Cc: gary@garyguo.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 1:20=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This is mostly meant as a temporary fix. Ideally ps can demangle them.

In that case, could we please write that in the commit message, or
even better, add a one-line comment on top of the attributes?

Thanks!

Cheers,
Miguel
