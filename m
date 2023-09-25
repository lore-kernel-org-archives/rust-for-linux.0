Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAEC14F61
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 10:24:38 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C00BE
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 03:24:35 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-277317a0528so589749a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695637475; x=1696242275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ttg3+vEvGdL3hP+uNpgHFr0eVq2nKSlnlKg51sNgG0=;
        b=QFjCi4F12FXnG6fh2cB7u04EWB665sIDJu8+PztGupvBZaqLL7/aP21YjndqfNOcRd
         2OI4myFiXCj5sF1/YDLQSjJi8MBraaMz+UtHSaXr19ap4FEYOPqYQPUEzMw169SRWUCs
         mBp4kUgttGvcZNtzIygaKThpBJ1uTH9ObSPAzzjTLZBRDhyX67BRzuwSX59t1xcIKMot
         hfzS7OQXM3lNwNg8PspnaCsXCib+SjXHFAlNhZaWW7WSZ3Qx0XdGerlMunF6vOn1JqoQ
         15PVYuIb38Ohc11TgEj3xQgk/4RhCUgyS1264cwixOV1u+mqOwZpPk+/uQZ3sXNcCf0m
         iqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695637475; x=1696242275;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Ttg3+vEvGdL3hP+uNpgHFr0eVq2nKSlnlKg51sNgG0=;
        b=mrIXOHorDx0E4Nj5gu8655Yl/fxpfIhAMWdqKdFSjw/4XHwDRwfjtKb95zDt0IYkbM
         pF7ItDkRMh48TVV9SYNa/8xIyAe+P8QybxlhSTxNJPZu4yhDUNXhDiYERgUzNIbss+Wd
         PoFlDh8i/vOgkQ2AfGi7sU6GRVF5Cxmw2j1T+Yf7uhks6rn9PLyWbUps9pV1ZAKzzQlY
         R2yLnvxo4TF8tlEB0B+1/01I8ZOOANXDT/pPv7SPJn9EnGz6BevhBgPUNZr4JJkcQqpD
         vTiRTicdRUU+0yyyCAVvmw6lG0FriQwQgLgQ3BaP0T1yWlW65/c4WTQMWCxh84RBuLzq
         gnvA==
X-Gm-Message-State: AOJu0Ywupx8eNZ8G/Lw1vzLZxTkNmk/WXlbZUdDKWdIXI3/W6lVms6tA
	oGfKVCtsh96y6E4b2lR/50M=
X-Google-Smtp-Source: AGHT+IGobw9tWBbvufESsVemdeeTiIfLnC5KqrQH/3fCzUMivK8dynjcRCEDu84frMYOa7Nj18sFEg==
X-Received: by 2002:a17:90a:1541:b0:277:653b:3fef with SMTP id y1-20020a17090a154100b00277653b3fefmr1033551pja.3.1695637474473;
        Mon, 25 Sep 2023 03:24:34 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id ne10-20020a17090b374a00b00260a5ecd273sm7819878pjb.1.2023.09.25.03.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 03:24:33 -0700 (PDT)
Date: Mon, 25 Sep 2023 19:24:33 +0900 (JST)
Message-Id: <20230925.192433.108741056500744806.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <70dbdfd2-9e8d-6985-ae42-0d4f1a7dcef9@proton.me>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
	<20230924064902.1339662-2-fujita.tomonori@gmail.com>
	<70dbdfd2-9e8d-6985-ae42-0d4f1a7dcef9@proton.me>
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

On Sun, 24 Sep 2023 13:19:21 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>> +/// Wraps the kernel's `struct phy_device`.
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::phy_device>);
> 
> This struct should have a type invariant saying that "`self.0` is
> always in a valid state.".

Added.


>> +impl Device {
>> +    /// Creates a new [`Device`] instance from a raw pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>> +    /// may read or write to the `phy_device` object.
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
>> +        unsafe { &mut *(ptr as *mut Self) }
>> +    }
>> +
>> +    /// Gets the id of the PHY.
>> +    pub fn id(&mut self) -> u32 {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> 
> These kinds of safety comments should be replaced by "`phydev` is
> pointing to a valid object by the type invariant of `Self`."
> Also for the other safety comments below.

Fixed all these comments. 


>> +    /// Reads a given C22 PHY register.
>> +    pub fn read(&mut self, regnum: u16) -> Result<u16> {
> 
> I have no knowledge of the driver and the device, but is
> it really fine to supply any 16 bit integer value here?

No, I assume that the C side returns an error in such case.


>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor,
>> +        // so an FFI call with a valid pointer.
>> +        let ret = unsafe {
>> +            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnum as u32)
>> +        };
>> +        if ret < 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            Ok(ret as u16)
>> +        }
> 
> Not sure if this is nicer, but you could use
> `to_result(ret).map(|()| ret as u16)` instead.

I'm not sure either. I have no preference though.

>> +
>> +    /// Writes a given C22 PHY register.
>> +    pub fn write(&mut self, regnum: u16, val: u16) -> Result {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor,
>> +        // so an FFI call with a valid pointer.
>> +        let ret = unsafe {
>> +            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, regnum as u32, val)
>> +        };
>> +        if ret < 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            Ok(())
>> +        }
> 
> Use `error::to_result` instead.

Fixed.

>> +    }
>> +
>> +    /// Reads a paged register.
>> +    pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor,
>> +        // so an FFI call with a valid pointer.
>> +        let ret = unsafe { bindings::phy_read_paged(phydev, page as i32, regnum as u32) };
>> +        if ret < 0 {
>> +            return Err(Error::from_errno(ret));
>> +        } else {
>> +            Ok(ret as u16)
>> +        }
>> +    }
>> +
>> +    /// Resolves the advertisements into PHY settings.
>> +    pub fn resolve_aneg_linkmode(&mut self) {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor,
>> +        // so an FFI call with a valid pointer.
>> +        unsafe {
>> +            bindings::phy_resolve_aneg_linkmode(phydev);
>> +        }
>> +    }
>> +
>> +    /// Executes software reset the PHY via BMCR_RESET bit.
>> +    pub fn genphy_soft_reset(&mut self) -> Result {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor,
>> +        // so an FFI call with a valid pointer.
>> +        let ret = unsafe { bindings::genphy_soft_reset(phydev) };
>> +        if ret < 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            Ok(())
>> +        }
> 
> Use `error::to_result` instead.

Fixed.

>> +    }
>> +
>> +    /// Initializes the PHY.
>> +    pub fn init_hw(&mut self) -> Result {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor,
>> +        // so an FFI call with a valid pointer.
>> +        let ret = unsafe { bindings::phy_init_hw(phydev) };
>> +        if ret != 0 {
>> +            return Err(Error::from_errno(ret));
>> +        } else {
>> +            Ok(())
>> +        }
> 
> Use `error::to_result` instead. And below...

Fixed all.

>> +/// An adapter for the registration of a PHY driver.
>> +pub struct Adapter<T: Driver> {
>> +    _p: PhantomData<T>,
>> +}
> 
> I think this type can be private.
> 
>> +
>> +impl<T: Driver> Adapter<T> {
>> +    /// Creates a new `Adapter` instance.
>> +    pub const fn new() -> Adapter<T> {
>> +        Self { _p: PhantomData }
>> +    }
>> +
>> +    unsafe extern "C" fn soft_reset_callback(
>> +        phydev: *mut bindings::phy_device,
>> +    ) -> core::ffi::c_int {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            T::soft_reset(dev)?;
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn get_features_callback(
>> +        phydev: *mut bindings::phy_device,
>> +    ) -> core::ffi::c_int {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            T::get_features(dev)?;
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_device) -> core::ffi::c_int {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            T::suspend(dev)?;
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn resume_callback(phydev: *mut bindings::phy_device) -> core::ffi::c_int {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            T::resume(dev)?;
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn config_aneg_callback(
>> +        phydev: *mut bindings::phy_device,
>> +    ) -> core::ffi::c_int {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            T::config_aneg(dev)?;
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn read_status_callback(
>> +        phydev: *mut bindings::phy_device,
>> +    ) -> core::ffi::c_int {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            T::read_status(dev)?;
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn match_phy_device_callback(
>> +        phydev: *mut bindings::phy_device,
>> +    ) -> core::ffi::c_int {
>> +        // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +        let dev = unsafe { Device::from_raw(phydev) };
>> +        T::match_phy_device(dev) as i32
>> +    }
>> +
>> +    unsafe extern "C" fn read_mmd_callback(
>> +        phydev: *mut bindings::phy_device,
>> +        devnum: i32,
>> +        regnum: u16,
>> +    ) -> i32 {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            let ret = T::read_mmd(dev, devnum as u8, regnum)?;
>> +            Ok(ret.into())
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn write_mmd_callback(
>> +        phydev: *mut bindings::phy_device,
>> +        devnum: i32,
>> +        regnum: u16,
>> +        val: u16,
>> +    ) -> i32 {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            T::write_mmd(dev, devnum as u8, regnum, val)?;
>> +            Ok(0)
>> +        })
>> +    }
>> +
>> +    unsafe extern "C" fn link_change_notify_callback(phydev: *mut bindings::phy_device) {
>> +        // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +        let dev = unsafe { Device::from_raw(phydev) };
>> +        T::link_change_notify(dev);
>> +    }
>> +
>> +    /// Creates the kernel's `phy_driver` instance.
>> +    ///
>> +    /// This is used by [`module_phy_driver`] macro to create a static array of phy_driver`.
>> +    pub const fn create_phy_driver() -> Opaque<bindings::phy_driver> {
> 
> In order to make `Adapter` a private type, you have
> to make this function standalone (and generic).
> Or create a standalone function that just calls this.

done, nice.


>> +/// Declares a kernel module for PHYs drivers.
>> +///
>> +/// This creates a static array of `struct phy_driver] and registers it.
>> +/// This also corresponds to the kernel's MODULE_DEVICE_TABLE macro, which embeds the information
>> +/// for module loading into the module binary file.
>> +///
>> +/// # Examples
>> +///
>> +/// ```ignore
>> +///
>> +/// use kernel::net::phy::{self, DeviceId, Driver};
>> +/// use kernel::prelude::*;
>> +///
>> +/// kernel::module_phy_driver! {
>> +///     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
>> +///     device_table: [
>> +///         DeviceId::new_with_driver::<PhyAX88772A>(),
>> +///         DeviceId::new_with_driver::<PhyAX88772C>(),
>> +///         DeviceId::new_with_driver::<PhyAX88796B>()
>> +///     ],
>> +///     type: RustAsixPhy,
>> +///     name: "rust_asix_phy",
>> +///     author: "Rust for Linux Contributors",
>> +///     description: "Rust Asix PHYs driver",
>> +///     license: "GPL",
>> +/// }
>> +/// ```
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
>> +            static [<__mod_mdio__ $name _device_table>]: [kernel::bindings::mdio_device_id; $crate::module_phy_driver!(@count_devices $($dev),+) + 1] =
>> +             [ $(kernel::bindings::mdio_device_id{phy_id: $dev.id, phy_id_mask: $dev.mask_as_int()}),+, kernel::bindings::mdio_device_id {phy_id: 0, phy_id_mask: 0}];
>> +        }
>> +    };
>> +
>> +    (drivers: [$($driver:ident),+], device_table: [$($dev:expr),+], type: $modname:ident, $($f:tt)*) => {
>> +        struct Module<$modname> {
> 
> Why do you use `$modname` as a generic parameter? Can't
> you just use `$modname` as the name of this struct?

I followed module_driver! macro and similr macros like
module_platform_driver! in rust branch; a device driver programmer can
define a struct for Module.


>> +            _reg: kernel::net::phy::Registration,
>> +            _p: core::marker::PhantomData<$modname>,
>> +        }
>> +
>> +        type ModuleType = Module<$modname>;
>> +
>> +        $crate::prelude::module! {
>> +             type: ModuleType,
>> +             $($f)*
>> +        }
>> +
>> +        static mut DRIVERS: [kernel::types::Opaque<kernel::bindings::phy_driver>; $crate::module_phy_driver!(@count_devices $($driver),+)] = [
>> +            $(kernel::net::phy::Adapter::<$driver>::create_phy_driver()),+,
>> +        ];
> 
> Not sure if a static is the best way to do this. You
> might also be able to just store this array inside
> of the `Module<$modname>` struct.

With that approach, we can't make the array static, right? I can't
figure out a way to handle lifetime of Registration and
Module<$modname>; Registration needs a pointer to the array for
its drop().

>> +        impl kernel::Module for Module<$modname> {
>> +            fn init(module: &'static ThisModule) -> Result<Self> {
>> +                let mut reg: kernel::net::phy::Registration = kernel::net::phy::Registration::new(module);
>> +                // SAFETY: static `DRIVERS` array is used only in the C side.
> 
> This safety comment should address why you are allowed
> to access this mutable static here.

The Rust sides just passes static `DRIVERS` array to the C side, which
is used only in the C side with appropriate synchronization mechanism.

?

