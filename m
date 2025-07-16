Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A428A1C8
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677170; cv=none; b=Uw37nz3Url8hm1dsV75iHjTyCJpS5RP4ojspcrVlYgEDK2r6HTd4lcn7FHmyBURJDPLo407upQLDTrsoN73GKrHQvfEzMuvR3dY0Jr1ZgACQVeEa1TDIWoTF0GXLmXmw2DT9Fwl2hRx+2ZYGizxhY5jwrPbSn4yqkJaP9YXe+7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677170; c=relaxed/simple;
	bh=n9/z3fF/0C01CrHoIFHDdD5Sh4DiNFnhLvxjo7maOh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OiR4S+6mfGHnxN1Xo7KN8SNYe0iQMSNKI4khAmNRCzsCNbRJrKHJgQQa9ucPKbwxmFkiY0TpH0097sTiCZjUwmfflCrEinEI44tzZ1iU+rctvvnp6Om9YfKrOelstrpdXrwA7VClqozgKIgsA29ZQ4Fmz5hOKsGWNB28UYbir+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zgMaAmSK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zgMaAmSK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso3173856f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Jul 2025 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752677167; x=1753281967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEGvPpVqb+Fvi+UqK3fdVHqFf016XV/901kj1g7cqLs=;
        b=zgMaAmSK94g2I8c8PpcPcsLxjXsmgEKqYQsKxqI3sTM/1hHqJjAlYU23bY4t+GghCy
         xcP0xn6a9GWCCEH81azOjJPcT/+Epw0Zjj2S18m8qBqN+999GAqSWP/imrxQ74s+tofu
         HvFpi2yXXWKypD4w0bSBgeJZXTWVjdxz2eUoUHdzUqIyJ+Y06BFCosI9A0qJhhbPfMrK
         QaMeR34/xbwet7QBKss8K27+7gP5drJZ2itHjmmE8YIZ9b4/0jUTsuRfi0yAStEwa7St
         pWkifvAWIe63Vw9THEU6kXt/ab+NNx4LVdEo2PoiKuThtUz95ucTeMWxW2MEu5F+t4ce
         +RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677167; x=1753281967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEGvPpVqb+Fvi+UqK3fdVHqFf016XV/901kj1g7cqLs=;
        b=mfC/0iEQmb0bxqNJR505JpPC7X5gHtoPK7lxaOZkpAiVLbGOXRNVp/vpdK/QOOIO3e
         U4hwkpI/VFY92QqmvudvrLxb7BGXpriXSMQiFpf4DHONZM3hfojzpxmigIVl/bDqgFef
         AQjn7yIwzBtb1GFrVUSLNB96zE9TCHA44JXsxlnSQ+EK4Xa0AoXSIcDnSVpCPG07F6k7
         sPDtOpqo9ZhiVv7XYJ3NK/Qtj0z2Zl5T0qrC8bj6nSGzyVL92ALDRlR4hUSoDZtU/Lj8
         kB/F4hwx22Rh8gaOhnP/U5jCbrVhl00tCHs6uHDlI+k0oTepcWnLMHzJSRSMqH95G6wC
         NbQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOS5G/yaXzu+NU80fsbXH2MJfKjXylkGgQqHGyijNHLlIEIIKy/mi3JhWkBqZzU598WSLjRmJcoNx/C1Qsyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZwH4hEncrP09bW0ihuMJIzhAcY5wmFwa/17a4Ewx3FklrRE/F
	5HSGZmMnMG5L5t8fTaoF0/P1DdhSAFzWKQCIG/5RvIWgplrwpxjVSk6ob3Pr4qGfm/1STy2qMSg
	WkkPI4dU7kPPArqHF8EwJ88Xl34vXV3oYUPZ/G077
X-Gm-Gg: ASbGncvN09kOeGooAXmO6WByN8h9yWSr5CgV6T8z/rwlBarnK96koTmybu5o4WD8E1t
	5BEJ3Tm3FLrGmh6R9r1oKiaegGSUg8OkWCih2KnY06J+ii5Ljg+m8lnoLcS74ekTQe5mCcno5ZW
	DMeVKk+IVotXvZZxS0DEXPeo7HLtaH+TbDoXHnM3T3n7yps2CqyUEqnRoRJwlnfsSD3bBaJeaWV
	eCsX1Ki
X-Google-Smtp-Source: AGHT+IFAHBnZHLNrYyKfSBfa3jy+sfO8JJ+g2wXjd/pOkO9jRLTgL6WfpFC+NoeQ+/d/j4coTHY1LmnzbgyS/z9vVPM=
X-Received: by 2002:adf:cf0b:0:b0:3a4:dbdf:7154 with SMTP id
 ffacd0b85a97d-3b60dd8e5c4mr3015978f8f.54.1752677166930; Wed, 16 Jul 2025
 07:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715-topics-tyr-request_irq2-v7-0-d469c0f37c07@collabora.com>
 <20250715-topics-tyr-request_irq2-v7-2-d469c0f37c07@collabora.com> <31EA1044-AA9F-41F1-97E7-D3C582C32167@collabora.com>
In-Reply-To: <31EA1044-AA9F-41F1-97E7-D3C582C32167@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Jul 2025 16:45:54 +0200
X-Gm-Features: Ac12FXw4o_IZHo511I22hzkAseLhPcYg2xUkAXmB7tIIzyMTFWEK49V4bjcBMlM
Message-ID: <CAH5fLgjYcw4tX_CLKQYvR8j=aG0b0n_VYXOYVhGUUB_5s3A1AQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] rust: irq: add flags module
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 4:20=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Alice,
>
> [=E2=80=A6]
>
> > +
> > +    const fn new(value: u32) -> Self {
> > +        build_assert!(value as u64 <=3D c_ulong::MAX as u64);
> > +        Self(value as c_ulong)
> > +    }
> > +}
>
> Sanity check here, is this what you meant?

That's fine.
