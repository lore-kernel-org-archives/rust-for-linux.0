Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B5A10949
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 17:26:42 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B1510D
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 10:26:40 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-59c0d329a8bso84467077b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 10:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695662800; x=1696267600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4vBFI2bH7ZiOi06Dq3sG8PsV0XiE5QOmOhv6FXIQbM=;
        b=ZvrHuCjKW6PtVC0K8kCLksK+HpJWxG4soX0dRK+k+44/PnH6KyIZMBSUZXJje0BVu+
         ssy9v+7AyNj2DmPSA3LgbJ3HF4Fez1SiAhrgWVRodVDRL7eSz0SUZi4P2smnGV4wp4WQ
         648PqKaCyz4Fcwhf5IM1krVK8KDdb04zELIM2LMufpJqOI04uEGqz4ThFmqhUEMqpXVG
         EyqA3OeZCf7wpTrP50+XPIeskmA1DQHeemmbcjt/iwbCse797V3Na/mWpUpbaDUcsiaH
         7KM8wJ366sQDivpsGv2l1aGad4XBcmcy2SuqweqfUY/6R53W5zR7aPxDLuHV5Onb+NZy
         2N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695662800; x=1696267600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4vBFI2bH7ZiOi06Dq3sG8PsV0XiE5QOmOhv6FXIQbM=;
        b=YuprIP5PdzClMPpcBdv7eA9CXUZN+50g1nfBU/k2L6qBKLSvWxbHKvWwf4xHHyMakl
         TOC7JFYlNObJ15VO5Ky9EgSMY2xHK9wFpLe4s+nNbzCN9ZZddxq7E/hy+z4a5Hac2+aL
         nXEKr0lyZX8qSOgA+q5Um971oL35wHH9Bv2GoFQt57AT4Ugp/Vur9HqnqiDIUwUdxkk9
         t1xet/Evf08C5gO5abPWAMJxem5Z09RYLvmCVJ7+ytByIgmmmadfNcOfV+ajTuy1js8D
         2EXMqGDy0mB/eMIh9IxvE96gTxfxXdsZmlFdmDiVmiG/Q7URG0zdHouN/S8vlVnwHdNQ
         4HSg==
X-Gm-Message-State: AOJu0YydARyQhYlb6pLijHpU9Trdr3dOU/wRI/hGlNej0QbV4gDXNeh3
	j8sXZpZgRCyAsOdqqDN3/M6vKlvqPhUgtrtJZfw=
X-Google-Smtp-Source: AGHT+IE2NYeoYS/Z7Xjt8koKQUxJ8pR6q50FSZ2qpUuNOweh/9limRmarpFUS3du7KArqEzuBblv7nA161TTPGEzeuo=
X-Received: by 2002:a0d:dd09:0:b0:59b:524a:7238 with SMTP id
 g9-20020a0ddd09000000b0059b524a7238mr7352351ywe.26.1695662800034; Mon, 25 Sep
 2023 10:26:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com> <97600770-f800-473a-af5c-870d4f8ce152@lunn.ch>
 <CANiq72mQ6NWr=t=eCcr11oO6kEyZ-45=h27fiUBdVU7xZw9NWQ@mail.gmail.com>
 <da479834-a649-4a93-9083-9ea59d519cbd@lunn.ch> <CANiq72nB+7P8Pby-_Vxq0Fq_g0L8tC2XG6UT-T4kPqhMnKqLnQ@mail.gmail.com>
 <98bc5ab9-890c-4163-8a50-01ca6d07a60b@lunn.ch>
In-Reply-To: <98bc5ab9-890c-4163-8a50-01ca6d07a60b@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Sep 2023 19:26:28 +0200
Message-ID: <CANiq72=SwdCqBGQ1KffyQZs9ewbiw4xu=PZWb9zynz8QJCjFoA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 25, 2023 at 6:53=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Kconfig should allow this. A module with a DEPENDS ON, just ensures
> that the option it points to is available in the configuration in a
> way it is usable. The Lack of a DEPENDS ON on an Kconfig symbol does
> not force it off. The user can enable it, even if there is no user.

Ah, so by "if the kernel configuration does not contain a Rust PHY
driver, don't even build the Rust PHY abstraction" you meant from the
user point of view?

I understood you were suggesting doing so automatically, that is why I
said that approach would not be flexible enough.

(We are aware how `depends on` works)

> broken builds reported by 0-day, and the randconf build bots, assuming
> they even try to build Rust at the moment. But at some point, they
> will...

Some good news: KernelCI and 0-day have supported building with Rust
enabled for a while now and they do some runs. Of course,
coverage/configs/... will need to be expanded as Rust grows in the
kernel.

Cheers,
Miguel
