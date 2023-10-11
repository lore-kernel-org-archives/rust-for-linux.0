Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F315E81
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 06:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVy+TZRF"
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E776593
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 23:56:57 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c746bc3bceso14704705ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 23:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697007417; x=1697612217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEJ1tL0vPGYu9XTXX2Dj0b58JK3w4UJ00dNSEqOmx5U=;
        b=RVy+TZRFUxWEJTEQF6c7/v0GHHU7rJ+1vOw0ZNC3WCPuW5MA5HFn9b6gQ6dxlOsUQN
         QKUCGV77ZeBr3F8+71fyn1st/JNKqH8X/Z85orXS6t13O/2Eux1ug55EA9BK2UGtGgPX
         GQYaOsshgxOTml6rzrODEEmnEheTThBX3gZsPaImUwmfYAwV2pfMyMYFv8omFbyDeo7I
         fwxSrs6faEtvztLomu1Yltoa5XKzvcNJydbQI+WL3zzooe0kkh0qoqR0PqEGHPpWiF6R
         tPYkcPXkSKzObJIzbdYrus49dL8kdmqXOX9vGVHHmq4xvOzaHwbVxtJLS3WTQWIENumA
         jOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697007417; x=1697612217;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NEJ1tL0vPGYu9XTXX2Dj0b58JK3w4UJ00dNSEqOmx5U=;
        b=VIIRKxPuKXIyA2aMqjQBBG28ZvMKIS5INZ5Zj5fzzuFXXUmERwzG0eeeU2T2JuTdb6
         /rcdpofZ1OH7gr+gATeTFmBvHsCvb907KRuhLvq99Rtic/S+1oXrI71RogPhnI69zGaF
         MwyeBYJAYCfC+EXe70VMuIEol7a0Ldi0b36Qwy3t5SgIh9ebyqUZR9m9/r8/wNsR7ff2
         P1lO/grCcvLWlpW6bHcpGkrZ2zrqwjQMdkt4s6uCCxiH5TK64jF3jgHNoLnJX380Bx25
         36gsAON4EjadcTdnDqnAmHWj7a9axNFFsDrjK5U4SXItv2TnlQJzw0nQLyK4CWkkOQzb
         dP8Q==
X-Gm-Message-State: AOJu0YzNbZHhbOJc0tXezjF8I84HUpuActJvmrk2usB/n6CuyMQcOBTJ
	OdRYMH7I0qShP/yLCSZtYIc=
X-Google-Smtp-Source: AGHT+IFAF/hREUQsJXSc4w/zZ5PmQRxh3SART9P8stlSKflptc7GlCl/2nl1XQdM/7um5Z+WBaMn/A==
X-Received: by 2002:a17:90b:1bce:b0:27c:ebab:5c60 with SMTP id oa14-20020a17090b1bce00b0027cebab5c60mr3569816pjb.2.1697007417151;
        Tue, 10 Oct 2023 23:56:57 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id l19-20020a17090b079300b002791491f811sm11095392pjz.8.2023.10.10.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 23:56:56 -0700 (PDT)
Date: Wed, 11 Oct 2023 15:56:56 +0900 (JST)
Message-Id: <20231011.155656.1088666692728270489.fujita.tomonori@gmail.com>
To: wedsonaf@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com,
 benno.lossin@proton.me
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
	<20230928225518.2197768-2-fujita.tomonori@gmail.com>
	<CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
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

On Tue, 10 Oct 2023 16:19:02 -0300
Wedson Almeida Filho <wedsonaf@gmail.com> wrote:

>> +impl Device {
>> +    /// Creates a new [`Device`] instance from a raw pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>> +    /// may read or write to the `phy_device` object.
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> 
> We don't want `bindings` to be used in public functions. We will hide
> it from drivers eventually because we don't want them calling the C
> functions directly.

Sorry, I should have removed `pub` here. PHY drivers don't use this
function.


>> +/// Creates the kernel's `phy_driver` instance.
>> +///
>> +/// This is used by [`module_phy_driver`] macro to create a static array of phy_driver`.
>> +pub const fn create_phy_driver<T: Driver>() -> Opaque<bindings::phy_driver> {
> 
> Another instance of `bindings` in a public function.

Reexporting works?

type DriverType = bindings::phy_driver;


>> +/// Corresponds to functions in `struct phy_driver`.
>> +///
>> +/// This is used to register a PHY driver.
>> +#[vtable]
>> +pub trait Driver {
>> +    /// Defines certain other features this PHY supports.
>> +    const FLAGS: u32 = 0;
> 
> Are these the flags defined in the `flags` module? If so, please add a
> reference here to the module containing the flags.

Ok

>> +    /// The friendly name of this PHY type.
>> +    const NAME: &'static CStr;
> 
> Nit: please add a blank line between these. (and FLAGS & NAME).

Ok

>> +/// Registration structure for a PHY driver.
>> +///
>> +/// # Invariants
>> +///
>> +/// The `drivers` points to an array of `struct phy_driver`, which is
>> +/// registered to the kernel via `phy_drivers_register`.
>> +pub struct Registration {
>> +    drivers: Option<&'static [Opaque<bindings::phy_driver>]>,
> 
> Why is this optional?

Oops, leftover of old code.


>> +}
>> +
>> +impl Registration {
>> +    /// Registers a PHY driver.
>> +    #[must_use]
> 
> This function returns a `Result`, which itself already has `must_use`.
> Are you sure you need this here?

Ah, we don't need `must_use` here.


>> +    pub fn register(
>> +        module: &'static crate::ThisModule,
>> +        drivers: &'static [Opaque<bindings::phy_driver>],
> 
> Another instance of `bindings` in a public function.
> 
>> +    ) -> Result<Self> {
>> +        if drivers.len() == 0 {
>> +            return Err(code::EINVAL);
>> +        }
>> +        // SAFETY: `drivers` has static lifetime and used only in the C side.
>> +        to_result(unsafe {
>> +            bindings::phy_drivers_register(drivers[0].get(), drivers.len() as i32, module.0)
> 
> driver.len().try_into()?
> 
> If someone manages to create a slice that doesn't fit in an i32, we should fail.

Ok

>> +///     type: RustAsixPhy,
>> +///     name: "rust_asix_phy",
>> +///     author: "Rust for Linux Contributors",
>> +///     description: "Rust Asix PHYs driver",
>> +///     license: "GPL",
>> +/// }
>> +/// ```
> 
> The example above doesn't compile. Please make sure your examples do.
> (For any functions you need to implement but are not used in the
> example, you can always use `todo!()`.)

Ok

>> +#[macro_export]
>> +macro_rules! module_phy_driver {
>> +    (@replace_expr $_t:tt $sub:expr) => {$sub};
>> +
>> +    (@count_devices $($x:expr),*) => {
>> +        0usize $(+ $crate::module_phy_driver!(@replace_expr $x 1usize))*
>> +    };
>> +
>> +    (@device_table $name:ident, [$($dev:expr),+]) => {
>> +        ::kernel::macros::paste! {
>> +            #[no_mangle]
>> +            static [<__mod_mdio__ $name _device_table>]: [
>> +                kernel::bindings::mdio_device_id;
>> +                $crate::module_phy_driver!(@count_devices $($dev),+) + 1
>> +            ] = [
>> +                $(kernel::bindings::mdio_device_id {
>> +                    phy_id: $dev.id,
>> +                    phy_id_mask: $dev.mask_as_int()
>> +                }),+,
>> +                kernel::bindings::mdio_device_id {
>> +                    phy_id: 0,
>> +                    phy_id_mask: 0
>> +                }
>> +            ];
>> +        }
>> +    };
>> +
>> +    (drivers: [$($driver:ident),+], device_table: [$($dev:expr),+], type: $modname:ident, $($f:tt)*) => {
>> +        struct Module<$modname> {
>> +            _reg: kernel::net::phy::Registration,
>> +            _p: core::marker::PhantomData<$modname>,
>> +        }
> 
> Why can't this struct be implemented in core::net::phy and just
> referenced from this macro?

Seems that driver! macro's type works only with type inside the
current crate.
