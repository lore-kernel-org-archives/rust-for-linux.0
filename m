Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4C6FB9
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717244483; cv=none; b=BeypZCWWrUjiDpkS2lVh17WcrkSNbB88It0NTkUXoZ3UWcUClYHd4EHjFIRxEuDxXPRH6lCqCqyy1LT5O0Eo49eHHG0cgFooTyFs/TU0N/06mOi/T1xaeqK+Zg5dZPSHBp3cQuNfpGjb3AsPdi6gEuoI6tDgP7Xq2Z/Gmf8zNnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717244483; c=relaxed/simple;
	bh=wu/nJEO4vZ64Xqti3FJ51xxUKMjaPCUgEFuEw2nuay0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7YdMgFc6gt37bC0/gCu9him2EJrdR0wS2lBioPLMeWisatclEhbTWUZShJ9Iz4KsiGfMmVzrwkvMxdDuWfiPX88WHuSxUUiNGNWsH1UB9wj7Z3hDxsylrQWU6B8zpDwcmP8kBn9LlzdqZrm+4MuWfwxeJErJWlqgISOcTrG8Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mkCPVxG6; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mkCPVxG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mzzougmkpbbzfftwjuj24hr2ni.protonmail; t=1717244478; x=1717503678;
	bh=nn35T0VrQb6cqXx2brANCagEZeKCC4SC3wRCBioi7y4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mkCPVxG6Ld20J/GjoFvvsnv6l8pLKYMRfRcsCkA+YMwj1RK7gp9IJggTLpwLa8Am3
	 9KP2ybavzUnz993bh48UqfgwFlXLFc7U7Q0Q7n1S/vlP4ZYG07VyEa8lPQGINvSGRA
	 43yfrq+DiNTqlHsr+/KibJUEg5ZsygYiikm/C4gY2pFh+gRZQGq/2lEouO+lRg1iQx
	 eMW+RHUCvhWL18qrsNmVdw8bMKcfTlftsELFVr++WxCrZl+owq3emk2Dlnl7H54lQD
	 kNFlNNaJkcQ8e4eDJ/Ue0venvGQ7HGmeRdQgFua8lYlsDAqDYP5xremOpQoRS1vVUb
	 UEFEubeNCkHkA==
Date: Sat, 01 Jun 2024 12:21:14 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 1/2] rust: net::phy support for C45 register access
Message-ID: <1def4559-d812-4426-94bb-b668f9ccb824@proton.me>
In-Reply-To: <20240601043535.53545-2-fujita.tomonori@gmail.com>
References: <20240601043535.53545-1-fujita.tomonori@gmail.com> <20240601043535.53545-2-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 0e30496ee01bc3ca81532fbd2c44d8c87bd4dde2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01.06.24 06:35, FUJITA Tomonori wrote:
> Adds support for C45 register access. Instead of adding read/write_c45
> methods, this unifies the API to access C22 and C45 registers with
> trait.

The short commit message only mentions C45, should it also include C22?

>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  drivers/net/phy/ax88796b_rust.rs |   7 +-
>  rust/kernel/net/phy.rs           | 192 +++++++++++++++++++++++++++----
>  rust/uapi/uapi_helper.h          |   1 +
>  3 files changed, 173 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_=
rust.rs
> index 5c92572962dc..8c7eb009d9fc 100644
> --- a/drivers/net/phy/ax88796b_rust.rs
> +++ b/drivers/net/phy/ax88796b_rust.rs
> @@ -6,7 +6,7 @@
>  //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.=
c)
>  use kernel::{
>      c_str,
> -    net::phy::{self, DeviceId, Driver},
> +    net::phy::{self, reg::C22, DeviceId, Driver},
>      prelude::*,
>      uapi,
>  };
> @@ -24,7 +24,6 @@
>      license: "GPL",
>  }
>=20
> -const MII_BMCR: u16 =3D uapi::MII_BMCR as u16;
>  const BMCR_SPEED100: u16 =3D uapi::BMCR_SPEED100 as u16;
>  const BMCR_FULLDPLX: u16 =3D uapi::BMCR_FULLDPLX as u16;
>=20
> @@ -33,7 +32,7 @@
>  // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implement=
ation
>  // such as used on the Individual Computers' X-Surf 100 Zorro card.
>  fn asix_soft_reset(dev: &mut phy::Device) -> Result {
> -    dev.write(uapi::MII_BMCR as u16, 0)?;
> +    dev.write(C22::BMCR, 0)?;
>      dev.genphy_soft_reset()
>  }
>=20
> @@ -55,7 +54,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
>          }
>          // If MII_LPA is 0, phy_resolve_aneg_linkmode() will fail to res=
olve
>          // linkmode so use MII_BMCR as default values.
> -        let ret =3D dev.read(MII_BMCR)?;
> +        let ret =3D dev.read(C22::BMCR)?;
>=20
>          if ret & BMCR_SPEED100 !=3D 0 {
>              dev.set_speed(uapi::SPEED_100);
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index fd40b703d224..286fd5a7ec91 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -175,32 +175,15 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
>          unsafe { (*phydev).duplex =3D v };
>      }
>=20
> -    /// Reads a given C22 PHY register.
> +    /// Reads a PHY register.
>      // This function reads a hardware register and updates the stats so =
takes `&mut self`.
> -    pub fn read(&mut self, regnum: u16) -> Result<u16> {
> -        let phydev =3D self.0.get();
> -        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Self`.
> -        // So it's just an FFI call, open code of `phy_read()` with a va=
lid `phy_device` pointer
> -        // `phydev`.
> -        let ret =3D unsafe {
> -            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.ad=
dr, regnum.into())
> -        };
> -        if ret < 0 {
> -            Err(Error::from_errno(ret))
> -        } else {
> -            Ok(ret as u16)
> -        }
> +    pub fn read<R: reg::Access>(&mut self, reg: R) -> Result<u16> {
> +        reg.read(self)
>      }
>=20
> -    /// Writes a given C22 PHY register.
> -    pub fn write(&mut self, regnum: u16, val: u16) -> Result {
> -        let phydev =3D self.0.get();
> -        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Self`.
> -        // So it's just an FFI call, open code of `phy_write()` with a v=
alid `phy_device` pointer
> -        // `phydev`.
> -        to_result(unsafe {
> -            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.a=
ddr, regnum.into(), val)
> -        })
> +    /// Writes a PHY register.
> +    pub fn write<R: reg::Access>(&mut self, reg: R, val: u16) -> Result =
{
> +        reg.write(self, val)
>      }
>=20
>      /// Reads a paged register.
> @@ -302,6 +285,169 @@ pub fn genphy_read_abilities(&mut self) -> Result {
>      }
>  }
>=20
> +/// Defines PHY registers.
> +pub mod reg {

I would have put this into its own file under `phy/reg.rs`.

> +    use super::Device;
> +    use crate::build_assert;
> +    use crate::error::*;
> +    use crate::uapi;
> +
> +    /// Reads and writes PHY registers.
> +    ///
> +    /// This trait is used to implement multiple ways to read and write
> +    /// PHY registers.
> +    pub trait Access {

I think `Register` is a better name.

> +        /// Reads a PHY register.
> +        fn read(&self, dev: &mut Device) -> Result<u16>;
> +
> +        /// Writes a PHY register.
> +        fn write(&self, dev: &mut Device, val: u16) -> Result;
> +    }
> +
> +    /// C22 registers.
> +    pub struct C22(u8);
> +
> +    impl C22 {
> +        /// Basic mode control.
> +        pub const BMCR: Self =3D C22(0x00);
> +        /// Basic mode status.
> +        pub const BMSR: Self =3D C22(0x01);
> +        /// PHY identifier 1.
> +        pub const PHYSID1: Self =3D C22(0x02);
> +        /// PHY identifier 2.
> +        pub const PHYSID2: Self =3D C22(0x03);
> +        /// Auto-negotiation advertisement.
> +        pub const ADVERTISE: Self =3D C22(0x04);
> +        /// Auto-negotiation link partner base page ability.
> +        pub const LPA: Self =3D C22(0x05);
> +        /// Auto-negotiation expansion.
> +        pub const EXPANSION: Self =3D C22(0x06);
> +        /// Auto-negotiation next page transmit.
> +        pub const NEXT_PAGE_TRANSMIT: Self =3D C22(0x07);
> +        /// Auto-negotiation link partner received next page.
> +        pub const LP_RECEIVED_NEXT_PAGE: Self =3D C22(0x08);
> +        /// Master-slave control.
> +        pub const MASTER_SLAVE_CONTROL: Self =3D C22(0x09);
> +        /// Master-slave status.
> +        pub const MASTER_SLAVE_STATUS: Self =3D C22(0x0a);
> +        /// PSE Control.
> +        pub const PSE_CONTROL: Self =3D C22(0x0b);
> +        /// PSE Status.
> +        pub const PSE_STATUS: Self =3D C22(0x0c);
> +        /// MMD access control.
> +        pub const MMD_CONTROL: Self =3D C22(0x0d);
> +        /// MMD access address data.
> +        pub const MMD_DATA: Self =3D C22(0x0e);
> +        /// Extended status.
> +        pub const EXTENDED_STATUS: Self =3D C22(0x0f);
> +
> +        /// Creates a new instance of `C22` with a vendor specific regis=
ter.
> +        pub const fn vendor_specific<const N: u8>() -> Self {
> +            build_assert!(N > 0x0f && N < 0x20);

An error message would be nice.

> +            C22(N)
> +        }
> +    }
> +
> +    impl Access for C22 {
> +        /// Reads a given C22 PHY register.
> +        fn read(&self, dev: &mut Device) -> Result<u16> {
> +            let phydev =3D dev.0.get();
> +            // SAFETY: `phydev` is pointing to a valid object by the typ=
e invariant of `Device`.
> +            // So it's just an FFI call, open code of `phy_read()` with =
a valid `phy_device` pointer
> +            // `phydev`.
> +            let ret =3D unsafe {
> +                bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdi=
o.addr, self.0.into())
> +            };
> +            if ret < 0 {
> +                Err(Error::from_errno(ret))
> +            } else {
> +                Ok(ret as u16)
> +            }
> +        }
> +
> +        /// Writes a given C22 PHY register.
> +        fn write(&self, dev: &mut Device, val: u16) -> Result {
> +            let phydev =3D dev.0.get();
> +            // SAFETY: `phydev` is pointing to a valid object by the typ=
e invariant of `Device`.
> +            // So it's just an FFI call, open code of `phy_write()` with=
 a valid `phy_device` pointer
> +            // `phydev`.
> +            to_result(unsafe {
> +                bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).md=
io.addr, self.0.into(), val)
> +            })
> +        }
> +    }
> +
> +    /// MDIO manageable devices.
> +    pub struct Mmd(u8);
> +
> +    impl Mmd {
> +        /// Physical Medium Attachment/Dependent.
> +        pub const PMAPMD: Self =3D Mmd(uapi::MDIO_MMD_PMAPMD as u8);
> +        /// WAN interface sublayer.
> +        pub const WIS: Self =3D Mmd(uapi::MDIO_MMD_WIS as u8);
> +        /// Physical coding sublayer.
> +        pub const PCS: Self =3D Mmd(uapi::MDIO_MMD_PCS as u8);
> +        /// PHY Extender sublayer.
> +        pub const PHYXS: Self =3D Mmd(uapi::MDIO_MMD_PHYXS as u8);
> +        /// DTE Extender sublayer.
> +        pub const DTEXS: Self =3D Mmd(uapi::MDIO_MMD_DTEXS as u8);
> +        /// Transmission convergence.
> +        pub const TC: Self =3D Mmd(uapi::MDIO_MMD_TC as u8);
> +        /// Auto negotiation.
> +        pub const AN: Self =3D Mmd(uapi::MDIO_MMD_AN as u8);
> +        /// Clause 22 extension.
> +        pub const C22_EXT: Self =3D Mmd(uapi::MDIO_MMD_C22EXT as u8);
> +        /// Vendor specific 1.
> +        pub const VEND1: Self =3D Mmd(uapi::MDIO_MMD_VEND1 as u8);
> +        /// Vendor specific 2.
> +        pub const VEND2: Self =3D Mmd(uapi::MDIO_MMD_VEND2 as u8);
> +
> +        /// Creates a new instance of `Mmd` with a specific device addre=
ss.
> +        pub fn new(devad: u8) -> Self {
> +            Mmd(devad)

Is there also a range that makes sense to exclude (similar to C22)?

> +        }
> +    }
> +
> +    /// C45 registers.
> +    pub struct C45 {
> +        devad: Mmd,
> +        regnum: u16,
> +    }
> +
> +    impl C45 {
> +        /// Creates a new instance of `C45`.
> +        pub fn new(devad: Mmd, regnum: u16) -> Self {

I really like that the first argument has a proper type now, do you
think that the same is also possible for `regnum`? Or are there no
common values for `regnum` (that also have the same meaning across
devices/drivers)? In that case, keep the `u16`.

---
Cheers,
Benno

> +            Self { devad, regnum }
> +        }
> +    }
> +
> +    impl Access for C45 {
> +        /// Reads a given C45 PHY register.
> +        fn read(&self, dev: &mut Device) -> Result<u16> {
> +            let phydev =3D dev.0.get();
> +            // SAFETY: `phydev` is pointing to a valid object by the typ=
e invariant of `Device`.
> +            // So it's just an FFI call.
> +            let ret =3D
> +                unsafe { bindings::phy_read_mmd(phydev, self.devad.0.int=
o(), self.regnum.into()) };
> +            if ret < 0 {
> +                Err(Error::from_errno(ret))
> +            } else {
> +                Ok(ret as u16)
> +            }
> +        }
> +
> +        /// Writes a given C45 PHY register.
> +        fn write(&self, dev: &mut Device, val: u16) -> Result {
> +            let phydev =3D dev.0.get();
> +            // SAFETY: `phydev` is pointing to a valid object by the typ=
e invariant of `Device`.
> +            // So it's just an FFI call.
> +            to_result(unsafe {
> +                bindings::phy_write_mmd(phydev, self.devad.0.into(), sel=
f.regnum.into(), val)
> +            })
> +        }
> +    }
> +}
> +
>  /// Defines certain other features this PHY supports (like interrupts).
>  ///
>  /// These flag values are used in [`Driver::FLAGS`].
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 08f5e9334c9e..76d3f103e764 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -7,5 +7,6 @@
>   */
>=20
>  #include <uapi/asm-generic/ioctl.h>
> +#include <uapi/linux/mdio.h>
>  #include <uapi/linux/mii.h>
>  #include <uapi/linux/ethtool.h>
> --
> 2.34.1
>=20

