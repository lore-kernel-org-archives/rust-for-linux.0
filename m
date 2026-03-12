Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753953B6BF8
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302269; cv=pass; b=qiM115KBGIT7wiFO1ei0bxYbuRTtmmX8pfZHc8KBquSB5GgoBzXqltPpgk1rg0W00bWDip2KnWAnozitmf1QdS5CZmSJw/9ZF+74j5JhPHtYgN3lMR6lEJRRfnLGEMmPIQ/Dug1EkynEjQj34d9853SqWdJjGcZPtGhQdhNsT6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302269; c=relaxed/simple;
	bh=b3927kgBfFIgfwwOc5KyVGPhOpw7Fya38ycFO4gG8QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRPqJEe69gygYgn8XNqEWbLNW2aGk02OH1XYJbyMc2sToHeHXuUZpBI/ANm0T0rEWoqvlhdQno70At3J3khTm5pQEkQoI6OavrhSemUDP0Mt8cuNNQEnVSUnCVaJS5rsI+W3jty6l5rfhwvxpz+35W1YdayY/c12JaNFGKez7/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ubq2Nm2x; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ubq2Nm2x"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1273c690e5bso42725c88.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 00:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773302267; cv=none;
        d=google.com; s=arc-20240605;
        b=M5axKYpQpZuW3J2R2c9mrPFrWHo/yloaHDyy1ZuE0HDuZ1P1YeqQuXwJDDdH1LYplV
         A7bVQpeIXx7esHty65ZBLsIM5XigIQhDF2vKdFNb+YcoeCz6B5Prkr63uztlOagzAADC
         bXij9jwpBygu6mODp50feL8YguX1XMbgD4YAAKuWIKZzYPvfhpKVv19QSZhiKyXAuQG9
         8c19bbpD2Mvp012lxH5nDLSAexGNsHoMDybRvj6e99J02wEoHTPrEDmXLMVv5OlXawwB
         1n9FZNlD9hwtextuVFTIe9al+o4CRbWcITFcFeW5YwD175DYof0hT4X51uxSSAFtzOrY
         ZfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LAIZYi1tx+DAT8oVifXMbEn4vtNErwbW0ZEBgH3QCzM=;
        fh=hobjLuVxK0wD61I8qZc4dJSXS+S1MK3nvZhk44MIqDU=;
        b=GEDaqSN4XXAIbdyL+AAFT/onaYUxHOse+dzg37t8XlA0zv0ktLIpgOk48JZULPQYt4
         hcreK6b24Qhyl37FONuq9/LSYcSBqN8ebtf8Y9Gmn/Fm2Ol16V67+BpLTzHeIWvIob1z
         wecnXgysbcUbu3/lGb4aTiHx4Da17iDlVW7Iyp9eXBqjTTPsd32kVwJkiaRhPZA8W0hO
         nIrUVeLmTMBbGjQf5bAArRUTomqwWgep8jspomLtcjoCiRHHlpBa51VIpiIqu1KHDBcH
         m4lePDMc8lyI6FO3gcgq/wKtVYiuD95sw8X0CnYBbrTAb2Qy9Sg/8S5oDZOyEb7xJDBK
         oEgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773302267; x=1773907067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAIZYi1tx+DAT8oVifXMbEn4vtNErwbW0ZEBgH3QCzM=;
        b=Ubq2Nm2xXPsbIkP8qJc1a3Pi5lIxF1ERW8y1eYJJraUeYWtu6TSZHc3/SNya6jKYRp
         KLPOkzMUpDjcj7TWE4XCiHdONrVrQf12qc1vwkjdhS3xeK8TevWxWJv165i2ASBcBMcC
         4WaSUuwuYT/wcct9sCC9ShBmsOE3ZhafSYfPrLTvbecCPQY6plbnY3zjnsXYXLo5Q4rC
         QY3JP+0/8N+ALtIuuWxra2vPLP9WlR53tZBPJsVO5R/aswWlhMFgGQ68muuy/j8SOxqu
         ZCGx6ds2J4R+ejriE59iQPRSVtrtM/o9R5KwOZXyllxnx1ciosyofrAYa2GWodnUrov7
         c5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773302267; x=1773907067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LAIZYi1tx+DAT8oVifXMbEn4vtNErwbW0ZEBgH3QCzM=;
        b=XrSlgt+AZpLf6qL1dEr1sSOLyu1xj5+P4znCtilDPkl3bBAWfau5kNTQzILtr88kTi
         6w4ZkPnqCXG2hDlwfpyLXdW0N/8N8fiu+5kpMZ5PQZgY6EDtrnC/ndcNghLKnI7Sy6KU
         ddTKw5JGhcnVNnlijFrIDp3HO4pmdKm6fCeeQjworwqUplJUfrGFFBZBFMk/uMoPCxqt
         U1Ipu8cf1AwoX8zzwtD7ki28okeWhVC20q1/NVcyd6KYjtbUFuYiNnCw15bBmIj6fZIP
         IJ00LAe+y4qylAJIGP0Ddbo+64u8VHhIaJWZkUD9ccgNvkBIWvALIimHO7jFJW1PedUa
         EQdg==
X-Forwarded-Encrypted: i=1; AJvYcCXAzWWPRU3SDXeWRZcURZhELhLxDsb7RhNR3f8DcKmqkFKL3v7+sFQX684fPUp91vinbh3G0bCxOev6s2o5FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbGc+lwiuM+hEdAHJct2ulSVdfNq1tm7oP9swTZ/VtnSU4/krn
	EAuRz1dmIDChtr5auVXZ4yJuRJA5sF3ZB49Zca22ZowKNKvT66dIlmB+UdvHpc/flUFkvEcw/4m
	LlvolL+Jvn8MkpSIo+ZzQYo/dXiy0l4M=
X-Gm-Gg: ATEYQzwzpq/wjlbUlaBx4JIPJ6vvYhagD5/646wlxC2FVzWKVNc6NH22EHwlGQsfmdc
	DGsoc5iw1H1UMVcoEuFysrlK3GMXQp6VQa2+xVyNDYx/ybtENeoyQLnF2eoXDYCsR/7jYYU81Pd
	Mvy5y2jYdzzep5BOSf/iTSlZtHCs00npQTlzvyoAQnC/V3uTxcco9tqO9YxRQm46cqV1u6aa3yp
	eCJf0p0oat0lhpIDHf3lTdm8OwbrOJCPQdIlH5yAN/QNmMhsGfrY9rALtD5rP+YQpteR/jhX9Sp
	65P+MBAreERP73nww9cW/O0af9Y+H3Squq488hoeX3hEcjJWSGkNL9y768f5AlOw5eFyINVE990
	iaGea0PA0p5SmsxcwtQQ6V38=
X-Received: by 2002:a05:7301:2b06:b0:2be:2b8a:9523 with SMTP id
 5a478bee46e88-2be997c4881mr290640eec.0.1773302267434; Thu, 12 Mar 2026
 00:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311105056.1425041-1-lossin@kernel.org>
In-Reply-To: <20260311105056.1425041-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 08:57:35 +0100
X-Gm-Features: AaiRm51Wij-ad7XIJL96sGShdoLG-JeALKtfG2RMEOYfpUaWxPBGVgxOuX7riXU
Message-ID: <CANiq72kk5_wzA9izJ3YPWUcQGiEUQmCif+iqFfwK9b_5mq145g@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: replace shadowed return token by
 `unsafe`-to-create token
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Tim Chirananthavat <theemathas@gmail.com>, stable@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 11:51=E2=80=AFAM Benno Lossin <lossin@kernel.org> w=
rote:
>
> We use a unit struct `__InitOk` in the closure generated by the
> initializer macros as the return value. We shadow it by creating a
> struct with the same name again inside of the closure, preventing early
> returns of `Ok` in the initializer (before all fields have been
> initialized).
>
> In the face of Type Alias Impl Trait (TAIT) and the next trait solver,
> this solution no longer works [1]. The shadowed struct can be named
> through type inference. In addition, there is an RFC proposing to add
> the feature of path inference to Rust, which would similarly allow [2]
>
> Thus remove the shadowed token and replace it with an `unsafe` to create
> token.
>
> The reason we initially used the shadowing solution was because an
> alternative solution used a builder pattern. Gary writes [3]:
>
>     In the early builder-pattern based InitOk, having a single InitOk
>     type for token is unsound because one can launder an InitOk token
>     used for one place to another initializer. I used a branded lifetime
>     solution, and then you figured out that using a shadowed type would
>     work better because nobody could construct it at all.
>
> The laundering issue does not apply to the approach we ended up with
> today.
>
> With this change, the example by Tim Chirananthavat in [1] no longer
> compiles and results in this error:
>
>     error: cannot construct `pin_init::__internal::InitOk` with struct li=
teral syntax due to private fields
>       --> src/main.rs:26:17
>        |
>     26 |                 InferredType {}
>        |                 ^^^^^^^^^^^^
>        |
>        =3D note: private field `0` that was not provided
>     help: you might have meant to use the `new` associated function
>        |
>     26 -                 InferredType {}
>     26 +                 InferredType::new()
>        |
>
> Applying the suggestion of using the `::new()` function, results in
> another expected error:
>
>     error[E0133]: call to unsafe function `pin_init::__internal::InitOk::=
new` is unsafe and requires unsafe block
>       --> src/main.rs:26:17
>        |
>     26 |                 InferredType::new()
>        |                 ^^^^^^^^^^^^^^^^^^^ call to unsafe function
>        |
>        =3D note: consult the function's documentation for information on =
how to avoid undefined behavior
>
> Reported-by: Tim Chirananthavat <theemathas@gmail.com>
> Link: https://github.com/rust-lang/rust/issues/153535 [1]
> Link: https://github.com/rust-lang/rfcs/pull/3444#issuecomment-4016145373=
 [2]
> Link: https://github.com/rust-lang/rust/issues/153535#issuecomment-401762=
0804 [3]
> Fixes: fc6c6baa1f40 ("rust: init: add initialization macros")
> Cc: stable@vger.kernel.org
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

    [ Added period as mentioned. - Miguel ]

(We will need to resolve the backport for a bunch of stable releases.)

Cheers,
Miguel
