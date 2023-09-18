Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70842AB4B
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 22:23:37 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A708F
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 15:23:36 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a21b6d105cso625875066b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 15:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695075814; x=1695680614; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sOcdr7ta3PY0GeyzIeS+FHhFLt3o3bGDHUlfTujd8rA=;
        b=eDfFVAqMzrjqRbi257xB5wItV7ymZkCOQDWzNS8EC5PRozJy7qJ6Eq+8NFNHPpxXeI
         uHh1p5qnoqRcEwABNGIPseko2k+d0fQVEqpXF9hdYrnzw3Svp29o0iwYNh45KcA1DSOo
         FpGx4jRTdX042LwBhOxaWCOTL3SThvG9ET6CEJNSVUv7/8v8tVT8DBfM/H3l+a+UAvrn
         IfyYFvnMnLuJ9jPnVJMtV/3VxhC212aImmrZgXQDgVYr+DtWktmNw46nnMZOD+BOCnen
         QqejQvNO7y9DAwHilB/8Lx4YjufhKIZyM4XpSRGHj30ZWdoskverL6GZseSdxASg7iwh
         xg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695075814; x=1695680614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOcdr7ta3PY0GeyzIeS+FHhFLt3o3bGDHUlfTujd8rA=;
        b=DE563sq13KJLm3l+I1oDjmq8C9L9DUqfjLie2v/71OKA00mqvdZW+GyjeEMJ6m3CV6
         rTfFwAObdXSmAiRkmIo+sZg+u1miros65usLeZKIML+pvlW5wbWnRDE9jh+TPSP6eoOE
         PZS6mAXURmnjUE6iAizU5Ybang/OapLxm3iHPaSBTOz7EW3su68yJCrOkxlEFvnlYya7
         Xs5uhnY15LCC3MT6Krtk0X5GjJjertYAvVipchIUEDWBCKvn2Jq6MOoFGlfdomg9LzGA
         +zEQpCNOF0vQAwlI1Dk//K98ma0IW0cF8eKP0TRfHXUU4Yt1ZoAM18XFNLj5N0eq/93O
         osTA==
X-Gm-Message-State: AOJu0YxVIMhHy/osTWonH0plYCsgqxOGFftchuYIqslMyc/pbIEqZ6Au
	GFsQj9SeVS6XMah2V/iTuap86sHs/xn11z9FyZoRgA==
X-Google-Smtp-Source: AGHT+IFaNqFbEVLT/2DorgWqyrpx6+wIjRZHzYOTO9lc22hzCIkD6ZSAVBNTeP+gQd3/2jICFKiIMQWG/8+4yIQuAqc=
X-Received: by 2002:a17:906:535d:b0:9a1:fb4c:3b65 with SMTP id
 j29-20020a170906535d00b009a1fb4c3b65mr8354779ejo.14.1695075814676; Mon, 18
 Sep 2023 15:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
In-Reply-To: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 18 Sep 2023 18:23:23 -0400
Message-ID: <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	Benno Lossin <benno.lossin@proton.me>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Some meta design comments - why does registering need to allocate at
all? We should be able to keep the `phy_driver` in statics, like the C
side does.

Also, the size-generic `Registration` seems more complex that is
needed, which Benno was getting at. The C side already provides
`phy_drivers_register` and `phy_drivers_unregister` (drivers plural)
that can handle >1, so I don't think we need to create anything
special here.

I think the API could be simplified quite a bit with these things in
mind. A `Driver` can probably take over the `phy_id`, `phy_id_mask`,
and `name` fields which will more closely mirror `phy_driver` [1]:

    /// Used to do the same thing as `PHY_ID_MATCH_{EXACT, MODEL, VENDOR}`
    enum PhyIdMask {
        Exact,
        Model,
        Vendor,
        Custom(u32)
    }

    trait Driver {
        const PHY_ID: u32,
        const PHY_ID_MASK: PhyIdMask,
        const NAME: &'static CStr;
        // ...
    }

Then you need two const functions that can construct the
`mdio_device_id` table and the `phy_driver` structs (const functions
or macros, but I think functions are easier)

    const fn make_mdio_id<T: Driver>() -> Opaque<bindings::mdio_device_id> {
        let phy_id_mask = /* copy logic from existing C macros */;
        bindings::mdio_device_id { phy_id: T::PHY_ID, phy_id_mask }
    }

    const fn make_phy_device<T: Driver>() -> Opaque<bindings::phy_device> {
        // take this implementation from Adapter::driver
    }

And a type that can be used to unregister the devices on drop. This
doesn't need to be generic over N devices since it only ever needs to
call a single function.

    struct RegisteredHandle {
        unregister: unsafe fn()
    }

    impl Drop for RegisteredHandle {
        fn drop(&mut self) {
            // SAFETY: cannot be called more than once
            unsafe { self.0() };
        }
    }

Then, usage looks like this:

    struct RustAsixPhy {
        _reg: phy::RegisteredHandle,
    }

    impl kernel::Module for RustAsixPhy {
        fn init(module: &'static ThisModule) -> Result<Self> {
            pr_info!("Rust Asix phy driver\n");
            Ok(Self { _reg: register_fn_name()? } )
        }
    }

    // Takes one or more `impl Driver` structs. `modname` would just
be `asix` in real use
    phy_drivers!(modname, register_fn_name,  AsixAx8872a, AsixAx8872c,
AsixAc88796b);

The macro will expand to all of the below:

    /// A function that the user will call to register these modules.
Returns a handle that
    /// will unregister them on drop
    fn register_fn_name(module: &'static ThisModule) ->
Result<RegisteredHandle> {
        // We can use the existing functions that register multiple phys at once
        bindings::phy_drivers_register(
            &__modname_drivers,
            __modname_drivers.len(),
            module
        )?; // <- actually map this error...

        Ok(RegisteredHandle{
            unregister: || bindings::phy_drivers_unregister(
                &__modname_drivers, __modname_drivers.len()
            )
        })
    }

    /// Our `phy_device`s are stored here rather than in an allocation
    /// Don't need to be `#[no_mangle]` since C will never see this directly
    /// Does need to be mutable based on Andrew's comments
    pub static __modname_drivers: [Opaque<bindings::phy_device>; 3] = [
        make_phy_device::<AsixAx8872a>(),
        make_phy_device::<AsixAx8872c>(),
        make_phy_device::<AsixAx88796b>(),
    ];

    /// This will be the same as what exists - I assume this is read by
    /// the C side somehow?
    #[no_mangle]
    pub static __mod_mdio__modname_device_table:
        [Opaque<bindings::mdio_device_id>; 4] = [
        make_mdio_id::<AsixAx8872a>(),
        make_mdio_id::<AsixAx8872c>(),
        make_mdio_id::<AsixAx88796b>(),
        bindings::mdio_device_id { phy_id: 0, phy_id_mask: 0 }
    ];

    /// Bonus: we should be able to write a function that verifies the
phy IDs and
    /// their masks can actually all get matched
    const _: () = assert_correct_phy_ordering(__mod_mdio__modname_device_table);

This eliminates the need for allocation, a const-generic registration
struct, and the `Adapter` type (the associated functions on `Adapter`
could probably move into a `mod adapters` or similar). And
registration gets a bit more straightforward. I think this is a lot
more similar to what happens on the C side.

Any reasons the above wouldn't work?

[1]: @Fujita I know you have mentioned there are times where a driver
does not always have one mask. I can't find anything and am not sure
how this would work since `phy_driver` has `phy_id` and `phy_id_mask`
fields - do you mind linking an example? The above could probably be
adjusted to work with this
