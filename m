Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6484383
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 21:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742074285; cv=none; b=FM7qc/d5Xu/k6Za91Awk3bVYENBS4nhQquk7u2jefjU3sz/9T1pu7Gc2XsINZiZAHWoBf8SY3wXTMBTqtbPPL4yRmwonSEidy8K7a0srdAYxb8x3JRJ1+39ewaAzUx5GDCVBOMMJJZgJsRNUSI9d0pNXM5I/LTzaoEtaehR1IGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742074285; c=relaxed/simple;
	bh=J2i/0uu1Ha1Tl4OV3e/Nr1LjcO2kpbWZT+leHZb25GM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DW2boONoUHEnJ8KhZyl3UGS5O2c0vZQpI2rNxI4b2ukhuRr1fYNRHe88jw/ESoj6N/kgbiUwr7YPDr1Wk5QjQkz8lvdfbJKoddbzllIVtf4TpRylebnQCrEwZSfzBc3NZzgesfhJDEHU1Gp+GOmLjk+vgcMP9vQL/A62sK7NjkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Glk5Pjc5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Glk5Pjc5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216513f8104so6862925ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 14:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742074283; x=1742679083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kjv88NMU+F1cEwIjyevOvpAA2Z8gYEcBHuZbfqqisg=;
        b=Glk5Pjc5a1mSsbs114Ex0u4Tz2nzcPdb4wGgg7MP5BfBXgRR/BXBJllUHP/wHjSY3B
         +hxlKhN/vQQ+VNLOEUcylElgxPWCA4L7zU8onVeAmFdAKUoNLLRCK1EfYdKu99U9X3Rg
         zRKr1xw6A8F0k5V+LPoPUJAUtn6T6fnkQRTRqCD+VLnaXDmrWj9NB/tG39K5ra1JXoLg
         RbOt7fzTUDtjYPyYm0cklgZ5GSBRg7u+fHIu9m0m/BmHld2UJ70tSlXc+AVUzCHIoTKZ
         f2estVMu+ZPtRHUHWsKGFWln7XnsqlpdnUBkRKfxoJoDRzSRsUjF7PBdWRlaJFB0xLfq
         9jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742074283; x=1742679083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kjv88NMU+F1cEwIjyevOvpAA2Z8gYEcBHuZbfqqisg=;
        b=AEyhO7LwBP407PfflZnwsjPVtvlMPDbmK3DYTmrFj6NJRYR4U0AcCsYncZ3FlPcNJK
         SydxiXAg95BFxTfgxWgwjkiRAamTBBO9jA5jVzYexKaAoarNZz0HRwHRO/kogXqKc73T
         1hxYnJQytZ0WRJc+qzIPi+05sy5fJXAwq3y6WfJ6Uk4d9QNcukrox5nU2h2l+AmZdAJn
         sjL3N8SWUDOuhPpWpOWbd0hD3keoSmGegCFGJ/Cq44OXshk+6aLOfiyf1fwRibYwdu+7
         j8/gS6b06UKTGYEE74wGePCdLeZBm7BKxTZ0ltBz5TWABx4iK8eVYmOvktQHOtyUoHJP
         FxkA==
X-Forwarded-Encrypted: i=1; AJvYcCWetZFqZGXzksvrilN6Hjc8p/mklYYLgvTTbMAv64wy8wem40JSAtS/lvAWAONB73WbHwL3z7QkuXNipigrzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvyirJmbFQkYj44IS4L0afzI52wixH+h87Fz8R0zSGA8DL7nHl
	DMkoCMiMMaLypmtXGK5DbhOuMfRPH/OFeFpAyWCWf4pCvQAQSYn29fZNCZauyEDRA2/DRkCh51M
	WwZwZ62RxAP0PrLSrDXc1HNO8OgA=
X-Gm-Gg: ASbGncsGyMbzTVGrKsWOHxuJVrCrLgf7HgLWwA2LEe6pD+lwTzpnK5N2+efm8TZzMtB
	HZwxK2PJPzKTQP6C4uv4God1AecFWS5pHQhk7Ce1jj2N33b7lo2JJtyLvi6ElHtJTsrC3nTDgy/
	MHhVGef1jufCSmJVi/SU2SYikLjw==
X-Google-Smtp-Source: AGHT+IEmZdWk5plIZ71Dv5wif6gcoKbi10TLz4WqWY3evChczhXQu/VvTW8gXuDze4ND/LKzBMTIz8Qj1NBmp6hB+kQ=
X-Received: by 2002:a17:90b:4b12:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-30151d8e5camr3198133a91.7.1742074283036; Sat, 15 Mar 2025
 14:31:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0100019597091925-d4345a75-c75f-493c-87b3-3d0c4c722573-000000@email.amazonses.com>
In-Reply-To: <0100019597091925-d4345a75-c75f-493c-87b3-3d0c4c722573-000000@email.amazonses.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Mar 2025 22:31:10 +0100
X-Gm-Features: AQ5f1JqGSpJGhfFRWcxHWxUp1ZSDLbLRPL166CK1edhR87Z4M-_XyPTbqJbN1bU
Message-ID: <CANiq72=X9DTfs-ZTPoAVju3=rKogVhjYXRcE405Hi8Z+v2nq_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] rust: use &raw [mut] place instead of addr_of[_mut]!(place)
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antonio,

On Sat, Mar 15, 2025 at 12:41=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> This patch set enables the `raw_ref_op` feature, which became stable in
> Rust 1.82. It then adds the previous macros for getting a raw pointer to =
a
> place to the disallowed macros in `.clippy.toml`. Finally it replaces
> all occurences of `addr_of!(place)` and `addr_of_mut!(place)` with
> `&raw const place` and `&raw mut place`.

For some reason, your cover letters appear in a different thread than
the patches, and they do not get found by Lore in the thread of the
messages themselves.

I assume it is because the Message-ID does not match, i.e.

    https://lore.kernel.org/rust-for-linux/20250314234148.599196-1-contact@=
antoniohickey.com/

vs.

    https://lore.kernel.org/rust-for-linux/0100019597091925-d4345a75-c75f-4=
93c-87b3-3d0c4c722573-000000@email.amazonses.com/

Could you please try to fix it? It gets very confusing for anyway
trying to follow in Lore etc.

You should be able to send all your emails from the same address with
the same `git-send-email`/`b4` command etc.

Thanks!

Cheers,
Miguel
