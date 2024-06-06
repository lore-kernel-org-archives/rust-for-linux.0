Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC714D2BE
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663947; cv=none; b=OAiVErWRuo6yWhjdBsbQaewT038muO5sYgXXY18Sy/ncuZJeutJnH8ke+h5US1IiAqcoK35ANFkSGHuYhH6ErFmcMrNUg2kxl+cLdt4T6IkTtO8blavn2SmNSJ8aRBVMRPJeInx3KFMi3c55GbHLgJZiYMiDAijLbHs4Xzt8nQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663947; c=relaxed/simple;
	bh=+YspFDH6otVImqzKUhM3pD64yLGNprTW/hzxmSEfZSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u53Dq+xyfK4Fj08MiPSAVqgX24eMh5Hpb52ZJJcIm8/wJqAvCyppUX9ORjTtAcu1ntGhjaWsCewWeNuyoY1zmSfiPM7fXdkI3z6XHMvLrwe5IubhiurKF/XMHqAFSz5qKMA8K6qUhHyMRs5ASWX16bZqPC/s2TOdwj7nrSOyHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=fX4RErXm; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="fX4RErXm"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfab2474152so772383276.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 01:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1717663943; x=1718268743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7gsszoZt8jemG4Ut4zqtdFYOy+EULbM9qWIOR/nGJ4=;
        b=fX4RErXmEDz95j+5UlZ228abeLUcXqwM7pe3Z30zQNf4IDPE+kXcDsax5ghbVmllk5
         2jB/vpJkDgd0qyjtV5lfKLWsOCWNzwGChsyu7XGWK8keZmzBTW40xDgSsWRKVRisaa6L
         hhPeeIMQxktTAkyTK0Hn9II2bj/807L48oQt8EATa4hrk0FvbjV88WOslFDxgXHRtfnV
         +8bE1P3nmMv0V6ER3PGQy3etKvrhaDJIXoX6Z+F640PHj1VNpjsjnXX3oI/ashO4Rk+P
         A4Jda6b+YysNE2EKTOraQoPv9wE5ZgPrI32tYZThj24l6ez8YBKyqBFfXlQ69pyOF5JS
         uiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663943; x=1718268743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7gsszoZt8jemG4Ut4zqtdFYOy+EULbM9qWIOR/nGJ4=;
        b=LBBvECgoQgfto/WJuKWKsyHhxRYvXjl6b6rNNd8RjHDlJjWyJNXDHBGFLPakdqTgfK
         llvEKzK5EUg2x/7iL8zZihSNf1tE73UClWeMRSUcdKDZVjbK00jkUq9g+DuN8NXdOONY
         YuMUESpXkqLh0A/1JuptVYM3tecis6xNWGvmn7EWIcnVMB8z4WlWR0n9SYuj99Tf50Kb
         wcUv/30FqhZXKf0TxxvkM+XnoP9uCgHIq+y2mXmHIveqEKaL+MZGtPB+FjevGAyf8Pa7
         EVfA1P4YzPOa0czibA6MkgMaNy6OnYvfFC8/EySDs5UZSoWc5foSW6GMbGyyWEHRNu9z
         6aNg==
X-Gm-Message-State: AOJu0YxHryx3OHv3mHP5j66JmPZCpRmHvaBjmu5W84iIeCaYNH1yY3sJ
	5xdY3/r2wIdZ081AylZ6zQI3SM0wUp9gSlWO0OkgKspd3rGdprvO1jDDWxaMcqPYkYAa6YxnNZD
	5wf29919UZGd6JimKsRFJvt1OfJ0djTZDjsBd6g==
X-Google-Smtp-Source: AGHT+IEtiT613w4WUuw5GrO+Uv9bym9jkKwFeSqfajGQxyBL5RDdMfoHbKhrn9Di0uGZ0BvFOaO9UZXI/nkXPd0R8ns=
X-Received: by 2002:a25:2f0e:0:b0:df7:93d4:61ef with SMTP id
 3f1490d57ef6-dfacac32c1amr5001075276.26.1717663943580; Thu, 06 Jun 2024
 01:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240602231749.57111-1-fujita.tomonori@gmail.com> <20240602231749.57111-3-fujita.tomonori@gmail.com>
In-Reply-To: <20240602231749.57111-3-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 6 Jun 2024 03:52:12 -0500
Message-ID: <CALNs47tOMsT2dxUGSqZzsOvmja_744ykc1SUj3EJH=YFLk+wRw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: net::phy unified genphy_read_status function
 for C22 and C45 registers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 6:18=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add unified genphy_read_status function for C22 and C45
> registers. Instead of having genphy_c22 and genphy_c45 methods, this
> unifies genphy_read_status functions for C22 and C45.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> [...]
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index 9b4c4d24b231..ff16d44c7bb0 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -249,16 +249,8 @@ pub fn genphy_suspend(&mut self) -> Result {
>      }
>
>      /// Checks the link status and updates current link state.

Can you add an example with the usage you showed at [1]?

[1]: https://lore.kernel.org/rust-for-linux/20240603.233954.164480315126803=
5787.fujita.tomonori@gmail.com/

> +    pub fn genphy_read_status<R: reg::Register>(&mut self) -> Result<u16=
> {
> +        R::read_status(self)
>      }
>
>      /// Updates the link status.
> diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
> index 53a83e69b200..7628eb09e902 100644
> --- a/rust/kernel/net/phy/reg.rs
> +++ b/rust/kernel/net/phy/reg.rs
> [...]
>  /// C22 registers.
> @@ -96,6 +99,18 @@ fn write(&self, dev: &mut Device, val: u16) -> Result =
{
>              bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.a=
ddr, self.0.into(), val)
>          })
>      }
> +
> +    fn read_status(dev: &mut Device) -> Result<u16> {
> [...]
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret as u16)
> +        }

to_result can do this check and conversion a bit more succinctly, up
to you if you would prefer to use it

    error::to_result(ret)?;
    Ok(ret as u16)

There are some instances in patch 1/2 as well if you choose to change it.

> +    }
>  }
>
>  /// MDIO manageable devices.
> @@ -171,4 +186,16 @@ fn write(&self, dev: &mut Device, val: u16) -> Resul=
t {
>              bindings::phy_write_mmd(phydev, self.devad.0.into(), self.re=
gnum.into(), val)
>          })
>      }
> +
> +    fn read_status(dev: &mut Device) -> Result<u16> {
> +        let phydev =3D dev.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Self`.
> +        // So it's just an FFI call.
> +        let ret =3D unsafe { bindings::genphy_c45_read_status(phydev) };
> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(ret as u16)
> +        }

Ditto the above

> +    }
>  }
> --
> 2.34.1
>

- Trevor
