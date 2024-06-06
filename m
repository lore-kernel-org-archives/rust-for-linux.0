Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A0F13C69A
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717663293; cv=none; b=A+5CC+4sQOQKcKYTl016OWpaBKKGL2fymRheYVarvhCxWk8FjZSHHADZG3ac4qkDrtY69rU/0ZiO0IV4IosOPBJ532d+VKdTHSHASCHM+dNbvRlR5eLygrJmo+W70IIRcKkZBosv36OP/gWnRdTDNi3/269E1GSxTo80TEgFjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717663293; c=relaxed/simple;
	bh=WXRLtfmoOVnSjab62gHX99x/+kwtOls5tf1moDQZLZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYsB+fsVAPEnAP0QbdF7c5z/Zhteeeynsw8onJGBHRO9MH1/et549LBFOxnX2YChvKAdh056aQZ0O9joghpa/6Uvr2dahCPxmZhKwdj9Hxo4WY7W7yJIbsl/elIqFZPtKmMydWYhO7/fS2539BX78XqRIjlRKSFEub8nMAfcJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=AaLh8Lkj; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="AaLh8Lkj"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-627dfbcf42aso6649547b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1717663290; x=1718268090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCzZRwKkS8p9gbIaq95v0OflfLCCqz9lwxqPGUMPhCc=;
        b=AaLh8Lkj9CsOQbDDBtgxf3SfCbRbnHq+qTo01F8EhGU8kWD8KLzU68J+uihyOPMUTi
         ZQcr773dqIUjrXUl/0LOhX4+5QiP5I1K3hALzT++3ubPAiLjQIJeAgVQV8n0ujaJ60HH
         5EQO0+rI/b428FN+i2JIFZO7PirOVv++20SdyyaQCo/5Owmi+V7K36N42cx852omWF3m
         oiLcB0dJM1tjwHzEm6p9L/wviqF3GzQGRRwGe9SfYTseyCsK6nS99iSrGr8BmU1Qo0fB
         uXjg7bcbfKG7aB/wSU1a+omoQl9cT6OfcFZwTpGqKoI4zfK9aKS3IBoPesbGBgxR3Oug
         ljMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663290; x=1718268090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCzZRwKkS8p9gbIaq95v0OflfLCCqz9lwxqPGUMPhCc=;
        b=pUygENvlH27EwksYiNorSk7GNlcc82FsFV0sJ81K3zsmhqDT74bUE4g2MxHeY+Qu4V
         45hxhpDGC/90wgeUT2bbYUKqvGp46xHkVzgpfPvkcI6C1gGCX0GaZjyZo+jdji9dxVAy
         Ug+H0E6hHdaW1ZI5no0Szc7FzNYuKXRTOkVGYxz+1Lr5d7NYgu3AZ4Bcj8Fl/dTePLrm
         t64lmcgX4OCJE7TeiST51QBvyxrBytRFaTYO/whUsydkgD3rkl+ss7n7MYrz+Mmyo4eW
         6R9Q+m6ExaSkD4A94by45czsav0rW33ZGSpWnfF39Pu8FGcPmnrWJY3jgkDqYkhW4yzm
         vCpg==
X-Gm-Message-State: AOJu0Yw4XiEeuD0rTenRiRIWPxGpBplhumFaXfTImkkgw8jNA421voBs
	5QOOHYDXXWlTkkdCyEdqRvPJSMKFde7YOlONFThQThVWcobpzuvhfL01X0FEX+pNp7OJgmH0o43
	qU0E4NLaIJdYUHOYrR/uFWA/Jrt5jCfUX8ZTWjPx7Z76WijmHTx8=
X-Google-Smtp-Source: AGHT+IEo3G8EiIDIVIAxMYDpnfSXlVa0/tagHOSq5uVla5vhB/P0VInxraOh1jQ4G3kHRg6L7iH1mT8o8rq+uYD2SNo=
X-Received: by 2002:a81:a14b:0:b0:615:1691:14e6 with SMTP id
 00721157ae682-62cbb592699mr51615187b3.41.1717663289667; Thu, 06 Jun 2024
 01:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240602231749.57111-1-fujita.tomonori@gmail.com> <20240602231749.57111-2-fujita.tomonori@gmail.com>
In-Reply-To: <20240602231749.57111-2-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 6 Jun 2024 03:41:18 -0500
Message-ID: <CALNs47sQeXZExxQK-vdx0zh6-aC376KYLbLcS6_e2rsFe_piZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: net::phy unified read/write API for C22 and
 C45 registers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 6:18=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add the unified read/write API for C22 and C45 register. The

s/register/registers

> abstractions support access to only C22 registers now. Instead of
> adding read/write_c45 methods specifically for C45, a new reg module
> supports the unified API to access C22 and C45 registers with trait,
> by calling an appropriate phylib functions.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Sorry for the delays in reviews, this looks pretty good to me so far.
I like the cleanup of moving register logic to its own module.

> diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
> new file mode 100644
> index 000000000000..53a83e69b200
> --- /dev/null
> +++ b/rust/kernel/net/phy/reg.rs
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 FUJITA Tomonori <fujita.tomonori@gmail.com>
> +
> +//! PHY registers.
> +//!
> +//! This module provides an interface for PHY registers defined in IEEE =
802.3
> +//! Clause 22 and 45.

Docs suggestion:

    PHY register interfaces.

    This module provides support for accessing PHY registers via Ethernet
    management interface clause 22 and 45, as defined in IEEE 802.3.

> +use super::Device;
> +use crate::build_assert;
> +use crate::error::*;
> +use crate::uapi;
> +
> +/// Accesses PHY registers.
> +///
> +/// This trait is used to implement the unified interface to access
> +/// C22 and C45 PHY registers.
> +pub trait Register {

Since we don't use this anywhere could it be sealed?

This might not even need to be public since it should probably only be
used as a method on `Device` (i.e. `my_device.read(C22::BMCR)` rather
than importing the trait and using `C22::BCMR::read(my_device)`).

> +    /// Reads a PHY register.
> +    fn read(&self, dev: &mut Device) -> Result<u16>;
> +
> +    /// Writes a PHY register.
> +    fn write(&self, dev: &mut Device, val: u16) -> Result;
> +}
> +

> +/// C22 registers.
> +pub struct C22(u8);

Docs suggestion:

    A single MDIO clause 22 register address (5 bits).

> +/// MDIO manageable devices.
> +pub struct Mmd(u8);

> +/// C45 registers.

Docs suggestion

    A single MDIO clause 45 register device and address.

    Clause 45 uses a 5-bit device address to access a specific MMD within a
    port, then a 16-bit register address to access a location within
that device.
    `C45` represents this by storing a [`Mmd`] and a register number.

> +pub struct C45 {
> +    devad: Mmd,
> +    regnum: u16,
> +}

- Trevor
