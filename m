Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB827707;
	Sat, 14 Feb 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771063591; cv=none; b=rxtizCKG1e7C0aaep6F668EPmsMtDrcUob0ozUHdst26ZS+nIVHPkEiVpKv/6QxGg1Fj0qVwRuDGp5/qchwDsU/SyeroenQ6Ak0lGd9Zl8BEiUZrzLD0fWLirk7r2Y1orjOpyo+6y6bSqEld+/c/bHqafPosNhZuhCbphh2nkaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771063591; c=relaxed/simple;
	bh=PdLyjOtiHcS9KxnLEo8RQrCl/hd/HfoyR+aSR/QqB8o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=K5H3jdgzTFpNu7OgNxX6OpzCmASDzGQuvOgKZzlNpaArybKCnYjAfXl8YNCoT4geDlhzWMCwtmwtBMUO6apSPKrUNE9NRwkMgIpEjPPnlwqK8JMGq+a7iqgZ/3vTdLaQNB+PBiC/GulQnJleC5hqWlPRSq6SdFKNvujAShLfSZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmCz2P+Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmCz2P+Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6C8C16AAE;
	Sat, 14 Feb 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771063590;
	bh=PdLyjOtiHcS9KxnLEo8RQrCl/hd/HfoyR+aSR/QqB8o=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=AmCz2P+Z4G7QWiVlM6uRg/bEsFP1udIPacrq+VGr5PCF/7J1dafKyhMzB8HrtnM48
	 vV6r8GMCnRGgMIcemyBM8MR4hxfDgyd7g0vlLq9UDagy4hlPYmKL09TNC9L5EW5vsE
	 KaS+xKbsl3i9LozGqcYECFl0OgAc1O26Dr9B0OMtKnvCidXPwb+lEXsyz0DMq09FBk
	 pKq9sVfh61Urla68uQXge2gMNnYoA4ZNZXUTQDJXeAx5uzDgC69/YwduRDPHPZUR+I
	 HpCevVLl85xn07tEuJkuBP8W6J4HKAOVe30gDF7MiA8m3069PHOsIGltZu9Y4A0noR
	 T8uzxzOuOXk+g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 11:06:26 +0100
Message-Id: <DGELN7K4KEY5.2SIZMKT9SFZ8F@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] gpu: nova-core: convert to use new `dma_write!`
 syntax
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-4-gary@garyguo.net>
In-Reply-To: <20260214053344.1994776-4-gary@garyguo.net>

On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
> `dma_write!(dma, projection, value)` is the new syntax to be used.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  drivers/gpu/nova-core/gsp.rs      | 14 +++++++-------
>  drivers/gpu/nova-core/gsp/boot.rs |  2 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs | 10 +++++++---
>  3 files changed, 15 insertions(+), 11 deletions(-)
