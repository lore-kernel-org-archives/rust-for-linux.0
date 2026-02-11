Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EAB770FE;
	Wed, 11 Feb 2026 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770814304; cv=none; b=dreLEyCbrQ/8EX/9jaCvmu/s1uw2VlLjkzyvSFVeaQ3sVCfzD4kSnYcJFlItbUB1CfPHiJ6T9KZ65wQyiL4p+NxQXntYVrzbrYFUNFGQaqUbvwNlOMJZL9Kwd8BGZhN590ger4T94svYnZyj4AF4OP233gcTncfbqW0bXgnbncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770814304; c=relaxed/simple;
	bh=K53TCidAe2g86Oevr4bOClP3tU10/JwqJIp3J5TcnvM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LpdTLuGO1MLBJMcgGl/kzYpcCLnnwvvdp3iiloclkXyxzteKI2g2GTLA50aw+fXA0kdZRJL8NhwtqnxdYRBdfaDyl3KRUGha8U279i/IHJ5Q30n2X9xMemzvwOHBASZDM/Al83UByYcD9izkxJxO5qrPmqy612L+ygUuCPgorVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HLfB4qUS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HLfB4qUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770814301;
	bh=K53TCidAe2g86Oevr4bOClP3tU10/JwqJIp3J5TcnvM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HLfB4qUS+48BS8ZG4YcAybKfWz/CMSzy4GSN9B8vmGsx+ePOBIEcq+L/wQKjZqLyh
	 yrW4S/34JGEb5hBVu7U6ogQm1Ld9fop0f6ypbv1EDbB0OennY1VaA+6KU02CpM8Iy/
	 hfyYJfeL0PhDo1ORJTA41B4E6FQxsQ/D8XXkxKDOIN7t60ypjvNH/KcXA9rWIvK6cx
	 Y9FGecgGX0/qXgVDI92gIg6Nm8FU2udxQs6KeiftV+CZ/nxH+XL8dpGwq0PWd6cBa4
	 /SaiFHkt5k7LH0tF+Z+pDC+8D2kYEYAdvXU1RANr7Ud/8pwZqWuxEI7H1Kkm7P7iQk
	 2169ToIBQpdgw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2691717E110D;
	Wed, 11 Feb 2026 13:51:41 +0100 (CET)
Date: Wed, 11 Feb 2026 13:51:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alice
 Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Message-ID: <20260211135137.25242462@fedora>
In-Reply-To: <DGC4VCT5JRD8.32Y99ERIGUTSW@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-5-phasta@kernel.org>
	<20260210155750.5cdbe6cc@fedora>
	<8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
	<20260211120742.0e9e7122@fedora>
	<DGC3B6XIY3DW.M3CRU3IAUKOJ@kernel.org>
	<20260211131015.7bf38cf9@fedora>
	<DGC4VCT5JRD8.32Y99ERIGUTSW@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Feb 2026 13:32:26 +0100
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Wed Feb 11, 2026 at 1:10 PM CET, Boris Brezillon wrote:
> > On Wed, 11 Feb 2026 12:19:04 +0100
> > "Danilo Krummrich" <dakr@kernel.org> wrote:
> >  
> >> On Wed Feb 11, 2026 at 12:07 PM CET, Boris Brezillon wrote:  
> >> > I try to avoid using concepts the language I rely on is not friendly
> >> > with.    
> >> 
> >> It's not really a language limitation. For instance, you can implement lists the
> >> exact same way as they can be implemented in C. It's more that a memory safe
> >> list implementation is quite tricky in general.  
> >
> > That's what I mean by trickier to use, they are because of rust safety.  
> 
> Yeah, we agree on this. What I don't agree with is the "avoid using concepts"
> part, because it came across in an unconditional way.

Well, I guess that's me approaching problems differently then. I
usually consider that, if a language makes my life harder to do
something, there are good reasons, and there's probably alternatives
(with different paradigms) to do the same thing. At least that's my
first reaction. It might be that after further investigation, that's
just how it is, and I have to live with the extra complexity. But yeah,
I stand to my original statement: if something is complex, I'll always
investigate other options before going for the hard way.

> 
> > And again, that's not a case for saying "nah, rust is not a good fit, it
> > can't do easy-to-use-lists", but rather a good opportunity to think
> > twice about the containers we want to use.  
> 
> I think I never implied that you were saying anything along the lines of "rust
> is not a good fit" in any way. No idea where this comes from. :)

That one was more referring to Philipp's reply, where he was saying
some people dismiss rust because of lists, and I wanted to make it
clear that's not what this about here.
