Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E150218FDD5
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525421; cv=none; b=KVGIv+NQ2Q7w8xN22pSGFaBUSMHy752C2F4GhzYzo9u1YSfqhg0lqgKKfxwwsXQYmKV65h1dy5CvNoi4FT4mdnHoQMj4yyiz5h33ezyVHW+cKGW/9MMzOLL1cq2OAXP264+cEqT+WlSS8HPCq/0lHzA4fsJveyQ6+7yMKEl0yLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525421; c=relaxed/simple;
	bh=ua5VDQsiXqtOKDk8a+VeXL6mesJQY1AICliLfJnkLdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcA2r86O404d1b0iPgimwNZqNkwrM8zw+adKOj60oSBCbuMb3H+aCxzI45+Z0WpDrmyhRUNFqIUcm3V05j9y6PnpyY8EtLKqNFyKilWAd2lMDB5AUyebWz1Rp6Ht7sfTDxVuW1/rQ9xX2do7fIJvatlTkZm7GjngfsYjVJvRrLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rI7pHTf3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rI7pHTf3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38231e9d518so2743091f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Nov 2024 01:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732525418; x=1733130218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ua5VDQsiXqtOKDk8a+VeXL6mesJQY1AICliLfJnkLdU=;
        b=rI7pHTf3g/ZmNvkZtjQxr4yBej706z4M16Y91eemNM7KUzjDRAeinkRXEIEihg5k2f
         4rsEPT7DeBG4FA84EY7Q/y/L1OPCr03GwodeqNcfpTyFz4kgaZWHSAHWxOMtn2VM31er
         C7em+Q08TRDeKdYufBak0MaN+Q0n3kHbPVEQ+SfRMbTjZ4Tfg3UDfjzboV/P+IuSepGn
         LtxO73EPHP5JaCW6cNKdmc041Z7L3uDwqpm6brszjQHC7o+alN+riSJpCDSzDattSfBj
         qwoYcl88pq0TVWtylds9cmSBSu82tYI/B45PCBGCSXJmJ/2lCtDbbjbHImL7zBeZ94fW
         i8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732525418; x=1733130218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ua5VDQsiXqtOKDk8a+VeXL6mesJQY1AICliLfJnkLdU=;
        b=kcPBar3ekW/Au1sw/9e9grswYh6HuD00LNm74yE4f6/FxgLZi+ATZ8/6Dc0dHTp1ML
         sGQrrffhf2w5OeY1wSQOBwOZ3cxnWbr6vgK+IOkOotHysH+QzNx5AxPgNPHbwcpSJagH
         dGcqrtotznDexumDgaurOMt6gVAA30htSNlDzFAIXUyISNcHklrzC3ZYhg4Tx4qjUGcp
         h0unXdLTVh84MeWh2Y/NdrD02Np695hwoKodROHBHjdcOfcWScTmBEVMeJNHITKVV8si
         R2i9qM2P+2cRwwpyaachyH+Sv6UBvtVcf2xENHIoPWwbtMCjSLqx4aw4+hVCj225jdiU
         UVtg==
X-Forwarded-Encrypted: i=1; AJvYcCXBmt4Cki8tuKJ3i4ZIfTOToSje3CWlEFNvMgG1SOMV1UZ0UUpNxkeoyapnF2uRlltyW5/5s5O+ILok54iWSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEmu99zHMXEeROZxnbX3vTh1NmSK2Mw0ARCK8FMuPOxj85pbkN
	BmB4L3fNq6El0TT8ZTb0J17edPrk5BjtAgpcAERHp/ZQYvSfxIYqkAch/cIgjr5By59qVf/caI6
	E9+oji0F8V8gRSGG4JfbhvGO3iD364lBzLZI0
X-Gm-Gg: ASbGncsU1Pemnq5Yszn8n8TZgW1qsgr4XGVxSSduiUStx96Xhdj+k4DptIKNxj7dBFL
	P5MuigKOYOHtOeqm7bntOL6hd5Ojqo7jAszFLGJnR7J3uihFG7fkCgN6h+EAXaA==
X-Google-Smtp-Source: AGHT+IFsp74BJSRUXy0rwDRHBWrnNLnzvcYiIiExC+k+tFQETw7QSgaUb36FwhPXnhS3ydljNAqYGzg0YrA1l5gfAyQ=
X-Received: by 2002:a5d:59a3:0:b0:37d:354e:946a with SMTP id
 ffacd0b85a97d-38260bdfa76mr9442685f8f.50.1732525418085; Mon, 25 Nov 2024
 01:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123095033.41240-1-daniel@sedlak.dev> <20241123095033.41240-3-daniel@sedlak.dev>
In-Reply-To: <20241123095033.41240-3-daniel@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 25 Nov 2024 10:03:26 +0100
Message-ID: <CAH5fLgh2RnLzShhkjeQenEHZXAv8pEToDux7JWtv7FV9JVkx9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rust: kernel: rbtree: remove unwrap in asserts
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2024 at 10:50=E2=80=AFAM Daniel Sedlak <daniel@sedlak.dev> =
wrote:
>
> Remove `unwrap` in asserts and replace it with `Option::Some`
> matching. By doing it this way, the examples are more
> descriptive, so it disambiguates the return type of
> the `get(...)` and `next(...)`, because the `unwrap(...)`
> can also be called on `Result`.
>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
