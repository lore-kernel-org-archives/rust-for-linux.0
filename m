Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0784B27FD4A
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610142; cv=none; b=gU2idEiMRBDh3fbro8v8fAOG7k9a7dBZZlNFW1K0QtIZiwlkuD2C+UvcMr1gGk8u2DYYYEtnlqy0iQHEd45LmiIC/W44w/0JQLRRIiMnJT+ldlqkdBhKijcuf6IR8ShVWM0Psk17g4jVcES66ZpIsH82N5MW5qQWun41G2a20Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610142; c=relaxed/simple;
	bh=PqEmieahyn9EwzVrouvyArwQxbceqh/0xFtcb/W907U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2/JZweuuU1FYR1C2Wy/1pkn5fOfpwjvjb3cCgXDSpfH+vS+osXTnNBTB8cZgAsuPhbO0WNvayp6M+8V5/IDdq6s2xMqYOMFMZJAWogzHcY6/k3KGP3syQg70dK626a43vZt98w2cKGwwd5O2WsrdLuMc/lOmnGL0E41qNktAyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sq4uWlST; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sq4uWlST"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so18048295a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 02:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767610139; x=1768214939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC6fqdI6SoNXO0sa9mIAhZLEh5BNN8N7CkfYCULrwOo=;
        b=Sq4uWlSTtD4ARBleo5mHSR8xJnrkB7lp1ElFQLxeyrJQmQaNX1RIrRgnKtQ8nb+/JU
         uwIwmSQrV56fN7Q4/ve8amfAnRXYfw66DwRtH6/z8Egb/YTQm6jbr8pIlHryFXB26jUB
         bRMkw/98k6vbZ8EQJALdekV9ipsPcXQUyeCUNoau4+Q4SHFQgy7vwBH++9pB9NkMascW
         WijHne5ofyryqdN1ygJLHpMRgOFiJIaahCotKn01MziKqklum+o4KXpLdQaNokLJijNt
         MlWBclbcnBskjkscXE67pb6GnEAGcmtXX/jrAvlk0iFiojKkWTzS7XpO4UM0Olw8mGgq
         QhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767610139; x=1768214939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eC6fqdI6SoNXO0sa9mIAhZLEh5BNN8N7CkfYCULrwOo=;
        b=m8kd18WbWEqyNBuSzvI51cR8NvBk8CVLWQoJnpWzn7xkBjpbSK0KHi5KrIXp9ISkd1
         IQbVCOnaci641bfPTTUVvfGmf4BWnUluzqWtGDxEu6cnPENUcRPzIm4JccbivVJAOFCs
         Yxo9pbB5jX+ErwlynHC6pcUqgWEXcGbqY/XZmIbcOhL3b6iRmC3mI/dNiksQA6LLWaFu
         SjNbWwIEJau7i0IQQ/DguGcv9Bc4FZ4U+1Emw5MIdCbtFm4VTqmy6xGXLkEiiDdMzIh3
         UV9DW9Ru4qSG8R8B5ApVO60+eD+OP4ppK7jQx6zxfd5GD3vGUf/tskGPLVT2N1qT+25a
         ox0g==
X-Forwarded-Encrypted: i=1; AJvYcCVv8Voj511iBAFy5Fekzy65kJBiYftgBdW2s7Zswu81fjMxY6/ZWMhYpP0m8lFh7HAFFjRAWZJ4BtcetvHkkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz1CofJqZ60K5BlYvRZIGcPsP5EKhpqe0l8UN3xKwNA3wycAL8
	LiX6PEE28q1B+hQZH3LGBgpFQOHnkUor+xmHFHjYm+njkAnD4Bh1rwifD40Y4wyIAV+9JDEuSEB
	3DwGXdGiiw1yhAzsEYfgjNIHWjd+oOiY=
X-Gm-Gg: AY/fxX71Z0a9nhflhTFAK4XIl2abeNFQ/0PT5LlqBx0BWaa45bfUk2Je4uKtgslZEnH
	OiPk+XtYJ29KIBrit24jbIMs1lFwmbXnZ84cu5R3WxycQNT6+tGUVwiyRXXYnLLs5+75i6qRXrS
	8yYstVz3ZcDNvomq6yXWHGK0uvrKTReME+M1eN7ccaHLs+eff4woGr5Yyo0Z7suuwpOLTweyEhz
	s33nleIYGg6skidMK5thrHV1cAU3wPgNKjPJfo4n4fZfqRV/mmx9M2sm/RgsTEnP6X3TLb7JWcf
	X94YozzrWtEwADVJmjkgGblHhQQ/03CByPffkmK3JmY6nr15ve6IK6U76iF+/rJcpC0AJjTktxE
	fy/YgXcyQ875gqc8mDveIZiDLYh8i/hl9o5y6Bl4sAQ==
X-Google-Smtp-Source: AGHT+IE/NW7xLgHysGDfqSTGbCd+gykn4XgVa/120DirdLBjkQPxdIcbyuz6n5hFIyWtVXgeG7nNofLtp0akA2ef1W4=
X-Received: by 2002:a05:6402:4314:b0:64d:317e:8ae3 with SMTP id
 4fb4d7f45d1cf-64d317e8df1mr42055764a12.33.1767610139122; Mon, 05 Jan 2026
 02:48:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6dbdf6e1c1639ae381ca9ab7041f84728ffa2267.1764062688.git.y.j3ms.n@gmail.com>
 <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
In-Reply-To: <cef76fc1105481d219953c8552eb5eb07dac707a.1764062688.git.y.j3ms.n@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 5 Jan 2026 05:48:22 -0500
X-Gm-Features: AQt7F2rJYxVuyFy3wPXagiP1r0nluim36A4bXoQFW8mB1PutO2ubI-G8DdXvO7w
Message-ID: <CAJ-ks9nWbu53Fhmz0Wcb4jHxwr3D-sc=BqW=gHLjw34dAxRKYQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: quote: make rust-analyzer treat `core` and
 `std` as dependencies
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 4:38=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> Fix the `generate_rust_analyzer.py` script to ensure that the
> `rust-project.json` it produces includes `core` and `std` in the `deps`
> field for the `quote` crate.
>
> `quote` directly references items from both `core` and `std`, so
> rust-analyzer should treat them as dependencies to provide correct IDE
> support.
>
> For example, the `::quote::ToTokens` trait is implemented for
> `std::ffi::CString`. With `std` listed in the `deps` field,
> rust-analyzer can show the expected autocomplete for the
> `::quote::ToTokens` methods on `std::ffi::CString`.
>
> Verified the explicit uses of `core` and `std` using:
>
>     grep -rnE 'core::|std::' rust/quote/
>
> Fixes: 88de91cc1ce7 ("rust: quote: enable support in kbuild")
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>

I think quote doesn't need std, see
https://github.com/dtolnay/quote/pull/318 which removes the last tiny
usages.

> ---
> Unlike [PATCH 1/2], this change doesn't seem to offer a noticeable
> benefit at the moment, but I've included it for completeness.
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 3b169904ee41..b8080febc4bd 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -96,7 +96,7 @@ def generate_crates(srctree, objtree, sysroot_src, exte=
rnal_src, cfgs, core_edit
>      append_crate(
>          "quote",
>          srctree / "rust" / "quote" / "lib.rs",
> -        ["alloc", "proc_macro", "proc_macro2"],
> +        ["core", "alloc", "std", "proc_macro", "proc_macro2"],
>          cfg=3Dcrates_cfgs["quote"],
>      )
>
> --
> 2.47.3
>
>
