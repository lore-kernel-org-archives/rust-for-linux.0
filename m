Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB9036D9EC
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533517; cv=none; b=l0+vnr/avlhOq2Z40yqK8kI8bp5l8xIrS6tCZpXIfFszuMRcwMCwQIdp4gELSiUK+rmwnlXA3ev5mdgKL5G+nDLkJp1V2Cu0LhKzkW23GvGChucJAJVi0N1eya7CSKPsewtBcClBDfgdERZntcQ7LLcDG597JoDWF7j0lqyVbd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533517; c=relaxed/simple;
	bh=lUm3Qv+Y+T2p0B2H2OuXplVZveLD9IckC1/rT/NDcOI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kNQIdSbcnFg1wF4HecKos1tFGFk3E+kszrsA1ti9L9axGyleSuDyflu1rs6Ibjjmb/ylALfy7nEkxgMC8KH8nnNjTvw5amFTwLhg5gkkG3agfiMaMcMd37u6IwTl+oMJXhCriTv06dnglC51Dt9f1zrMtF/TmRcrTZ2ZHNOnSD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MnQm5bf9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MnQm5bf9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772533508;
	bh=lUm3Qv+Y+T2p0B2H2OuXplVZveLD9IckC1/rT/NDcOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MnQm5bf9YUeMFv/ikj4ECGjJJUpnpHrjXwWNa5BA2cHIn3x2Tu/vZ/I1dKB6/rjyD
	 OhWZ6m58s+NRn7lXsMby4r4jUJ5s1D9zvL4EkGltFRnGoi9RFA1dBVGt2+bGiMwV4/
	 VU0MRbvrb4sV1YvYuRAydNHe845jsWoTQ2CjK1HSUA09ytOSwC3Filt19F/8m6CA71
	 IF/wiv60VSc/JpGCrljPQqRD1pKY9w4y+xgfj0744mkw8qyAYYKOr5HL3KCwP1VXlP
	 zPqmOoNDvL2QZ3htWHpV/Ms0I/VNuCvxe3et1No3QKsfbAA3GVVeRYN2Ub1pqPd83j
	 5+Cbbnr1rx7/Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BF4D17E005F;
	Tue,  3 Mar 2026 11:25:08 +0100 (CET)
Date: Tue, 3 Mar 2026 11:25:00 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com
Subject: Re: [PATCH] drm/tyr: Use DRM device type alias across driver
Message-ID: <20260303112500.1f47d56e@fedora>
In-Reply-To: <20260302202331.176140-1-deborah.brouwer@collabora.com>
References: <20260302202331.176140-1-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  2 Mar 2026 12:23:31 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Currently Tyr defines a convenience type alias for its DRM device type,
> `TyrDrmDevice` but it does not use the alias outside of `tyr/driver.rs`.
> 
> Replace `drm::Device<TyrDrmDriver>` with the alias `TyrDrmDevice` across
> the driver.
> 
> This change will ease future upstream Tyr development by reducing the
> diffs when multiple series are touching these files.
> 
> No functional changes are intended.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/file.rs | 7 +++++--
>  drivers/gpu/drm/tyr/gem.rs  | 7 +++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
> index 450be5ab9aaf..31411da203c5 100644
> --- a/drivers/gpu/drm/tyr/file.rs
> +++ b/drivers/gpu/drm/tyr/file.rs
> @@ -7,7 +7,10 @@
>      uapi, //
>  };
>  
> -use crate::driver::TyrDrmDriver;
> +use crate::driver::{
> +    TyrDrmDevice,
> +    TyrDrmDriver, //
> +};
>  
>  #[pin_data]
>  pub(crate) struct TyrDrmFileData {}
> @@ -25,7 +28,7 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
>  
>  impl TyrDrmFileData {
>      pub(crate) fn dev_query(
> -        ddev: &drm::Device<TyrDrmDriver>,
> +        ddev: &TyrDrmDevice,
>          devquery: &mut uapi::drm_panthor_dev_query,
>          _file: &TyrDrmFile,
>      ) -> Result<u32> {
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 514524ae07ef..5cd0cd9585e8 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -5,7 +5,10 @@
>      prelude::*, //
>  };
>  
> -use crate::driver::TyrDrmDriver;
> +use crate::driver::{
> +    TyrDrmDevice,
> +    TyrDrmDriver, //
> +};
>  
>  /// GEM Object inner driver data
>  #[pin_data]
> @@ -14,7 +17,7 @@ pub(crate) struct TyrObject {}
>  impl gem::DriverObject for TyrObject {
>      type Driver = TyrDrmDriver;
>  
> -    fn new(_dev: &kernel::drm::Device<TyrDrmDriver>, _size: usize) -> impl PinInit<Self, Error> {
> +    fn new(_dev: &TyrDrmDevice, _size: usize) -> impl PinInit<Self, Error> {
>          try_pin_init!(TyrObject {})
>      }
>  }
> 
> base-commit: 15da5bc9f3adab7242867db0251fe451ac3ddb72

