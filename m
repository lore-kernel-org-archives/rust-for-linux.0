Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0931D367
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774124935; cv=none; b=AqWH/R/2XVTFGr9um5EEagSTWywqcS9lsvAH3WwB3bad9Tj01SsTXYxEvT79xqiNRuHRQR4GYGTvijGgd3ExPHGgwhPWydm3a7j8YScoC2MYhFwH14q24X/dTA2W2YLgDdk10PC24nPkRquRHSjdNaznhkMmzaquvxxOkhuchWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774124935; c=relaxed/simple;
	bh=kNrKriLhJrR7cdJDb8qFMRaj/p3ZIr7FZnpYIT1tQSA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RfWPwfcVmg3TENqGjLzLMt1AZd4e5SVclJpEzllpwBB+yWzb+sx1kuJRH2CsxuZRszMdXOlXb4eZyPEbr+sLkp8aFwflEOS0ZmIZXWT7DldTSroPcSBR7HzTOL1o0lr4IMi4SZ1hgUh8vP6CcoDCxiA5M6L+jfAsf+8GJU53yp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdX5w9gQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdX5w9gQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4FBC19421;
	Sat, 21 Mar 2026 20:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774124935;
	bh=kNrKriLhJrR7cdJDb8qFMRaj/p3ZIr7FZnpYIT1tQSA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=NdX5w9gQbeegNmb97/2uyJM3QF79WtJUlXSI75FYwCDmLMyjE7zDO7WHA3xWXw7xi
	 BXDbWfMlc2rJmB0Yhjyad7KYXTtBaCBVPCg7tSpN/NH/QkJxtXH9VKZp5Y3U0sK9QU
	 xYBXTFRuMFoDzKXDmdswXoJO2eGx4wB/aku6ddSNyu5p3wEtSHbF2ZCrM9IM2051IQ
	 7dvv+YdHR9QXWFnkviQQPod+R51n8FRtk+orAbjzQQAxl5LvxD13RNmI2+lCMwxXoG
	 lul1CJO7YTjhL/8RoPmGBfttz/wkOh+ZTRVwuFaU8DMWtBu8PEzQc+jaOG/iUv6dlQ
	 NlvOq28TFyRqg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 21:28:51 +0100
Message-Id: <DH8QSU23BAEM.38UDAI6TMFXUS@kernel.org>
Subject: Re: Sashiko.dev for Rust for Linux
Cc: "Roman Gushchin" <roman.gushchin@linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Zi Yan" <ziy@nvidia.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Jason Gunthorpe" <jgg@nvidia.com>, "Leon
 Romanovsky" <leonro@nvidia.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <1f94cf47-9898-405d-bdf2-29e21cd87528@nvidia.com>
In-Reply-To: <1f94cf47-9898-405d-bdf2-29e21cd87528@nvidia.com>

On Fri Mar 20, 2026 at 8:40 PM CET, John Hubbard wrote:
> So what would it take to get similar results for Rust for Linux?
> (A bunch of us are working on drivers/gpu/nova-core and=20
> drivers/gpu/drm/nova, which are written in Rust.)

Eventually, it would be great to have the nova list added as well, but let'=
s
wait with this until we figured out the mailing list situation.
