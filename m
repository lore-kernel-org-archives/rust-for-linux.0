Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078287;
	b=2cKqVvwkZPjVolWO3tJItNbOY222k7FYJf88zYGb2JyDIPe2u3EAFpDx3WENDsLWeSFI
	 Yqe+4Nk1gL50T7aFmGa19h8sM9QlzeyY2VrfnhSo78rcyPGDnCtKJdafH+FcokHlZbTXs
	 FCgxtDA9RqD84UdCM5R51KsZ8mEySHSkD6fqG1W5guOSUNQaukksFLKcIvSogriTnAc61
	 B+1ePPKdMd2t5F5zKL79mtOCRtT8Xg8tCQk+9KXLwpN3Azbx3jcbZ19/59EZEsQ3aGXh3
	 dCfn9/w29e5Nvxko5HgjfP0ZXLks1QBUvrgbIQb6f4NV2i45hGEI7Uk+JjvzGdUOaQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078287;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=BM035ONKEcYf+bEJ12HRI0V9AAvPkICsD+8xOHbMwPc=;
	b=Cc/MDO4PyHNEa1zuhgRy/KODuTGJpAnF2DkQuteS3/pTBu9sO3n3SrQCiLnWsRK8jZIP
	 H62zG4+21Wnn1An1GLsgO5uZXvREtQ88DYK21uHE0lG1rQrEtlB0G1oNi0bklC1sQkBHr
	 nBMAyjKWKeVQa7KNmYjcDXbNlBRDRvOtF47LF6eGhkC48yErEPWg5/7aBypU5+y280y+7
	 IauX7jC7ZUAeneHbTc90b9vPMUQdBhAv1Ltqq9QK7BYQOOWZIVmUq6RUlVDNBsCctw0G0
	 FTux0RP3MA9enPko9ma/dz+TxA5BJlCxI/wU5FLBYbPLTHUb62XfjbFEyEM2Xl47pvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fYpq2ei1;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95DF606A325;
	Thu, 19 Nov 2026 08:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C95DF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fYpq2ei1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795078285;
	bh=a07pApNrtARcdPXB05UrOdCPM/Guy+QmVvE6TdzbRMQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fYpq2ei1hRLyj0v6LoRHCY3pAFz80RSjYR+UzA8VykW7QXIArBEgvQy508ltx6msi
	 AlQtW14ws2YUSYGE7TNkXDizGgZjnsUgfVixM0Tc5TXN+yW9kOSsaHRkzchb82QUwe
	 gdZriPyHJPmAvU3RIMnuvnQ6GtOnLr7LkLme0GzhzAlxzIkFvoJcJm1XdW4WuEJCb/
	 /3kjmopDmylaruGmCFjeldddTXN6YssSaQfe85ETmXw+46fC5MyR+GE8UVYdIOxWna
	 JmcH2FiYFqTJcn3psaFHIKzrK4RHZgs449B+hbqcejb8wb96vws59C9JeqLhHMiya0
	 +iyqxAhmTl3Zw==
Received: from fedora1.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1CF617E0ACE;
	Thu, 19 Nov 2026 09:51:24 +0100 (CET)
Date: Thu, 19 Nov 2026 09:51:20 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Lukas
 Zapolskas <lukas.zapolskas@arm.com>, Paul Toadere <paul.toadere@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Christian Gmeiner <cgmeiner@igalia.com>
Subject: Re: [PATCH v2 3/3] drm/panthor: Bump the driver version to 1.10
Message-ID: <20261119095120.1e3fc816@fedora1.home>
In-Reply-To: <20261104-panthor-fault-info-v2-v2-3-673b31f3840c@igalia.com>
References: <20261104-panthor-fault-info-v2-v2-0-673b31f3840c@igalia.com>
	<20261104-panthor-fault-info-v2-v2-3-673b31f3840c@igalia.com>
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

On Wed, 04 Nov 2026 08:52:41 +0100
Christian Gmeiner <christian.gmeiner@gmail.com> wrote:

> From: Christian Gmeiner <cgmeiner@igalia.com>
> 
> VM_GET_STATE now reports the last VM fault and GROUP_GET_STATE reports
> the fatal error of each queue. Bump the driver version so userspace
> can detect this.
> 
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index fb5fdf848dec..139654628ec4 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1803,6 +1803,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   * - 1.8 - extends DEV_QUERY_TIMESTAMP_INFO with flags
>   * - 1.9 - adds DRM_PANTHOR_DEV_QUERY_MMU_INFO query
>   *       - adds DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE flag
> + * - 1.10 - extends VM_GET_STATE with the last unhandled VM fault
> + *        - extends GROUP_GET_STATE with the fatal error of each queue
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1816,7 +1818,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 9,
> +	.minor = 10,
>  
>  	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
>  	.gem_prime_import = panthor_gem_prime_import,
> 

