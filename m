Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1981FA829
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Dec 2024 10:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134933; cv=none; b=l1hlX7jAFhr5QI4hFXqGOZBBPRbGmj1+b7rLZZO79PGXv6exw4jaFUcg/0wbsZkpvlv9qtany2kakU+TBCox521CFkXoTofqYrRlFj2iraOaLYlRUHchzzjCMfU5HZoyGqBMkqAXYBDW7WNJ9iTLpU9RFfTPsKpTEb1eGmgQR40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134933; c=relaxed/simple;
	bh=M51u9e5jE3KCR+JEQJyVq32G6uTWpMD2p8at7f7iNmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=susbyBHJqtUlJ/JZVN173/W0/KYDlTEg5F4+HkyCHjnb1Lx7eUZVB2BvHMa8b+eUwsVM+UPBEjPk9RnxukAyGFmkXjZhZMVI3mtVISSvT39LgTtLjzmItzY0Fhj4gJVOvSS6/pAR73tG2zHwKdluhGc0t8sc3nGk3sqkq5JijMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os75Oc7A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os75Oc7A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E692C4CED1;
	Mon,  2 Dec 2024 10:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733134933;
	bh=M51u9e5jE3KCR+JEQJyVq32G6uTWpMD2p8at7f7iNmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=os75Oc7A09hbflvGmiiQVRCHO2H/Jr3iyTp9PyCRfjTLESXqyudsas7IYnhDp7sDN
	 Mk9hFoJCZbYWna1dEd6Kp+sWZj7saJmRVYKpZIs77L9/H1U+s/afjr/oScWVroER6u
	 PsgBWxmEd/4x1SWDfCKMzalnC/caQInLkGZ+Qg0jQMRQfHNXd5yT6AN139Y2RUA23V
	 UFxZ/OhL7IiKRbg3DFZR0fZp+R/GQyU8UAXnJ+AN9XwcdiBUqMoS0d8qGQRvEtjSN4
	 H7m1zhjJXGfXubbIfF/50m5bX1/qzlRAXN9LumcPIiULQ9A+Asbl5pMi3Wk6HLQl44
	 ULZj2kj07VHmA==
Date: Mon, 2 Dec 2024 11:22:09 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Bernhard Kauer <bk@alpico.io>
Cc: Greg KH <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: introduce KVec::pop()
Message-ID: <Z02KUVQ4GEKPKa_H@pollux>
References: <20241202085758.67319-1-bk@alpico.io>
 <2024120251-plank-rinsing-e63b@gregkh>
 <Z02D7Gg_cuMKPgxQ@mias.mediconcil.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z02D7Gg_cuMKPgxQ@mias.mediconcil.de>

On Mon, Dec 02, 2024 at 10:54:52AM +0100, Bernhard Kauer wrote:
> On Mon, Dec 02, 2024 at 10:06:58AM +0100, Greg KH wrote:
> > On Mon, Dec 02, 2024 at 09:57:58AM +0100, Bernhard Kauer wrote:
> > > Provides a simple stack together with push().
> > 
> > Why?
> 
> Sorry, I forgot the reasoning. 
> 
> Updating to v6.13 broke my external Rust module due to the switch from
> alloc::vec::Vec to kernel::alloc::Vec.  A trivial /s/Vec/KVec/ fixed most
> cases.  However, there is no pop() or any other safe way to remove entries
> from the vector.
> 
> So it looks like I either have to stick to unsafe code or add the
> functionality inside the kernel.
> 
> 
> > >  rust/kernel/alloc/kvec.rs | 28 ++++++++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > 
> > What in-kernel code needs this?  Shouldn't you also submit this when
> > that happens?
> 
> Fair point.  Unfortunatelly my code is far from ready for inclusion.
> Would a samples/rust/some_example.rs be sufficient?

I don't think this is needed. You're providing an example that can be executed
as KUnit test already with your patch.

This is a pretty basic function and surely gonna be needed for other drivers in
the future as well.

IMHO, *for this* it's enough if you have something that aims for inclusion
upstream, as long as you reference it properly in the commit message.

- Danilo

> 
> 
> Thanks,
> 
> 	Bernhard
> 
