Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE5158520
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724099471; cv=none; b=PdE8+RBEbBAe4Rb3+qS/DMZ0ssKT3fkEGYnXFwlXPjP5P/v2erRbqsCb9AITU9NMNF2B3+gMmnKUbhH8vG4LU5j6H39ezH3SHsjhSiv7hM9NQNUAQFzkxeVWNK9Vr1GiK2Rm4MPY0XSFNhP+TEbs1KILI1zn8QN1qExuTSkEj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724099471; c=relaxed/simple;
	bh=LGUR6vzUkmDBAqAFWVXbNqrUUQPwcIJleNGZnBqXbgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9zAdqQ6mPeqTMIedb2SHSt6oRorfDrCN1GuChSgt8Zi2/Bnpw+hPyyCh12cs4LwxyUGi+2NwVsESjLDG41DPCNWBSZYWWK7OA5UWc+Kzn0XLFV069AayDvrvYhMUePMC8MbBomfUzyNBNtnoLN68w5ZpFW/OMgr5oQx+4V+gVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=PZLZLS8m; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="PZLZLS8m"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e115eb44752so5038762276.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Aug 2024 13:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724099468; x=1724704268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOU51Lhi6bFd3l9ZItaMcNEOT0YsKr+WTU2M//k8RbQ=;
        b=PZLZLS8mFUmHoeH3Piv9bfeAWRnob2v11K6QZenMyXyQwG9K4RmV7CyK9FLUq+IDoa
         Jg9IPmfNipEpJcaE7qjEaVdQTV+yaSkJlediob2p3PHUflZIbBierc9iWQDQ+hBhAavq
         MoAyGNigejgMflMTMFoTDoyGAjs2aEKHNDkhKzooUAOZnYPgngvKHHb1CoIZj0auVcch
         uZ2ixZU5QEZgs74zmQgMBMM7PPw7H9FP2WqrLOJgfpViUE3pGg6gE/dccqbf/3OIYIgL
         goN4GL0+9v7TO0x6FOIUw2L0twFz8wEh9BHmm+YJRfAkIlzBC+pkYnwzogs+8m7tVzQw
         pr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724099468; x=1724704268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOU51Lhi6bFd3l9ZItaMcNEOT0YsKr+WTU2M//k8RbQ=;
        b=pF6scXcQHPiHP/ZNhsJ6vrS+K4L6X2CwmkxNp7u/BAPeMPH6KUa54QMNCqs4zfreKx
         AhM0dz/6JJMsrCqDxQcyJSVEsCMOKyqbTrBGL1F/7emKWgwinayAthXe4aTvbUfho4g/
         pGejSjVukjKBqlCXsyhZho4wX6lujDhaOzUaGm7JM9PpWIp4C6IJESvAvZUpDdp7dTSg
         eOu/LNYVfldQaXawoiUmRBOlfRQJgSCm3cNtK5RDNdX7MoOEGSQU+QtEzGta+SP5m/dw
         kq/zUQO5joJSPWrCNzc47LTou0MA5VtkXiK3RGTnzyLoZ7HqrhRnzXlwXf0d2bET+Joi
         v1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWuQyI1L2Vr63gvYqkeQykq6bGDFrqcP/8hjgDZg7yKKJtU95VOAhrTnOCrPOO5QErvIbavTz7BTfMLst5X6aB/KkEINyul8m17vArre9c=
X-Gm-Message-State: AOJu0YzWTnwI/yZXWRww0Gvlo1Q/HloXib3hArNUdyxrIaw/Ezycu1Ei
	XK1IxT/PlX0Hz/U7/i18YxnhznRCSbA05z2tQYvTyMOYqp0RCeFTaqZGrFDeHltbKD84AHU+F5p
	vJSS4vZcZdzWu+BiiwxGF2nQDNWUJew2pnIp2LA==
X-Google-Smtp-Source: AGHT+IEKF81WI5vVZcJVOfycoTfh4pBOdTOP3MvRJQMixOhRYJlwg01F9HtXkxGjrTyJi1++ejO+a9EkIsqwx7oV44s=
X-Received: by 2002:a05:690c:690f:b0:6b1:2825:a3cf with SMTP id
 00721157ae682-6b1ba5f78dcmr146615897b3.10.1724099468431; Mon, 19 Aug 2024
 13:31:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819005345.84255-1-fujita.tomonori@gmail.com>
 <20240819005345.84255-7-fujita.tomonori@gmail.com> <CALNs47siFZQDE8_N2FyLhCMfszrcX7f5Q=rj8c9dzO9Q=hQsmQ@mail.gmail.com>
 <20240819.121936.1897793847560374944.fujita.tomonori@gmail.com>
In-Reply-To: <20240819.121936.1897793847560374944.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 19 Aug 2024 15:30:57 -0500
Message-ID: <CALNs47u8=J14twTLGos6MM6fZWSiR5GVVyooLt7mxUyX4XhHcQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 6/6] net: phy: add Applied Micro QT2025 PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 7:20=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Mon, 19 Aug 2024 04:07:30 -0500
> Trevor Gross <tmgross@umich.edu> wrote:
> > [...]
> > In the module doc comment, could you add a note about where the vendor
> > driver came from? I am not sure how to find it.
>
> For example, it's available at Edimax site:
>
> https://www.edimax.com/edimax/download/download/data/edimax/global/downlo=
ad/smb_network_adapters_pci_card/en-9320sfp_plus
>
> I could add it to the module comment but not sure if the URL will be
> available for for long-term use. How about uploading the code to github
> and adding the link?

Great, thanks for the link. I don't even know that you need to include
it directly, maybe something like

    //!
    //! This driver is based on the vendor driver `qt2025_phy.c` This sourc=
e
    //! and firmware can be downloaded on the EN-9320SFP+ support site.

so anyone reading in the future knows what to look for without relying
on a link. But I don't know what the policy is here.

> >> +        dev.write(C45::new(Mmd::PCS, 0x0026), 0x0E00)?;
> >> +        dev.write(C45::new(Mmd::PCS, 0x0027), 0x0893)?;
> >> +        dev.write(C45::new(Mmd::PCS, 0x0028), 0xA528)?;
> >> +        dev.write(C45::new(Mmd::PCS, 0x0029), 0x0003)?;
> >
> > The above four writes should probably get a comment based on the
> > discussion at [1].
>
> // The following for writes use standardized registers (3.38 through
> // 3.41 5/10/25GBASE-R PCS test pattern seed B) for something else.
> // We don't know what.
>
> Looks good?

Seems reasonable to me, thanks.

> >> +        // Configure transmit and recovered clock.
> >> +        dev.write(C45::new(Mmd::PMAPMD, 0xC30A), 0x06E1)?;
> >> +        // The 8051 will finish the reset state.
> >> +        dev.write(C45::new(Mmd::PMAPMD, 0xC300), 0x0002)?;
> >> +        // The 8051 will start running from the boot ROM.
> >> +        dev.write(C45::new(Mmd::PCS, 0xE854), 0x00C0)?;
> >> +
> >> +        let fw =3D Firmware::request(c_str!("qt2025-2.0.3.3.fw"), dev=
.as_ref())?;
> >
> > I don't know if this works, but can you put `qt2025-2.0.3.3.fw` in a
> > const to use both here and in the `module_phy_driver!` macro?
>
> It doesn't work. Variables can't be used in the `module_phy_driver!`
> macro.

Ah, that is unfortunate. Maybe we should try to fix that if the
firmware name isn't actually needed at compile time (not here of
course).

> > E.g.:
> >
> >     // The 24kB of program memory space is accessible by MDIO.
> >     // The first 16kB of memory is located in the address range
> > 3.8000h - 3.BFFFh (PCS).
> >     // The next 8kB of memory is located at 4.8000h - 4.9FFFh (PHYXS).
> >     let mut dst_offset =3D 0;
> >     let mut dst_mmd =3D Mmd::PCS;
> >     for (src_idx, val) in fw.data().iter().enumerate() {
> >         if src_idx =3D=3D SZ_16K {
> >             // Start writing to the next register with no offset
> >             dst_offset =3D 0;
> >             dst_mmd =3D Mmd::PHYXS;
> >         }
> >
> >         dev.write(C45::new(dst_mmd, 0x8000 + dst_offset), (*val).into()=
)?;
> >
> >         dst_offset +=3D 1;
> >     }
>
> Surely, more readable. I'll update the code (I need to add
> #[derive(Copy, Clone)] to reg::Mmd with this change).

Didn't think about that, but sounds reasonable. `C22` and `C45` as
well probably, maybe `Debug` would come in handy in the future too.

> > Alternatively you could split the iterator with
> > `.by_ref().take(SZ_16K)`, but that may not be more readable.
> >
> >> +        // The 8051 will start running from SRAM.
> >> +        dev.write(C45::new(Mmd::PCS, 0xE854), 0x0040)?;
> >> +
> >> +        Ok(())
> >> +    }
> >> +
> >> +    fn read_status(dev: &mut phy::Device) -> Result<u16> {
> >> +        dev.genphy_read_status::<C45>()
> >> +    }
> >> +}
> >
> > Overall this looks pretty reasonable to me, I just don't know what to
> > reference for the initialization sequence.
>
> You can find the initialization sequence of the vendor driver at:
>
> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/QT2025=
_phy.c
>
> Thanks a lot!

Thanks! I'll try to cross check against that code later.

- Trevor
