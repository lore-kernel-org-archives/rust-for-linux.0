Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74234294A11
	for <rust-for-linux@vger.kernel.org>; Mon, 12 May 2025 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747077518; cv=none; b=s1UQnbaU5Om9wHYoLVBewSSc5hPT9Q37CNKbhtQ1/Qxcf57G+6/SUEIWJvCay17cOi0ycx6CswJDcXF5mSCC8yFKUPSIjtmXr+3J359gykiYbsHuNTXCodqsgHGpR5I8Xsor5h3A74TexcNDJBsOIszyUK7C3xw6mDqO5tvdul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747077518; c=relaxed/simple;
	bh=XOHvEQa7U216c0WoSRd6/3fB2wSroS71mMJOWWLQAa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQLWRoL8mOSO8wAUvHVMOslMO/du7BipX23BzkAgb8lwgtrZcQkovwro+It34i8JNwMN3r3hTXnjBrnlhOtX53hsvYGGUEKA2b1/bYvaoZkOhpsnd3D/qpN0xWf0zGnqXZsJZBv3pa1ldQjLHzJpyd3f4wyMaXUcg+Hm9GtALjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBx4N7fU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBx4N7fU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C638C4CEEF;
	Mon, 12 May 2025 19:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747077517;
	bh=XOHvEQa7U216c0WoSRd6/3fB2wSroS71mMJOWWLQAa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBx4N7fUXn8H7/SQ8Lg1EFwlZm3r8QmanQa9M3twS+ECuKhW/bg/5Wix10q/CdqRy
	 BA9RMoFV7/FVqC7nr3ir98Cr2Y8rc//X8kZk8Y5LXdoy8w1tDIHUzcTp0yGs1+ddUy
	 2NIW2cY3DM7DS2pGJ4WIrNHiJrj8G58s2N9duNUQWzggx/amsEZtdWCJZuF4f5YFXT
	 R0gCbqNYijtIDxz0i+UEdUYTvVLM6/MbmW3Q9B/BEN5t15BE4Xa3lfkS42yBRbVThn
	 cGwgrnJr/sfFgJqzLlLWYgZJosB/NgnIUhs4Q4WXYPOlpfkyFHgy5LgTNjEKUZ1BN5
	 5p7xVKrgFg3pg==
Date: Mon, 12 May 2025 21:18:29 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, ajanulgu@redhat.com,
	lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
	cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com,
	acurrid@nvidia.com, joelagnelf@nvidia.com, ttabi@nvidia.com,
	acourbot@nvidia.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Nova DRM skeleton driver
Message-ID: <aCJJheFGR0TMN5ha@pollux>
References: <20250424160452.8070-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424160452.8070-1-dakr@kernel.org>

On Thu, Apr 24, 2025 at 06:02:48PM +0200, Danilo Krummrich wrote:
> This patch series adds the nova-drm skeleton driver.

Applied to nova-next, thanks!
