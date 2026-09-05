Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB3368D5F
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Sep 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636166; cv=pass; b=iTvvSpGCAsZwZQuiURFZBDmtGbWxPAmKeoXkT9nF8Qb29Uv/j4y2NqViPedmhVWG6ACawOkaHhZb4Mbec55fvL8xOm0pI84IrIFttmVpGVW8cfHCgbz2ZtqWS4U//9DVZum+o27qiomUIjwsUf6MZN5xCyCwSbFdsveQwwI/rrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636166; c=relaxed/simple;
	bh=yF37/Nza90qpovsTyPIotV3GHJX8YLw3YQa4ToPG68s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUAUQ7VBf45wNBrIVnvT7hSxkBDYGjChVGGFDTX6G1mH7e+c1cblV8fa7wyAF7ZCM77ls0INb3CN2KRgkRMOiHHqfVrwkZ22j+qMexbjaPsjDs+Cni9w1KAYBcO0CzKHmfmNFNnLuiWNPPFok2ZFNp75zzndjGNpJnQIeQirOoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMvQbhU1; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMvQbhU1"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4eso1590955ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Sep 2026 12:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636163; cv=none;
        d=google.com; s=arc-20260327;
        b=cZu8e57fy8DciYwC7bzMzIVftcaSNn2GljJruY4IUa6J77vuBazsvxuN3BQK7sYj1J
         4KVNlbDoCaQD2OlSfWZdUqHNVWsl+7VLuY9frx0OPBbLHalVcJpA7NBA25xE5uyfnqFr
         vsiuGpGe6i8HyN8eMzWksnupSnIS/3S7ovmYKLQJpiVQuLmqLKMdterIV//ktSum+WE5
         FOk4VpDIbREqjw4KBHD9KYGoNcw40LfLBTV8q78X/zUyhCOF0prvOWwNBFluxCJ5vxN/
         DTP9mBrDCy16NkaBwCTCBvgiWS9APQZcGEFNKVqmMPmpUUO0HlxaWrD/of43wC2Xuwyf
         9nQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        fh=FzQiTj8H/hALLuSqq74tKHhcBu2leJmTLFSaKDDfS6k=;
        b=YBTBqIE9dm4TTfti/b11dzumbQOqMTUdigN9z51IVIVxh5WNYaJWOkJ06XgZrmlFGP
         4neho9L0uJXm6A7b1a2I9GJhGjOyZWa2li1ad3mWyij94k3a4PHISzxPaK4JXmfHfg6W
         zi/qdummTcr/ofxTTb2LrsTTfnjxpR/MMHFGWjn7j9qsTGx4Jv0BP7lMCRBCK6/UtCTd
         PyPpjYhPjV/lsj87AQm9D3u27Xu+keKtMoQeKAwYOp5g8GdRM/o5XFTZonk7ekccJF/n
         8OWXDCI1QL2eGfqfE7e6UVIG2SqZVleK2dw+NOeDfR9eK6KpWaAKj1sYjUYaRADn3cKv
         uqbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636163; x=1789240963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        b=HMvQbhU1ti0n9lhueEGhNyQx907yj3lOqhfVzjDLGcQSZrylyPwIksCdVGBnS5fjxQ
         Ky+QL1eYy/+KvbGivmYxs92NSxDf3EEStVYzb7zE4zp+54VGWoqw19mW1jBOXN1sexJM
         GPrUyn1uxTXEXgjiwJtQrJakwF8o8XDRf3UoeMqS4UDqyuLWERRvFvN4r3BJrzXXJ3BH
         W5aFM4TZmP3BJc3S6P4faRBpMptLTHIeX7wjRgWS7QWy1btJkXqW6bwhvmsz2dobFn80
         OzV6OPAcu8CUB8IKymu3MBqbLuegon5ZKiE0IArK+2TeE4PjNxVaHEBpCB7YdKQMby4d
         bB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636163; x=1789240963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        b=FZ76lWVcmOSDAKE092PwwRjEiwH+b8oLqro2bci0MRjOm54CWOF2qJYl5uglxs3Q6m
         YDS+Q5MreHcP+hhvpytybcU84XNfulah1pWmuoPdtR/4/sUC0u5lz86lydvHhK8jGwkt
         tr//HJlT1q+Ie7AXpFVxcj+4m3mwm3mnIm39Zu2OCOz0KUdaPmxNCQZR2VQaXgsSDizV
         f+m98OYQATAfo1lmwz3OjUJblPNcILWgVdWWsvyA60Puk3an8Pv4rf65e8ma0sDzR3vo
         bRkZguE+qS/8XauKycyT5yt6i0yxFNfKVN0wCXtWijWl2/mZO+KnbA7FqmdGX+HUBZaN
         iSfw==
X-Forwarded-Encrypted: i=1; AKwUvBwpb86CprCAmigllVlLQtXRjVOJRtM0U71EY7aCCwyEqKAsD3r9gnaTeb4q858FHchii3lB2mj0YTrkDhgjrA==@vger.kernel.org
X-Gm-Message-State: AFuF++m/ZN/qgAhhIdac/38HYfZ35oxQaCI+321+WXpCEyTjJBD0MqHp
	sjy/qp5m8BxsIKownsW+IwSDpzHrF2vQNj6eo5QGFFuL1iO8xZQt4ONjz/Ho9EYenaHVsYCcsRV
	OrLdabj2U6vzRvZQCfKpmOkktHIbP/kU=
X-Gm-Gg: AYBFou3o4yQt3QGGvpmC8TyNSiGE2qJWHCnIBIBUFT5mrAKi0bljXilRGKGEV93W8Mc
	cHNOgNS/z/Fh0B2JtQCTPoi6IJeoEsF7yGuB8vsQ9QSEZGmzLHPpUvG4oQFIgwla/M+Ou/zDYfp
	cNK88pvqwyhI+24sSG4qq4DTCT7PkFqnteBUT/f8WANswwJ4J1AOTRzARopy3AihwoGNM18fSfx
	utDjcXcL5Ee6OZt/enX+CZG+K97OeD0ilR/YR0Qas7oyQ1ySkCyCTImLhame81sHj0yXdHpvVz4
	xGQjtTOZs/bntNKAkMM33NpaRs1n6/ILTtQKFiYv1Hwy/kV3Vusk8CXMOSkU/KmBhajaLQfYae3
	m0y09E2SUFNh5dZxFhXzGDCEeE6cIe+/BBZMe2UK9fgUhMjo/pp/oBl2MfvAP
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr7470429a91.6.1788636163260; Sat, 05 Sep 2026
 12:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net> <20260901-typed_register-v4-3-5552b1d59525@garyguo.net>
In-Reply-To: <20260901-typed_register-v4-3-5552b1d59525@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:22:30 +0200
X-Gm-Features: AcwNN1XYNGZeZdAbyqW_MpHHmRnUCoTfhvfgQ1L93n760L7NneO9Fvtxk2YGC7Q
Message-ID: <CANiq72nxtehkGdb9RZpd=MsjWzp9euoLw=MmCzvcqOgxxEwymg@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] rust: mem: add `AsRepr` and `AsReprMut`
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 6:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +    /// Convert from `Self` to [`Self::Repr`].

I think [`Self`] etc. work too.

> +/// - [`Self`] must be [transmutable] from [`Self::Repr`].

We say "can" in the `AsRepr` one -- we should be consistent.

> +// SAFETY: `bool` has the same size and alignment as `u8`, and Rust guar=
antees that `bool` has
> +// only two valid bit patterns: 0 (false) and 1 (true). Thus `bool` can =
be transmuted to `u8`.

`false`, `true`

> +        // SAFETY: $unsigned has the same size and alignment with itself=
, and is transmutable to

`$unsigned` (a few below).

Cheers,
Miguel
