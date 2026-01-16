Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6F3A1D1F
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 20:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594167; cv=none; b=oby+aTXeRkWfrVrlIAcQJiqdNL1F4ijb+ghYAOSZsWGT4bAqKdNWavzeCwciInkTHfLPwJRK8HcxQuCU+cA2RFWM7WlGPbfhNSzu347a49R1n9ulk2RwURJ4+3FRfo9HHXYCRuwVlcKFedBQvJy/Txgq/fKQ23GkGSkN2000XiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594167; c=relaxed/simple;
	bh=EpPcvE86FHI7tsABvoLplPkD+gBvn2ap+SFcFt1BIwY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=gxZIRB3y6NA2cyVv+SDzNfw10hCBt3Gl6wDwMreZN+PyLUopxE246KMPXIQrabAtnroJaKRw8vSpEn/gTTUdiHP5DSTutPlsXxveMtggLgH2mE997gfiLiPtKy9AYqKPaEjtzks1wby0k6X0vW+ElzFXcPirNrVYS+ih+qZyyeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBMsKbeK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBMsKbeK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7167CC116C6;
	Fri, 16 Jan 2026 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768594166;
	bh=EpPcvE86FHI7tsABvoLplPkD+gBvn2ap+SFcFt1BIwY=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=rBMsKbeKNfP/0L4dTqxmM4SevVuwOiA1wptZ6L2YR+4KtReus1oL7bmr2Bjx36puP
	 UFfkO54XdfHid2DuJjnDDnH30g/2S4pR3+HnaldulTC+f0oP3b9U+0a4VzWrV3eJKV
	 Mo3uC/yt11Zy0ZA9BzCSsq0KMtVh+GBPWVzlgMHlvxVy+kJKjfJ+/L1pFrgipCTxgQ
	 wO7hImQ1/3IO9Ya0QIInrs3GFbk0fl4FjOrLtkcfDxNQj2TUCEzT8m0E2jZSorOEn2
	 fyXVroj5n85DuN17tsGzfMNy9eG9aj+lEE7GjB6+oopPuDxmNQevNWhNxpwKSZHT0r
	 mL4nCutJUHODA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 21:09:23 +0100
Message-Id: <DFQAB2CZQ3O8.3R8RP5YJ6DXL1@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-10-ttabi@nvidia.com>
 <DFPOX3BJZ09C.1H3K67HGP3HLP@nvidia.com>
In-Reply-To: <DFPOX3BJZ09C.1H3K67HGP3HLP@nvidia.com>

On Fri Jan 16, 2026 at 4:23 AM CET, Alexandre Courbot wrote:
> It looks like John and I have a different opinion on which approach is
> the best to handle the v2/v3 headers (a match in each method vs a new
> trait and virtual method calls).

Unless performance is a concern (which obviously isn't the case here), I th=
ink
the dynamic dispatch is fine and leads to cleaner and more maintainable cod=
e.

> TBH I don't really mind which approach we adopt, but I would like us to
> stay consistent through the code. This patch adds the trait and
> implements `Deref`, but then the chunk above still performs matches.

Yes, please be consistent -- Alex' diff looks good to me.
