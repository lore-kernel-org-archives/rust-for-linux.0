Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A01E2847
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989107; cv=none; b=p8mg/OsuxV43e6/7fWat5g5sOvlftX57LyIa7noRWxTWaW7i2q4aZSk3lhHmD12br1bRrWIzAMAUtucgN4haaB8zl5Tc6KURMujeYtoFvEE0Is/qSAbD7ZtrHXcBN61riXmxD3XPtq8EOeC3A837dER6+zBGzFqfAck1mwY49kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989107; c=relaxed/simple;
	bh=JHlXb3zul+rNFkDXGVQOrWhVuAYvI+ZjVaYWHjEHsuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXL0O3iL0iMYDLbolIMwCPSlSuaSYRceD44CnNEg8Q0d4uNHJ5fvIGT9uVNgn2cZ3oMJZEu2KGAY88lJzURx16isGZEaLAMEzrBJ8Vga7s8mlx8Qi5AEIDFLL7zZiFjMXurYF6Ogr2Ir03m1sJZQ9BCZqQ/E2H5xKAb+MayEL2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DN3H11wx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DN3H11wx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso6825295e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 00:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740989103; x=1741593903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBB9+bS3IdAEw2Zo9wy+KIRO8+GAYmgN6Dv1bAKxGKQ=;
        b=DN3H11wxatL3cArjcoi0gb7tLt1aFRvKH5UcTmqmM4Cp8ToSfni9pxgCgQahywKBoL
         wjJzTP+yS6W+N98u2cc+tF0fdh3p3/5ZP+R5bKKwWNUXJxd08hWLrFmJV+0Qs1glcQL6
         BQA4IUQFaDhpOfBqCG3Ne/MSdWvBmpu2k4ej4gLKfA/RxlWXVlVzO+tgVn5J8vlrES0+
         R0GXBwXC2hoExKYNGlJkh4ElT1A1bL57wzGjicGr3hryUZWkloz1UbrIY8Z7AkQs7G2S
         TPG3raYUm0pmfYXCk5PDzChFfJt/G1nN567xeS2T6dsZltZtgvfA4KNr4kR4tcOYEzjr
         /L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740989103; x=1741593903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBB9+bS3IdAEw2Zo9wy+KIRO8+GAYmgN6Dv1bAKxGKQ=;
        b=C26UWLw7VjyABwnsoMH9m1TbIBdP3X40JtFIXFczBmSQh5ju1T+suFre0vyISsC6hN
         uoAOaJbGdPh/UY1WNCZ2VtaCmT/M30WQhpFkWHuY0SiQ8vMCdqJCByy4Lln6B8wT4A3T
         4R5+gZtL4+2LY5CZ4aYGCYAegIxzckIEHyaVSEq5n2sjQOQLce3ouLUInRpjCAQOlWw5
         D5m6NxFqEghfMxVL0PVR4QYb8d+XItINNHbEmcG7adY4FRP+WpijE+yOfteaIfSBX3im
         e/w9o9bcVUXxcAX+VNIA7BawGPGYeppDQZv5QB2nUREi5JpOdtRWIWC+1lfVzwL1TiO0
         Dekw==
X-Forwarded-Encrypted: i=1; AJvYcCUesDT1IH7bbyY1yuqhGWeJSKPTnCPrxo5cO+7dQxXWa+MUU1BT3XovL0mnmahAy/dR16sbwBr/po8rJ9myOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/qmQD+ulF6ICPysNE7Nzt6RWsr4h902LE3lAzBfkQX0mzESe
	j8DoS+OfAZJuXpzAOn9i5fn5n6HVO5/zxr+hTwQjw92//RavXY9QTf+Xh/mdYL0ONWUvXAHUHjL
	E6xE9IWrg92/3kbCbZFWlmvEeUz5qnVcgclvx
X-Gm-Gg: ASbGnctKn8ujZfu2Y3c3MTVNS8F7IJlqzvcVpPqr7esK0rankBl8/lD/T9TpToi+1sg
	/1MxyBXgptFpjWgkpmih0ZxM3/FUk/pJ5RPikUaCWHWEtmzy6EK7PGp9T14T1/CaW/YvZdp+gg4
	nyO9M7hVXsOy6ofG65Bs4uin/35/cDo/gt7qpVQExECXGax318Z5zzvNri
X-Google-Smtp-Source: AGHT+IGpdxgjf0gkSNOiBqhKXbQc9hRhwlo2W/nTX9MqGqqFdt/JgT25MM6r5uWJ1chlgrzzP+QlZYMm6vZ2gmLXFNk=
X-Received: by 2002:a05:600c:3b24:b0:439:9496:17df with SMTP id
 5b1f17b1804b1-43ba66fee15mr102753595e9.13.1740989102617; Mon, 03 Mar 2025
 00:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250301231602.917580-1-ojeda@kernel.org> <20250301231602.917580-2-ojeda@kernel.org>
In-Reply-To: <20250301231602.917580-2-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:04:50 +0100
X-Gm-Features: AQ5f1Jo80hSF1L-_KjqVRtXigJWOzdDSnpQhkOp567xZ9U8afL5p9lZs6wbyFLU
Message-ID: <CAH5fLggKXw-SCtR_vAOAU8KJaAvmNP20egmtV8KmX0xV0DA0dA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panic: fix overindented list items in documentation
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alex Gaynor <alex.gaynor@gmail.com>, dri-devel@lists.freedesktop.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 2, 2025 at 12:17=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with the upcoming Rust 1.86.0 (to be released 2025-04-03),
> Clippy warns:
>
>     error: doc list item overindented
>        --> drivers/gpu/drm/drm_panic_qr.rs:914:5
>         |
>     914 | ///    will be encoded as binary segment, otherwise it will be =
encoded
>         |     ^^^ help: try using `  ` (2 spaces)
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#doc_overindented_list_items
>
> The overindentation is slightly hard to notice, since all the items
> start with a backquote that makes it look OK, but it is there.
>
> Thus fix it.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
