Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B530B525
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764332551; cv=pass; b=b74iLQTvnWY0av9N3vLXt057snHuEjfSLTwRu4h9PTGPmUkbJSuXF0ceHDQOM9xxe3lUjEvdwGF3Z8eFbJIMs2Zb+os1BpkW7BOjoIYeVPOy6qkZBkET4d/TATNSW/eU+jUziBC+crjIGrmsKOooSqAnL45fSrAWMl9ZynvcmOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764332551; c=relaxed/simple;
	bh=DX6GEh/JUD+65eOf9CAasyhMaE+Aq0+gw8598X8ukxs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jLcrVZ06UfQa/+qWOtUmG2ySAETdRBRAE8/ZFcqpZNOXk2CYitD/9NrN1AAmuudkUm01WQdsNk6hHXt2P1htgRQLynBMUsWJ/MByFnBT3CSVAQP2dz6b6vlfAqXtRJg0w0sIG8/ChzfsBMvFWXRNw4aIgwx3nZe+NW9Qd4XD5Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jRFiEtJJ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jRFiEtJJ"
ARC-Seal: i=1; a=rsa-sha256; t=1764332545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cKf8Ax6b7KEhxl5MpSz7kPeHt9oXc4T1kZuFVcLhlRcWO68GofqxA9n83Z593wl+XlDxW7MysjI1zzF58EIZwII4nR7fm585zxUUqzVJLbxaFXYQmyvZYjIb1kYo1POiWolLNpTdHTi51SDjdJpdqENX9uAwEH25I83nItcPR9c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764332545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y1wPWGWjMAhsfe5I78tyLNt4/FOip3Ph27Hq05SN3eI=; 
	b=T2bxMbAzlPRtSomnVmBwGqdH7IpqOBJFgzky+KsHM9w8SnrQWmq4a0uEqPEvTdK69Bs3mFtpSIDwIi5xfRm+K6q7Mf5WfpfvGQ/71frELg8ZbTdJ6tFmgG7KrZOlfeATWqPzIFsW/es/O85QkbefZtvZwIJqegyPhOMD3FFhbj0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764332545;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=y1wPWGWjMAhsfe5I78tyLNt4/FOip3Ph27Hq05SN3eI=;
	b=jRFiEtJJflUY0rZ0d1xn17/h21uZv/ggKiKea4YbPwvUMXiIqkTa7kQuhbNsOFye
	HCtxqR4XBe7+TTJZ48fyKBdJYqINDK5ZktYbKIhKr91Kc+1WdRc1hpZL4EFTimkfgsW
	177f1Vw9ghg+5GZT8dTuHQ0FQwjUMLkDgEyeLO9w=
Received: by mx.zohomail.com with SMTPS id 1764332541789908.4987758550176;
	Fri, 28 Nov 2025 04:22:21 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: drm: tyr: use generated bindings for GpuInfo
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251127211843.46258-1-deborah.brouwer@collabora.com>
Date: Fri, 28 Nov 2025 09:22:10 -0300
Cc: dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 boris.brezillon@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <272125FB-176F-4262-B364-79A686532F52@collabora.com>
References: <20251127211843.46258-1-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 27 Nov 2025, at 18:18, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> Currently Tyr's struct GpuInfo is manually copied and updated from
> include/uapi/drm/panthor_drm.h. But an auto generated struct is =
available,
> so use that instead to avoid copy/paste errors and to stay up-to-date =
with
> the panthor uapi.
>=20
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/gpu.rs | 48 ++++++++++++++++++--------------------
> 1 file changed, 23 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 6c582910dd5d..3072562e36e5 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -1,5 +1,7 @@
> // SPDX-License-Identifier: GPL-2.0 or MIT
>=20
> +use core::ops::Deref;
> +use core::ops::DerefMut;
> use kernel::bits::genmask_u32;
> use kernel::device::Bound;
> use kernel::device::Device;
> @@ -8,6 +10,7 @@
> use kernel::prelude::*;
> use kernel::time;
> use kernel::transmute::AsBytes;
> +use kernel::uapi;
>=20
> use crate::driver::IoMem;
> use crate::regs;
> @@ -18,29 +21,9 @@
> /// # Invariants
> ///
> /// - The layout of this struct identical to the C `struct =
drm_panthor_gpu_info`.
> -#[repr(C)]
> -pub(crate) struct GpuInfo {
> -    pub(crate) gpu_id: u32,
> -    pub(crate) gpu_rev: u32,
> -    pub(crate) csf_id: u32,
> -    pub(crate) l2_features: u32,
> -    pub(crate) tiler_features: u32,
> -    pub(crate) mem_features: u32,
> -    pub(crate) mmu_features: u32,
> -    pub(crate) thread_features: u32,
> -    pub(crate) max_threads: u32,
> -    pub(crate) thread_max_workgroup_size: u32,
> -    pub(crate) thread_max_barrier_size: u32,
> -    pub(crate) coherency_features: u32,
> -    pub(crate) texture_features: [u32; 4],
> -    pub(crate) as_present: u32,
> -    pub(crate) pad0: u32,
> -    pub(crate) shader_present: u64,
> -    pub(crate) l2_present: u64,
> -    pub(crate) tiler_present: u64,
> -    pub(crate) core_features: u32,
> -    pub(crate) pad: u32,
> -}
> +#[repr(transparent)]
> +#[derive(Clone, Copy)]
> +pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
>=20
> impl GpuInfo {
>     pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> =
Result<Self> {
> @@ -73,7 +56,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: =
&Devres<IoMem>) -> Result<Self> {
>         let l2_present =3D u64::from(regs::GPU_L2_PRESENT_LO.read(dev, =
iomem)?);
>         let l2_present =3D l2_present | =
u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32;
>=20
> -        Ok(Self {
> +        Ok(Self(uapi::drm_panthor_gpu_info {
>             gpu_id,
>             gpu_rev,
>             csf_id,
> @@ -95,7 +78,8 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: =
&Devres<IoMem>) -> Result<Self> {
>             tiler_present,
>             core_features,
>             pad: 0,
> -        })
> +            gpu_features: 0,
> +        }))
>     }
>=20
>     pub(crate) fn log(&self, pdev: &platform::Device) {
> @@ -154,6 +138,20 @@ pub(crate) fn pa_bits(&self) -> u32 {
>     }
> }
>=20
> +impl Deref for GpuInfo {
> +    type Target =3D uapi::drm_panthor_gpu_info;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl DerefMut for GpuInfo {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        &mut self.0
> +    }
> +}
> +
> // SAFETY: `GpuInfo`'s invariant guarantees that it is the same type =
that is
> // already exposed to userspace by the C driver. This implies that it =
fulfills
> // the requirements for `AsBytes`.
> --=20
> 2.51.1
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
