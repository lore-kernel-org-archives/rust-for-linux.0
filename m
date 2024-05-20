Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BFA3FB88
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198272; cv=none; b=PbeRiwXYEMr3z7gjNwIMxa4sKMxa+p5skGqIRmuyGRr2//u3igDGMSSffHmT13Ch2Jy5am7ro4080sPI6rN8GiiYmmmPtvQiCu0bxZF5mMl1dioaOdBZxy7mjNBxs4661lwwCBujW8ihgz6hzjSWJEL5f6l/LIJUw7UG3+AC5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198272; c=relaxed/simple;
	bh=9SQyahqkNTCE11p+YPTRBzNEGuv1mZ4mTj9rW50lNSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otCd2Fyo9c0Gun9jNIhUUARyNspTtxnHBiNLEq4Gqciw2VKtgt7ku6ApOoiET7i5MKP66wkbq1GHchwZYwww73IPJ05m1SPohdbB3z+KSNY4P0TOJferYxDQKPM8umiyisVKSHZNVuVU9pCvknFZze2+bZH/dqENWyiGyDYQm0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pEgDGZEZ; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pEgDGZEZ"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7f82c932858so1284128241.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 02:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716198268; x=1716803068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SQyahqkNTCE11p+YPTRBzNEGuv1mZ4mTj9rW50lNSY=;
        b=pEgDGZEZpLpBHz7CSyPYgcd+CG725OdRFCWH4zXcJVDKWNgSZ3dQlrn41HkG0A5toU
         LtmjH99x28Q0twiRNs2GV1ZgmrkMd5NqHjc/Uej531pC8AmEOdCERiC7ILnua5IT35G4
         45lnudKLbGlIdF5ih6IsndaklMdoBDatBEAxt8HW8vZzANXc6uOm5vng+GX5ebnDPNZ8
         jCuS4Il9uNLjhqJtJTINCaJ9K2v0Ti3IYTehfLOazQiciAhfACmC8Y5VBKr9Ul6nkdFl
         bWnOs23JvJ4QaVrU6m8UESXzgs/fPEjrIo//lWCk0TpJJ1vMbP5SyI5ox0JyUItG4TdD
         KfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716198268; x=1716803068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SQyahqkNTCE11p+YPTRBzNEGuv1mZ4mTj9rW50lNSY=;
        b=aYIdhGKs65Ic/i+RG6uxxbpmHo7B8iYsgQ3CLOcdQN3zP3HZpMzF17eTR2Q+lyasgG
         9x5jeeTdoy6uM5ljUdIjTsETcAzGQ4INwiNzTUzNTtELo1u+IYGwr2cJf3f4spr7sJAV
         HIv07xrfrwAJyZ+2KwU/AqlxE3z0wh52P3ogyHWdQxTjGNUsiBxuwXV1bIou0tGpYw/s
         MqCrgvQwvb134Re5FwAR0562O95W16HVWwnWX0YgVu0jF72o8+ngVZO4JYn+Giie6xlJ
         1V5XInhU5Iy969zTyWVwurQczGWSuuncVriQZ5GJaS1X7nzzpb8Ak6vHGbT0IikYPTiZ
         a8MA==
X-Forwarded-Encrypted: i=1; AJvYcCWVqdeSmZexFg7R+Cu8fgVnSBW4wcW9PAcR7y9d0RlhyDBH9Mw4tEsLUNfNoweGEwUhk7mxVHNveeUWh0DWfD60f+81fwZUmMU9CILqn+A=
X-Gm-Message-State: AOJu0Ywa0EQzuOll2Jv62sL67XpXAJgVcFTcbhI/odZ3bGLo2+ckhaHT
	U/mFVW1K9SJlfr1Br+gfNLMN35LMwEfvWkYRuXw1kW0kW1ZnRXnAHj3fzODXYmSNe7IzIJUVcmU
	L5Tz/bk2cmo2jnpt1B0CkeHYalbkdTZay0XVf
X-Google-Smtp-Source: AGHT+IHHXvr+M+34UawNAnnzqJygOBNlCpPhzSst4E67c+2hXFzQu8PTkPa+2afVxf4csgSkRirTEdacdSn42ZMv2C8=
X-Received: by 2002:a05:6102:d89:b0:47e:a214:8d02 with SMTP id
 ada2fe7eead31-48077cc45d3mr28209812137.0.1716198268543; Mon, 20 May 2024
 02:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-3-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-3-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 May 2024 11:44:16 +0200
Message-ID: <CAH5fLgij=Wv0Fbd87piUrP9n-riQxM-4BUo26XDgKxuZEQEixQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: rust: support `W=e` for Rust
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

On Sun, May 19, 2024 at 11:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> With `W=3De`, kernel C targets error out on warnings.
>
> Add support for the same feature for Rust code, but take the opportunity
> to apply it for every Rust target (i.e. not just kernel code), so that
> it behaves like having set `CONFIG_WERROR`.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
