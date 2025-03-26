Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117A42628C
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Mar 2025 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978781; cv=none; b=lF4eklX9mvtDdFVBdxZDQFZ307fqLLWga7H3FiqaCavdTQRM/QrsO+h7MFMJyg/qUT2GI9Lb7L/4QevAnIX8PelweTX6dMm0lb+1QwpTA50JFZoPGHT75HTmoMEd51bdLaAC8BaO7UQgjyrA4yxJO7PLn4Wjt5hnNXioP/FTBW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978781; c=relaxed/simple;
	bh=uDjnAPivhTKuVNSo+18ftJxD9akeknBIx6lNFUOkFkA=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=RQjofb9rR0+O5tPFAs1WoCf6ZxssgtpA/jkXvQ+ny70kq/1A/Q0FW9HdB/gVuwC3KxdSoydnHVUphMK7C4MiQG5MVnZL2PNL0hHfF4mJ8Zh4QLh4zAmK97SGIpcJiTj6IWSaDZrD5wNqqvnA9cOcBG13jKH5BzCqrJ7OETsYA5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgJ5F8yV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgJ5F8yV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1BAC4CEE2;
	Wed, 26 Mar 2025 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742978780;
	bh=uDjnAPivhTKuVNSo+18ftJxD9akeknBIx6lNFUOkFkA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=KgJ5F8yV9A3pEeN8PODfL90zI3m6llp/Nw5NG7h8yE1a8l0O9LxqdVGdg5vg47GHx
	 Nj7hGXFzYgRaHV2acNbEj+57qMY2EBlLgzMKc9a4cifEVuvggIO41941zQe7kxeh4p
	 o+2uWoMVAhDTAIfg29PZnPZJrMzt+RnGJelfHIohx/iobxJaYmX44gXuxmDXC35GwN
	 TImwV77eN+0UQXLcr/wmWN65++1T4KAl/4ujH8so+YFnDVUdtXGMwDe0k4So7wdKNq
	 5uIvfDx2ifTDOyv6Mb5PuNWjRZFdwgllb3Pa00WHYdfhTb/qwuuNscWtRkyaN7TogJ
	 nOFCt+g6pwYgQ==
Message-ID: <ccdce4920ae2ba95a2afe8bb4d6f0f60@kernel.org>
Date: Wed, 26 Mar 2025 08:46:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/8] drm: drv: implement __drm_dev_alloc()
In-Reply-To: <20250325235522.3992-2-dakr@kernel.org>
References: <20250325235522.3992-2-dakr@kernel.org>
Cc: a.hindborg@kernel.org, acurrid@nvidia.com, airlied@gmail.com, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, daniel.almeida@collabora.com, dri-devel@lists.freedesktop.org, gary@garyguo.net, j@jannau.net, lina@asahilina.net, lyude@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu, tzimmermann@suse.de, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

On Wed, 26 Mar 2025 00:54:28 +0100, Danilo Krummrich wrote:
> In the Rust DRM device abstraction we need to allocate a struct
> drm_device.
> 
> Currently, there are two options, the deprecated drm_dev_alloc() (which
> does not support subclassing) and devm_drm_dev_alloc(). The latter
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
