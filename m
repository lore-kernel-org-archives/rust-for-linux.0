Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71F853A6
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 13:33:20 +0000 (UTC)
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C83E2D7D
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=qgnw5oillrcyvniagqhedwopqy.protonmail; t=1695562390; x=1695821590;
	bh=fxe5zcTn+Ku1mOrTmDtSlN4mYaDaxfXrIERxJLmS3og=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hbSDD5kfVjcqFdXTjDj6yZMCTvbaEO4i16PyF2k7LeRnz8T1QGpp2sBYJVTWqLxMf
	 PGwVFk41vVNMesKw10/ihsQk3nIpDM4Fa7Gy/XUBqwsIKUheAJh1CjvW3AsG7Rqgev
	 FSivPsh9UDlRr9sXgEvq5XeoryanoGiSm4uAfsgim93CkAeK7opisgjG9fepMmr2J4
	 pTpm729GUaSzH4EfCjiX+oKZaWjiaVBGXlNtfmCno/fPJ75SU6vA8q1DiADHshyUNs
	 ti7b6nKGsdkk0fAI/3f7t+yWfZ0F9hzJauxxw+RGE5fz0Ywvmj+tqDmKk771kcRRUQ
	 tH3qH2yVpwKZQ==
Date: Sun, 24 Sep 2023 13:33:05 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
Message-ID: <f99d93a0-52f7-ed2d-67ab-40a8b2927e89@proton.me>
In-Reply-To: <20230924064902.1339662-4-fujita.tomonori@gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com> <20230924064902.1339662-4-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 24.09.23 08:49, FUJITA Tomonori wrote:
> This is the Rust implementation of drivers/net/phy/ax88796b.c.  The
> features are equivalent. You can choose C or Rust on kernel
> configuration.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>   drivers/net/phy/Kconfig          |  16 ++++
>   drivers/net/phy/Makefile         |   8 +-
>   drivers/net/phy/ax88796b_rust.rs | 147 +++++++++++++++++++++++++++++++
>   rust/uapi/uapi_helper.h          |   1 +
>   4 files changed, 171 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/net/phy/ax88796b_rust.rs
>=20
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 107880d13d21..47576c905837 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -107,6 +107,22 @@ config AX88796B_PHY
>   =09  Currently supports the Asix Electronics PHY found in the X-Surf 10=
0
>   =09  AX88796B package.
>=20
> +choice
> +=09prompt "Implementation options"
> +=09depends on AX88796B_PHY
> +=09help
> +=09  There are two implementations for a driver for Asix PHYs; C and Rus=
t.
> +=09  If not sure, choose C.
> +
> +config AX88796B_C_PHY
> +=09bool "C driver for Asix PHYs"
> +
> +config AX88796B_RUST_PHY
> +=09bool "Rust driver for Asix PHYs"
> +=09depends on RUST
> +
> +endchoice
> +
>   config BROADCOM_PHY
>   =09tristate "Broadcom 54XX PHYs"
>   =09select BCM_NET_PHYLIB
> diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
> index c945ed9bd14b..4bdefa90e4dc 100644
> --- a/drivers/net/phy/Makefile
> +++ b/drivers/net/phy/Makefile
> @@ -41,7 +41,13 @@ aquantia-objs=09=09=09+=3D aquantia_hwmon.o
>   endif
>   obj-$(CONFIG_AQUANTIA_PHY)=09+=3D aquantia.o
>   obj-$(CONFIG_AT803X_PHY)=09+=3D at803x.o
> -obj-$(CONFIG_AX88796B_PHY)=09+=3D ax88796b.o
> +ifdef CONFIG_AX88796B_PHY
> +  ifdef CONFIG_AX88796B_C_PHY
> +    obj-$(CONFIG_AX88796B_PHY)=09+=3D ax88796b.o
> +  else
> +    obj-$(CONFIG_AX88796B_PHY)=09+=3D ax88796b_rust.o
> +  endif
> +endif
>   obj-$(CONFIG_BCM54140_PHY)=09+=3D bcm54140.o
>   obj-$(CONFIG_BCM63XX_PHY)=09+=3D bcm63xx.o
>   obj-$(CONFIG_BCM7XXX_PHY)=09+=3D bcm7xxx.o
> diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_=
rust.rs
> new file mode 100644
> index 000000000000..88386b8196e9
> --- /dev/null
> +++ b/drivers/net/phy/ax88796b_rust.rs
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust Asix PHYs driver
> +use kernel::c_str;
> +use kernel::net::phy::{self, DeviceId, Driver};
> +use kernel::prelude::*;
> +use kernel::uapi;
> +
> +kernel::module_phy_driver! {
> +    drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
> +    device_table: [
> +        DeviceId::new_with_driver::<PhyAX88772A>(),
> +        DeviceId::new_with_driver::<PhyAX88772C>(),
> +        DeviceId::new_with_driver::<PhyAX88796B>()
> +    ],
> +    type: RustAsixPhy,
> +    name: "rust_asix_phy",
> +    author: "FUJITA Tomonori <fujita.tomonori@gmail.com>",
> +    description: "Rust Asix PHYs driver",
> +    license: "GPL",
> +}
> +
> +struct PhyAX88772A;
> +
> +impl PhyAX88772A {
> +    const PHY_ID: u32 =3D 0x003b1861;

Why are you specifying this constant twice?
Doing this solely in the `impl Driver` block
should be sufficient.

> +}
> +
> +#[vtable]
> +impl phy::Driver for PhyAX88772A {
> +    const FLAGS: u32 =3D phy::PHY_IS_INTERNAL;
> +    const NAME: &'static CStr =3D c_str!("Asix Electronics AX88772A");
> +    const PHY_ID: u32 =3D Self::PHY_ID;
> +    const PHY_ID_MASK: u32 =3D !0;

Why is this some magic number? It should be
a constant with a nice name.

> +
> +    // AX88772A is not working properly with some old switches (NETGEAR =
EN 108TP):
> +    // after autoneg is done and the link status is reported as active, =
the MII_LPA
> +    // register is 0. This issue is not reproducible on AX88772C.
> +    fn read_status(dev: &mut phy::Device) -> Result<u16> {
> +        dev.genphy_update_link()?;
> +        if !dev.get_link() {
> +            return Ok(0);
> +        }
> +        // If MII_LPA is 0, phy_resolve_aneg_linkmode() will fail to res=
olve
> +        // linkmode so use MII_BMCR as default values.
> +        let ret =3D dev.read(uapi::MII_BMCR as u16)?;
> +
> +        if ret as u32 & uapi::BMCR_SPEED100 !=3D 0 {
> +            dev.set_speed(100);
> +        } else {
> +            dev.set_speed(10);
> +        }
> +
> +        let duplex =3D if ret as u32 & uapi::BMCR_FULLDPLX !=3D 0 {
> +            phy::DuplexMode::Full
> +        } else {
> +            phy::DuplexMode::Half
> +        };
> +        dev.set_duplex(duplex);
> +
> +        dev.genphy_read_lpa()?;
> +
> +        if dev.is_autoneg_enabled() && dev.is_autoneg_completed() {
> +            dev.resolve_aneg_linkmode();
> +        }
> +
> +        Ok(0)
> +    }
> +
> +    fn suspend(dev: &mut phy::Device) -> Result {
> +        dev.genphy_suspend()
> +    }
> +
> +    fn resume(dev: &mut phy::Device) -> Result {
> +        dev.genphy_resume()
> +    }
> +
> +    fn soft_reset(dev: &mut phy::Device) -> Result {
> +        RustAsixPhy::soft_reset(dev)
> +    }
> +
> +    fn link_change_notify(dev: &mut phy::Device) {
> +        // Reset PHY, otherwise MII_LPA will provide outdated informatio=
n.
> +        // This issue is reproducible only with some link partner PHYs.
> +        if dev.state() =3D=3D phy::DeviceState::NoLink {
> +            let _ =3D dev.init_hw();
> +            let _ =3D dev.start_aneg();
> +        }
> +    }
> +}
> +
> +struct PhyAX88772C;
> +
> +impl PhyAX88772C {
> +    const PHY_ID: u32 =3D 0x003b1881;
> +}
> +
> +#[vtable]
> +impl Driver for PhyAX88772C {
> +    const FLAGS: u32 =3D phy::PHY_IS_INTERNAL;
> +    const NAME: &'static CStr =3D c_str!("Asix Electronics AX88772C");
> +    const PHY_ID: u32 =3D Self::PHY_ID;
> +    const PHY_ID_MASK: u32 =3D !0;
> +
> +    fn suspend(dev: &mut phy::Device) -> Result {
> +        dev.genphy_suspend()
> +    }
> +
> +    fn resume(dev: &mut phy::Device) -> Result {
> +        dev.genphy_resume()
> +    }
> +
> +    fn soft_reset(dev: &mut phy::Device) -> Result {
> +        RustAsixPhy::soft_reset(dev)
> +    }
> +}
> +
> +struct PhyAX88796B;
> +
> +impl PhyAX88796B {
> +    const PHY_ID: u32 =3D 0x003b1841;
> +    const PHY_ID_MASK: u32 =3D 0xfffffff0;
> +}
> +
> +#[vtable]
> +impl Driver for PhyAX88796B {
> +    const NAME: &'static CStr =3D c_str!("Asix Electronics AX88796B");
> +    const PHY_ID: u32 =3D Self::PHY_ID;
> +    const PHY_ID_MASK: u32 =3D Self::PHY_ID_MASK;
> +
> +    fn soft_reset(dev: &mut phy::Device) -> Result {
> +        RustAsixPhy::soft_reset(dev)
> +    }
> +}
> +
> +struct RustAsixPhy;
> +
> +impl RustAsixPhy {
> +    // Performs a software PHY reset using the standard
> +    // BMCR_RESET bit and poll for the reset bit to be cleared.
> +    // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY imple=
mentation
> +    // such as used on the Individual Computers' X-Surf 100 Zorro card.
> +    fn soft_reset(dev: &mut phy::Device) -> Result {
> +        dev.write(uapi::MII_BMCR as u16, 0)?;
> +        dev.genphy_soft_reset()
> +    }
> +}
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 301f5207f023..d92abe9064c2 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -7,3 +7,4 @@
>    */
>=20
>   #include <uapi/asm-generic/ioctl.h>
> +#include <uapi/linux/mii.h>
> --
> 2.34.1
>=20
>=20

