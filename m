Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79AE11C92
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Apr 2024 03:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713237937; cv=none; b=Lq+3ZSkC+V/vIPSeGOMs0LOA5zMNQKwYaNpLoquGT1kLrupTfMzXceZRswepTZEWWSF8y+wVGYlGE2ybSpC0M5P+BPv22qPqGRSdr0moa43+kUJ2KigzMdlYtNK33YMxuAH2vgawCpdKtOxX+DEDjbeSZcuj2APftIjVGt4pV64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713237937; c=relaxed/simple;
	bh=5u4IqC43ipuEAkRDPZ3NfLs9iokoA9eSZLj0W4K46TI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hgfc4NaFE6Io434V5+ueQ0ljj6Trz5EzaBIE8vxvL7NX4zlk5zVykypu4g76ydCb6G2QmOYfyh5dkvHu9qi//7dHk2eY6ASuERw00BSkKYYu5GqS4mszyJzd7HylneLJBcoLH0BafY7N8WyurYax5/DZj86N93kgtv0V88MT4wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Mxb7aFqO; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Mxb7aFqO"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso3723946276.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 20:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1713237934; x=1713842734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkw2Yl+TD51SHy98hT0iftYNGABYn450n8OBsTQ7BwM=;
        b=Mxb7aFqO8AKszE+R90/4IPgzsqP441iXHA3l8QyanBTq5MNNo4b5lVWQvAGtHm1vaE
         M+yZpaDvPBHAg6yUY9IuyjJgVwqliW8yOg3zMybkXWx1Dw0tR9TpPisnpLmNt8YjDeI+
         bjQVv1PeJCWjCG55VOQ6yZO68uOUpu4b85l9Pi/ObKMmEMFlmJEs3eANOjIq+P19n6Wc
         VdKBYV8lGoEJdi4XQU80r/xGazX+MXDlwUdTq0Iu69OV4PVwvQ7yBugN+dPhOmhI/5pL
         hI5ZnYI8ls5sZyYWCqjf3qshoiPuyxFc8wTtPZ/Awp9258kjINc2qlASlk2nPm5bI01P
         Zrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713237934; x=1713842734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zkw2Yl+TD51SHy98hT0iftYNGABYn450n8OBsTQ7BwM=;
        b=J+ksscyN02/89u49Cg1Zda3DuRaYWSmrN6kSbTcCcpdpcJ56oyFkdLCCBO0zuKexrk
         0NJf+JwfN4dT0U4JSClEZHDysgQ5Twiqt1+3Im3c3sJzKeOec7XIYDOfavt9VfHERAc8
         wgksTAsUj8reJyZemV05onEhm6IRjb5rNEc0vEPKtnmO0HLDIAcPHuroYfmTM4Sq0eqX
         JwakvhlKv79ObgQVdaNEB7lmKjkMlPZtoK8OvzFb1hDxGeHbdxoFmm5x5a0yxSFEl2BX
         kaIXdRP52fFs7bPE04+fsvN6iNC40t81sPCGBntwEm2uSsgh0xVdgndggNfJ5LtV1fXf
         1ywQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDl+fq+bXtzeh3+D8s/n/awaze9QBUO0UAK5dsmhm5RKczx0EjaUuELYOE4GhdaMAP2WbsiUx1Sm5AYoIf5K6dMF94tHfmZC2Kiao+qFA=
X-Gm-Message-State: AOJu0Yx8Ne7QDNv4+xQAddQFxLwa2N9DkLmA8G9TvmCkcJsO7vsUYlSJ
	TL2G516ztggaMzehhSsn454O575qJJ6U5ZqFRIbQK5paYeVpgxesxEcyCqug1uNKwK2QerZq3n3
	NGtyUhkLFZ3LBtzUM8wmQRR5e6heI4TBkN8JpUw==
X-Google-Smtp-Source: AGHT+IFrJmLvi4vRnX1dZLLLS6KxyIa1VK1FW7aBEzzN9FjDmlgBrihG8RGfeBlVCkeDRH95ozQmE17XCXQJkP5TV6M=
X-Received: by 2002:a25:7455:0:b0:dcc:97e4:bc61 with SMTP id
 p82-20020a257455000000b00dcc97e4bc61mr11960479ybc.57.1713237933834; Mon, 15
 Apr 2024 20:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415104701.4772-1-fujita.tomonori@gmail.com> <20240415104701.4772-3-fujita.tomonori@gmail.com>
In-Reply-To: <20240415104701.4772-3-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 15 Apr 2024 23:25:22 -0400
Message-ID: <CALNs47t0FDS59xckUV0QkozbX-RAs8U3woN_sBc0TVm8d=dKNA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 2/4] rust: net::phy support C45 helpers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024 at 6:47=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> +    /// Reads a given C45 PHY register.
> +    /// This function reads a hardware register and updates the stats so=
 takes `&mut self`.
> +    pub fn c45_read(&mut self, devad: u8, regnum: u16) -> Result<u16> {
> +        let phydev =3D self.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Self`.
> +        // So it's just an FFI call.

Depending on the response to Andrew's notes, these SAFETY comments
will probably need to be updated to say why we know C45 is supported.

> +        let ret =3D unsafe {
> +            bindings::mdiobus_c45_read(
> +                (*phydev).mdio.bus,
> +                (*phydev).mdio.addr,
> +                devad as i32,

This could probably also be from/.into()

> +                regnum.into(),
> +            )
> +        };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret as u16)
> +        }

Could this be simplified with to_result?

> +    }
> +
> +    /// Writes a given C45 PHY register.
> +    pub fn c45_write(&mut self, devad: u8, regnum: u16, val: u16) -> Res=
ult {
> +        let phydev =3D self.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Self`.
> +        // So it's just an FFI call.
> +        to_result(unsafe {
> +            bindings::mdiobus_c45_write(
> +                (*phydev).mdio.bus,
> +                (*phydev).mdio.addr,
> +                devad as i32,

Same as above

> +                regnum.into(),
> +                val,
> +            )
> +        })
> +    }
> +
