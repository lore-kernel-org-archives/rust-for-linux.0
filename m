Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76583110B
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 10:26:06 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79167EA
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 03:26:02 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-577c353df5aso470322a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Sep 2023 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695119162; x=1695723962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IG5lthgn1fuT06ipWZCWPOw5Yonxmpj5cwLjFT1IaFM=;
        b=AmoVOg1oa4IE4uQy3gGCYRM5FuWyzDVbKL+TOPdeEIve7ym/05dA4VzAu0UzAqFChO
         MDj2Q3A2BQ7GIfpiPuOsJVoPM3SivDTD9oCEB7m5aROJpJGxlHU/e/oWqm0mTD4NIjSp
         2OljF3O+0lN8/W2/GwV/WeLPYtUoX697Apfo1NsnC8kPKpqaR55ojfIr9MD9Vai9n9xb
         08g/QI19td+pAWs8y3fEdooFdL77ZMh6R2YN7jZc/0s54oSTeGU84qZQ1j83rfnsOLwQ
         B3ros4cJhTWHvmJhggluftAFY9ruwwFgMcdLshbbzygIEMyBg4cT/DwtYiwd8n81jsj6
         pPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695119162; x=1695723962;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IG5lthgn1fuT06ipWZCWPOw5Yonxmpj5cwLjFT1IaFM=;
        b=mGZv4r7+nYwTRuV72twN8ZkJZ2bBLbRM3wYluIAYICiexJbHjbT8uLUtfFpgg/ame0
         fNqv07z+iOWHF42PxoQ6GJdYEdHd5ihzoXrmQ5DDgDGAGTmEGKXKA1PWJf4sU/jPI6IC
         b+ZzLQvydjl8Rsgceamv9Y06Yf+/dKCtwUSl90qTlBbmd8zhbxtTgJPpN85NhJe1MEwr
         MJ/yMgh0WkEbtE9fbHfp0DrpTJdMG+o0Ph/X80LOfNHsQmkbalbGeyEhY72UImSz0UfS
         JqpTPLgs6RwQHIofbLXOiDOTC//d/BgiZ51m+mNWMa/FQIHBUG9ve4yYEEB9ApEiybxR
         KuzQ==
X-Gm-Message-State: AOJu0YyIzh2LNm5T3PPc+akZW83l3r3wUGLtcpQKwEA1t+ochzqLbtAW
	hUN3KqJ9Pfnl2C1dNYaT0gQ=
X-Google-Smtp-Source: AGHT+IEZgBkkcBAH2IVs56gcy/FRrRhvl0+afBGfxJhDrz/NLr1ug7VuTnJus0H/hiWh7S/gmmSbzA==
X-Received: by 2002:a17:90a:6f47:b0:26d:1f75:7fa3 with SMTP id d65-20020a17090a6f4700b0026d1f757fa3mr10072823pjk.4.1695119161796;
        Tue, 19 Sep 2023 03:26:01 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id z9-20020a17090ab10900b00267ae12b80bsm10095122pjq.34.2023.09.19.03.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 03:26:01 -0700 (PDT)
Date: Tue, 19 Sep 2023 19:26:00 +0900 (JST)
Message-Id: <20230919.192600.604528401262292577.ubuntu@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <dfc87664-24c3-88ac-ec34-2b65e898628d@proton.me>
References: <532b57ad-6d35-f0ee-1433-b9b63a91fdd5@proton.me>
	<20230918.220905.1497497848303760774.ubuntu@gmail.com>
	<dfc87664-24c3-88ac-ec34-2b65e898628d@proton.me>
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

On Mon, 18 Sep 2023 15:20:53 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

> On 9/18/23 15:09, FUJITA Tomonori wrote:
>> Hi,
>> 
>> On Mon, 18 Sep 2023 10:22:22 +0000
>> Benno Lossin <benno.lossin@proton.me> wrote:
>> 
>>>   > +/// PHY is internal.
>>>   > +pub const PHY_IS_INTERNAL: u32 = 0x00000001;
>>>   > +/// PHY needs to be reset after the refclk is enabled.
>>>   > +pub const PHY_RST_AFTER_CLK_EN: u32 = 0x00000002;
>>>   > +/// Polling is used to detect PHY status changes.
>>>   > +pub const PHY_POLL_CABLE_TEST: u32 = 0x00000004;
>>>   > +/// Don't suspend.
>>>   > +pub const PHY_ALWAYS_CALL_SUSPEND: u32 = 0x00000008;
>>>
>>> I think we should create a macro for creating flags, it should create a
>>> newtype and
>>> work similar to an enum declaration. On the newtype it should implement
>>> the `Or` trait
>>> for allowing `PHY_IS_INTERNAL | PHY_RST_AFTER_CLK_EN`.
>> 
>> You are thinking about something like:
>> https://crates.io/crates/enumflags2
>> 
>> ?
> 
> I would prefer https://crates.io/crates/bitflags
> because this library does not create a separate type for multiple flags.
> 
> I will look into this and see with what I come up.

Thanks. Until then, I leave the current code alone.


>>>   > +/// Registration structure for a PHY driver.
>>>   > +///
>>>   > +/// `Registration` can keep multiple `phy_drivers` object because
>>>   > +/// commonly one module implements multiple PHYs drivers.
>>>   > +pub struct Registration<const N: usize> {
>>>   > +    module: &'static crate::ThisModule,
>>>   > +    drivers: [Option<Box<bindings::phy_driver>>; N],
>>>
>>> Why is this not a vector? You have to allocate in `register` anyways.
>>> You could also use `Vec::try_with_capacity(N)` to initialize the vector with
>>> capacity for N elements.
>> 
>> I thought that this is simpler. What are advantages of Vec over this?
>> 
> 
> Pushing a new value is a lot simpler, since it only is a single function 
> call and not a loop. You also do not need a generic parameter.

How about the following Vec version, looks simpler?

pub struct Registration {
    module: &'static crate::ThisModule,
    drivers: Vec<*mut bindings::phy_driver>,
}

impl Registration {
    /// Creates a new `Registration` instance.
    pub fn new(module: &'static crate::ThisModule) -> Self {
        Registration {
            module,
            drivers: Vec::new(),
        }
    }

    /// Registers a PHY driver.
    pub fn register<T: Driver>(&mut self) -> Result {
        self.drivers.try_reserve(1)?;
        let drv = Box::into_raw(Box::try_new(Adapter::<T>::make_phy_driver())?);
        let ret = unsafe { bindings::phy_driver_register(drv, self.module.0) };
        if ret != 0 {
            // free memory
            unsafe {
                let _ = Box::from_raw(drv);
            }
            return Err(Error::from_errno(ret));
        }
        // we just called try_reserve() above so it will not fail.
        let _ = self.drivers.try_push(drv);
        Ok(())
    }
}

Trevor proposed another implementation to use static allocation, what
do you think?

https://lore.kernel.org/rust-for-linux/CALNs47vp6D-tqxa5NnE3i-M765GxwVxC2OArjBcfwY3zAcd8TQ@mail.gmail.com/T/#m52eeee680a531f6d1a8b0398c1462a70e38cdb67


> Actually, I talked with Gary and what I suggested is actually not 
> sufficient, because `Box` means that we have a unique pointer, even 
> though it contains an Opaque. So what we would suggest would be to use 
> `Box::into_raw` then both store that pointer and give it to 
> `phy_driver_register`.
> 
>> 
>>> It would also be a good idea to pin it, since the C side will rely on
>>> the pointee not moving
>>> and it will prevent accidentally moving it.
>> 
>> The above drv is touched by only this file. What possible cases where
>> it would be moved?
>> 
> 
> If you do what I wrote above, then this is not a problem. The rationale 
> behind this suggestion was to make it impossible to move the value in a 
> future modification of this file.

an precaution for a future modificaiton of this file, understood.


