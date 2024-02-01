Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF265F46B
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706817737; cv=none; b=gjExtwjZzKfS74OZiOVhPoBG7bfXM1Gb6g1F//sUPXWgmf774tWwA/mjHPvmoBQ8TT/5AwI4YBcCi9t8FSeVzW+j+VCM89sEpGo99DqWRed9sUDuh9lYH37dKXhot86eR7mqK0d0KE9ee19P9JEbYtKJHAvPe9/vGpTaVOtpiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706817737; c=relaxed/simple;
	bh=tvy6mSud+tO0FW2Ix++bq0Yqn3nq8l29ZBq1/shnleU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGP/c448mGEKWEFHWic+5CgcRU85d9ChvXYU/uEvkNrsVoD9c7UJNk8htK7Nbdu1LjQKL+hNYc6PSASv+5s0sSmRdDc7nOnRZMbKZOs2iWFpekB/rT4ucvLY4n0oyB/1RqEyINgs+SRjuLFphdRtQupxtTHRPYE+ZQoRdr544as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=SdhvkOni; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="SdhvkOni"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bbbc6e51d0so876921b6e.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Feb 2024 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706817734; x=1707422534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKtKU9ec/rsz7HBSzIU5uqFOSZbUdu+2rlARf46Czpw=;
        b=SdhvkOnie1LRW6jS1+B8/uSuT6goBwPJ5Ysv4a0WhSxROFWET7z6lXc6zDSsNw3lfT
         l4pUCQ13wLkl+D0Rkxcb7xsaI3ncktvMANX2AqlxF6jM/6uRS31Wvn62Pw/u0AXPEU3C
         lUD20nZY+iDBO5RWhY3sLWc1PkOtFQMIaBHGO6wuzhuZL8XK3WwNEvRzKLJPXv4eVnYN
         CH+7SkmGsNySP4rt8hM3f8M14PaRW78PVEpA/s+kEawiyY8uD7kznYhDlQ5IwBSpWWI2
         Uxkac9x/ZCcnpWh3ZwwJyfMhYqJ/Xsmv8hYUFMqecMSIheVkdkBpPUSt1YT8bM2p1NY/
         L6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706817734; x=1707422534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKtKU9ec/rsz7HBSzIU5uqFOSZbUdu+2rlARf46Czpw=;
        b=pl5mSM41HmvsUTmIqlT+pg+eDclTB2LO9e9KUjLv5XNQSBLx5ER0cCJqAoFniX/7HF
         J4W9tLiTVt8ASVHvPGy5qkYU1YE9/5vEluhtXFHJ7UUm1B0GL1qY4hEaJ6ygEMY4B8E6
         1K1KC6/juSKIQOw7K9z4/cC8s+qwr2MwTRhI7FdtmbNtMwfcBvWFfcyKqC60DXo6XKkH
         I5LJ7m73Wf3RaYy5nZsbfBW9wsJBDYZfiEE4+ZMdybA5FyS5mcjgBu6Ha4Sy3WXj+1Jr
         ZagA10z0ljSplENby4/Ddw+FWBKnXp5CUAlvVm1mGjwkbid6FRr8N8A8qy/HPMHSuF/m
         Axgw==
X-Gm-Message-State: AOJu0YxXyKwN4pNBApyrO6gax6blLAqexw+I3LcUaty2pOTIgZvVSc83
	7uZCBh2ieiaPDbG6FCcUP8OXclYcrH3yP/tYmrC6oz/ButYOhLY/AMERUIVCEjL9uP14ORXkbgG
	bzjofizbo+jFiPr91E/u6WRtKZOxQ8By2HBUh7g==
X-Google-Smtp-Source: AGHT+IGkopw9KI9BmtHxGeMn+uc0bvHsWIA3VKpCBS/bF9G1Oq6uAmfg6Qe9qX+sxvKiL3uBS6W453i2/9uWDYwy3Dw=
X-Received: by 2002:a05:6808:640e:b0:3be:aafd:cc6 with SMTP id
 fg14-20020a056808640e00b003beaafd0cc6mr3387394oib.17.1706817734567; Thu, 01
 Feb 2024 12:02:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201-rockchip-rust-phy_depend-v2-0-c5fa4faab924@christina-quast.de>
 <20240201-rockchip-rust-phy_depend-v2-2-c5fa4faab924@christina-quast.de>
In-Reply-To: <20240201-rockchip-rust-phy_depend-v2-2-c5fa4faab924@christina-quast.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 1 Feb 2024 14:02:03 -0600
Message-ID: <CALNs47tWNNi2GXHAwwT=A1LP=xWwXvrPy4xVapqMQOeyeN0+9Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: phy: add some phy_driver and genphy_ functions
To: Christina Quast <contact@christina-quast.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 12:07=E2=80=AFPM Christina Quast
<contact@christina-quast.de> wrote:
> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> index e457b3c7cb2f..373a4d358e9f 100644
> --- a/rust/kernel/net/phy.rs
> +++ b/rust/kernel/net/phy.rs
> @@ -95,6 +95,22 @@ pub fn phy_id(&self) -> u32 {
>          unsafe { (*phydev).phy_id }
>      }
>
> +    /// Gets the current crossover of the PHY.
> +    pub fn mdix(&self) -> u8 {

Are possible values for mdix always ETH_TP_MDI{,_INVALID,_X,_AUTO}? If
so, this would be better as an enum.

> +        let phydev =3D self.0.get();
> +        // SAFETY: The struct invariant ensures that we may access
> +        // this field without additional synchronization.
> +        unsafe { (*phydev).mdix }
> +    }

> +
>      /// Gets the state of PHY state machine states.
>      pub fn state(&self) -> DeviceState {
>          let phydev =3D self.0.get();
> @@ -300,6 +316,15 @@ pub fn genphy_read_abilities(&mut self) -> Result {
>          // So it's just an FFI call.
>          to_result(unsafe { bindings::genphy_read_abilities(phydev) })
>      }
> +
> +    /// Writes BMCR
> +    pub fn genphy_config_aneg(&mut self) -> Result {

The docs need an update here

> +        let phydev =3D self.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type in=
variant of `Self`.
> +        // So it's just an FFI call.
> +        // second param =3D false =3D> autoneg not requested
> +        to_result(unsafe { bindings::__genphy_config_aneg(phydev, false)=
 })

I assume you did this since the non-dunder `genphy_config_aneg` is
inline. I think that is ok since the implementation is so minimal, but
you could also add a binding helper and call that (rust/helpers.c).

> +    }
>  }
>
>  /// Defines certain other features this PHY supports (like interrupts).
> @@ -583,6 +608,12 @@ fn soft_reset(_dev: &mut Device) -> Result {
>          Err(code::ENOTSUPP)
>      }
>
> +    /// Called to initialize the PHY,
> +    /// including after a reset

Docs wrapping

> +    fn config_init(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }

These have been changed to raise a build error rather than ENOTSUPP in
recent , see [1]. That patch is in net-next so you should see it next
time you rebase.

Also - these functions are meant for the vtable and don't do anything
if they are not wired up. See the create_phy_driver function, you will
need to add the field.

>      /// Probes the hardware to determine what abilities it has.
>      fn get_features(_dev: &mut Device) -> Result {
>          Err(code::ENOTSUPP)
>
> --
> 2.43.0
>

[1]: https://lore.kernel.org/rust-for-linux/20240125014502.3527275-2-fujita=
.tomonori@gmail.com/
