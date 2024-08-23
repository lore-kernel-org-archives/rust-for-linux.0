Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34D2D030
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 05:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724390738; cv=none; b=bV1U7j4U9agJuVkIOlsvMKd1FZwyyvdfwJCcZaIj71sDbkpc01GMaWQJsYBesIw5uiJDR2//xfToChWdiDDo2G+TPQwVdeG1qPjYls1rv8oH2Mku4xngD6Gdl7QLwbLwyIcphvxZX5MJcq9O8jIlysnDxLMBKrGU/WG5XyEJWWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724390738; c=relaxed/simple;
	bh=B/gcpeTWHbcDbRPjfkTAak7CgJl7OWXRrtLhPijygE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tz278SRYaK3B9a730RjLFYMV5ZsXT6TZtJ/5HcQth7IFT3mM/JgDwCmgxg+jfc3bPAHgnZ3QBA7dd54z54xSKGMCOpBP4MlX72//kVhT1o8Lv1f5Wv2e2avjFZhddQs7Pq0mis33RLHUu9VTOUrWMuIfP7qjOYJ9ud+6P1/7K2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=GHboYb0m; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="GHboYb0m"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b4412fac76so14847147b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 22:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724390734; x=1724995534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz1rnBXtHSQaOSGqTOL08jbeB473JFbUq6Hfc62MJgI=;
        b=GHboYb0mAtmgEoJ+DFtwf9o5ebuRy2BFLcRFmOUd4Qjzi2QF/zdM/1JBfayQJ+Xjw4
         PO9oQRGUXjFwBkJbpWIka/xhjvYBDY1V3yR6EAAaQInqQasoJn1H/yLc0DIvQ2uPH1CY
         mfCGHjWKrLSHki6ijgayb8/gcMV2x0sj/M/Ub+nytCaYpYHvxw2FpGwD1iVUP8PVSy+u
         VCrYPwS4ZbQb5v7rIn4jgB0aHG3xBzpv4UYXvWb8TyBOFqG+sQ9haJx/vf7SSGCaOrXj
         pAtz1O06Ax3odO/hHvhnRPY68Qp4mZd+U+25IxsIkJDBSixiX+QlfLlrB1ftJMhf1Spa
         7zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724390734; x=1724995534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nz1rnBXtHSQaOSGqTOL08jbeB473JFbUq6Hfc62MJgI=;
        b=OCeDeGzPhmpfTwhgA2dvuMovemPBLKm9VUXktGBHOXYjHV2KNHH+LISxh7pYcTRTYI
         i3Gwwuzi8Y5wE1liYvMw4HiKrtv778rJd1IcL6xHjKn7TQRGiPUoSEa/AxTSPeWzWSN5
         J6vkkbvvRvvxjQ1gwF6m7yBY5biWDFNC6WGFD5Epw8Rz3IB+k4G8x57T/l0ttROcw/Ts
         D3W9f1YwRaiTc5jt36c0Cp/Mb6sZ/XPZZU11xgUL/HczgWDXRhv4NCOttU9eHNvITIZh
         Q1RxPmG+z3fy/5oQb0SD3VGlJ+1eITCoE9m/U7iLtf4+UaCW0a7e18M4WGyqwjksq/U0
         kWDA==
X-Forwarded-Encrypted: i=1; AJvYcCUBuiE/V7Y8O7kagQfQPIClHI8WJ7tdODq+cCAGehAuZ21QVokHySGtT0wiZfV/h4TWmoZJF9a/OUYdHEY+/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+tjkF0g/pLmRH55wlRKVxPQxwjASssfPzeylus+KhKuvxbmjV
	+TmXKIqTTi6iKSzCGDM6Cgj6zHo9COvVPY/qLzxOjAqSoJcyqd0tdwQIMCK3nNlX2FmS4nOiFuQ
	l12sKYKsqkceyAHMJT7U+RTPByoNro91ApNOCDQ==
X-Google-Smtp-Source: AGHT+IGw9UGzeMqgvbKIpMfknIY++KQh1LHFnPON4q3hLhQyNHkXXZojSHa4rw4A2nMLVonh+boXFCZCyv+TW8bXKCg=
X-Received: by 2002:a05:690c:448c:b0:65f:8209:3ede with SMTP id
 00721157ae682-6c62906569emr14371937b3.44.1724390734254; Thu, 22 Aug 2024
 22:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820225719.91410-1-fujita.tomonori@gmail.com> <20240820225719.91410-7-fujita.tomonori@gmail.com>
In-Reply-To: <20240820225719.91410-7-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 23 Aug 2024 00:25:23 -0500
Message-ID: <CALNs47uvG_yjzX7Ewszb6M__jMZFtPu1rtw8DqvL5CceqCw4Zg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 6/6] net: phy: add Applied Micro QT2025 PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 5:59=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This driver supports Applied Micro Circuits Corporation QT2025 PHY,
> based on a driver for Tehuti Networks TN40xx chips.
>
> The original driver for TN40xx chips supports multiple PHY hardware
> (AMCC QT2025, TI TLK10232, Aqrate AQR105, and Marvell 88X3120,
> 88X3310, and MV88E2010). This driver is extracted from the original
> driver and modified to a PHY driver in Rust.
>
> This has been tested with Edimax EN-9320SFP+ 10G network adapter.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

> diff --git a/drivers/net/phy/qt2025.rs b/drivers/net/phy/qt2025.rs
> new file mode 100644
> index 000000000000..a1505ffca9f5
> --- /dev/null
> +++ b/drivers/net/phy/qt2025.rs
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) Tehuti Networks Ltd.
> +// Copyright (C) 2024 FUJITA Tomonori <fujita.tomonori@gmail.com>
> +
> +//! Applied Micro Circuits Corporation QT2025 PHY driver
> +//!
> +//! This driver is based on the vendor driver `QT2025_phy.c`. This sourc=
e
> +//! and firmware can be downloaded on the EN-9320SFP+ support site.
> +use kernel::c_str;

Nit: line between module docs and the first import.

Could you add another note to the doc comment that the phy contains an
embedded Intel 8051 microcontroller? I was getting confused by the
below comments mentioning the 8051 until I realized this.

> +use kernel::error::code;
> +use kernel::firmware::Firmware;
> +use kernel::net::phy::{
> +    self,
> +    reg::{Mmd, C45},
> +    DeviceId, Driver,
> +};
> +use kernel::prelude::*;
> +use kernel::sizes::{SZ_16K, SZ_8K};
> +
> +kernel::module_phy_driver! {
> +    drivers: [PhyQT2025],
> +    device_table: [
> +        DeviceId::new_with_driver::<PhyQT2025>(),
> +    ],
> +    name: "qt2025_phy",
> +    author: "FUJITA Tomonori <fujita.tomonori@gmail.com>",
> +    description: "AMCC QT2025 PHY driver",
> +    license: "GPL",
> +    firmware: ["qt2025-2.0.3.3.fw"],
> +}
> +
> +struct PhyQT2025;
> +
> +#[vtable]
> +impl Driver for PhyQT2025 {
> +    const NAME: &'static CStr =3D c_str!("QT2025 10Gpbs SFP+");
> +    const PHY_DEVICE_ID: phy::DeviceId =3D phy::DeviceId::new_with_exact=
_mask(0x0043A400);
> +
> +    fn probe(dev: &mut phy::Device) -> Result<()> {
> +        // The vendor driver does the following checking but we have no =
idea why.
> +        let hw_id =3D dev.read(C45::new(Mmd::PMAPMD, 0xd001))?;
> +        if (hw_id >> 8) & 0xff !=3D 0xb3 {
> +            return Err(code::ENODEV);
> +        }

I actually found this described in the datasheet for the QT2022:
1.D000h is a two-byte "product code", "1.D001h" is a one byte revision
code followed by one byte reserved. So 0xb3 is presumably something
like the major silicon revision number.

Based on how the vendor code is written, it seems like they are
expecting different phy revs to need different firmware. It might be
worth making a note that our firmware only works with 0xb3, whatever
exactly that means.

The `& 0xff` shouldn't be needed since `dev.read` returns an unsigned numbe=
r.



I went through the datasheet and found some register names, listed
them below. Maybe it is worth putting the names in the comments if
they exist? Just to make things a bit more searchable if somebody
pulls up a datasheet.

> +        // The Intel 8051 will remain in the reset state.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC300), 0x0000)?;

This sets `MICRO_RESETN` to hold the embedded micro in reset while configur=
ing.

> +        // Configure the 8051 clock frequency.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC302), 0x0004)?;

This one is `SREFCLK_FREQ`, embedded micro clock frequency. I couldn't
figure out what the meaning of the value is.

> +        // Non loopback mode.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC319), 0x0038)?;
> +        // Global control bit to select between LAN and WAN (WIS) mode.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC31A), 0x0098)?;

This LAN/WAN select is called  `CUS_LAN_WAN_CONFIG`

> +        // The following writes use standardized registers (3.38 through
> +        // 3.41 5/10/25GBASE-R PCS test pattern seed B) for something el=
se.
> +        // We don't know what.
> +        dev.write(C45::new(Mmd::PCS, 0x0026), 0x0E00)?;
> +        dev.write(C45::new(Mmd::PCS, 0x0027), 0x0893)?;
> +        dev.write(C45::new(Mmd::PCS, 0x0028), 0xA528)?;
> +        dev.write(C45::new(Mmd::PCS, 0x0029), 0x0003)?;
> +        // Configure transmit and recovered clock.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC30A), 0x06E1)?;
> +        // The 8051 will finish the reset state.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC300), 0x0002)?;

`MICRO_RESETN` again, this time to start the embedded micro.

> +        // The 8051 will start running from the boot ROM.
> +        dev.write(C45::new(Mmd::PCS, 0xE854), 0x00C0)?;
> +
> +        let fw =3D Firmware::request(c_str!("qt2025-2.0.3.3.fw"), dev.as=
_ref())?;
> +        if fw.data().len() > SZ_16K + SZ_8K {
> +            return Err(code::EFBIG);
> +        }
> +
> +        // The 24kB of program memory space is accessible by MDIO.
> +        // The first 16kB of memory is located in the address range 3.80=
00h - 3.BFFFh.
> +        // The next 8kB of memory is located at 4.8000h - 4.9FFFh.
> +        let mut dst_offset =3D 0;
> +        let mut dst_mmd =3D Mmd::PCS;
> +        for (src_idx, val) in fw.data().iter().enumerate() {
> +            if src_idx =3D=3D SZ_16K {
> +                // Start writing to the next register with no offset
> +                dst_offset =3D 0;
> +                dst_mmd =3D Mmd::PHYXS;
> +            }
> +
> +            dev.write(C45::new(dst_mmd, 0x8000 + dst_offset), (*val).int=
o())?;
> +
> +            dst_offset +=3D 1;
> +        }
> +        // The Intel 8051 will start running from SRAM.
> +        dev.write(C45::new(Mmd::PCS, 0xE854), 0x0040)?;


At this point the vendor driver looks like it does some verification:
it attempts to read 3.d7fd until it returns something other than 0x10
or 0, or times out. Could that be done here?

> +
> +        Ok(())
> +    }
> +
> +    fn read_status(dev: &mut phy::Device) -> Result<u16> {
> +        dev.genphy_read_status::<C45>()
> +    }
> +}
> --
> 2.34.1
>

Consistency nit: this file uses a mix of upper and lowercase hex
(mostly uppercase here) - we should probably be consistent. A quick
regex search looks like lowercase hex is about twice as common in the
kernel as uppercase so I think this may as well be updated.

---

Overall this looks pretty good to me, checking against both the
datasheet and the vendor driver we have. Mostly small suggestions
here, I'm happy to add a RB with my verification question addressed
and some rewording of the 0xd001 (phy revision) comment.

- Trevor
