Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE89065B
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 08:05:43 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C643D3
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 01:05:42 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f6041395dso14496707b3.1
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 01:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695542741; x=1696147541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqmbxoihJGM84B9/2gFrkHTu1WDydwHXDT6p9Z1Z5jQ=;
        b=mk1mbwGSTGYDRlE0wv+GVi3MchPbTBqN6CMil/VcHLohnRlyvv+qXgNrhDwazqDE07
         NSrfYO0wpf7o4xCDwBDmh6VfgtGYOfSyKBu3G+BZszv72KCKQgbqyIc1cUoXqGLDIDbN
         F8H6gAJ+cfY73Xxp3TvPa06jcQJc1DnKCjtuPCOBEpdykkTOSMQfKMyswh7UnVnTJFLe
         5N9VjIU1FxnX1F1QTfLQxORBIejr94Rvf0Z39+OFQ3glZgHxgDkOM/QIwPDxq86mIwmU
         HGgvksv1AJe3Wanw0z+9wlJNVAskPSSGwZSnK7FGKLjZm7VR30zL1p09Ll5CkgTZ6C8l
         WXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695542741; x=1696147541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqmbxoihJGM84B9/2gFrkHTu1WDydwHXDT6p9Z1Z5jQ=;
        b=uVhfBpBHCzRewGirWoXlZVzSO/hhjRAPO6rwvlw7QuzvdnmyO0eWQBDYnp3t9FHEEh
         ENtD14VZg6E4hy0JYNjSV1Mb4D9iZnHnRw61rwnGW9Lv81zq6wnAMlJL/Ba3qRDYhXTw
         WrQYABqyuVoW4m3Uo2ndv4ZTetRm+WWkDxsmZpDqbncERzoCMrxG9DBDxvDVhiNRftnC
         lIkwvPpOv1W7PaPNSMyaEI5mUdOthG3C5aQEFJcQZjfKD5PQUMUVZJaTWZtC6qj/lWvJ
         Vpx9jevYHaypPDQ9XhqB8HgxUWPpAhO3/lAiv/unvEbBBA4LgLfZ/9/ZMDdKQZaPjql/
         eFCg==
X-Gm-Message-State: AOJu0Yx+3CufJ99WZkAQSktjisEPRwI0jQk3sf5xTKB76RZ+12IagMrZ
	EOjRh4kYumUAobpwolm0NFhlplPrP8up9HONfho=
X-Google-Smtp-Source: AGHT+IEuoCmz0Gd6gGYPjLUET0yf7un3eNqKa7McAAoqKUC6NfOtvMH0fjhFEtInYy3gIrRkS3H5Po+X/1KK+1mtmb8=
X-Received: by 2002:a05:690c:fc6:b0:59f:519e:3e98 with SMTP id
 dg6-20020a05690c0fc600b0059f519e3e98mr3928703ywb.7.1695542741334; Sun, 24 Sep
 2023 01:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com> <20230924064902.1339662-4-fujita.tomonori@gmail.com>
In-Reply-To: <20230924064902.1339662-4-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 24 Sep 2023 10:05:30 +0200
Message-ID: <CANiq72miU6stf5fmxuRo4gb2zxUYoQuQV9T2zpcBrH5pn0KWSA@mail.gmail.com>
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

On Sun, Sep 24, 2023 at 8:49=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> +config AX88796B_C_PHY
> +config AX88796B_RUST_PHY

Perhaps for this kind of "Rust reference driver" (an exception to the
"no duplicate drivers" rule) we could do it as a suffix of the main
option, e.g. `AX88796B_PHY_C` and `AX88796B_PHY_RUST` instead of in
the middle.

In addition, more than 2 choices is unlikely (this is already an
exception), so perhaps `choice` is overkill here. What about instead a
`bool` with title "Use Rust implementation" instead and default N?

> -obj-$(CONFIG_AX88796B_PHY)     +=3D ax88796b.o
> +ifdef CONFIG_AX88796B_PHY
> +  ifdef CONFIG_AX88796B_C_PHY
> +    obj-$(CONFIG_AX88796B_PHY) +=3D ax88796b.o
> +  else
> +    obj-$(CONFIG_AX88796B_PHY) +=3D ax88796b_rust.o
> +  endif
> +endif

Is the outer `ifdef` needed?

Cheers,
Miguel
