Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787701FCB
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 12:56:45 +0000 (UTC)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837F6C6
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 05:56:41 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d857847be8cso5164464276.0
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695560200; x=1696165000; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+MQKaPEYB8FniIFfUI+oSN31WdiyLQJXSGxB0mzjhhI=;
        b=QeYSXoS8F85yDm8SO81NKT2ZNmV2IoCJEZPpzEgIF0zvjhpyyMJ9q1S0ZrFWVZO/eP
         j186UNbnxUyGsMcsdozRdVoTB03/BQw9Matpce2e9cWrLDj0SwovcFkuFkNcYfuhnZOx
         y62zlC0f82lg1DjcWjeRxFnleIV+lMbov8feq3F/FwIm3SjFmAFoe1y7OOMsl0VQ935h
         32ypW//VbQOS4QO7zUFioB8PRAXb/CYOUUYDk8KFfwHcxl0sgVcA32x/BbD8sdCGsBvN
         x9MVBDTcEYOhWILRUKolaDOVWG8JweLsun6EFuvORl/1+QMBKvzJRHl0jthrrpNGRrxV
         nXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695560200; x=1696165000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MQKaPEYB8FniIFfUI+oSN31WdiyLQJXSGxB0mzjhhI=;
        b=T3cC9ddR6UVB9aWqp2XAg3V42i3180kUIpxSH+ytlgBXklYad+oxkHoKk9ZyHFFvli
         u/AESDbIe7/f/MjjxyroA6LboU+Ur59/f5Jap6V5CAsQ6AZdoPw+EGne+t4edFQs7u7+
         z6rhkrn50HRYHxptnxGuDsMdXGcgszxhVHLb51blrqqrN4Y+hwy5V5GaatIyA523WFV+
         m6wp1S1yJ6p4mpLCMmnj1EVWIxDUcz6R3QI+d4j23yg73G6ur1Wx8BKZ+cQXzDd0mhPh
         M5UvqR6fCrg4wkz1DYzCocldT+jQVL74Xxhc70nvQtaObUODt00wJSbVqmEXarqGao3E
         Fckg==
X-Gm-Message-State: AOJu0YwTF/Cz/DnfuFUWVnhZVJ1tdcbGiwM6xJfJib0Hufy8tHRLdc+W
	QR55GorqmGp61JUUWXxb73sm1Hg9yZENARf/K7I=
X-Google-Smtp-Source: AGHT+IE9q0mZk8lDOqt4Ca01JH2zmrxancubXRoSlj4ONoaT1G+kAmKb6tZXkkh9L8DI9Ui0dTgI1hMsoJgSsGnOrbU=
X-Received: by 2002:a25:ca84:0:b0:d80:c80:af18 with SMTP id
 a126-20020a25ca84000000b00d800c80af18mr4176765ybg.52.1695560200399; Sun, 24
 Sep 2023 05:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com> <20230924064902.1339662-2-fujita.tomonori@gmail.com>
In-Reply-To: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Sun, 24 Sep 2023 09:56:29 -0300
Message-ID: <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, 
	miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, 24 Sept 2023 at 03:49, FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This patch adds abstractions to implement network PHY drivers; the
> driver registration and bindings for some of callback functions in
> struct phy_driver and many genphy_ functions.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/Makefile                   |   1 +
>  rust/bindings/bindings_helper.h |   3 +
>  rust/kernel/lib.rs              |   3 +
>  rust/kernel/net.rs              |   6 +
>  rust/kernel/net/phy.rs          | 760 ++++++++++++++++++++++++++++++++
>  5 files changed, 773 insertions(+)
>  create mode 100644 rust/kernel/net.rs
>  create mode 100644 rust/kernel/net/phy.rs
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 87958e864be0..f67e55945b36 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -331,6 +331,7 @@ quiet_cmd_bindgen = BINDGEN $@
>        cmd_bindgen = \
>         $(BINDGEN) $< $(bindgen_target_flags) \
>                 --use-core --with-derive-default --ctypes-prefix core::ffi --no-layout-tests \
> +               --rustified-enum phy_state\
>                 --no-debug '.*' \
>                 -o $@ -- $(bindgen_c_flags_final) -DMODULE \
>                 $(bindgen_target_cflags) $(bindgen_target_extra)
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index c91a3c24f607..ec4ee09a34ad 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -8,6 +8,9 @@
>
>  #include <kunit/test.h>
>  #include <linux/errname.h>
> +#include <linux/ethtool.h>
> +#include <linux/mdio.h>
> +#include <linux/phy.h>
>  #include <linux/slab.h>
>  #include <linux/refcount.h>
>  #include <linux/wait.h>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index e8811700239a..0588422e273c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -14,6 +14,7 @@
>  #![no_std]
>  #![feature(allocator_api)]
>  #![feature(coerce_unsized)]
> +#![feature(const_maybe_uninit_zeroed)]
>  #![feature(dispatch_from_dyn)]
>  #![feature(new_uninit)]
>  #![feature(receiver_trait)]
> @@ -36,6 +37,8 @@
>  pub mod ioctl;
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;
> +#[cfg(CONFIG_NET)]
> +pub mod net;
>  pub mod prelude;
>  pub mod print;
>  mod static_assert;
> diff --git a/rust/kernel/net.rs b/rust/kernel/net.rs
> new file mode 100644
> index 000000000000..b49b052969e5
> --- /dev/null
> +++ b/rust/kernel/net.rs
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Networking.
> +
> +#[cfg(CONFIG_PHYLIB)]
> +pub mod phy;
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> new file mode 100644
> index 000000000000..3b96b1e0f9ef
> --- /dev/null
> +++ b/rust/kernel/net/phy.rs
> @@ -0,0 +1,760 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Network PHY device.
> +//!
> +//! C headers: [`include/linux/phy.h`](../../../../include/linux/phy.h).
> +
> +use crate::{bindings, error::*, prelude::vtable, str::CStr, types::Opaque};
> +use core::marker::PhantomData;
> +
> +/// Corresponds to the kernel's `enum phy_state`.
> +#[derive(PartialEq)]
> +pub enum DeviceState {
> +    /// PHY device and driver are not ready for anything.
> +    Down,
> +    /// PHY is ready to send and receive packets.
> +    Ready,
> +    /// PHY is up, but no polling or interrupts are done.
> +    Halted,
> +    /// PHY is up, but is in an error state.
> +    Error,
> +    /// PHY and attached device are ready to do work.
> +    Up,
> +    /// PHY is currently running.
> +    Running,
> +    /// PHY is up, but not currently plugged in.
> +    NoLink,
> +    /// PHY is performing a cable test.
> +    CableTest,
> +}
> +
> +/// Represents duplex mode

nit: please add a period to the end of sentences. If nothing else, for
consistency with the rest of the Rust code.

> +pub enum DuplexMode {
> +    /// Full-duplex mode
> +    Half,
> +    /// Half-duplex mode
> +    Full,
> +    /// Unknown
> +    Unknown,
> +}
> +
> +/// Wraps the kernel's `struct phy_device`.
> +#[repr(transparent)]
> +pub struct Device(Opaque<bindings::phy_device>);
> +
> +impl Device {
> +    /// Creates a new [`Device`] instance from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> +    /// may read or write to the `phy_device` object.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {

Does this function need to be public? Can it be `pub(crate)`?

Is the requirement that nobody else may read or write to `phy_device` realistic?

> +        unsafe { &mut *(ptr as *mut Self) }
> +    }
> +
> +    /// Gets the id of the PHY.
> +    pub fn id(&mut self) -> u32 {
> +        let phydev = Opaque::get(&self.0);

I don't think you need this verbose syntax, you could just do:

let phydev = self.0.get();

The same apply to all instances below.

> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe { (*phydev).phy_id }
> +    }
> +
> +    /// Gets the state of the PHY.
> +    pub fn state(&mut self) -> DeviceState {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        let state = unsafe { (*phydev).state };
> +        match state {
> +            bindings::phy_state::PHY_DOWN => DeviceState::Down,
> +            bindings::phy_state::PHY_READY => DeviceState::Ready,
> +            bindings::phy_state::PHY_HALTED => DeviceState::Halted,
> +            bindings::phy_state::PHY_ERROR => DeviceState::Error,
> +            bindings::phy_state::PHY_UP => DeviceState::Up,
> +            bindings::phy_state::PHY_RUNNING => DeviceState::Running,
> +            bindings::phy_state::PHY_NOLINK => DeviceState::NoLink,
> +            bindings::phy_state::PHY_CABLETEST => DeviceState::CableTest,
> +        }

Wouldn't it make more sense to implement `TryFrom<T>` for
`DeviceState` (where `T` is the type of `phydev.state`)? This way
separate the concerns: `TryFrom` does the conversion and `state()`
fetches it from a PHY.

> +    }
> +
> +    /// Returns true if the PHY has no link.
> +    pub fn get_link(&mut self) -> bool {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe { (*phydev).link() != 0 }
> +    }
> +
> +    /// Returns true if auto-negotiation is enabled.
> +    pub fn is_autoneg_enabled(&mut self) -> bool {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe { (*phydev).autoneg() == bindings::AUTONEG_ENABLE }
> +    }
> +
> +    /// Returns true if auto-negotiation is completed.
> +    pub fn is_autoneg_completed(&mut self) -> bool {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe { (*phydev).autoneg_complete() != 0 }
> +    }
> +
> +    /// Sets the speed of the PHY.
> +    pub fn set_speed(&mut self, speed: i32) {

Are negative speeds meaningful? If not, we should make `speed`
unsigned. (And convert appropriately when storing in phydev.speed.)

> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe {
> +            (*phydev).speed = speed;
> +        }
> +    }
> +
> +    /// Sets duplex mode.
> +    pub fn set_duplex(&mut self, mode: DuplexMode) {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe {
> +            match mode {
> +                DuplexMode::Full => (*phydev).duplex = bindings::DUPLEX_FULL as i32,
> +                DuplexMode::Half => (*phydev).duplex = bindings::DUPLEX_HALF as i32,
> +                DuplexMode::Unknown => (*phydev).duplex = bindings::DUPLEX_UNKNOWN as i32,
> +            }
> +        }

To avoid repeating `(*phydev).duplex =` and to reduce the amount of
code inside the unsafe block, I suggest you do something like this
here:

let v = match mode {
    DuplexMode::Full => bindings::DUPLEX_FULL,
    DuplexMode::Half => bindings::DUPLEX_HALF,
    DuplexMode::Unknown => bindings::DUPLEX_UNKNOWN,
};

// SAFETY: This object is initialized by the `from_raw` constructor,
so it's valid.
unsafe { (*phydev).duplex = v};


In fact, for this enum, you wan to use #[repr(i32)] and assign values
from `bindings` so that you can avoid the match as convert using just
`mode as i32`. See for example:

https://github.com/wedsonaf/linux/blob/rtarfs/rust/kernel/fs.rs#L71

> +    }
> +
> +    /// Reads a given C22 PHY register.
> +    pub fn read(&mut self, regnum: u16) -> Result<u16> {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe {
> +            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnum as u32)
> +        };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret as u16)
> +        }
> +    }

Is there any reason why you can't use `to_result` here?

I'm thinking something along the lines of:

    // SAFETY: ...
    let ret = to_result(unsafe { bindings::mdiobus_read(...) })?;
    Ok(ret as u16)

The same applies to similar code below.

> +
> +    /// Writes a given C22 PHY register.
> +    pub fn write(&mut self, regnum: u16, val: u16) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe {
> +            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, regnum as u32, val)
> +        };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Reads a paged register.
> +    pub fn read_paged(&mut self, page: u16, regnum: u16) -> Result<u16> {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::phy_read_paged(phydev, page as i32, regnum as u32) };
> +        if ret < 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(ret as u16)
> +        }
> +    }
> +
> +    /// Resolves the advertisements into PHY settings.
> +    pub fn resolve_aneg_linkmode(&mut self) {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        unsafe {
> +            bindings::phy_resolve_aneg_linkmode(phydev);
> +        }
> +    }
> +
> +    /// Executes software reset the PHY via BMCR_RESET bit.
> +    pub fn genphy_soft_reset(&mut self) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::genphy_soft_reset(phydev) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Initializes the PHY.
> +    pub fn init_hw(&mut self) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::phy_init_hw(phydev) };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Starts auto-negotiation.
> +    pub fn start_aneg(&mut self) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::phy_start_aneg(phydev) };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Resumes the PHY via BMCR_PDOWN bit.
> +    pub fn genphy_resume(&mut self) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::genphy_resume(phydev) };
> +        if ret != 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Suspends the PHY via BMCR_PDOWN bit.
> +    pub fn genphy_suspend(&mut self) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::genphy_suspend(phydev) };
> +        if ret != 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Checks the link status and updates current link state.
> +    pub fn genphy_read_status(&mut self) -> Result<u16> {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::genphy_read_status(phydev) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret as u16)
> +        }
> +    }
> +
> +    /// Updates the link status.
> +    pub fn genphy_update_link(&mut self) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::genphy_update_link(phydev) };
> +        if ret < 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Reads Link partner ability.
> +    pub fn genphy_read_lpa(&mut self) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::genphy_read_lpa(phydev) };
> +        if ret < 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Reads PHY abilities.
> +    pub fn genphy_read_abilities(&mut self) -> Result {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::genphy_read_abilities(phydev) };
> +        if ret != 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +}
> +
> +// Will be replaced with the bitflags macro once it's merged in upstream.
> +const fn bit(shift: u8) -> u32 {
> +    1 << shift
> +}
> +/// PHY is internal.
> +pub const PHY_IS_INTERNAL: u32 = bit(0);
> +/// PHY needs to be reset after the refclk is enabled.
> +pub const PHY_RST_AFTER_CLK_EN: u32 = bit(1);
> +/// Polling is used to detect PHY status changes.
> +pub const PHY_POLL_CABLE_TEST: u32 = bit(2);
> +/// Don't suspend.
> +pub const PHY_ALWAYS_CALL_SUSPEND: u32 = bit(3);

To group these consts together so that it's clear they're related, we
normally create a module: see for example these file flags:
https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/file.rs#L25

/// Flags associated with a [`File`].
pub mod flags {
    /// File is opened in append mode.
    pub const O_APPEND: u32 = bindings::O_APPEND;

   /...
}

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
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.

I'm sure the C the API guarantees that it's valid. But does it
guarantee that nobody else is reading or writing to phydev? I haven't
looked at the code but I'd be very surprised if it did.

In any case, this is part of the safety requirements of `from_raw`.
You need to address this likely unsoundness here and in the functions
below.

> +            let dev = unsafe { Device::from_raw(phydev) };
> +            T::soft_reset(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn get_features_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +            let dev = unsafe { Device::from_raw(phydev) };
> +            T::get_features(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_device) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +            let dev = unsafe { Device::from_raw(phydev) };
> +            T::suspend(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn resume_callback(phydev: *mut bindings::phy_device) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +            let dev = unsafe { Device::from_raw(phydev) };
> +            T::resume(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn config_aneg_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +            let dev = unsafe { Device::from_raw(phydev) };
> +            T::config_aneg(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn read_status_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +            let dev = unsafe { Device::from_raw(phydev) };
> +            T::read_status(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn match_phy_device_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +        let dev = unsafe { Device::from_raw(phydev) };
> +        T::match_phy_device(dev) as i32
> +    }
> +
> +    unsafe extern "C" fn read_mmd_callback(
> +        phydev: *mut bindings::phy_device,
> +        devnum: i32,
> +        regnum: u16,
> +    ) -> i32 {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +            let dev = unsafe { Device::from_raw(phydev) };
> +            let ret = T::read_mmd(dev, devnum as u8, regnum)?;

For devnum, I think it makes more sense to use `try_into` to convert
it to u8 and fail if it doesn't fit. Or have `T::read_mmd` take an
`i32` as argument.

> +            Ok(ret.into())
> +        })
> +    }
> +
> +    unsafe extern "C" fn write_mmd_callback(
> +        phydev: *mut bindings::phy_device,
> +        devnum: i32,
> +        regnum: u16,
> +        val: u16,
> +    ) -> i32 {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +            let dev = unsafe { Device::from_raw(phydev) };
> +            T::write_mmd(dev, devnum as u8, regnum, val)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn link_change_notify_callback(phydev: *mut bindings::phy_device) {
> +        // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> +        let dev = unsafe { Device::from_raw(phydev) };
> +        T::link_change_notify(dev);
> +    }
> +
> +    /// Creates the kernel's `phy_driver` instance.
> +    ///
> +    /// This is used by [`module_phy_driver`] macro to create a static array of phy_driver`.
> +    pub const fn create_phy_driver() -> Opaque<bindings::phy_driver> {
> +        Opaque::new(bindings::phy_driver {
> +            name: T::NAME.as_char_ptr() as *mut i8,
> +            flags: <T>::FLAGS,

I don't think you need these brackets around `T`, i.e., `T::FLAGS`
should suffice.

The same applies to all instances below.

> +            phy_id: <T>::PHY_ID,
> +            phy_id_mask: <T>::PHY_ID_MASK,
> +            soft_reset: if <T>::HAS_SOFT_RESET {
> +                Some(Self::soft_reset_callback)
> +            } else {
> +                None
> +            },
> +            get_features: if <T>::HAS_GET_FEATURES {
> +                Some(Self::get_features_callback)
> +            } else {
> +                None
> +            },
> +            match_phy_device: if <T>::HAS_MATCH_PHY_DEVICE {
> +                Some(Self::match_phy_device_callback)
> +            } else {
> +                None
> +            },
> +            suspend: if <T>::HAS_SUSPEND {
> +                Some(Self::suspend_callback)
> +            } else {
> +                None
> +            },
> +            resume: if <T>::HAS_RESUME {
> +                Some(Self::resume_callback)
> +            } else {
> +                None
> +            },
> +            config_aneg: if <T>::HAS_CONFIG_ANEG {
> +                Some(Self::config_aneg_callback)
> +            } else {
> +                None
> +            },
> +            read_status: if <T>::HAS_READ_STATUS {
> +                Some(Self::read_status_callback)
> +            } else {
> +                None
> +            },
> +            read_mmd: if <T>::HAS_READ_MMD {
> +                Some(Self::read_mmd_callback)
> +            } else {
> +                None
> +            },
> +            write_mmd: if <T>::HAS_WRITE_MMD {
> +                Some(Self::write_mmd_callback)
> +            } else {
> +                None
> +            },
> +            link_change_notify: if <T>::HAS_LINK_CHANGE_NOTIFY {
> +                Some(Self::link_change_notify_callback)
> +            } else {
> +                None
> +            },
> +            // SAFETY: The rest is zeroed out to initialize `struct phy_driver`,
> +            // sets `Option<&F>` to be `None`.
> +            ..unsafe { core::mem::MaybeUninit::<bindings::phy_driver>::zeroed().assume_init() }

I think you could just use bindings::phy_driver::default() here.

> +        })
> +    }
> +}
> +
> +/// Corresponds to functions in `struct phy_driver`.
> +#[vtable]

We use this only when the C side offers some default non-trivial
behaviour for some of the callbacks (in which case it doesn't make
sense to replicate in Rust). But if the default behaviour is similar
to our default implementations below (e.g., return `code::ENOTSUPP`),
then we can simply drop this tag and simplify the code above by
dropping the `HAS_XXX` checks.

Do you actually need vtable in PHY?

> +pub trait Driver {
> +    /// Corresponds to `flags` in `struct phy_driver`.

Please document this properly. It's to ok to explain what it refers
to, but we should also say what it does and what the accepted  values
are. (For example, but putting the valid flags in a module -- as I
suggest above -- and say here that valid values are combinations of
the value in module `X`).

Part of the reason we're introducing Rust is to make it simpler (and
safer) to write kernel code. This includes better documentation and
not having to go read the C code to understand how things work.

In other words, if someone is writing a PHY driver in Rust, ideally
they should be able to just read the Rust documentation and know what
they need to do.

I know it's painful to do this (I've done it several times), but
that's part of the work we need to put in while building these
abstractions.

> +    const FLAGS: u32 = 0;
> +    /// Corresponds to `name` in `struct phy_driver`.
> +    const NAME: &'static CStr;
> +    /// Corresponds to `phy_id` in `struct phy_driver`.
> +    const PHY_ID: u32 = 0;
> +    /// Corresponds to `phy_id_mask` in `struct phy_driver`.
> +    const PHY_ID_MASK: u32 = 0;
> +
> +    /// Corresponds to `soft_reset` in `struct phy_driver`.
> +    fn soft_reset(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `get_features` in `struct phy_driver`.
> +    fn get_features(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `match_phy_device` in `struct phy_driver`.
> +    fn match_phy_device(_dev: &mut Device) -> bool {
> +        false
> +    }
> +
> +    /// Corresponds to `config_aneg` in `struct phy_driver`.
> +    fn config_aneg(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `read_status` in `struct phy_driver`.
> +    fn read_status(_dev: &mut Device) -> Result<u16> {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `suspend` in `struct phy_driver`.
> +    fn suspend(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `resume` in `struct phy_driver`.
> +    fn resume(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `read_mmd` in `struct phy_driver`.
> +    fn read_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16) -> Result<u16> {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `write_mmd` in `struct phy_driver`.
> +    fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `link_change_notify` in `struct phy_driver`.
> +    fn link_change_notify(_dev: &mut Device) {}
> +}
> +
> +/// Registration structure for a PHY driver.
> +pub struct Registration {
> +    module: &'static crate::ThisModule,
> +    drivers: Option<&'static [Opaque<bindings::phy_driver>]>,
> +}
> +
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
> +    pub fn register(&mut self, drivers: &'static [Opaque<bindings::phy_driver>]) -> Result {
> +        if drivers.len() > 0 {
> +            // SAFETY: Just an FFI call.

This is not a good-enough justification.

There's a bunch of pointers passed in. You need to justify why they're
good now and why they'll remain good. Does `phy_drivers_register`
require that pointers remain alive just during the call or until
they're unregistered? If the latter (which I assume to be the case),
you need to justify how it is that they remain valid. If they need to
be pinned, how are you guaranteeing that?

> +            let ret = unsafe {
> +                bindings::phy_drivers_register(
> +                    drivers[0].get(),
> +                    drivers.len() as i32,
> +                    self.module.0,
> +                )
> +            };
> +            if ret != 0 {
> +                return Err(Error::from_errno(ret));
> +            }
> +            self.drivers = Some(drivers);
> +            Ok(())
> +        } else {
> +            Err(code::EINVAL)
> +        }
> +    }
> +}
> +
> +impl Drop for Registration {
> +    fn drop(&mut self) {
> +        if let Some(drv) = self.drivers.take() {
> +            // SAFETY: Just an FFI call.

Again, this isn't really a good justification.

At the very least, these must have been previously registered (and not
unregistered since then).

> +            unsafe {
> +                bindings::phy_drivers_unregister(drv[0].get(), drv.len() as i32);
> +            }
> +        }
> +    }
> +}
> +
> +// SAFETY: `Registration` does not expose any of its state across threads.
> +unsafe impl Send for Registration {}
> +
> +// SAFETY: `Registration` does not expose any of its state across threads.
> +unsafe impl Sync for Registration {}
> +
> +const DEVICE_MASK_EXACT: u32 = !0;
> +const DEVICE_MASK_MODEL: u32 = !0 << 4;
> +const DEVICE_MASK_VENDOR: u32 = !0 << 10;
> +
> +/// Represents the kernel's `struct mdio_device_id`.
> +pub struct DeviceId {
> +    /// Corresponds to `phy_id` in `struct mdio_device_id`.
> +    pub id: u32,
> +    mask: DeviceMask,
> +}
> +
> +impl DeviceId {
> +    /// Creates a new instance with the exact match mask.
> +    pub const fn new_with_exact_mask(id: u32) -> Self {
> +        DeviceId {
> +            id,
> +            mask: DeviceMask::Exact,
> +        }
> +    }
> +
> +    /// Creates a new instance with the model match mask.
> +    pub const fn new_with_model_mask(id: u32) -> Self {
> +        DeviceId {
> +            id,
> +            mask: DeviceMask::Model,
> +        }
> +    }
> +
> +    /// Creates a new instance with the vendor match mask.
> +    pub const fn new_with_vendor_mask(id: u32) -> Self {
> +        DeviceId {
> +            id,
> +            mask: DeviceMask::Vendor,
> +        }
> +    }
> +
> +    /// Creates a new instance with a custom match mask.
> +    pub const fn new_with_custom_mask(id: u32, mask: u32) -> Self {
> +        DeviceId {
> +            id,
> +            mask: DeviceMask::Custom(mask),
> +        }
> +    }
> +
> +    /// Creates a new instance from [`Driver`].
> +    pub const fn new_with_driver<T: Driver>() -> Self {
> +        DeviceId {
> +            id: T::PHY_ID,
> +            mask: DeviceMask::new(T::PHY_ID_MASK),
> +        }
> +    }
> +
> +    /// Get a mask as u32.
> +    pub const fn mask_as_int(self) -> u32 {
> +        match self.mask {
> +            DeviceMask::Exact => DEVICE_MASK_EXACT,
> +            DeviceMask::Model => DEVICE_MASK_MODEL,
> +            DeviceMask::Vendor => DEVICE_MASK_VENDOR,
> +            DeviceMask::Custom(mask) => mask,
> +        }
> +    }
> +}
> +
> +enum DeviceMask {
> +    Exact,
> +    Model,
> +    Vendor,
> +    Custom(u32),
> +}
> +
> +impl DeviceMask {
> +    const fn new(mask: u32) -> Self {
> +        match mask {
> +            DEVICE_MASK_EXACT => DeviceMask::Exact,
> +            DEVICE_MASK_MODEL => DeviceMask::Model,
> +            DEVICE_MASK_VENDOR => DeviceMask::Vendor,
> +            _ => DeviceMask::Custom(mask),
> +        }
> +    }
> +}
> +
> +/// Declares a kernel module for PHYs drivers.
> +///
> +/// This creates a static array of `struct phy_driver] and registers it.

Typo: missing backtick.

> +/// This also corresponds to the kernel's MODULE_DEVICE_TABLE macro, which embeds the information
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
> +#[macro_export]
> +macro_rules! module_phy_driver {
> +    (@replace_expr $_t:tt $sub:expr) => {$sub};
> +
> +    (@count_devices $($x:expr),*) => {
> +        0usize $(+ $crate::module_phy_driver!(@replace_expr $x 1usize))*
> +    };
> +
> +    (@device_table $name:ident, [$($dev:expr),+]) => {
> +        ::kernel::macros::paste! {
> +            #[no_mangle]
> +            static [<__mod_mdio__ $name _device_table>]: [kernel::bindings::mdio_device_id; $crate::module_phy_driver!(@count_devices $($dev),+) + 1] =
> +             [ $(kernel::bindings::mdio_device_id{phy_id: $dev.id, phy_id_mask: $dev.mask_as_int()}),+, kernel::bindings::mdio_device_id {phy_id: 0, phy_id_mask: 0}];
> +        }
> +    };
> +
> +    (drivers: [$($driver:ident),+], device_table: [$($dev:expr),+], type: $modname:ident, $($f:tt)*) => {
> +        struct Module<$modname> {
> +            _reg: kernel::net::phy::Registration,
> +            _p: core::marker::PhantomData<$modname>,
> +        }
> +
> +        type ModuleType = Module<$modname>;
> +
> +        $crate::prelude::module! {
> +             type: ModuleType,
> +             $($f)*
> +        }
> +
> +        static mut DRIVERS: [kernel::types::Opaque<kernel::bindings::phy_driver>; $crate::module_phy_driver!(@count_devices $($driver),+)] = [
> +            $(kernel::net::phy::Adapter::<$driver>::create_phy_driver()),+,
> +        ];
> +
> +        impl kernel::Module for Module<$modname> {
> +            fn init(module: &'static ThisModule) -> Result<Self> {
> +                let mut reg: kernel::net::phy::Registration = kernel::net::phy::Registration::new(module);
> +                // SAFETY: static `DRIVERS` array is used only in the C side.
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
> --
> 2.34.1
>
>
