Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4C929617A
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Jul 2025 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895554; cv=none; b=HSkAT9C+W1BRfSwRXeQJEEnWqf5lfr4dQnLCarCUZ0JBmCTLx0Z49BVkTzpIigh/HKUT0Y1IGls6smB/aQRCA5RNvWy0YP5KNtGg5isyyog1MldKDeOhgGlXOvbMVBgN3YACPfEsyIjB+Z/TsXOZEfXzZpywTiKVSpVaaO2RLrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895554; c=relaxed/simple;
	bh=rSVN+37OZ1nxxk0c4XpB4pzH8Koab5xLneDmAWjx9j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQejLkX0DgyPjSEvbIxUGbuDh75EsTYY4VOI3MiKIiM3N/nlxQuj84LCS72PsjMQSB1eRiDsvwZ4bro/UIzqg1/QXnrXjJm8lskIfoxgJ1JgER9Q1RSlBQLL7vkgYazA3GwKGdpDEGbdBSfh7Uih/J2kxH4f+mvPTbDshAq4/J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cgeruFAl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cgeruFAl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso35619675e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Jul 2025 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751895551; x=1752500351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FB3akW2uROgcxiqH7umM6G5loDI0rtj9L6/XnUx0ZE=;
        b=cgeruFAlQMbMVDkMS24jz1ZYefPwkPp5X4CLsNx8OB+O1XKw7vxVEQCTLd6RuJZIaf
         BE1oe2FpKlXvodaQy+g9BzGFuTs/qyAhkWBggTZmttg6ivTqHUvDiCWTIvlIcYz8KDAz
         R9qi7kSQOYF79VdbWE1Bhdi05FfOOoLbwrOmZO9BI7SmHUqTeRBdxdvBE1Fje2YIP5KT
         phFvVHEtPA9Zn4V7DeRbzVXCnSQQqttYgewIM/9EvsY7Xu2ZPB5kEFw0Bb2rW47ZwPkF
         SJogtXtIBVw7dr+kQUIXPahibcKERSrLKz5CqUmYQzREzf3Q/8CscVPcTx/vbjjh+kHl
         7FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895551; x=1752500351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FB3akW2uROgcxiqH7umM6G5loDI0rtj9L6/XnUx0ZE=;
        b=AGtBSlRe6S8atN+RuUpD7MHFdYpQjyCsh/zxSDb86AcrzuDcufOFTnZrNvON9O8cE9
         hFpZvH0h7NAOWEeT4GVTxOXbfjQr50KucXw0z8fzkbZXzlH3dz4srEXV6JjE6MQf7QpV
         KpcPHpBRIBTA2biLsTjsFp9Ui3+/e1B62GSo7cji2WaxtNn/j9gH1TkeFnTDjO7hx9Vz
         1vcG+RjvKvpW3ebEfgAJ8s7O/K3DuLlm/pMt+60ostDJT+jG7aViGWQ8EeKvrH4MSnMb
         EvQzezGn5YHvi4S7bWxEsL/E3kZahGdBrknXV/F+N+aJWYdBjOPPfBlIf7fT6y+aHGNm
         JEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD6tqCdwLO5WrtsB14yyU1Qn3izvLNlsqfEPlfIYMPZKYdsA39I4aDJ9ZY836GtEBKzpkxtAUzgqvjVc8wRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Y73UnmJ9OnDsxdUZJS8MhBIWvfm+tIWEXjqW9ZnOaHuVDQID
	uC9H6iUtZwCfx8z2DuuiMlB7rVQX0yUzRqzXv71gsAgDsp4NIDOLEKtQyj/TOXsy9fKZXrdQna2
	PNumwsoYPLvlSIJFyv6xrc7wrsZp++Nx54ofdJr6y
X-Gm-Gg: ASbGncsxHNYQuNjOUXQ0Mi+U5qVQuEupY2uorBCU97Fk1vCM4/ZdUb07wBEQFUrMxxH
	ySJzZjW9tqZM3OChZMeM3Zrz1B0ljZVjYPEGK+FjHPmxmLRkxZyTLS8AbmIpzdnsQI34tCdEAIZ
	JpIgseA8RlxYva6IIrcJRDSUSZPTn8plX1EDwfQa+ISE3F2hZamOTDzwfxOrvFH2JROCVdcy4ki
	xICi94YVQ==
X-Google-Smtp-Source: AGHT+IEaUZnenYQLKgYyVo3pyfBJMB9pXTg1TRSCW3BPSEm7LC8Pa9g2F7WOtEqZWQqlTsZ6zPdnN8WIllT+obQvkzc=
X-Received: by 2002:a05:600c:8594:b0:450:cf42:7565 with SMTP id
 5b1f17b1804b1-454b51126afmr73979285e9.23.1751895550535; Mon, 07 Jul 2025
 06:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org> <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Jul 2025 15:38:58 +0200
X-Gm-Features: Ac12FXx_fVjA2nF_nJiYWwsUf6PmudMDj0J-14ydNb016WmDb53IS0-a5p2ihe4
Message-ID: <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Introduce the `SetOnce` type, a container that can only be written once.
> The container uses an internal atomic to synchronize writes to the intern=
al
> value.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

LGTM:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +impl<T> Drop for SetOnce<T> {
> +    fn drop(&mut self) {
> +        if self.init.load(Acquire) =3D=3D 2 {
> +            // SAFETY: By the type invariants of `Self`, `self.init =3D=
=3D 2` means that `self.value`
> +            // contains a valid value. We have exclusive access, as we h=
old a `mut` reference to
> +            // `self`.
> +            unsafe { drop_in_place(self.value.get()) };

This load does not need to be Acquire. It can be a Relaxed load or
even an unsynchronized one since the access is exclusive.

Alice
