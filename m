Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C0811706
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Oct 2023 20:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCL37XoQ"
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4F6C5;
	Sun, 15 Oct 2023 13:05:56 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a87ac9d245so3576317b3.3;
        Sun, 15 Oct 2023 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697400355; x=1698005155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0uDPedKwambTSit9joY/IEh01Xyu9n7KFhddeezX9E=;
        b=ZCL37XoQPrcLdWZEgVGkU+yb2x0lJ1tyDqTRKmQHUD00gTz4A7kRGiu3i2JMh+51dy
         KMmq2RSyVgEg35bFV+199RVbQTUxoyhDFQgNX8z5Ef3U/323G/xUKq4c869BWNN/+70C
         8ap2KTAXlnTCe9VxRTMyvDGRXCAlR5pZhCBnLEDMK7Hc3Fg9swsTHucbywZug9mCO7Z8
         FUYZzzpmvu4nXEwkD3GvIpceV6R40hEtBMQFDAgBNspzjlzz77i71YDjh1Uyh0Q8a3tJ
         TIdj5bMxCphP7doQ3vCp6W9hSLxM3r6Rnjpd98zx+q9SbrfKyz5c02chx0qRIjd+izyu
         pFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697400355; x=1698005155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0uDPedKwambTSit9joY/IEh01Xyu9n7KFhddeezX9E=;
        b=QP2Qcv5CMb1xaPMA6yFBAAVHY2Xn2H7wjYDBzFYf5G2NjfqUaAPE8aRfQDLiUY2p8D
         s6s9yGP+s+ic6cTzxdpXLxPGCiQPfnx4+MfVZWZ/Tvlw9l+WTf1VnAcCnWX2nYAM2iLT
         MNGIigk0XZjXYtCoP4j8UDFb+SlIxotqculpAmKwaweSXLgbHRx89AzpVpMLgJocUM8V
         4JblkxI5N/ZutrbvjcT1FcbTuoS3228uZh+RfWnU6rxQtvPC42oQixq7QD4UIly1FuaK
         FVYEEMTsd2xO1gOCT0WY8kfLtc4tOviJUnhaFcVifJrUAmjhpgzmcvrwl9pfAg9lMQNI
         QkUg==
X-Gm-Message-State: AOJu0YwRFllBtqdS5mXJuqJQSXIcNt6N6Bh1vBk9jl1n+lK97SJDfDyu
	2VDByiiQ4gVAhqnp7/Ub6zQBiUp2RaFnR4GsWn0=
X-Google-Smtp-Source: AGHT+IEbO8cUaINacxxQPJhUEKGsEQeu18uodgtQKZ7CeAUwiM/bM43eHPZi19T2I4Xr4XTJdUs+66D0tiShavsoVgk=
X-Received: by 2002:a0d:de85:0:b0:59b:c0a8:2882 with SMTP id
 h127-20020a0dde85000000b0059bc0a82882mr33669450ywe.46.1697400355256; Sun, 15
 Oct 2023 13:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928205045.2375899-1-mmaurer@google.com>
In-Reply-To: <20230928205045.2375899-1-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Oct 2023 22:05:44 +0200
Message-ID: <CANiq72k270922_ragLi3WVHJPAS0piTc-YCu9YaNCZ_F8ioNhQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Use awk instead of recent xargs
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 28, 2023 at 10:50=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> `awk` is already required by the kernel build, and the `xargs` feature
> used in current Rust detection is not present in all `xargs` (notably,
> toybox based xargs, used in the Android kernel build).
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
