Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C381C366DD2
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771952660; cv=pass; b=M3ddNkA2koO7vLib+Ng+uK9b6xjSHicOtld+B94+FEWztTzWUdxPmfdFxPuPoL8iFpTzTsMX4qh3RziBtHkKI5GqFjlEdaGOxki9UycVlp5UQNFOycZ+7Ispvvl7Votya+N3h4D1OMJOWKt4BzmSgclkOUgLEDiRsQHNvXWgsAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771952660; c=relaxed/simple;
	bh=KaRt8KgrftJAnkNht8SKjxZ/dD3hgpm8gT4VHlaOOFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZojNm1/lwHYuJHDKVYxrmj7Lb7OA8kThltDPbFVObEiZHIl5ASpv11oiaRvUV+eqLnTfUxKPekWr2PcfzkILN+1S/bmET+WvvOK1MALc7xB052T2Ljt0H5SydvWKNQ7Unq5z9cj/+tnOMlOZDFDPjUwjMBfWRdYAhFwdhUOuUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xg7l8Lsg; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg7l8Lsg"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b884d5c787bso924025666b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 09:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771952657; cv=none;
        d=google.com; s=arc-20240605;
        b=i8Wg8e2PbVlAvJMl3nSUFLc7c4nI9jeQ1Qc5VTFhSVlWZkz6hWt83Z97CH8y6A+Pr8
         w+WMx7/L0HwBrw29rzqBp4RFZcV4vdnc2bSXGE+CWS4dMLYbGg/jqu8g4ULsD560b0Yp
         g3biyub+386v43Je8V7ZX6VM/x0bFjPUf4AxsjasN3q2zkmrHxz4Bd+ctH1AokEk/+ap
         +RsE/iZ090fSYWcFK0Oo1yHCpFznqk6Hb7U1ly7gOolz+zhHPm3fWQA7/MCCSDGu2HoL
         rp83qorb1UXoZjRBpI475/lA0BVWTiYWm35i8ROvioaJf9B2wg4Ic0om8J99a3tzlsc9
         WthA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1jGcR7apESw+qILwmI4/8KyBw9L2R3qguS/ZJggtyY4=;
        fh=clfML6Kaw3Ua8RlWn/op/pr3qHn0c/mgPq4fZMJ9l64=;
        b=EWFwpiItx/haECYiL7TxfrzBqOTfJUt6gR5AN6aPy2NaektI8OH/+9cLFzp2CSq/b9
         egRqDy+LBLA0w/D7QgOmlFoD08AJZrDb9/EDMUJFtYuLJU3+ugrvBE5WxtpVBU8SZ+3k
         UwLHx9AqgtGv/d497Ae71m4GYgxUirR0D2B3MFF5WDKdxsiLmux8BP80DTj9+qsll4yf
         7785XqMLhvA2xUi49rdx1i0hYkEiUn1unY6yw8K1WN9UWM/KVVgQ5u4ORYLOaU0KgYEm
         qs7scGNPnsUeQZACOKj786sY4oz8/31tGDJflcRf0+IpVSCkmhoGoZcFGoZ/nLAnh9GD
         YMFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771952657; x=1772557457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jGcR7apESw+qILwmI4/8KyBw9L2R3qguS/ZJggtyY4=;
        b=Xg7l8LsgwJXaTovKamCRJRQ7Bt9+9+4Mjbb5AUkgmK1pCDBtOO/fxxW9bt9oJisBSo
         6J54Y1Vct6GCf531hgNFik8O9qjDZ/XXlPu0S64L3mDaQqTRiTJ+2/WGvH74Qj2lKcGi
         u9euqjqSgCyhANPCIHKko5rXGdbbFDLJiadO6dglVX0qZEKl3izYagk8dIx3NWNDmfno
         Efc5vI4kGnfxitGu1+HUbNCin5LrXAD4GMaKrhI21TnqWgzWCp+6Bc90aGmr4p6M2zP0
         euZ1hlXiyoEYW2T3zJZpfJFd2ber+B2EZLzpDx3IbFtMc3dHPmDTmW9h4WD/b2vrBXdG
         Rr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771952657; x=1772557457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1jGcR7apESw+qILwmI4/8KyBw9L2R3qguS/ZJggtyY4=;
        b=L8SS/XehNQ2hyRniZgGZs5vgRXNDFYP3r7UQddni2aThVjDCDTySWR9x7c6bw03LPN
         o9B0Q5IUfK3rjWnEqgdNOObGYVIVAUHjElhSQ/6lWnhXuzIMQazk+qU04OLVL1+JeLIz
         wA7nGucOGXbzxgRDy6qyLPuplOWKBEnCKU5FwRQkXcjLAjERlsvsbR7QBeLinWr7YQaF
         Zz+M1UXF+Ae6Pgr31YnJvSB+bk2wXnOCNGSIgLCzhemyiSt235HiUBoCLPu8+tZUMY2B
         T9JfbmXf6rqx9D4IvmhWyjNzVoprHRRmNTG7Ut3mVkKSuuJPEQzfe6oSryislwxvDeW+
         Z6QA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Zh0dijAenTFjTGiPRPJ2aV99UuAbnGikC4z4MJ8B4YCbO6eGLejaHy/7dcpvMpNSdp1EIVGLOwK9bn2Yjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVx3sAf2DmiRMDtIlOMsaRIurgw6kxV/jxW4RwDEQSblR9KlZE
	Cj4e0nYVL+9YMk4GbX0pfqyfn+O+HFmfvIP/LRfmCKGnHuXyfWDqbqMKI33BZqK1361EQvWOxkl
	w5gbl76rk64e45bCqNHaiZ2bNPQQ/SSQ=
X-Gm-Gg: ATEYQzyS/yvd4JVdqMQGgVL/+cjKqot6/zOkY47GgI5nLra7EPoVDIrAD8ZP6NMAaZY
	p5twmCgTsl5/ekT1qfPquYjaKyjgHA7OqbqyuHm9Jo4cpqHNol7NPq4UTiTDgGVDIpOB2L3wR4O
	+HjL+ctcZ73eyNSt8lHkvgWZuPIN5m6x19GB0oGrSdKbO4yBi0kKwyzaG7OAmkNS+y3Z3KoAG/r
	TlvYOlWBMyN54KH/4T0cH6fgNg017PWNCe+nGb7M+LHCx4nR4mKF0cpX01AovHQOiXrybkKqQAs
	bhaJ9R4=
X-Received: by 2002:a17:907:2d87:b0:b8f:a520:2d78 with SMTP id
 a640c23a62f3a-b9081973f5dmr780090666b.16.1771952656741; Tue, 24 Feb 2026
 09:04:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224043211.1747-1-iprintercanon@gmail.com>
 <20260224164926.1760-1-iprintercanon@gmail.com> <20260224164926.1760-3-iprintercanon@gmail.com>
In-Reply-To: <20260224164926.1760-3-iprintercanon@gmail.com>
From: =?UTF-8?B?0J/RgNC40L3RgtC10YAg0J/RgNC40L3RgtC10YDQvtCy?= <iprintercanon@gmail.com>
Date: Tue, 24 Feb 2026 20:04:04 +0300
X-Gm-Features: AaiRm52bgHU7ln0jQiLtDpYj8_uZtv7lFXrJptvKiW7giJwScKcyj7tzOX_uwVo
Message-ID: <CAC62b0xq8vg4njbcvR9JLvW+o--UnNHEGNVz-+Uxa90d16j80A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] net: phy: add Rust reference driver for ET1011C
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Re: [PATCH net-next v3 0/2] net: phy: add Rust reference driver for ET1011C
  On Mon, Feb 24, 2026 at ... Miguel Ojeda <ojeda@kernel.org> wrote:
  > Since there is already a PHY one, is this meant to bootstrap the two
  > new APIs? Or something else?

Thank you for the feedback, Miguel. You raise a fair point.

  Honestly, the new abstraction here (speed() getter) is quite minor --
  it just reads a struct field. The driver itself doesn't bootstrap
  anything significant beyond what ax88796b_rust already covers.

  I'm looking to contribute to Rust in the kernel and started with PHY
  drivers because the abstraction is well established. But I understand
  now that duplicating C drivers isn't the goal.

  Could you point me toward areas where Rust work would be most
  valuable? I'm happy to work on new abstractions or drivers that
  actually need bootstrapping, rather than adding another reference
  driver to an area that's already covered.

  Thanks,
  Artem


=D0=B2=D1=82, 24 =D1=84=D0=B5=D0=B2=D1=80. 2026=E2=80=AF=D0=B3. =D0=B2 19:4=
9, Artem Lytkin <iprintercanon@gmail.com>:
>
> Add a Rust reference driver for the LSI ET1011C PHY, following the
> pattern established by the existing Rust Asix PHY driver
> (ax88796b_rust.rs).
>
> Unlike the C driver which uses a custom config_aneg that manually
> clears BMCR bits and writes BMCR_RESET without polling, this driver
> uses the soft_reset callback with genphy_soft_reset(). This properly
> polls the self-clearing BMCR_RESET bit and handles both autoneg and
> forced mode, following current best practices.
>
> The read_status callback detects speed changes and reconfigures the
> GMII interface and TX FIFO when switching to gigabit, matching the C
> driver's functionality.
>
> Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
> ---
>  drivers/net/phy/Kconfig         |  9 +++++
>  drivers/net/phy/Makefile        |  6 ++-
>  drivers/net/phy/et1011c_rust.rs | 69 +++++++++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/phy/et1011c_rust.rs
>
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 7b73332a13d9..41abf13662e6 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -254,6 +254,15 @@ config LSI_ET1011C_PHY
>         help
>           Supports the LSI ET1011C PHY.
>
> +config ET1011C_RUST_PHY
> +       bool "Rust reference driver for LSI ET1011C PHY"
> +       depends on RUST_PHYLIB_ABSTRACTIONS && LSI_ET1011C_PHY
> +       help
> +         Uses the Rust reference driver for LSI ET1011C PHY
> +         (et1011c_rust.ko). The features are equivalent.
> +         It supports the LSI ET1011C PHY. If unsure,
> +         say N.
> +
>  config MARVELL_PHY
>         tristate "Marvell Alaska PHYs"
>         help
> diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
> index 3a34917adea7..491469457a67 100644
> --- a/drivers/net/phy/Makefile
> +++ b/drivers/net/phy/Makefile
> @@ -62,7 +62,11 @@ obj-$(CONFIG_DP83TG720_PHY)  +=3D dp83tg720.o
>  obj-$(CONFIG_FIXED_PHY)                +=3D fixed_phy.o
>  obj-$(CONFIG_ICPLUS_PHY)       +=3D icplus.o
>  obj-$(CONFIG_INTEL_XWAY_PHY)   +=3D intel-xway.o
> -obj-$(CONFIG_LSI_ET1011C_PHY)  +=3D et1011c.o
> +ifdef CONFIG_ET1011C_RUST_PHY
> +  obj-$(CONFIG_LSI_ET1011C_PHY)        +=3D et1011c_rust.o
> +else
> +  obj-$(CONFIG_LSI_ET1011C_PHY)        +=3D et1011c.o
> +endif
>  obj-$(CONFIG_LXT_PHY)          +=3D lxt.o
>  obj-$(CONFIG_MARVELL_10G_PHY)  +=3D marvell10g.o
>  obj-$(CONFIG_MARVELL_PHY)      +=3D marvell.o
> diff --git a/drivers/net/phy/et1011c_rust.rs b/drivers/net/phy/et1011c_ru=
st.rs
> new file mode 100644
> index 000000000000..93dbf9586da3
> --- /dev/null
> +++ b/drivers/net/phy/et1011c_rust.rs
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (C) 2026 Artem Lytkin <iprintercanon@gmail.com>
> +
> +//! Rust LSI ET1011C PHY driver
> +//!
> +//! C version of this driver: [`drivers/net/phy/et1011c.c`](./et1011c.c)
> +
> +use kernel::{
> +    net::phy::{self, reg::C22, DeviceId, Driver},
> +    prelude::*,
> +};
> +
> +kernel::module_phy_driver! {
> +    drivers: [PhyET1011C],
> +    device_table: [
> +        DeviceId::new_with_driver::<PhyET1011C>()
> +    ],
> +    name: "rust_et1011c_phy",
> +    authors: ["Artem Lytkin <iprintercanon@gmail.com>"],
> +    description: "Rust LSI ET1011C PHY driver",
> +    license: "GPL",
> +}
> +
> +// Vendor-specific registers
> +const ET1011C_STATUS_REG: C22 =3D C22::vendor_specific::<0x1A>();
> +const ET1011C_CONFIG_REG: C22 =3D C22::vendor_specific::<0x16>();
> +
> +// ET1011C status register fields
> +const ET1011C_SPEED_MASK: u16 =3D 0x0300;
> +const ET1011C_GIGABIT_SPEED: u16 =3D 0x0200;
> +
> +// ET1011C config register fields
> +const ET1011C_TX_FIFO_MASK: u16 =3D 0x3000;
> +const ET1011C_TX_FIFO_DEPTH_16: u16 =3D 0x1000;
> +const ET1011C_GMII_INTERFACE: u16 =3D 0x0002;
> +const ET1011C_SYS_CLK_EN: u16 =3D 0x0010;
> +
> +struct PhyET1011C;
> +
> +#[vtable]
> +impl Driver for PhyET1011C {
> +    const NAME: &'static CStr =3D c"ET1011C";
> +    const PHY_DEVICE_ID: DeviceId =3D DeviceId::new_with_model_mask(0x02=
82f014);
> +
> +    fn soft_reset(dev: &mut phy::Device) -> Result {
> +        dev.genphy_soft_reset()
> +    }
> +
> +    fn read_status(dev: &mut phy::Device) -> Result<u16> {
> +        let old_speed =3D dev.speed();
> +        dev.genphy_read_status::<C22>()?;
> +
> +        if old_speed !=3D dev.speed() {
> +            let val =3D dev.read(ET1011C_STATUS_REG)?;
> +            if (val & ET1011C_SPEED_MASK) =3D=3D ET1011C_GIGABIT_SPEED {
> +                let cfg =3D dev.read(ET1011C_CONFIG_REG)?;
> +                let cfg =3D cfg & !ET1011C_TX_FIFO_MASK;
> +                dev.write(
> +                    ET1011C_CONFIG_REG,
> +                    cfg | ET1011C_GMII_INTERFACE
> +                        | ET1011C_SYS_CLK_EN
> +                        | ET1011C_TX_FIFO_DEPTH_16,
> +                )?;
> +            }
> +        }
> +
> +        Ok(0)
> +    }
> +}
> --
> 2.43.0
>
