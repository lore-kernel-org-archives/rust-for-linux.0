Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4940C182CA
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwBQQC9Q"
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19DCC4
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 07:59:26 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-692af7b641cso1254262b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697036366; x=1697641166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wesW2jyV3JIQNoZ40GiIVrAu1UFEdfdQyzZR3S8tZ3M=;
        b=XwBQQC9QDMK4RXULzBL/HL8dbCr61cb8cZs0BVCH1YH6s3xI9veRCOZMiAEYfRhxF4
         d4oJBb0MtUrheiZw1HqVzNy0bHmYE0U3Q02xf8xTlkuNpF/3NmSV8VUXHkqWT5n4mb90
         N2D/0xebGTZR04aR5aE/5UBk3X5+38hmT79sVpaqljRUHLiBbrGbyu4U/wESNY4b+qoB
         6IStI+aKEIHEySusE0e6zNCe7FI65bXR7zmjbpXEDNf2sJimJtndD0989PFHlH+Amggf
         Mj5k2b6UzCnIDTgdU1tyH/xUa9+H1Pjg6Pc0Z731LKc5n0QYmAO1sBlYty3E5tjlgyY5
         W4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697036366; x=1697641166;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wesW2jyV3JIQNoZ40GiIVrAu1UFEdfdQyzZR3S8tZ3M=;
        b=A4Ht9TrYILBP/JgEQOVsgPyUkaISWpnAbAuUv89BSvZiAIst8Abi3VfCuKneoESWwC
         Q8UGA0kO92XCFY9KdsqTPpA95WxbO8/g7v+xYeMFU9ncXwCZHsUv6XKn4Rco7Xdf9KKV
         p/e/1f/SbJQltCQHYPXK24FHof1hs8efoxw6fH3xB4f89WxxH7USQEaeQeb6UJyLWBtx
         pGtg7cpHQsU8nWeIhypohNphn/XzlnrH/esp4PWUecg+9WwM6YOOXjz+lyfumiUaLlO/
         kRaYEpWMXEZz70C8IK9k+omLvNMHXY5Tq612c+h8otntCq0VlSXjNjxS203CxPyz+13O
         Wbmg==
X-Gm-Message-State: AOJu0Yz3O2H1N5xgD5wHVq9FYkQdS8/mGa1ORe2oDtZibjfo8vKf/znU
	Htox8xpM9rlpLJXlZENANkUVkRpY2tdlm3Gs
X-Google-Smtp-Source: AGHT+IH/z3NDjKnrjqGw/vzHV6t/hIjZIG3KjXmcDo9B8mzG1GXanfonZsd1AaFMC0z9q6I93Yq3dA==
X-Received: by 2002:a05:6a00:10c2:b0:68f:c9f6:f366 with SMTP id d2-20020a056a0010c200b0068fc9f6f366mr24243751pfu.0.1697036365936;
        Wed, 11 Oct 2023 07:59:25 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b00692e9bf82fcsm10119157pfi.182.2023.10.11.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 07:59:25 -0700 (PDT)
Date: Wed, 11 Oct 2023 23:59:10 +0900 (JST)
Message-Id: <20231011.235910.1137283342083567433.fujita.tomonori@gmail.com>
To: wedsonaf@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com,
 benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANeycqrjD8VW-7oUV6Q9xYh1=WmAX4X-JEzMUaxvggu3OCXjFA@mail.gmail.com>
References: <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
	<20231011.155656.1088666692728270489.fujita.tomonori@gmail.com>
	<CANeycqrjD8VW-7oUV6Q9xYh1=WmAX4X-JEzMUaxvggu3OCXjFA@mail.gmail.com>
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

On Wed, 11 Oct 2023 11:28:06 -0300
Wedson Almeida Filho <wedsonaf@gmail.com> wrote:

>> >> +#[macro_export]
>> >> +macro_rules! module_phy_driver {
>> >> +    (@replace_expr $_t:tt $sub:expr) => {$sub};
>> >> +
>> >> +    (@count_devices $($x:expr),*) => {
>> >> +        0usize $(+ $crate::module_phy_driver!(@replace_expr $x 1usize))*
>> >> +    };
>> >> +
>> >> +    (@device_table $name:ident, [$($dev:expr),+]) => {
>> >> +        ::kernel::macros::paste! {
>> >> +            #[no_mangle]
>> >> +            static [<__mod_mdio__ $name _device_table>]: [
>> >> +                kernel::bindings::mdio_device_id;
>> >> +                $crate::module_phy_driver!(@count_devices $($dev),+) + 1
>> >> +            ] = [
>> >> +                $(kernel::bindings::mdio_device_id {
>> >> +                    phy_id: $dev.id,
>> >> +                    phy_id_mask: $dev.mask_as_int()
>> >> +                }),+,
>> >> +                kernel::bindings::mdio_device_id {
>> >> +                    phy_id: 0,
>> >> +                    phy_id_mask: 0
>> >> +                }
>> >> +            ];
>> >> +        }
>> >> +    };
>> >> +
>> >> +    (drivers: [$($driver:ident),+], device_table: [$($dev:expr),+], type: $modname:ident, $($f:tt)*) => {
>> >> +        struct Module<$modname> {
>> >> +            _reg: kernel::net::phy::Registration,
>> >> +            _p: core::marker::PhantomData<$modname>,
>> >> +        }
>> >
>> > Why can't this struct be implemented in core::net::phy and just
>> > referenced from this macro?
>>
>> Seems that driver! macro's type works only with type inside the
>> current crate.
> 
> What `driver!` macro are you referring to? And where does this
> requirement come from? (As a data point, other driver macros we
> implemented in the past all use Module implementations in the kernel
> crate.)

Sorry, module! macro and please see the net-next v3 patchset because
this macro was updateded. With your approach, I got the following
error:

error[E0117]: only traits defined in the current crate can be
implemented for types defined outside of the crate
  --> drivers/net/phy/ax88796b_rust.rs:13:1
     |
     13 | / kernel::module_phy_driver! {
     14 | |     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
     15 | |     device_table: [
     16 | |         DeviceId::new_with_driver::<PhyAX88772A>(),
     ...  |
     23 | |     license: "GPL",
     24 | | }
        | | ^
        | | |
        | |_impl doesn't use only types from inside the current crate
        |   `kernel::net::phy::Module` is not defined in the current crate
