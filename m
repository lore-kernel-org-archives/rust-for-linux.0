Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45087848E
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 06:16:48 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB327100
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 23:16:46 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-578bb70ad89so12873a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 23:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695104206; x=1695709006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4afx13xCm8EMlrRLzFkqhqCBQYw8nwI4TlBUg0fa4A=;
        b=gEMe7Gn2IoHQMNYg/fWH/TK161LdAQ6cY/YWG3Vis4t5BNgHX6lUqTOAaIPUb7IonO
         IgVWNVgE2dfzgp+wgKDv4l7VOmVu6X3D4eudarh4tUJxQgWF9Mmp3FmRaexYLiWuZLLS
         NG7Keyb2unWr1MrbwrsUCTvzEROZ/qYSnfmStIYOCc2SWJLzAfF3qSvDFuR6bAADriQm
         /kcL7WsHC3ra3TzSOQii/cLEKA6fbUG+yEEvNamF2rDwSj4KgYwU2ISPSu0jqqlsvRC8
         3vqAtZnub+n4v7e48dYPUZLbh877C/Kdp+JwTIdGufvpudYLQaNkB+FCTaVaDxFkTyfb
         sE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695104206; x=1695709006;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D4afx13xCm8EMlrRLzFkqhqCBQYw8nwI4TlBUg0fa4A=;
        b=w5p+n+3SKUxxsSiUCXUh0K9+fJVWF9hPpVm9chyK2mUfBYZB4L5jn0fWs0JVqQ7yBa
         NwNwxjBIPTBgLO2X6lttFQpeE+9rs3/9UiNJKUrrl1Htf6l2GxdtkJ+WOKUo7B8WQOkM
         7Bw2qgibXPsMHxX133ApdeIV7KKyVduc3JaJUNdoTJnHn/h41StwUPF6LDzwCk0JjxuF
         1F+x60t8UhiuHvr+qBDzI7UuhsmwDOMePz9VThBgTKElETE35YHHuMWNO3SBgykAwyyC
         K4voSBft80Dk1zrtRLOzuygETiehjdxDdkf16zYw7TdqcgTDfWqCAr41ZRhQjUPxs2pA
         K3MA==
X-Gm-Message-State: AOJu0YxXI3YFSACgmMTg+e+atgrdW6B1eT/lR4dD1THe97d4SEeHze57
	gfgF/lICs31vPxxVk6Rb9k2lCuOa9UQjOXMg
X-Google-Smtp-Source: AGHT+IGfFVacXacx2IGmLYTwWtDnLZnqNYoNf0L3Izvk2eEoCX5R81tS1LIHCN1HdhUvuTXXKOc8xA==
X-Received: by 2002:a17:902:d509:b0:1c2:c60:8387 with SMTP id b9-20020a170902d50900b001c20c608387mr12723592plg.0.1695104206281;
        Mon, 18 Sep 2023 23:16:46 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id z14-20020a170902d54e00b001bd28b9c3ddsm9225809plf.299.2023.09.18.23.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 23:16:45 -0700 (PDT)
Date: Tue, 19 Sep 2023 15:16:45 +0900 (JST)
Message-Id: <20230919.151645.1773873104513260063.ubuntu@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, benno.lossin@proton.me
Subject: Re: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
	<CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Mon, 18 Sep 2023 18:23:23 -0400
Trevor Gross <tmgross@umich.edu> wrote:

> Then, usage looks like this:
> 
>     struct RustAsixPhy {
>         _reg: phy::RegisteredHandle,
>     }
> 
>     impl kernel::Module for RustAsixPhy {
>         fn init(module: &'static ThisModule) -> Result<Self> {
>             pr_info!("Rust Asix phy driver\n");
>             Ok(Self { _reg: register_fn_name()? } )
>         }
>     }
> 
>     // Takes one or more `impl Driver` structs. `modname` would just
> be `asix` in real use
>     phy_drivers!(modname, register_fn_name,  AsixAx8872a, AsixAx8872c,
> AsixAc88796b);
> 
> The macro will expand to all of the below:

This code will be executed in the module, right?

>     /// A function that the user will call to register these modules.
> Returns a handle that
>     /// will unregister them on drop
>     fn register_fn_name(module: &'static ThisModule) ->
> Result<RegisteredHandle> {
>         // We can use the existing functions that register multiple phys at once
>         bindings::phy_drivers_register(
>             &__modname_drivers,
>             __modname_drivers.len(),
>             module
>         )?; // <- actually map this error...

module.0 is necessary instead of module, which is private.

>         Ok(RegisteredHandle{
>             unregister: || bindings::phy_drivers_unregister(
>                 &__modname_drivers, __modname_drivers.len()
>             )
>         })
>     }
> 
>     /// Our `phy_device`s are stored here rather than in an allocation
>     /// Don't need to be `#[no_mangle]` since C will never see this directly
>     /// Does need to be mutable based on Andrew's comments
>     pub static __modname_drivers: [Opaque<bindings::phy_device>; 3] = [
>         make_phy_device::<AsixAx8872a>(),
>         make_phy_device::<AsixAx8872c>(),
>         make_phy_device::<AsixAx88796b>(),
>     ];

static needs `Sync` but Opaque isn't `Sync`?

We could use `static mut` here but it needs unsafe. So a macro could
generate something like:  

static mut DRIVERS: [Opaque<bindings::phy_driver>; 2] = [
    phy::Adapter::<PhyAX88772A>::make_phy_driver(),
    phy::Adapter::<PhyAX88772C>::make_phy_driver(),
];
	
impl kernel::Module for RustAsixPhy {
    fn init(module: &'static ThisModule) -> Result<Self> {
        let mut reg: phy::Registration = phy::Registration::new(module);
        unsafe {
            reg.register(&DRIVERS)?;
        }
        Ok(RustAsixPhy { _reg: reg })
    }
}
					    
I guess that module! macro generates some unsafe code so we can use
such macros?
