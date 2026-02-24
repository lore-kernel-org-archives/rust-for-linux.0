Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F48639C64D
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939515; cv=pass; b=LdH9q0dM/zXtUSBYcn9+GQyuvqD7FRsVy4t1gh5Of8iZgxzkcDs39YZQcjYdq9lM/UAE7LfjfiywVfvvj4HJsGber+R3Ri/gjAxZ2rTj7/B64sj9QXPGPyne5eLYTejcQFc1GfwhGagfL3hxcHaDh8gTBzGuwst/3gP768DhKuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939515; c=relaxed/simple;
	bh=4B5oKnKjDlfXUuHy/T3lAUMN60/UQviL34TxIPODh6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CofOFPG5FCqVEQ9JJ0EY3EATYyyFxLJnp4GfpZSh6dIR+qxfzQkKT6NRYZa1UlTD4RHkrs2gNODxksgQ5Q2uHZodAbe7+D1fiJRqGEUfB3wqS5bMQe/eP6NWtmxRsrnD+bqatnWux1TiAIXT85PpCSGJVLPCpu1I6EFC/FrwCrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amJ19gfy; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amJ19gfy"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bd5658b901so247373eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 05:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771939513; cv=none;
        d=google.com; s=arc-20240605;
        b=Xhjb7gKo3cw53b0KwHqQLvQ4O6bL5P8iKqF6HCfUpokT1HicUZY1DmR9GUy/+OpY7K
         /ox2C87ChpjRWgqXtFU/JoJN4EuSxPAIs78KUdRT40F2ZGZM69xO6Zq5W86IZFGRmnaz
         jxwJTii/O8/tAZHrkSTk33xz3HWp2QQgpnLLNJIr16xbjwta+IpQjwXtiwYm6u67Vrah
         JGt77rQ/ebD6XDXmVMMPlTDCpucvk6oyBGZHC0xb5ahgMndxBCbam6uDiIkAIfCYnA8q
         8q5RJYYicgv7Jd1YHLFhGuu6X4Hapx7yVDMQi6a7Ac9hFnlH6R3TWKV2jV7ODf9xIEuK
         pT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4B5oKnKjDlfXUuHy/T3lAUMN60/UQviL34TxIPODh6s=;
        fh=sVAfOY2+g+Mw4X8l3FQzyWNUw+EXdLcKWXHrNm5PHNk=;
        b=khocQUyh+THaZW13uBLwGmQAdqDTp97HzhkXaC12HCJ9TZfLe1IoyaGsZyCjnEk/y9
         UB354BJ4LMPohoXqaVIEEvDwGrWCEtmqS8eHv3lt+XgLrufgNn/zACHrzk07Z5Glh/BT
         C0bhG1a1IvP6C5URN9Sqcm7ZXVzFTFlZ/E+8FlLp8L67qb4WQJldD3kKYlpi7BFOWbBU
         +9+s6N00im4hT4twqs9qqyc20mFAv4WgoARbgu/8YN6ZnXmYDexqnX1tD1DOI5GU4rSJ
         4QW0yyj4LYfTg1RIGsqkTKlWy4435Y8ulBHAAZZQwnkN/8yeGlb7rkzF8q5lPg7Nh4pE
         ZM5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771939513; x=1772544313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B5oKnKjDlfXUuHy/T3lAUMN60/UQviL34TxIPODh6s=;
        b=amJ19gfyTtAVoMxgQm0f3qImnKBOYS2LMhRYmZfxjNVo2ZknrkIJw/fwhJszjDR/tr
         4SwIc8L7tfoHSforCLzabX3OFWwl445LKXBcoc5aqR2wVorjsjfGyFFJOfjQk3EELnBA
         vMTY22X0uRG9UcTQ3I+bNKlcK5ZhQLGca0dZyejeHc8TIFjwdM4YR9h/bzwOwwr96WbB
         HUv5z04GvfZAU1sGIVkEU4M5oQozYWmLKwxseVvAx/Ik7MMRayqV5QrUa2gAqLx8AfB+
         +W/Rn8cPlf9FS5QTbDifhJTfjcJC/MsCJ1ERX3cv+ln6qCG+p/izQV4j6lw6+87fSzQe
         55sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771939513; x=1772544313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4B5oKnKjDlfXUuHy/T3lAUMN60/UQviL34TxIPODh6s=;
        b=FmBGzq2IbF8fbwFXVfKUSmZ0uh0tlG2olrH4Lkmb34RjdQm6HTk9RkCXC0jwEkG8KW
         8YI7ddM5/rJxpwpUouFKMwRy9p68N4CCr2vPespiQmTHPHnIMxNn3WZwzxjRSFrJtBT1
         X4xiq87Ns9EQjgAx6/VtBHjbVEgFOtBMlUb2naFFfiHi1x1I+VGRX0wvalSOTBdgtaE/
         F68/1pgQGw6lntmkDaQNSUDALAUr7iboVtW7+z8wdtgoNmIWXGIvq30VwK/Hs08oau3X
         kFEjc4kOD5PiTRqZwPg0KONkLCjwwEt0pDJdBVyLB8uwO0Xkbn0300tU3MlKtF3Fie6T
         ajtg==
X-Forwarded-Encrypted: i=1; AJvYcCX5r5qvYnoWfoeuXMYkWdVxRVKgNrLCkvYmoP/RYqXoRmwK79hGOxe6GPENkKcPorMrm1kHw1vNgL5zIA1NNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVcKE3SuyuiOMtXgET9/9qfORkVcHcpskVTv/ltijGSI9w9Q0R
	NcaD12j/4hM1Gs0Zr3GGBFTJjmEuofofIUnhOGjqcGi0Vit8H5EpoCZ+MMZNlki1Ic+a7Yn+OAv
	OMoY8cEV52LmIT6nnw3SCT73stT7rX6E=
X-Gm-Gg: AZuq6aJoto+6qmvsZo1Y/uIqWB55D/Zwg6tvZo6FsrJIf8S23uw3xaI1/Bh+oS4f3NU
	DNYcG5RxQVlM2HT0nRl+GB5LrsAjleC0f0cFYWqnMIRT8ok808n25WytHbOjT/MV82AZ04PQaTj
	cuMJYaPwvgLR5Bu++980miW7nYztQ+f9P1U841plBQjkLBqrCJUanAUDVTdHwxsJbc5Vi4tgQ14
	22xMXtlpptKzdkxtr8Cj3vbRZD9fmKW/GqEBM5tKnyGPQSwv2VuJcV9V/KTyVk6sP8XzL7old93
	BXvwAloBuaolgD/BQz7DIRuqYyYVvJRKIG86HFBU8FaxzhTVgzG6B3I+76PVSxlmjEEZ7YuKvzs
	hG2OlVke+OXQASY+SzAl6HKyDt9g6Tvgvqbqy+Ss=
X-Received: by 2002:a05:7022:985:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-1276acaf097mr2227296c88.1.1771939513135; Tue, 24 Feb 2026
 05:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
In-Reply-To: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 14:24:59 +0100
X-Gm-Features: AaiRm509Z9-gzlIVSS9iwUGUQ6PSAeno5gaW8ZXoZH9h2w6NjyMBrQpssCA5U6U
Message-ID: <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Change Rust Binder crate name to rust_binder
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Currently the crate name of the Rust Binder driver is rust_binder_main,
> but I'd like it to be called rust_binder instead. This affects e.g.
> symbol names in stack traces.

We discussed allowing to customize crate names years ago, at least for
dashes vs. underscores, for matching C names more closely and perhaps
other needs.

Back then, we decided to keep things simple to avoid confusion (i.e. a
single identifier used everywhere the same way is simpler, at least
for humans) and to avoid having to deal with those dual names
everywhere (e.g. adding workarounds for rust-analyzer here).

I talked with Alice about what she needed here -- could we rename that
source file to just something like `binder`? That would avoid the need
to have a custom name, so everything would still match (symbols,
source file, object file...), and it would give you even shorter
names.

Cheers,
Miguel
