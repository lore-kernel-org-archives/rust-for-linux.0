Received: from mediconcil.de (mail.mediconcil.de [91.107.198.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA661F949
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Dec 2024 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.107.198.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133304; cv=none; b=CPFIqbsSLvq23GwZoQ78vXPkq0AIxn+Xa3vsLbOz9wSou0qpGoy+vwgs8pJFk/2kTOGBpZTeyUOMcOt1P+4e7zPOAyPxY0Qaeyfua93jsBU9krjcxMBb/uownAXp02/rskVAoyU/4uWYDQWq1kuHTjDX8JZeIX1/WlttZSMYVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133304; c=relaxed/simple;
	bh=uEeiyfugUMbJ66h3ZYLoeSPYbuOMlnoX6X0i4Qpckf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWjLN7PDFhHNqKbekvDSMoIvltiRoVcgZ5UyFrNcbo4+Wsa49W96Yyqqh8ofvXZUYngs2anzfWrzQbBySYdVDjVKvJSwBOwpMImj5JXJ0V10ZBuSk+Qn21hse+FmMGDVt7HQRw4hO431/vqjiWuzxfR5eBR1uC1GsgL1lxsixis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpico.io; spf=pass smtp.mailfrom=mias.mediconcil.de; arc=none smtp.client-ip=91.107.198.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpico.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mias.mediconcil.de
Received: from bernie by mediconcil.de with local (Exim 4.96)
	(envelope-from <bernie@mias.mediconcil.de>)
	id 1tI38m-00Dx8L-2G;
	Mon, 02 Dec 2024 10:54:52 +0100
Date: Mon, 2 Dec 2024 10:54:52 +0100
From: Bernhard Kauer <bk@alpico.io>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Bernhard Kauer <bk@alpico.io>, Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: introduce KVec::pop()
Message-ID: <Z02D7Gg_cuMKPgxQ@mias.mediconcil.de>
References: <20241202085758.67319-1-bk@alpico.io>
 <2024120251-plank-rinsing-e63b@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024120251-plank-rinsing-e63b@gregkh>

On Mon, Dec 02, 2024 at 10:06:58AM +0100, Greg KH wrote:
> On Mon, Dec 02, 2024 at 09:57:58AM +0100, Bernhard Kauer wrote:
> > Provides a simple stack together with push().
> 
> Why?

Sorry, I forgot the reasoning. 

Updating to v6.13 broke my external Rust module due to the switch from
alloc::vec::Vec to kernel::alloc::Vec.  A trivial /s/Vec/KVec/ fixed most
cases.  However, there is no pop() or any other safe way to remove entries
from the vector.

So it looks like I either have to stick to unsafe code or add the
functionality inside the kernel.


> >  rust/kernel/alloc/kvec.rs | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> 
> What in-kernel code needs this?  Shouldn't you also submit this when
> that happens?

Fair point.  Unfortunatelly my code is far from ready for inclusion.
Would a samples/rust/some_example.rs be sufficient?


Thanks,

	Bernhard
