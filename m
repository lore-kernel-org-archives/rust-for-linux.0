Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBD02C87C
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198231; cv=none; b=h/HnPnUTuL/3pRsJz+l3KJOXbkZrST+Jep+glsVhRq3aLY0bes5vxpgXLKo/mgQ4gZaLdoe5LW3Zf8Lz2SPBOEnqulZ86D03tQaHUCvnVe3hG+k93DfQcotLMnNJZbSLj/rUDNoSkumNmRut5Cd0KgOZHUPczuKSB7XaXSr97lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198231; c=relaxed/simple;
	bh=a55aAxkPuy9VVWAPVnECXqpexCb+FMCFcssmQ8ptOdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TA6S9M5l28hUmSdd9SC+8w8cXvHPMQR38Feo5nTchZJ/9FFMocEOwlctbTzvHh6vCsf77oIw77z3GRTf3LEbyFzEX1+FsYu7wPgewMO+kdQ3sasKVGqGKb73MgD/FDVRM/dKf4g+cCFm3L9+RvfkeS10tHpImxmrR7EuNSfAIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HuR4+yd4; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HuR4+yd4"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7fc2827c872so1058905241.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 02:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716198228; x=1716803028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a55aAxkPuy9VVWAPVnECXqpexCb+FMCFcssmQ8ptOdc=;
        b=HuR4+yd4bBFdmIw7+KiY6lpKaybGYB5sQEPhn67YoQqDttqetTNs2IeZ20Mn7HMdlD
         LuSL9z3vKil3RSvddsXdcP6Nv/8J5XmOwcX5HR7AF0e/uS62k7FXIO1d7lsNOkV8HB9b
         haDtkzZ0ugSJGtObX4MU2q36slY4QzToBu3tg/b8RW6Zl0ax19UMPYicvgeOGtK813Ao
         FDVUZ/RpSwSXEZ4EtQLuTdH0AxZ0QjIxQTRAr1dQv9je0/KpEaxyTSbKgeRNPw6BNF4J
         HulLxBsekHaiXbSq52B0c+5qMQEh9lJErDIVWhv9s3MxZJ65rTGNjGgX/rkoDjXXSaK4
         XqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716198228; x=1716803028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a55aAxkPuy9VVWAPVnECXqpexCb+FMCFcssmQ8ptOdc=;
        b=Y+v6tzijWeSPzhEHDNVoA0TSRwYnPzkE3bHVSOUH+dgXv7VgP21WoyE+fH7B/2FJj5
         ICuGYr9I7KVGGPaQnAsP6fy5OWrimDIf3xPqW/XtvTOZMYQBgH4qriqNZzRogWJ+IYxT
         0D4wUaAf2nd6f1/GZLou80zUudI4QDRHgHyjFDRuBVyLXIEiCS9mc7qjsLyiqTwS7Xzv
         jmIvVqU9D/65+ENxBCEa6LLzL0LwtAzSmgDeDVKq8Q0eg8p7pd32eVRP/ndf6dU0VOd8
         8dliT7cDZv4bP3yqn+WmYm9T8omMLuel8LN9wvbaONmTUzlIBb+xB9MjchiDxRjOiP4K
         oE0A==
X-Forwarded-Encrypted: i=1; AJvYcCW3dgUkCVAE6tLjLeVkazlGXrWxrxd9pq7x9b/oydOhiHK2DPJfyzV32nVANleyv+DdD0MFu/AF9CempabZ3W+3NnDbghoSn06LBsr1iGo=
X-Gm-Message-State: AOJu0YxdgwGY3mhjZ6NWmT0Vg4kkuOyVr2a593jNe0q7ElYz7Kjxw7Ma
	CUtKlOVfr3UgJe3oZWPA6eC+PQwUISFhS2srG+5wiSZIeJ71otDdb1RZq4QIU/IbrF0G3scf7qE
	7fk6B8VwJEmEsO4WWY1deJAwlv5eI7Cjki+zo
X-Google-Smtp-Source: AGHT+IEYsiVQ/f6j1ZyTO7lXzbXIXBXS17hKFjw1cVaQYNkhH1gui4IfXyiE6NxbpusBzsiFYL/Tf3yT2rLfKLe14bM=
X-Received: by 2002:a05:6102:148e:b0:486:11ff:65aa with SMTP id
 ada2fe7eead31-48611ff67bdmr12548622137.2.1716198227732; Mon, 20 May 2024
 02:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-2-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 May 2024 11:43:36 +0200
Message-ID: <CAH5fLgg=dGmuY43B52gvgJ3S3qphcYYVB3SycuzZHNB6Rcpb-A@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 11:12=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Make all Rust code (i.e. not just kernel code) respect `CONFIG_WERROR`,
> so that we keep everything warning clean.
>
> In particular, this affects targets in `rust/` (`RUSTDOC H`, `RUSTC TL`,
> `RUSTDOC T`, `RUSTC T` and `RUSTC P`), plus host programs and any others
> we may add later.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
