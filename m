Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A515A7F
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 10:11:12 +0000 (UTC)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1468FF
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 03:11:09 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d85800eb234so5114323276.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 03:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695550269; x=1696155069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Er7k0E+wtBAGESoeHvGTRC4ArAHTaqiexzIfXS3/nVU=;
        b=Zt8ntOJPBtPXAzNA5S3l8w8tZoC7rNTNr7D63RUFYAQ5SI/44OXjS+rtffa01BlwHC
         4nG5OnvuhMJItXcAq1GWx8hbA5B836xVcMDRFTYQFIZAyYkHeWyZ2Q766tVEzCPwazb1
         TMWKrjC1X30igpmkYDIeWu4rTICC4qyi+bhqMwETn49UK/NTB1wUIxjjOiyb1LLkUuF3
         onxkcY9w5bzxZRatBu6NwgsyQSciTLWcVlzlNUQ1CUylY6BN2ViX9ryltyqM43TxN4Gt
         SkWaTMJsC7LRSxI1/qZQpdbviN+O9cMmTWoAFMWbDoAW7RtqAbChzuW5om1B8ItbahCK
         qZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695550269; x=1696155069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Er7k0E+wtBAGESoeHvGTRC4ArAHTaqiexzIfXS3/nVU=;
        b=dxPXR0nG1MZR+Ynxhc1gkZDxG2vRBn7n76AvHbHvc4FWn8W+j3ilnj2YSkfvXrfIIJ
         uCridA4Vt+fwjsvkjQvRbGIfKj6xCSd2827v4JnWSGgiZsVxrFVyDoypdNGgjFLOuPo1
         yF1ce9VJSFATYoCJY8Qdera+0IGllwFqYmJhs/Wd6npqADZAl11we0KXX7SjOGukBqB6
         4WSIEetkQoOfPYU4rLd3nr+D+Sjh2wYZOsD+mlt+f3uoEfnuPQ+imiZSWkuqzXwOwJQd
         BBC3aWtBjMJS2EBCiOqykee+psuoB+8I6Mscoevxfki0OcvpjdZAED1eMU83DgqDqj0j
         I0Nw==
X-Gm-Message-State: AOJu0YwiIRG7XRG1M/qk947+kC+YmpaKcRv9qCKO7MiRHTtgYXVoakOm
	4rqIw9PDNPn3tSPie/53QUjjfQgyTRoKKmLWOZYDoxWD0cmAwbux
X-Google-Smtp-Source: AGHT+IEl2cLDbtF4I8Nla2SfMF/vu2xCJmRDJaeeYhuPQHlR2CxNJcGL/8M7S+IDbwtuND1KsskdJiHaYDdTPTbfcTo=
X-Received: by 2002:a81:6d0a:0:b0:59b:eb64:bccb with SMTP id
 i10-20020a816d0a000000b0059beb64bccbmr4609022ywc.12.1695550269184; Sun, 24
 Sep 2023 03:11:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-4-fujita.tomonori@gmail.com> <CANiq72miU6stf5fmxuRo4gb2zxUYoQuQV9T2zpcBrH5pn0KWSA@mail.gmail.com>
 <20230924.183837.147734556664207389.fujita.tomonori@gmail.com>
In-Reply-To: <20230924.183837.147734556664207389.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 24 Sep 2023 12:10:58 +0200
Message-ID: <CANiq72m_jv3a2umn-Ogho+c1zs5+=1XuVjE3K7mhw9w6gwR3Rw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 24, 2023 at 11:38=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> With that approach, you can enable both C and Rust versions? It might
> breaks auto-module-loading.

No, I meant that it would still be one or the other, i.e. `N` would
mean "use the normal, existing, production C one"; while `Y` would
replace it with the Rust reference driver.

> If a module selects CONFIG_AX88796B_PHY, then we need
> CONFIG_AX88796B_C_PHY or CONFIG_AX88796B_RUST_PHY.

Are you talking about the inner one perhaps? What I meant is that
`obj-$(CONFIG_AX88796B_PHY)` expands to `obj-` if
`CONFIG_AX88796B_PHY` is not defined, so it already does the job of
the outer `ifdef`, right?

Cheers,
Miguel
