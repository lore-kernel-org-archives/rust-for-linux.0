Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E36EEB64DB
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 13:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237805AbjFONIx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 09:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234125AbjFONIw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 09:08:52 -0400
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C20269A
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 06:08:48 -0700 (PDT)
Date:   Thu, 15 Jun 2023 13:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1686834526; x=1687093726;
        bh=xbMn6q9nCJQyfoG9776y5ZRaNN+IfpLZKugBF/NN2S8=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=FSwwA3U4t+xstRvTsrWzDWFJN3sClMrBtnscqo0/MbPbYd3Rfp/CfQARt+BH6/tNO
         CsuT3wvs0AZwqTDM8AdKcdknSLZP9etFEtFfnUOG9epLggXOarJqEx+eW0FLDm9UzP
         YgbhVcUvmKM+Y1W/ZDTNj7G5UgMH3/VOfDa3lLiMm/Nm0r/teNUpJnDfxx67DTWMPu
         Ti7YAMll9+bYYymfZTMaKSZvVlkfNuo0EeiJ3RACoaWNvWrwe9WuLETOlyIxFkw0ii
         N+RxIK/DlQGplmYno1zbY5IgKCbGX6bDd8aINjj2Z9Tbzehx0AALSR47lXOfb4RBnI
         y7OEjq+aCVMjA==
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
From:   Benno Lossin <benno.lossin@proton.me>
Cc:     netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch,
        miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver
Message-ID: <ZqzvqDuQL9fAxnW0HxgDhqabk6lZsM9OGjV0ejb3dk52fhgAyMH-eIUnRCfPxRgnGYTOVavnKlsrABIWQk_Mwu5K0_lc8W-gA_0xE3No-PI=@proton.me>
In-Reply-To: <20230613045326.3938283-6-fujita.tomonori@gmail.com>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com> <20230613045326.3938283-6-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 6/13/23 06:53, FUJITA Tomonori wrote:
> This is a simpler version of drivers/net/dummy.c.
>=20
> This demonstrates the usage of abstractions for network device drivers.
>=20
> Allows allocator_api feature for Box::try_new();
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  samples/rust/Kconfig           | 12 +++++
>  samples/rust/Makefile          |  1 +
>  samples/rust/rust_net_dummy.rs | 81 ++++++++++++++++++++++++++++++++++
>  scripts/Makefile.build         |  2 +-
>  4 files changed, 95 insertions(+), 1 deletion(-)
>  create mode 100644 samples/rust/rust_net_dummy.rs
>=20
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index b0f74a81c8f9..8b52ba620ae3 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -30,6 +30,18 @@ config SAMPLE_RUST_PRINT
>=20
>  =09 If unsure, say N.
>=20
> +config SAMPLE_RUST_NET_DUMMY
> +=09tristate "Dummy network driver"
> +=09depends on NET
> +=09help
> +=09 This is the simpler version of drivers/net/dummy.c. No intention to =
replace it.
> +=09 This provides educational information for Rust abstractions for netw=
ork drivers.
> +
> +=09 To compile this as a module, choose M here:
> +=09 the module will be called rust_minimal.

The module is not called `rust_minimal` :)

--
Cheers,
Benno

> +
> +=09 If unsure, say N.
> +
>  config SAMPLE_RUST_HOSTPROGS
>  =09bool "Host programs"
>  =09help
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index 03086dabbea4..440dee2971ba 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -2,5 +2,6 @@
>=20
>  obj-$(CONFIG_SAMPLE_RUST_MINIMAL)=09=09+=3D rust_minimal.o
>  obj-$(CONFIG_SAMPLE_RUST_PRINT)=09=09=09+=3D rust_print.o
> +obj-$(CONFIG_SAMPLE_RUST_NET_DUMMY)=09=09+=3D rust_net_dummy.o
>=20
>  subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)=09=09+=3D hostprogs
> diff --git a/samples/rust/rust_net_dummy.rs b/samples/rust/rust_net_dummy=
.rs
> new file mode 100644
> index 000000000000..6c49a7ba7ba2
> --- /dev/null
> +++ b/samples/rust/rust_net_dummy.rs
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +//! Rust dummy netdev.
> +
> +use kernel::{
> +    c_str,
> +    net::dev::{
> +        ethtool_op_get_ts_info, flags, priv_flags, Device, DeviceOperati=
ons, DriverData,
> +        EtherOperations, EthtoolTsInfo, Registration, RtnlLinkStats64, S=
kBuff, TxCode,
> +    },
> +    prelude::*,
> +};
> +
> +module! {
> +    type: DummyNetdev,
> +    name: "rust_net_dummy",
> +    author: "Rust for Linux Contributors",
> +    description: "Rust dummy netdev",
> +    license: "GPL v2",
> +}
> +
> +struct DevOps {}
> +
> +#[vtable]
> +impl<D: DriverData<Data =3D Box<Stats>>> DeviceOperations<D> for DevOps =
{
> +    fn init(_dev: &mut Device, _data: &Stats) -> Result {
> +        Ok(())
> +    }
> +
> +    fn start_xmit(_dev: &mut Device, _data: &Stats, mut skb: SkBuff) -> =
TxCode {
> +        skb.tx_timestamp();
> +        TxCode::Ok
> +    }
> +
> +    fn get_stats64(_dev: &mut Device, _data: &Stats, _stats: &mut RtnlLi=
nkStats64) {}
> +}
> +
> +/// For device driver specific information.
> +struct Stats {}
> +
> +impl DriverData for Stats {
> +    type Data =3D Box<Stats>;
> +}
> +
> +struct DummyNetdev {
> +    _r: Registration<DevOps, Stats>,
> +}
> +
> +struct EtherOps {}
> +
> +#[vtable]
> +impl<D: DriverData<Data =3D Box<Stats>>> EtherOperations<D> for EtherOps=
 {
> +    fn get_ts_info(dev: &mut Device, _data: &Stats, info: &mut EthtoolTs=
Info) -> Result {
> +        ethtool_op_get_ts_info(dev, info)
> +    }
> +}
> +
> +impl kernel::Module for DummyNetdev {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        let data =3D Box::try_new(Stats {})?;
> +        let mut r =3D Registration::<DevOps, Stats>::try_new_ether(1, 1,=
 data)?;
> +        r.set_ether_operations::<EtherOps>()?;
> +
> +        let netdev =3D r.dev_get();
> +        netdev.set_name(c_str!("dummy%d"))?;
> +
> +        netdev.set_flags(netdev.get_flags() | flags::IFF_NOARP & !flags:=
:IFF_MULTICAST);
> +        netdev.set_priv_flags(
> +            netdev.get_priv_flags() | priv_flags::IFF_LIVE_ADDR_CHANGE |=
 priv_flags::IFF_NO_QUEUE,
> +        );
> +        netdev.set_random_eth_hw_addr();
> +        netdev.set_min_mtu(0);
> +        netdev.set_max_mtu(0);
> +
> +        r.register()?;
> +
> +        // TODO: Replaces pr_info with the wrapper of netdev_info().
> +        pr_info!("Hello Rust dummy netdev!");
> +        Ok(DummyNetdev { _r: r })
> +    }
> +}
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 78175231c969..1404967e908e 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
>  # Compile Rust sources (.rs)
>  # ----------------------------------------------------------------------=
-----
>=20
> -rust_allowed_features :=3D new_uninit
> +rust_allowed_features :=3D allocator_api,new_uninit
>=20
>  rust_common_cmd =3D \
>  =09RUST_MODFILE=3D$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
> --
> 2.34.1
> 
