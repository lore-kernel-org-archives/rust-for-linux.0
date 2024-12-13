Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22538DE1
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Dec 2024 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734097255; cv=none; b=mnZ/Wk4bov++MTuXI6BDNacvUnaVE0E/P58iIBntlbY0fzE8TkROeIGbCye7aEpFnytnkFK8tn34jm7p8U8WpDWmkPyPhYGJLl0lWN2mXiec5lsWKeVCTMF/u4KlPhaEoLGIOHi86LaHzOh5ujrnS4qBFTxKvvjTg824hdmtNJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734097255; c=relaxed/simple;
	bh=6BOuUIc5npUiQopcZE5cuoM0QROOgdxco8qfJx9ocYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7d+Tg63wLFI1eBWcSQs8RUohbo37g8U0nJTYvpfWQun8DkD+6aebyMDURqKDHfQ0yq2DEwPEB8RIl20hl1GOXscO5ZP2S2F+PuqMQ+5be1EuHBEil7VT9iiI+gQ7bTd+aqkCtGWa7BpBwd7nE8TPU5Lg1hK90OhiG8U7IrtYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pmmdk4ka; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pmmdk4ka"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434f80457a4so17619525e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Dec 2024 05:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734097251; x=1734702051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnJdGj8IRCH6wN+1P7eGmBTzbr2q1/CwaJHQOUXIuXA=;
        b=pmmdk4ka+e4nXjCqO8SbRIe1BwFWdDNe+xEQ85WEazISXkdMv8cEFm1hE1sSqmhHfx
         dvk1V0wRyihrCU3p2pH4q7Z3ZcgmypsNtfYUsBNc9569yQOrN03+GUld8IjcM1/Zjexe
         JcHqrhVPKT+4bkbSOynlnujCxFokOLRW6RzJ9lZOl8bpx9ZjrWsfiIWnCYuG0TK8fmZC
         Ga9puJjzUpvr/YDSa6NU7tMLuP1UabEsQ4m2PJPt3pwxsIWtyybMawT7ISEc8Q1cnaF+
         aN3DimpkrdLOysA+KsTPQiTePfU9unESszhJNkU5esXzMGIPi7A53g4vM64FvZpMZqgw
         kBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734097251; x=1734702051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnJdGj8IRCH6wN+1P7eGmBTzbr2q1/CwaJHQOUXIuXA=;
        b=tWgOG4qxHmMAz+90dxA17Tl1iX5AAA0+9c76JSdebNlk+kuWw4vSye58RdPdqF1A/+
         HU4rYK4dU2Fe1xxyyG5nGHQdhVwUAKDI72BJh9OWcKlJyS5WXn4ifOJQ+hWXpNjRtdWM
         0NZ2AYHIhV3vSwxQLh2jougBZmrvxHteO66cRVoea6VhZ5BjK/wz5YH6nMAywanKqTGm
         bq648MAAjZiczLlJY/uGQgOHMhU5xur+GI8NWboC70eMfsLwXKvGMrllwH0OQ2hny+aZ
         VjNesktM+UKQyEP5EibYOLZCUzrlhQP65hHbky2KdlDjwRhWh5dsMAYdGoc+ERnbOXQN
         NJGw==
X-Forwarded-Encrypted: i=1; AJvYcCUgO7dTeHr+Q35eVgz+yVIuP/Ze/87nAt/VtOIz7N3W/8JfKv6RnTNGtX5OxaBLn+UFFJyVKCta//mgcPdOkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykTccZ9MsLLsgxg8UOmH61EauCHzs3DhsenyWV7oGfcFxzAiWc
	HnCDrSk2MVoxGVE7D/dmMJ5nXNj4y/fguYI0iCSeeAQSZJHqlIxF9sH6YtpeFyo6K4Vez7dvb4q
	bPqshx6PCalIra4DYyCPrg79puwdi3cXrHx0Z
X-Gm-Gg: ASbGncuzJHwzUrMzRll538WPS2p2PVb+TZDRNRbFc4kDWA+mSjSEpouR9SnTECu+rA0
	cx+VrV1FoxSjIUXudMH8aLhDbxHtK9UObu2FswOk=
X-Google-Smtp-Source: AGHT+IFpwXyaMsDUR1OnzTsQN9vE6i77r98xrJD0Rz0VjFRoXav5Ec9rNnu/HRcQPgMHzFvhoDZVZBy4mlujW19ixCA=
X-Received: by 2002:a05:6000:1543:b0:386:2e8c:e26d with SMTP id
 ffacd0b85a97d-3878840808emr6014625f8f.0.1734097251425; Fri, 13 Dec 2024
 05:40:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-rust-xarray-bindings-v12-0-59ab9b1f4d2e@gmail.com> <20241212-rust-xarray-bindings-v12-2-59ab9b1f4d2e@gmail.com>
In-Reply-To: <20241212-rust-xarray-bindings-v12-2-59ab9b1f4d2e@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Dec 2024 14:40:39 +0100
Message-ID: <CAH5fLggwK0LXAsBnP3FtFHCnEzzBNNZfsCy3iJ6w=nT07CHgVg@mail.gmail.com>
Subject: Re: [PATCH v12 2/2] rust: xarray: Add an abstraction for XArray
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 9:31=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> `XArray` is an efficient sparse array of pointers. Add a Rust
> abstraction for this type.
>
> This implementation bounds the element type on `ForeignOwnable` and
> requires explicit locking for all operations. Future work may leverage
> RCU to enable lockless operation.
>
> Inspired-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Inspired-by: Asahi Lina <lina@asahilina.net>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

This code looks okay to me, though I have one comment below:

> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        iter::once(unsafe {
> +            bindings::xa_find(self.xa.get(), &mut index, MAX, bindings::=
XA_PRESENT)
> +        })
> +        .chain(iter::from_fn(move || {
> +            // SAFETY: `self.xa` is always valid by the type invariant.
> +            Some(unsafe {
> +                bindings::xa_find_after(self.xa.get(), &mut index, MAX, =
bindings::XA_PRESENT)
> +            })
> +        }))
> +        .map_while(|ptr| NonNull::new(ptr.cast()))

> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        (unsafe { bindings::xa_trylock(self.xa.get()) } !=3D 0).then(|| =
Guard {
> +            xa: self,
> +            _not_send: NotThreadSafe,
> +        })

This coding style is pretty far in the functional programming camp
compared to the rest of Rust code in the kernel. I tend to stick with
a more imperative style to be more familiar to C folks.

Alice
