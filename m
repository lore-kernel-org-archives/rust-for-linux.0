Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90364218589
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873868; cv=none; b=mh+FOkao5TCA7nTMicBEsBvQl9OFN3D0CUFZdUz7jBDGhp0f4gs/RKIjgqmv+5Ko+LFaohL7kUO3bKsOnNBhVDJgovVoDBoJhTBfplvRXyEJrAi2WnU6zmosUmIXq5mFBcfEMjAAH6rQzvR7Xpl7i2o1pibUgQ7Z8Ty1Pn1NZqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873868; c=relaxed/simple;
	bh=tviSTmff1afpb8klQio9z76Bda9qCmF9rlTxmyn4Jzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRK9H2J3u0tFtr+4T1JVxnFwDBoYJTDLRD2gQ2UOIqhQgG9IK49/ixRmgI2QABFZgohCz/OSUyxoNrQELCZ1W4c2B6KKQIDTRIJm8C3T4nfNb+s4rkNCY3tAfis4AO9/fMJa8mcTpvT6sCxDn0STlGw616TmjcMM6uWISLzjV6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=T+nTw/43; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="T+nTw/43"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-702599fa7c5so11140427b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744873864; x=1745478664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpU/EXyyDjiU44teDiS87vVaKo5dkE+fJf9jnkZlWjo=;
        b=T+nTw/43HFZIZKt57M+Hjlid9OF24NBH9sHWIbKjGaBIzmC0zY7hNx95MXClsucq9i
         TIwom5tejHtTiXEetvovKMOBpo4w5NT4B08g6wrWJplzU/Q/EHJQQc+wmZY3Y91+P4qt
         WfBX8ZHOWqar6s7eiNKiHMmRaq2dkKWN3F1fahLDPLLCBf0s1OjJUY3AjlNibCLHT6iS
         qPKMjJrVHxSP9odM5G47d2gqOW0p9IHl/jHRkHxoDmXWo9QE6VabwQfV9F94vAWxmUXQ
         Rdg3SJnYUW1grlUF1CBjfbdf9Bha7+Zc7d+3CUw30a/f08WZa60XISRK278wIGyaW+qt
         JuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744873864; x=1745478664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpU/EXyyDjiU44teDiS87vVaKo5dkE+fJf9jnkZlWjo=;
        b=TAWhCxmMSnHUsWP44tmcbf7jUxbkmSJZVIBZmi42oFZ5UlMiWd0knZphCVFkthdAzm
         tULva8i/hPouDiBNW8cfo+0Fbm4fSt6ZyejpR7mA8qKfgAk1k6ilGqF6RRiJgN2O9B75
         D+Cvj1wqi8Q8bCECqvI/DNle6m4R/B1ZAW4PAXksVDlwfx7wsqCyHtZHTIuTypExG5o2
         JbJPq9N9UTcEYSm5xuF2284nb63Aa+LX3F1XygyrLkWKUOKXyDKuHRaN+OU3G7hwlgZZ
         aawxu+8TCpGElzUUKYej7ODAcc45kFzSXu8XlvGPYxwnqh0e5iZLehr8aZt3JijEYOsw
         Wvhw==
X-Forwarded-Encrypted: i=1; AJvYcCWXi08NeAjUlTfM/WiObiVKYHHRLo7x0BwdOtmGSodxQCBrdFI1StXrbSX+60ljr8JRLBmS4YYIGYV2/W0Hew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxww5h+rWMfZ1fv+BFS4cEvRwiEqOx+TE6Dvaoy9VS4zf/y/U/s
	VyZD3tbR4sQ796JtKLKUDAB36Hgh/CsJ7zFS0ND6dVqGSaEYoe9Bxvw9H9U+rA8WiQ8FAXkyyqg
	3yiYoLeZJtMUteWfR2eKOmubtscDk9tTuZZfx9g==
X-Gm-Gg: ASbGncupM3qqUyIq5g9SSOpoAocMZTJMkUF2aGnjkGPCTKUVL01gmxthXyht6YJfDfo
	23A9OIYLiLljWIdI+lMC6XrqmJ/3IvOKC30no5gtrMTej97mt/GkILn+tT3sy9UASt4nsXZs9ic
	LFNHkI9GxRKRcZXRQm9n1JfQ==
X-Google-Smtp-Source: AGHT+IEi920jFsOkCXOITeOeuLFT1lqte36DnI8bIahvpncns/FQ54QuvgAzwiPwHvxcppMuHzxPPOSb6zlSksMEqeA=
X-Received: by 2002:a05:6902:2589:b0:e60:8b26:8c34 with SMTP id
 3f1490d57ef6-e7282a75222mr2272949276.22.1744873864423; Thu, 17 Apr 2025
 00:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-6-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-6-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:10:53 -0500
X-Gm-Features: ATxdqUE-Klo-KfOapj4E4gV65oOXgdtjTVe08rFy0gCvLEWTuaEpYGH9CSdhcus
Message-ID: <CALNs47uO9ST7Ev3yG3LPNeJ=0Mdq9pQwO2Jcy624__FpnU=NHA@mail.gmail.com>
Subject: Re: [PATCH v5 06/13] scripts: generate_rust_analyzer.py: add type hints
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Python type hints allow static analysis tools like mypy to detect type
> errors during development, improving the developer experience.
>
> Python type hints have been present in the kernel since 2019 at the
> latest; see commit 6ebf5866f2e8 ("kunit: tool: add Python wrappers for
> running KUnit tests").
>
> Add a subclass of `argparse.Namespace` to get type checking on the CLI
> arguments. Move parsing of `cfg` out of `generate_crates` to reduce the
> number of variables in scope with `cfg` in their name. Use a defaultdict
> to avoid `.get("key", [])`.
>
> Run `mypy --strict scripts/generate_rust_analyzer.py --python-version
> 3.8` to verify. Note that `mypy` no longer supports python < 3.8.
>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 166 +++++++++++++++++++++++++-------=
------
>  1 file changed, 109 insertions(+), 57 deletions(-)

> +                {
> +                    crate: vals.lstrip("--cfg").split()
> +                    for crate, vals in map(lambda cfg: cfg.split("=3D", =
1), args.cfgs)
> +                },

Tiny nit only if you wind up touching this again, generators or
comprehension are a bit more canonical than `map` and `filter`

     for crate, _, vals in (cfg.partition("=3D") for cfg in args.cfg)

The rest looks good to me, with or without that

Reviewed-by: Trevor Gross <tmgross@umich.edu>
