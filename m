Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3919746A8
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 06:05:46 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CD2DE
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 23:05:43 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso992509266b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 23:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695708342; x=1696313142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGK7VTcoLJShQW3DafPfaJsb71PDYz/RR4ppINy0cNs=;
        b=QUKrjTsWRGDD19rRSM5s4Ltr57yLonEFRaClpY3fXgdmJHAhtB0JwL6ODryCqEQsJu
         CCoKNnGeU6Yy1hR8WnCge7VJddmPLMrvHyJJ78Y1ttRSmq+768AaNMr744OnVFRs1Es9
         iiStarYMOXXcTMfydBnn8rhg3oOgHV4s2qbtjUOAMIXsGx94VpkFAiMa7wHrpbeHtgcg
         qtKY4szce6zaMi35eFjjlDDNYiy1KILV3JOHbF3PfPYWM9XOxMP6YypX3mVTiD9F+nb8
         Rir15WdNQpYiFxshmAc2NLSwULG73DwLVizMAlmKosXQBb239GftMpsinsF4sjgZzEtw
         Lmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695708342; x=1696313142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGK7VTcoLJShQW3DafPfaJsb71PDYz/RR4ppINy0cNs=;
        b=fALb/paz9K2cJNzXA/L4gp7InTW7gnh44Eo/NcXAkTlUt9QVs+8iVI1DHiBGSHQDQy
         PsjDWzj/WULmm4qP4DkxscK79tCK2dl6AwQ1oMWVUwDisq8K3VgEr7u+NVrKmRSmPf3Z
         CGiRQQrV/LyCPyI/nirhldHM5bzSNwaEnuW4gBfDGdtGzmjJJBUWpRqmfC85jy9BkQZl
         mHO+/46uINOGaA9gMkCnc2xp2UJPyoR/RWqBsDdepOylFIAugnv8wPMU+ldqge8o5Oym
         eGj1eDpVDqLFT2ZMPVR0ndPTtJX38TVcqzHmN+71tIZ/f7FHiXyvg5lGWgAGgTaHvM/Y
         dnCw==
X-Gm-Message-State: AOJu0Yy3S7WKFWKrzS7xhXcX9ytDcMb2457AVKVXyC6wLvErRPz6di9V
	Om9LtrrsjBrmSgnZ6e6lUmXWeTQhlMHh61zc2JRTkg==
X-Google-Smtp-Source: AGHT+IE2l3HWBbLWwavCXrPb74wl6fUf1G6S+YOnarob4vEdi+DX+Xl1KTlBT1bDQw8MrO36vyadOesLUTk5G78QLWA=
X-Received: by 2002:a17:906:25d:b0:9ae:587a:e5ce with SMTP id
 29-20020a170906025d00b009ae587ae5cemr8946212ejl.27.1695708342378; Mon, 25 Sep
 2023 23:05:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: by 2002:a17:907:708:b0:9ae:22c3:5b8 with HTTP; Mon, 25 Sep 2023
 23:05:41 -0700 (PDT)
In-Reply-To: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com> <20230924064902.1339662-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 26 Sep 2023 02:05:41 -0400
Message-ID: <CALNs47vyW+A5uwCQ-ug03373xj+QMehx=1pXZ8ViS2jZ8KhfxQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 24, 2023 at 2:49=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> +impl Device {
> +    /// Creates a new [`Device`] instance from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of the lifetime 'a, the pointer must be valid f=
or writing and nobody else
> +    /// may read or write to the `phy_device` object.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mu=
t Self {
> +        unsafe { &mut *(ptr as *mut Self) }
> +    }
> +

Prefer .cast() over `as *` because it makes it makes it harder to
accidentally change mut/const

> +    /// Returns true if the PHY has no link.
> +    pub fn get_link(&mut self) -> bool {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` construc=
tor, so it's valid.
> +        unsafe { (*phydev).link() !=3D 0 }
> +    }
> +

Maybe put a `const LINK_IS_UP: c_uint =3D 0` in that function to make
the magic number a bit more clear.

Also, "true if phy has NO link" seems opposite to me - wouldn't it
make more sense to return true if there is a link? This is opposite of
C's internal representation but I think that's OK to avoid the double
negative. Or even map it to an enum?

> +
> +    /// Returns true if auto-negotiation is completed.
> +    pub fn is_autoneg_completed(&mut self) -> bool {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` construc=
tor, so it's valid.
> +        unsafe { (*phydev).autoneg_complete() !=3D 0 }
> +    }
> +

Probably the same thing as above with a const

> +    /// Reads a given C22 PHY register.
> +    pub fn read(&mut self, regnum: u16) -> Result<u16> {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` construc=
tor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe {
> +            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.ad=
dr, regnum as u32)
> +        };

Prefer `from`/`into` instead of `as` for these lossless casts, it just
gives an sanity check when refactoring. A few other functions that
take `regnum` or `page` could use the same change.

I wonder if the there is any benefit to changing the u32 -> u16 casts
into checked conversions and at least printing

> +    /// Resolves the advertisements into PHY settings.
> +    pub fn resolve_aneg_linkmode(&mut self) {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` construc=
tor,
> +        // so an FFI call with a valid pointer.
> +        unsafe {
> +            bindings::phy_resolve_aneg_linkmode(phydev);
> +        }
> +    }

Semicolon outside the { } for one liner unsafes so it formats more compact

> +    /// Updates the link status.
> +    pub fn genphy_update_link(&mut self) -> Result // ...
> +
> +    /// Reads Link partner ability.
> +    pub fn genphy_read_lpa(&mut self) -> Result // ...
> +
> +    /// Reads PHY abilities.
> +    pub fn genphy_read_abilities(&mut self) -> Result // ...

Do these functions need to be public? It seems like they are just used
to update internal state, which is wrapped up into more user-facing
API


> +/// An adapter for the registration of a PHY driver.
> +pub struct Adapter<T: Driver> {
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: Driver> Adapter<T> {
> +    /// Creates a new `Adapter` instance.
> +    pub const fn new() -> Adapter<T> {
> +        Self { _p: PhantomData }
> +    }
> +
> +    unsafe extern "C" fn soft_reset_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> + [...]

What is the motivation for having an adapter as a type? Since it's
just a dummy struct that has no runtime meaning, I think the code
would be easier to follow if these functions were put in a module

    mod phy_registration_helpers {
        unsafe extern "C" fn soft_reset_callback<T: Driver>(
            phydev: *mut bindings::phy_device,
        ) -> core::ffi::c_int { /* ... */ }
        // ...
    }


> +    /// Creates the kernel's `phy_driver` instance.
> +    ///
> +    /// This is used by [`module_phy_driver`] macro to create a static a=
rray of phy_driver`.
> +    pub const fn create_phy_driver() -> Opaque<bindings::phy_driver> {

This construction looks much better than v1 :)

> +
> +/// Corresponds to functions in `struct phy_driver`.
> +#[vtable]
> +pub trait Driver {
> +    /// Corresponds to `flags` in `struct phy_driver`.
> +    const FLAGS: u32 =3D 0;
> +    /// Corresponds to `name` in `struct phy_driver`.
> +    const NAME: &'static CStr;
> +    /// Corresponds to `phy_id` in `struct phy_driver`.
> +    const PHY_ID: u32 =3D 0;
> +    /// Corresponds to `phy_id_mask` in `struct phy_driver`.
> +    const PHY_ID_MASK: u32 =3D 0;

This also seems better to me, thanks for updating. Could this just
take a `DeviceMask`?

> +/// Registration structure for a PHY driver.
> +pub struct Registration {
> +    module: &'static crate::ThisModule,
> +    drivers: Option<&'static [Opaque<bindings::phy_driver>]>,
> +}

This new structure without the generics looks much better, with one note be=
low

> +impl Registration {
> +    /// Creates a new `Registration` instance.
> +    pub fn new(module: &'static crate::ThisModule) -> Self {
> +        Registration {
> +            module,
> +            drivers: None,
> +        }
> +    }
> +
> +    /// Registers a PHY driver.
> +    pub fn register(&mut self, drivers: &'static [Opaque<bindings::phy_d=
river>]) -> Result {
> +        if drivers.len() > 0 {
> +            // SAFETY: Just an FFI call.
> +            let ret =3D unsafe {
> +                bindings::phy_drivers_register(
> +                    drivers[0].get(),
> +                    drivers.len() as i32,
> +                    self.module.0,
> +                )
> +            };
> +            if ret !=3D 0 {
> +                return Err(Error::from_errno(ret));
> +            }
> +            self.drivers =3D Some(drivers);
> +            Ok(())
> +        } else {
> +            Err(code::EINVAL)
> +        }
> +    }
> +}

I don't think there's any need to have `new` and `register` broken
out. This is actually a _bad_ pattern because the deregistration
function gets called (via drop) even if it is never registered.

I believe that `phy_drivers_unregister` should check against this, but
all the same I would strongly suggest:

    #[must_use]
    pub fn register(
        module: &'static crate::ThisModule,
        drivers: &'static [Opaque<bindings::phy_driver>]
    ) -> Result<Self>;

And no other function.

Note the `must_use` to make sure the handle is held rather than
instantly dropped.

> +impl Drop for Registration {
> +    fn drop(&mut self) {
> +        if let Some(drv) =3D self.drivers.take() {
> +            // SAFETY: Just an FFI call.
> +            unsafe {
> +                bindings::phy_drivers_unregister(drv[0].get(), drv.len()=
 as i32);
> +            }
> +        }
> +    }
> +}
> +


> +const DEVICE_MASK_EXACT: u32 =3D !0;
> +const DEVICE_MASK_MODEL: u32 =3D !0 << 4;
> +const DEVICE_MASK_VENDOR: u32 =3D !0 << 10;

See my comment above about maybe having this be an enum

> +enum DeviceMask {
> +    Exact,
> +    Model,
> +    Vendor,
> +    Custom(u32),
> +}

LGTM

> +/// Declares a kernel module for PHYs drivers.
> +///
> +/// This creates a static array of `struct phy_driver] and registers it.
> +/// This also corresponds to the kernel's MODULE_DEVICE_TABLE macro, whi=
ch embeds the information
> +/// for module loading into the module binary file.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +///
> +/// use kernel::net::phy::{self, DeviceId, Driver};
> +/// use kernel::prelude::*;
> +///
> +/// kernel::module_phy_driver! {
> +///     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
> +///     device_table: [
> +///         DeviceId::new_with_driver::<PhyAX88772A>(),
> +///         DeviceId::new_with_driver::<PhyAX88772C>(),
> +///         DeviceId::new_with_driver::<PhyAX88796B>()
> +///     ],
> +///     type: RustAsixPhy,
> +///     name: "rust_asix_phy",
> +///     author: "Rust for Linux Contributors",
> +///     description: "Rust Asix PHYs driver",
> +///     license: "GPL",
> +/// }
> +/// ```

I'm glad this worked out, a single macro is nice.

Since almost all devices will just use their standard DeviceId, could
that be done by default unless a specific ID is specified? Something
like

    drivers: [
        PhyAX88772A,
        // register the same phy with a second ID
        { phy: PhyAX88772A, id: some_other_device_id },
        PhyAX88772C,
        PhyAX88796B
    ],
    type: RustAsixPhy,
    // ...

Though there may be a nicer looking syntax

> +#[macro_export]
> +macro_rules! module_phy_driver {
> +    (@replace_expr $_t:tt $sub:expr) =3D> {$sub};
> +
> +    (@count_devices $($x:expr),*) =3D> {
> +        0usize $(+ $crate::module_phy_driver!(@replace_expr $x 1usize))*
> +    };
> +
> +    (@device_table $name:ident, [$($dev:expr),+]) =3D> {
> +        ::kernel::macros::paste! {
> +            #[no_mangle]
> +            static [<__mod_mdio__ $name _device_table>]: [kernel::bindin=
gs::mdio_device_id; $crate::module_phy_driver!(@count_devices $($dev),+) + =
1] =3D
> +             [ $(kernel::bindings::mdio_device_id{phy_id: $dev.id, phy_i=
d_mask: $dev.mask_as_int()}),+, kernel::bindings::mdio_device_id {phy_id: 0=
, phy_id_mask: 0}];
> +        }
> +    };
> +
> +    (drivers: [$($driver:ident),+], device_table: [$($dev:expr),+], type=
: $modname:ident, $($f:tt)*) =3D> {
> +        struct Module<$modname> {
> +            _reg: kernel::net::phy::Registration,
> +            _p: core::marker::PhantomData<$modname>,
> +        }
> +
> +        type ModuleType =3D Module<$modname>;
> +
> +        $crate::prelude::module! {
> +             type: ModuleType,
> +             $($f)*
> +        }
> +
> +        static mut DRIVERS: [kernel::types::Opaque<kernel::bindings::phy=
_driver>; $crate::module_phy_driver!(@count_devices $($driver),+)] =3D [
> +            $(kernel::net::phy::Adapter::<$driver>::create_phy_driver())=
,+,
> +        ];
> +
> +        impl kernel::Module for Module<$modname> {
> +            fn init(module: &'static ThisModule) -> Result<Self> {
> +                let mut reg: kernel::net::phy::Registration =3D kernel::=
net::phy::Registration::new(module);
> +                // SAFETY: static `DRIVERS` array is used only in the C =
side.
> +                unsafe {
> +                    reg.register(&DRIVERS)?;
> +                }
> +
> +                Ok(Module {
> +                    _reg: reg,
> +                    _p: core::marker::PhantomData,
> +                })
> +            }
> +        }
> +
> +        $crate::module_phy_driver!(@device_table $modname, [$($dev),+]);
> +    }
> +}

These have to be hand formatted until rustfmt is able to handle macro
bodies, just try to make it look a bit more like code

    (@device_table $name:ident, [$($dev:expr),+]) =3D> {
        ::kernel::macros::paste! {
            #[no_mangle]
            static [<__mod_mdio__ $name _device_table>]: [
                kernel::bindings::mdio_device_id;
                $crate::module_phy_driver!(@count_devices $($dev),+) + 1
            ] =3D [
                $(kernel::bindings::mdio_device_id {
                    phy_id: $dev.id,
                    phy_id_mask: $dev.mask_as_int()
                }),+
                kernel::bindings::mdio_device_id {
                    phy_id: 0,
                    phy_id_mask: 0
                }
            ];
        }
    };

and

        static mut DRIVERS: [
            kernel::types::Opaque<kernel::bindings::phy_driver>;
            $crate::module_phy_driver!(@count_devices $($driver),+)
        ] =3D [
            $(kernel::net::phy::Adapter::<$driver>::create_phy_driver()),+
        ];

Note also that `$( ... ),+,` expands the same as `$( ... ),+` so the
second is a bit cleaner without the redundant `,` (at least in my
quick test this worked)

> --
> 2.34.1
>

Thanks for all the updates. Overall the usability is going in the
right direction since v1
