Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447F33893D;
	Wed, 11 Feb 2026 10:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804578; cv=none; b=XpscE+b/99prBpZhSsL9dRDZTNYLouMqECWalqfI044EpyJI8rn9uGGrcDttL9KhudkaXAwuU5AgR2iVKJ8JHuR8szT6+AZy7DhSh5cGJklFv505SRBw0pBOTtk81Qzc4DOwO8l6c5VhHlhvVhERrvpWb4QNdpFiMBQdG0VhzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804578; c=relaxed/simple;
	bh=2yJOMJwE5inPXsHc0h7m9YI+MYkeBDhtxdnF0857w/0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=JSbXGvhWc5+O3pTFfnVrSDS3KfH8d948/CwNrgWuEGUOsk9QK0U1KSB1huF9SlqhZSzxGLa7qSRHXIySePuDy959jWoqdM8aDLpvcKvT0qO1UO83IG3F1iiW2uyeFM/JOtZwhmxriQ88TT0r8EvLL37SKCqH6Ztlc+v+E/K/CAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uM/31P3l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uM/31P3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3334C4CEF7;
	Wed, 11 Feb 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770804578;
	bh=2yJOMJwE5inPXsHc0h7m9YI+MYkeBDhtxdnF0857w/0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uM/31P3lxo9J/yDXLyViLzKLcLemaqmBgbsfuzlUMzId6n5WwzWxJxX8TZ2y9A83e
	 QNNCI8VYgqK2mm//d9+lroGncVKoOju6opLPcZDPgEov3vk07Rmfh2ZxHmp+INcmCT
	 ukK1lNBj4ewuD5LJi7oJQKriWSBXZxS+8uMcbXRpb6N9NGw8JkpVx5v18Db5LHVnoX
	 e6co55exzIvePw/NWBSMpRC09ht2WCMK4Obxjl3JgTDnRootIsMdQ2GnjzapeOb3/f
	 bpMUTmHXZO88NtRnbO0IlU5pW/d6duZ1jte733eKos0+2JtDxzXUds07RsgSZM432x
	 oEY3ED8ip55BQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:09:32 +0100
Message-Id: <DGC1TY0BINGC.3THSKW6E6OJLQ@kernel.org>
Subject: Re: [PATCH v4 09/33] gpu: nova-core: Hopper/Blackwell: skip GFW
 boot waiting
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
 <20260210024601.593248-10-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-10-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> Hopper and Blackwell GPUs use FSP-based secure boot and do not require
> waiting for GFW_BOOT completion. Skip this step for these architectures.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 24feb0e8723e..f04e2a795e90 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -304,10 +304,19 @@ pub(crate) fn new<'a>(
>          let chipset =3D spec.chipset();
> =20
>          try_pin_init!(Self {
> -            // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.
> +            // Turing, Ampere, Ada: we must wait for GFW_BOOT completion=
 before doing any
> +            // significant setup on the GPU.
> +            //
> +            // Hopper/Blackwell: skip GFW_BOOT completion waiting entire=
ly, and use the simpler FSP
> +            // Chain of Trust boot path (elsewhere) instead.
>              _: {
> -                gfw::wait_gfw_boot_completion(bar)
> -                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not co=
mplete\n"))?;
> +                if matches!(
> +                    chipset.arch(),
> +                    Architecture::Turing | Architecture::Ampere | Archit=
ecture::Ada

I assume Blackwell is not an exception and we expect this to be the case fo=
r
future architectures as well? I.e. checking for "!Architecture::Blackwell" =
makes
no sense?

> +                ) {
> +                    gfw::wait_gfw_boot_completion(bar)
> +                        .inspect_err(|_| dev_err!(pdev, "GFW boot did no=
t complete\n"))?;
> +                }
>              },
