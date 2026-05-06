Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B40C3D544;
	Wed,  6 May 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056927; cv=none; b=nYhwdDZTOKWJCz7ddi0WlO/Vvp0HrEK32W1PHMbBw7n5szbtQmNrl4jzLigYQzzszWy2vixLZP9j8tIAupC1Bl21AsSYhidRACCa14lZ5ukmPpjs4HST2rYF6LB1U6Uf4rphmrlbE21NNfIxPnSOwvUsHX0XnijeJgJk8JvNVcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056927; c=relaxed/simple;
	bh=hGYWyFzqC/3GRkvl0z9xEYhHVzSFJMs1carF/LBfyWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Avzj423SFPBcS+ROX3GS/T7fe0KlHH2eh5FZ0hJEHX7XURkglvOvC2vFEXSpLktHyLmjkfteEgrFI5nRK52znyqVhheiDxWrJRTUdCuI2GZlXGq1sBRxAKm7F1a9e51wtnfz0WGuNo6H676w433jslrJOLTyagOvRZepZJYCJQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CnLCB6nT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CnLCB6nT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778056924;
	bh=hGYWyFzqC/3GRkvl0z9xEYhHVzSFJMs1carF/LBfyWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CnLCB6nTNAZ7m6o0fOB8BIdr/YS42kDJSB2IodeeI46D1ZwsRCs9RyjwdQv2dkh3Z
	 /a7BHUh8h0D70cGt/0OuxQGM0W9mweAUdD4hxcM6CRn3scpWTLDRoPhfNouwjVoUYa
	 TJXoaS7NVtDSspC+ptCxhRtyhxTiq7QHdW8fE/h7NUBtaD+ObVM097OWUYTQpOAIWq
	 GrDcB7j85l7zvvxIomc9isU4r5yYDPUPUAI5QuBJHyZnVG6aCZsxl7R/xCwmKswyOW
	 kY9OOpTtuye92vtL8DfartQ4f5TNoJ1+QThCmDEa+oGMxdbHIxriaP7QHZlkAekx17
	 buAiXVcI4uqEg==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B54217E0610;
	Wed,  6 May 2026 10:42:03 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: aliceryhl@google.com
Cc: a.hindborg@kernel.org,
	airlied@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	boris.brezillon@collabora.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	dri-devel@lists.freedesktop.org,
	gary@garyguo.net,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nouveau@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona@ffwll.ch,
	tmgross@umich.edu
Subject: Re: [PATCH v2 1/1] rust: drm: add RENDER_CAPABILITY flag for render node support
Date: Wed,  6 May 2026 10:41:47 +0200
Message-Id: <20260506084147.19907-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <afnMTfVfGq_iLXov@google.com>
References: <afnMTfVfGq_iLXov@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alice,

On 5/5/26 12:54, Alice Ryhl wrote:
>
> I think it would be nice for this documentation to elaborate more on
> what this feature actually does. After all, it clearly took us a while
> to understand it, so probably others are confused too.
>
> Something along these lines:
>
> /// Sets the `DRIVER_RENDER` feature for this driver.
> /// 
> /// When enabled, the driver exposes `/dev/dri/renderDXX` render nodes to
> /// userspace. The render node is an alternate low-priviledge way to access
> /// the driver, which is enforced on a per-ioctl level. Userspace processes
> /// that open the render node can only invoke ioctls explicitly listed as
> /// usable from the render node, whereas userspace processes using the
> /// master node can invoke any ioctl.
> const RENDER_CAPABILITY: bool = false;
>

Agreed, the extra documentation will definitely help clarify the flag 
purpose. Thanks for the feedback!

> Also, I'd probably call this const `FEAT_RENDER` for consistency / to
> make it show up in grep.
>

Right, using FEAT_RENDER in the Driver trait as well sounds good to me.
I'll submit a new revision with these changes.

Best,

Laura
