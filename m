Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CF514601E
	for <rust-for-linux@vger.kernel.org>; Thu, 30 May 2024 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056164; cv=none; b=omGi8zrn5g7vAl2QE4orFOUFQfyN+INaom1l7yqYffLbzhFYeuN6RY8znEHVLr9xV6YxGN08cAR9NgGoIkP4ayv9bObybVkaDypuPPByBbKO/95EmFwSsiJYcyalTPSKQz0fX8jTlCQsg9Gw7SMsGYUQzO6zt87i0WZOgwFSBi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056164; c=relaxed/simple;
	bh=GBg2u/G/DBG8tn7/u1tHhfjxF+IgynX1kZNPSrGo728=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EYSQTxgxVF+jUoEEni++Gq/l+poj+CbFZ4J97aOF3xZek7hOl8x0pLlhKqkKz1QiUrRBuX8gn97SBSmTMgezfi+sCT4jdohRNuyNLintPpygUanXrkTdZ+uWTTRjTuWpwumYtlPS4E0xMs19QvUTpInexZYngfEstYGuEAYd8ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=kbGE1zel; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="kbGE1zel"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1717056159; x=1717315359;
	bh=89IuEHIOqyip9C4GQ6Jg4EsB4RbsVOX6dlBJKB5EacU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=kbGE1zelhSnae3br3Yft4hJDS609WFV/aoMCncj7km5TvjacEe7Y9KGXNvIdqA1En
	 ff1uRn1tO7LYWfG++pqu5T4syNX6widWvz27IlY461CBPN77fQvb4YCDwdL8CQ4wzw
	 8VNOKUn38wCRnuXmhJNKtWD3DC3tAlNkS7blq7Cr6w/LSjvLGjphmx2RAr9HGJpxcY
	 Yz9FYBy71yicGwzIPaY+/+GUaMcUWIlaMW1uysM3rELLwRMgacWgJfAikkY6LA5H+k
	 jRclUz2adymlNtvkrIEtVQ34Y/4zGsclt1V6S1Ukq9L1qYV+EoLbLwKodTiguaKvMH
	 zaZdDp6zeCuMw==
Date: Thu, 30 May 2024 08:02:35 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, andrew@lunn.ch, tmgross@umich.edu
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
Message-ID: <62cdc40e-1852-4444-80f2-d26fb45018b4@proton.me>
In-Reply-To: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>
References: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a20e1d84d2badf518a221d0fd2e9224fbe267380
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 27.05.24 03:46, FUJITA Tomonori wrote:
> Hi,
>=20
> After the discussion on C45 register support, I implemented a more rusty
> solution based on Benno's idea (hopefully, I understand correctly):

Yes this looks similar to what I imagined.

> https://lore.kernel.org/all/20240415104701.4772-3-fujita.tomonori@gmail.c=
om/
>=20
> I'm not sure so I sent a RFC patch to rust-for-linux only. Once I have
> something that we could agree on, I'll send non RFC patch to netdev.
>=20
>=20
> Adds support for C45 registers access. C45 registers can be accessed
> in two ways: either C45 bus protocol or C45 over C22. Normally, a PHY
> driver shouldn't care how to access. PHYLIB chooses the appropriate
> one. But there is an exception; PHY hardware supporting only C45 bus
> protocol.
>=20
> This adds two ways to access C45; RegC45 and RegC45Direct. Normally, a
> driver should use the former; let the PHYLIB take care of how to
> access (by calling phy_read_mmd/phy_write_mmd). The latter calls
> mdiobus_c45_read/mdiobus_c45_write; C45 over C22 isn't used.
>=20
> The API to access to C22 registers is also updated to align with the
> above changes.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  drivers/net/phy/ax88796b_rust.rs |   7 +-
>  rust/kernel/net/phy.rs           | 218 +++++++++++++++++++++++++++----
>  2 files changed, 198 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_=
rust.rs
> index 5c92572962dc..9526729dc35a 100644
> --- a/drivers/net/phy/ax88796b_rust.rs
> +++ b/drivers/net/phy/ax88796b_rust.rs
> @@ -6,7 +6,7 @@
>  //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.=
c)
>  use kernel::{
>      c_str,
> -    net::phy::{self, DeviceId, Driver},
> +    net::phy::{self, DeviceId, Driver, RegC22},
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
> +    dev.write(RegC22::Bmcr, 0)?;
>      dev.genphy_soft_reset()
>  }
>=20
> @@ -55,7 +54,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
>          }
>          // If MII_LPA is 0, phy_resolve_aneg_linkmode() will fail to res=
olve
>          // linkmode so use MII_BMCR as default values.
> -        let ret =3D dev.read(MII_BMCR)?;
> +        let ret =3D dev.read(RegC22::Bmcr)?;
>=20
>          if ret & BMCR_SPEED100 !=3D 0 {
>              dev.set_speed(uapi::SPEED_100);
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index fd40b703d224..5bb4a8c9e493 100644
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
> +    pub fn read<R: RegAccess>(&mut self, reg: R) -> Result<u16> {
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
> +    pub fn write<R: RegAccess>(&mut self, reg: R, val: u16) -> Result {
> +        reg.write(self, val)
>      }
>=20
>      /// Reads a paged register.
> @@ -302,6 +285,195 @@ pub fn genphy_read_abilities(&mut self) -> Result {
>      }
>  }
>=20
> +/// Reads and writes C22 and C45 registers.

You used "PHY register" below, so you should probably use it here as
well.

> +///
> +/// This trait is used to implement multiple ways to read and write
> +/// PHY registers.
> +pub trait RegAccess {
> +    /// Reads a PHY register.
> +    fn read(&self, dev: &mut Device) -> Result<u16>;

Do all registers have a size of exactly `u16`? If there are also
registers with `u8`, then I would prefer an associated type in the trait
that you then use as the return type.

> +
> +    /// Writes a PHY register.
> +    fn write(&self, dev: &mut Device, val: u16) -> Result;
> +}
> +
> +/// Accesses to C22 registers.
> +#[derive(Clone, Copy)]
> +pub enum RegC22 {

I think we could just name this `C22`.
It might also make sense to move all registers into a `reg` module. What
do you think?

> +    /// Basic mode control.
> +    Bmcr =3D uapi::MII_BMCR as isize,
> +    /// Basic mode status.
> +    Bmsr =3D uapi::MII_BMSR as isize,
> +    /// PHY identifier 1.
> +    PhysId1 =3D uapi::MII_PHYSID1 as isize,
> +    /// PHY identifier 2.
> +    PhysId2 =3D uapi::MII_PHYSID2 as isize,
> +    /// Auto-negotiation advertisement.
> +    Advertise =3D uapi::MII_ADVERTISE as isize,
> +    /// Auto-negotiation link partner base page ability.
> +    Lpa =3D uapi::MII_LPA as isize,
> +    /// Auto-negotiation expansion.
> +    Expansion =3D uapi::MII_EXPANSION as isize,
> +    /// 1000BASE-T control.
> +    Ctrl1000 =3D uapi::MII_CTRL1000 as isize,
> +    /// 1000BASE-T status.
> +    Stat1000 =3D uapi::MII_STAT1000 as isize,
> +    /// MMD access control.
> +    MmdCtrl =3D uapi::MII_MMD_CTRL as isize,
> +    /// MMD access data.
> +    MmdData =3D uapi::MII_MMD_DATA as isize,
> +    /// Extended status.
> +    Estatus =3D uapi::MII_ESTATUS as isize,
> +    /// Disconnect counter.
> +    Dcounter =3D uapi::MII_DCOUNTER as isize,
> +    /// False carrier sense counter.
> +    Fcscounter =3D uapi::MII_FCSCOUNTER as isize,
> +    /// N-way auto-negotiation test.
> +    Nwaytest =3D uapi::MII_NWAYTEST as isize,
> +    /// Receive error counter.
> +    Rerrcounter =3D uapi::MII_RERRCOUNTER as isize,
> +    /// Silicon revision.
> +    Srervision =3D uapi::MII_SREVISION as isize,
> +    /// Reserved.
> +    Resv1 =3D uapi::MII_RESV1 as isize,
> +    /// Lpback, rx, bypass error.
> +    Lbrerror =3D uapi::MII_LBRERROR as isize,
> +    /// PHY address.
> +    Phyaddr =3D uapi::MII_PHYADDR as isize,
> +    /// Reserved.
> +    Resv2 =3D uapi::MII_RESV2 as isize,
> +    /// TPI status for 10Mbps.
> +    TpiStatus =3D uapi::MII_TPISTATUS as isize,
> +    /// Network interface configuration.
> +    Nconfig =3D uapi::MII_NCONFIG as isize,
> +}
> +
> +impl RegAccess for RegC22 {
> +    /// Reads a given C22 PHY register.
> +    fn read(&self, dev: &mut Device) -> Result<u16> {
> +        let phydev =3D dev.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Device`.
> +        // So it's just an FFI call, open code of `phy_read()` with a va=
lid `phy_device` pointer
> +        // `phydev`.
> +        let ret =3D unsafe {
> +            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.ad=
dr, *self as u32)
> +        };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret as u16)
> +        }
> +    }
> +
> +    /// Writes a given C22 PHY register.
> +    fn write(&self, dev: &mut Device, val: u16) -> Result {
> +        let phydev =3D dev.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Device`.
> +        // So it's just an FFI call, open code of `phy_write()` with a v=
alid `phy_device` pointer
> +        // `phydev`.
> +        to_result(unsafe {
> +            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.a=
ddr, *self as u32, val)
> +        })
> +    }
> +}
> +
> +/// Accesses to C45 registers.
> +///
> +/// C45 registers can be accessed in two ways: either C45 bus protocol o=
r
> +/// C45 over C22 bus protocol. Normally, a PHY driver shouldn't care how=
 to
> +/// access. `PHYLIB` chooses the appropriate one. `RegC45` is preferred =
over
> +/// `RegC45Direct`.
> +pub struct RegC45 {

Same here, this could just be named `C45`.

> +    devad: u8,
> +    regnum: u16,
> +}
> +
> +impl RegC45 {
> +    /// Creates a new instance of `RegC45`.
> +    pub fn new(devad: u8, regnum: u16) -> Self {

Are there really no common values that you would use as the parameters
here? If you want to add any, you can do so via associated constants:

    const COMMON_REGISTER: RegC45 =3D RegC45::new(/* ... */);

Will every driver have their own custom, magic values as input to this
function?

---
Cheers,
Benno

> +        Self { devad, regnum }
> +    }
> +}
> +

