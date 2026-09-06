Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92745474E
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788699666; cv=pass; b=emAjYooKUbMh4P/MDb8fPCWJtVpBj2zNuOjXiVbptrqpCpAuzJeIMIgeNBfRVBHMjtAMmezvOAsvctD8LpfEahIu0cxGGk5wkU28fmWqz6yo9lcl5c2ci0BGaauW+Yovs02Zl3vYkF8WjXuNFqt5/7s5m+EfO1lfn/Ufcyg/Pxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788699666; c=relaxed/simple;
	bh=rVneJs+WJWOJwXvR6OJmUMWmzSpYIv5KEdi9g19xTLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FF8tUkuHTecCU5RYP/rYqWP+Sm8LehmGuomB6yI7pzwd+M8Dn54K8QEmhB5UoRDvvlYdbMQk0HRXk6MRcsd4TXQmmtmA+jQu+TbtYKSlOFlwccG60MKWqj1sJzcSloTkl7diHVI5NiCBrolYyu2HAVPr9MNqcZh5G8uD1NqOvu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4Kmi2cl; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4Kmi2cl"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666e7c9eeso152339a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Sep 2026 06:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788699665; cv=none;
        d=google.com; s=arc-20260327;
        b=rI8fIF9tBr/KP2wHDMrJe52BJ5SkTzgvND6XmSGVfLKvQdC3StzqJcbN1+90flafZZ
         GLwxygNYwLI9Mq1+4c26GZgOE5SOFgmuz3mjlpCwYw9y2WqyR4qRTX5gDKXpohQ9LyBL
         2IRaKeMTYKp8jh8d6/sFW5qxKmHP4r3Kik6b96AbQ3w4n2FYrHIG4ePYxLm7DIMZahCg
         boJLyt7HsSHTD6f1g4+leHUwer9wzFalQ18Laym0g4rmfazEERTAxPHqIGZTVJSoo9IC
         eM1FkB1A2L2jMrpRqLt1SQ+JH0bzWfBaI5aRuvGZJhvKWpQX46vCaLl16aqmFIGeTEAk
         GaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OwZjlf30gOFEQkAcm2884DynAqqwHUx7d5OXAmZjBv4=;
        fh=eAReu1bhtXNq0DOy0BUJIZQyzPafTWxLijb/GZ3AbKY=;
        b=huzXJd5iMlsimPdVvpkJmHwciRwsF3i+ZLJlieq/VUd8bO6hUV9IGk9uhKZNlB321K
         mdql9bBpe5Iu1BCkj3FaTLKmG45/FV62IEi4vwL7Gb3fC9De4HN1g+xTkAg7YiwWPWxY
         QaYTf1SpKVE1JdnElv5+Lwkej74CYioS/P9deUiDbQ5TsJywWp+sQE9oDA82KgxSYuIB
         cOnUm9nm5lhpv8NbndPw8IaSxroBugrQKQ40qs8oJIBivAPSaEqmSgk5dLLkZohklTtz
         eBbpE0VQSHiT9Pt6uwpIQBvtdXu80KUdw9mwQKkvdiQ/ohwW5MJUkGmCIuU3lT4ARy5k
         DVNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788699665; x=1789304465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OwZjlf30gOFEQkAcm2884DynAqqwHUx7d5OXAmZjBv4=;
        b=m4Kmi2clIJmAJFY+MQVEF+zCgOsPnL/Ua7tYfyguzIXCjP35suvoOBkEdUntxSAQiR
         YAeSGEtfuOd6vgv9TsL+077cdupS0QQEN2rhLBHIOYNEMEUSOVX/Ut3Du5n1MrUH9EvM
         Vtr8M/PXtM6DX/NgFVC/q67R5nKlug9sGxei7goIjOeUGhpUDBLOpx6FAHB2tYc584wo
         sAx3OpbSO5cFKWqu26GX1BltluKMjd3lSWXcJ9Y6ryRGgURbLVhMcZWJ+hU7Pjsa26kP
         r7Zd3fTEjWWWY4RrE5zR/JfSkvLGLf7du7om3aMK0xLzLqqEiy/lgAlO0/DS6idiTZze
         Dv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788699665; x=1789304465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwZjlf30gOFEQkAcm2884DynAqqwHUx7d5OXAmZjBv4=;
        b=BNL5p3iNslTZvkGf6UcnmLfVPQtUvQXUWtBMGjbn4YvjMK9BLI5ZPrWaG+CXouUgI+
         fvgMT8qXnBYd65nTtTg2qz2QchQi9WViZJemMQF3eJv8+Ebkss8dWR2PZ+9hGQt/PiZF
         pS8g7sWhPu30uv8JxIsZWvV6jXGrJhl8YATiYjiFlNUzYg83iK4diAMysAL0m3mEjRlE
         nj1SLbCgd/jmLgi4vu5LuCkTvftspPfi4v1o7GHFuHE0etvU8e1bsIDrYDkWROici+WR
         ZKNQGLaRQ9fQRFfkunxh4sbatp4ISfQh6TsHyTXFH1iGPoxxfVDTPDKMplfm9pW5fGql
         Ar1w==
X-Forwarded-Encrypted: i=1; AKwUvBzppUZf1Vxww21QJmu0GQR0pMh8ojKJLmMXY5gm8Mt0NpP3Hto3O9DN0eQLDJuoiZ3flQToGXIU3Z8GMeF7vg==@vger.kernel.org
X-Gm-Message-State: AFuF++nBYv3I0lNbri7jBWdODV2cHjqFd02HLnLW76sTqlkZEFJMKMvA
	39bIelVW+tm1MpxhX/5V9oK20VoInYTBIRFw5JTY5nlway2L8ZRTbzcjP65er36WHohOfP9v0a7
	6apr9DUvH/9QIBb+xqyQCcPFkUofxMvA=
X-Gm-Gg: AYBFou1J40TjNNwT1XYYFaRgbL9jYkIqkFk1FbC4NP7skJ/B6Q83Rcsl+k5USDCICE1
	BjKldDyG+6qWd3ideDqrgoa3ukCandcwHKnM8lVbJI+pdeXUXSe/NNMiNAQxRloBinzYc0+waoz
	8MRxCh0BU16tn2Ox6a0/jCev6B2RoJWDY46cMPIpppgeuw6iAdqJj6dZjIIamX7PTC1Toptgpgu
	tg/z4b+lns4app0/p8G0b8a6DJn+MBmDc7mVD4FGxX0mV7GNRJfxpK5+4I3q4J9HPNNKea2JXvd
	B5B8cDdkshpfFAWdTY4nHDwDV35fUINqbabCNFnGhmcDzwkH0LJjksWTpxG2TTyI6PWH8j0LMA+
	PF4K95HoiDbxAla1cGclbQVg2iwWiuf2vDBhgTXXx6N4HP3VhH5OUdU5N52C7wDsU6+MUX6w=
X-Received: by 2002:a17:90b:4b0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39b3d78fb3bmr10362858a91.3.1788699665053; Sun, 06 Sep 2026
 06:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-docs-rust-num-integer-sealing-safety-v1-1-78057391302c@younes.io>
 <DL88SQWYU15W.2CVZB5NVSSJGK@garyguo.net>
In-Reply-To: <DL88SQWYU15W.2CVZB5NVSSJGK@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 15:00:51 +0200
X-Gm-Features: AcwNN1V5mxKY1nCNtgFC4yCkUEO9yjGCf_R1y2SS7Sv5q6x2ZaYouPFvz1i7fco
Message-ID: <CANiq72kx-YPPEruOFdu-Dp7GX+8=Et6svG+sQtqEmmF7kpnVyQ@mail.gmail.com>
Subject: Re: [PATCH] rust: num: document why Integer is sealed
To: Gary Guo <gary@garyguo.net>
Cc: git@younes.io, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 2:46=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
>     #[sealed] // so that unsafe code can rely on correctnes
>
> would serve the purpose. Miguel, any thoughts?

Yeah, we could at least mention something about the seal in the `//
SAFETY` comments that actually rely on it, even if it is just adding
"The trait is sealed." or maybe a bit more.

Cheers,
Miguel
