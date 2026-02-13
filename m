Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F534D3B2;
	Fri, 13 Feb 2026 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770976574; cv=none; b=ftRiES5xPRiLC81cpFaZlXRMsr11R61iW8uV+fiFU4xPpgmcGismMmcaXarsfKTQHztfB8/DY/DFtmDJDN3C7smOTZehSOk4GtifMGH7YjgB5wmqNx8dkHpkbJkc8/nlIjHtOQqlVVivn+ydf+Cl5H/lUGKBExq92+PB7X5o7BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770976574; c=relaxed/simple;
	bh=3oLYaIZI1fm/ZPkHuo5lWZbjCnmxvWIFFyh9TyymLJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDKqAz2JKv11TeTM/PQE/mNYQ7Hr0BMq5+3GiJch6rcfoajR6wgImdoFAfZlBb3acBGOOKYsekZpHaPfgTBBG+IVQQHG8NEFjZyCUEZZnPBcd0LxBhluXA701RFmiZzPTvQyRodHZOIr2x+AsHDOWfSQEheGdLWkThaDpmY009I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EMjZHhzh; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EMjZHhzh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oDYDTByfCr5sjcIDyB46vkL24aZkVlCApIFEkRWzZM8=; b=EMjZHhzhGxvSC5Yf0Q7yLcApZw
	Y+VETKQiyLWLMxF0u7OXabgg9DIcIyYfpTErH1Gi0PFJG9v8EgtWtFUZKTByjh4PiO4u3dv0KPrvI
	+E9sGLu5dEEZD8EmCAKf5kWZ4VisQnLiR0F0j4+JeuhNxauTBPXDILaqTIM8qlOOmLmVrufK1Dh7g
	ChcPiRPd/EU3cHUXLWNpL58ujSNCWcDnswzRfbtaaPefAAnfK1/KQa1Z9lf8au6A0VrdP7qaw23sW
	AfnxeyeM0Mm6C/J0FflXHqDE05mL2UrJ//AFJkPJjXIdh2VM+z8WZpylomLkF+L0y+XzdA4GovrGF
	nrkY017Q==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpu2-0000000C2c5-429V;
	Fri, 13 Feb 2026 09:55:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 44FD33007B5; Fri, 13 Feb 2026 10:55:57 +0100 (CET)
Date: Fri, 13 Feb 2026 10:55:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260213095557.GS2995752@noisy.programming.kicks-ass.net>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>

On Thu, Feb 12, 2026 at 03:51:24PM +0100, Andreas Hindborg wrote:
> When copying data from buffers that are mapped to user space, it is
> impossible to guarantee absence of concurrent memory operations on those
> buffers. Copying data to/from `Page` from/to these buffers would be
> undefined behavior if no special considerations are made.
> 
> Add methods on `Page` to read and write the contents using byte-wise atomic
> operations.

I'm completely failing to understand. What!?

There is no such thing as an 'atomic' byte load, nor does it help one
whit against concurrent modification of the memory you're copying.


