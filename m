Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9374B2BEC23
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942627; cv=none; b=TRPn5gz7CtZ6veCEjv/FmpWXP2MrwliGe+FMVS1jt9qZpiwe0/n1MK/vATFkDDYyk77JAyZEf7ntty78mcRQaiV4qF2ebHexEAghIWdJWJ/phk1TVqZ2po6315xkuuvXutqjQnBt8MvTvGmQ7dkJQ/goMp6PNLgQAnLPnsg9kyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942627; c=relaxed/simple;
	bh=HDU1bF3pytAw2bYvWqTIIrNFDsE3a9r1wsIR+RF0I38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOuJh8E/IbpLLJBdxY7OgfFX0tdL1oP2zphIIPTi/MDjyxj/GkNZWyKXq2Rc7flwsLPlfVtYaL/p9RPYmxLqk8lFmzfojpoghc8RrMM+ZjvQY9yGYZFTANfhaiu+m5Yq8dR8L0mLKBCKQ+IcNNcm6fJ3hhHLrpoqwavqW37gEdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyLm4jwx; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyLm4jwx"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b4fb891df86so205a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759942625; x=1760547425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtxsZvw7ZUfiZlsMlvMyfedw4t0xzCAElKBhmmA01y8=;
        b=GyLm4jwxP/0XOX/w7UicKMISUGzxHtO0dqsU6LQK80hEuat6u1aUXOOW9eNN2lZYVu
         tQDLyhJO5/zOMFTN/x+vw+HGp8pBDbKstSccHf5Ar/h/EDkAS+k7/3Xx+IYOkzjonloP
         Z8pq3u1rmaFKyKARwuNSmVtWHDrwP7GrvryzqfwT1Csw7V0TriGGIhsjHJRiGVoaP4n3
         6vF/lw0JxGr1KumjhP+p3EN7/KwCYWLhqi8buTE2WYzH9CgXyc1U4aqt1/k/i3PYsXrk
         TGHADTPfN4H7jFRua9VyWln9bgEQgdYQVCM4i5PXZvYK45cWhrju/M8pEpx/45W6utpe
         HYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942625; x=1760547425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BtxsZvw7ZUfiZlsMlvMyfedw4t0xzCAElKBhmmA01y8=;
        b=Y7A239rbdI/JWFYZUWSZbzXIr5AMsmMEsiofvNsdj4WHOeK/J0AzJwLbjAAxyPEtIu
         /KDYvELXehy6gZZ3rUx8dxgc4B/mfRZ+rRdS3R1vpz/0FCItfoYOHQt0L89hnyGvEnY0
         SH3lez2buZb7dNkdcSC7Qtiv/LLZylQi4nc8kQoNx/hRfieaPeKmNPVsCT0BonFe/EbP
         owt4hiAMgKIwid/7RiO4/6S/txlg5tgrIF1pbV30iXwG/SGvUlTVZzveVNSsbgdBE93X
         oO7eLCcFOZHFNI/Zmk4XurYXI1xW5jB1j/0iKW+jhBE32KsWrS5esH5Yw/v/obEZTv0y
         IcNQ==
X-Gm-Message-State: AOJu0Yy0GFvW7RjRNt00K8kRYo/igFhm9uPHoyoUTSa91tzLMgqdk9gm
	Vghq/hzyiQOFHCoPo8ZqIB7+XSGuUGtFmcz5KOUmbDc8JBjW/4zVLXkbFV4nJazbBUUjXO7yMlf
	XONwIjTdf8td4To44TssQZGwl1xC1grFDYqSoank=
X-Gm-Gg: ASbGncslS++zAGamod6xZzmytLums5psln8Cu+JMTU18duFPONMHf4guTBxqaVXxGI4
	iUvJfmqwXL8sTMdNH6kQNLNnGizdeRizilHMfI12CMAWAYLf23Kf26ZHf6F2Ta0P0cA9fFwWpts
	dTtly9vTWQTVphqXs2chXYrIwO7EPLwlwsj1WxZO0eouDySb50Kbz3xzrdsUFPhltIw6rX+9P2O
	eYbMhjw8+XwdCjxGa6doyUb0pgvyf5eL4CH6vtFGYeqdxhp8Hzz+6kVZPax0/7dzmbFUBKVKt3M
	FrxDP1SRUXCm7Z/DxIDhy5A56GXNZrUQBKibsOvS0YCVRVc2CA==
X-Google-Smtp-Source: AGHT+IE+hV5XvZK2LLA5Zj8MS65c8DKZNoLYsUmppQ2+DVDFH0vWuOn4hQEUZM9Ru/QEpwQVpwGiPDgdVyGxI0qTssQ=
X-Received: by 2002:a17:902:d4d2:b0:25c:9c28:b425 with SMTP id
 d9443c01a7336-2902745c0a2mr34349905ad.11.1759942624756; Wed, 08 Oct 2025
 09:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008001253.437911-1-apopple@nvidia.com> <20251008001253.437911-5-apopple@nvidia.com>
In-Reply-To: <20251008001253.437911-5-apopple@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Oct 2025 18:56:52 +0200
X-Gm-Features: AS18NWBIne5rc-AVIeVWCfebGQh2r5eidrg652ppzGpIdVO4I8s2bzW85Um8QvY
Message-ID: <CANiq72k5f3f8Kys40sRmaKR8eeq8-4DsDkWDkwMPZ0A1JSFj8g@mail.gmail.com>
Subject: Re: [PATCH v4 04/13] gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 2:13=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> +/// Example:
> +///
> +/// let mut buf1 =3D [0u8; 3];
> +/// let mut buf2 =3D [0u8; 5];
> +/// let mut sbuffer =3D SWriteBuffer::new([&buf1, &buf2]);
> +///
> +/// let data =3D b"hellowo";
> +/// let result =3D sbuffer.write_all(0, data);
> +///
> +/// A sliding window of slices to proceed.

Please write documentation in the expected format, i.e. using a code
block and a header:

    https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

Eventually, this documentation will get rendered just like the
`kernel` crate (and the examples building/running as tests etc.),
which requires following the expected conventions.

By the way, is the sentence "A sliding window of slices to proceed." cut?

Thanks!

Cheers,
Miguel
