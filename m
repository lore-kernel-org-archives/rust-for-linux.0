Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9595CA3B
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 07:41:57 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED419100
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 00:41:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bfed7c4e6dso45873341fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695109313; x=1695714113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obAk6AO6SXrG/ySIig6ZE7zt9bTHjEfUy2xU3fZxQqI=;
        b=Zg+rYVTYABLg8xVCGWBvCraXtgQwl/Gd+y0oaXRe8tQBqFgcvh7CJhgDY/ANmbVxxP
         iDPOZtXOxCKgaBDMJmUwPtRK1kW99zGvqTzHZuChsZMyp4nj10b5RG75t2TOMjc9bZWc
         4MvrI6JZ7o5Vx3YI1qgInAil3oq6BETy6uxBnbqLhct9iuvJCviNq9v/IqN2QzVjHmfx
         nLoAwhdR1RDG+4gRncIu/1xkGPKeJLXA+gUo/2rkErmMiL76SLU5k8X+8Rf7U83Z7o1Q
         xSt+mzTnWymxPj/ZyNq7peXEApl/2qFjZmliZcl0dxVzScpE/IANeTEoKndjBO8CtBqh
         JN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695109313; x=1695714113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obAk6AO6SXrG/ySIig6ZE7zt9bTHjEfUy2xU3fZxQqI=;
        b=ELkILrKeqsqIn6MLteHlGgu+QoUETsev3Um1hmx9sxEK6kLQAzp5vDKubETeWavHdQ
         ioeOzH0DGsgb+I0aFysqQ1W+Fup30in9UmnoqDmb9fHFYihZs7yEIf9hdUewEeYQKe4n
         e6DWleWlqlL0pidP5B6yU8Q5YIFeQDp58E/+8+YBktZa0mViC63n2ulh+rfZ2z/2VHIJ
         cim4v/3kJJvtOZqbhHsRbc1dvEYw99dchj+J78iZ3JmwlCP3/3Do6IkURsFE90ogWkrb
         sBC8hQhzGjl63N/uHGoV5p5AcXLWcvZ37SwJqvTlKrT2pd8/KADpRg274wR/5MClyBbe
         wvOw==
X-Gm-Message-State: AOJu0YziL8IL4nhzTbY4r3Ijk2kNuUt1re4BsCBYmJ2QaEd0dJotxkEA
	6LfpcqRP17U7RQkc7xw4AE1pIcoTOoH3/C2c7gC4Ld+boGuAYCtP
X-Google-Smtp-Source: AGHT+IFPzBq958Ln3igURnsfAMTa8hR5WSG9NuXLeAuV06Bie+T2KIz++O9Ot5IhmCbmFnqouvG2ZumoqBVdqjKtfLk=
X-Received: by 2002:a2e:8215:0:b0:2bc:e2bc:81ff with SMTP id
 w21-20020a2e8215000000b002bce2bc81ffmr9403644ljg.51.1695109313142; Tue, 19
 Sep 2023 00:41:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com>
 <439b6ee7-65e0-4849-8028-cbf5e752dd87@lunn.ch> <CALNs47taHGkhjPH6j=JtmCAAqgTz=px5gsb6T_TN-TfPeu+Y4A@mail.gmail.com>
 <20230919.152444.1457385307728133204.ubuntu@gmail.com>
In-Reply-To: <20230919.152444.1457385307728133204.ubuntu@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 19 Sep 2023 03:41:40 -0400
Message-ID: <CALNs47tD8Xnx3qmkDL8e=7-vft+e0SB8LF2ekXWm4gH=k2ts=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: andrew@lunn.ch, rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 19, 2023 at 2:24=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> This registers one driver but registers three mdio_device_ids.
>
> bcm87xx.c registers two drivers but registers no
> mdio_device_id. realtek.c registers 10 drivers but only one
> mdio_device_id. There are some drivers that do unique.
>
> I think that to separate registations of drivers and mdio_device_id is
> the cleanest way.

Thanks for pointing it out, agreed in that case.

Some sort of `struct MdioDeviceId { phy_id: ..., phy_id_mask: ... }`
might still be useful. Maybe the `Driver` could have an
`Option<MdioDevice>` that gets set in the `phy_device` if that exists?
