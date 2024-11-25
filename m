Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F293F190056
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526064; cv=none; b=saogYvVgUu/Pd1sTaOeUKXR2fCjZMIk7rKVQSNE8BlaPxMgaBDlocz6Yc6ObSiRQc81bjKDgZyy39Tr9Mu4xEWHejp0q4u+78XryVr6W0vVGz5PVgRex4Bp52p0H7F6YvUuc15NP5GuvXkGwJ4C6MSeOm9910Fw8OTVWHvnboA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526064; c=relaxed/simple;
	bh=uSsPtNnVteIM2BzthXpkxL9YoGLmPqhmZKg37rTE7Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJGweuG9PV5rpcSQol3/W7PUL0Sp2NDwSdP21dxV9H+qCJ3A1vsYFgU4lCsGOZgi49e4CN50L5C7qnlMGZo0uQzYb7fiEwgh2MuvHUdA1smq9T76E5Gq1j533xDmhKlj6vnd1NsMHhCscvK4W3I24Zv5/lfvnkAmhCdzlfqVjNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rddv+XPM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rddv+XPM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38248b810ffso3175158f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732526061; x=1733130861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrdMiDJt5vduIxa0PY5GoA+617/ZMEzbh2yCH7ixs2Q=;
        b=rddv+XPMAIXrLkGAPOpX+Lxk/dHpmmSxHz+copGp430O29dLB3W1ClZdOX+PFwLS//
         83AS6KyGKm80EEsweut4Hrt31pFzll/QEVyrT/2MXtevBUUhLol+Sa+TM7CLxorntGe/
         GvY/4a9NlXFbw1y1DoxxSMKIPiKBp1l5PjZGcJH3krTV7wfnD/gJ6AoMbQUxUb3I4NAR
         DQ57y1qXaoISH4PPTihcIm4sbfQdzYYL7PUJUIRF531mWo0SAnJ74Jsm415Ge+MxLKST
         KvqXJkrkEupqKZSCSh2vHNPiuLVlNd2SIXcVgmReAXtwv8N7r0+EaBe1adauWWHXXXix
         ghfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526061; x=1733130861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrdMiDJt5vduIxa0PY5GoA+617/ZMEzbh2yCH7ixs2Q=;
        b=K119fyTmiCIgrlsu3kmKD2pIyZO8QAm1HXo8f7pwrrVgm6lBEYKO2vpT4fa8RNHRXR
         uHJT4fhMm62I7k6UxeXq3xcL6hsRKhazMbS7b14nw0kiLRY4NZGPbpG7ajXodbS5W+PJ
         QYRJaFNegbAAhccI9vA33218cerR2sA+zTGfQLrcxprN2xvQuD5ld1oXe0yGFM3JN2J6
         0SoyidJv8Ib0zhRC8sKbPgczJFu9uJ0pNGpRn8skLCN6VzdSdgHvEtLPwqLhXC6j5qcR
         Tnmk0UFrxvgBcdA/hdsSUVDKt3kyHE38J7nX/4f1mFuJ+HXkuXhInUFwBL13JXK6eT8f
         kt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVsWxsdJgZ1MD2kCOBK0anxxRtOBLtgQkcSMtx+kP5ew+6N8TFDz0yMHp1ZUIFIcF3pp4JHyQndOOzC5Vykw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygBKni8bxhq76zArcp+WLU8SVvr1jAyMzFC0gS6VTjCNZJ9rCR
	cubkKbta9E4dIjJINOrMwsLWpuQ3aLaWesFPG7vAxsRlVIdVhkJG407RgTaSVag3a0EDprKbGaB
	W+um6BOfRmtFeV4sdf/v6UowAHzDP2z8btzFin+1vbtwpbmMs6obq
X-Gm-Gg: ASbGncvM3BSBQ6q8tbjpC1z5w7KblCArdwxCaQA9tgp/pphGBGFbVcESSohvau9alXH
	G1J9UYM08HhN1S78+6ZlZPsc3d2V9K3r6Twi3HqXEmfYKvvmdsbLU1Orw3cFmLg==
X-Google-Smtp-Source: AGHT+IEOwMk3vapdbNHpELN0oZ6s3oro3YnZRn8GCOYxBikHFeMCXOFfPD4cUTzyUloMpcTHt84sQUv4Gf+wLfw8W4o=
X-Received: by 2002:a05:6000:23c5:b0:382:3e51:4b1d with SMTP id
 ffacd0b85a97d-38260b59530mr6868816f8f.20.1732526061276; Mon, 25 Nov 2024
 01:14:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123222849.350287-1-ojeda@kernel.org> <20241123222849.350287-2-ojeda@kernel.org>
In-Reply-To: <20241123222849.350287-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:14:09 +0100
Message-ID: <CAH5fLggK_uL0izyDogqdxqp+UEiDbMW555zgS6jk=gw3n07f6A@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: kernel: move `build_error` hidden function to
 prevent mistakes
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 11:29=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Users were using the hidden exported `kernel::build_error` function
> instead of the intended `kernel::build_error!` macro, e.g. see the
> previous commit.
>
> To force to use the macro, move it into the `build_assert` module,
> thus making it a compilation error and avoiding a collision in the same
> "namespace". Using the function now would require typing the module name
> (which is hidden), not just a single character.
>
> Now attempting to use the function will trigger this error with the
> right suggestion by the compiler:
>
>       error[E0423]: expected function, found macro `kernel::build_error`
>       --> samples/rust/rust_minimal.rs:29:9
>          |
>       29 |         kernel::build_error();
>          |         ^^^^^^^^^^^^^^^^^^^ not a function
>          |
>       help: use `!` to invoke the macro
>          |
>       29 |         kernel::build_error!();
>          |                            +
>
> An alternative would be using an alias, but it would be more complex
> and moving it into the module seems right since it belongs there and
> reduces the amount of code at the crate root.
>
> Keep the `#[doc(hidden)]` inside `build_assert` in case the module is
> not hidden in the future.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index bf8d7f841f94..73e33a41ea04 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -32,7 +32,8 @@
>  pub mod alloc;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
> -mod build_assert;
> +#[doc(hidden)]
> +pub mod build_assert;

You could also put #![doc(hidden)] at the top of build_assert.rs to
simplify the lib.rs list. Not sure what is best.

Alice
