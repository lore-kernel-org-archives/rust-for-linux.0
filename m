Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3F31C2AC
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 09:57:18 +0000 (UTC)
Received: from gimli.kloenk.dev (gimli.kloenk.dev [IPv6:2a01:4f8:c012:b874::])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECAA12C
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 02:57:03 -0700 (PDT)
From: Finn Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1695031020; bh=XklqQ5BpSYf/zFNRB5oAL47eT8hEnIAmqKt66YNyDTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D45R4HKUNi6KoeSdQ1+O3DfJCHMD5jLX01gyp2MNL/klZzZBqc1JJz1sJamxpop/p
	 rErUrBAr1+OS9Q3ARD6Xk6DYGvOI0yyQTnXRO0Dukf1PIXw6RMIsRZMXO97oHuTemt
	 1gSDg9Hp1UGSM+3k0VcZ38VOIMAg+68nGUACMcAY=
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Date: Mon, 18 Sep 2023 11:56:58 +0200
Message-ID: <758E90DF-ECA5-485E-8446-91CBC2845999@kloenk.dev>
In-Reply-To: <20230913133609.1668758-2-fujita.tomonori@gmail.com>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 13 Sep 2023, at 15:36, FUJITA Tomonori wrote:

> This patch adds abstractions to implement network PHY drivers; the
> driver registration and bindings for some of callback functions in
> struct phy_driver and many genphy_ functions.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/bindings/bindings_helper.h |   3 +
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/net.rs              |   6 +
>  rust/kernel/net/phy.rs          | 651 ++++++++++++++++++++++++++++++++=

>  4 files changed, 662 insertions(+)
>  create mode 100644 rust/kernel/net.rs
>  create mode 100644 rust/kernel/net/phy.rs
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
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
> index e8811700239a..e84fa513dfda 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -36,6 +36,8 @@
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
> index 000000000000..2c5ac5e3213a
> --- /dev/null
> +++ b/rust/kernel/net/phy.rs
> @@ -0,0 +1,651 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Network PHY device.
> +//!
> +//! C headers: [`include/linux/phy.h`](../../../../include/linux/phy.h=
).
> +
> +use crate::{bindings, error::*, prelude::vtable, prelude::Box, str::CS=
tr, types::Opaque};
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
> +    /// Unknown, not defined in the kernel.
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
> +    /// For the duration of the lifetime 'a, the pointer must be valid=
 for writing and nobody else
> +    /// may read or write to the `phy_device` object.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a =
mut Self {
> +        unsafe { &mut *(ptr as *mut Self) }
> +    }
> +
> +    /// Gets the id of the PHY.
> +    pub fn id(&mut self) -> u32 {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor, so it's valid.
> +        unsafe { (*phydev).phy_id }
> +    }
> +
> +    /// Returns true if the PHY has no link.
> +    pub fn link(&mut self) -> bool {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor, so it's valid.
> +        unsafe { (*phydev).link() !=3D 0 }
> +    }
> +
> +    /// Gets the state of the PHY.
> +    pub fn state(&mut self) -> DeviceState {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor, so it's valid.
> +        let state =3D unsafe { (*phydev).state };
> +        match state {
> +            0 =3D> DeviceState::Down,
> +            1 =3D> DeviceState::Ready,
> +            2 =3D> DeviceState::Halted,
> +            3 =3D> DeviceState::Error,
> +            4 =3D> DeviceState::Up,
> +            5 =3D> DeviceState::Running,
> +            6 =3D> DeviceState::NoLink,
> +            7 =3D> DeviceState::CableTest,
> +            _ =3D> DeviceState::Unknown,
> +        }
> +    }
> +
> +    /// Returns true if auto-negotiation is enabled.
> +    pub fn is_autoneg_enabled(&mut self) -> bool {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor, so it's valid.
> +        unsafe { (*phydev).autoneg() =3D=3D bindings::AUTONEG_ENABLE }=

> +    }
> +
> +    /// Returns true if auto-negotiation is completed.
> +    pub fn is_autoneg_completed(&mut self) -> bool {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor, so it's valid.
> +        unsafe { (*phydev).autoneg_complete() !=3D 0 }
> +    }
> +
> +    /// Sets the speed of the PHY.
> +    pub fn set_speed(&mut self, speed: i32) {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor, so it's valid.
> +        unsafe {
> +            (*phydev).speed =3D speed;
> +        }
> +    }
> +
> +    /// Sets duplex mode.
> +    pub fn set_duplex(&mut self, is_full: bool) {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor, so it's valid.
> +        unsafe {
> +            if is_full {
> +                (*phydev).duplex =3D bindings::DUPLEX_FULL as i32;
> +            } else {
> +                (*phydev).duplex =3D bindings::DUPLEX_HALF as i32;
> +            }
> +        }
> +    }
> +
> +    /// Executes software reset the PHY via BMCR_RESET bit.
> +    pub fn soft_reset(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::genphy_soft_reset(phydev) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Reads a given PHY register.
> +    pub fn read(&mut self, regnum: u32) -> Result<i32> {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D
> +            unsafe { bindings::mdiobus_read((*phydev).mdio.bus, (*phyd=
ev).mdio.addr, regnum) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret)
> +        }
> +    }
> +
> +    /// Writes a given PHY register.
> +    pub fn write(&mut self, regnum: u32, val: u16) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe {
> +            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio=
=2Eaddr, regnum, val)
> +        };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Reads a given PHY register without the MDIO bus lock taken.
> +    pub fn lockless_read(&mut self, regnum: u32) -> Result<i32> {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.

This function also has the safety requirement of holding the mdiobus lock=
=2E
This could either be an unsafe function, or some other way to ensure the =
caller holds the lock.

> +        let ret =3D
> +            unsafe { bindings::__mdiobus_read((*phydev).mdio.bus, (*ph=
ydev).mdio.addr, regnum) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret)
> +        }
> +    }
> +
> +    /// Writes a given PHY register without the MDIO bus lock taken.
> +    pub fn lockless_write(&mut self, regnum: u32, val: u16) -> Result =
{
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.

Same as above.

> +        let ret =3D unsafe {
> +            bindings::__mdiobus_write((*phydev).mdio.bus, (*phydev).md=
io.addr, regnum, val)
> +        };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Resumes the PHY via BMCR_PDOWN bit.
> +    pub fn resume(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::genphy_resume(phydev) };
> +        if ret !=3D 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Suspends the PHY via BMCR_PDOWN bit.
> +    pub fn suspend(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::genphy_suspend(phydev) };
> +        if ret !=3D 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Checks the link status and updates current link state.
> +    pub fn read_status(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::genphy_read_status(phydev) };
> +        if ret !=3D 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Reads a paged register.
> +    pub fn read_paged(&mut self, page: i32, regnum: u32) -> Result<i32=
> {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::phy_read_paged(phydev, page, re=
gnum) };
> +        if ret < 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(ret)
> +        }
> +    }
> +
> +    /// Updates the link status.
> +    pub fn update_link(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::genphy_update_link(phydev) };
> +        if ret < 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Reads Link partner ability.
> +    pub fn read_lpa(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::genphy_read_lpa(phydev) };
> +        if ret < 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Resolves the advertisements into PHY settings.
> +    pub fn resolve_aneg_linkmode(&mut self) {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        unsafe {
> +            bindings::phy_resolve_aneg_linkmode(phydev);
> +        }
> +    }
> +
> +    /// Initializes the PHY.
> +    pub fn init_hw(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::phy_init_hw(phydev) };
> +        if ret !=3D 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Starts auto-negotiation.
> +    pub fn start_aneg(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::phy_start_aneg(phydev) };
> +        if ret !=3D 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Reads PHY abilities from Clause 22 registers.
> +    pub fn read_abilities(&mut self) -> Result {
> +        let phydev =3D Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constr=
uctor,
> +        // so an FFI call with a valid pointer.
> +        let ret =3D unsafe { bindings::genphy_read_abilities(phydev) }=
;
> +        if ret !=3D 0 {
> +            return Err(Error::from_errno(ret));
> +        } else {
> +            Ok(())
> +        }
> +    }
> +}
> +
> +/// PHY is internal.
> +pub const PHY_IS_INTERNAL: u32 =3D 0x00000001;
> +/// PHY needs to be reset after the refclk is enabled.
> +pub const PHY_RST_AFTER_CLK_EN: u32 =3D 0x00000002;
> +/// Polling is used to detect PHY status changes.
> +pub const PHY_POLL_CABLE_TEST: u32 =3D 0x00000004;
> +/// Don't suspend.
> +pub const PHY_ALWAYS_CALL_SUSPEND: u32 =3D 0x00000008;
> +
> +/// An adapter for the registration of a PHY driver.
> +pub struct Adapter<T: Driver> {
> +    name: &'static CStr,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: Driver> Adapter<T> {
> +    /// Creates a new `Adapter` instance.
> +    pub const fn new(name: &'static CStr) -> Adapter<T> {
> +        Self {
> +            name,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    unsafe extern "C" fn soft_reset_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            T::soft_reset(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn get_features_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            T::get_features(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_d=
evice) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            T::suspend(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn resume_callback(phydev: *mut bindings::phy_de=
vice) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            T::resume(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn config_aneg_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            T::config_aneg(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn read_page_callback(phydev: *mut bindings::phy=
_device) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            let ret =3D T::read_page(dev)?;
> +            Ok(ret)
> +        })
> +    }
> +
> +    unsafe extern "C" fn write_page_callback(
> +        phydev: *mut bindings::phy_device,
> +        page: i32,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            T::write_page(dev, page)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn read_status_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            T::read_status(dev)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn match_phy_device_callback(
> +        phydev: *mut bindings::phy_device,
> +    ) -> core::ffi::c_int {
> +        // SAFETY: The C API guarantees that `phydev` is valid while t=
his function is running.
> +        let dev =3D unsafe { Device::from_raw(phydev) };
> +        T::match_phy_device(dev) as i32
> +    }
> +
> +    unsafe extern "C" fn read_mmd_callback(
> +        phydev: *mut bindings::phy_device,
> +        devnum: i32,
> +        regnum: u16,
> +    ) -> i32 {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            let ret =3D T::read_mmd(dev, devnum, regnum)?;
> +            Ok(ret)
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
> +            // SAFETY: The C API guarantees that `phydev` is valid whi=
le this function is running.
> +            let dev =3D unsafe { Device::from_raw(phydev) };
> +            T::write_mmd(dev, devnum, regnum, val)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    unsafe extern "C" fn link_change_notify_callback(phydev: *mut bind=
ings::phy_device) {
> +        // SAFETY: The C API guarantees that `phydev` is valid while t=
his function is running.
> +        let dev =3D unsafe { Device::from_raw(phydev) };
> +        T::link_change_notify(dev);
> +    }
> +
> +    fn driver(&self) -> bindings::phy_driver {
> +        bindings::phy_driver {
> +            name: self.name.as_char_ptr() as *mut i8,
> +            flags: <T>::FLAGS,
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
> +            read_page: if <T>::HAS_READ_PAGE {
> +                Some(Self::read_page_callback)
> +            } else {
> +                None
> +            },
> +            write_page: if <T>::HAS_WRITE_PAGE {
> +                Some(Self::write_page_callback)
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
> +            ..unsafe { core::mem::MaybeUninit::<bindings::phy_driver>:=
:zeroed().assume_init() }
> +        }
> +    }
> +}
> +
> +/// Corresponds to functions in `struct phy_driver`.
> +#[vtable]
> +pub trait Driver {
> +    /// Corresponds to `flags` in `struct phy_driver`.
> +    const FLAGS: u32 =3D 0;
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
> +    fn match_phy_device(_dev: &mut Device) -> bool;
> +
> +    /// Corresponds to `config_aneg` in `struct phy_driver`.
> +    fn config_aneg(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `read_page` in `struct phy_driver`.
> +    fn read_page(_dev: &mut Device) -> Result<i32> {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `write_page` in `struct phy_driver`.
> +    fn write_page(_dev: &mut Device, _page: i32) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `read_status` in `struct phy_driver`.
> +    fn read_status(_dev: &mut Device) -> Result {
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
> +    fn read_mmd(_dev: &mut Device, _devnum: i32, _regnum: u16) -> Resu=
lt<i32> {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `write_mmd` in `struct phy_driver`.
> +    fn write_mmd(_dev: &mut Device, _devnum: i32, _regnum: u16, _val: =
u16) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Corresponds to `link_change_notify` in `struct phy_driver`.
> +    fn link_change_notify(_dev: &mut Device) {}
> +}
> +
> +/// Registration structure for a PHY driver.
> +///
> +/// `Registration` can keep multiple `phy_drivers` object because
> +/// commonly one module implements multiple PHYs drivers.
> +pub struct Registration<const N: usize> {
> +    module: &'static crate::ThisModule,
> +    drivers: [Option<Box<bindings::phy_driver>>; N],
> +}
> +
> +impl<const N: usize> Registration<{ N }> {
> +    /// Creates a new `Registration` instance.
> +    pub fn new(module: &'static crate::ThisModule) -> Self {
> +        const NONE: Option<Box<bindings::phy_driver>> =3D None;
> +        Registration {
> +            module,
> +            drivers: [NONE; N],
> +        }
> +    }
> +
> +    /// Registers a PHY driver.
> +    pub fn register<T: Driver>(&mut self, adapter: &Adapter<T>) -> Res=
ult {
> +        for i in 0..N {
> +            if self.drivers[i].is_none() {
> +                let mut drv =3D Box::try_new(adapter.driver())?;
> +                // SAFETY: Just an FFI call.
> +                let ret =3D unsafe { bindings::phy_driver_register(drv=
=2Eas_mut(), self.module.0) };
> +                if ret !=3D 0 {
> +                    return Err(Error::from_errno(ret));
> +                }
> +                self.drivers[i] =3D Some(drv);
> +                return Ok(());
> +            }
> +        }
> +        Err(code::EINVAL)
> +    }
> +}
> +
> +impl<const N: usize> Drop for Registration<{ N }> {
> +    fn drop(&mut self) {
> +        for i in 0..N {
> +            if let Some(mut drv) =3D self.drivers[i].take() {
> +                unsafe {
> +                    // SAFETY: Just an FFI call.
> +                    bindings::phy_driver_unregister(drv.as_mut());
> +                }
> +            } else {
> +                break;
> +            }
> +        }
> +    }
> +}
> +
> +// SAFETY: `Registration` does not expose any of its state across thre=
ads.
> +unsafe impl<const N: usize> Send for Registration<{ N }> {}
> +
> +// SAFETY: `Registration` does not expose any of its state across thre=
ads.
> +unsafe impl<const N: usize> Sync for Registration<{ N }> {}
> -- =

> 2.34.1
