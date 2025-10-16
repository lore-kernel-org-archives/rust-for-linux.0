Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A42E54A8
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 23:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760657117; cv=none; b=cLA3zirayEdH403VPOdxl2x7z0BRztoe2iHXH8/wynPGCQvp+rceodeQVld2WDX7+hPp01MvlTOcbL134asegcc5wR1AesA/TRG1gVJftkXX2b5QmdHSG04lSbiqLLAUZ1dJIryqv+QKmBPb5K7bIAE+9HH8wruUhUpiS9XbpK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760657117; c=relaxed/simple;
	bh=NaoJwlqs6RJ9zPQIEFByuLYzAhJ363qQIKtmEJXBZ50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0xEGoMoq2VMTrEjzwv4M4pyMkhoxe7soC6XJJmN3pfkmlHw2TWZZOHWtretyBHH5HJL4PdziHqksfexDFOtHsTnn+AlY3TJ+MBlZvydOaq7gxIpTJtINHPjv/B0eVPuKf9dTGdhjNYA+sGEvk+S8hQODLXGM9WZtcEZvsCpqFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzfF03Mn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzfF03Mn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26816246a0aso1706825ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Oct 2025 16:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760657115; x=1761261915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaoJwlqs6RJ9zPQIEFByuLYzAhJ363qQIKtmEJXBZ50=;
        b=XzfF03MnTOAlE0eGr7Sii4GMoJ4aW+v1Apiq+nsfGBLDdPFQSBG+oYQh1aphi+GO6L
         smDGJGpvIxA6tOPf0B8K9nL6g8elll77FOmbkN1zfoJCRTk+9x+1ZI/0YH1mzDkAnGYg
         V7LWItwDP5JNVzxuWgKMEmRXeO4LYqzu8PHbj+lJ5qJfhbNZ76LngqUeMqTubUS7g8kI
         syJhBM2fjqV8ce7GAJMgmFCU5901ZRATUT0+cDbFXnyDkugSPebrKPJ4nrccKOoLfOaS
         uO8y4uANzx0fnN9nT6FKfGD+gz6zcduxLab3F+yOAfvVEKEm/b6cZMBd8Owu3fLjokli
         +nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760657115; x=1761261915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaoJwlqs6RJ9zPQIEFByuLYzAhJ363qQIKtmEJXBZ50=;
        b=Wq911oWwB+0xoyaCT/Qs4iX78IVNtajBFtMNEKE+xW0O0+bgvMb6mhKSH/J7d7PlQ2
         7LzOG5fR2oH4OJL37q+wBPEPgBxKnOKfdvvdlAViZDD6VkU+5Kfy/ND+P+inmvULB3ee
         t9fIRhXexNIbGrw/vCdtrDhEwzrqFfHWd+CWM8eHz5IN2kTcrSotCj8i+UalhJTf/0W/
         J1t7bqtHJXDwLiwrtCqzIMQavamtppGlKSoA5ZP2eHBehgyM4ODhwolDddWWaa1njER+
         2wETnDht6gMTp1vgfLlVIc8PzR4Z/a89Zl99OKCD6ijQxYWlP+j5EjERzPOcaQb4WtbY
         xKlw==
X-Forwarded-Encrypted: i=1; AJvYcCWa+rDTlgRX8TxhVNwJwSaFV63qE2gtcbFka4b7QYLWfUJk5NdkwIvcQtqXmGpzCk7RiO1zPYIOPXZeoTIdSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzREgLc9cN9HERjH0pwKjPD6Ogz0BwUK/QW+FXl9Bab+G/aUEu3
	5XmSA+MO6fPZkkOtr+PYAnb2hm9CZh6F3wnxMd2d6CUcRAvxSIjiyuCwx05Xq//ZP7iYUwg7i7c
	3DRap+Ll1chjWreDQK5hNT4DmDZ9mlXg=
X-Gm-Gg: ASbGncuzz0o6BWvMluootObDgEjVmXcQFwkU1oTC7GWTUrBIKcxx/wIvknnhPCxY9OI
	Hilq/vjSUPjclLcpvtxzGS7hjYMJOIemiVk/kbljhHZADpTlD9PWn8HlOtfmWHHEDhONKWWXA57
	CIK7pCwK7ws6uIRAUnjYstpPuUkrc/r2OTWUp/qhZNFU5ngLp4i4PkepLBzdUpBlEhZcMMH7gHl
	cAyZrvyvQL1OxzeoWFgXyrBTttFQPcF2lKpy/dJ9GaJf0RWRKPQyRu9Z2JCIc0nvpVQnhLny7A8
	2w99N16X+CHe4yWVZRt4RMzIFpQb1QmpLWbZ5aEAHrV6Kzg7ECqfUlMbCrm/mjujOsqZsX5p6+s
	TmHQ=
X-Google-Smtp-Source: AGHT+IHKez+rkRZENZvy/hZJ8rzFedxcLXv76zCn8uMa8clcMKyVyIuSWC0YxEtCrU1ccFU8WzBv306p2NdIMP1l0SM=
X-Received: by 2002:a17:903:8cd:b0:26c:3c15:f780 with SMTP id
 d9443c01a7336-290cb7568c3mr9104045ad.8.1760657115196; Thu, 16 Oct 2025
 16:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010174351.948650-1-ojeda@kernel.org>
In-Reply-To: <20251010174351.948650-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Oct 2025 01:25:02 +0200
X-Gm-Features: AS18NWAKsC4mVl1hI4d0Walzq8300iiHYVsaJlXnwFoTiPZWBDqN1Yy7f1pfzfY
Message-ID: <CANiq72kjoOWNFw8xuRHk9QzhfYHDjymKV_TTt099UH_f5Kv2qg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Clean `rustfmt` formatting and define imports style
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 7:44=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Hi Linus,
>
> Please see these commits, especially the documentation one. It is a
> follow-up of the discussion on `rustfmt`.
>
> If you are OK with it, please pick them up for -rc1 -- this should make
> CIs green and let people work easily after -rc1, which would help even
> if we decide to do something differently later on.
>
> I can send a quick PR if you prefer.
>
> Thanks!

Since I didn't hear anything, I will send you the PR after tomorrow's
linux-next.

Applied to `rust-fixes` (plus one I just sent to the list) -- thanks everyo=
ne!

Cheers,
Miguel
