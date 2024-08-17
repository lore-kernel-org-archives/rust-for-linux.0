Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E37313D2A9
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Aug 2024 06:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723874406; cv=none; b=iFZP63dY5X6ia2rZUa8ujGu4q10qEvfdwWx6s6umohUNLkx3OdIqYAzJjwwc7q5CC+0ghg8k6S7lWeJRyJ7BRhWOzZQxcxerFvWGDfwPpSH/E7f19gGTYiC9yxweeTzWN1o+ZlrZ8tQ9klo4Br96fxiBDR1n/tEUO8EW38TPCKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723874406; c=relaxed/simple;
	bh=ClHPL5sFncN7E0OsiY0aIvbGPHjjyoszpAlY1kCcHkw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R3So/lmApzHjjHR/pdOggBjYnwPIpmzgyUA58fKvloggRLBArUGIlEMeLh2QT/kYMzp6Z+vksx+WiK06gpV2ul/8txF1VLF1BGcXY4ABoQGUGzYuiXX1keFGkMABzPVErCdXwKqku5SWP3wn5OVgsGO+ksfoUpwpRE9xuu/76Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=XlSylA3r; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="XlSylA3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723874397; x=1724133597;
	bh=7pUWwLsU9+xxEd0s1ULlFBXrr/hVoB7oCxsFR5yXLCs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XlSylA3rqzuJI2amuMLlDAMSUEedlY1hjz+dP8FcNF8GrkP2Glth8MBFeoMMJkRzT
	 90hFyoGp0uHNiJ4qZt9z5UyUKBwvGnnNKsqPg6B3E7ZCzOQGHI/O2xfX3yCv5p0gzv
	 ZiXtd31tSieFwP3KkxHT1+4Gf6/kZcJcSUkPWMv/ViRi7+oxbF41tVkW3ivwGKJlwy
	 ywP3gi0PRG+43QE0snzIMh1SL2WWBV0w5xV01nXlKzc7lGMFxdpjnAscrdIIFI15D6
	 1S3eAKgt7XlMwaC+x7CaRKj1Fivcu4LnLubTvBXczVNwTnfy5MEJ3uvwEkGiWJC4b1
	 9EWtmjAJx2Pig==
Date: Sat, 17 Aug 2024 05:59:52 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v4 2/6] rust: net::phy support probe callback
Message-ID: <68f93bce-268c-472a-aa7d-fb5cf26bd210@proton.me>
In-Reply-To: <20240817051939.77735-3-fujita.tomonori@gmail.com>
References: <20240817051939.77735-1-fujita.tomonori@gmail.com> <20240817051939.77735-3-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 77b2a9fc391323bab9bf1bb5164398e109c56bc6
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.08.24 07:19, FUJITA Tomonori wrote:
> Support phy_driver probe callback, used to set up device-specific
> structures.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/net/phy.rs | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

