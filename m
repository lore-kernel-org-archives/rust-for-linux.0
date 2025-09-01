Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC733F6
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Sep 2025 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722652; cv=none; b=NHJnURw1MwvAoVl3B2BsfyCJtqEJMmSV/1a7sr25x18GQlPDU1yGRK0D16tfqmz6y96p5wP22JHYoXR9QOATHp3H6d35FV2FKaM3RTzLeDdC3OYly8GSDkJjXjPMxpgRNHs4kKmuKJu6XnyeUy7cFPAJn3Yw0rJNMfNtJgDgngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722652; c=relaxed/simple;
	bh=x9uQAJsHR48QDetfBJh1DPdUFvskIloDcyj/F28xWjw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=sp05GvulwP0+4WFs945fcS2VtPTkbx12w6yEx8xZlAQx5IErrx3Y+RQH/UlHr0B8Bu/oQ22S8dCj/wYZl9S8VJzNsm98/FUq8ZhfeAorsEDUFABpuIVesri6bSRt3BTBHlFk7lhmtMfJw+WGhn2a9Nr2QA1qdW/qnPPf46mM0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doVDytrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doVDytrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FBEC4CEF0;
	Mon,  1 Sep 2025 10:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756722651;
	bh=x9uQAJsHR48QDetfBJh1DPdUFvskIloDcyj/F28xWjw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=doVDytrMHr7VZfEM2qN4zo9g08Zu6AVlQp18LtkdaIQTy5tiR1hsWRsKUAoJjx8oU
	 ASdt6BsD8P3itL4C49TesyValewvHdzXkI0dZVO5XHndGj6ZLd1wdDVJhNdSxOnGrT
	 GBh/sHHNo+tb5+tyfg1UaX5ptolu0LTvifn6abQ5Ev3DDo25YeMyjf3d0nRquPhT74
	 Tp+tHhmh7ogSrGzmxQAb/YHwYWxcw0ZYtuKQNta4GorOMVTmAGV5Jc7e9uKXak0arg
	 1qTKlvNWODylKTZyqVj6rr4AJ7MGPPsWi9otIbpi7wBBun6HaWpH0dYDuT/43i3uVy
	 ZMGqeKL3Vlv7A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 12:30:48 +0200
Message-Id: <DCHE7FOG5ONY.9SVQATXHGM9M@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: depend on CONFIG_64BIT
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>
To: <acourbot@nvidia.com>
References: <20250828223954.351348-1-dakr@kernel.org>
In-Reply-To: <20250828223954.351348-1-dakr@kernel.org>

On Fri Aug 29, 2025 at 12:39 AM CEST, Danilo Krummrich wrote:
> If built on architectures with CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy nova-core
> produces that following build failures:
>
>     error[E0308]: mismatched types
>       --> drivers/gpu/nova-core/fb.rs:49:59
>        |
>     49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.d=
ma_handle())?;
>        |                              -----------------------      ^^^^^^=
^^^^^^^^^^^ expected `u64`, found `u32`
>        |                              |
>        |                              arguments to this method are incorr=
ect
>        |
>     note: method defined here
>       --> drivers/gpu/nova-core/fb/hal.rs:19:8
>        |
>     19 |     fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> =
Result;
>        |        ^^^^^^^^^^^^^^^^^^^^^^^
>     help: you can convert a `u32` to a `u64`
>        |
>     49 |         hal::fb_hal(chipset).write_sysmem_flush_page(bar, page.d=
ma_handle().into())?;
>        |                                                                 =
           +++++++
>
>     error[E0308]: mismatched types
>       --> drivers/gpu/nova-core/fb.rs:65:47
>        |
>     65 |         if hal.read_sysmem_flush_page(bar) =3D=3D self.page.dma_=
handle() {
>        |            -------------------------------    ^^^^^^^^^^^^^^^^^^=
^^^^ expected `u64`, found `u32`
>        |            |
>        |            expected because this is `u64`
>        |
>     help: you can convert a `u32` to a `u64`
>        |
>     65 |         if hal.read_sysmem_flush_page(bar) =3D=3D self.page.dma_=
handle().into() {
>        |                                                                 =
    +++++++
>
>     error: this arithmetic operation will overflow
>        --> drivers/gpu/nova-core/falcon.rs:469:23
>         |
>     469 |             .set_base((dma_start >> 40) as u16)
>         |                       ^^^^^^^^^^^^^^^^^ attempt to shift right =
by `40_i32`, which would overflow
>         |
>         =3D note: `#[deny(arithmetic_overflow)]` on by default
>
> This is due to the code making assumptions on the width of dma_addr_t to
> be 64 bit.
>
> While this could technically be handled, it is rather painful to deal
> with, as the following example illustrates:
>
> 	pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> DmaAddress {
> 	    let addr =3D u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar=
).adr_39_08())
> 	        << FLUSH_SYSMEM_ADDR_SHIFT
> 	        | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).ad=
r_63_40())
> 	            << FLUSH_SYSMEM_ADDR_SHIFT_HI;
>
> 	    addr.try_into().unwrap_or_else(|_| {
> 	        kernel::warn_on!(true);
>
> 	        0
> 	    })
> 	}
>
> At the same time there's not much value for nova-core to support 32-bit,
> given that the supported GPU architectures are Turing and later, hence
> depend on CONFIG_64BIT.
>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/lkml/20250828160247.37492-1-ojeda@kernel.=
org/
> Fixes: 6554ad65b589 ("gpu: nova-core: register sysmem flush page")
> Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions and=
 base code")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-fixes, thanks!
