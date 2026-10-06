Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7383D9DB1;
	Tue,  6 Oct 2026 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293855; cv=none; b=OZOsX03MC5vELtl2k/3YvmXlLwJha6VzDkyggEAtZ37gUdK1k2RCr24x47bk50nhUh+Bc/vFVsIWfnZyeEWuFGkvum1XBOJgpSj31JNIUqb+BdagnBmOaITInP0XPQsI6ShqUS+X6kg5LtfB9TRph/xEaVYzMpHG/2HCLtPZmVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293855; c=relaxed/simple;
	bh=lQmcpeBJb7n1ORC0panr8ZuGG2wReezQhX/rqKnx08s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWsw0eYYyHOobLb2x/6Q5hnKfTb7KjLq0u80pu2MejEb0/9xnyItmlcUBqGJjDgps9fgM7KrPCVqdNXCha9y6QDEvHEVH+CW4WTCKai2L0P1xuWEGdwMTleGn0/7d6Rmpj+CL5WRArQrPLn0NFuxmb/yL6xqDo/Q69dlnhq7WaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eZ4QFt31; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eZ4QFt31"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kHQF0W3m9sutLBx2DP4KV8QpdSfbTtfJc8r8atJ6tMQ=; b=eZ4QFt31dcGzTejEv+0uGBP6T5
	b/lhH8slFH2B1FBEgstNIVMZX+g23rSsroiuLvKVjNKaemGxz1ha+8G+Ge+iKONwPAQcZ4VRxg7t9
	BFzo6uUwtJAsjp+diTqcDXwP9A3+NhzbUAfDH/0tqWwyNpM4AMgVr3VtX2TiwLToAmt1ce9ck/Crn
	dnhXybKGTRQok1sLdwWj03N6Sh738aAS4OBaplR32EFvRG8miwAYYaEhqaf8SVuziRsZhQzvO0b8M
	LFtqMgQsGV5d4Wn2I6uBsaTnNs+j3qyZ6NMRvjmZRenn8kGtBt4238OzQNwHQTMrBMLlWSa5JIf/K
	ZyWv+m1Q==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5M2-0000000ADkY-2m5c;
	Tue, 06 Oct 2026 13:37:14 +0000
Date: Tue, 6 Oct 2026 14:37:14 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Corinn Tiffany <corinn.tiffany@inria.fr>,
	"Liam R. Howlett" <liam@infradead.org>,
	Philipp Stanner <pstanner@redhat.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Samsung GOST <gost.dev@samsung.com>,
	Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH RFC v2] rust: rxarray: add rust xarray support
Message-ID: <asT5inptTPITu2j1@casper.infradead.org>
References: <20261005-rxarray-next-v2-1-187f689b52e4@samsung.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-rxarray-next-v2-1-187f689b52e4@samsung.com>

On Mon, Oct 05, 2026 at 03:37:30PM +0200, Daniel Gomez wrote:
> From: Daniel Gomez <da.gomez@samsung.com>
> 
> Add Rust XArray support.
> 
> This is the Rust implementation of the XArray lib/xarray.c. As of now,
> it supports basic functionality: store, load, load_mut and erase.
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
> As discussed at LPC26, this is the version of the Rust XArray that is
> ready to merge for testing and evaluating purposes following the Rust
> reference implementation rule (experimental) [1]. Next, we will make
> progress following the roadmap suggested in v1.
> 
> For the motivation, see v1 link below in the changelog.
> 
> A branch with the patches can be found here [2].
> 
> Link: https://rust-for-linux.com/rust-reference-drivers [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git/log/?h=rxarray-next [2]

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
