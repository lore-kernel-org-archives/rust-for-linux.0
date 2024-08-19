Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A38115B964
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724058464; cv=none; b=Mt/Y/opYESmwOqpqRdL/dsrGM+nj7Q3jBqTrjdLvUHdV2/ZQkbAcpa96a/Vji4hyZpHIns5GmIMItHRLCUNB4zKOFerqzvCpBmicoiLG84CzMYr3ODgLX3uAxY4S4es7yNYbXMKr17JUnUb6BG2JowR9Hxq4IDjpVYVqYMs/y3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724058464; c=relaxed/simple;
	bh=0ksC3JMD9/LB03gW2/IHzb/51BObj81BzqD4gUWtbGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBU6JoZrhUdcno6wdNEx2lUKwBG/+okX9pH/nxa8+yzcaqCJ+THlakqFELPfg2cswP/+YQzte2Gz0hez3eTa5C/xjcleFNbLteLZcts41VfUoPCVK9Jweyse3oFv3qjOirbeyG6UfOgP0mcDt8oQgW6k7iuTgVlvQq69OrwhTlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=p5k/7rnY; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="p5k/7rnY"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6b47ff8a59aso15967387b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724058461; x=1724663261; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5pxH0Wv82KaWtSz09+l7PjD8n6brxLfJzKsxVLOzpA=;
        b=p5k/7rnYFnttZ0UsUkptcSEJIFkOK7tbYIR68mgtC0n4rYQqEPR8vKaJyD67psk96h
         F/G9kPdayTnu305efP4YzDsc3CbsCmGvhVkCzFuuEfq6FXMYNuCk87KKyxu+zXvomFVs
         4LHY8jtzbqNsGZO1SvnVossAyjfCK0lNGDF1Z/FE/1et6X8kfTIcLTTcJXLjLWozDxVP
         OrNc1zNGFLPMBnhlFfViLQm8J6fpnPjN+TxZHmLKUZU818+tEdaoaX7l6skiYS4Kjwvl
         RU5hXy9jNIi7b88djkdVciNaAQBJyGoXg2PULNX2oNNjW1a0rspqi4s1oxu4EFIaFqbk
         brDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058461; x=1724663261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5pxH0Wv82KaWtSz09+l7PjD8n6brxLfJzKsxVLOzpA=;
        b=BqMIsYP1ug9IxprDXg6buWecrQqivmmiBwaDJNUA3aV8HYBCy6V+oNPD0Z+6Qu9vaC
         jjHXozzpCvTLFxfRWqykLRgvSxebmrK1qR0fHlzOQQhtVyRThITcx7ZWIE7SI2p97hKa
         /73sQo93rG20nwoQOGx69quQV+QOXPzpfC6z/AXnALcl0vsypU967elGfKRCyOYCqLbL
         AOkA1AwDdRQ8lla1LohHHcdctph3onDb/I93GfEY3CdovgoF85kh5lTQCjlY+JOSAXxr
         6jRi/iCdM0n1ugMaABdt6lIpsSddrheFSEC4xaC7YEZUMK55gTqsLQ6lAsePku8BtgXR
         AoMA==
X-Forwarded-Encrypted: i=1; AJvYcCUXi2GS4EI2IZ1HI7Vih0uWCIwp8LryELjaww8u19kj9OgBiWBfHJEfZG8OTEdTd564n2/nmOkV0DEg+Y5sl3fOTqNqKSEMnj22Eiilz9s=
X-Gm-Message-State: AOJu0Ywfb2kug1nYnUv+QEESuRAIV3Flx6l9fa8CQby96WQdrZeYZMSD
	pu8n3tOmhyfvhxR649KQmBcrstGTpyGmjP0DuM2OJ/9wcGMJM1l4P89NZ7KmWMKgUyA1aatqdL6
	Fm78ccGFCgBIOajT1hVfi0EIvOpAbwgdPgfFU2w==
X-Google-Smtp-Source: AGHT+IFZoh/Vo8yOpmmELJS5Vw6qZn89KiNK25SiDb2hf1NrmGPIUA51jAwqStuSpVERFGP5l6Bdox0KJchgH23uiiY=
X-Received: by 2002:a05:690c:ec5:b0:6b0:52a6:6515 with SMTP id
 00721157ae682-6b1b9b5abbemr128653977b3.6.1724058461451; Mon, 19 Aug 2024
 02:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819005345.84255-1-fujita.tomonori@gmail.com> <20240819005345.84255-7-fujita.tomonori@gmail.com>
In-Reply-To: <20240819005345.84255-7-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 19 Aug 2024 04:07:30 -0500
Message-ID: <CALNs47siFZQDE8_N2FyLhCMfszrcX7f5Q=rj8c9dzO9Q=hQsmQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 6/6] net: phy: add Applied Micro QT2025 PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 8:01=E2=80=AFPM FUJITA Tomonori
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
>  MAINTAINERS               |  7 +++
>  drivers/net/phy/Kconfig   |  7 +++
>  drivers/net/phy/Makefile  |  1 +
>  drivers/net/phy/qt2025.rs | 90 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 105 insertions(+)
>  create mode 100644 drivers/net/phy/qt2025.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9dbfcf77acb2..d4464e59dfea 100644

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

In the module doc comment, could you add a note about where the vendor
driver came from? I am not sure how to find it.

> +        let hw_id =3D dev.read(C45::new(Mmd::PMAPMD, 0xd001))?;
> +        if (hw_id >> 8) & 0xff !=3D 0xb3 {
> +            return Err(code::ENODEV);
> +        }
> +
> +        // The 8051 will remain in the reset state.

What is the 8051 here?

> +        dev.write(C45::new(Mmd::PMAPMD, 0xC300), 0x0000)?;
> +        // Configure the 8051 clock frequency.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC302), 0x0004)?;
> +        // Non loopback mode.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC319), 0x0038)?;
> +        // Global control bit to select between LAN and WAN (WIS) mode.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC31A), 0x0098)?;
> +        dev.write(C45::new(Mmd::PCS, 0x0026), 0x0E00)?;
> +        dev.write(C45::new(Mmd::PCS, 0x0027), 0x0893)?;
> +        dev.write(C45::new(Mmd::PCS, 0x0028), 0xA528)?;
> +        dev.write(C45::new(Mmd::PCS, 0x0029), 0x0003)?;

The above four writes should probably get a comment based on the
discussion at [1].

> +        // Configure transmit and recovered clock.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC30A), 0x06E1)?;
> +        // The 8051 will finish the reset state.
> +        dev.write(C45::new(Mmd::PMAPMD, 0xC300), 0x0002)?;
> +        // The 8051 will start running from the boot ROM.
> +        dev.write(C45::new(Mmd::PCS, 0xE854), 0x00C0)?;
> +
> +        let fw =3D Firmware::request(c_str!("qt2025-2.0.3.3.fw"), dev.as=
_ref())?;

I don't know if this works, but can you put `qt2025-2.0.3.3.fw` in a
const to use both here and in the `module_phy_driver!` macro?

> +        if fw.data().len() > SZ_16K + SZ_8K {
> +            return Err(code::EFBIG);
> +        }
> +
> +        // The 24kB of program memory space is accessible by MDIO.
> +        // The first 16kB of memory is located in the address range 3.80=
00h - 3.BFFFh.
> +        // The next 8kB of memory is located at 4.8000h - 4.9FFFh.
> +        let mut j =3D SZ_32K;
> +        for (i, val) in fw.data().iter().enumerate() {
> +            if i =3D=3D SZ_16K {
> +                j =3D SZ_32K;
> +            }
> +
> +            let mmd =3D if i < SZ_16K { Mmd::PCS } else { Mmd::PHYXS };
> +            dev.write(C45::new(mmd, j as u16), (*val).into())?;
> +
> +            j +=3D 1;
> +        }

Possibly:

1. Hint the MMD name in the comments
2. Give i and j descriptive names (I used `src_idx` and `dst_offset`)
3. Set `mmd` once at the same time you reset the address offset
4. Tracking the offset from 0 rather than from SZ_32K seems more readable

E.g.:

    // The 24kB of program memory space is accessible by MDIO.
    // The first 16kB of memory is located in the address range
3.8000h - 3.BFFFh (PCS).
    // The next 8kB of memory is located at 4.8000h - 4.9FFFh (PHYXS).
    let mut dst_offset =3D 0;
    let mut dst_mmd =3D Mmd::PCS;
    for (src_idx, val) in fw.data().iter().enumerate() {
        if src_idx =3D=3D SZ_16K {
            // Start writing to the next register with no offset
            dst_offset =3D 0;
            dst_mmd =3D Mmd::PHYXS;
        }

        dev.write(C45::new(dst_mmd, 0x8000 + dst_offset), (*val).into())?;

        dst_offset +=3D 1;
    }

Alternatively you could split the iterator with
`.by_ref().take(SZ_16K)`, but that may not be more readable.

> +        // The 8051 will start running from SRAM.
> +        dev.write(C45::new(Mmd::PCS, 0xE854), 0x0040)?;
> +
> +        Ok(())
> +    }
> +
> +    fn read_status(dev: &mut phy::Device) -> Result<u16> {
> +        dev.genphy_read_status::<C45>()
> +    }
> +}

Overall this looks pretty reasonable to me, I just don't know what to
reference for the initialization sequence.

- Trevor

[1]: https://lore.kernel.org/netdev/0675cff9-5502-43e4-87ee-97d2e35d72da@lu=
nn.ch/
