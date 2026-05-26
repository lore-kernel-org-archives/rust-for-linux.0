Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDAC3F8ED8
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802618; cv=pass; b=fhXx9hw5PaycaXgHOfDwpMmd5T06udXU6MpR+XquwHxrUxCkYZpsLRjKrWObKCMcowcOrLZDcHMpj7Z/nbrbNcqlZIg/0n9jPCXc5bMnKF992H6g7IXnMe5wW3V8FahGXXWSb+2hWOAbAPlCqCa6TNrxgwloi/r0pNUNZ6pCJnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802618; c=relaxed/simple;
	bh=sULUfGeF+l5YO4EnQHKXEEWQWgOtsvgIpFCTXl75hFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AfdzR9H0fLAgDOfxws5myCTujYO1jAq+DrUSubrcH/2ypzfwW/Mm5pGuTssJoorxbNS9oSSH91FQRXMadpjhESSUK6IDKzBjitzZ2rzwqhwGtCnawbfCThFpPI6rsMwX30rcYM9u7XoS7A71bbJeocjcvd6YBIGb1H2qVPblYZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D7Wb14VS; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D7Wb14VS"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49040362e4aso50281045e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 06:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779802615; cv=none;
        d=google.com; s=arc-20240605;
        b=UM7yQ+FGf3ihsu5YOEurdHx6QY7BYDIisxYv3yiztjzgDwszSjeH7TeDAxVGlM1fbq
         gtn8I0ySbedpoqNHW6D0jLg+uOVYh4dJqEA/fFfx9Xp+WFZsTWPP1T+usQxoydHpoK+R
         YlRlVTsTTciyxvF/M8ig7v6wayzyzdQeISfN83T/bjWRrMUMVSfVGiTNKZ0Cjj/opC04
         Z5B8Xz4zJ89IUPuwjGEVwrYkuD0J0z31fWiy/K+CDUmKXG83PTETb9gV0obp1z+Nb5uo
         B7XvBerOI1qdqvXBnl/RAfG6FAbAH4ooVc+yo5JIQpE4dCLvJELFw/LW2JQt+z1TrDSY
         Vrxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=05R51uw/33lQXIsKoXsJ9D462xOilqztl8pxbNtjUC4=;
        fh=EJRKKEuMuCyO3Ve8bpX8fZ9xPI5tm3wBhVervGL42Fg=;
        b=fDAvNe1wWiLyM0bMYRviTrSQnYAC3t15IUhhG7dJ1pl/mOQBMKQtyMo3Ef4wrKxxky
         bqYCAYG6QLDcSqKX4aLUFSX5DS4rQGkEwL9q/ZIK9vkjzq7Jhb/iPNdVSaqe1DSo1dTU
         VormnHzQCu4PCG5zt+wgQuXUXuuBXdRrhawwxIWY7OsUFf2EW0KSVilp/UftDErwYEWK
         q10Zy6F9S/lfFYSUcB59hhEtBqk1GYyJcpg21W/BsI3dcOgmpLLG0mAjtl83KT9L1ifO
         lknrrqerMCF3AN3izvJuhC6GHt9JXjpn7dfRfPW7UkcCjVg9H/Nwx7ky4Ldz3bmqDfAK
         4Yrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779802615; x=1780407415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05R51uw/33lQXIsKoXsJ9D462xOilqztl8pxbNtjUC4=;
        b=D7Wb14VS8/XGgU6Q3iyNGJcS+H/FMHPdumXZi7Y8157aSTVg/JTZQboYPxq6C6krfu
         Ib0QZf+hGvDJGN24NfLI3g3u7KPHG3BV6mfYpRGuUkB0YbGP5B4TsGXGPVwvebE7b99N
         onvnd5Av17AhzU+vK+FRkkdDOyQII0qDlM0puhoePuPWUeyBc5zEEUfskF5Xoa0jOL93
         0986+ALzdFcAFZHzKFGGAWvAN0eUseO32ro1ST4bhzaLjhC78mqtj6Yo8REs/D2IVvGm
         ZIwXXUYt1O4NTuejavBcGoGIbYQh6anaC65QBO6kNOTmN4DMHgkFLnN6dTJJ0DCD88eJ
         oJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802615; x=1780407415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05R51uw/33lQXIsKoXsJ9D462xOilqztl8pxbNtjUC4=;
        b=US4s0zyWXrdX5OtCgEzymXFWdvHI7hji+bPeMx83fVSpbnW9amZRLie3GyNtTomqkZ
         wGJg09lZwkQbe08tDVPhJqD8V6emwJTnkFHOVpq4nfrTgJ6BCQX39N6MhlJ6DfvltGw4
         u0MNCzR477OQutHyRe8mzrNxNZv6HjsNImgZCiUGTwTkpR2Yv8u/z/7xWPv4KZkkQsRc
         0OHRRxLfVcdBiffoB+4oj0PXzOrzmMAbhhGHseBpEMmAfTPVSlWDRclM3yebBn4c/KMY
         7e48Mvx08EedxHHOgVbo00tA9Wn+UCs5vhmjncI6myM9ktRQhesGg7FcTQYXCwIPXZsM
         RpmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uXR8x7ODebgjuN3auhX5BlF8sAFtPE63jBnAXHyqr2IKTMHnganZAM3hsagcy/7eWQutxySz9rDqbhXVXzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd11AypYIUoQ3q3gwh8+DGW5nYGDSjvO15rkt/FRhxzJJJp5M5
	P7yF83frYnLKNnwWhYns71ICvOW/z5d90nOZDk8Nzwi1DaOVXb+Rs3lw46e1I4KjE4OR4rq0x6J
	PGLihX/qb4tnrtlc9MozOPyY5JuMjFB0o7DEl4faX
X-Gm-Gg: Acq92OGaRUZGDylwI6plGANOLMMLnr2nGlLcFvgyuNQ5ZPUJerC0mYe3hA8TCOXRIBL
	acM8zotzwtXbRDgCaIHzIFYod6yGdyTPHlr4dFhnw2AEUFNdICEie+FQe2uucxOyfPAw7a1IPeP
	KZxQ+NlFluPxX1mwRKWNaPR1bljNDtH1EhC5gZI39mAVl63PfhJULdiU+yvU+iZmYZgGtutFbDr
	8M7mtiuemHN6D9JT2gHG0nqBa9LjHy3Nr2qeHdHSVWEq8nRH1Eqz9nXUI3B/Y+oi8lI1MLy7oXF
	rg7du3+qxinxX0TnUoM7oFuWBcGbqcq3N506cIB591NJh2NV
X-Received: by 2002:a05:600c:4ecb:b0:490:44eb:c1dd with SMTP id
 5b1f17b1804b1-49044ebc2camr317566275e9.29.1779802614120; Tue, 26 May 2026
 06:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
 <ahWTBbLpYEDlPTr2@google.com> <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
In-Reply-To: <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 26 May 2026 15:36:39 +0200
X-Gm-Features: AVHnY4IEOVzoq1nyuNvFrb9dr8-BZP7TtvJUMmghRPpEYSoGbEr9u5GE8jfhIAk
Message-ID: <CAH5fLggtyjE8utcGfESCGKPTyqpdbPsKCvpJX6x1yBKUYywW5A@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 3:34=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> On Tue, May 26, 2026 at 8:33=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > On Fri, May 22, 2026 at 07:12:47PM +0200, Tamir Duberstein wrote:
> > > `BinderTransactionData` is a transparent wrapper around
> > > `binder_transaction_data`. Use a transmute to view the transaction da=
ta in
> > > `BinderTransactionDataSecctx` through that wrapper, matching the safe=
ty
> > > argument at the conversion site and avoiding the raw pointer round tr=
ip.
> > >
> > > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> >
> > I think it is an anti-pattern to transmute references. Please keep the
> > raw pointer cast.
>
> Can you please elaborate? We already have this for kernel::io::Mmio:
>
> ```
>   rust/kernel/io.rs-    pub fn relaxed(&self) -> &RelaxedMmio<SIZE> {
>   rust/kernel/io.rs-        // SAFETY: `RelaxedMmio` is
> `#[repr(transparent)]` over `Mmio`, so `Mmio<SIZE>` and
>   rust/kernel/io.rs-        // `RelaxedMmio<SIZE>` have identical layout.
>   rust/kernel/io.rs:        unsafe { core::mem::transmute(self) }
>   rust/kernel/io.rs-    }
> ```

I also think that code is using the same anti-pattern.


Alice
