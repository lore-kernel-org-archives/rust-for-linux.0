Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075287;
	b=wTBP9SgUD/dC5HBWcrcuZGUG/RoG2jSJB8mqPGh4roiOq95MX9RYTG+/N8MsOkbo1YCk
	 QOpPVZKghMp23m6wCZe9jQOgsv7rMMVmBk0UbLWF6Mzojsi0vxR0b5w4AwE2B60ldLqhJ
	 q542AH9BzwAd3oKNQppQXWHOSQMejv2yzKoOq8T267b7MHJqqkInvnwfSpHxrq9+8M/xB
	 3XfZVfkrZi0vfMZhCn/kKio6JLo5YM8qJ9te8TRPud5AZJc6a0Hq0LBlgLDFT0MWZhS5o
	 iBMeCbKme60o7xdv1bNIdXmvhSuB392LpK35ogG4uuCaSujW8rkIvVZ/tYug59def9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075287;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=lNTp7ympH2muPnoEkwT4I0Qu1QUKBnJjZCegFvfAflw=;
	b=Tgl9aeBq0la5XufgRykwSf7z2Zkc1U2OchCYBncdwIFdFc2i73W3m8eu/qFHKVuOTTZ6
	 ihT6Z8jaz2awqqPWJsWhOqNBz0OP3tHvJEWixiVlw93p41hXqA/DMX+MXpUNdccShqtDC
	 UpRKDtjfFYa0MYantf80KyNlFSM4FnhZ3pz7RDRM3dWfV6onp24Ft/iYbPpyOhq1hIowj
	 +aEs1QBc15E6s76W6AG1d6iYRDe+5Y6wg4M6unahiCSMpQK92aVYuOSqNd4gv8o4e+EIQ
	 CxeO63X22JbS3cfgNbSPC+VEXEvdsbABkE4ae/ukPdm/2nj/VZJACNgIHMQi8RqXGFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pM7ZBE5f;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1171A606A320;
	Thu, 19 Nov 2026 08:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1171A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pM7ZBE5f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795075285;
	bh=U+zJDv2RH1krYjRA0gD1Ss0nOhlA9746Z2uVecxOVsc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pM7ZBE5ffwrhq2/AG2ifVuNp5cQFlQ82UTE21ANjX8vYbbwhwZPQn4EAxWsYkiyKR
	 FXTure8z69jKaQuWW0Av3kI9wtHK1ZIGc0GejSX8ZySjTs1w69ijFl5d7LGijtQ14V
	 My6B6CInQEfuMtycg37+27iQYBiw1nYz0ohyFSQApmJ4QXO4htmJ2zaZIk8sPyXZIX
	 S3n4kJKVnzAeSbiBnrXPUycV/rVBEljp4/mf5fgnQZYpuMJOTtMtKPwJGrkbbsewYk
	 UpJAuVlrMsznAt6jMubZKo4gQp72BJM3SPLV2MKDuueTC27vdUqRQfVLHI/5JfCBTP
	 T4KN9pTH4JZFA==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A51B617E047C;
	Thu, 19 Nov 2026 09:01:24 +0100 (CET)
Date: Thu, 19 Nov 2026 09:01:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Akash Goel <akash.goel@arm.com>, Lukas
 Zapolskas <lukas.zapolskas@arm.com>, Chris Diamand <chris.diamand@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 05/10] drm/panthor: Add 64-bit GPU_ID decoding for
 v15 GPUs
Message-ID: <20261119090118.7cfc417b@fedora1.home>
In-Reply-To: <20261118175332.519657-6-karunika.choo@arm.com>
References: <20261118175332.519657-1-karunika.choo@arm.com>
	<20261118175332.519657-6-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 17:53:21 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> Mali v15 exposes a 64-bit GPU_ID register with a different field layout
> from earlier GPUs.
> 
> Add the register definitions and decoding helpers for the new format,
> read GPU_ID_WIDE when the compatibility value indicates a v15 GPU, and
> populate both the cached GPU_ID fields and the uAPI gpu_id_wide field.
> 
> This allows userspace and the driver to identify v15 GPUs correctly.
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> v3:
> - Fix the missing blank line after declarations in GPU_ID decoding.
> v2:
> - Picked up R-b from Liviu.
> - Rename the register macro from GPU_WIDE_ID to GPU_ID_WIDE.
> - Rename the uAPI field from gpu_wide_id to gpu_id_wide.
> - Print the upper 32 bits of GPU_ID_WIDE as the logged 'id' for v15 and
>   later GPUs. Keep the existing output for earlier GPUs. Continuation
>   fix for previous sashiko comment.
> - Link: https://lore.kernel.org/all/20260922205659.3C4F21F000FF@smtp.kernel.org/
> v1:
> - Decode selected GPU_ID format after checking compatibility value.
> - Document GPU_DISCOVER and GPU_CONTROL register offset differences
>   between GPUs.
> - Fix mask generation in panthor_gpu_discover_regs.h
> 
>  .../drm/panthor/panthor_gpu_discover_regs.h   | 19 ++++++
>  drivers/gpu/drm/panthor/panthor_hw.c          | 63 ++++++++++++++-----
>  include/uapi/drm/panthor_drm.h                | 13 ++++
>  3 files changed, 81 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu_discover_regs.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu_discover_regs.h b/drivers/gpu/drm/panthor/panthor_gpu_discover_regs.h
> new file mode 100644
> index 0000000000000..6896c263f76b6
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_gpu_discover_regs.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2026 ARM Limited. All rights reserved. */
> +
> +#ifndef __PANTHOR_GPU_DISCOVER_REGS_H__
> +#define __PANTHOR_GPU_DISCOVER_REGS_H__
> +
> +#include <linux/bits.h>
> +
> +#define GPU_ID_WIDE					0x0
> +#define   GPU_WIDE_COMPAT				0xF
> +#define   GPU_WIDE_ARCH_MAJOR(x)			(((x) & GENMASK_U64(63, 56)) >> 56)
> +#define   GPU_WIDE_ARCH_MINOR(x)			(((x) & GENMASK_U64(55, 48)) >> 48)
> +#define   GPU_WIDE_ARCH_REV(x)				(((x) & GENMASK_U64(47, 40)) >> 40)
> +#define   GPU_WIDE_PROD_MAJOR(x)			(((x) & GENMASK_U64(39, 32)) >> 32)
> +#define   GPU_WIDE_VER_MAJOR(x)				(((x) & GENMASK_U64(23, 16)) >> 16)
> +#define   GPU_WIDE_VER_MINOR(x)				(((x) & GENMASK_U64(15, 8)) >> 8)
> +#define   GPU_WIDE_VER_STATUS(x)			((x) & GENMASK_U64(7, 0))
> +
> +#endif /* __PANTHOR_GPU_DISCOVER_REGS_H__ */
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index 854874a9f322a..a26fe42e14f78 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -3,11 +3,13 @@
> 
>  #include <linux/nvmem-consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/wordpart.h>
> 
>  #include <drm/drm_print.h>
> 
>  #include "panthor_device.h"
>  #include "panthor_gpu.h"
> +#include "panthor_gpu_discover_regs.h"
>  #include "panthor_gpu_regs.h"
>  #include "panthor_hw.h"
>  #include "panthor_pwr.h"
> @@ -238,21 +240,30 @@ static int panthor_gpu_info_init(struct panthor_device *ptdev)
> 
>  static int panthor_hw_info_init(struct panthor_device *ptdev)
>  {
> -	u32 major, minor, status;
> +	u32 prod_id, major, minor, status;
>  	int ret;
> 
>  	ret = panthor_gpu_info_init(ptdev);
>  	if (ret)
>  		return ret;
> 
> +	/*
> +	 * The logged 'id' contains four 4-bit architecture and product fields
> +	 * in pre-v15 GPUs. In v15+ GPUs, this is now four 8-bit fields.
> +	 * Preserve the pre-v15 format for compatibility. Tools decoding these
> +	 * fields must handle the wider format for v15+ GPUs.
> +	 */
> +	if (ptdev->gpu_id.arch_major < 15)
> +		prod_id = upper_16_bits(ptdev->gpu_info.gpu_id);
> +	else
> +		prod_id = upper_32_bits(ptdev->gpu_info.gpu_id_wide);
> +
>  	major = ptdev->gpu_id.ver_major;
>  	minor = ptdev->gpu_id.ver_minor;
>  	status = ptdev->gpu_id.ver_status;
> 
> -	drm_info(&ptdev->base,
> -		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> -		 get_gpu_model_name(ptdev), ptdev->gpu_info.gpu_id >> 16,
> -		 major, minor, status);
> +	drm_info(&ptdev->base, "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
> +		 get_gpu_model_name(ptdev), prod_id, major, minor, status);
> 
>  	drm_info(&ptdev->base,
>  		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
> @@ -296,18 +307,42 @@ static int panthor_hw_bind_device(struct panthor_device *ptdev)
>  static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
>  {
>  	struct panthor_gpu_id *gpu_id = &ptdev->gpu_id;
> -	ptdev->gpu_info.gpu_id = gpu_read(ptdev->iomem, GPU_ID);
> +	u32 gpu_id32 = gpu_read(ptdev->iomem, GPU_ID);
> 
> -	if (!ptdev->gpu_info.gpu_id)
> +	if (!gpu_id32)
>  		return -ENXIO;
> 
> -	gpu_id->arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
> -	gpu_id->arch_minor = GPU_ARCH_MINOR(ptdev->gpu_info.gpu_id);
> -	gpu_id->arch_rev = GPU_ARCH_REV(ptdev->gpu_info.gpu_id);
> -	gpu_id->prod_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
> -	gpu_id->ver_major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
> -	gpu_id->ver_minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
> -	gpu_id->ver_status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
> +	if (GPU_ARCH_MAJOR(gpu_id32) == GPU_WIDE_COMPAT) {
> +		/*
> +		 * GPU_DISCOVER register block always starts at offset zero,
> +		 * so does the GPU_CONTROL register block on pre-v15 GPUs.
> +		 */
> +		void __iomem *discover = ptdev->iomem;
> +		u64 gpu_id64 = gpu_read64(discover, GPU_ID_WIDE);
> +
> +		if (!gpu_id64)
> +			return -ENXIO;
> +
> +		ptdev->gpu_info.gpu_id_wide = gpu_id64;
> +
> +		gpu_id->arch_major = GPU_WIDE_ARCH_MAJOR(gpu_id64);
> +		gpu_id->arch_minor = GPU_WIDE_ARCH_MINOR(gpu_id64);
> +		gpu_id->arch_rev = GPU_WIDE_ARCH_REV(gpu_id64);
> +		gpu_id->prod_major = GPU_WIDE_PROD_MAJOR(gpu_id64);
> +		gpu_id->ver_major = GPU_WIDE_VER_MAJOR(gpu_id64);
> +		gpu_id->ver_minor = GPU_WIDE_VER_MINOR(gpu_id64);
> +		gpu_id->ver_status = GPU_WIDE_VER_STATUS(gpu_id64);
> +	} else {
> +		ptdev->gpu_info.gpu_id = gpu_id32;
> +
> +		gpu_id->arch_major = GPU_ARCH_MAJOR(gpu_id32);
> +		gpu_id->arch_minor = GPU_ARCH_MINOR(gpu_id32);
> +		gpu_id->arch_rev = GPU_ARCH_REV(gpu_id32);
> +		gpu_id->prod_major = GPU_PROD_MAJOR(gpu_id32);
> +		gpu_id->ver_major = GPU_VER_MAJOR(gpu_id32);
> +		gpu_id->ver_minor = GPU_VER_MINOR(gpu_id32);
> +		gpu_id->ver_status = GPU_VER_STATUS(gpu_id32);
> +	}
> 
>  	return 0;
>  }
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index a2ff0f4ec6915..09b7f7931e4f4 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -376,6 +376,19 @@ struct drm_panthor_gpu_info {
> 
>  	/** @gpu_features: Bitmask describing supported GPU-wide features */
>  	__u64 gpu_features;
> +
> +	/**
> +	 * @gpu_id_wide: 64-bit GPU ID for v15 and later GPUs. @gpu_id is 0 when
> +	 * this is populated.
> +	 */
> +	__u64 gpu_id_wide;
> +#define DRM_PANTHOR_WIDE_ARCH_MAJOR(x)		(((x) >> 56) & 0xff)
> +#define DRM_PANTHOR_WIDE_ARCH_MINOR(x)		(((x) >> 48) & 0xff)
> +#define DRM_PANTHOR_WIDE_ARCH_REV(x)		(((x) >> 40) & 0xff)
> +#define DRM_PANTHOR_WIDE_PRODUCT_MAJOR(x)	(((x) >> 32) & 0xff)
> +#define DRM_PANTHOR_WIDE_VERSION_MAJOR(x)	(((x) >> 16) & 0xff)
> +#define DRM_PANTHOR_WIDE_VERSION_MINOR(x)	(((x) >> 8) & 0xff)
> +#define DRM_PANTHOR_WIDE_VERSION_STATUS(x)	((x) & 0xff)
>  };
> 
>  /**
> --
> 2.43.0
> 

