Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E15C27A107;
	Mon, 29 Dec 2025 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767028482; cv=none; b=Xai8KLht4THdcxupw2c0zOnWL0L6tG+11Zk/occnXTXiFMj1dnDIVyAa85/AwvMy/fWlXUGjHkOWsdI9URXeq+4a420WnV2wVYzdlQFwFht21+BDGL6E4qLUhI5qr/PcHGP6ICyOlwDj4nx3HCjeMatlieLaLbfNIoTx181/40g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767028482; c=relaxed/simple;
	bh=70pMF0tZvi759bz+6lPYglJc2rW36kpCOk/59CwJpzE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=l2cyyCxyHGLo/wP6bT1je2IzlJWEAZtie8kyMwAy/p0q9g1QCI2IBqp+r/p4ZnMgid20rVOxF7FqbklfN0EPPlMJOECIbkcgMhAKIB0SE9VQD9tYtI9h1sgcAogUTtQLAPDSyDm8ohOOuFGHfVXsk+TlhUx/Wh02Xmw35r2Yl1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SplWRb82; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SplWRb82"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9D5C116C6;
	Mon, 29 Dec 2025 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767028482;
	bh=70pMF0tZvi759bz+6lPYglJc2rW36kpCOk/59CwJpzE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=SplWRb82hNcFOrWMWTkdGeqI1hoUIZbek6s4kRvBOl75NqFm2HtADcsYTff4BjKWD
	 /7ChNZYAOnPb9a36NlMIF4ZHC4Q1VS5M7LlZntPkd8dbe2aEUSO42M/XQsvCqY+Vvw
	 jtF5RODOztaj2o7otoPFuLjO70XXiNpLXnS0V7YLqHY0eY/27tBz3XbhHNaGUg/MkZ
	 N6BHT59Pry/m3mVphPuoWgznr9OL4vd1LxggREQuXJCocYMlp+x1l3WASR9Fc2xh3u
	 w8X5orI1RKqnDHIRHRP6h1cigZM/b03Z1uSjuLaGxkhzmr8kIlP0hMXCkZToBb6DJC
	 qnqrDm/JHoG2g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 18:14:38 +0100
Message-Id: <DFAVBGKJA41I.2UAE74BOHKUSS@kernel.org>
Subject: Re: [PATCH 0/4] nova-core Improve pin initializer code
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <apopple@nvidia.com>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218155239.25243-1-dakr@kernel.org>
In-Reply-To: <20251218155239.25243-1-dakr@kernel.org>

On Thu Dec 18, 2025 at 4:50 PM CET, Danilo Krummrich wrote:
> This is a minor series to improve some of the pin initializer code to:
>
> 1. Reduce redundancy caused by Result<impl PinInit<T, Error>> return
> values with pin_init_scope().
>
> 2. Relocate code that technically fits in the pin initializer into the
> initializer itself.

Applied to drm-rust-next, thanks!
