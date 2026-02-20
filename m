Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E2334B185
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597227; cv=pass; b=odqbEcppPGv/d5oo90QL37ByQyKATKazYlkcuk35ImHzbIVJeYrsm+ly1s4QSUHlPgQM6ZDKawpjwcPcdP7Xztv0CXV3eBcjiiTXa9AC6nqr4zjQbAY3QBh7n7KRdcaqvnIffhbtfbwBwB913nxa86NDR6FKEB8jWqWi3/OJBj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597227; c=relaxed/simple;
	bh=KIkw6wOrB3pxEpTx7HPrzvtUWbp81LgxoxayixarPMg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=L/AElW8qHHv1ZKPNocaa/fwMN/AB6Bmmk8ST9nzg9HcjvBAVe75dL1bTNGS9spIVDj9v7QxJTB0DDqkMttGr9yVhA5sVNaN/s3U2BSoV0EUE/hpixk92nlLHUUAClvBn15mlfiFzG53cWNIRFycBEPcKkTd/lWuJhp9dRyF5WbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jINGEs4q; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jINGEs4q"
ARC-Seal: i=1; a=rsa-sha256; t=1771597217; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=V6luLmQipvdgc4RWe4Zap3Y/41+9OBFAPT8/NmchvTw/whxqbm3d6MelhT1aiC1xXBQxv5AE6Cd9ahILAdfELfcDLu7CcqHsjvZkxuRIZO7zuuornLxYvLNo1sDpwHVXxhPlcriuDAnCImqKk4NPSGWf6w9YbbdkjnnegfUvHJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771597217; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gARlf8uh2bRNsFm9PyXFC7uv+D+WAdHDAZ7jZ2i2ckA=; 
	b=MaGNtwy2LfdgVNddfcM4AgvPR+ypCgKEVXypG75cmca6gpHvv2ziplEmRKParZMylY+iZNmdNVdv92a2HLafGjYxiUEKRbQfsCubMDZAyDIfxYN1y594G0HB3ZgjCLvO+7YYR0YX8xOjOw9Vxh097eZYyBdMJiTYdjjQe1RgZTA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771597217;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=gARlf8uh2bRNsFm9PyXFC7uv+D+WAdHDAZ7jZ2i2ckA=;
	b=jINGEs4quuRPh7VtDcC9aJqI0ApS4bkqFCFWylClBa8WTeqJ/5HAjvhNVYPwzD8Q
	osJ/G1V8YO+PAwdsTbOkHZz2L/Hx0vXtnj2rBlSbjbQVDHISjY4XymVP7x52ZE/jHrK
	HYPojO3ZguCnujCmDMw0r5qee0SRjUQVgvQGPIUY=
Received: by mx.zohomail.com with SMTPS id 1771597216155633.3407690253604;
	Fri, 20 Feb 2026 06:20:16 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 04/12] drm/tyr: set DMA mask using GPU physical address
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-5-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 11:19:57 -0300
Cc: dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 boris.brezillon@collabora.com,
 beata.michalska@arm.com,
 lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F3F5819A-0F5F-4128-B3E3-5DD2BED4252C@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-5-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> From: Beata Michalska <beata.michalska@arm.com>
>=20
> Configure the device DMA mask during probe using the GPU's physical
> address capability reported in GpuInfo. This ensures DMA allocations
> use an appropriate address mask.
>=20
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/driver.rs | 11 +++++++++++
> drivers/gpu/drm/tyr/gpu.rs    |  1 -
> 2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index e5eae5a73371..2973a8b3cc09 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -11,6 +11,10 @@
>         Device, //
>     },
>     devres::Devres,
> +    dma::{
> +        Device as DmaDevice,
> +        DmaMask, //
> +    },
>     drm,
>     drm::{
>         driver::Registration,
> @@ -134,6 +138,13 @@ fn probe(
>         let gpu_info =3D GpuInfo::new(pdev.as_ref(), &iomem)?;
>         gpu_info.log(pdev);
>=20
> +        // SAFETY: No concurrent DMA allocations or mappings can be =
made because
> +        // the device is still being probed and therefore isn't being =
used by
> +        // other threads of execution.
> +        unsafe {
> +            =
pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)?;
> +        }
> +
>         let uninit_ddev =3D =
UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
>         let platform: ARef<platform::Device> =3D pdev.into();
>=20
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index affca5b0dc6c..b5f11bc96fa0 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -141,7 +141,6 @@ pub(crate) fn va_bits(&self) -> u32 {
>     }
>=20
>     /// Returns the number of physical address bits supported by the =
GPU.
> -    #[expect(dead_code)]
>     pub(crate) fn pa_bits(&self) -> u32 {
>         (self.mmu_features >> 8) & genmask_u32(0..=3D7)
>     }
> --=20
> 2.52.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
