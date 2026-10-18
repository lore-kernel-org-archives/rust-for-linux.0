Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A99A41836E
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314465; cv=pass; b=CkMw75uwrqd9NZKAWidY+XouaJ3XXdoajTPQzBQaiNhErEo62tZxPGWkepd6+bd2wJRwSDgqsTcY/UYRH5/rjmPiO0PqJyJjPfHYlwu1HBxXPm1wtkoGy0Imlm4NUoFo8ZQdBN3+ImHcNPdIyRU4iYtMILbGKX2QgXg8rqHUryY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314465; c=relaxed/simple;
	bh=YKEQOWHI5G+jXotkQs4G+mIlmKX7piHSbOJfVNpBUM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IJ3kbJuMwmqQrCrCfbLrQkp9jyLxY+Eci5WkHSYZnKC64wvCZCqqBitr/zgnDrSQid3Sh6eNpuCuTGHuGJ1DD34t2JaTltirK4rNeAyiMb3KVWxRfWYx1yGHkSV0TnKpW6kjNYSUnhf5vi6sX/0EYZMxsZNqgPFos0g0Pj24pnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcfr98Qw; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcfr98Qw"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35ca5244753so129339eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 02:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792314460; cv=none;
        d=google.com; s=arc-20260327;
        b=FAIyGUwwNsJn9j2d8hi0Ohd0DW/z3W+ytgk9lJtV2x0y8NGbYk3q/jznZHVMwdoLeg
         3Uckc/y2HWqotOcq1afFolo3j4OY4+UyGow/VHXnmFUHaHPn3Wf1q3WwIHH4TpfJgiFT
         mwgKEc36la+lcImgFIVlLwEtqiPmax8tbAqrKeMt31FohMzatB5BwdCRiBQbq9T3NqRU
         SZgL/Ot2K2gErOpCXbrUBV0c1AsHkJP0o31xMeeikZlOhknxkmUYG34kVXsGL36XjdLe
         2+XTN6Jyff/ZdNGzdiAgwGNkAL5F7ZBbiXKwKvJV9P9VZnnDJqDKaFkmDR7Rwf416Tju
         a+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcRmzYJP/PyS6UQzb5xqFQEGXy1l3DQrwtRmUpt9Mjg=;
        fh=snlJMln7bSa7nNJ2o0TZDSzejLA2gpmXzpbaU0GZOU4=;
        b=KvA0N8kAlLUkkeZeX9qRHGZS7/WYSINoAPPo2aiUcsnSdrqvHx2Iif1QVP4nAMx0Oa
         SL35camOu1P13KgbOogPMlSegX5bgptGmWgGrImn8RTegx2eRk8Xt+Fpi8B31xX4TQMj
         jGwdcp9NTG61/KQc0LA74pLUXp2mywxqmQiJJQtuv8P1AdUqGlLu54TK0vOrG4D9r5Sy
         kCERJYDt00mt8M0WiP9YSCZwiwHoShcbBWms1RPZPUXTUuOd4SQ5642Nx2aj2JB8Ifr1
         YtPJk3An/+174rU6JRYpplrDBp52S+b2xJvQRoTY0cS0slYymKscsLL3jNAKbhj/MeVI
         GPIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792314460; x=1792919260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kcRmzYJP/PyS6UQzb5xqFQEGXy1l3DQrwtRmUpt9Mjg=;
        b=pcfr98Qw/lKB1Kw0rrkVjwBXNa2uAK43f5bp5Cp7GjenCLWdmNo4ZPyicMFS2VEiZ3
         Eg7wh44fXMmeb6ZANNJ3tEAp3C9peFzRHPnb0Mo73K6hOqizwfgHns0OC8V/BEj7WNn8
         RSJywlzhKfEacky57Rg2qlhAa4aEYDbaX8zSMzAutt+QbRlmGw8SAIW5Qbi2F2Qqqk0v
         S4DhhkKdLg3v82f53s0fzGBI++G7iJz3RMgpkkR918IwvlwMYw+qyCs98D5byJDFCIuX
         l1Y/Us5pFjQxRQVKOK5cjQjY0S3d/x6uDHtfiyYk9Gz7WxDM1thgxqNP/XLjphMlDrYx
         xR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792314460; x=1792919260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcRmzYJP/PyS6UQzb5xqFQEGXy1l3DQrwtRmUpt9Mjg=;
        b=CcgrIV3DL2EsebD7HghQGWE4nIeYPlgFnKr5YoCHvFAbYyKy2ve/81K8IDrHInwyHj
         fAtEqMciCfcpCNLuSbexbxgTGBMS4ZCc8xH92Cmsc2fNZ0JFSj5sEClHS9zyJzppHyfo
         7xAGvDoUBfPN/NuFsaTDWU1KhWXl8HZ0t+cU0yEFsHvRQVJt46l+i7xEVGO7/DhM7RTG
         w/PlyHeMdXI7fYwqAk3rH7FjPwubqiWRWGCCb+t1NrRTowfMO1uU47h2+oYdqEtPZWSD
         BQXeILH7mIYizrQ5MBWGB6FdFbl62v7MCKLXhwK4yk/3GLd5hD6VIiCuqdyJoXsI/3HZ
         4Oug==
X-Forwarded-Encrypted: i=1; AKwUvBxwuIEwyK8fIpP88hnAL1hK34Fw4KKxnNgII/fJ+geZKYfUSFV8ontneAcV4IVUZzAz8XYpo8dd18PpKDUivQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJSFAhoioOavJ1nG3yPNc35jNNRExiCBKMUzcpZZM5baBH6UmB0
	IkgEwaFGRbCx7OjfMDuxoMRfzSzI5tGmuMBHyImUOWkmudS0Dl3JDfxGWEJlFnUuRuKtqBUDlaI
	vN8dcLHPEnLUgRxAnv7ijQMNOypBtJ80=
X-Gm-Gg: AYBFou10zaYXjBGjgnDtV3MbXYI5ax9RnJwCO311QTzA8KeJgNzq5CwFfarKbjp3oe1
	b7w3qOK5NTNwGa0TuXulQIhOcBnVMcc2i0iqX5nS+2fyHuirSkt/RO5DhenV7RHxZFMLOB5qG9N
	zKE3i4LtES2NhYWn9pWPRCeJt+HKzg9015e8L0jBHzYjWqnGBCjTqzLdwoqPy8ZyxweSvga/e1N
	QIVPzMbqUmPDobRIFtbH0MWTMN6DoALAaT0nwgduI+UOiT4pniNnsYdppCpJEqFUiAwpbuMuaqg
	fxkj94/ugCzOJsPSV8af65w0G7sCDptN+00cPCXfRy2UA2L4lUX/HhRiE+IMkY6aEZcMf1j5WFJ
	9JJzHnIm7jGeUkvQLYWU4nIQWbjKicSsZ/gXH0TAG4t1ZQ3OFs8Ldke2vXmknEP6qckoUO+SLMG
	G7BaCNrMSThY5JN8hNd9YevROTUFJMviw0vwOD0x1OB10z2kHHBVI=
X-Received: by 2002:a05:7301:2706:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3619b601fbcmr10832463eec.0.1792314459968; Sun, 18 Oct 2026
 02:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017-rust-bindgen-workaround-v1-1-fbd99504b4b9@weissschuh.net>
In-Reply-To: <20261017-rust-bindgen-workaround-v1-1-fbd99504b4b9@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Oct 2026 11:07:26 +0200
X-Gm-Features: AclHuK-EP6tGZQJMqUJtG9M6XVncdRZpSb6-mW0FhUlz_0MVFccRLlEStP6Fc6k
Message-ID: <CANiq72nni+Z9WMUETTDuWmsb5_KR0CLyDu30udwqgc-abykY9g@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: drop the Rust bindgen workaround for BTF_TYPE_TAG()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 11:55=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> The referenced bug was fixed back in bindgen v0.66.0.

It is tagged v0.66.0 for some reason, but the commit is there since
v0.61.0 -- I noticed because I track it in the live list:

  https://github.com/Rust-for-Linux/linux/issues/353

Either way, yeah, it sounds like we can drop that very old workaround, than=
ks!

Cheers,
Miguel
