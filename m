Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6AD28684
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733479757; cv=none; b=lr0Kyzk6OkCWdv/Q1SbgJO/kOQu2mJqsynAQ9kMwcRt1qDY07KRHv6EDJqOh+GHthvRzz2OYmyr0E3KwJurGVdk5xHuzr6jKNAifgQYnFHHGO2rUhbgloyU6oK+8U9ym2bbNR48U+YYMGzmDen/pp22tf03Jnc3dD9RBX3HScqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733479757; c=relaxed/simple;
	bh=dbjNnIUl/HpadeGvy1beqAbjGj9vybGE2azXfD93FHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6cYIvzZQfFGDmrU9BL/FAThB7dEONMGlG/lIcCwCM9zVYkC1DoLLoBm7zMQNuFQwWByakRbwb0w5XXDYoMrROKXamhC8VOPM71u3y+O3sbG3je+SK8VziBU2DwTJpPl1yN36M+xA7/ftOcEUXrWNoq40RKHHJjqPM3gemFKC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K+Mxb61L; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K+Mxb61L"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385d7f19f20so874546f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 02:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733479754; x=1734084554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbjNnIUl/HpadeGvy1beqAbjGj9vybGE2azXfD93FHI=;
        b=K+Mxb61LZ+GHu4rVMOA5TNlGyHqosaDf4aht4cTIGahiOT9U5VMznGgzDg1uajbTfO
         HFEpovw5gxcEG6CpH0LSuFm4+tVR+isvcxnlyWpeEnCJC7l3Z1jIIFR6tg1uh+rTJlQv
         141/reFZk062+go8svaqh2gMnY53BqRAEB/Z2vCTYEGf19qAjB7mBGQyeq+9ixBR/R+Y
         xkkAEsGzNx2UGAz8JeeOYpglh/4xxuKRSS0JVM+hdal5L+WUh/7Gzszrd9KkkwHM/58W
         uqPD69JaIVUra8iObU6A0rs6/eYuDYz0MWhrtpihlK3WulgwJ4LmO7QS0NCPfZfxB3jW
         emzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733479754; x=1734084554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbjNnIUl/HpadeGvy1beqAbjGj9vybGE2azXfD93FHI=;
        b=RCCnB/T4wz6TCAW4SyzEpjX8HfsC+to0Vs4L1P38UshA7EDGqvE9RstmLl5/Y8ANp3
         +UIXiQZYUMgeY4HpqbNmpYf9cyTXyNsTnWIaMmPlAja84GE8oqCqGGUl8ZXfP2ivH+ux
         BidoMlOf4XCGzq1lJSvmEn4Bh8lXRyyJWZVsKvkFKxtPgbI3owEOM9MtulLov5AlzKme
         ryoNXOxyfjT/h8IjUOgeisLCPz4cC57G9isLSs7fs7XQv3Rzc4nO8YiBGLrHDafrWovm
         V40SJVuwLcQ1yNeqFjWywB+LkOqFbnrMT7ORyIkaUW27QFJ3jrh+2OaE7aHCJd6U/xUJ
         GhYw==
X-Forwarded-Encrypted: i=1; AJvYcCUtvyWsoNzKheLqHcrmMecFui336d23JV/vNJRJuHLJmDg5FLasJ3G3jL1WYvFRi8h/rUTqepsZf1iFcfP2eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf6oK8JnApwhP+PEynmHnzRA8JQmComDsIij6zLNptP9BPZO+2
	TYtq+PBFldtan0rUVx5X0PIt9Ocjo1b1HEVH8DKocccXCcth0tTrYiwXP8+cWTBbngCBH0yAIyi
	Ug0t/Lm10x2gTGN5BUi5MU6+4Zju7PkbYpqpV
X-Gm-Gg: ASbGnctHvy1SD5/gYjZLgbMoaaHE7ODbpYS6sU/m0n9vjMGmf7n+XuDw8l4/+xiqUU6
	QPkRRKJUkSSWS/lDOxXH4TcPw2YmopXKp
X-Google-Smtp-Source: AGHT+IGYPkXnbramKABZ1thoohFpYm4/5E9Zx2UG+0OFJbRmwyRsafl3BQCHPCJb44E9aXRVEqpYMkvKRnkBRMbUHuA=
X-Received: by 2002:adf:e18a:0:b0:385:e3b8:f331 with SMTP id
 ffacd0b85a97d-3862b355ed9mr1786818f8f.14.1733479754450; Fri, 06 Dec 2024
 02:09:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206090515.752267-1-lee@kernel.org> <20241206090515.752267-5-lee@kernel.org>
 <57c35f7f-76e8-4e21-8288-c66a1b6e7069@app.fastmail.com>
In-Reply-To: <57c35f7f-76e8-4e21-8288-c66a1b6e7069@app.fastmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 11:09:02 +0100
Message-ID: <CAH5fLgjauL-1QbnkVVK34COD_Ch_rcdpUEMKBsC9HB-TKWNscA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] samples: rust: Provide example using the new Rust
 MiscDevice abstraction
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 11:05=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Dec 6, 2024, at 10:05, Lee Jones wrote:
> > This sample driver demonstrates the following basic operations:
> >
> > * Register a Misc Device
> > * Create /dev/rust-misc-device
> > * Provide open call-back for the aforementioned character device
> > * Operate on the character device via a simple ioctl()
> > * Provide close call-back for the character device
> >
> > Signed-off-by: Lee Jones <lee@kernel.org>
>
> Could you include a compat_ioctl() callback in the example?
> I think it would be good to include it as a reminder for
> authors of actual drivers that every driver implementing
> ioctl should also implement compat_ioctl. In C drivers, this
> can usually be done by pointing .compat_ioctl() to the
> generic compat_ptr_ioctl() function, which assumes that 'arg'
> is a pointer disguised as an 'unsigned long'.

The current Rust logic for building the fops table will use
compat_ptr_ioctl() automatically if you specify ioctl() but don't
specify compat_ioctl(), so this already uses compat_ptr_ioctl(). But
maybe that's not what we want?

Alice
