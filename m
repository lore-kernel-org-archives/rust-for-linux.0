Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDD77F
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 09:59:35 +0000 (UTC)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C29FB
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 02:59:34 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d7f0a60a159so5324665276.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695549573; x=1696154373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1pv4vETqMUHefMxfqzMvvhdPW1daGvGIladwXIZXGk=;
        b=XQt+dfQ8JfgM2WvnX3tQiZx7jTWeMbnc9Yw3dsoDrBiwzmbVXDhBytEE/UlGhp2T/N
         tKuwsxP4g2oTFpgMarSx2HlhsUqtCxBnEgIoha9ofF4qgxJRQDLnu0XtFOMdnNTON8CD
         j/46uskjMsS1YLBCcK3A04cBlHDZtSE0Sh5XG4/1/Q5TKUjEQev2Zl9MtmG7VFFyDWN9
         IAGE9g32zxnDC6jCKhMLggrit8mvRfq+m7Lynkd95r80AhEZMgrByuXkPwv8W/EdNkuA
         BDdNOvNEb9W16nNlhB60JoLnC6lQ+iK9PhSJbVDWV7wC/MmV/Rvx4kCgzLbkyCWvkjJx
         0/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695549573; x=1696154373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1pv4vETqMUHefMxfqzMvvhdPW1daGvGIladwXIZXGk=;
        b=PtKTgt+oZLvpbCSJ8786zNhL0C/e9HnW+9GQ0w4y3GwD784wuZqBjpqNPVJwqyoGht
         2/r4Ery6zpmQcfk54gOADVTJSkvrwoPOp62xtMdUGJlvSXGs4tNy7LRtklBHrQ48Vnw9
         P++IQnpGKIyvD9+QxnDSZnkf5ETcOfQaN34PhLy7DlYpZaHCP+gp6BosHUN6AVAxyNFU
         ZNeLqEU81hCxBLB6dz7W8NVmjGnx1gmfqlLMSX8GiBo+eN20aT1U5gO6eb9zLXkakpe/
         Z0g8N4Q5yf4bi7BKkOQVuPgmGNAeRGu61EAGdJrunkx71L7PCVuibmU/p36V2sW5I0Gl
         fChg==
X-Gm-Message-State: AOJu0YyF+BuTsaSBYurf7unoNqu6DUzEYYTp/GwdDvFXF9PBKA0Juv9h
	lsWw3ErnqvrgRl6F1gtgq5ljWto7ihuSTFW+TJkrpr9qd2qPyWBI
X-Google-Smtp-Source: AGHT+IE3x97Y+RJDfQQQfZdEE5sv9ugShukYA0qv7fy/XTVG3Qn3ulc8MXzCnm3YHCZ3jKBjlG2UnYon4be2oCG8WTA=
X-Received: by 2002:a81:a20f:0:b0:59b:ca2f:6eff with SMTP id
 w15-20020a81a20f000000b0059bca2f6effmr3320303ywg.40.1695549573720; Sun, 24
 Sep 2023 02:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0b6f8110-b4fd-4d20-a97f-9d7df26c23f0@lunn.ch> <20230918.173527.1946752214085636243.ubuntu@gmail.com>
 <964973ce-84ee-4ce1-b060-cdc0d46868e1@lunn.ch> <20230924.181243.1273348818055860481.fujita.tomonori@gmail.com>
In-Reply-To: <20230924.181243.1273348818055860481.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 24 Sep 2023 11:59:22 +0200
Message-ID: <CANiq72kQeAOLtvyaSEKfewcpx-46MiN9Vof6uFJfgzzqZMB23A@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: andrew@lunn.ch, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 24, 2023 at 11:12=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> With the above example, if foo() fails, this function returns
> immediately due to '?'. When this function ends, 'a' is dropped since
> nobody has reference to it. The destructor of 'a' calls kfree().

I think the confusion may be the "immediately" word -- perhaps Andrew
understood that word implies no other code being run (like `return
-EFOO;` in C).

To clarify further, here is a side-by-side live demo:

    https://godbolt.org/z/fYYvo6a1v

i.e. a function like:

    int f(void)
    {
        int ret;
        struct A a;
        struct B b;

        ret =3D get_a(&a);
        if (ret < 0)
            goto err;

        ret =3D get_b(&b);
        if (ret < 0)
            goto err_free_a;

        printf("ok");
        return 0;

    err_free_a:
        puts("free a");

    err:
        return ret;
    }

may look like:

    fn f() -> Result<(), i32> {
        let a =3D get_a()?;
        let b =3D get_b()?;
        println!("ok");
        Ok(())
    }

Cheers,
Miguel
