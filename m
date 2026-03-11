Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF0D2BD02A
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 23:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270585; cv=pass; b=r+HeYIsI7UZQ6EgEr+TfOPAk3w+YGy7XzAJNNZMweFQoIwSZ7jDDY8JMoBQVPVSG54xoz6l3DNgjkMpdZV550eFSSd/hHiDTAV45K/8o7tLHgCYFUc7DGlRWLSGZ5dY2NG2c0PV3uTakMSDCMzqWz4+TD6sgf9LTsdbm12EbxHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270585; c=relaxed/simple;
	bh=LkgHOs9LyROXSaG9k2ItqO605+X243/Debu1odyp4EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xl9TnZPFP19Wf1wQw2GVgZTCjmSFQIp8Nv1svFnuFTK9o4igzoA/6DeDavSd8u8eHWS8HCuPvEwet7A2rbCNf3qRbzPs0l1aPf6tRTqLjoM3UmgNfQ5wkOl2Lj5MxRnEeyD+XmzSu/DjXmlQBAOvAivyYTeW6AqqF+WaFY3pf2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=lTb97XV2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="lTb97XV2"
ARC-Seal: i=1; a=rsa-sha256; t=1773270557; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dd8/HMjXYtVuqcs7hG9ViB7evgqY/Sjiu/qFxzeGDb732chtBOcas842Gjjd/OWqODLqWxgOAK53cBrZ9xvc4SMey0uhr8cn3dNSBZC2+2tEWKlJ51qwafs1AnMbBOyDX6zCm0j5Plpgf1Lc2kzKkAXIkMFXAm2gw1sWMPmxZPE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773270557; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FRAotZP6bWuOAsjwMHnJhJ5sfG7rZmJgYbnrcYpOycM=; 
	b=CV8rZ4Y/ByG8E38orsiD5Rw2VC5HddkHVVzzW5U2pW0oAOyc72B4qx8LAsM/J5kvGMX0gXWXueC76bsjUEptyURGKCEStyXFkMyEW8o9eKD8IXzeinr+e40BscD+fq0XxaWiWuc6UyT5QIrF9wypE0zDCCAf+AKGHNonz5i18DE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773270557;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=FRAotZP6bWuOAsjwMHnJhJ5sfG7rZmJgYbnrcYpOycM=;
	b=lTb97XV2MRAPSkxjLCbw1tAiXyJg7aAXujW6Qt6XDP/ZT8RkiZc+6F59K1laVhAq
	i2m63Dd2dEsVjT1PHNvSipdoOdngGZRZqV9Nmt9rMs+cUgJxcSuHswVc6in+74Gzq9z
	0ikMOPAyMO70Jqd2/cCm/wdo086+EbLJQFMMzbJ8=
Received: by mx.zohomail.com with SMTPS id 1773270556008527.262305624514;
	Wed, 11 Mar 2026 16:09:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:09:15 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Steven Price <steven.price@arm.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Dirk Behme <dirk.behme@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v2 0/5] drm/tyr: Use register! macro
Message-ID: <abH2G2yi_2c9gPZs@um790>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>

On Wed, Mar 11, 2026 at 04:03:57PM -0700, Deborah Brouwer wrote:
> This series changes the Tyr driver to use the kernel's register! macro
> for hardware register access, replacing manual bit manipulation and custom
> register structures with a more type-safe and maintainable approach.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> This series depends on:
> [PATCH v8 00/10] rust: add `register!` macro
> https://lore.kernel.org/rust-for-linux/20260310-register-v8-0-424f80dd43bc@nvidia.com/
> 
> Changes in v2:

Forgot this link to v1:
https://lore.kernel.org/rust-for-linux/20260114-tyr-register-v1-1-7deb1b33627a@collabora.com/

> - Rebase on v8 of register! macro series;
> - Add documentation;
> - Remove manual functions to get address bits;
> - Revise gpu_info() to use macro;
> - Revise l2_power_on() to use macro;
> - Set interconnect coherency protocol with macro;
> - Separate commits for each register page;
> - Replace HI/LO pairs with 64bit registers
> - Order registers by address;
> - Remove doorbell clear field from GPU_IRQ_CLEAR;
> - GPU command is redesigned to accommodate multiple layouts;
> - MMU register bits corrected;
> - Use UPPERCASE for register names;
> - Move the consts to impl block for registers;
> 
> ---
> Daniel Almeida (1):
>       drm/tyr: Use register! macro for GPU_CONTROL
> 
> Deborah Brouwer (4):
>       drm/tyr: Set interconnect coherency during probe
>       drm/tyr: Use register! macro for JOB_CONTROL
>       drm/tyr: Use register! macro for MMU_CONTROL
>       drm/tyr: Remove custom register struct
> 
>  drivers/gpu/drm/tyr/driver.rs |  32 +-
>  drivers/gpu/drm/tyr/gpu.rs    | 213 +++++-------
>  drivers/gpu/drm/tyr/regs.rs   | 785 ++++++++++++++++++++++++++++++++++++------
>  3 files changed, 792 insertions(+), 238 deletions(-)
> ---
> base-commit: 91c02cfa16427b078c8a74f2b96123b579fdb07f
> change-id: 20260311-b4-tyr-use-register-macro-v2-cdc89155045a
> 
> Best regards,
> -- 
> Deborah Brouwer <deborah.brouwer@collabora.com>
> 
