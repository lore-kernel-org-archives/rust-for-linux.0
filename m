Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C87344D89
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 11:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894347; cv=none; b=unD7jO+k+EJb0PmLudGo71hztvHKLJmHb2zA6XQRrQq0QC4uwhjjhMPOidfcop8VO0LgGpGiNm1M6hTgYTT4A1y5leDhISUDfDm3XU15RNDtLG8+ZT8+STZk/H6HeiT/1txAcQBWVYSRyIy09x3C1flo/gM647EscHRI8qhEUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894347; c=relaxed/simple;
	bh=P9ffzgxofLVWVga4R+Le4SX4ODA3h2rfxfHA1rWlv7g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dS+/wYCHyegHTV+e9m7z3cTHPb8lOzK7jwiL4JImZLNR65mODoe1tvIZDam1ZZa4cISzToGCME/ibqVyZsPzlMC/Y2tR6uFG9o5s/UqAMhkR3zOcvDyUKa5M7OEkPDrUQL61qoVj/8fGDDK5JG5ydKLADRmfAqx/bBgP2W4VCGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kDoD0dlZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kDoD0dlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770894344;
	bh=P9ffzgxofLVWVga4R+Le4SX4ODA3h2rfxfHA1rWlv7g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kDoD0dlZbiQrqwR5dqh2lrb8PmGZ0vsTBmPEsmQCHqtSdDNjobayQ3yiTWMuKxD9J
	 Fg8W0lUH0tUPzuIrit7MSOX98EPZhnlKxVLxNuChvU2MGy8tkjg8xSHst8+Y2iQgDX
	 56cjt/hvsGmBjA5LKpS8pUIVmG2zkq8TAg86qbKMMu39XC7Q9+cUXpvkyXV06u942v
	 O4ob/oCo440bV2bvih8NuDC+4FviJX6sZz1LxX4E9can12cG6//kuAoSsLe8WXUYuJ
	 MDCJV5nceJw2ELSE7fOZDbQzPpKIq7q4Gjd5zfVHJN4qC2PwvR5zEDEtUW5IJWXm3S
	 F3ATWlxpUab4Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F96E17E0A49;
	Thu, 12 Feb 2026 12:05:44 +0100 (CET)
Date: Thu, 12 Feb 2026 12:05:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
Message-ID: <20260212120538.13f81d8a@fedora>
In-Reply-To: <20260212013713.304343-9-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-9-deborah.brouwer@collabora.com>
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

On Wed, 11 Feb 2026 17:37:09 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> +
> +impl Mmu {
> +    pub(crate) fn new(
> +        pdev: &platform::Device,
> +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> +        gpu_info: &GpuInfo,
> +    ) -> Result<Arc<Mmu>> {

Maybe the Mmu should be wrapped in a Devres, like we do with other HW
components that require the underlying device to be bound to access
registers. I mean, we do have iomem wrapper into a Devres, so maybe
that's not needed, dunno.

> +        let slot_count = gpu_info.as_present.count_ones().try_into()?;
> +        let as_manager = AddressSpaceManager::new(pdev, iomem, gpu_info.as_present)?;
> +        let mmu_init = try_pin_init!(Self{
> +            as_manager <- new_mutex!(SlotManager::new(as_manager, slot_count)?),
> +        });
> +        Arc::pin_init(mmu_init, GFP_KERNEL)
> +    }
