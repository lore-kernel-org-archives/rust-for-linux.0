Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0BF2D23B9
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 01:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240559; cv=pass; b=rKMBUDZC23dS5Gk3W/8U22yh2KIuUhOj172stp5gZvcNqwWFuJzNjxUupelpM97U3dxbpVI5fLkPtfyaDueQfSGP00lhJ78auSsFTLJuiRFVDiOA5OqRJ2O5zB8hqOFSdr43rCF3gxe6fkFky6IgKF8VUA249IAqRiOOazHh6QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240559; c=relaxed/simple;
	bh=EZJR0clUe0sPt6BVLOKzscMi4ujaljDS1o2tUjqLp9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T12g+u0Hv2X5M3tKJZv9hIC6VcpJ6EJ/D4o9DpYyWiVt1oRetSmYTJgO50WnlYcMUiPLFVpJM0f5z0WHIGGKm3hrO/SIr0cY1l7m+7XYnOkp/uJyDwx2skJdiw4yyJxGYFz5hlwqOJq+xWts/e+yjNND8In1I/RfShiTsAwvY/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=cJSwERid; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="cJSwERid"
ARC-Seal: i=1; a=rsa-sha256; t=1772240549; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IipEJmUGwY0aCabxq07pbN6CG3MBk6/szyjGX/48F93CbWsKSbcLwC6M/vrJlodCoPRTekw45ARma0IG48D5jCLcmCb/6jNP3ZcWPOUDKJd+k0QKfrRiHMx4yncjt3OVVToZBpPhO2UCj8Re/kOHttKCox7uNRN9wmWOlBGkcv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772240549; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NKcv8U7yv7haXw4cyreomqHFxGh7Vb4URM0L0PdLoPw=; 
	b=mXixYith2rbNV/pWD6VCnJLVOZJ9JTbyDkbt4qyNv6vg2qkPxiYcxVsJWpF9fwbKjzX0rFtW1tOGtxesEZOPbAfku2yO1bEe4CPoOMiJyJn6CkKOB/bGuNCPM1KPDRq9AuXhLC/NiO3zyuK6SWJifJLgMzFoRSyRtPpGOJ/IXEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772240549;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=NKcv8U7yv7haXw4cyreomqHFxGh7Vb4URM0L0PdLoPw=;
	b=cJSwERid3wHNHkbXYZO5MgHFBU2+CtjjN2bvhktyH/TShY8BaV37GB2V5EzsL3X9
	/Oug58w7BggbBRgzvDiChDurGiOoqU9lY6/YES2ZR5gZqvULc4Vany3PW6IMfPiWs/C
	ciTuTFWcHjFMPoNZ6RpFMJ2ozZuiiE48Ejk5dWeo=
Received: by mx.zohomail.com with SMTPS id 177224054890469.89106924609871;
	Fri, 27 Feb 2026 17:02:28 -0800 (PST)
Date: Fri, 27 Feb 2026 17:02:28 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, boris.brezillon@collabora.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 12/12] drm/tyr: add firmware loading and MCU boot support
Message-ID: <aaI-pKS_gaVpQVIk@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-13-deborah.brouwer@collabora.com>
 <aZmWDIITgaEGkTU0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZmWDIITgaEGkTU0@google.com>

On Sat, Feb 21, 2026 at 11:25:00AM +0000, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 05:37:13PM -0800, Deborah Brouwer wrote:
> > Add firmware loading and management for the Mali CSF GPU. This introduces
> > the fw module that loads the Mali GPU firmware binary, parses it into
> > sections, and maps those sections into the MCU VM at the required
> > virtual addresses.
> > 
> > On probe, the firmware is loaded, its sections are mapped and populated,
> > the MCU VM is activated, and the MCU is booted.
> > 
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> > +/// Loaded firmware with sections mapped into MCU VM.
> > +pub(crate) struct Firmware {
> > +    /// Platform device reference (needed to access the MCU JOB_IRQ registers).
> > +    pdev: ARef<platform::Device>,
> > +
> > +    /// Iomem need to access registers.
> > +    iomem: Arc<Devres<IoMem>>,
> > +
> > +    /// MCU VM.
> > +    vm: Arc<Vm>,
> > +
> > +    /// List of firmware sections.
> > +    #[expect(dead_code)]
> > +    sections: KVec<KBox<Section>>,
> 
> Why the box?

Hm I don’t actually remember why we originally needed KBox, but we don’t need the section
addresses to stay stable anymore so I’ll remove it.

> 
> > +            let section_start = parsed.data_range.start as usize;
> > +            let section_end = parsed.data_range.end as usize;
> > +            let mut data = KVec::new();
> > +            data.extend_from_slice(&fw.data()[section_start..section_end], GFP_KERNEL)?;
> 
> Could this access be out of bounds?

Yes, that could go out of bounds. I’ll add a defensive bounds check and return
EINVAL if the range is invalid.

> 
> Alice
