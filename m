Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4F22641C6
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 21:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882868; cv=none; b=iSZ7wtFwh5dUhEKWjRILsIx+HMAkEtbKX8QmYKeOyd+ZdCv83BF/qSE8awjzpaInc32Gr7GRMFd9dHBbljb/PifVmegE36ryVojiLAOZsf36gap6PHZaEDafP0KR9zCem9jYPeFRmIJ9NlYvd0Yr0waqeIFNgIBd/y1ltG6/WRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882868; c=relaxed/simple;
	bh=t7J5Tj8RlZ5XzMAXGnsiXbH6mgB4YN/nTJgHtJEr3v4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=T8yyVHepBy6zi1npr4v8KRBajJNgSZ6P9K3Nesy1yryCpOUBSYYfsmQOi5yv5IVvnP6nBsooSySr2rD94XjSmklNKD/h4uYc69iqoWKArnc8WQLNuaM04+rvwMPHpgmNikUdiyYNbx8hCTikEzezkpSvCcsztsEaDO2R2VQrK1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWYdGqDo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWYdGqDo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF471C116C6;
	Mon, 23 Feb 2026 21:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771882868;
	bh=t7J5Tj8RlZ5XzMAXGnsiXbH6mgB4YN/nTJgHtJEr3v4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HWYdGqDotHNUL4fdCzNzlGkoHmO/R1BdROR9kIfu1fiMzf28IKQ+Fg1UKDdhNbztJ
	 aGt2C5oGfTz7x393TjjZbB4OTlJNxJPS+U1sCO7mj/uZp3wHo3k0u0uffcva8yL9bT
	 3sHEsFtvXKE5eQ7sAWk7xB6pNVxE2tBaEuY3Sihod0wEOAhwntdJ53OhGD3WdgxzH6
	 GQRXtjM4sSiCfSWII7sCPuvWdlM1JOGAdX23jF0C5X44e7/0RCXxhebalGqGNZ2D4I
	 KVTzgr1FKhmx5NjjKvjF/ojbVHAIaelcz1Sq9Xxlv9FHs1gJJ0+B+PJyF5/oCIZgad
	 vAE9J7gV8bcng==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 22:41:04 +0100
Message-Id: <DGMO1YUKS8WK.H2FG6YL1ROC3@kernel.org>
Subject: Re: [PATCH v2] drm/tyr: Clarify driver/device type names
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <daniel.almeida@collabora.com>, <aliceryhl@google.com>,
 <boris.brezillon@collabora.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260223204648.208886-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260223204648.208886-1-deborah.brouwer@collabora.com>

On Mon Feb 23, 2026 at 9:46 PM CET, Deborah Brouwer wrote:
> Currently the `TyrDriver` struct implements both `platform::Driver` and
> `drm::Driver`. For clarity, split up these two roles:
>  - Introduce `TyrPlatformDeviceData` to implement `platform::Driver`, and

I think this should be TyrPlatformDriverData instead, i.e. it is the driver=
's
private data that happens to be stored in (and owned by) the platform devic=
e.

The corresponding C setter is also called platform_set_drvdata() and not
platform_set_devdata().

>  - Introduce `TyrDrmDriver` to implement `drm::Driver`.
>
> Also rename other variables to reflect their roles in the DRM context:
> - Rename `TyrDevice` to `TyrDrmDevice`
> - Rename `TyrData` to `TyrDrmDeviceData`

Although it might sound contradictory at first, I think for a drm::Device i=
t is
OK to name it TyrDrmDeviceData as opposed to TyrDrmDriverData (although tha=
t
would make sense as well and I'd probably prefer that).

The reason is that a platform::Device being a bus device may store differen=
t
*driver specific* data types thoughout its whole lifetime, i.e. a platform
device may be bound to multiple different drivers throughout its lifetime.

But a drm::Device being a class device is always *statically* typed over it=
's
private data type, i.e. drm::Device<TyrDrmDeviceData>.

> - Rename `File` to `TyrDrmFileData`
> - Rename `DrmFile` to `TyrDrmFile`
>
> No functional changes are intended.
>
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Otherwise LGTM.
