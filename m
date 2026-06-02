Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784D32E6B8
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 01:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780362751; cv=pass; b=XvuJxy2BwG2PgQsayZXnaW2PcBU88Rg03Msaa/fASN/5vbFsSUpaSec8HgXzghmiYX3DIKwJNop0L9Tm2v0y+twDzkY+kpi45lihpuvfmU4C1R7Htv7RmwO62VdljVxiCfKJv1+o94M0WoC1S9a8Pahz+FtUZIaxOD1FtCZsAZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780362751; c=relaxed/simple;
	bh=RFG1ga/50BUkVwkMPznqK68vpNAVGDXKx3tkgtMIyR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guxY7NGJ+jrugeuIuNp11L8vHi51gLAqKVoLoslZCpInn8hy97wal4rV5CI1S6oRfrDMd1TDWrh7CCe1QITNt80wto3k3etwXklGQh3gFAVH6UgF0G9PC9kRgrPPIwyvvDXMWJRWp372DXVebVkIzArUYwf+KqubJsZH/8Rc3HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=G2VrHdYu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="G2VrHdYu"
ARC-Seal: i=1; a=rsa-sha256; t=1780362739; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YNVotoy/11mP7yWuIqYPWhD7yVW+IAMztNOS0tyBaK/0CPpblTaJR+R4Hla+yetVTgxygMgvuZdEInFPwVJcfNE4g/Hne5gPjaMCiiT1TcS2IjPmvYbc0UFJGYMYF3mh9KaDpGGZYvTSmYla8UJqsAMjn4H7jHo/BdfksgesIoM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780362739; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=herxlzjkdjjg1P2+eKLyivOcEeIKlLQO1FQFEJDKKD8=; 
	b=FPY1e2nml5UkA9fO3JQIFEIr3CwhthDAsBpcrLF6zc5s5uxgL4w7PdFL6PIolOiB101S3BdhpdhKjO8WdCvWSQEm9F/w4bUOe+J07u/EsAXLJ180gdUBiFUqcNCVnnTja3//sZPrWikTjx5JsBr4+8FZB8UBxkU5+A4Mtfe9hTE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780362739;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=herxlzjkdjjg1P2+eKLyivOcEeIKlLQO1FQFEJDKKD8=;
	b=G2VrHdYuDto7jD+2fdwse5VGoG/1YSo+fUShpPWMq8Zc3mxj6l/7c/RJ7BLrd/W1
	pKMWD/jWsz5i0KIXif6fTtbZmV76/b+2w+SUmuTT+sGg2TW7j3jFq0Dan83oylAor/+
	gtiNdL3nFjfwRr5pFE3sUY3pqYkNGsXP3EmYBndg=
Received: by mx.zohomail.com with SMTPS id 1780362737418258.7491888496602;
	Mon, 1 Jun 2026 18:12:17 -0700 (PDT)
Date: Mon, 1 Jun 2026 18:12:16 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, daniel.almeida@collabora.com,
	boris.brezillon@collabora.com, gary@garyguo.net,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	Eliot Courtney <ecourtney@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 2/2] drm/tyr: use IoMem directly instead of Devres
Message-ID: <ah4t8IPo1L6XZMy_@um790>
References: <20260529000106.2257996-1-dakr@kernel.org>
 <20260529000106.2257996-3-dakr@kernel.org>
 <ah1SSN8_dCEA4Osz@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah1SSN8_dCEA4Osz@google.com>

On Mon, Jun 01, 2026 at 09:35:04AM +0000, Alice Ryhl wrote:
> On Fri, May 29, 2026 at 02:00:54AM +0200, Danilo Krummrich wrote:
> > Now that IoMem is lifetime-parameterized, use it directly in probe
> > rather than wrapping it in Devres and Arc. The I/O memory mapping is
> > only used during probe and not stored in driver data, so device-managed
> > revocation is unnecessary.
> > 
> > This removes the Devres access(dev) pattern from issue_soft_reset(),
> > GpuInfo::new(), and l2_power_on(), simplifying register access.
> > 
> > Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> > -pub(crate) type IoMem = kernel::io::mem::IoMem<'static, SZ_2M>;
> > +pub(crate) type IoMem<'a> = kernel::io::mem::IoMem<'a, SZ_2M>;
> 
> It'd make more sense for me to put 'b or 'bound here.
> 
> >          let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
> >  
> >          let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
> > -        let iomem = Arc::new(request.iomap_sized::<SZ_2M>()?.into_devres()?, GFP_KERNEL)?;
> > +        let iomem = request.iomap_sized::<SZ_2M>()?;
> >  
> >          issue_soft_reset(pdev.as_ref(), &iomem)?;
> >          gpu::l2_power_on(pdev.as_ref(), &iomem)?;
> >  
> > -        let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
> > +        let gpu_info = GpuInfo::new(&iomem);
> 
> 
> While this change is fine, I notice that we don't actually keep the
> iomem alive past the probe method. I assume we're going to need that,
> which leads to the question of whether we can store the iomem in the
> places we need it.
> 
> As far as I can tell, we can store it in TyrPlatformDriverData but not
> in TyrDrmDeviceData, is that right?

I'm still getting my head around how this applies to tyr's firmware
series, but yes we stop storing iomem in TyrDrmDeviceData, but we won't
store it in TyrPlatformDriverData.
Instead there is a new struct "RegistrationData" that will store the iomem
like this:

#[vtable]
impl drm::Driver for TyrDrmDriver {
    type Data = TyrDrmDeviceData;
    type RegistrationData = TyrDrmRegistrationData<'static>;

And then in probe something like:

 let reg_data = try_pin_init!(TyrDrmRegistrationData {
  pdev: platform.clone(),
  fw: firmware,
  clks <- new_mutex!(Clocks {
    core: core_clk,
    stacks: stacks_clk,
    coregroup: coregroup_clk,
  }),
  regulators <- new_mutex!(Regulators {
    _mali: mali_regulator,
    _sram: sram_regulator,
  }),
  iomem,
  gpu_info,
 });

 drm::driver::Registration::new_foreign_owned(ddev, pdev.as_ref(), reg_data, 0)?;


> 
> I guess it does make sense because the io memory goes away if the
> underlying platform device (the bus) goes away, even if the drm device
> still exists due to open fds from userspace.
> 
> Alice
