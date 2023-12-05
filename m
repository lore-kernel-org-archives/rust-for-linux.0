Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="dAx0tXeU"
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02E9107
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Dec 2023 17:53:35 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5d226f51f71so56886207b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Dec 2023 17:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1701741215; x=1702346015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8jNrMNgbTrnkfWx3nULTLfx0bs46KnpcuG8uZ6C8IU=;
        b=dAx0tXeUav4vCx8w2NKukVL82c39vfvtqbgGlo1AlCdMsP48A7apDxFptTIXQDVNWK
         JtsW09r8st9dyjAGA7yrD1PFcl/ICx6h2nVFdF+xwtS2P7CtsvuffnqHGXLDZB8HTnYK
         1HhL33aRv1wg5SR1nR+j/99Vw0pRjz/Fzi+4TFT68k8e1KsS/N4UbEI+xRtTb8h/LFNA
         MDGEgp+D2n0OTV0+Lj6lNTrgNFyKB2gZVkodwGG71wVPIM28FW20I6rioyR+z1llcePL
         KZuYPRpvBhlAB978yWVv1DTh5kv3FPBK1w59cV451xqL8rVCrDMomm4Y6VRmGohOnIfT
         8LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701741215; x=1702346015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8jNrMNgbTrnkfWx3nULTLfx0bs46KnpcuG8uZ6C8IU=;
        b=coSfTTl1eH4goIB0axsW39Dp3x3vjAhZHyUXtpvUVsXEnSQVUl5vP7ZdKEiKWIiz7J
         c7LPJTM9LFfaU09WtfQgElDWjQlZuiIB2OvJUs043W0BYARSp7jGRlXdDgkBV/IWLKZA
         pL+dmDm6hZqmRkIM0TsG4x1D2b0WbkGdwyaqwEeHqtmix2rplxz6Nujsx+KVFT1O/BBS
         7/brke54rRNNtUFzrL6jo+ZOPj6yih1dLLZx0Otd8Vc0Wo4B5WVNHZSKLuoWMfXKHIdH
         nTIgjSqD1Adg4cTrulwpI+w+12/cdiqqot31F83ZFw0JYJTdanAQV6pgORGU10dPGnWh
         sxEA==
X-Gm-Message-State: AOJu0Yzya9ygtwgvSEv1RHDiLcbl9vMQRg1sQ4sz/3jinTj5LsUq818I
	P5HRJAuPztWmbhwQlsVu0UDpUXobDkXPhH6Irl0lsQ==
X-Google-Smtp-Source: AGHT+IHnoDRGbhlPk6efn85GfCKyqfCuAs1Lh9iASIj252OaTDkfUcx/t8px8F2UGrw6hxHEA+JfoI/1zyIwP3i+wmA=
X-Received: by 2002:a81:c504:0:b0:5d2:3a44:846a with SMTP id
 k4-20020a81c504000000b005d23a44846amr14106158ywi.46.1701741214965; Mon, 04
 Dec 2023 17:53:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231205011420.1246000-1-fujita.tomonori@gmail.com> <20231205011420.1246000-4-fujita.tomonori@gmail.com>
In-Reply-To: <20231205011420.1246000-4-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 4 Dec 2023 20:53:23 -0500
Message-ID: <CALNs47v4zq3-W137iEzEwdd63iZNA_iWULKHWJrEA42mzRC8+w@mail.gmail.com>
Subject: Re: [PATCH net-next v9 3/4] MAINTAINERS: add Rust PHY abstractions
 for ETHERNET PHY LIBRARY
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, wedsonaf@gmail.com, 
	aliceryhl@google.com, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 8:16=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Adds me as a maintainer and Trevor as a reviewer.
>
> The files are placed at rust/kernel/ directory for now but the files
> are likely to be moved to net/ directory once a new Rust build system
> is implemented.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---

You may add:

Signed-off-by: Trevor Gross <tmgross@umich.edu>
