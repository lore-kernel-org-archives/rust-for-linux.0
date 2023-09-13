Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C21DA42
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 20:12:09 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE2C1BCA
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 13:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sHaS/PFQh3BGKwom912kAtVx6Lw/dxJqLpgHeoc7TUk=; b=1qpdNYZYMjXwJxkP/l06GGyZ6W
	swKskn2hJEDfy35wXwM1CrntS/9HLHHF4kGxZrfDblFeePh/uxX6anRCUs92zjFnWH5G7Yv0aAqUv
	MDVOzoMnyxLM5ATjJ+VUShKaEq33UWlI2LXBq+c4LhvoW4gMgdWqmYGAQyjATDiyf3ms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgWDN-006L1s-US; Wed, 13 Sep 2023 22:11:57 +0200
Date: Wed, 13 Sep 2023 22:11:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913133609.1668758-2-fujita.tomonori@gmail.com>

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

How does this scale when there are 200 subsystems using binding
helpers?

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

Well that is untrue. phylib passes phydev to the MAC driver, in its
adjust link callback. It can then read from the phy_device
object. There are also API calls the MAC can use to change values in
the phydev structure. The phylib core will also modify values in
phydev. In theory, the core will protect the phy_device structure
using the phydev->lock mutex, although we might be missing a few
locks/unlocks, and suspend/resume does not take these locks because of
deadlock. A phy driver however should not need to touch this lock, it
is taken before there is a call into the driver.

> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> +        unsafe { &mut *(ptr as *mut Self) }
> +    }
> +
> +    /// Gets the id of the PHY.
> +    pub fn id(&mut self) -> u32 {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe { (*phydev).phy_id }
> +    }
> +
> +    /// Returns true if the PHY has no link.
> +    pub fn link(&mut self) -> bool {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe { (*phydev).link() != 0 }

That seems an odd way to express it.

unsigned link:1;

It is a bitfield of 1 bit. So why not simply == 1 ? Or even just plain
(*phydev).link() ?

> +    /// Gets the state of the PHY.
> +    pub fn state(&mut self) -> DeviceState {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        let state = unsafe { (*phydev).state };
> +        match state {
> +            0 => DeviceState::Down,
> +            1 => DeviceState::Ready,
> +            2 => DeviceState::Halted,
> +            3 => DeviceState::Error,
> +            4 => DeviceState::Up,
> +            5 => DeviceState::Running,
> +            6 => DeviceState::NoLink,
> +            7 => DeviceState::CableTest,

Can you directly reference the enum values phy_state? Otherwise this
is error prone.

> +            _ => DeviceState::Unknown,

This should not happen, and if it does something bad is going
on. WARN_ONCE() so we know about it.

> +    /// Sets duplex mode.
> +    pub fn set_duplex(&mut self, is_full: bool) {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> +        unsafe {
> +            if is_full {
> +                (*phydev).duplex = bindings::DUPLEX_FULL as i32;
> +            } else {
> +                (*phydev).duplex = bindings::DUPLEX_HALF as i32;
> +            }
> +        }
> +    }

How is DUPLEX_UNKNOWN handled? Duplex is not boolean. If we don't have
link duplex is not known yet, so should be set to DUPLEX_UNKNOWN.

> +
> +    /// Executes software reset the PHY via BMCR_RESET bit.
> +    pub fn soft_reset(&mut self) -> Result {

I suggest you keep to the genphy_ naming if possible, to make it clear
this is using a generic PHY method.

> +    /// Reads a given PHY register.
> +    pub fn read(&mut self, regnum: u32) -> Result<i32> {

I suggest you get hold of a copy of IEEE 802.3. It is free to
download. Check out clause 22 and clause 45.

There are two registers spaces in PHYs, defined in clause 22 and
clause 45. These are known as C22 and C45. C22 states there are 32
registers which are u16. C45 has 32 x 32 registers, which are u16. The
core of phylib is a bit messy, but phy drivers have a clean API. To
access a C22 register phy_read()/phy_write() it used. To access a C45
register phy_read_mmd()/phy_write_mmd() is used.

I would suggest the comment becomes "Reads a given C22 PHY register".

> +    /// Writes a given PHY register.

Writes a given C22 PHY register.

> +    /// Reads a given PHY register without the MDIO bus lock taken.
> +    pub fn lockless_read(&mut self, regnum: u32) -> Result<i32> {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret =
> +            unsafe { bindings::__mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnum) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret)
> +        }
> +    }

Now we are getting into the hairy stuff. Locking is
interesting. Rather than duplicate all the interesting stuff, can you
just use the high level C functions? In fact, the driver you posted
does not need anything other than phy_read() and phy_write(), so i
would not even bother with these yet.

> +    /// Resumes the PHY via BMCR_PDOWN bit.
> +    pub fn resume(&mut self) -> Result {

genphy_resume()

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
> +    pub fn suspend(&mut self) -> Result {

genphy_suspend()

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
> +    pub fn read_status(&mut self) -> Result {

genphy_read_status()

> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        let ret = unsafe { bindings::genphy_read_status(phydev) };
> +        if ret != 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(())
> +        }
> +    }
> +
> +    /// Updates the link status.
> +    pub fn update_link(&mut self) -> Result {

genphy_read_link()

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
> +    pub fn read_lpa(&mut self) -> Result {

genphy_read_lpa() etc...

> +/// PHY is internal.
> +pub const PHY_IS_INTERNAL: u32 = 0x00000001;
> +/// PHY needs to be reset after the refclk is enabled.
> +pub const PHY_RST_AFTER_CLK_EN: u32 = 0x00000002;
> +/// Polling is used to detect PHY status changes.
> +pub const PHY_POLL_CABLE_TEST: u32 = 0x00000004;
> +/// Don't suspend.
> +pub const PHY_ALWAYS_CALL_SUSPEND: u32 = 0x00000008;

Does Rust have the concept of a bit? Anything like the BIT() macro?
We have seen bugs where developers have not realized these are bits,
and so have defined 1, 2, 3, not 1, 2, 4. We can avoid that sort of
error by using BIT(0), BIT(1), and then the next one is obviously
BIT(2), not 3.

> +/// Corresponds to functions in `struct phy_driver`.
> +#[vtable]
> +pub trait Driver {
> +    /// Corresponds to `flags` in `struct phy_driver`.
> +    const FLAGS: u32 = 0;
> +
> +    /// Corresponds to `soft_reset` in `struct phy_driver`.
> +    fn soft_reset(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }

This is beyond my limited knowledge of Rust. The PHY core assumes for
most of the ops in phy_driver it is either a valid function pointer or
NULL. We have code like:

       if (phydev->drv->soft_reset) {
                ret = phydev->drv->soft_reset(phydev);

and

        if (phydev->drv->set_loopback)
                ret = phydev->drv->set_loopback(phydev, enable);
        else
                ret = genphy_loopback(phydev, enable);

So the default cannot be a function which returns -EOPNOTSUPP. It
needs to be a NULL.

      Andrew
