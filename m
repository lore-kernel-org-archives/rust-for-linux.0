Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B63266A5
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 19:54:05 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7B726B8
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 12:54:04 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c93638322so301127266b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 12:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694721243; x=1695326043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdaF9sZulanduxkh9n8uEMipD28IGVDEKjXvShphNuE=;
        b=epHONwYd4LMkz2nSHE5bnY8EpGwutw5zIeCmZjLAlHUUsGSGS1guFyWf8xRelVMKbR
         2RgIaeLkte99PctzkhNd6jVmxPfLPpXQjSeOqSu3zsNbAL3Hs+h9qMzhQZxbKYd7AoJW
         4ifOLRjelRtjxk8DqtaUQjuE2FuOeBMDTuTlkTKJ8CovX8MTHY0sGIzBt3PHYCRu4/4U
         R54WTIQOxWXAqWpd3LaMlRQt5T9S11f1mhpIf0s5SOQIJ0Bn4jkbhzHXi+TvUgi5uuxr
         R2zqA/3knXmX2tnigCO7Nx3ZqYTy0GhbCBV7bbZ3iKKAlEHaYC/tdntx4BT/nWLfcUpw
         5IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694721243; x=1695326043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdaF9sZulanduxkh9n8uEMipD28IGVDEKjXvShphNuE=;
        b=Ss+jYKtClhB0t90WSDKZuL0Wxerpe4Bi6ryWBWSpFq4Lmn47qxicssqou6e4vqdLlh
         b9fSRH0EieLfMFxYsnTx3QVFQ7kfbEKlia3Lr45J5h35aMT9K6dhchycl0FqCoQWHqgE
         uuUF6EcUB3bKsRtZLXMxtuNwp7iYk7Ohwi+aw0wSC32e8/SXtj/XhWDIanJeuWrX4F/K
         kc4Fj1pKs698Vwm1fnNBSOOKhprNT7mIKZbcZg8I91Gm8JELpqvj9IF3IjyqDQjiwM4a
         m7RjcYs0cF3y0HaOufwgYFo/GgVhZcKKyhRcQAnY8l4QJvU+rmvPZgdP3M0z8qoscACs
         6AzQ==
X-Gm-Message-State: AOJu0YzarDJAYt+6YMsHj5tqPYwjjq2LfrSC/BTvtOlbCcocgqHWpIqO
	lahZsfLdl42asqq/9k0f1KHwY0dGBmJl2DSYkTjitIhLF+jQh9+lS78=
X-Google-Smtp-Source: AGHT+IGPnu0r2IKtI26hTKgtgoMH+APKLiGAYzjLmiaAy4p5Bj9JYm9ZYvYA7ZMBYY9loVVaObg2ssD8wlIhUlEtGTE=
X-Received: by 2002:a17:907:7608:b0:9a5:9f3c:961e with SMTP id
 jx8-20020a170907760800b009a59f3c961emr3922766ejc.18.1694721242752; Thu, 14
 Sep 2023 12:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <CALNs47vAj=dLtAUiG0WGKJoZZuWRCXF8Wh8zPO+O1NUJ68Z0Sw@mail.gmail.com>
 <8a7e010e-b99a-4331-b7c4-e1c9b7782e94@lunn.ch> <CALNs47vv99ri+2w=P_T7pYxH33x-6ftAyS_CeQqaRXOw38-jjA@mail.gmail.com>
In-Reply-To: <CALNs47vv99ri+2w=P_T7pYxH33x-6ftAyS_CeQqaRXOw38-jjA@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 14 Sep 2023 15:53:51 -0400
Message-ID: <CALNs47sDeb-Z_L3sJEF7B=-U+MRJwwi72jQHgNd7V1tYf+Tg9w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 3:42=E2=80=AFPM Trevor Gross <tmgross@umich.edu> wr=
ote:
> I think what you may be asking for, and what would be ideal, is a way
> to do all of the following:
> - make sure that every C enum variant has a Rust representation
> - match that exhaustively for the conversion
> - panic if we ever get something else because it means the C side
>   produced a bad value that is probably causing problems there too
>
> Unfortunately, I don't know of any way to do that. #3 comes close, but
> then you panic on "value added in C that we just forgot to add in
> Rust". But maybe this is okay since it means the code is unshippable?
>
> This is kind of a good question for RFL in general, maybe the others
> have thought about it more.

We are developing a few hostprog lints, maybe this could be one of
them. An annotation `// CHECK-C-enum-exhaustive: phy_device` or
similar could indicate to check that every variant in the C source
shows up on the left side of a match pattern.

This would be useful elsewhere too.
