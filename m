Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC91FDA89
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Jul 2025 22:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582573; cv=none; b=L7NlTC/wMhp+E/6H8BgabSEn1CxDo9Ik2eC6ZJWKKpNl6AwWR+6KpnlQeuCPrHFwyoB7/ZZc01QdD7NM9YwxNz6/XKDhbZgithCDYxkk4qkpIlKlta7n39KN3+T/ZZ7ljAhWaRwCtrUv3QS5I/E3jvgHtL9iaDNYwHA6VEDkyj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582573; c=relaxed/simple;
	bh=Kre+RqDlY7Qcvkm7QilmpLAdUpMv/U3UnwEhm/7wzLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW3npx/yJIVcfkL4jdv9Y8yr/mA68trqXOJ5YmbtV6oaukT/Al28PLSnl39bavaJ+2LuGNInCXtwtTInCNlgi6KrcTuzGjqwTrXL6TZpKoR5G+o7Ocf96K+ha8B2vPerbJAje4Xvkf+o2nVi34BM2oMOvlqfolUc+Bvp+tNPsTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bx3fpcHK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bx3fpcHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD1FC4CEE3;
	Thu,  3 Jul 2025 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751582572;
	bh=Kre+RqDlY7Qcvkm7QilmpLAdUpMv/U3UnwEhm/7wzLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bx3fpcHKJCdnLE4fop7ZJtWgkDv9gJu2+/yEPATM+TLSMwJ8/XqOi7AYkl9GFn/MA
	 ZEnnke7S9pEieglbkPAN7WMcmwH0lujyqU/a7L64H0OuSHhNTFHysYOwkSjQ69oFWL
	 p0g1yRYMGE0X64+IG+2qBhe139rbgEM3s720ibr8IXg1kSL7zkApHV70/91pLp9mrr
	 a4Z/7VVvhjQguhHImWvNnA7ia7hfGJfcC+H0u/nwZMLV3xVhRcQkjpmJt8kZIY2w/T
	 tKmc1++aZSu0h3hMcIGB7gy4IoPZ5+Cmnl4KARwIKYtRamV93W+hexUIy796dN359P
	 mvd81/KXASwIQ==
Date: Fri, 4 Jul 2025 00:42:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, acourbot@nvidia.com, alyssa@rosenzweig.io,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: device: drop_in_place() the drm::Device in
 release()
Message-ID: <aGcHZtAGnnJBanRy@pollux>
References: <20250629153747.72536-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629153747.72536-1-dakr@kernel.org>

On Sun, Jun 29, 2025 at 05:37:42PM +0200, Danilo Krummrich wrote:
> In drm::Device::new() we allocate with __drm_dev_alloc() and return an
> ARef<drm::Device>.
> 
> When the reference count of the drm::Device falls to zero, the C code
> automatically calls drm_dev_release(), which eventually frees the memory
> allocated in drm::Device::new().
> 
> However, due to that, drm::Device::drop() is never called. As a result
> the destructor of the user's private data, i.e. drm::Device::data is
> never called. Hence, fix this by calling drop_in_place() from the DRM
> device's release callback.
> 
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-misc-fixes, thanks!
