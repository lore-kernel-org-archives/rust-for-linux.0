Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122162E62B3
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762346066; cv=none; b=lcvKAugXH0XQu0RwDKiLuPIYF7qA8N1Rzc9GHY/rO4M7QsxCyuonEkPed2d1S9ybqHpaOQcxlzNbNxflse6G0rfAfb0AJkRm+ugk5XwVO0fKGm1UG+Le2oVBfU2QpnqQEw162exDzr9yyWGeHvis2IdSLitMbgoyvtzUfs91AkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762346066; c=relaxed/simple;
	bh=hGgkV7T4rmn30fGeoZ5wtAASpC64quKD9rauLEzLo68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHayh8Da5CnKd1bBTRof6k9mGOIkyI40pNUa+3h9FRPtknKB/FimtB3FvZRrUCmUBzMZ1pkzdmr4CpotQEXbkYgbQzH9NKfc6C33cJg8lhyhyEwfJeNMka4vf9yXON+oKEL74mh0614xJv3YncOiksKxXJ2r7ntStObD9LJ/m0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuX8P9iN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuX8P9iN"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ba3b6f1df66so121147a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 04:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762346064; x=1762950864; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGgkV7T4rmn30fGeoZ5wtAASpC64quKD9rauLEzLo68=;
        b=NuX8P9iNEy1Bfbo+holgYWZRGL9w45u1qpDpmMCuzLckZwmgiVumzVtqPQhopUKZ0Q
         pkaTFXmySyodvysKLPKLqjiR4hWiDSa6tvTmGj4tRIe7EMpVX8qjVdnpj9HCn72j3ft+
         AmjZ4u36YjptFCZS6JzvmprY2nxstElRmyySV9u4EukvpdAxb2wg/ckIkXvoqC64U+fh
         G1HZ8d9fuuQs/EUoKookyKbUuRlI8tl9URUbmAFaO3/keoNWs65kL5+QKmBWdJKbYP7s
         4b7PzJF8KN74HBtAdqh+1hQvwXFHr82NJEIAIuwp3mpnGJU747SXNEZuGC2buSivWnyC
         da8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762346064; x=1762950864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGgkV7T4rmn30fGeoZ5wtAASpC64quKD9rauLEzLo68=;
        b=Ey8gRdwb5N/oYeraWa6z/JUicD/YWCNKz4Z9yii45mwSEZXnbp2/4bbIpf6FnnM4Yh
         AJr2UkDSv3pIRa2fu3RuncU0gdV6vcMrwDOReMGqs6Cy+VFPcCR1ujaKFOjbsJr+hmVw
         AKoFRNKCJIK2WVWl8KmfhsRKmuDUs48tm1R9QNzDbPw//IQl6YrgHEheFsVhdTSodFRZ
         zpzQICf1QaNqnFw6HGmSa3fkILA+BiiR1IzzmfvNgX8wU9ViYc7WnGNh+74sPfri4XXj
         D/vFi8gq7rmRUGMsOjF6aZ0UtsM4brzb9Ex/4NVP71yDclfks0UDo1kvk+RQ2V7smFZv
         Ubww==
X-Forwarded-Encrypted: i=1; AJvYcCW2GT3V65lcK9S3aOfD2KF1pMqEnXV1dqMgnsH+QdGfDxUzJsdDnCu522DsU/UQVZ6Sw7EsVY+xmzesgfM3nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSW07rKjW5SwfkUrBNeEnb5DwsTchEuLNelvfpy/BEUN4Tvmzm
	ipYDrLIf0Dyw95StBzs18ZJlvBI+xyHEKOv4ApBh6XeArEy/HPbnHvNEp8AEb30eYHBv92xe9fC
	Ici32ITphEt8Agx+aC8/5WruRrSLnqVo=
X-Gm-Gg: ASbGncuJCcYkvnmO5DRuxD2fQxke4m6UMwYOjJGhewykD+yg8Bz8qzhdl3CYKZAvflj
	MSmw9VbjuCv9KrOpms01szesoUZlabq7D1TkQmbFqxIuxbLL/cQcdVchK+DMDOYbaWDJiNdoywX
	P/EWKDfUz02vMw3thPPlboP3CQ+d4odvTWtYdHvrlpCFK/yueWrHZuT1tcbYbjAXYHL4W/xBwNF
	MFxfywQn7qvvAOOH/xvczF55lv8HBF7+oAWk1OvM6bHJhP3rtJ2pmpuXPsZGAUL9R//S4KdV4AG
	0r1AeE8+7j/Yf864yBgeGrRzspwLCE/BNZFF+LsUv9NEM9HwqS6MK0cGm6xQOmj7OtlBxEhmHgL
	6EP8=
X-Google-Smtp-Source: AGHT+IGPnGA77HTnkuEDn9KaiHykchcjd6679IPhyR8msMD9QFespo3cGAfPkq4UEjnIJP148VVjxRLdqZbT7pFCMEw=
X-Received: by 2002:a05:6a21:9187:b0:334:8d22:f95d with SMTP id
 adf61e73a8af0-34f83f0aa57mr1863124637.2.1762346064162; Wed, 05 Nov 2025
 04:34:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-b4-frombytes-prefix-v1-1-0d9c1fd63b34@nvidia.com> <DDZN5VK2OK1W.25NNI77Y315WW@nvidia.com>
In-Reply-To: <DDZN5VK2OK1W.25NNI77Y315WW@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Nov 2025 13:34:10 +0100
X-Gm-Features: AWmQ_bn6XvvVgDpvhYnwlf3fpIlTTtT4AhIV5g4ThaMmTVf9z8pF1p7dtJRdTJs
Message-ID: <CANiq72nedDTruFvM0Wbbp+DL9n_3yte4Mpb4SsgjG7=H=bJvow@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: transmute: add `from_bytes_prefix` family of methods
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 5:56=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Rust core folks: if this looks ok to you, could I get an Acked-by to
> take this through the drm-rust tree along with the rest of the series?

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
