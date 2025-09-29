Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1270F30AAAF
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759156708; cv=none; b=WJnITyR/ZB2oehnNaMtRUyR1lkw0WSrFDHRecDkK8dfllhedKXInRBm5czXZ53Ebtxz3M0OR/ldPbOpEm88CEHmM2euG501jdnrjdyBBUdQJJvWZVvRLQmfkK/qzhBhTvRgI14o6qtmZVPPBhJAfkcf8Fq6rf/3dUUR4xhXifHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759156708; c=relaxed/simple;
	bh=6wxzuRD2+UgfGobNcQjA07eqzttSMbasZ+Ip7tu3YNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIm2ShUHhxrU03+R+TUKuLIlodOACERk1n4d54FOX1MjNguAWp8DitdVHOFiNZcZqDBC8yk3ijrXhbH/8UkZuemk4aCgwLEOdrzhOf9b5vdxXGa2zzC9vbDoVdEpsKDQoiz5imFqdt7NyHU0gM2BotGPltFptpEAnVqAdqBzRiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEN5ky2g; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEN5ky2g"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-26e81c17d60so9276365ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Sep 2025 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759156706; x=1759761506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wxzuRD2+UgfGobNcQjA07eqzttSMbasZ+Ip7tu3YNU=;
        b=eEN5ky2g6AYmWBueMlsqZnRnrGXeb1EBB5t1k5PbAxfA85oRwI6LJes4SBoHQauyqT
         1UvAGJvHYXr7xpGxkhePf71Io9ag/lZKGRxx4C6GIb4ZWfHd7hnsM1yt3Hu++RXQ+6bA
         WJaj0fVkGl1pIsWXZkzeuPyxVBqjFvaiLu6zUYxWxFLoRpQCgLzw4M8ZhNqD+Hhp51bo
         X4Xt2Y0+DATNNAVRv7aMHYr2zN6l6fbdJFmYfHBt6LpqQDhOJ2offK6B1bqayKludhYV
         ilg5QFaHOo+DcRQkhCM0D2ItNgDdAbHpfnRM/2XQfz9sNyKY/Id84goF6PQxPtq6+mvz
         ad0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759156706; x=1759761506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wxzuRD2+UgfGobNcQjA07eqzttSMbasZ+Ip7tu3YNU=;
        b=XNtgbR5IiG8/DGD6+RA1D5Y6cDcFMnmnXI9aK4vY0QsZ+JrnNcTh5+gdQ4dt4ruPYW
         b3p+muFrUSlGt3QH1o8hzihNM69/rtUGyeodn0uEGwAuLt8x8nIo2uMW3QKgfDghrqoA
         bLm/7bj7t1kAYxfIVTGAumrEVXamTc5gU9LQlwK5/oKJaCqIRqS6uzCFeJHqwZ4FsX/w
         XR6wBpAZ3i8fypYmE8p3mPsfaV9C3ILjxa6OllG3mwdJ8CO6p0h+EiVmfRd3oZIN6Is6
         AjR9lLRI/FKMsw5RVRJ0I3uGeakj068dPBOH4aT2IBBH7SjJSRr8wKFNrRVr+xKEFJ9x
         MFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+MFmzwBRep25/CXrB9jZ/ZdCd2H1rmimweXZRH0uAl2OnkcSVaEb2dynwRmMQIaHjH6BKmFGGHQodNmo1aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywudr8Iadc4zR1AdMVIPol1Bypfyij6txwJPBo8MwdQLHVvg7r0
	CyaVmylAdHPPVxf9oI5u1FCWvsIwwsF54rZEjDiygoDBXhlkMguWOGqYnXv+5ZJyeGPhCD5AXnG
	TLBEBDETq6GXoObaCORVlGjOkkjWPj0o=
X-Gm-Gg: ASbGncsDx35P5owBTFhtPv0ayvfKdN3f3SbzA9GmHagPs++6edE0JyhK+6LzNogsrSy
	4Cpied1IKaCWauKMQ5PwuoZy0b2xO3ig+tGjtPUdvI/mpUIAe8gfh0RywG7WEXjXXtQ3sWOyhvd
	n9+Xuohb0q9Kq2h4H0PhP6E3zfgTLRMCHyDSYhxB94WHZe8DOizZASRj63/AsnOESms2EBaqmhv
	7ZOPp3sG6YpO7M9jkeimvE4FRe7p43Ptv7BY74ZiEXAKpFRof0DVQhbnJ5flCij9lEqYgoa9ger
	fvGwTMR7pVW2mIgPlOsEdhkSeBls3Me+KbA7ROzI9sYrqCE=
X-Google-Smtp-Source: AGHT+IEuajVdRt/zkJ/UX7z6Wnp/1y6NOw3KWFiaL0wSJ/2A6J51idlMClGnkDk/Tn16oxOvOKsoW449qVwpqNver/w=
X-Received: by 2002:a17:903:1a68:b0:275:c066:33dd with SMTP id
 d9443c01a7336-27ed4ab64a4mr106185325ad.10.1759156706206; Mon, 29 Sep 2025
 07:38:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250922113026.3083103-1-apopple@nvidia.com> <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com> <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
In-Reply-To: <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 16:38:12 +0200
X-Gm-Features: AS18NWBU5ftnpGhJqKd4k_6D7IlxaPNAUhkxayMY9q8yLGmTLeUS7TVSiAU2z4g
Message-ID: <CANiq72k3qkj1HxjnCoknAdWhdM7O1ZBkZDqBsVS7vxYH-tRCWg@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue handling
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 29, 2025 at 4:34=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I think you will also need to explicitly enable the feature somewhere -
> for the kernel crate it is in `rust/kernel/lib.rs`, but Nova being a
> different crate I am not sure where we are supposed to do it...

`rust_allowed_features` in `scripts/Makefile.build`.

I hope that helps!

Cheers,
Miguel
