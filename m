Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957162C11DB
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346087; cv=none; b=lK7gAiolYPBHE9dwdc1pa9Hs6AY/av4JEMkBO3skfCbYGQUVCz2O52j47snwy7WR2lERL1qgtSDJNbYAJq2mPHKE6/t595TLNy2arB9mPFWC+N/EP6y2Z/Qe6YLHBGdKVUhKBpo/pUcswBFXIbFFupsvvHev+/0WX65bLtbzkSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346087; c=relaxed/simple;
	bh=TduUf8cYUueDiOeghuHab8L9UNHmGg6Smnk+PIa7t48=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vCSxjgPlQSUm9/FG285yfz+h4sXCnEzH9L9olVoY7v2aOtcjAHsWtC6+Vnoq35dAJlFgNadhsQsSRHHa8vgDCu0QQD27ISzXrOUfWst32Xw6ZkUWlW9F7YBjZwO5QbgX2Oj+wrRt90KdYqtifQ6GueKFrztHo0UrNZQJA8/8BiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cW14d0dh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cW14d0dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774346084;
	bh=TduUf8cYUueDiOeghuHab8L9UNHmGg6Smnk+PIa7t48=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cW14d0dhU2RvvGmHOadOaBcONCyjPptPEJohqMaBIPUdg9ul2Pcy+5OirzQle4ZHH
	 FKfkiU9YOZGooeCQ/Sl33gQF4YSceuQOead+kRNEz/X2MaXTHhMtbPQo2fPztxfN9Z
	 Aot9vEFfH2iDlkYlLK8//pxqHPPJLST/pWJNgIcP8HqoOLsERNzo37QPj4EqZbKRaB
	 vdeH9Yo1Atl0TdNClnU2h5jLNHi2yDCtDqAjWnFEOir60z+BZ9BMBGL2Kd6pVbTaLx
	 RqylhzdET6+C1+CJtXf9HScwtvedJxRAZNV3NJTgSciMZukMRSwc/0iSzsoOIRKHrs
	 qOUD4pQl0ibYw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E7A1417E59B0;
	Tue, 24 Mar 2026 10:54:43 +0100 (CET)
Date: Tue, 24 Mar 2026 10:54:38 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Boqun
 Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 02/12] drm/tyr: Print GPU_ID without filtering
Message-ID: <20260324105438.0408e68f@fedora>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-2-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
	<20260323-b4-tyr-use-register-macro-v3-v3-2-a87daf9e4701@collabora.com>
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

On Mon, 23 Mar 2026 17:18:04 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Currently, Tyr prints just the upper 16 bits of the GPU_ID register,
> namely, ARCH_MAJOR, ARCH_MINOR, ARCH_REV, and PRODUCT_MAJOR. This matches
> the id printed by the panthor driver.
> 
> To avoid the manual bit shift, just print the full GPU_ID register. This
> prints all of the same information and adds the VERSION_MAJOR,
> VERSION_MINOR, and VERSION_STATUS.
> 
> Before this change:
>   mali-g610 id 0xa867 major 0x0 minor 0x0 status 0x5
> 
> After this change:
>   mali-g610 GPU_ID 0xa8670005 major 0x0 minor 0x0 status 0x5
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/gpu.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 66fd6c016c62abe3c34669a2e47b680c3a3f873d..4a50055b415c693a89cb99dba241b21351a14149 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -124,9 +124,9 @@ pub(crate) fn gpu_info_log(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result
>  
>      dev_info!(
>          dev,
> -        "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
> +        "mali-{} GPU_ID 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
>          model_name,
> -        gpu_id.into_raw() >> 16,
> +        gpu_id.into_raw(),
>          gpu_id.ver_major().get(),
>          gpu_id.ver_minor().get(),
>          gpu_id.ver_status().get()
> 

