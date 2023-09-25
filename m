Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7C163A8
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 19:15:45 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB34C95
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 12:15:44 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59c26aa19b7so87060637b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 12:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695669344; x=1696274144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzrkBgBFK2ZMSv6J4sFMu8L3QXO645sK4mrUYordBBk=;
        b=fC9b9mZr40qZ+LDawXrt1VjpJ7RWmWvMXcQ7dqhBJLGIDiFWiBYQu1GOK9K5KUOsH6
         tLhp3xnHSEaQPZaYgWfgr94RZkiOlhLQUOcrvVY2uQYMtF08GW81ymgENDP2GJFJWJjn
         DeV0Bdiwo79rhe6mnpRqa7xKaU0S8xdIgrZSbXRBDSpls0DbQ0LXIZ1j7nLJ34Gyx9Gc
         pnp7R+zCYsQzqugNITQH+foChueXReLCRV1fKtc+DAAXafaJ1x5x7h/2VHyXLpsQw163
         6dZQk2pxmditkZuQwPv/vHbLYlTemkRAUdIywNgTdiHsoOVee1DWp+vKyGABbStslw6Q
         utqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695669344; x=1696274144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzrkBgBFK2ZMSv6J4sFMu8L3QXO645sK4mrUYordBBk=;
        b=ES89WOuFxc1ExuqSbXK1qefAu1S4mrfp2bbhqhiSwEDsG1PuWxP+jD3MaiQzbkbk2s
         H5lf48hmCi8gxRmBVO08c7xByfcXDvmsiPlN0YTJ17IUj5xHeMhXAaSBZvHkcm5eGXF0
         xga1iwQunysOfHLOuOYUoSLCfNpj3QWB3F94eIfRxeU+RthHVETxTYWh50n9gkwZkGc8
         yhfecfzRWXYXqcY2iXDOsthwfS/thH+EMvR37NF4hpZ3QWbXci56PJky1BKkSCz+Mn0y
         Mb1nO+CHZFzKu11mO5+LSYGtN86B5q97gh0JpjIp7pxDelRb9R+pNMtKegGJOIYx3REj
         4w5w==
X-Gm-Message-State: AOJu0Yy54gw+wLUcICwgjGF7BDf/mAaPMLZmnOaFbFaC9sMaohyJ2XP5
	h56M18wI+0xEEuTUWjGPBhT55h7HMqzCJo2IJ2k=
X-Google-Smtp-Source: AGHT+IFZRTOOl7nKUPWfY6LnztxN4+CJfC8YVkv3PV1bTow1lGAFlNsBPecR3ac8qZ4Yr8GYzFHQc9LjQybWR/0M05U=
X-Received: by 2002:a0d:d181:0:b0:595:887f:e180 with SMTP id
 t123-20020a0dd181000000b00595887fe180mr7256334ywd.40.1695669344119; Mon, 25
 Sep 2023 12:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com> <b07d6626-f2db-4d87-8c34-ba8873cad5de@lunn.ch>
In-Reply-To: <b07d6626-f2db-4d87-8c34-ba8873cad5de@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Sep 2023 21:15:32 +0200
Message-ID: <CANiq72=6rWpx4PGSyYMrYbwj5ojeiYJGR13SDpwQv9uO9_13Mw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 25, 2023 at 8:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Is this a FAQ? Is so, please point me at the documentation...

It is documented in `rust/exports.c`:

* All symbols are exported as GPL-only to guarantee no GPL-only feature is
* accidentally exposed.

Cheers,
Miguel
