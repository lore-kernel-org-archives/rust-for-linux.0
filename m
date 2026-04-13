Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5851D3090C6;
	Mon, 13 Apr 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077709; cv=none; b=BRagPfADLOwlf2SPxsvldjsyITm+HUMaN4bwyYBhw/tUNFeDLi6Gd1rgyYCrwCPNBdKfc658JOBRx0Y8gH5YFarR55QQrDNjEdKZ8mv63BptngsORPQcrKoUF0sPTOwNhPaXNrj4k673mEZOvysM9bsvT38O+AYlEcXklB0nRmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077709; c=relaxed/simple;
	bh=mebjK2cAZrUdQlTQQgV1HIxyCDUGl4Xmv1vG2uJF1K4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=jofEha+GPthxvvJQDa52bY+o4Rn0xMu9tgHy7Wyi/YA/bNjAcbxhh8odq/3iOj0rLUWLPNwiWE627lH6a3AT0LLL2pqygk6ymBIFyU2g9QKGCb9vDMMpxrrpaRMlnCzGytxN84Ni8TwCCaNWEeNSdDoqanJCn8sCwlN8A4KoWHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KseREcQp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KseREcQp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F35BC116C6;
	Mon, 13 Apr 2026 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776077708;
	bh=mebjK2cAZrUdQlTQQgV1HIxyCDUGl4Xmv1vG2uJF1K4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KseREcQpkmqkqhkMpCnL31tO460Y0QOb8s2k5w1zFFWtKkUXjLOFLi0FIK7tdC7w3
	 WBJCA0uR3GKWCaZuQiEQxGdp4ERDeB29b3a9cQNaBBG/4R+PWqOea1hGsTFmMbZo+W
	 iAhuwJQdYkaBG9M53Sohu5Vi1egAWWgAum5hnT8ppzAJdtsedyqb+mwpJpOomdgv9y
	 KURYonPrFAXdDjkYevJnc2JThOsjP02XaX4HFQgc9Zw43jcrwO8sDjT5PAtmoeNgxp
	 VjbPRQorhFEZV6jewHmZ9240DKM9NcCVr4an762CQ7LqJsu4VIXNeVuT4WAREYGbA8
	 Nw2KypmLfn/kw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 12:55:04 +0200
Message-Id: <DHRZ01R16ZXR.3T0D56PREGR18@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fb: make sure to unregister SysmemFlush
 on boot failure
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260409-fix-systemflush-v1-1-a1d6c968f17c@nvidia.com>
 <DHPLKB40FM08.1L3H2S589WUW@garyguo.net>
In-Reply-To: <DHPLKB40FM08.1L3H2S589WUW@garyguo.net>

On Fri Apr 10, 2026 at 5:57 PM CEST, Gary Guo wrote:
>> +impl Drop for SysmemFlush {
>> +    fn drop(&mut self) {
>> +        let _ =3D self.bar.try_access_with(|bar| self.unregister(bar));
>
> I feel that this is the wrong solution to the problem.

Yeah, it is pretty fragile as it relies on outer implementation details, su=
ch as
the fact that SysmemFlush is part of the device private data and hence
try_access_with() will fail when not dropped in an unwind path.

> The thing we want is to *ensure* that `SysmemFlush` Drop is called with d=
evice
> still being bound.
>
> It's not yet fully clear to me how we'd want to guarantee that, but one A=
PI that
> might make sense is to create a DevRes API that allows you to reference a=
n
> existing `DevRes` and have driver-core making sure that the tear down hap=
pens in
> reverse order. So inside the `Drop` the `bar` can still be unconditionall=
y
> access.

Yes, I have something like this on my list of things I want to look into fo=
r
while (my list entry calls it DevresChain).

I want to leverage the internal reference count of Devres for this, which i=
s not
exactly straight forward, but should be possible.

I will prioritize this and have a look.

Thanks,
Danilo
