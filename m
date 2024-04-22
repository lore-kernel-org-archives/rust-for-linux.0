Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA4175AB
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Apr 2024 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713765959; cv=none; b=brWSH0PHWGpTSNgkSDv2ZJCfFCx4V0aWK1on40CN+1GM1GqKC/fDopoMgm7NsT0mdmN1zSGJ7aoSIi/vvyuyLIO1vAceFNqJnv+JQo9Y7CFd5wp23gk65TvYFHQvOSTOptkzwz3rxKdqx1qL6zvASFN6z7G/layQunXvhclJpzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713765959; c=relaxed/simple;
	bh=lCl6QJP1B8UBfCPNz7DDPWWQHa4kLQj5Rl1wB09Z2Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ItzJMb1PazVsNX8a1uMPN/6qHg9Y3sjzWBien86q4wR7AUt76mWXI60UhRCxNoXL3z+L1ycdrlPXxZBkL6MMH/BUkGRPx01gEguK6q5nrGA+Av3srdR/ZJZW//W9v7IeTEGCkRmPTfqWnLhbnuLN54VQfculxE/WC5UO4to1Q4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kS2qUo4g; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kS2qUo4g"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-479c3616fceso361696137.3
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Apr 2024 23:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713765957; x=1714370757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCl6QJP1B8UBfCPNz7DDPWWQHa4kLQj5Rl1wB09Z2Zk=;
        b=kS2qUo4giOEEqM55rSq8Lwdst8+VhEy7cOdlgZhT5jzBdSlbzzn4E15XW1+yPW6b2U
         m5qIG7zol6uZyWHhwJYy6ebwwG7ljN3vbbYWAKna1jy2Way7/1lBdLH2gMwW9qqKMoVw
         79rM10fIPXkPHDDREGRfLDe116oHrv8iypgloH7sAvpDPX6VzQCIYYdWLgZkqfN1nE5T
         Zn+c/EXp64RgWB1jV9H12RAptN7sV5gg+2eHoyNY0gVUF/EE2p4FX63d+KnlyIRqGzUI
         dvA5pplLEtMhiAI0+BhLzz17Ko+QcjYmqfx58HUSd7Z5jEX/EB/NUYkYD34eo0ZGUL4Z
         JSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713765957; x=1714370757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCl6QJP1B8UBfCPNz7DDPWWQHa4kLQj5Rl1wB09Z2Zk=;
        b=qjBuSU54G/TlZQR+rq9oumj2L4tOXuZYBZghGMg0Z5PUpEGEidl9SSU+2Xj4Q2VWmR
         a55FFEPQFMzOuWBEoIqblADpFg3b+kQAOg5KeCd5a2uBn65HH3i7f6Vvae+mHStU1FpI
         QvpI4CgPUsKob6duH051PeV1dVrIpTnC4YbEnuQJfsie2tA5E7PbEszeA34Ztr4Gh1So
         iiERZ9KlRJUeFsdF1B9gCLzW8CANl2TE2g29FZoBzjxlnKHRe8A2/uHwwiFL/NjQWm7K
         0/9es6CKM11hJu6mdKcamgWLvyi56IvWJIgw1fnx/VsyZi5s95F0/BAHDEwuU1QxUVkp
         mtag==
X-Forwarded-Encrypted: i=1; AJvYcCWpwz7tIDZlde8mxymnNIbqT2IJ+dYpf5Qx7eZTshOGYLmxuxh7bV3WiN+cC/eLbS0DqAw6JP+etldnjKr/xnjvtEuM8Z9TkKdLGBHI600=
X-Gm-Message-State: AOJu0YzmGAhNItIkDiz9o4HR7G6E92n3JMW5eyUlE5QmQWESHxN/Vlp6
	AiUBHDlQCgwQm5ZnvYbCGo4i6kQ+f4RO8993+dx7kXgSMr6mkhFE1gAKL8cWBdItFLDhaJoDwop
	BkzYhVpAV1d0l9oeoemp1urXclclLH6OQDp1f
X-Google-Smtp-Source: AGHT+IGrXhoj50VRacaNACHV2T9HmrB4w3kzmX7FT4+AKHtU3DCilLuZwt0FQmkcZ+AR6p0IKsbkwlEDEofzcsV2OkA=
X-Received: by 2002:a67:eb89:0:b0:47b:ca6a:c5d9 with SMTP id
 e9-20020a67eb89000000b0047bca6ac5d9mr7227768vso.28.1713765956934; Sun, 21 Apr
 2024 23:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419215015.157258-1-aswinunni01@gmail.com> <20240419215015.157258-3-aswinunni01@gmail.com>
In-Reply-To: <20240419215015.157258-3-aswinunni01@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 22 Apr 2024 08:05:46 +0200
Message-ID: <CAH5fLggrknsAxUeVj6e9487Sg9T_j05Kiwa976JR2OBcWOXQWw@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: fix datatype in docs for `module` macro arguments
To: Aswin Unnikrishnan <aswinunni01@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 11:50=E2=80=AFPM Aswin Unnikrishnan
<aswinunni01@gmail.com> wrote:
>
> Remove the mention of byte array as datatype for `module` macro arguments
> since the arguments are defined as string, and `alias` is a string array.
>
> Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
