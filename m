Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF115747D
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Dec 2024 00:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480168; cv=none; b=DJ+mbI0CaD5oxgGacwzrD3bcsf7OcbGHgEas/gxF8EJKhx2JQDu6AlHky7h4F0AOfuZzSU6NFNtY5TpUMYZBaFRaQQ2IXm11ATlCv5FA2kFf2jYUFH9HtPVneGiI6sLMeYudDUeRjG1RrOJua11zWTft2OYo/69fpjHkfHTT5eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480168; c=relaxed/simple;
	bh=8NDviu1sMrc1V2GfjBsSKjfqAP7ddtOkDxt/rULF62o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsG+I92WFTc6fTVIQkKY/0d4I4Tlnt7LLIJrc778GF+zT75CRXBCU2pjiUfsUl2XBWexOiM8ugpTHCs5qZMQcut46tnQlOt1pFgRH5SF1F5NmM8CKGmagS7uzZllD9Xa5rMibYddaPxZFXXpgkUk6RWPIsT0pBFgY6drN7USbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQRw+jnx; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQRw+jnx"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7feffc649efso593127a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 16:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480166; x=1735084966; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie72mkgyyPrBJisrgOj2Swqc5YCbWsDiGvX/BVu6ml8=;
        b=NQRw+jnxjwdBqxUXM6LG/R3P5t6JrfeP7cyyZZIZlw6aJIEOQketIGq2oGyPGVhRf8
         X9mfMQ1nBQz/URl8UkhCcoOjWxNDVT8cLpZ7dkoYak0lPV7MseuWjEjlcWFwah+Bj/Qy
         qJcYEjeXqod78VPAFjUtJxC0sR7p8ZmhNOy1Bw9ltYPsybKG2paQW+/V2V8rH6Rs0uiq
         JPYc+5OReTRIJqLBnHPTwz2oEYVDQsfMsqpre35WLOBWQtU+8jzBNcs6xFcXpw4uA+VT
         8vxXVLeBI1wYsOkAxdrvcEmWxpdoSabBFV9RENe8ToZQo+kadfv+DKauNrEUQ/xkKmP8
         cJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480166; x=1735084966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ie72mkgyyPrBJisrgOj2Swqc5YCbWsDiGvX/BVu6ml8=;
        b=p1i8cyEkZldRChGK65O1dhWHGBmHzzlQlbxNmJirwcPmnNuKaTMcgjxCjGfI4z1xAZ
         Zf2fh7MxuAs8VMVNsr4HDdMgug9J/OJtdbO1reYvqHdvCBV283h1lYYuYcJSVsHfk/f3
         Hmqvq9jp0dvXr/L48ezb6GdI8tgTwiKheqGzsodSSVqXOxiuXqdZ6p8MHTa9Cf3mYVnj
         QvIGcs6yf+w24rmuAzh/HhyGf6wSnnXRDSIxcZ0f06E7JpkehZ+2dMocriUqtFonwUc8
         hzJS2n+KLaM7fET5G1t+eBInMe1NxQwnuskgKZOebRAKt3bTcZxKf3msnz3vOGX4C+Zh
         5t1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEYDhUHPXux2GNexdSKENUJE29EjJal9KaYMjtPhSQYKNFpOYGSfi3it0nyVShA4y5CXOr24BJnCKsBBEcnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZqT1+1XBAi2SSUw+yLDYSoeQIahEW7I4WS0SeEI2ARepq2qC
	0RkUHZKmLqkHQE92VUHko4LsaO4BijFhsV/GYjZ2OWrdPiSvo2Ri/3jg2HOGgzxZ5BKCi0p0gf2
	UhK8wDIddJRNoKa/Zl7FHdWJrvvQ=
X-Gm-Gg: ASbGncuuNvUSVLU5Mfkdd+QEqEOlRDIfHMXZnTQfaOpW5mVxYPpeL+P/z5Y6bPWplPh
	EHfaR7UY6PIF1jwk4wVSbfSs0XfJ2bFHlDkzxxw==
X-Google-Smtp-Source: AGHT+IED32ZmaQNJdZAgUcbRj6i+4GswrxDaoGs817SuxjOS3+8FNoXP2oVn8K4m2EC0CrP4u2/bfUGTNiunRU8mBa0=
X-Received: by 2002:a17:902:c94f:b0:215:a57e:88d6 with SMTP id
 d9443c01a7336-218d6c532c1mr3951765ad.0.1734480165874; Tue, 17 Dec 2024
 16:02:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_2AD25C6A6898D3A598CBA54BB6AF59BB900A@qq.com>
In-Reply-To: <tencent_2AD25C6A6898D3A598CBA54BB6AF59BB900A@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Dec 2024 01:02:33 +0100
Message-ID: <CANiq72=vHnp6E949LbZo0sm2J77m9TNo2CZSDnk0=wJQKBKffw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: Implement Display for Box
To: Guangbo Cui <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 2:49=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wro=
te:
>
> Currently `impl Display` is missing for `Box<T, A>`, as a result,
> things like using `Box<..>` directly as an operand in `pr_info!()`
> are impossible, which is less ergonomic compared to `Box` in Rust
> std.
>
> Therefore add `impl Display` for `Box`.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1126
> Signed-off-by: Guangbo Cui <2407018371@qq.com>

Applied series to `rust-next` -- thanks everyone!

    [ Reworded title. - Miguel ]

    [ Reworded title. - Miguel ]

Cheers,
Miguel
