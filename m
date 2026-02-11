Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493236A03F;
	Wed, 11 Feb 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807468; cv=none; b=HwFkBaE6bHmtcjv+3F+etyGpYjeu1W1kyL4vyTRzuJf9bvivPHKo+f9R7E64Q/l9wHE9zM/E3jFs2HLVSkvk+v/0fGq1sNTCiXikxArVODbqBfYb4jTBxUGh75s6Te/x/LVuS0dCM8IDhEgamzEDpaqKx1LwPxnuiEOWYlH6+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807468; c=relaxed/simple;
	bh=g0VhMpCjJVOxUuxV/Ef95Alaq/jqb1kCB0wJN9jxepY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PiwjKJzsjQyJbYSpLklaxmkE7HMnuL76J7Wxo3CXOrv97MXTZ3zQPcc7WYFONJvYY+m41sDPnFYv3bY26Aaa8Oz8ESUVs4TXTJtwYglJKH6DU4UIZXrUdkvAd8VhunWlct6Ob/sgVZc6sRRl9kFWyGSp0oLk4EBQ8F2/6W2KRmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZC8XIlm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZC8XIlm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B20C4CEF7;
	Wed, 11 Feb 2026 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770807467;
	bh=g0VhMpCjJVOxUuxV/Ef95Alaq/jqb1kCB0wJN9jxepY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sZC8XIlmxKD5BgqOgM9VwnZBzXaFFqjJQMHI7040VOT6otoReT3pewjACwbWKPqlH
	 AQjQfvnIcSkBpWxZTzJ3p1Fr9PBrAVH8Dg8uecKAMlhNbOXgzc11dI7SkzTsN07Ads
	 WfvfZ7vo5mDGGFQLFL2YymRbygGBGHTieM4zN6qhKroIp1jctVPgBuYf3+v7RBd2Xt
	 OnWrg7X9AXz6H+v2c2DUoHzWVqnp/HvbinwRM30yAS3mArj6qk4NMZzXFy7ydEyqaC
	 LkAaU+Zqo5kHYOvufdU6sw3kIdEy8va+aDnT5jbtLDUC86PIw1K6qitC3Q19R4W/JR
	 bpPvgDfKOdxgQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:57:42 +0100
Message-Id: <DGC2UTPTU2ZH.3Q5E9OW3ZRPLP@kernel.org>
Subject: Re: [PATCH v4 17/33] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
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
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-18-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-18-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> Add external memory (EMEM) read/write operations to the GPU's FSP falcon
> engine. These operations use Falcon PIO (Programmed I/O) to communicate
> with the FSP through indirect memory access.
>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/fsp.rs | 59 ++++++++++++++++++++++++++++-
>  drivers/gpu/nova-core/regs.rs       | 13 +++++++
>  2 files changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/=
falcon/fsp.rs
> index cc3fc3cf2f6a..fb1c8c89d2ff 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> @@ -5,13 +5,20 @@
>  //! The FSP falcon handles secure boot and Chain of Trust operations
>  //! on Hopper and Blackwell architectures, replacing SEC2's role.
> =20
> +use kernel::prelude::*;
> +
>  use crate::{
> +    driver::Bar0,
>      falcon::{
> +        Falcon,
>          FalconEngine,
>          PFalcon2Base,
>          PFalconBase, //
>      },
> -    regs::macros::RegisterBase,
> +    regs::{
> +        self,
> +        macros::RegisterBase, //
> +    },
>  };
> =20
>  /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
> @@ -29,3 +36,53 @@ impl RegisterBase<PFalcon2Base> for Fsp {
>  impl FalconEngine for Fsp {
>      const ID: Self =3D Fsp(());
>  }
> +
> +impl Falcon<Fsp> {
> +    /// Writes `data` to FSP external memory at byte `offset` using Falc=
on PIO.
> +    ///
> +    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
> +    #[expect(unused)]
> +    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]=
) -> Result {
> +        // TODO: replace with `is_multiple_of` once the MSRV is >=3D 1.8=
2.
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
> +            .set_wr_mode(true)
> +            .set_offset(offset)
> +            .write(bar, &Fsp::ID);
> +
> +        for chunk in data.chunks_exact(4) {
> +            let word =3D u32::from_le_bytes([chunk[0], chunk[1], chunk[2=
], chunk[3]]);
> +            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
> +                .set_data(word)
> +                .write(bar, &Fsp::ID);
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Reads FSP external memory at byte `offset` into `data` using Fal=
con PIO.
> +    ///
> +    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
> +    #[expect(unused)]
> +    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [=
u8]) -> Result {
> +        // TODO: replace with `is_multiple_of` once the MSRV is >=3D 1.8=
2.
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
> +            .set_rd_mode(true)
> +            .set_offset(offset)
> +            .write(bar, &Fsp::ID);
> +
> +        for chunk in data.chunks_exact_mut(4) {
> +            let word =3D regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, &F=
sp::ID).data();
> +            chunk.copy_from_slice(&word.to_le_bytes());
> +        }
> +
> +        Ok(())
> +    }
> +}

Technically, we could represent this as a separate I/O backend and use IoVi=
ew /
IoSlice (once we have it).

So, you could have Falcon<Fsp>::emem(), which returns an &Emem that impleme=
nts
Io [1].

This way we would get IoView and register!() for free on top of it. IoView =
will
allow you to modify fields of the FSP structures similar to what we have fo=
r DMA
with dma_read!() and dma_write!().

I just briefly glanced at the subsequent patches, but it looks like this co=
uld
save quite some code.

We may not get the full potential right away, as IoView is still WIP, but I
think it makes sense to consider it for a follow-up.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core=
.git/tree/rust/kernel/io.rs?h=3Ddriver-core-next#n303
