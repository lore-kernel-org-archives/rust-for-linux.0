Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D12425777
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731340540; cv=none; b=RRBtHI94hYcjjI0XX5npbPACv87Yz8gRi+ohR3QnWvPwF3NDbhkADUduwHLBt6kcXbgFsMUp70l2pzVpeq3FTNzAfuTuPDDSUtoaf61btEPWeNKSx9vyz1lQQwBy10EEobgFAFw5MbUjH9e9LROCiNwXlHZDM/BqBRud8OA3rUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731340540; c=relaxed/simple;
	bh=W/VFz5Yo6VK3dmt/YM0Fcp78e5JXY/Twhc0ShEwBMeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kN6YvdKRd64qba74j2L9AQBXTkISGeqk0eqFDOEfbnvp7688fi1/AeaDhCGIgFYLQqNpsoShqQs0XGJFwKEqITLTnyaZs52bsyIUlUUNfEA6pXLwCg/vWvbXcXWsccSPD5qxY7geHxdo1gmFuayG13og97iYvnG/FmuN/TjGWAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lj475Egf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lj475Egf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43193678216so44564135e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 07:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731340538; x=1731945338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/VFz5Yo6VK3dmt/YM0Fcp78e5JXY/Twhc0ShEwBMeQ=;
        b=lj475EgfFC5Qb111yx3I2Dg1W7C0piG+3lnD3IQV9UwXKYzM+0EqOXziBSptxLA4NU
         U5IIsaewYlSEpVkMtHeO/uTreZiR97oOK1/lN8G2qjJyC7fRI7Yw/C7C9WA8B57DfB9f
         xdA89HrvjKOvQ1zcpeOILTWicvU0Yv3wtnIP4PttAsBNRqjeJAIRwtd26z17UhRmrXzv
         zFwsw+3Wf4PtKOQxraqHw2oC8K5ZE4GzQpusx4ZSy9y/2nQ3u5P8HgM5VUIR6Kr0t125
         HJy8CGAOMdqowU3UMKGyjUe84QcgoDfzCvmF03JWHE4s5qZKP9o+UgGsRWheHQMkl3SI
         3XlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731340538; x=1731945338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/VFz5Yo6VK3dmt/YM0Fcp78e5JXY/Twhc0ShEwBMeQ=;
        b=Ezb4B80Ht8U8SlduFjHl8OjLi3tkyy2xEebk5926P+jNman9PQSdLqNGquigRGlzsR
         EO1DDsA7fpFHRv0omN77FywWQCEqHUi4lqG0i04ixAj5n9MoLjavrntMcyjSkuqNiLl7
         8oXbHv3mfo29MCbYJPCZi840bqhtxfv+Yx29WOGGzcZtQmncNmdSAD7az4XRJDxqVJdt
         7gE5JiXQmSD8ljC2PxcwsRUSCbPxAnHhY+NWCk0Dy9ZsiWAE54X2xW/EVEQGgoW0CDfv
         SFCix6yCMTk6Y9H32JUWqBlTcM+rRWG0gqD8/eLUlrz6oFngkVg8zbc/3vzCPZnn+34t
         bzEA==
X-Forwarded-Encrypted: i=1; AJvYcCUDbZyfXJYo71fy1ky9gloQk1qnkxG/ORnLC2VIb0jmqyKMVn7bn2cw+O/neEozDzHUxEzs2wPwk1j7wkUUww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5SL+8lbNpFty4SJlZ/nj3w5hr1RaB055NfXiBwpe9sa/QkP4j
	0Qa1Ey5yNlgFQOGIIiR9d7UDXrHLYCQrlJpPIZpf4vswTzYna1A+SUVT3IuEm4S5vXWS19b+2y9
	LjeQ7zvFqezKWkBIXv//PM54rNNKkCvoQzq5f
X-Google-Smtp-Source: AGHT+IHZ0vko7pQclRllMVoZHHLj6D5VQ4GyxJmsFhMgJZgKneR87tgFlzSTuAPnlbUTZJX2byH2euC5Vpl7UOXjA+o=
X-Received: by 2002:a05:6000:2588:b0:381:c8fe:20b1 with SMTP id
 ffacd0b85a97d-381f18855b8mr10892615f8f.42.1731340537609; Mon, 11 Nov 2024
 07:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241110-borrow-mut-v4-0-053976068215@gmail.com>
 <20241110-borrow-mut-v4-6-053976068215@gmail.com> <CAJ-ks9mSu0Wivnsn605ZTFHiYqK4VEhURO-7rj5jFAwSxJsABg@mail.gmail.com>
In-Reply-To: <CAJ-ks9mSu0Wivnsn605ZTFHiYqK4VEhURO-7rj5jFAwSxJsABg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Nov 2024 16:55:25 +0100
Message-ID: <CAH5fLghAJFbCaOF8YPKJaKow3RdPXAqRvkJ7Ua5Mo5LcFo2WbA@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] rust: add improved version of `ForeignOwnable::borrow_mut`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 4:32=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> This series conflicts with Gary's FFI types series:
>
> https://lore.kernel.org/all/20240913213041.395655-4-gary@garyguo.net/
>
> I've rebased it locally. Shall I send a v5?

You should probably wait for Miguel to decide what to do about
https://lore.kernel.org/all/20241111175842.550fc29d@canb.auug.org.au/

Alice
