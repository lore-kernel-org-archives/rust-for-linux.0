Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4651286331
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 13:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102881; cv=none; b=BD+mjNsZmLlhsubgeUA4QSU2XzWSF0vPgMMhRndTZsztbSn2HJYGuoMaULiOiHtyPm7Xbzz7LiZhoYKxoZGWrqceT9+EJrJGpGNZHzv8xEAyGtqzC/7vHpUPl+GQksomaLSlVo6UL7PZJpStMthgsFrPlAacjebdKP1AEVQt854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102881; c=relaxed/simple;
	bh=1e0o1pbplB2re7CvWuiqExDqzv4So3D+DzzYf/RsEC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtI94ZQjJrWxKX2F7LlgIIgmfjrVZ3NDHpCVkerYUMkaAXGkLy1ofgDtR+MsFUh1Y4ygAS8tkr9MjgaRdj1PY7c5BuRmfa+KA3zyc5ZHSUsb2iIIYz5Fdo7a1ZGyvPFiiBLna8XaJvi7rbzXzXmUOtz79E2Nl1pKCzBA411JLk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7W0guh8; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7W0guh8"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-450ac3ed719so6507165b6e.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767102879; x=1767707679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zz5Tak4TbT/Ijl7QHLyla2deic/NXk15cSQ4Gzqgx5Y=;
        b=C7W0guh8P39WnuttdNXlIu41/J3BN8qjGP8HVAFTxh0YCrc5I2eRD/UdEy/8VeOTEO
         ZeK5NEwi1yGh4ddAr2Q4y/RR4Sf8uf08aWg9qhdT+tW+lNhNg+f36NdZ2661ic3shqXC
         XjL/Q6iXrb8NwGsxhlhD+WkK3QK1SHEFrEV6YvJvzZsyYlkQ2R/DIrBaVeFSjErtYRXU
         RDCqeTfp8hpTERYaM53oR31HAmjmGPbabDKWmUipmNFFoQ7t0wJTTOwcymfHNP7rrR1a
         BQWCnYzVN4Wv4y9jJ2h6eJuoYyWtdIBIz2HCizIDfysY4bK7xUos4LEvPs8u7+fmyWGG
         5e/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102879; x=1767707679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zz5Tak4TbT/Ijl7QHLyla2deic/NXk15cSQ4Gzqgx5Y=;
        b=D9/X0J088ANFuqEsevgKXGO8EETEgx0cx/cFtnnL/pKPwA3I2Sb/z9gOWJea7ydW00
         dBe/RUnZRMv1peK1O95wBDbOqgJkoIVEzsi0WQAgs97+QmFy0Q9iFsLMfQSA36Uw6pAT
         HnXaZ6zSRMi/kOvSOttJj7SPKB2yeKrFoXk1OLoHvQtsO4huDyl26MUaGHSkc4dJSkYV
         KeqVlVorLdSkDkx/FfJ/S2strZzRsDl5CAnlGj6RyQd6YRADZ2r3usFk+N1DV6jNzeNJ
         cAY5pGsJuA0rnhL4ARClg+iAh4HIOLIqvkQRWcRxEqsjZshIsUE/a6+UNVklfKGoyU9F
         VsEA==
X-Forwarded-Encrypted: i=1; AJvYcCXpXeaRI8DIrDqq2f2kP3wEuLk88V1nbhcJnS8LhhTzjGtElQzFsxc29V8xyVJb408Cl7ljCoTQt+otKEWh2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdjBekJm0V4d10s7+bYrXHNgLS7Jy2/rf6l81Y2wZhKiLDdlU
	5IHwekcfD/EuyEzuuozhhAcQmzxBR6XnpBGPTP4XwrjPjnUZsuR3biBAlVA7t9Vh
X-Gm-Gg: AY/fxX5YydSHV19iAJfOsgoNgfT7BXE7MDR62xSxAUkpwXT9rYOOn4smTZngu4TLYXy
	VoiJEe4oeMoOwyh5t5hyip1b8ZdoCGJZJlAY7rRAPodlkC5hjvftcZo+HgvL3zysnrOpkR2tTj5
	EBxkZ0sSVG8LHKGKb+ssZl6nVV+YRhihIHnmMXkQt4uVBtB5c9fRJKY6DpOaL+QBba+n49oYm9X
	BAprdQmnfsl3lMd6Dw+POcySPETDGo0OdPaP+s8uo2vBItPFaTPrVsjqrNHZG5e0l6jDQ3LTLPb
	4pv2XXclMCIXlAQCgAdH+ICGgxlVj12mG1k0eRScr/8yVSBh/BXfSbLjsMUZH2WgHSxIzzWLUun
	HD+Jn1gWlPbtmf9UmWe6KpAlxP0sRgwHWmT5SuzXTFD1cr4d81fuCMrZV2yvyqgnlPKjr2P5jdu
	Y6uwX2L5wKD3bOfBylz+Pzsy3z1PAOI6q2U/NoC76mcmOaykIb8L8qBfqd
X-Google-Smtp-Source: AGHT+IEagA4N0//2bMTNT/H5SUllUcR7LWh2GwP+EPztZo1Lb7THQ/FsAXn5cinEWcdoNrkrcVd1Eg==
X-Received: by 2002:a05:6808:190b:b0:450:1fa0:1447 with SMTP id 5614622812f47-457b2233debmr14326618b6e.39.1767102878950;
        Tue, 30 Dec 2025 05:54:38 -0800 (PST)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667d7f1dsm22418573a34.15.2025.12.30.05.54.38
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:54:38 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-65cff0c342eso6900136eaf.3
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 05:54:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsDunZONgbl2qM2uLM+0C2rrM7zJEUhFz93T9x+rMdT+M6XgmqOHAfRGqmL93bz0qYOyU5QL1WVEuOcmf8ug==@vger.kernel.org
X-Received: by 2002:a05:6820:1626:b0:65d:88b:c00d with SMTP id
 006d021491bc7-65d0eaddb6bmr13721781eaf.66.1767102878211; Tue, 30 Dec 2025
 05:54:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
In-Reply-To: <20251226-add-entropy-v3-1-a3440823a07d@google.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 30 Dec 2025 15:54:27 +0200
X-Gmail-Original-Message-ID: <CAKBF=psstiTNLFOLzfGzkTSCZHoFuBGu9LuP5oB-tOKK+=+kvw@mail.gmail.com>
X-Gm-Features: AQt7F2oZP2lYSUDiXOmJZPyoVOUUtt_eqBHj5O-ni015FeWlxsRF1dVHw7XXtvQ
Message-ID: <CAKBF=psstiTNLFOLzfGzkTSCZHoFuBGu9LuP5oB-tOKK+=+kvw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Add support for feeding entropy to randomness pool
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Dec 2025 at 21:15, Matthew Maurer <mmaurer@google.com> wrote:
> diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..3e0aef2f53af122f510b34c4743a20452aaad9ad
> --- /dev/null
> +++ b/rust/kernel/rand.rs
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Randomness.
> +//!
> +//! C header: [`include/linux/random.h`](srctree/include/linux/random.h)

So why rand and not random? If there is good reason to not use random.rs then
can you add that reason to commit message.

    Argillander
