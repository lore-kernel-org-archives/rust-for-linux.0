Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F7612D1ED
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jul 2024 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720510361; cv=none; b=ik3NxNc6ItIR8fXcjiXTJCfILqz8M5fsB83rR3C0HB4V1k8xBCufJQH9A5tNvwAJgSwxOvwHIjcI5Pq9lAAgpZH9if5yTWiVgdru4umkKysgNojLC7XOPGevEV0deCFohjVCpmdKgFgs67CCyLtBvwVYN4GrkAjFAqT/LU8fQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720510361; c=relaxed/simple;
	bh=AhIESk2zuiCEX0XMjr/tbfYuEop6Auj0Iu3n0tQjqA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZ5YBTuBZeavmPAJxCoIKxGSnb+qAUwkCRyXugKzX5B/+HvR+wHLrgMep3OKHI96TXFRjwi0IGtKNADjOqG9DSN6cEl0Hq1QoNUzhfgmNaSHzMop/M+eLhltCBxbjfMDk60DLbXbNMaTzQCvXK4NJj8iB1xyOu1ID/WE5/X8IyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQYOlc2o; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQYOlc2o"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ca4649ad49so154491a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jul 2024 00:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720510359; x=1721115159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhIESk2zuiCEX0XMjr/tbfYuEop6Auj0Iu3n0tQjqA8=;
        b=dQYOlc2o3j60uvAPtRcC8R776qfEA9J6nYUzh2AWOSOacmrodz8iqA5hySr2x+zcW7
         Gxaka6SHp4V7U+p7qcECpvcodvpOBd37XF8HvX0Yb1xMskuaIr1rNHso7WM+mfk1omcd
         rouPxCyr89tMPQelZjhAuK6Bybm72DHQlZxF5ya0Gs4obO6GNcOdvfOgVOoFunn6JQCZ
         9jJdnicj0yfbg7pp1Ou6ARRWAUpoPoLpLS4+GyPTD/0ImeXG+RQRgtoXUTl73971rHI6
         INCdpzM4f8bZcpgbINvDIQJMLMKy6YxT7OkZgo+jwdhg1f1YCzU0yFPbZSUKHjqDcVQK
         luaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720510359; x=1721115159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhIESk2zuiCEX0XMjr/tbfYuEop6Auj0Iu3n0tQjqA8=;
        b=hGHFoJYhM0kmgOCgY9V2WdD1vTCFabSkn/2Ln842i/s9NJHFUIgCWwiT3VtVQlb5RO
         1yJwe2UECII1uTZovAuLlyrrS6uEWHsE1Ww1clSrfVEeDUruaFEN07DR8dAFvAgz3hf4
         MHDV+vQ2ErMmn2r9azhZS0FghOLekW9U9qv/SwdS7DDpi6P2kdbka7ah2m8TNrAbtevz
         BtUZabR0GAmWPNb5kUCft0NQlHMXa0bUIoEOkEcFPahTCeYxMqutItZPJf9EOPqnkMv1
         syR9Ks854zV4CO/PWPYM64wEjSbwNpGVhhLCYGUzbS+HhrrDdG81ihbfxGQt91hXEHWt
         NHWw==
X-Forwarded-Encrypted: i=1; AJvYcCUV1wT+Y7RMDco6Aa/6K8+eVJIJ3nGiurLHyJnGJ2FLtbNRFutEC9tusVovqLC1c/qBLpHPoio1qop+hDBQ4OZ0s/UNL+pOPpVmMxBYWhE=
X-Gm-Message-State: AOJu0Yx1xOtyPlUWPHms9CjjzU679QkCcpaXlLW2YA62hTQJM8dQGOSM
	5uli2pUU+qMmvMlzmG+W/LRCgjZtc99gDUgv5CQNVhB/gNuMnhEuKgwQ80vgfj9P2Yj9rYb/jkR
	y8KXqtZfH1yg5HkdZe+pEnUA2XPsOtpdc
X-Google-Smtp-Source: AGHT+IEDFhhhRh6GfgJR2cepBsPwmPitR1lzyXklONif1ouffSyZMSNRzkeFo7FwKdlfuWju0VIByvh301JFl2ZfsLo=
X-Received: by 2002:a17:90a:c7c9:b0:2c9:77d8:bb60 with SMTP id
 98e67ed59e1d1-2ca35d3daebmr1579118a91.35.1720510359486; Tue, 09 Jul 2024
 00:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240512112324.8514-1-aswinunni01@gmail.com>
In-Reply-To: <20240512112324.8514-1-aswinunni01@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 09:32:26 +0200
Message-ID: <CANiq72nqADD0OXnEu+Oa5OGbPAVcH64TjYhHEd=sKd6UFOzRhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: add example for `alias` argument in `module`
 macro documentation
To: Aswin Unnikrishnan <aswinunni01@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 1:23=E2=80=AFPM Aswin Unnikrishnan
<aswinunni01@gmail.com> wrote:
>
> Add example for `alias` argument supported by `module` macro.
> `alias` accepts an array of alternate names for the module as string.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>

Applied series to `rust-next` -- thanks everyone!

Cheers,
Miguel
