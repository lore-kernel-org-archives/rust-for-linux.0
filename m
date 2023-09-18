Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54D6450F6
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 23:47:12 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDA690
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 16:47:10 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bffd6c1460so32301081fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 16:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695080829; x=1695685629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhVdNnS6ib8NyhTbfdMUUa8iE8D4b2eZhYVfEetyOAc=;
        b=LTNRhAdBoP27XwT8xHJKYAOHLILK12p/9KpcxqZM2rBKl0o6KpNcjqQBPcs+8/CtNP
         aEhkYj1/cqxGOOt9syerUgBqCO9fFXJAWzJ+Xnq4j8KgF6JxT7wxTp5PqVhNL+AzswB0
         fFocnpauCiPWOnXl1vUroJG+Qji3NVSeHW7ePUvwv5xbGDvJyhFBZkNo+9RvlW7AhxmV
         JAMhAkgYMSyqbVCy1fTcum6eMhPYWuOwXJ/hQ8siRKasGKLh+1GeG9N1mk9IFrnrO/hZ
         fiwlVULC7zSRyX+GAlbKHh0JVIV5v7JC5otmbal008N/3lCcTSw/bE+tKM2cqsm9eR6y
         5mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695080829; x=1695685629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhVdNnS6ib8NyhTbfdMUUa8iE8D4b2eZhYVfEetyOAc=;
        b=bUr5AkuTWlJolRQZNjb8ZkLiXngX260Ncu3rV30dSJ/aU+DasxnoCjHcxzVvfy2W0Q
         0+HGfGG9uWQWdat55RiVlXkEjURKiHGnnvpHn4dXBpgcHgUctzuF0cqkUKKSvNPHvbh4
         1jGI2/tBIfHPgnAH0NwXONLAumOgv1Q5wT1wrMLAUA5JXJYe66VYUQSnNnKzakgMS2mY
         2D55VwxJBUu+1Xd5cwg9fBW+1dmsgqqG7yrttovQOldOyLv12Ej8E/J0qMv+NlDRbtKa
         ibiWyFsGQipTupMM8WghcavBFg2bQzDvb4JDUq2XsTg/JfzqA127OySV4ESwfb9N99/X
         JlIg==
X-Gm-Message-State: AOJu0Ywb2JDH2gPjMOvHd9auvS+4C7tOLmyfzTvT6cYtTZtBsW/UQB2/
	zL2YTEhLadK9BR7jGb1vdLeI/TnUiD0SdCf1yPDnpQ==
X-Google-Smtp-Source: AGHT+IGNXVSCA0/+192e1vdJfH8+uei2ttpuM1bv/OAHBlrPg0sZhmPB8RXtktEZGHHwA3B3+y098r7JzPhOL5tJKps=
X-Received: by 2002:a2e:700d:0:b0:2bc:f1a1:29d9 with SMTP id
 l13-20020a2e700d000000b002bcf1a129d9mr9484156ljc.2.1695080829098; Mon, 18 Sep
 2023 16:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com> <439b6ee7-65e0-4849-8028-cbf5e752dd87@lunn.ch>
In-Reply-To: <439b6ee7-65e0-4849-8028-cbf5e752dd87@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 18 Sep 2023 19:46:57 -0400
Message-ID: <CALNs47taHGkhjPH6j=JtmCAAqgTz=px5gsb6T_TN-TfPeu+Y4A@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	Benno Lossin <benno.lossin@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 18, 2023 at 6:48=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> >     impl kernel::Module for RustAsixPhy {
> >         fn init(module: &'static ThisModule) -> Result<Self> {
> >             pr_info!("Rust Asix phy driver\n");
>
> Another FYI from the kernel best practices side of things. Don't spam
> the kernel log like this when a driver starts. Drivers are supposed to
> be silent, unless things go wrong.

I just copied this from the original, thanks for pointing it out here

> >     /// This will be the same as what exists - I assume this is read by
> >     /// the C side somehow?
> >     #[no_mangle]
> >     pub static __mod_mdio__modname_device_table:
> > [ ...]
>
> Actually, No. This ends up in a special section in the module .ko
> file. The tool depmod(8) then reads that section and uses it to build
> /lib/modules/<version>/modules.alias
>
> See:
>
> https://wiki.archlinux.org/title/Modalias

I wasn't sure whether we needed to reference this somewhere in one of
the registration structs, appreciate the clarification.

> > [1]: @Fujita I know you have mentioned there are times where a driver
> > does not always have one mask. I can't find anything and am not sure
> > how this would work since `phy_driver` has `phy_id` and `phy_id_mask`
> > fields - do you mind linking an example? The above could probably be
> > adjusted to work with this
>
> drivers/met/phy/meson-gxl.c does some funky things:
>
> static struct phy_driver meson_gxl_phy[] =3D {
>         {
>                 PHY_ID_MATCH_EXACT(0x01814400),
>                 .name           =3D "Meson GXL Internal PHY",
> [ ... ]
>         }, {
>                 PHY_ID_MATCH_EXACT(0x01803301),
>                 .name           =3D "Meson G12A Internal PHY",
> [ ... ]
>         },
> };
>
> static struct mdio_device_id __maybe_unused meson_gxl_tbl[] =3D {
>         { PHY_ID_MATCH_VENDOR(0x01814400) },
>         { PHY_ID_MATCH_VENDOR(0x01803301) },
>         { }
>
> So the phy_driver wants an exact match, but the module is loaded based
> on the vendor OUIs.
>
> icplus.c:
>
> static struct mdio_device_id __maybe_unused icplus_tbl[] =3D {
>         { PHY_ID_MATCH_MODEL(IP175C_PHY_ID) },
>         { PHY_ID_MATCH_MODEL(IP1001_PHY_ID) },
>         { PHY_ID_MATCH_EXACT(IP101A_PHY_ID) },
>         { }
> };
>
> The devices seem to not have unique IDs, so:
>
> static int ip101a_g_match_phy_device(struct phy_device *phydev, bool ip10=
1a)
> {
> [ ... ]
> }
>
> Its a variant on Murphy's law. If vendors can get something wrong,
> some vendor will get it wrong at some point.
>
>      Andrew

Thanks for the references here, I see I misunderstood exactly the
problem was. In this case, maybe we could do something like this:

    trait Driver {
        const PHY_ID: u32,
        const PHY_ID_MASK: PhyIdMask,
        // Default to the same value
        const PHY_DEVICE_ID_MASK: PhyIdMask =3D Self::PHY_ID_MASK,
        const NAME: &'static CStr;
        // ...
    }

`PHY_ID_MASK` would be used to create the `phy_driver`,
`PHY_DEVICE_ID_MASK`  creates the `mdio_device`. That can be
overridden in cases like the Meson G where they aren't the same.

I think that the icplus situation is already possible with `match_phy_devic=
e`
