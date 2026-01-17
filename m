Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924204A3C;
	Sat, 17 Jan 2026 12:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768654416; cv=none; b=bAMSegoD3HqWdjbn/iHWoUqUaywd5M6XcoDwrpZ5YFBK5/mBIbuex2dRLeFk1IZskS+XAwkHl6v+UahbPv7WFfplMnhewRlrHNTdRVN0KyP5RYa72BYpIVOiRsG6tJN1x6DXt9ZuE7IfWL7zecXzAIKoo/WP8bH55NN1KdpH9TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768654416; c=relaxed/simple;
	bh=pRNi6AkxLH0mAfdj3yn69/e5sljxPgp+PznlEPPuUAc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tUiV8289UJHYyVKKJ9zyhqqqpvvtT65PqeI0e0Bjeix9G1ttrXsedMGDQ9JZ2MNM9aKHU7023QVtemM/86ct5iShsysmu47qUcvnjbdjg8wvvO/KcC6ULKTpVuT5ylkZM82IqVGIUUMA8QlanIv7as0G9QvaR3gJtjnxDpW5u+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIIQYGKP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIIQYGKP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8602CC4CEF7;
	Sat, 17 Jan 2026 12:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768654416;
	bh=pRNi6AkxLH0mAfdj3yn69/e5sljxPgp+PznlEPPuUAc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=oIIQYGKPiLyONdUIqRV7MNXBHLXWkWaqfv36poPtojiE0FEbvD2Tl+AJ2SKMZWuJi
	 y3NhllrptNb9rVp6bvNlmWOrQC9M+2q5RFdmF9kaRitX5xle4VnYm1RsDiwhQAWkox
	 hi46UyChIZppeAvEzq9lFjcp6kYMzTloyDIFGnlzd6gOX/I3/kCTGVamd0JD7kPHR2
	 RgwXt4yBTpgZVwA9r1OcFkoo8YgDhGZoSh2lXlG4Kd6h2wLtUkZy4XGXdkzVukDfUJ
	 5+EM3s/1Ii3UlnmwaC83CXMb1mdPX55oa26azcBmyJm68M5NV7DgzSGXhhrQyETf3c
	 VUKTYn4AQBN3g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 13:53:31 +0100
Message-Id: <DFQVNVYZCDPB.3IB8IA2KWUD4B@kernel.org>
Subject: Re: [PATCH v2 1/1] rust: simplify `Adapter::id_info`
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260117094710.24301-1-work@onurozkan.dev>
 <20260117094710.24301-2-work@onurozkan.dev>
 <2026011725-contour-salary-d3d1@gregkh> <20260117140240.15d1120c@nimda>
 <2026011703-bony-unloader-9099@gregkh>
In-Reply-To: <2026011703-bony-unloader-9099@gregkh>

On Sat Jan 17, 2026 at 1:07 PM CET, Greg KH wrote:
> Does clippy complain about this one?

No, it does not.

> I don't have strong feelings either, but the original is "easier" for
> those of us used to C code.

I think it's a matter of preference. Personally, I like those functional
characteristics of Rust and the corresponding possibility of compact expres=
sions
as long as it is not overdone.

This case seems pretty simple though. :)

In comparison, this is code from allocating the level 1 page directory for =
the
GSP (radix3) firmware, which is probably a bit too much.

	level1 <- {
	    // Allocate the level 1 page table, map the level 2 page table onto it=
, and map it
	    // into the device address space.
	    VVec::<u8>::with_capacity(
	        level2.iter().count() * size_of::<u64>(),
	        GFP_KERNEL,
	    )
	    .map_err(|_| ENOMEM)
	    .and_then(|level1| map_into_lvl(&level2, level1))
	    .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_K=
ERNEL))?
	},
