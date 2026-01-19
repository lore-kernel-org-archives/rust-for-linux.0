Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6F2F0C7A
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 20:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768855011; cv=pass; b=jt3EsFBAeVHNuz2vRNSlXTcpyEHpPQzzzabjsa62vW4r616s/nD3WPanNhkzHXm0icQjbOhkCWnI3aDXFG6ZmygPq8QRc1WAkdsAM2peVD/uFrqSlJWCoUOb6RfYVkQDqmV02jCEzDmKPMNV3R03ZtvDGk7pu9WdiZAyeEMGvzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768855011; c=relaxed/simple;
	bh=wtSLkZZkUs6J5lz2qryDcKTenUTrNQz4CbHMHvdm+5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5kcduXaYiixBqRiz2vM8I+Dk0Glc4HxXfAe6r8QW+r+OYVAEXFXgX6zr4S6qlGcT+xTZvowWDZS0xXM+I953Dbe5Q2ePCPrCJWWgyktmJxuL++8AerBB0c8ZGfnNts4u1O5X9ka88KVbjD8+RUWhvkq5QYyZ0T6vnVtypE5YSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=gG0TX4/w; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="gG0TX4/w"
ARC-Seal: i=1; a=rsa-sha256; t=1768854997; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DDjzrAeHUiLdJ10jIaZP77QoiEf05fdiS/r/o9YrmGO0vc4RPuWWl4eDW4JrFoHu5lB9tTQYQhxQGEmNSruAr2Yc5PeDF5bUXjnnxZOHbumCS5QJdqyffIWYQS2goRrjs9FpKqcNtz94MkTYomlqzcKO1dPiFZwbeisVU9gRDKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768854997; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TQdZGb0oOwWI8Cu0pUCKnjGsYoiNP2/SvTOlD9oeAxQ=; 
	b=EtEsUwKrbWnz3PAwXaNNWsYBs88RTJqITbAOSv0zLqavXjvuQZI5LSCRuYQYPikFUKroEBg+eioatxnPIocBW0AdDppFJfTFW6znNKffLE5ktmfEoU5Xl92utkjuMRAO1kCNxu4y1fP9dR/A8zmmPy0e0ZRFwdq+o9sdokXTxzA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768854997;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=TQdZGb0oOwWI8Cu0pUCKnjGsYoiNP2/SvTOlD9oeAxQ=;
	b=gG0TX4/wFavmfeksiWlWZG9KSTfLN67eMW+lWfKCms9JCa2GqsXOTmHBZpixbFiU
	VrqqSB+D3SbwekdnVy+5CM8Nz56Kb8djpkTaq8De4qPib1r+kEpYNLK13pGjfvjE9dh
	FPDqwCB0R5kfOWWdMf0f+kmzq1SF4jQ+7IYHBcpY=
Received: by mx.zohomail.com with SMTPS id 1768854995501810.1118848998957;
	Mon, 19 Jan 2026 12:36:35 -0800 (PST)
Date: Mon, 19 Jan 2026 12:36:34 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
	aliceryhl@google.com, dri-devel@lists.freedesktop.org,
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net,
	a.hindborg@kernel.org, dakr@kernel.org
Subject: Re: [PATCH] rust: drm: tyr: Fix register name in error print
Message-ID: <aW6V0gn4mLiCUu1q@um790>
References: <20260119070838.3219739-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119070838.3219739-1-dirk.behme@de.bosch.com>

On Mon, Jan 19, 2026 at 08:08:38AM +0100, Dirk Behme wrote:
> The `..IRQ..` register is printed here. Not the `..INT..` one.
> Correct this.

Hi Dirk, I was hoping to get rid of this register read since it's really
just a bit of debugging, and it's the timeout error that is of more
interest.

What do you think of handling this through my read_poll_timeout changes
instead?

https://lore.kernel.org/rust-for-linux/20260119202645.362457-1-deborah.brouwer@collabora.com/

Thanks,
Deborah

> 
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> Link: https://lore.kernel.org/rust-for-linux/A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com/
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  drivers/gpu/drm/tyr/driver.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 0389c558c0367..3047fd12fd849 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -76,7 +76,7 @@ fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
>          dev_err!(dev, "GPU reset failed with errno\n");
>          dev_err!(
>              dev,
> -            "GPU_INT_RAWSTAT is {}\n",
> +            "GPU_IRQ_RAWSTAT is {}\n",
>              regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
>          );
>  
> -- 
> 2.48.0
> 
