Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BEA3002D5
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 16:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760460140; cv=none; b=JDN+uwIpqOrbJpuIu3aklNb3zW9c/0l8w5Droo/4qXqspiGfOTlcprAk/BoRNquAYaMh/YNwE/dFJ1gVyWGpMdCqkH/OoU/Wh/SjJGezMz2+EjQMPX3gPWNJ/ElFTEm7nLlqoUzOQ4jpnTsvywVE6uv6H0buFrpNSRIdQjBaaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760460140; c=relaxed/simple;
	bh=Qx/eEo2ROVIPmgrj6FFyvxVlP5xP/FaQp3gFsAscr8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkyQo95gZGcRPEn/8GKTnHYFYx5YGM4rM/941Ya4Cs/JQPps/Z+hJ2VpsFkwxcMUjW0aCCvNH4Sk5+NyW4xl4CG2uASF0KNtmXd3McFB+u+E9kwurZ137aCon4W+lDUhf7Ze0cYjpM++WkmirfQ1CXAD6bIBIZLbPoECTzLU3Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfYAn02o; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfYAn02o"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-267fa729a63so9969235ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 09:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760460138; x=1761064938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qx/eEo2ROVIPmgrj6FFyvxVlP5xP/FaQp3gFsAscr8Q=;
        b=nfYAn02oEy1LxPZC/UTU+gUf46kkZR3qRioGbw4eEl78EMmQiDlU02q4wK1PZa93si
         7Yl9tLoG6oUrdFHJy0Aw8ZEuR10Ls/SwkcXZiAFERx7kICel20dXe4231x3b5sP/hfBB
         8P2GqXqg9S+DClGpRSHnbej+X5NVUo9xCfJwjdoU7y4uLO1LSDul7hPbyEGRW9s635JT
         tt/LU6elijZ7hKxdFbjpV08RwSX8fFFN8tE2b/TYfTvB9JA3f5OyFBM8j/HM8iBz6grO
         alWy7NMpuRjCCO1mMToJSeGMCi46mipVirpji21ICvHQ/eErfdL/12HVoSHT2hOq1d8u
         eAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760460138; x=1761064938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qx/eEo2ROVIPmgrj6FFyvxVlP5xP/FaQp3gFsAscr8Q=;
        b=GMJCegI4k4YTo2k96eRuDKLo1MPd0/NVS2GS4sdi+dlwhu8FhVYG2FvKRE7NcWRpMs
         IuNFALzyL+c1lJibtpoUdIzFiMmBAT6wgZzk832rfWTD8zpgqIGl11s4ia4oVONGZCjY
         cHl6KyJJlB9rUefDGiRdgnCszbU7LEBe0FRqAe84wRxnviywHiTXn/l5iA84uuR1MElJ
         FxS3ZsLgkcQYPrjDx6Zm0LYvv3ULG6W/ds8eRfaMd3Xfl4yMdXPlzHOJ/l1L4FyW6ssK
         5XNVGDmtYy+Dokry+gY4mRMMp/JH1aa8K1CBIBQSZ5TQg9h7wxA81/2dWdCThdHiFepK
         vHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMowclaXi16BxUA+kANB8hE6cGGy/Ly3ikzr36T9zYdvz//PEyI5rvPappXIJGA/kRL19p/K8E5Zm6kP9dzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyRnFKoW1pXkisTrmy5cf5c/aNX0aOVs8BPSPKMyY94tvWFKKv
	qFsIXNtbC/86guB4+ohsUXFWakR1BGQtntidwXKfjpv5TlrCvNhLr6VquPaSMwcAxqMGAfqMMP2
	GJ3WtgxsH6HHH2R8JAoLTXd2l1oPGlCI=
X-Gm-Gg: ASbGnctr9vB/HZcmPvIsRIaWTHg4ZPqW7xLwlVTt6U4WtZaZhwwEjvgqmQSseN2gTgC
	rszN++mB2InvrVWEvfCqYIwEVVlQ0wqdl+OBgroMjmXKLPatQ9LH2TJ0AnzrkuLfn8w04TMVW56
	P7o6vWBsk/2k3DOPnhnsYKGgefx8tawC4oeX6ToZLe78in/VHyGz9QgLV/vNfyiDIzqD10Y5vcB
	sDB6Kt+LUhxfdexL0pV/dlHlplm417vgY3D76mVSILDo4IIDaTnoQrnoFSd05FhOabWHtpzSscO
	6IemIJ7TuW0iRfXrPNhDmw4j/1g/rKMeeMtxaaFizVHd
X-Google-Smtp-Source: AGHT+IFm0NocZUOA7deQKev6cTvUimVZbWYXQYPu94G9wpQohGmRSl6mxcEZ0e/f5qO6pZB6kdK7mFOzs9rqiJR2e0I=
X-Received: by 2002:a17:902:ea07:b0:269:85aa:3776 with SMTP id
 d9443c01a7336-2902745664amr187372845ad.11.1760460138023; Tue, 14 Oct 2025
 09:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013001422.1168581-1-ojeda@kernel.org> <aOzET46lagm-p8go@google.com>
 <aO51pV5WSmqnT4rL@yury> <aO54nxGil6a5hLQN@google.com> <aO55B_ishdHO2uiW@yury>
In-Reply-To: <aO55B_ishdHO2uiW@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Oct 2025 18:42:04 +0200
X-Gm-Features: AS18NWBtweXgcaBwWxSZPbyhJpQmvLi4CG8z_VcU2bxMhsLFlMa-fdtcHq67J60
Message-ID: <CANiq72=oiJdA_0SyBCzNmf-XL9DbCN+sOrXmVR2TUhYeuZV29A@mail.gmail.com>
Subject: Re: [PATCH] rust: bitmap: clean Rust 1.92.0 `unused_unsafe` warning
To: Yury Norov <yury.norov@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Burak Emir <bqe@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 6:23=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> OK, will do -rc1

Thanks Yury!

Yeah, these should generally be sent as "fixes" to Linus; otherwise we
will have red CIs.

(I don't add the Fixes tag for this sort of change because the
original code is fine).

Cheers,
Miguel
