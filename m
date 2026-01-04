Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366E2207A32
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767517333; cv=none; b=VvNDCv5Gha7Z26t17NsH2AigDQLmxSlE51v0TCSUL1x6dSTr1iSYPiEB9EYYP+lYs2EUhU5nBa+LqXIBsQoPFEVYlibBJqV94oWfHC72Mvy6YPv53PZscYZEdlyEpDM84VY8VBHkB4EcvFTHc4dS0yhiu2KNbRYRfQ4JhQEtdmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767517333; c=relaxed/simple;
	bh=JSFo6TFQvnnxw4KReDsl5eqHzi/+b2PynXZl1DEs22g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AdVafYeDLQB41/BLZntVfuKfjKYDL8aL7XsjQqhUcPkLxIYozBwD0ZMRht0YRaqoyWTOl6tdB5xuMBpCG3iu15TMu0qlSauFpoeSsB1lP5jGMuMx1Uvs9vpNu7WaHoMLxoB0P6YeEaBtnBSQbiBDj6leZOz4Tz3veTPyJbsLE+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcHd5bjK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcHd5bjK"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so6233650f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 01:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767517329; x=1768122129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6QFcWszrtipXkRQXB/nc2SmIiLROzBoHo8ZMrLOml0c=;
        b=WcHd5bjK6bxCVk6adn5t93vL3I1JsWXI6XE9VVEWCS7MB70C8WzIVBMsseMe/rBcPq
         SXU5MowOVPTvdrt3vNXE5N4wCj1/80Dy4oC1UBs+RzGXHX6b8EogDy41svaSaqyDgJWD
         wDJD50RgtxMISFsmQ0HZqwrRlfCSdnmqMmEmQvSvD0icdCgDge7m9g6rRsnOx2SS9hey
         WUfu/X/pVhDbBy9X+HSqFiBWFgID7qwxBx4sNGwa9cPncywt7RdvSDB+78/uny9vnQ2s
         XK0QcauKVcltxsJ21xw9hOjZZUZRaPyLLo5Ze+Uu07okysSeAhdtiI3azm5n67Nd0Pbi
         ycgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767517329; x=1768122129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QFcWszrtipXkRQXB/nc2SmIiLROzBoHo8ZMrLOml0c=;
        b=mt9w6ipFau7wWROYlljegMIerXLZTHojP3TLK+UIx8bdvqDcyUY7nvq5Z7w+n71gwh
         pisddD7Nrfy1kmj/sENcPnkAl6LFViRT1g7owBcDQESHFyy+/P+qOie2l/NF5DTDtv4A
         H6t6LF0mV1Xy3pa8ZMF553+mEo/DZtqzjXPfxWvM/3j3mG3PUAKultGaJ/yE8v8ktX5f
         TnR22m7yUUzrKUpBq4YMUCy8+R5Sniq5dP8Z4b/9GTNtDAOpWigV2ib3wHyb+q1WwZft
         lBu3dSvSpPNsLsfPo0kEy1jsNb24U5MmrHj/h/a1vloBOqlbYmBBD0XnZKvh5QXNWPXS
         P1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXpxnVpBrg6257EYrSVYLCakfYioeU8G/iJnqBcK6m9jF56uhzeR7CInR6L6euWakO/Cj8mahIbLFiC3/fqbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5LwZOyjn01v1SYnIZDG3wMjVOJ21b11TCcOCCmLW7AcdRfDuF
	rCGhuYU+V7OfH6gKh85Cr6ci/97yFGiJLuBv4al6K2/bLrkpYGGpDmP7
X-Gm-Gg: AY/fxX74Q/pWeJ9Cgf0WzlnHYe2fnbtNpfpW3e9vKodbuUFEuJq8sCg1Zrvw0rhPDXW
	kzar3zmfvy5le2d0zt2Si3IaxVLiYY6PypeqQnPd7N5khAlD40z6Q+qG3M4TM7Wgux0Bn5lft9D
	Xt1MnwUj10n2oRXFOxAIzhOHaCP4gnPm102CMXSxgv62jc6srCo0C6/uYIwDCZgDf/FTb8ILrF0
	en5J9trHfefQrQtVwB4zpDBF3+Wy1ePnTfxiX/tYejRzfI+JMWeAqqLqJPWdwThreOvhe+WpKGV
	xxlZ6GV327Fo0XVwdTydr2kCAcLoQvd72/xTmUXjXrsuwBanY3mkCbkd2X04WJlzMrdtYAbXNU0
	fJ6hMTrgFTRsPNdWkNcgL+Nr+A/sP79GDprlLVSO40Dznw+BZcaDLI9bH7tuUHKTc3GM6f7RtMk
	cpOFjk5XftTdpfpeVST/VAZhOfKULtzBIFWatXPH3XYErbN8qCA/Dms2SEtTKUeiK1mflH9EAYI
	O9VWgvnfl56+RoNohf8PU0NB5+SVE/jhtCDdigWTv2LP6Jt9oc=
X-Google-Smtp-Source: AGHT+IHOlobxq0Y9n+YGAUjHiGaFjhjhmWs69vYmYGSt+BS4hZMcgDno5jvX5wWmNwQvAGAs/35bhw==
X-Received: by 2002:a05:6000:178d:b0:42f:bab5:953d with SMTP id ffacd0b85a97d-4324e50a222mr59037696f8f.47.1767517329060;
        Sun, 04 Jan 2026 01:02:09 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:fa4:ce1:cfaf:e4ee? (p200300dfbf2de3000fa40ce1cfafe4ee.dip0.t-ipconnect.de. [2003:df:bf2d:e300:fa4:ce1:cfaf:e4ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea8311fsm94187298f8f.28.2026.01.04.01.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 01:02:08 -0800 (PST)
Message-ID: <48d23334-b167-48a5-a645-28276eb85b00@gmail.com>
Date: Sun, 4 Jan 2026 10:02:06 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 4/4] rust: add PL031 RTC driver
To: Ke Sun <sunke@kylinos.cn>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Alvin Sun <sk.alvin.x@gmail.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <20260104060621.3757812-5-sunke@kylinos.cn>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260104060621.3757812-5-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

reading this triggers two questions (discussion topics?) for me. They
are not specific to this driver but more general. Though they should
not block any progress or merging of this driver. I'd like to ask:

On 04.01.26 07:06, Ke Sun wrote:
> Add Rust implementation of the ARM AMBA PrimeCell 031 RTC driver.
> 
> This driver supports:
> - ARM, ST v1, and ST v2 variants
> - Time read/write operations
> - Alarm read/write operations
> - Interrupt handling
> - Wake-up support
> 
> The driver uses the AMBA bus abstractions and RTC core framework
> introduced in previous commits.
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  drivers/rtc/Kconfig           |  11 +
>  drivers/rtc/Makefile          |   1 +
>  drivers/rtc/rtc_pl031_rust.rs | 529 ++++++++++++++++++++++++++++++++++
>  3 files changed, 541 insertions(+)
>  create mode 100644 drivers/rtc/rtc_pl031_rust.rs
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 50dc779f7f983..c7ce188dcc5cf 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1591,6 +1591,17 @@ config RTC_DRV_PL031
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called rtc-pl031.
>  
> +config RTC_DRV_PL031_RUST
> +	tristate "ARM AMBA PL031 RTC (Rust)"
> +	depends on RUST && RTC_CLASS && RUST_BUILD_ASSERT_ALLOW
> +	help
> +	  This is the Rust implementation of the PL031 RTC driver.
> +	  It provides the same functionality as the C driver but is
> +	  written in Rust for improved memory safety.
> +
> +	  This driver requires CONFIG_RUST_BUILD_ASSERT_ALLOW to be enabled
> +	  because it uses build-time assertions for memory safety checks.
> +
>  config RTC_DRV_AT91RM9200
>  	tristate "AT91RM9200 or some AT91SAM9 RTC"
>  	depends on ARCH_AT91 || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 6cf7e066314e1..10f540e7409b4 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -139,6 +139,7 @@ obj-$(CONFIG_RTC_DRV_PCF8583)	+= rtc-pcf8583.o
>  obj-$(CONFIG_RTC_DRV_PIC32)	+= rtc-pic32.o
>  obj-$(CONFIG_RTC_DRV_PL030)	+= rtc-pl030.o
>  obj-$(CONFIG_RTC_DRV_PL031)	+= rtc-pl031.o
> +obj-$(CONFIG_RTC_DRV_PL031_RUST)	+= rtc_pl031_rust.o
>  obj-$(CONFIG_RTC_DRV_PM8XXX)	+= rtc-pm8xxx.o
>  obj-$(CONFIG_RTC_DRV_POLARFIRE_SOC)	+= rtc-mpfs.o
>  obj-$(CONFIG_RTC_DRV_PS3)	+= rtc-ps3.o
> diff --git a/drivers/rtc/rtc_pl031_rust.rs b/drivers/rtc/rtc_pl031_rust.rs
> new file mode 100644
> index 0000000000000..c00a49c2bf94e
> --- /dev/null
> +++ b/drivers/rtc/rtc_pl031_rust.rs
> @@ -0,0 +1,529 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//! Real Time Clock interface for ARM AMBA PrimeCell 031 RTC
> +//!
> +//! This is a Rust port of the C driver in rtc-pl031.c
> +//!
> +//! Author: Ke Sun <sunke@kylinos.cn>
> +//! Based on: drivers/rtc/rtc-pl031.c
> +
> +use core::ops::Deref;
> +use kernel::{
> +    amba,
> +    bindings,
> +    c_str,
> +    device,
> +    devres::Devres,
> +    error::code,
> +    io::mem::IoMem,
> +    irq::{
> +        Handler,
> +        IrqReturn, //
> +    },
> +    prelude::*,
> +    rtc::{
> +        self,
> +        RtcDevice,
> +        RtcDeviceOptions,
> +        RtcOperations,
> +        RtcTime,
> +        RtcWkAlrm, //
> +    },
> +    sync::aref::ARef, //
> +};
> +
> +// Register definitions
> +const RTC_DR: usize = 0x00; // Data read register
> +const RTC_MR: usize = 0x04; // Match register
> +const RTC_LR: usize = 0x08; // Data load register
> +const RTC_CR: usize = 0x0c; // Control register
> +const RTC_IMSC: usize = 0x10; // Interrupt mask and set register
> +const RTC_RIS: usize = 0x14; // Raw interrupt status register
> +const RTC_MIS: usize = 0x18; // Masked interrupt status register
> +const RTC_ICR: usize = 0x1c; // Interrupt clear register
> +const RTC_YDR: usize = 0x30; // Year data read register
> +const RTC_YMR: usize = 0x34; // Year match register
> +const RTC_YLR: usize = 0x38; // Year data load register
> +
> +// Control register bits
> +const RTC_CR_EN: u32 = 1 << 0; // Counter enable bit
> +const RTC_CR_CWEN: u32 = 1 << 26; // Clockwatch enable bit
> +
> +// Interrupt status and control register bits
> +const RTC_BIT_AI: u32 = 1 << 0; // Alarm interrupt bit


I know that it is not ready yet and still in development, but what's
about the register!() macro [1] [2]?

Do we want a common register access style in Rust drivers and want to
encourge using the register macro for that? Or do we take what we have
at the moment (like here) and eventually convert later to the register
macro? Or not? Opinions?

CCing Joel and Alexandre regarding the register macro.

[1]
https://lore.kernel.org/rust-for-linux/20251003154748.1687160-5-joelagnelf@nvidia.com/

[2]
https://lore.kernel.org/rust-for-linux/DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org/


> +// RTC event flags
> +#[allow(dead_code)]
> +const RTC_AF: u32 = bindings::RTC_AF;
> +#[allow(dead_code)]
> +const RTC_IRQF: u32 = bindings::RTC_IRQF;
> +
> +// ST v2 time format bit definitions
> +const RTC_SEC_SHIFT: u32 = 0;
> +const RTC_SEC_MASK: u32 = 0x3F << RTC_SEC_SHIFT; // Second [0-59]
> +const RTC_MIN_SHIFT: u32 = 6;
> +const RTC_MIN_MASK: u32 = 0x3F << RTC_MIN_SHIFT; // Minute [0-59]
> +const RTC_HOUR_SHIFT: u32 = 12;
> +const RTC_HOUR_MASK: u32 = 0x1F << RTC_HOUR_SHIFT; // Hour [0-23]
> +const RTC_WDAY_SHIFT: u32 = 17;
> +const RTC_WDAY_MASK: u32 = 0x7 << RTC_WDAY_SHIFT; // Day of week [1-7], 1=Sunday
> +const RTC_MDAY_SHIFT: u32 = 20;
> +const RTC_MDAY_MASK: u32 = 0x1F << RTC_MDAY_SHIFT; // Day of month [1-31]
> +const RTC_MON_SHIFT: u32 = 25;
> +const RTC_MON_MASK: u32 = 0xF << RTC_MON_SHIFT; // Month [1-12], 1=January
> +
> +/// Vendor-specific data for different PL031 variants
> +#[derive(Copy, Clone, PartialEq)]
> +enum VendorVariant {
> +    /// Original ARM version
> +    Arm,
> +    /// First ST derivative
> +    StV1,
> +    /// Second ST derivative
> +    StV2,
> +}
> +
> +impl VendorVariant {
> +    fn clockwatch(&self) -> bool {
> +        matches!(self, VendorVariant::StV1 | VendorVariant::StV2)
> +    }
> +
> +    #[allow(dead_code)]
> +    fn st_weekday(&self) -> bool {
> +        matches!(self, VendorVariant::StV1 | VendorVariant::StV2)
> +    }
> +
> +    #[allow(dead_code)]
> +    fn range_min(&self) -> i64 {
> +        match self {
> +            VendorVariant::Arm | VendorVariant::StV1 => 0,
> +            VendorVariant::StV2 => bindings::RTC_TIMESTAMP_BEGIN_0000,
> +        }
> +    }
> +
> +    #[allow(dead_code)]
> +    fn range_max(&self) -> u64 {
> +        match self {
> +            VendorVariant::Arm | VendorVariant::StV1 => u64::from(u32::MAX),
> +            VendorVariant::StV2 => bindings::RTC_TIMESTAMP_END_9999,
> +        }
> +    }
> +}
> +
> +/// PL031 RTC driver private data.
> +#[pin_data(PinnedDrop)]
> +struct Pl031DrvData {
> +    #[pin]
> +    base: Devres<IoMem<0>>,
> +    variant: VendorVariant,
> +    /// RTC device reference for interrupt handler.
> +    ///
> +    /// Set in `init_rtcdevice` and remains valid for the driver's lifetime
> +    /// because the RTC device is managed by devres.
> +    rtc_device: Option<ARef<RtcDevice>>,
> +}
> +
> +// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync),
> +// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync because `RtcDevice` is
> +// Send+Sync).
> +unsafe impl Send for Pl031DrvData {}
> +// SAFETY: `Pl031DrvData` contains only `Send`/`Sync` types: `Devres` (Send+Sync),
> +// `VendorVariant` (Copy), and `Option<ARef<RtcDevice>>` (Send+Sync because `RtcDevice` is
> +// Send+Sync).
> +unsafe impl Sync for Pl031DrvData {}
> +
> +/// Vendor-specific data for different PL031 variants.
> +#[derive(Copy, Clone)]
> +struct Pl031Variant {
> +    variant: VendorVariant,
> +}
> +
> +impl Pl031Variant {
> +    const ARM: Self = Self {
> +        variant: VendorVariant::Arm,
> +    };
> +    const STV1: Self = Self {
> +        variant: VendorVariant::StV1,
> +    };
> +    const STV2: Self = Self {
> +        variant: VendorVariant::StV2,
> +    };
> +}
> +
> +impl Pl031Variant {
> +    const fn to_usize(self) -> usize {
> +        self.variant as usize
> +    }
> +}
> +
> +// Use AMBA device table for matching
> +kernel::amba_device_table!(
> +    ID_TABLE,
> +    MODULE_ID_TABLE,
> +    <Pl031DrvData as rtc::DriverGeneric<rtc::AmbaBus>>::IdInfo,
> +    [
> +        (
> +            amba::DeviceId::new_with_data(0x00041031, 0x000fffff, Pl031Variant::ARM.to_usize()),
> +            Pl031Variant::ARM
> +        ),
> +        (
> +            amba::DeviceId::new_with_data(0x00180031, 0x00ffffff, Pl031Variant::STV1.to_usize()),
> +            Pl031Variant::STV1
> +        ),
> +        (
> +            amba::DeviceId::new_with_data(0x00280031, 0x00ffffff, Pl031Variant::STV2.to_usize()),
> +            Pl031Variant::STV2
> +        ),
> +    ]
> +);
> +
> +impl rtc::DriverGeneric<rtc::AmbaBus> for Pl031DrvData {
> +    type IdInfo = Pl031Variant;
> +
> +    fn probe(
> +        adev: &amba::Device<device::Core>,
> +        id_info: Option<&Self::IdInfo>,
> +    ) -> impl PinInit<Self, Error> {
> +        pin_init::pin_init_scope(move || {
> +            let io_request = adev.io_request().ok_or(code::ENODEV)?;
> +
> +            let variant = id_info
> +                .map(|info| info.variant)
> +                .unwrap_or(VendorVariant::Arm);
> +
> +            Ok(try_pin_init!(Self {
> +                base <- IoMem::new(io_request),
> +                variant,
> +                // Set in init_rtcdevice
> +                rtc_device: None,
> +            }))
> +        })
> +    }
> +
> +    fn init_rtcdevice(
> +        rtc: &RtcDevice,
> +        drvdata: &mut Self,
> +        id_info: Option<&Self::IdInfo>,
> +    ) -> Result {
> +        let parent = rtc.bound_parent_device();
> +        let amba_dev_bound: &amba::Device<device::Bound> = parent.try_into()?;
> +
> +        amba_dev_bound.as_ref().init_wakeup()?;


Here and all other places using early (error) return with '?': I know
its idomatic and extremly conveninient. But I (still) feel somehow
uncomfortable with this from debugging point of view. From debugging
point of view, would we get any helpful log if any of these early
returns are taken? Yes, its quite unlikely that this happens. But in
case it happens would we get something more than just a somehow
silently malfunctioning device?

Opinions?

Thanks

Dirk

