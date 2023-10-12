Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5776C27705
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gm6vIwL0"
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC870B8
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 06:43:41 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-49e035bdca7so328449e0c.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697118221; x=1697723021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5UxfBdj/6JrF2qHbkJWuAP1+z4BtgpnwOECrshG7uA=;
        b=gm6vIwL0lCFg1F/OVNH2S8Xf6IlaRAhDZlruNt+wJ5yFeMgkY4TB9N5EqFQPtV+Y+o
         h2npIhs8HoAL0duy0bS8qY2QDxh+Km3g6Oxf4UdnmTt2dnfY/wMpAbNxype1tsOWTzPE
         7c6RTZki67ukHP7z8fhZEGdcd0ds7tOwwTJcIILDBortEpFEippIkjaxyanX3KGjpkF1
         PMX4n/CTL6H6wmscOyEEEFj1KVAWXoiQYb8KWk1PUITcaR8ad1iqusnzM3XiV3VRbRzf
         QBmM4Ifvq4iOdsq+KwwiF9umA0inZtgT7OindRF/6iw9KL/zRCNQR1lb3aL8+eH8BxGY
         6tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118221; x=1697723021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5UxfBdj/6JrF2qHbkJWuAP1+z4BtgpnwOECrshG7uA=;
        b=P/qPM9VC6a24KJvc/LPRzgVBOT5Yg/y/83Jt9y2IT4RuwFCzwW/2DqDCYltNk51GvL
         8Y5aDrmUIwiJIFZ/AD3L02l91hNw6beA8cTgKCuvybJJXECMVJaC842St8XpXcTAdYwh
         GtX2m6QWnS4zSEX3bPvF1mkzRyeeT4okYgtA4pqD2aUS8dlT1LHzy5io+OZbO2Nrzsyf
         C107qLTGrvRxkaolRakgfaJ4vPQZk2Xkg4oeT2rot46b2NC8aExODmOLp+BX+t5XS7+j
         InZP1loqTOgiiR8Lc4lo2imTOsov5G+wPRlhCpB7uEyzENj0lvFjYOcFhdWF4eNROdgW
         rU/g==
X-Gm-Message-State: AOJu0YxDgeFYyO5R7c03Y4wPp/u8lpBMi7FSyu2h7IHWnz4npDg6Eh/s
	s8qQCz7mN1hAbS+3F44kH6Ds9iVo5kbyfgsOafLvDg==
X-Google-Smtp-Source: AGHT+IEtzmuyswh9BkchHbtxmapjfde5JaFYoo08OhEksgVyX9vJ3Lzx6rWSdYd80NGUK2zgO4emVZenhzszDQU6FQo=
X-Received: by 2002:a1f:ed41:0:b0:499:e671:1682 with SMTP id
 l62-20020a1fed41000000b00499e6711682mr20231744vkh.3.1697118220736; Thu, 12
 Oct 2023 06:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231012132131.300014-1-benno.lossin@proton.me>
In-Reply-To: <20231012132131.300014-1-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Oct 2023 15:43:29 +0200
Message-ID: <CAH5fLgg=AmuR-93vuVmdr_oVUYCYuYas7Unrm0UFtQ2Yc3x6wA@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: improve `#[vtable]` documentation
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 3:22=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Traits marked with `#[vtable]` need to provide default implementations
> for optional functions. The C side represents these with `NULL` in the
> vtable, so the default functions are never actually called. We do not
> want to replicate the default behavior from C in Rust, because that is
> not maintainable. Therefore we should use `build_error` in those default
> implementations. The error message for that is provided at
> `kernel::error::VTABLE_DEFAULT_ERROR`.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
