Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CEA20330
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJJPeGwb"
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C75194
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 07:28:18 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d9a3d737d66so2904447276.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697034498; x=1697639298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xtowTnCiL9gS6f0UOABUGQOIRBeFw5pzMKB6/JA69oc=;
        b=BJJPeGwb7smgY7unM9KVOy6DRzQxz15tf8onMwA0+Ky0xNqqYhZIBSjKLgQEd1TC4g
         /cu5DjTd6skWMIFPplJZcEW26udBARkEmchtejS1tESCpkA1jEvpNqTqqCOZJ4pdR0qf
         ObmhGrPcG0xjDQ72SgKe68o4UtJ777pmYdoywCjWAl6lByX3bbhTcnL/h8TtaoLzMTl9
         DKo6LK1Uf0v7b6MwBd+3MHFbDumMOvqvNRr0O16MvXSi12j+rDIN9epNflTIKD2eK9y5
         sqdqP2z3DdvvnphTYirx9GNm7/c3+HT6BeLT6DhATIZAjKJ17HaNlLSk6XyW2aTJxw9q
         EMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697034498; x=1697639298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtowTnCiL9gS6f0UOABUGQOIRBeFw5pzMKB6/JA69oc=;
        b=s7o/ZbOYqIVdfdQ5WtWxeuGkWVzag9jPLP7ynYESGC8xw0fZN6pnFkyl8QLQrXiyfq
         rY7ZIrsaaYis8ieIQ5Ugo95eBrVbBVfpZrWdqF3AzKe5gKYiI65Q95DdY8GMfBs1nVKD
         V7PfLuAKawg8fwVMLCIqASQ6BPpe6XFUAGie32HmWOjOHH3bbreXNT99mJuUjKVPKqFC
         zJ47tmlLuWe+9X1nFthQSlrqxKaZyabJF10QCFvxRVtyfiPRm7qFasNJbr97k7eQNYTo
         sBDTGkUnBWhDW6jYizbtGdjteFx2YCFfEeEEm5XADKla/UxrW0+xCTBbDJRAup0BnN4l
         a6Qg==
X-Gm-Message-State: AOJu0YwGIsxv/dSEulGfAqjisnFb6kaYVQtgJIrlALx3S0sJKrRMQKCI
	QztxTlpq1tFZpzBOgl8Uw/g7Z1hnMsGOS34HUhY=
X-Google-Smtp-Source: AGHT+IHydyj70Jx9NX/2aGmQG+/nxy/UxOdw77QeotsZwXmUu1/b3Gmor6U2InuZ++KP43+TWuKbn3SmH22JjSE+LIw=
X-Received: by 2002:a25:74ce:0:b0:d9a:485f:5852 with SMTP id
 p197-20020a2574ce000000b00d9a485f5852mr6083130ybc.13.1697034497529; Wed, 11
 Oct 2023 07:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
 <20231011.155656.1088666692728270489.fujita.tomonori@gmail.com>
In-Reply-To: <20231011.155656.1088666692728270489.fujita.tomonori@gmail.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Wed, 11 Oct 2023 11:28:06 -0300
Message-ID: <CANeycqrjD8VW-7oUV6Q9xYh1=WmAX4X-JEzMUaxvggu3OCXjFA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, 11 Oct 2023 at 03:56, FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>
> On Tue, 10 Oct 2023 16:19:02 -0300
> Wedson Almeida Filho <wedsonaf@gmail.com> wrote:
>
> >> +impl Device {
> >> +    /// Creates a new [`Device`] instance from a raw pointer.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> >> +    /// may read or write to the `phy_device` object.
> >> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> >
> > We don't want `bindings` to be used in public functions. We will hide
> > it from drivers eventually because we don't want them calling the C
> > functions directly.
>
> Sorry, I should have removed `pub` here. PHY drivers don't use this
> function.
>
>
> >> +/// Creates the kernel's `phy_driver` instance.
> >> +///
> >> +/// This is used by [`module_phy_driver`] macro to create a static array of phy_driver`.
> >> +pub const fn create_phy_driver<T: Driver>() -> Opaque<bindings::phy_driver> {
> >
> > Another instance of `bindings` in a public function.
>
> Reexporting works?
>
> type DriverType = bindings::phy_driver;

No, that's a type alias. If you really want to expose it, you're
better off creating a [transparent] new type that wraps
bindings::phy_driver. This way `bindings` is never visible to drivers.

>
> >> +/// Corresponds to functions in `struct phy_driver`.
> >> +///
> >> +/// This is used to register a PHY driver.
> >> +#[vtable]
> >> +pub trait Driver {
> >> +    /// Defines certain other features this PHY supports.
> >> +    const FLAGS: u32 = 0;
> >
> > Are these the flags defined in the `flags` module? If so, please add a
> > reference here to the module containing the flags.
>
> Ok
>
> >> +    /// The friendly name of this PHY type.
> >> +    const NAME: &'static CStr;
> >
> > Nit: please add a blank line between these. (and FLAGS & NAME).
>
> Ok
>
> >> +/// Registration structure for a PHY driver.
> >> +///
> >> +/// # Invariants
> >> +///
> >> +/// The `drivers` points to an array of `struct phy_driver`, which is
> >> +/// registered to the kernel via `phy_drivers_register`.
> >> +pub struct Registration {
> >> +    drivers: Option<&'static [Opaque<bindings::phy_driver>]>,
> >
> > Why is this optional?
>
> Oops, leftover of old code.
>
>
> >> +}
> >> +
> >> +impl Registration {
> >> +    /// Registers a PHY driver.
> >> +    #[must_use]
> >
> > This function returns a `Result`, which itself already has `must_use`.
> > Are you sure you need this here?
>
> Ah, we don't need `must_use` here.
>
>
> >> +    pub fn register(
> >> +        module: &'static crate::ThisModule,
> >> +        drivers: &'static [Opaque<bindings::phy_driver>],
> >
> > Another instance of `bindings` in a public function.
> >
> >> +    ) -> Result<Self> {
> >> +        if drivers.len() == 0 {
> >> +            return Err(code::EINVAL);
> >> +        }
> >> +        // SAFETY: `drivers` has static lifetime and used only in the C side.
> >> +        to_result(unsafe {
> >> +            bindings::phy_drivers_register(drivers[0].get(), drivers.len() as i32, module.0)
> >
> > driver.len().try_into()?
> >
> > If someone manages to create a slice that doesn't fit in an i32, we should fail.
>
> Ok
>
> >> +///     type: RustAsixPhy,
> >> +///     name: "rust_asix_phy",
> >> +///     author: "Rust for Linux Contributors",
> >> +///     description: "Rust Asix PHYs driver",
> >> +///     license: "GPL",
> >> +/// }
> >> +/// ```
> >
> > The example above doesn't compile. Please make sure your examples do.
> > (For any functions you need to implement but are not used in the
> > example, you can always use `todo!()`.)
>
> Ok
>
> >> +#[macro_export]
> >> +macro_rules! module_phy_driver {
> >> +    (@replace_expr $_t:tt $sub:expr) => {$sub};
> >> +
> >> +    (@count_devices $($x:expr),*) => {
> >> +        0usize $(+ $crate::module_phy_driver!(@replace_expr $x 1usize))*
> >> +    };
> >> +
> >> +    (@device_table $name:ident, [$($dev:expr),+]) => {
> >> +        ::kernel::macros::paste! {
> >> +            #[no_mangle]
> >> +            static [<__mod_mdio__ $name _device_table>]: [
> >> +                kernel::bindings::mdio_device_id;
> >> +                $crate::module_phy_driver!(@count_devices $($dev),+) + 1
> >> +            ] = [
> >> +                $(kernel::bindings::mdio_device_id {
> >> +                    phy_id: $dev.id,
> >> +                    phy_id_mask: $dev.mask_as_int()
> >> +                }),+,
> >> +                kernel::bindings::mdio_device_id {
> >> +                    phy_id: 0,
> >> +                    phy_id_mask: 0
> >> +                }
> >> +            ];
> >> +        }
> >> +    };
> >> +
> >> +    (drivers: [$($driver:ident),+], device_table: [$($dev:expr),+], type: $modname:ident, $($f:tt)*) => {
> >> +        struct Module<$modname> {
> >> +            _reg: kernel::net::phy::Registration,
> >> +            _p: core::marker::PhantomData<$modname>,
> >> +        }
> >
> > Why can't this struct be implemented in core::net::phy and just
> > referenced from this macro?
>
> Seems that driver! macro's type works only with type inside the
> current crate.

What `driver!` macro are you referring to? And where does this
requirement come from? (As a data point, other driver macros we
implemented in the past all use Module implementations in the kernel
crate.)
