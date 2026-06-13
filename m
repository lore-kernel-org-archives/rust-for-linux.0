Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD43D16F6
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781339088; cv=pass; b=QvX3g0OocF17gFk8HV+0ad+E/ueuEg/4SvEkTB0+W37g6puHST1usFsCVGZ0i6bNttGoVEKMR2JdlOD0nB/qaqjcg9ljhQ/xRQnKkFzQ1P0CC6EBrXKOJydyu/NJhXnyjoIgn/Q6v8GjRa3xEp0JjA7sNqgXIdtkfO2w1WL5xlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781339088; c=relaxed/simple;
	bh=g5KzushHRRmukEtGbqoZM59/Glbw9Li7Y7mZtGWIifs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RElIaIAr2qS0mxOG5tpAH2LJx87o0/8gV+5sgqUK4AfPF8h5s9LnDpYzgCoGzdwtSPw3QmLs7xpiP/GO0uRBgsYRCwdO6g/j8rfBByBDeeSdO7Qa5is1e7kElxrOmuLAvk/9JlPi4CqalQ0fv0AXaBSa3pzoXWR3akDxujX7iIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axLh7lvX; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axLh7lvX"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3042a99f0ceso249705eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Jun 2026 01:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781339081; cv=none;
        d=google.com; s=arc-20240605;
        b=KgCmsgQHfoSqnOx9qpL87x/mhru5pw/aleLlBVzbA4JyBJsm8P380iXQXsQmiXUxqy
         Nfs/kvshNwKUyUNjyx3KWy5We9+LVyw/uR8NIfcboT/n8ku4MDk5iBsVh6KrIpGf3pYr
         FLuUld8Jo73P8bEYChUVswjs9rQ2OkRlQBEQJxV2hcI3raMfGIS49d5Ubm+SAk89PLsg
         L3OzeK7mF61R4o4OiLYOWDftVwkb9KyOT4eKsZmgZ/Hm/cQyU0dKV6+VT0xCaJgUQESM
         VUZke3XzBmXCl0d8lWNt48/76eg0Vh1zNUZ8UWmtuGp3d10ZCbBGNRIWLWv05NvCY94B
         w+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5KzushHRRmukEtGbqoZM59/Glbw9Li7Y7mZtGWIifs=;
        fh=Nzg5B/HvJwUdm9YdZoUErbjbAwy+EaHhsuXJ2cLUNpw=;
        b=RPCJYLYOklDYcz6Vg9FIJ+RitzHfv8rYWrSiv+Sb3AgZMk6KYfbPIRD/w15HlYX3Yp
         xL8js0yzh5K1KVAS8t3TJGGcEYpxXRQ6C3mO5/aLbt5Nr6wMV0LZ2OuXfhxyuwMUlxbA
         dN40IeZ0TaZ5XE+9Fpz3s77ckfNkZYXwFSDt76KHWq4nfYUtsPyhRG8iv5Ah2xDXdy6Z
         x7dYFMh8xm+Z/qVYzdBkNyEdevStbkx/orO8e7lYiey5STVf8NwgjrjLpiyn64G11Zr3
         0QkqZqc7IELxeM+NqKzGlIgkW1U1oMjjfKwKIdb0Z1bnqTCH//sRglBnvhqVsci47Kfi
         FCCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339081; x=1781943881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5KzushHRRmukEtGbqoZM59/Glbw9Li7Y7mZtGWIifs=;
        b=axLh7lvXThW7ivx3Vj8N/2bgSqYflUa7UKfcm9wIhca5pEM3GpDutSOq51YQu6Rt+J
         dB9XENtGPrXpGrCsa/cHFzAKwf8ALSyRmj2K0aDDDWOkG7SC5ofOUEykUYHW+GNQzw0v
         Giz1X5SbvbTUmdxWxu4lKKwSyNN2D8bBnOVw6pi2a9uMf8oR3ZpbaJWE0CRdhi53nfPr
         dVBnvsWMeGiZ9iom7JKyE1jW7dUOBj+0pyhmNkdLqhVYCo36InBKdcgTFebnEe1H+7gi
         nYrzao+ggLd0jFYK+wBBATPWl6QV1BOwa0Usi2eBQa/Ox6QPtU0EdEJrUEuqB0Nodtzv
         zg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339081; x=1781943881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5KzushHRRmukEtGbqoZM59/Glbw9Li7Y7mZtGWIifs=;
        b=aYVQ5Tf9vZPkYQdu8OX1h/bm321ucrRcPc7RttNjSPnqZhb4kvhwsD9DDOfiQCsKfO
         gfPxWbrmOk6btFQ6BMjA7J0IrNHxy8tfSCCR8u46EOJDQqKNLIgULqYD+QuPDIuGb+PZ
         PLGtnk3/nLuKmEqaCHhiko30Tdouxez2F93sVurBFY630u369L7ePP086hvumY0rzG/0
         RHEeOWiXNK5hVV5zPMadWKYJJeqeDbfneuc5LGNH+oeNO0OhUvULrmj9dILOV+FSbAC4
         HPUg0yq3XSyhORX04InJ36dE3QsieM6psGbIUq4iRV23lpvVz7ckICYvs1ccl+OCrL7B
         X/ew==
X-Forwarded-Encrypted: i=1; AFNElJ/YQC1eIyvDwBhbGqVL/G7NmrvpXV+R6zUr0yIneEWB5lWuoML1qwLWkxOCCGsSF2fFptyf0w77O8UUWvDmcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+1NZJGwdzKPT7ALMgWAzM5f4AVwk+nqS2JxakINF1a4+9esOw
	WUKS9rcB911kPVzH/e8lTqcu9W3w9kLJYXaLH1zqrY3K1KkJ13s+IoFA871ucGV8BLv3lpBHCIf
	RF7NvFTdQqP45+qjF1N61oDCTCZvWtjk=
X-Gm-Gg: Acq92OFio5d/qmW1PqRLHlVUxZd9Lzko6aD9T0OKIiqIv5QDRYYIdtPMoFGJDUSQHvj
	I0N29hB6dlY5qNbw6JTbkJ3+1NAm6iyY7/X/LrxAt+cT1kcIijHNYZZIWyxjPYPmDryCnpjiEN4
	e1vQgmsdEFX7BrXhDjUnynFPy1TJEsV2qYPxJEh3nAGTzlCXBLpXo5BuNlb7ZliMJiNyd3o+bIf
	Bt/S1yNCj3v4F/MX7tQ+zy35QXCt2Yz58MdQaxksUFcOLppZoUrGj2QpYnGWeXhsVj0JvOwk5ok
	l/mQ9GFWReSRZUDjqgkP1V4zHQm2S5Oxlxn1gY13myyCq5lAQ7hKeYDKZIfOZiSFfB9CoTmb1xq
	k77pZWB2spL6qOBqXvlgPfNSZM5uhCugX3Q==
X-Received: by 2002:a05:7300:ca1:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-3081fcd022amr1517756eec.0.1781339081236; Sat, 13 Jun 2026
 01:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611190555.2298991-1-gary@kernel.org>
In-Reply-To: <20260611190555.2298991-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 10:24:28 +0200
X-Gm-Features: AVVi8CePtMo0yOwcdyfj21Ouhep7MZXJjFjguiWMznm2eM6loqZmG-0F74juPbQ
Message-ID: <CANiq72=jN26uwckWC=gaMLwtRfqoq=BQak1H_8Fc5zsw4GrbpA@mail.gmail.com>
Subject: Re: [PATCH] rust: bitfield: mark `Debug` impl as `#[inline]`
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 9:06=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> This reduces nova-core.o .text by 17% (from 151922 bytes to 125676 bytes)=
.

That's definitely something :)

I wonder if we could lint this for `fmt` bits.

Cheers,
Miguel
