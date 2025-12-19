Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143C73446C7;
	Fri, 19 Dec 2025 15:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766158068; cv=none; b=DIIOYfNIaGleYLRHfmfq9MjyrK9kUU4XIquWMK+THoPujW3osOvk51x9M0bie5VoljFgfwgX0VMTW/ttSotbD5DbxNgSRkV7z/M2wTKbAvvBBClXM49M+gZveBy2jIz5QT0ejDuIXYSBx5W9koEam09HBnGKZgALmag9d4NBTqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766158068; c=relaxed/simple;
	bh=Uhsnqls4yZ2FtTg119wqQBE9SzpCbIHrU71KeMrbDAk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oUVVvmkbwFVqN3lzMDyMPdnPIetSJQEdsDCq1l7c6aCcQn1w8P2YqlfP3CPLZsfe4f2FxJw3fb29JcqCFsgmAs08AsbWwy4yFa/nFjPkgci43LjNFuRQCPtY7D97PU0yNwLh5lPrkkjOeIZ612P0ygqKf/mp1U9hM+jRW7Gmkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pKdvdyer; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pKdvdyer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766158061;
	bh=Uhsnqls4yZ2FtTg119wqQBE9SzpCbIHrU71KeMrbDAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pKdvdyeryGRVMBfv709CDYYmO0cuRXd2BnCxxG4w+ZSddK9HBwFqTUsEMxuTF12u5
	 CDo58VONE+RyJQ0KGtQqMoSvSz3Td9A+4trRs2+8K1Nr8eoNOKseJ9Bbxsfyt0FHeG
	 mJzd9g2aylzV55QtB81eE6ZjcWQVV+gM86qgdESR7+TjSL8JDgyWhV4LWQ1hjMpPxA
	 6QMeBLKcP0THsmy3BNAGYlWzBJ9oF8sfGN++CjXlnGoOvRI9VZkIweSUKRC9sG2ErH
	 G3Fa5qYy2qV3jIrhiI09Dn/7xgYNflu+s8wYLQbdaocxocHIe4rdFmAMu5sB2x1h9e
	 WeBeLz7yyb0Xg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD80E17E137B;
	Fri, 19 Dec 2025 16:27:40 +0100 (CET)
Date: Fri, 19 Dec 2025 16:27:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Will
 Deacon <will@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Joerg Roedel <joro@8bytes.org>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Asahi Lina <lina+kernel@asahilina.net>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 iommu@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v4] io: add io_pgtable abstraction
Message-ID: <20251219162734.46f3aa9d@fedora>
In-Reply-To: <20251219151434.GI31492@ziepe.ca>
References: <20251219-io-pgtable-v4-1-68aaa7a40380@google.com>
	<20251219140557.GH31492@ziepe.ca>
	<aUVje_QZvJ9rjedp@google.com>
	<20251219161153.420d1c46@fedora>
	<20251219151434.GI31492@ziepe.ca>
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

On Fri, 19 Dec 2025 11:14:34 -0400
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Fri, Dec 19, 2025 at 04:11:53PM +0100, Boris Brezillon wrote:
> 
> > There's actually a confusion between TLB invalidation and L1/L2 cache
> > flush/invalidation. The things we can decide to flush/invalidate around
> > map/unmap ops are L1/L2 caches. The TLB invalidate, we don't have
> > direct control on: it happens as part of the LOCK+UNLOCK sequence, and
> > no matter what you execute (map or unmap), you have to surround it with
> > a LOCK/UNLOCK to provide support for atomic updates (GPU is blocked if
> > anything accesses the locked range while an update is on-going).  
> 
> That makes more sense, so these GPU drivers just flush the entire TLB
> every time they change it - built into the UNLOCK operation?

I don't have implementation details, so I can't really tell what
happens internally. What's sure is that LOCK takes a range, so they
might be optimizing the TLB flush to only evict entries covered by this
range, dunno.
