Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D550D15AD
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 02:22:32 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8575A135
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 19:22:18 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99c136ee106so528512366b.1
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 19:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695003737; x=1695608537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbCwATLv8gNcfvOQXJJcFSWwGrwys2o1PmeeIperXKI=;
        b=AEQGScLrcFnzq054FmH5ohMXTNxNF6BxYAzO69/kzdBKbITFi5SsHGrUeD9sa+vUII
         h/4fogi6G/rtAbYTGcKAUFE7FWEs0AQfCf70OtdvB55PlmNRnuNo0HWZeCXGKU032QV4
         SBS3uTLgLfThjzaYrNosYMjaV8c4ldN01YZLIuVwBY41nMruepfo2o6QMou3G35FCBWb
         1eYkSvUeNKVXGummlY0rSBHkHgsKcoXEhAPEaLZNDfupYQd02UqFB1Ggdz4CUnc4TBo3
         QKm9DnwsoDHEQ6hP+PpqGkDyxHWqvgOqMrTevInCYPQyFFQR9wmc2GURViUtlkkhFhUJ
         tsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695003737; x=1695608537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbCwATLv8gNcfvOQXJJcFSWwGrwys2o1PmeeIperXKI=;
        b=cLHKXOLNtVmVMMYeCgYs9iOPTExF9CddGfzEPMwr9QHTgmzkXDQ2PEUQJRxiT1WxJG
         Xc4qMP+8zzvRFl6Ow+Imunk8HTpDH/ldWLbaRcCFH0p9ocS50CegEVngAza9CeT48MEi
         QwPNRHua8Z0z2KnAP34ErwKX1m7SeVBd5n7REvS7jQh9jMhCR9fGe7sjhvBOx/Jg7mt9
         cpEX07Hp2K3DC54cVwcudFsuhGpt26n5CqJBRMTLNCCibA4pEmAIeGmvZoWl83E4eTs5
         9BbLPiYgFS7GbX37Y6gNw/2dyIJIUlWI0Vv/LjBsJWHtDCpknvIGM64nK8GO5fIylAuj
         QIpg==
X-Gm-Message-State: AOJu0YzC2yYoOmJ7A8qG3F2Z/PPPp4h9CRRMw0qzoLQ1FRfdxcSCFdzD
	B8uXtEKBM7e4Y1J75Gv59FOqxcWn9xPlprfsxpflGW+lvAy7IOCY4X0=
X-Google-Smtp-Source: AGHT+IGndvQ7LsQF/BJq1DiYHOTZDG68jvd3EKkm+6gTTTGy0OeyZsQalx2uCOsRpeA4q/xXJbvNQfzWswis6gk7ReI=
X-Received: by 2002:a17:907:2c54:b0:9ad:e955:414d with SMTP id
 hf20-20020a1709072c5400b009ade955414dmr4103596ejc.17.1695003736870; Sun, 17
 Sep 2023 19:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <20230917.191708.2174483069021340663.ubuntu@gmail.com> <3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
 <CALNs47uCFDJ5xz7_3qkjszmmAFXzA=dwB7CM4+sVeVtnSTZAcQ@mail.gmail.com>
 <f55a3e84-3865-432b-b009-c4051f9a3b0b@lunn.ch> <CALNs47sRKxnD1NhJZaoorEZ2xyLjAse23RmkacoPuCiD7Enq=g@mail.gmail.com>
 <140bc6d9-b2a9-43ef-b8b2-66767bc45910@lunn.ch>
In-Reply-To: <140bc6d9-b2a9-43ef-b8b2-66767bc45910@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 17 Sep 2023 22:22:04 -0400
Message-ID: <CALNs47sTJmBweLA=ZqqSa2kTQi1gUVzTXOeq=iPCCfLCXvp7jQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 17, 2023 at 9:18=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
> I was wrong here. As you noticed, they are currently not const. I just
> tried to actually make them cost, and it does not work. Embedded in
> struct phy_driver, is struct mdio_driver_common. That needs to be
> read/write. We have a bit of history here. Originally in Linux MDIO
> busses could only support PHY devices. But as things evolved, it
> became clear other things could be placed on an MDIO bus, such as an
> Ethernet switch. So we had to do a bit of refactoring, and ended up
> with this structure. It is probably possible to do some additional
> refactoring to make struct phy_driver const, but at the moment, i
> don't plan on doing it.

Thanks for verifying so fast.

> What we do however have in PHY drivers is the table:
>
> static struct mdio_device_id __maybe_unused asix_tbl[] =3D {
>         { PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772A) },
>         { PHY_ID_MATCH_EXACT(PHY_ID_ASIX_AX88772C) },
>         { PHY_ID_ASIX_AX88796B, 0xfffffff0 },
>         { }
> };
>
> This could be const, and two C drivers do mark it const, including the
> realtek driver which is being re-written in Rust. This table is not
> security relevant, it does not have any function pointers in it, so
> its not the best example.
>
> Even if not relevant for PHY drivers, getting const structures into
> .rodata is something Kees Cook is going to want to have.
>
>         Andrew

I believe that table should live in rodata with the current
implementation (haven't actually verified). It definitely makes sense
to put as much as possible there, we can make this work.

Is there always a 1:1:1 phy_driver:phy_id:phy_id_mask relationship? I
think we may be able to get away with one macro on the Rust side that
registers both the `mdio_device_id` and the `phy_driver`. This macro
could also do a compile time check that all devices are ordered
correctly, if that is a common mistake (as you mentioned in a separate
thread).
