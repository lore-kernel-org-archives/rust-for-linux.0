Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9E27BF93
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810827; cv=pass; b=UAtVWb1Gk1M/Q2M8Zj0zUzDABB1Nwjs6a8+W/uplEnW1MEzpG9OhOyx14lJLDxIy2CIQ23LKRv2qBPaZmREiIbJdZ9tEHaX+6OZKf0VWeCX3o1up3wEB8w9BfExp4Q/tnx/lGZ85+eBrRSbAu+jzqfjZ7UBLXZ9qOmYSphGp6NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810827; c=relaxed/simple;
	bh=COpgFWvZ+EUZVLpC7LGHr81q/qI/xWnf2UCJqeTvGoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlGBy33JVB33jUwuc80k7MA6i0IgCEMqx7NN0Jf540mvTxxcXMb2bNePe2xqfj+BCFJaxDQiP8U3Mcoz56rVejKA828LjGXIk0xb4B/SNl34KvRw6WgeC/GOKMU7IUbFpzuKMJBtyqdxmYNIJNEg+XjoK/+MFQMBU+wUb4lYYLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gY72azr1; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY72azr1"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ae5283dae8so248376eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 00:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768810826; cv=none;
        d=google.com; s=arc-20240605;
        b=NbV8WKhbbJ9nNd8WM7hLXcIrkal4f7NTShnsxo3hNUVVrvX/N7ewOF47fd+jXNwfgq
         Sk9UjGJX3MdJ0T/UsMwMTM8OSZXPz9INX29C9ZA9EIxloPtAuEtqv82uUZZYe7nS0eV5
         Ghi6kmk0vv0IzA8nx50Qkb63nSu1pVy3AyJRReWMQEKaWU/IrmiZ3Lr4jQ2I2SN5h0gD
         fqntkngEHC1aRiy4zk+r9Hy8iMcUH2tPga9j00ANN6/TssWuHW/qp8C5pqVuTmowEhjp
         /QgpqCccVdipBT3oGL8L81+ZhfqyYq6eQeOvG0n86x/wCqHuD+tMtdyKL7uMUthgA9Wo
         oUmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=COpgFWvZ+EUZVLpC7LGHr81q/qI/xWnf2UCJqeTvGoA=;
        fh=OM3SeZPvvjSBBTCbrrj8HTY8xgEnARpYciVuKKEZ6lg=;
        b=Nk1eqvI0KloDCISoF9O8PiypYZ50BOw76oiiVQWkdsanywlC+H0LigOXALH7pfaWPa
         Jn/ktdTrcLhCtyFLseYh2Fec3FE3A6oSdZiA4j8fh4jUxaIuII7ZzIjIOksoGCqPuYOz
         jsYnwfahKMzunR5dxhlj5P7v4BZENTyiYmdYTewBf4xEO9lWqfNp7Zq9Zj4jvy+yZFTd
         5N33GVKUUD3zX2aKO8gVEFzq64MPZEYvBQ3dNw58Ki1u+B3MrVlKT2f79FvogOnHJrmS
         ly4Eh+1RkQl/54+A4eKwGU3LXvLhNQmOmJba73MhD7fzgnd/O98DBhLGb3vazbT/JPtl
         xgxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810826; x=1769415626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COpgFWvZ+EUZVLpC7LGHr81q/qI/xWnf2UCJqeTvGoA=;
        b=gY72azr1Wmb7FqBrSRrpy5LkpsZccHtPwxMmVq6kYFUFpHJfvURTWMpV/zMvL7XfaD
         W4Ayt02jCcfOO/dYopR0TSz7bQhUNaqenEor8aoYsq/Z4fbhxm7Sf52DcXTdouXCkzUF
         b3EVyWQeRcRRSnMqLL0BWU2MzPffb3KHvCgJHpMs7qYF/jBGMcwvprZGcD4AXkAfrmaZ
         GsRc75otLucttsFxBZ0WsAd5bNv8DgY0gY4qgYSI57f8uRDsGSqWI3LnPffZjFgLE0Ct
         96ekLXiKg8iSzLMNwmQJq/rgO2xjtFV2JGqK0upc1SkQ7FfW86ggQRIS5HOk72V6ISLy
         VVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810826; x=1769415626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COpgFWvZ+EUZVLpC7LGHr81q/qI/xWnf2UCJqeTvGoA=;
        b=X2l73NPp2nrDeDgrQ+GLcOo5Bu0gbFewpme9FNXv69Le3enFixH2wFaqopdkCBsMQJ
         eH6vUbhLseou5ff4Z0mKAYQk6H0lpy74mbSiO1snoYP200pOLUqyqHeRt9c/0XSEWAxQ
         y8cyL+7tqc9k1bPvvSNxHxkL4MJtJez6bZ0pQqOhd/KQP8BXRrOb3eM63WcOGMmwAWBn
         oNmV2HI8CEO0nxToT/wUyMc6jk8Sc6Ouso23q/DFdR6AffLQCwuSIW+dV8eR2m2PgSMX
         GN/2VAPgigxXnaTr4iEMzQOb3IEfj8DcdOSPnb5W3hg2S1OdAwD4qdYOpotKjMbVi8O0
         j5mA==
X-Forwarded-Encrypted: i=1; AJvYcCWtR9ZhNUHIj9mn00abi7yIzD2FqngvAwkm7p5chi2Kgkntf8YCzLKKa6GvnM0bODPYnHaVJMgxI3LZOr+mgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWlzJ6yeBayCRMBmhWAV7WcuB1bwJGtKotomZWlq+uWMlZZ9k0
	IRwXvHxXpcwFlqsKpWz51Q29KUl/+3G4F833tdwJcRIZBWkv6Ky6bUg9arPq3D4DPiBA6MuR7vV
	k6umQQTIzFCaLcO/LEd6zUmbYi73aA8o=
X-Gm-Gg: AY/fxX71G/JU3j2pHdksFgGcilg/cBDKI2iw7MOPy2/nvvUWAnwRDQ82ca/BOU7VCZ0
	SzdDLCOR1qlL99sUncqD4O0WVR+5IaIgUqllODy9iw6kj5ZVgTUG5fGI8LxqQlOZ9xCepmt16hZ
	vBPMfOKnnhlB/BNO1meLQAz5wZ/eK7qWwQEbq/QFKKy2FDYgjvoKwOAUujg+Q8fmtT4Jhl6i9QM
	6n2EDF0eaoXqILRA6S/0fn+E/jZbs9f3SeQLrK+CKDe2+SOTlIdulVymkJRAdi6h1di4Y07MQwL
	rRYTmzaYWC+/0MLSPAu50r6g1bURuieAuLpDTRjtdsuzbs/77ohTMohYghQwpmF4uFaclRkEGWC
	grJp8jVlLiVH+
X-Received: by 2002:a05:7301:fa0e:b0:2ae:5abf:ecff with SMTP id
 5a478bee46e88-2b6b41078c7mr4092734eec.7.1768810825570; Mon, 19 Jan 2026
 00:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
In-Reply-To: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:20:13 +0100
X-Gm-Features: AZwV_QiCAdSbyRCoN59jw88rASfgcFBRC5zOhUOhxRqnzdcf4bTKHTpXqjSfw8c
Message-ID: <CANiq72mjivEnnNif6hG3Cb=P4YYmy7REV75j2wayhL6jPug=9g@mail.gmail.com>
Subject: Re: [PATCH] rust: ptr: replace unneeded use of `build_assert`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 9:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Since `ALIGN` is a const parameter, this assertion can be done in const
> context using the `assert!` macro.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
