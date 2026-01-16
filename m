Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06371E991B;
	Fri, 16 Jan 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577126; cv=none; b=SceLeg8KdX/q7ERPYMb/aAMX8ndZEaT2xUPnMTUX+Pm3DDyi0n1cOCxMJ3loMKZiVjH303HYcTqhlI21JMwcAnOafMcEll1Vq2iPKI8dOFUTwRmGs0essgUkO2I0xvkshcPCiz6LzDqcQOXQ+507hVWO2yzjO1GYLpJDF/0p6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577126; c=relaxed/simple;
	bh=KafYf1PDmObWFHpL7ROG48MgsO+5ZgP9jpmdINXl6ZQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kUHsGhXdb0iIwZtnxc2Dsb7ZkM/DwWTVf135ibD+kzMOohL6c+NPPIidnS4HRrRwDNGdFLlsVUDd8uTVue4Rq3tAy08DXfT2cLCIHMkBEX+sR+930qp7RdiVo6WBckBrW7qrDzC4tn7oYgh46QrckxJjkud8scEy9LcLplI3nYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAJ56O0v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAJ56O0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250A2C116C6;
	Fri, 16 Jan 2026 15:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768577126;
	bh=KafYf1PDmObWFHpL7ROG48MgsO+5ZgP9jpmdINXl6ZQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=DAJ56O0v3utoQWm1BkySC+Jr4/demiIF+A74YyLHapmRa4VeC+CqztOihc/pI2oQb
	 R21AgILlKi4wJAuW5HsxOQGYxp8TLfD7af/94HGngLE3FZcumFMvIlYiufRK5HZZEd
	 10RE6nxwmCr2wDa9NxJ8CGep+51QbcyIngrMD5e8AxVwsOehMOOlQsVynQrAGGiklr
	 C2+3Xu8gUl6ZFrJtqt7uDY/SEUM/NAJwn9+OD6PWKZDk4iKRjSGcaaXjQ4vac5syEJ
	 dcrfQMjZAITPlBCSBO4dqGMn/yinpiSG2OJpX81cw7TEDdSYWHtrLlxJtISs3ZzNGg
	 bxbmEZIyWCfmg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 16:25:20 +0100
Message-Id: <DFQ49KSXC7WG.W2HA9JUGJZ4R@kernel.org>
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <Dirk.Behme@de.bosch.com>, "Dirk Behme" <dirk.behme@gmail.com>, "Alice
 Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Steven Price" <steven.price@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <fdc39008-ba4a-4170-b7ce-cca2deda5652@de.bosch.com>
 <1EF6A3B7-216F-47C3-8631-25C38994BAC1@collabora.com>
 <DFQ45GSQLR55.1GRM6DSYTG01D@nvidia.com>
In-Reply-To: <DFQ45GSQLR55.1GRM6DSYTG01D@nvidia.com>

On Fri Jan 16, 2026 at 4:19 PM CET, Alexandre Courbot wrote:
> This means that fields won't need to have an explicit integer type
> anymore (they will automatically use the corresponding `BoundedInt`
> instead).

Oh right, I forgot about this for a second.
