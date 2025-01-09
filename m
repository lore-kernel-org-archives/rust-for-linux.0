Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E684216381;
	Thu,  9 Jan 2025 11:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421571; cv=none; b=VhYiwi3dCjoTqMprLeto8WXmgxEd+KbLDNMfLEZJT3qKTUuFNHzSqWxr2dYpiEKia8yEkeu8KmIaT+wypqN49ghrItRrjO6ID4x8p5z4S6jIPmUO0o9R/0f/p6TVulxjGM47eR2i607aR4V7g7Mgp7Fiar5y/lKTLTwFBci4V3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421571; c=relaxed/simple;
	bh=k/DfcA6z5g5FTGXpM1+l4rX0cbAydG9yBg51pwdwSmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hipOGeOiFLx5AjTy/9zvm2e/ydEGVJb81mXh4/jPFa+v5YEyzU5qQJ0FX/0IjqEeuZR1mFS3JGmhiGQ6vS3346w9sA0WsxAIKSA6xlRMp9beFhxB3z8n4e/VQvC2U6OcUFqtZxZQD5l27TZoSZiTRn27SVScHHv8415V8CaI4lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InWMmHIc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InWMmHIc"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161a4f86a3so1171845ad.1;
        Thu, 09 Jan 2025 03:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736421570; x=1737026370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aY2UMuBv8sJzTFh7RfbXt8aZXqQ1c9aLbAqpoKARsw=;
        b=InWMmHIcTF2EqYLsgaoRUixehEefhF1+xAfFmeYbviJcmTiWNcpJXK7XiztwTGGKZM
         1cJ5E0acCmAEPzKL3O1dHDv9cjgI4pQEm0TgD3L4jlGXbKUQsNE+glYK8TREWA8Zb+Td
         +90hsY6Xm6RxIXEGYWkwOY9+S+8VDpyzR1jMj9KOo/n6N/u790yc0CDlgSYmJjRmq99J
         yef79CaYkmkvgip9g91a9dPW8iGYn7YSnWjEPchIXEsadv6RFbDXqhYoxRvHTbsTp0Fb
         +breigrgPJYQ8tXSr8WRamicMkr+R1RYGl2cZv4rprV0uL+rvaTLx0WpZwFGH2VDYwYZ
         HKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421570; x=1737026370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aY2UMuBv8sJzTFh7RfbXt8aZXqQ1c9aLbAqpoKARsw=;
        b=Mn3X87yfCqc7dIOctYiWyuG1RmstfSJWZCK+k/kkkcIUbG8/hqKZRSBpXUPj+CwgTi
         OF6AElrtndqHsUYi9BEV8rkkF3eCI/QTFkcz9LFumcuCDjUGH+bIrhzXTd6UgZpwPhrX
         vkgFuAKf4tVT1DF2w6W7lKPIRF9ohJ685oZTgsAFA9KyZ+OybGe/FYcvJSQk1hG9JBHQ
         CBM+Z7s1tazwDsFqJbjBHND366YMyabJ5xYph2xkmdYosUNTQpDlJJ3jtYz2G0YOu1xG
         bCsjAMMiolGiCgcnvnPiSkV39FzuVmbquv3UPvI/0wSdmxKsXPB11aHr9Rj4oKULAbSA
         DqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVGw/8x6Hef35HlNuzfOVquuoIfge8Nqk2lzFTm3/wgp1eFuRT+4a33XOzaRidKE2Y1rQxoGLWytA7pLXSlJ0=@vger.kernel.org, AJvYcCWZxHECiGq2fJRKY/MCKGBuuggtXGnf8afjT6f3NC2Fjp7w87rJtQcWUcDEZqwBq716MU9Yo5i6T0oS6OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU3KpBY8TmrZUJaUeFnYKjpQq5G+Amua7ElTz8fiKQfCAp0JiN
	IznxoSUBKFYRF1FC1CjpMUbOI6GwJN4sfXbLVsf+iVMgfvBAVsWMXycHEXqbLZ7E045S/Rg80A8
	D5EsQ/RNqv3TJS8M5o44JRfNETIg=
X-Gm-Gg: ASbGnctpul9rTXgbSdUPs+CZJrhEND1DyD5x/5WFzZGOjYzdCtrxk+J+6us7+EKhpgv
	OYqPuJ/1l+gkAfFX9LBDWGB8CX5XjpAN1tREQmw==
X-Google-Smtp-Source: AGHT+IHrcgYUBLMmlYxylpm95UITqP4dQZzRkvbslAA/EC4z4z4X9/gABkt8qJaM0TQSOjIN8MWqpTEz0GWOn4EaHEc=
X-Received: by 2002:a17:902:da82:b0:212:52b9:156a with SMTP id
 d9443c01a7336-21a83f4bf8emr35587555ad.6.1736421569622; Thu, 09 Jan 2025
 03:19:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com> <588af6c5-02cf-437a-a909-c22744a6df1c@sedlak.dev>
 <EFC67281-5CE1-44BC-92A5-7B0E4A7FB6AD@collabora.com> <ba95a574-2dba-4299-9ec4-bb776a228d98@gmail.com>
In-Reply-To: <ba95a574-2dba-4299-9ec4-bb776a228d98@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jan 2025 12:19:17 +0100
X-Gm-Features: AbW1kva68zZFGlXmw9UihK6c1-7vnS-T1tp728Bb7_Az1w-2EAb1zsHdt_OFhDo
Message-ID: <CANiq72m7NrKB3MhKT2gS7TwdL=Ug5LbLm1Z35NvApgYz=cuCiw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Daniel Sedlak <daniel@sedlak.dev>, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 12:14=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> We are interested in the last argument 'attrs'. For some reason it seems
> ffi::c_ulong is defined as usize at least on top of `rust-next` commit
> 0c5928deada15a8d075516e6e0d9ee19011bb000.

We are moving to a custom mapping instead of using `core::ffi`
directly. Please see commit 1bae8729e50a ("rust: map `long` to `isize`
and `char` to `u8`"):

    The following FFI types are replaced compared to `core::ffi`:

    1. `char` type is now always mapped to `u8`, since kernel uses
       `-funsigned-char` on the C code. `core::ffi` maps it to platform
       default ABI, which can be either signed or unsigned.

    2. `long` is now always mapped to `isize`. It's very common in the
       kernel to use `long` to represent a pointer-sized integer, and in
       fact `intptr_t` is a typedef of `long` in the kernel. Enforce this
       mapping rather than mapping to `i32/i64` depending on platform can
       save us a lot of unnecessary casts.

    +    // In the kernel, `intptr_t` is defined to be `long` in
         all platforms, so we can map the type to
    +    // `isize`.
    +    c_long =3D isize;
    +    c_ulong =3D usize;

Cheers,
Miguel
