Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5AE230BF1
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Apr 2025 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593190; cv=none; b=HGkHxknuTLEg2P1Wd5EGtUtrbbhqUbNptNbwkz+H0YbF3JGXyhsn2B6c553YwG6eNSxlMdR/yNMRI7wQzP14qqNjGzri/VBCZwya5Xu/LXawNbJqdZ7MDV/DB3wFST9PjhtYOlWbIdbp3bnkO+bN01F8KhPeMwhb6pVMcrCYYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593190; c=relaxed/simple;
	bh=ufmsUkq2RlsJh7hoqNblsh0SnY9YJUqlfa19bkful10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bK/9vkvRsjCtKGua/7+Id1KQ0bxX9NKs+Wn46xyV+NP+uhmvW8nDOR8CsScMfPMdhiH2bAg+AgdNSUw9ITthYuD51C5KbOzj/m6/0kLXAQrVIwbVj0U15GKbOVG3DkdNrOOQSpCQyLVGYOqp15wesEkVxKqH4IWnO03KfbpLsd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrJOdTQK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrJOdTQK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240b4de10eso15878285ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Apr 2025 04:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743593188; x=1744197988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+3JIHk6qeYnPpHTfLJu4diHVKQdaMOlAj+yZMPuRL4=;
        b=WrJOdTQKLIP3o1fbwkGI2hSAcvhTCZSdzeANA5maTBprfVBOZhNX2UPl1nVBOdRaMO
         pQxmdNJMuDxwPNQcZugQuPk5g9b+SSLmTurf/LaDK0pbIW3P9QoI44VrPoBpt9xDheXY
         3SQTudjKEZ19OYmlvbrE0IWAw3UYGW/AwqLTmrh8qv+Cgun/e9qjAh592KJE2L3ZnnHf
         O/PwMkvdY5auIRMkjje1Z5w/uMPiB9+QoMJ3Qa1a/TKNA2vF9//G1Gb0iBHST5O80AHK
         V7NsbAuMzdjIGYm7ZeIbLWC4vNadI++e6XaUSZSloHGBTX/bhNbAZyS3jK+mJlniu7Fw
         GpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593188; x=1744197988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+3JIHk6qeYnPpHTfLJu4diHVKQdaMOlAj+yZMPuRL4=;
        b=u1LFMiDI/kiSqnpUbINbv9gf0UX/ycc/fhkPbeucwYcTraXcHMQPswx4kQsm40G3AL
         cT48PzddaSO3ON/aqv1NKeFcoq4gSNwZ3ilc9TiGWToubLOREWAWXGnim6e56CoRRe+D
         fdqnVn0e2RIgSPO+wdVXBE2xgDMGEQCapk0arilVAwEt23QznBNkxTckBo7dk9zNDoaj
         tmDB6g9cJPTfv+nz0n0bOJY+d3ULpKjZSQ6cXHC+6uCid/lu1nL2CQQKzFtT8G7/Y57k
         ib2bg+7rwVUGoCPMPAW++KQNcJkqs1oxKJEao8M7hpQ9Y/VKUPzeDFScdJIZ8PokJ+rl
         pZsA==
X-Forwarded-Encrypted: i=1; AJvYcCVsEnNfpywiEc2ieyLNBpL7gPvqghn+DV580k+krDrVA+Rfe3owwSmyyj9puiWX12V4b3c66yBwmIsiEBQTLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7okqYhbTQRAb/vcn05YUArNDr0DPCHqJEMw6czgrxKUHm+jAg
	xo2I6xf1IeE70nq+b/yNTRCduAGPOUZD1B4ak4OcgzsqzdAFv0Pw9LQ+kMWlav4QDs/u2ud4x9U
	StJbnTBtFVIHsAFZOvoJs/VIojX4=
X-Gm-Gg: ASbGncuivKApgXrUwg8+KZ/JlhQNR7OzaHKDnY3sJkI06PundfXPIw6LzoVWz72pkJM
	u45ct4n/NmDeBVDoKsS5ZrCVPslfcf96mKnb6zUPJw/zZQaMbLPqn4lcQJpbKjPxZlPHPS1UF61
	AOf1jtMKK4K4ro+HQ2GZkqyBJSvA==
X-Google-Smtp-Source: AGHT+IEWn8SENIAz7BzYUhZsxKoN8J7qTMPZWYlZoPySurYh884PHngCKckigC0Rh5mvVv/8ihNyou9Tvka05rrvVeY=
X-Received: by 2002:a17:90b:17c1:b0:2fe:a747:935a with SMTP id
 98e67ed59e1d1-30562e80ac8mr3308934a91.4.1743593188502; Wed, 02 Apr 2025
 04:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402104759.1764282-1-igor.korotin.ref@yahoo.com> <20250402104759.1764282-1-igor.korotin@yahoo.com>
In-Reply-To: <20250402104759.1764282-1-igor.korotin@yahoo.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 13:26:15 +0200
X-Gm-Features: AQ5f1JoFtl_TI2VL3Jlg1_Wx3anLjKV2ImhWr-rKocvPGy83H7AF8iTrQTuuah8
Message-ID: <CANiq72mysmMph1zGAxPKDY_FixbRRa0kS3pSqj4Qhq6Yjqq2AA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: rust: quick-start: update Ubuntu instructions
To: Igor Korotin <igor.korotin@yahoo.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 12:48=E2=80=AFPM Igor Korotin <igor.korotin@yahoo.co=
m> wrote:
>
> +``PATH`` needs to be set when installing rust 1.80 with apt, e.g.::
> +
> +       PATH=3D/usr/lib/rust-1.80/bin:$PATH

Why does it need to be set? i.e. why not `RUSTC=3D...` for that one too?

In other words, why are we mixing the approaches? We can explain both,
but mixing them seems confusing.

> +Deb package bindgen-0.65 does not set itself as a default, thus it shoul=
d be set
> +explicitly, e.g.::
> +
> +       BINDGEN=3Dbindgen-0.65

I don't think this example adds much, since we already show it below.

> +       make LLVM=3D1 PATH=3D/usr/lib/rust-1.80/bin:$PATH \
> +               RUST_LIB_SRC=3D/usr/src/rustc-$(rustc-1.80 --version | cu=
t -d' ' -f2)/library \

Note that `RUST_LIB_SRC` (and `PATH`) are not needed there, i.e. those
two can be set as environment variables.

Perhaps we could just add something like this to the existing paragraph:

    ``RUST_LIB_SRC`` needs to be set (possibly as an environment variable) =
...

Also, weren't we going to mention `RUSTDOC`, `RUSTFMT` and `CLIPPY_DRIVER`?

Thanks for the patch!

Cheers,
Miguel
