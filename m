Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9843220C00A;
	Fri, 17 Apr 2026 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776388706; cv=none; b=bApCq+OQ6lmp+Wu3jGoG2aZVaj/YF0B3R/uABv5TDvxTyaYI+/uf1dEsdfTmnDrb/U2O+yoMlj6ASwVwbGsDmo+v0QutPIwfXZwRecIUJSXA8ADXaA7lxGINvI2lTZZBShOuP9hBuYgGNmBL/NS/fWRUrVX1XKCBk0iMZ7w9hlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776388706; c=relaxed/simple;
	bh=miRN4NC3hr3ISmHABRIkD2RmGZ66ViNlmrlEdEwVf7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLhnSyy8EeRcrYsD3dWz8ngX0Q9UOuR1NLyYnazHTxQnx4npiU30ktFNLoY1+XpC58JGXObVOaVZwGb8d9Wv0hHvKukDhAvyYCbj3PRAkoh+nNCe0zih4QrXQoV7yA2p99l1torsfzTWPsFChr3g3vPb4Sq++f+TsxBKyJ6QmHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YdZitlzn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YdZitlzn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1/hLCjf1LkKv++/y1U+kPpQt2rmVF3YwKhObRQeHZ30=; b=YdZitlznHrZ4XLOakiMIyiGJZB
	1rxb7QbiSt+iDULpwGYbbQMMWCSZoZvPmRgvK8H4Xz/2THb6hE2kP4xSiq1myR8Pe0rA5ckCb0Xuh
	1/7SKbETw/mk49NvoOIZG8X/ur2Q+52qLT7hWtHLZHOvwxDj3lz4UwtUfeOzNGHn8h25Epg7mA6Wb
	/cyPgt7ZYr29F6EfiG0B4pcgwCx4QpxysWM3piU+DRUvLDCjwtZi0aggWSc/NrSLl1LBwMgSvoRau
	1cDI/r+hVB9wwa5m713KVwg6G6O1FuGURVSxkX03n3bSXruMQ/LmzgoqO1InyVOAthcM/jkb/JYVS
	ooxU1hQA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDXqO-00000002Ves-2FTv;
	Fri, 17 Apr 2026 01:18:04 +0000
Date: Fri, 17 Apr 2026 02:18:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 4/4] rust: xarray: Add Guard::find() helper
Message-ID: <aeGKTIRFgBqHNI9S@casper.infradead.org>
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>

On Fri, Apr 17, 2026 at 09:05:54AM +0800, Alvin Sun wrote:
> Add a helper to find the first present entry in the XArray.

Why would you expose a function which does striclty less than the
underlying C implementation, rather than exposing all the functionality
that xa_find does?

> Returns the index of the first present entry, or None if the array
> is empty.

Why not return the value found, like xa_find() does?

This is all very troubling.  I don't think Rust should depart from
what C has without good reason.

