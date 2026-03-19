Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7183C5DAD;
	Thu, 19 Mar 2026 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773917264; cv=none; b=YZQWiZJxpoUfhdvWuyCbUbQogpZzmnmXXQZ0zRQroStn40LkGp08P77ZCiPFTeSONeMkQhjWBkN3Lcn5ghJUkAfVMgVrUA9PmI+lCJxSmMCOuMNEzbLTRL7JZwZqmni4BhxUQLJNtE7b81vPYrIoI9tetXjZHS/e+oM5X52exE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773917264; c=relaxed/simple;
	bh=Q2V+J6EwuA5u40zekUlt1HFuApT5hDOouTQDHv3fRCo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YoRt1glyWmwSTuarI8YPuEubZEnU2rvwxcoKndahuvKi5sdilPWdb6dGqzRHNoQWEatH2BjKo75sHRPz0VYaBpDotJYTv/X1YMVTz5dQPu+GzGYhywd+Y33nXqJfxmhvrgeL7rI3OGm+vWKytiMteEMWHcjy12tSYOfbDnvecbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A3nIf4FY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A3nIf4FY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773917261;
	bh=Q2V+J6EwuA5u40zekUlt1HFuApT5hDOouTQDHv3fRCo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A3nIf4FYzYbvHsinBL7MZ+eBFmllnso8oTkkFcCbSc0y8b2chhJUtJUwqklJFwdM6
	 PLS0KzFmZhdFSxvLbNhicm7G6lL910/lyq7Ta/hrSyXF++qoiJpviE+j2RKvFlHFpO
	 kx2Fe4FDxUBDMvBJvT2C/SEwwtQCvHHKEI8cl1UWssYsRMnNNgXBMJd/V8Z61tVh0X
	 2OuFfT1aOw+H1+ayogpjfgWWY6WV+kkyDy/eHooYd8LtwHXnAYDrPfHtbNg64c53UD
	 p8EE6lCyDP0ycLDvDad60Dud4MnA1vm6AVrX8Iu3XuZqBWcTCzZ2xpM3dc3u0lE1FB
	 e/VapRIlh6sJA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EC0717E0610;
	Thu, 19 Mar 2026 11:47:40 +0100 (CET)
Date: Thu, 19 Mar 2026 11:47:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, dakr@kernel.org, aliceryhl@google.com,
 daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Deborah
 Brouwer <deborah.brouwer@collabora.com>
Subject: Re: [PATCH v1 RESEND 1/4] drm/tyr: clear reset IRQ before soft
 reset
Message-ID: <20260319114736.64c3b4fa@fedora>
In-Reply-To: <20260313091646.16938-2-work@onurozkan.dev>
References: <20260313091646.16938-1-work@onurozkan.dev>
	<20260313091646.16938-2-work@onurozkan.dev>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Mar 2026 12:16:41 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> Clear RESET_COMPLETED before writing GPU_CMD_SOFT_RESET.
>=20
> This is also used in
> drivers/gpu/drm/panfrost/panfrost_gpu.c::panfrost_gpu_soft_reset
> and avoids seeing old reset-complete status from a previous reset.
>=20
> Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/driver.rs | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 69eff2a9e116..f7951804e4e0 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -91,6 +91,8 @@ unsafe impl Send for TyrDrmDeviceData {}
>  unsafe impl Sync for TyrDrmDeviceData {}
> =20
>  fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Resul=
t {
> +    // Clear any stale reset-complete IRQ state before issuing a new sof=
t reset.
> +    regs::GPU_IRQ_CLEAR.write(dev, iomem, regs::GPU_IRQ_RAWSTAT_RESET_CO=
MPLETED)?;
>      regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
> =20
>      poll::read_poll_timeout(

