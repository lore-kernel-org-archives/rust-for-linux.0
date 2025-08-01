Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70BC27C15A
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754071823; cv=pass; b=obBWGhY6bWo/CXCUFaEwesfjksh1fQJns2lleDA3GO1o0jfC65etlVOw4WVzMQ4Pn9nVB4vwpL2p6lhKq2vW2RFiTlk6Ema1Tq2yco5qaE43mZ2KT6eB6+El/kXTZP+C8whl091h3jUhCSkKanNujyXw8zyOCw01YJSzdrokD1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754071823; c=relaxed/simple;
	bh=E1VbaAhSYK7f6KfGJYDdphsK1efv9/ql4jpMZ7oIxrw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=eQfGApQsLKbU8n04oSRFETg03V/tqMPKePQ0VdqeB22OxsqJiHacyQEUYyJmlMagjIjOwD8iO3A5vDg8t/EjSvv2ve1U2eF7ryL0JfRX3assgSCr/pmq0Ar3Im07soQszAb1ALtHVCP1lNLamcdHj4ZLBYas1rPdi+7Fmaigu8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MIi4GCXm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MIi4GCXm"
ARC-Seal: i=1; a=rsa-sha256; t=1754071807; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iXWa6x6MAalPA2g8WOWRRTR4qZGDo10XzHoz5lhXuqeLY6vyVof0Gudz3ks2kAJ++dMCWBFKrPyi6GR4maA36EoynExr/8WpOZTnKoBBPa7wkVLdoFZRWQi/SKpUgk3XhZqmnc2DAS8HnJKZhABndr8DWF0DvqdNBTdIYH17P+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754071807; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RzDqSDbakAWfWC+6MAmcIc6WoEP3KQYsxgW5b3ozb/4=; 
	b=jxy+TgRScsq120Tlad/XeqW7MRqgoYf8xHkelRG/wLt6tk4NsogzAfm18z6cM2iaSblU5KVn8f6pvo7kvWEa0BnlT6omb/fzrqnIeAxyW4y53P4QG7qyHX6r88DhooletiUrimPzT/DRK/aNQkfWCDIhQdJWQWVMTgR3Rem75gk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754071807;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=RzDqSDbakAWfWC+6MAmcIc6WoEP3KQYsxgW5b3ozb/4=;
	b=MIi4GCXm1fTS3cNCjyb9iFCr/lO0+hqxiBU1ZA0teXfsAWBDMksPuHoKpedez/7E
	g4dRmoUs6jeK0hxE13ZXZ27OQlAZaF+KxpUf+tP+ibG8hO/BYBL1V1J8QmJZL50urGV
	jTE4U6UQPolTzrFdpl/RYoH6UUtdgRqyHqK5GXqA=
Received: by mx.zohomail.com with SMTPS id 1754071804992971.1307039889136;
	Fri, 1 Aug 2025 11:10:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 3/3] samples: rust: add Rust I2C sample driver
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250801154506.14810-1-igor.korotin.linux@gmail.com>
Date: Fri, 1 Aug 2025 15:09:50 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8291F536-BAAD-4F45-9072-8876CA44922B@collabora.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154506.14810-1-igor.korotin.linux@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Igor,

Overall looks good, some minor comments below.

> On 1 Aug 2025, at 12:45, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> Add a new `rust_driver_i2c` sample, showing how to create a new
> i2c client using `i2c::Registration` and bind a driver to it
> via legacy I2C-ID table.
>=20
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
> ---
> MAINTAINERS                     |   1 +
> samples/rust/Kconfig            |  11 ++++
> samples/rust/Makefile           |   1 +
> samples/rust/rust_driver_i2c.rs | 106 ++++++++++++++++++++++++++++++++
> 4 files changed, 119 insertions(+)
> create mode 100644 samples/rust/rust_driver_i2c.rs
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 767beaa0f7c2..69312298ea01 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11520,6 +11520,7 @@ R: Danilo Krummrich <dakr@kernel.org>
> L: rust-for-linux@vger.kernel.org
> S: Maintained
> F: rust/kernel/i2c.rs
> +F: samples/rust/rust_driver_i2c.rs
>=20
> I2C SUBSYSTEM HOST DRIVERS
> M: Andi Shyti <andi.shyti@kernel.org>
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index 7f7371a004ee..28dae070b365 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -62,6 +62,17 @@ config SAMPLE_RUST_DMA
>=20
>  If unsure, say N.
>=20
> +config SAMPLE_RUST_DRIVER_I2C
> + tristate "I2C Driver"
> + depends on I2C=3Dy
> + help
> +  This option builds the Rust I2C driver sample.
> +
> +  To compile this as a module, choose M here:
> +  the module will be called rust_driver_i2c.
> +
> +  If unsure, say N.
> +
> config SAMPLE_RUST_DRIVER_PCI
> tristate "PCI Driver"
> depends on PCI
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index bd2faad63b4f..141d8f078248 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_SAMPLE_RUST_MINIMAL) +=3D rust_minimal.o
> obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE) +=3D rust_misc_device.o
> obj-$(CONFIG_SAMPLE_RUST_PRINT) +=3D rust_print.o
> obj-$(CONFIG_SAMPLE_RUST_DMA) +=3D rust_dma.o
> +obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C) +=3D rust_driver_i2c.o
> obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI) +=3D rust_driver_pci.o
> obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM) +=3D rust_driver_platform.o
> obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX) +=3D rust_driver_faux.o
> diff --git a/samples/rust/rust_driver_i2c.rs =
b/samples/rust/rust_driver_i2c.rs
> new file mode 100644
> index 000000000000..20815efc933e
> --- /dev/null
> +++ b/samples/rust/rust_driver_i2c.rs
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust I2C driver sample.
> +//!
> +//! This module shows how to:

Blank line here?

> +//! 1. Manually create an `i2c_client` at address =
`SAMPLE_I2C_CLIENT_ADDR`
> +//!    on the adapter with index `SAMPLE_I2C_ADAPTER_INDEX`.
> +//! 2. Register a matching Rust-based I2C driver for that client.
> +//!
> +//! # Requirements

Blank line here?

> +//! - The target system must expose an I2C adapter at index
> +//!   `SAMPLE_I2C_ADAPTER_INDEX`.
> +//! - To emulate an adapter for testing, you can load the
> +//!   `i2c-stub` kernel module.

Anything else needs to be done?

> +//!
> +
> +use kernel::{acpi, c_str, device::Core, i2c, of, prelude::*, =
types::ARef};
> +
> +const SAMPLE_I2C_CLIENT_ADDR: u16 =3D 0x30;
> +const SAMPLE_I2C_ADAPTER_INDEX: i32 =3D 0;
> +const BOARD_INFO: i2c::I2cBoardInfo =3D
> +    i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), =
SAMPLE_I2C_CLIENT_ADDR);
> +
> +struct SampleDriver {
> +    pdev: ARef<i2c::Device>,
> +}
> +
> +kernel::acpi_device_table! {
> +    ACPI_TABLE,
> +    MODULE_ACPI_TABLE,
> +    <SampleDriver as i2c::Driver>::IdInfo,
> +    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), 0)]
> +}
> +
> +kernel::i2c_device_table! {
> +    I2C_TABLE,
> +    MODULE_I2C_TABLE,
> +    <SampleDriver as i2c::Driver>::IdInfo,
> +    [(i2c::DeviceId::new(c_str!("rust_driver_i2c")), 0)]
> +}
> +
> +kernel::of_device_table! {
> +    OF_TABLE,
> +    MODULE_OF_TABLE,
> +    <SampleDriver as i2c::Driver>::IdInfo,
> +    [(of::DeviceId::new(c_str!("test,rust_driver_i2c")), 0)]
> +}
> +
> +impl i2c::Driver for SampleDriver {
> +    type IdInfo =3D u32;
> +
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> =3D =
Some(&ACPI_TABLE);
> +    const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> =3D =
Some(&I2C_TABLE);
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> =3D =
Some(&OF_TABLE);
> +
> +    fn probe(pdev: &i2c::Device<Core>, info: Option<&Self::IdInfo>) =
-> Result<Pin<KBox<Self>>> {
> +        let dev =3D pdev.as_ref();
> +
> +        dev_dbg!(dev, "Probe Rust I2C driver sample.\n");
> +
> +        if let Some(info) =3D info {
> +            dev_info!(dev, "Probed with info: '{}'.\n", info);
> +        }
> +
> +        let drvdata =3D KBox::new(Self { pdev: pdev.into() }, =
GFP_KERNEL)?;
> +
> +        Ok(drvdata.into())
> +    }

Blank line here.

> +    fn shutdown(pdev: &i2c::Device<Core>) {
> +        dev_dbg!(pdev.as_ref(), "Shutdown Rust I2C driver =
sample.\n");
> +    }
> +}
> +
> +impl Drop for SampleDriver {
> +    fn drop(&mut self) {
> +        dev_dbg!(self.pdev.as_ref(), "Remove Rust I2C driver =
sample.\n");
> +    }
> +}
> +
> +// NOTE: The code below is expanded macro module_i2c_driver. It is =
not used here
> +//       because we need to manually create an I2C client in =
`init()`. The macro
> +//       hides `init()`, so to demo client creation on adapter =
SAMPLE_I2C_ADAPTER_INDEX
> +//       we expand it by hand.
> +type Ops<T> =3D kernel::i2c::Adapter<T>;

Blank here.

Also, just =E2=80=9Cpin_data=E2=80=9D ?

> +#[kernel::prelude::pin_data]
> +struct DriverModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
> +    _reg: i2c::Registration,
> +}
> +
> +impl kernel::InPlaceModule for DriverModule {
> +    fn init(
> +        module: &'static kernel::ThisModule,
> +    ) -> impl ::pin_init::PinInit<Self, kernel::error::Error> {
> +        let adapter =3D =
i2c::I2cAdapterRef::get(SAMPLE_I2C_ADAPTER_INDEX);
> +
> +        kernel::try_pin_init!(Self {
> +            _reg <- i2c::Registration::new(&adapter.unwrap(), =
&BOARD_INFO),
> +            _driver<-kernel::driver::Registration::new(<Self as =
kernel::ModuleMetadata>::NAME,module,),

Missing space in =E2=80=9C<-=E2=80=9C

> +        })
> +    }
> +}
> +kernel::prelude::module! {
> +    type:DriverModule,name:"rust_driver_i2c",authors:["Igor =
Korotin"],description:"Rust I2C driver",license:"GPL v2",
> +}
> --=20
> 2.43.0
>=20
>=20

This is usually broken into multiple lines?

=E2=80=94 Daniel

