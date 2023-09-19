Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E21238BD9
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 08:05:29 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B72115
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 01:05:28 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98377c5d53eso685898466b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695110726; x=1695715526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2FfowNnUphKKJiTsBQ+3PmcPkR64gbwqmjwiSbJevs=;
        b=G0eKxnYF78eTrfhoOEdDhTanYiGg+NBYqPz735QDjCA8hrpor2DQc6S5938pkDUOG7
         0ZqS8DHU3VA6e4TYgOyla8/a7icgqe6iH7PWz640VtLObRRT5Qid3W5aCp7Pn8Pg5AyJ
         Fb4+2vRmoUPtGQkZ4x8krOqyEO0OBnjGnRmGHWqFixQhJrh61HHnxi7QnqBaH4YDNmi3
         dVbmiwyu7c2rwItt6mNKzSSCvfNAiKSn52HjpQAma9pPsD8C2nu2eLH0xiitcT50mMPy
         XS0p0vtI4lt6K4gYdC5N8L5kLhhN0FWq5rK5JtjQwy2Znvorm3iMqUc4Yl9tvi6NW8VJ
         Rr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695110726; x=1695715526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2FfowNnUphKKJiTsBQ+3PmcPkR64gbwqmjwiSbJevs=;
        b=upSLotirkfb1udz5GMnRL5tC29Qw/+1Qvz9V4d9W4Dy9pJ5lcKj22GCm63MJULHG5k
         qS8s1l861zODO+s+s3q/uUAcsQBkgfBfueVX0B90l0gx6P6XAcwCR24cHZT/k2/Utdwr
         pcPGjXSbRdIFACaxmo7U0T++yWsdjnRofjpw347d2mpiNjLFfyxr6ijWTQRlz5hIFdoB
         XxMFteMNFj5G6q0B3NYfTDb/wdQwES0q8QmHT9XdSuuA505/fAsT1pqd82+R+VIAlq6m
         MperJK2DUvEmnPMF6lvZOcbsasvCTD3zJ97PFaef9Uf9guj+BpSsYoG/XIpAJoSi1x5C
         f+ow==
X-Gm-Message-State: AOJu0Yz17wGKpGtUDllh6MaIlW8Jyc27UBLcI8PqNxhF8QNEC3rM6TlY
	RZxvgasOCVMDl/ZfWAMKhYifaWidR7+MRVRuY4DxUQ==
X-Google-Smtp-Source: AGHT+IGgJbRCdH8ysLg0wuBtpKWwdRDHbP7bzl0TMr/tnwkfaLa9iMae9jJm8qLDUg/MjIJziAyVRL1PghmvI2Z19rg=
X-Received: by 2002:a17:906:58:b0:9ad:9225:ced2 with SMTP id
 24-20020a170906005800b009ad9225ced2mr10328795ejg.62.1695110726590; Tue, 19
 Sep 2023 01:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com> <20230919.151645.1773873104513260063.ubuntu@gmail.com>
In-Reply-To: <20230919.151645.1773873104513260063.ubuntu@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 19 Sep 2023 04:05:13 -0400
Message-ID: <CALNs47vp6D-tqxa5NnE3i-M765GxwVxC2OArjBcfwY3zAcd8TQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 19, 2023 at 2:16=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Hi,
>
> On Mon, 18 Sep 2023 18:23:23 -0400
> Trevor Gross <tmgross@umich.edu> wrote:
>
> > Then, usage looks like this:
> >
> >     struct RustAsixPhy {
> >         _reg: phy::RegisteredHandle,
> >     }
> >
> >     impl kernel::Module for RustAsixPhy {
> >         fn init(module: &'static ThisModule) -> Result<Self> {
> >             pr_info!("Rust Asix phy driver\n");
> >             Ok(Self { _reg: register_fn_name()? } )
> >         }
> >     }
> >
> >     // Takes one or more `impl Driver` structs. `modname` would just
> > be `asix` in real use
> >     phy_drivers!(modname, register_fn_name,  AsixAx8872a, AsixAx8872c,
> > AsixAc88796b);
> >
> > The macro will expand to all of the below:
>
> This code will be executed in the module, right?

Right - I think we could have one macro that creates the `static
struct phy_driver` and the `MODULE_DEVICE_TABLE` used on the C side.

> >     /// Our `phy_device`s are stored here rather than in an allocation
> >     /// Don't need to be `#[no_mangle]` since C will never see this dir=
ectly
> >     /// Does need to be mutable based on Andrew's comments
> >     pub static __modname_drivers: [Opaque<bindings::phy_device>; 3] =3D=
 [
> >         make_phy_device::<AsixAx8872a>(),
> >         make_phy_device::<AsixAx8872c>(),
> >         make_phy_device::<AsixAx88796b>(),
> >     ];
>
> static needs `Sync` but Opaque isn't `Sync`?
>
> We could use `static mut` here but it needs unsafe. So a macro could
> generate something like:
>
> static mut DRIVERS: [Opaque<bindings::phy_driver>; 2] =3D [
>     phy::Adapter::<PhyAX88772A>::make_phy_driver(),
>     phy::Adapter::<PhyAX88772C>::make_phy_driver(),
> ];
>
> impl kernel::Module for RustAsixPhy {
>     fn init(module: &'static ThisModule) -> Result<Self> {
>         let mut reg: phy::Registration =3D phy::Registration::new(module)=
;
>         unsafe {
>             reg.register(&DRIVERS)?;
>         }
>         Ok(RustAsixPhy { _reg: reg })
>     }
> }
>
> I guess that module! macro generates some unsafe code so we can use
> such macros?

Good catch with the static - I think you can just do

    /// SAFETY: `phy_driver` is designed to be shared and provides its own
    /// synchronization on needed fields
    unsafe impl Sync for Opaque<bindings::phy_driver> {}

Or make a wrapper type but that's not needed if we never refer to it.

Registration can be safe since the only precondition to
`phy_drivers_register` is valid pointers and correct length. Since
registration is only doing one thing, it can be one function instead
of splitting into `new()` and `register(...)`.
