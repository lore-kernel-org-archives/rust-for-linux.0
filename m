Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72591A5BAE
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Mar 2025 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742980314; cv=none; b=AZowAIcG83+b8tC39beTovJC6w+w56YBBmhvCrZmVlLqZxf18g5HrPOH5DrTYwariJrEJTI9h0hm7WdllzOmzioRxeOnkYazROcmAj+1ov8O9KlUd460WZJuUWN+77y5FHXKRoQVPUzwtpFl2VMfQTOIDY/s9HMcn2hRKibriYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742980314; c=relaxed/simple;
	bh=3kCGSkXuBr815QYHQXrTf92q9/vWWBATyeD4yTh8H40=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=X6sVRhVhk1a0SEtontvv5z2U3zGeLtr2RJ3+8lMP7MqMOsq8xxnjOHaK5hB0VtLvyLeKhK0DIQv23gP6rPobc/AtbRyZleQbinFa1myX2QMbfOeBc/Du7BN6DBkxB6GTMKTvg0ehTgLImNSSDl0h/i6Kyo1s0GyQqsdTudxn3xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQRxcRQH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQRxcRQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F039AC4CEE2;
	Wed, 26 Mar 2025 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742980313;
	bh=3kCGSkXuBr815QYHQXrTf92q9/vWWBATyeD4yTh8H40=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=gQRxcRQHG4iHz+9rZomAvSB4djOc01QxRa7S1hCDlMAbip++CpctULgaJgBm5czmE
	 VoqoBS0dqEqNxcBhl1AsC/LXoltEnSSVwZfT/n0ll8eUzTIOHHVABXR83AxwmQ07cD
	 +eJy0JBpysFewDZ8I9qSABa/k8SPgIAOSxxR9MwSyAtyPNh7clXTBxqnBZw8mXUB3V
	 JzmnD01sL+xT7P9VVwb6XR+eGXNTKHu4nSs6U9LHa6AI6J1YYLcvgBOTCuJpaAb8m0
	 Ci/Lf3xiYB3sva0XajLYT1rmP/IQZNVqHOx6C123pbAFSKCqn5C7H8Qzke7J39VI6R
	 /0xylm/eNjQxw==
Message-ID: <45dcf149f8224b5f13b9b102c706c94b@kernel.org>
Date: Wed, 26 Mar 2025 09:11:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/2] drm: nova-drm: add initial driver skeleton
In-Reply-To: <20250325232222.5326-3-dakr@kernel.org>
References: <20250325232222.5326-3-dakr@kernel.org>
Cc: a.hindborg@kernel.org, acurrid@nvidia.com, airlied@gmail.com, ajanulgu@redhat.com, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, bskeggs@nvidia.com, cjia@nvidia.com, dri-devel@lists.freedesktop.org, gary@garyguo.net, jhubbard@nvidia.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, nouveau@lists.freedesktop.org, ojeda@kernel.org, pstanner@redhat.com, rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu, tzimmermann@suse.de, zhiw@nvidia.com, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

On Wed, 26 Mar 2025 00:21:49 +0100, Danilo Krummrich wrote:
> Add the initial nova-drm driver skeleton.
> 
> nova-drm is connected to nova-core through the auxiliary bus and
> implements the DRM parts of the nova driver stack.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
