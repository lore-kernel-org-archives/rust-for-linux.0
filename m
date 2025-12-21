Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A923BD02
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Dec 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766308319; cv=none; b=qtNsieFTAULJu1HdunOXzVKpnWLL5R0k0CvhsI6S2/+NJXWCI5HlCoNds/dEttZVyh1QYIl41NaHLvF4Z9maENvHIYx5E+JebsxvN57fwYYPeGjnzJBQTMC6GVHQkGH13tGGNvCHkrR0KeROXO9nCZ16Op0dtzTvSAL4Pe4cdQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766308319; c=relaxed/simple;
	bh=p4K6ZZ5UDbv6xtedRbkKqqzY+uDr3R/k1JkTcnv+oro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRQq49bplB9A+jQz8lzInf9sGhf1Prwog35MG90hNr5KtOQ3DybHXZ/ZRatDPL0ymJOEQvowp7dqNa3yj1cRexkzW9AqpCYobINarlTiojSIXjS5B4MGUaNipOhjJiaHLsaPdrZb8hE/ncrs4F94aWpdEqw10T7RM6ImsuL5Jhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6D1rLmk; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6D1rLmk"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b4b35c812so4105321a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Dec 2025 01:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766308316; x=1766913116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJxTo1StsAPyAw5V2VT3FLs+d6cjUn62zSVYT6JS2So=;
        b=N6D1rLmk3gP51ACwD0tA1zW27UOIXVfe4Elg8MJkX2SwEKtjMUQkEt4H44vKWfBN3+
         UuzKSSgyne5VGI0uqg82gJajSi/ckpvSznIc5IjQ+QCzCTNu99DS5S0kadt0X5ixbiDO
         lV8O2Ev5ss3qVIWEAx3J5HedVWbNK/JH2cqXbk3WPlP4vUAx0gd+NWIB1mggy1g4K8JA
         BG4DPBx8kdaqc/6sdcDOQfH4rH6x78N1Cz3OQdV4tP7FuNill8diV7DyKhuOdPPcAmdi
         8JTyT2ph38kgqzE7NT58UmBDEEbctbg1VfqDa2ans/QKw4X6uA4qQD2Hhqvwn2WQE62k
         t2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766308316; x=1766913116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJxTo1StsAPyAw5V2VT3FLs+d6cjUn62zSVYT6JS2So=;
        b=CmrAlt+vLTSfxjv1YOtScUXWumY3QFzeesrhQ2qwx/XbiHyR72XaPvfdDVZ8AMjUXr
         XVppKAHZy6jZ8smzkd4booCGBL9QibXDqbLa2j8z6OobpbufbiDhitLa7K9OiF81N75S
         SLG1NqBQFebTKfwGj2EYSe527xMS2M3xme5Z+YCEKNU9y9ctfhKqy5zTxXPKu25g4fyA
         1O+VlxW25rqd2BIT72kjJJVAfS4zzEd96VE38mm9XYVsNiTcBwhKFknAghozlw5HpRBQ
         NNP2+O2QLUFi7kp77FzlduJ6z9bNT+1BUuXYUz+EXTbvjcNuMVqbxLzIsYCw85hn4TkQ
         jDKg==
X-Forwarded-Encrypted: i=1; AJvYcCWembnghtGjcy86w0tXNlkTYTJEZlxNma5+dpxIhNgsd1H4/WSqhaHGdqI3ZwQ0R3YgtDbZGuvsnY3DafmRIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtITUP7duVTmCmD1e0OvhXUJHHbUNUeI7gYqDqHjYTcfPOfbft
	5jTzjvQI8skGW6zK6yDSfv3TbuQpxUJQZFc68Q8xTMRHzsmcw1gu3tey
X-Gm-Gg: AY/fxX6JMbNutNBkZYTSUVeWSk6HVVvSvAMLaIF3J2vYIfQCkLqNyCP6rO9FZS+1SPW
	I6/lKEv7Lqu/lI1/Ox6ojpYzNTwqm0AdUMxOrQ48VLr3TsuFeLXKDyiDztcQaa9J+9FIDbyWddV
	nGPK3T9RBDOunRMNJLoHRf3qKDjYZJldaMDhZf/PHB0SEkfch4L7xemvwDnVd1nF8hWxKMMY5SH
	NmlbcxHdpKS2YgSHIosDOtKdQ+jUcTsq+WHFvzWlhQuDTzPd3NCinV370RLj0tgEhPTup958MPO
	UCzL7Nlk080QWb1zOLgCUMgwPnhsNcDXzxVQ1lUiMR1z7Pyp7o+tQWoIIzI5QUAsa/3qp3Mhtr6
	Z/R2kq/m0r4sGLG3JaM5ER4DRLQw5Y+sfmHZjP1ko9cc8PP6QUdM59NZUmJW4SPaI9p9w3hXzFq
	AuP5py7zcGlekqAtXn6IZ8UC/Sc/NP9yFzIQn5zpWTdZeb46Ph8wJS2diMSXAOmLmgcoUWoIStu
	aNxTkXN9giRP48sJ0VQrY0TTXZM2hXcmClNHBJeDQMGrw==
X-Google-Smtp-Source: AGHT+IEsEr93QO0hH1tZL57OTUeoBwpBNF/UhF1GdR8z9V2lP4dhUOAFVvNvMgPMaCLAYn6SQxRbOA==
X-Received: by 2002:a17:907:3fa8:b0:b76:3548:cdef with SMTP id a640c23a62f3a-b8036f2abcbmr808495166b.25.1766308315612;
        Sun, 21 Dec 2025 01:11:55 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:9f8f:28b1:4136:8493? (p200300dfbf2de3009f8f28b141368493.dip0.t-ipconnect.de. [2003:df:bf2d:e300:9f8f:28b1:4136:8493])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f37ee8sm704325366b.59.2025.12.21.01.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 01:11:55 -0800 (PST)
Message-ID: <c65689bf-67fd-4f7e-a878-59675ad429c4@gmail.com>
Date: Sun, 21 Dec 2025 10:11:53 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] samples: rust: add Rust serial device bus sample
 device driver
To: Markus Probst <markus.probst@posteo.de>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Kari Argillander <kari.argillander@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251220-rust_serdev-v1-0-e44645767621@posteo.de>
 <20251220-rust_serdev-v1-3-e44645767621@posteo.de>
Content-Language: en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251220-rust_serdev-v1-3-e44645767621@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Markus,

On 20.12.25 19:44, Markus Probst wrote:
> Add a sample Rust serial device bus device driver illustrating the usage
> of the platform bus abstractions.
> 
> This drivers probes through either a match of device / driver name or a
> match within the OF ID table.
> ---
>  samples/rust/Kconfig               |  10 +++
>  samples/rust/Makefile              |   1 +
>  samples/rust/rust_driver_serdev.rs | 175 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 186 insertions(+)
...
> diff --git a/samples/rust/rust_driver_serdev.rs b/samples/rust/rust_driver_serdev.rs
> new file mode 100644
> index 000000000000..f23b38a26c32
> --- /dev/null
> +++ b/samples/rust/rust_driver_serdev.rs
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust Serial device bus device driver sample.
> +
> +use kernel::{
> +    acpi,
> +    device::{
> +        self,
> +        property::{
> +            FwNodeReferenceArgs,
> +            NArgs, //
> +        },
> +        Bound,
> +        Core, //
> +    },
> +    of,
> +    prelude::*,
> +    serdev,
> +    str::CString,
> +    sync::aref::ARef, //
> +};
> +
> +struct SampleDriver {
> +    sdev: ARef<serdev::Device>,
> +}
> +
> +struct Info(u32);
> +
> +kernel::of_device_table!(
> +    OF_TABLE,
> +    MODULE_OF_TABLE,
> +    <SampleDriver as serdev::Driver>::IdInfo,
> +    [(of::DeviceId::new(c"test,rust_driver_serdev"), Info(42))]

I stopped reading here regarding the new "rust_driver_serdev" but
re-reading Rob's

https://lore.kernel.org/rust-for-linux/20241022234712.GB1848992-robh@kernel.org/

adding "test,<whatever>" should be fine as-is without any documenation.

> +);
> +
> +kernel::acpi_device_table!(
> +    ACPI_TABLE,
> +    MODULE_ACPI_TABLE,
> +    <SampleDriver as serdev::Driver>::IdInfo,
> +    [(acpi::DeviceId::new(c"LNUXBEEF"), Info(0))]
> +);
> +
> +#[vtable]
> +impl serdev::Driver for SampleDriver {
> +    type IdInfo = Info;
> +    type InitialData = ();
> +    type LateProbeData = ();
> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
> +    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
> +
> +    fn probe(sdev: &serdev::Device, info: Option<&Self::IdInfo>) -> impl PinInit<Self, Error> {
> +        let dev = sdev.as_ref();
> +
> +        dev_dbg!(dev, "Probe Rust Serial device bus device driver sample.\n");
> +
> +        if let Some(info) = info {
> +            dev_info!(dev, "Probed with info: '{}'.\n", info.0);
> +        }

Last time I had a look to the log output from rust_driver_platform.rs
(where this is copied from?) I was slightly confused to see the
"Probed with ..." in the log but not the "Probe Rust ...". Well, I
hadn't DEBUG enabled. So I wonder if the combination of `dev_dbg!()`
and `dev_info!()` this way should be improved? At least in
rust_driver_platform.rs because we could drop that here completely? I
mean in rust_driver_platform.rs it makes sense to demonstrate how
`info` is supposed to work. But do we need that here?


> +        if dev.fwnode().is_some_and(|node| node.is_of_node()) {
> +            Self::properties_parse(dev)?;
> +        }


This is a left over from copy & paste? I mean having all this
`properties_parse()` below and calling it here does not make any sense
here? And should be dropped completely?


> +
> +        Ok(Self { sdev: sdev.into() })
> +    }
> +
> +    fn configure(
> +        sdev: &serdev::Device<Core>,
> +        _this: Pin<&Self>,
> +        _id_info: Option<&Self::IdInfo>,
> +    ) -> Result {
> +        dev_dbg!(
> +            sdev.as_ref(),
> +            "Configure Rust Serial device bus device driver sample.\n"
> +        );
> +
> +        sdev.set_baudrate(115200);
> +        sdev.set_flow_control(false);
> +        sdev.set_parity(serdev::Parity::None)?;
> +        Ok(())
> +    }
> +
> +    fn late_probe(
> +        sdev: &serdev::Device<Bound>,
> +        _this: Pin<&Self>,
> +        _initial_data: Self::InitialData,
> +    ) -> impl PinInit<Self::LateProbeData, Error> {
> +        dev_dbg!(
> +            sdev.as_ref(),
> +            "Late Probe Rust Serial device bus device driver sample.\n"
> +        );
> +        Ok(())
> +    }
> +
> +    fn receive(
> +        sdev: &serdev::Device<Bound>,
> +        _this: Pin<&Self>,
> +        _late_probe_this: Pin<&Self::LateProbeData>,
> +        data: &[u8],
> +    ) -> usize {
> +        let _ = sdev.write_all(data, serdev::Timeout::MaxScheduleTimeout);


Is it intended to have a function with the name `receive()`calling
`write()`?

> +        data.len()
> +    }
> +}
> +
> +impl SampleDriver {
> +    fn properties_parse(dev: &device::Device) -> Result {


As mentioned above I think this is a left over from copy & paste and
should be dropped?

Cheers,

Dirk
