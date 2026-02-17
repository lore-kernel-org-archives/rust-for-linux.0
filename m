Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E217993;
	Tue, 17 Feb 2026 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359635; cv=none; b=dbIyOLqnVUJyqUl7/qqEX7mwHANH4HMu0LlM+W2CJftDR8RWjEdlHErrnE8FWiYS4FtLDe0TZj4TXZ39SbquK+oEz3XT/AFAgxwxG9agivURT5hGG/4xBmGpEf/1RPQynohmO1c53Gm95eH507U8pSFe4AvO5Bygaag3FrQDM/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359635; c=relaxed/simple;
	bh=xi6JdHVOolR7yqRp5EcdMOWPCbF2v9DXAAcKW/ooPq8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=O6yAnrTigr9zgUDuN2K5iCJlKY7z1nECf/jcnAE46Jxh7XRufTc05MtxORVjxTgbQIuD1cQvW9Efw7yx8hxShyeCQz4s7aokdrLsJjM1jX0SbvCMfmGMh34uT9PMcO/YwWujyEujU5xl7MLaRKG4HQSrMzOZzAqmAhDOVyV3m6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lffsmcpu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lffsmcpu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32114C4CEF7;
	Tue, 17 Feb 2026 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771359635;
	bh=xi6JdHVOolR7yqRp5EcdMOWPCbF2v9DXAAcKW/ooPq8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=LffsmcpucD1bZXeKVhl+366VkOpJYuqcULdrFOxNV3m2UwjcZtRIkcMYKRD2tqPNm
	 h6oYvAAh2+MPt7iVnbLZGvTDwd663M685FaprjWHD0Nuq+YdI5AafV4w/ZejSSjKul
	 dAahMOjYbIqWgsQ5mgiTVhGICYc3LZN/0UfFj0fa0KNCiXZB+RbnmgU/gnP7xQcuyL
	 bpcwfJhLNYqzzHWiy2I+Y5NpIQ+USba79w2bdH2HP7KwAZLqA2NBr5bDz5vTblfi+i
	 bV/WiXa9CLRgPEqiOh22AvcNKg+WIDcSvwK185ot2tmWpxbhUEjaIyW7/8TPxSD9sD
	 OBdA8d7fBejCg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:20:29 +0100
Message-Id: <DGHIKZW0M7DB.2JVQUP5C27J3Z@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 29/33] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-30-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-30-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> +    /// Check if GSP lockdown has been released after FSP Chain of Trust
> +    fn gsp_lockdown_released(
> +        dev: &device::Device,
> +        gsp_falcon: &Falcon<Gsp>,
> +        bar: &Bar0,
> +        fmc_boot_params_addr: u64,
> +        mbox0: &mut u32,
> +    ) -> bool {
> +        // Read GSP falcon mailbox0
> +        *mbox0 =3D gsp_falcon.read_mailbox0(bar);
> +
> +        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked=
 down
> +        if *mbox0 !=3D 0 && (*mbox0 & 0xffffff00) =3D=3D 0xbadf4100 {
> +            return false;
> +        }

Hm...we could create a tiny type wrapper around this value, and do the chec=
k
with a method, such as Mbox::is_locked_down(&self).

> +        // Check 2: If mbox0 has a value, check if it's an error
> +        if *mbox0 !=3D 0 {
> +            let mbox1 =3D gsp_falcon.read_mailbox1(bar);
> +
> +            let combined_addr =3D (u64::from(mbox1) << 32) | u64::from(*=
mbox0);

This could also be part of the type.

> +            if combined_addr !=3D fmc_boot_params_addr {
> +                // Address doesn't match - GSP wrote an error code
> +                // Return TRUE (lockdown released) with error
> +                dev_dbg!(
> +                    dev,
> +                    "GSP lockdown error: mbox0=3D{:#x}, combined_addr=3D=
{:#x}, expected=3D{:#x}\n",
> +                    *mbox0,
> +                    combined_addr,
> +                    fmc_boot_params_addr
> +                );
> +                return true;
> +            }
> +        }
> +
> +        // Check 3: Verify HWCFG2 RISCV_BR_PRIV_LOCKDOWN bit is clear
> +        let hwcfg2 =3D regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &crate:=
:falcon::gsp::Gsp::ID);
> +        !hwcfg2.riscv_br_priv_lockdown()
> +    }
