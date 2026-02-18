Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDA0266581;
	Wed, 18 Feb 2026 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410056; cv=none; b=I7t49fzAGKO/FAltnqhAlocl21PPVpo2Zvex7bDeeLIBQ5i///mQu4hE5XySJ/LtxFtbn8KCIAeUjAGeTaCsrBgLQgUD4HP5CKcuLpYxmTbzP0H9GqoJquFJhS05P5YNEWXbBKopw/XpmGYIJ2/L0+AYpqiQj1mBLnNeD1SLhvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410056; c=relaxed/simple;
	bh=JFTKsCcioXGz6pJQKy6XDDUdoafS7Q7+xXSqsJQGNZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hep/jNpkmdORk9l0brOMs8E15fB7VOX9BLOzf/9GsLtedFCayAid+502fEyDzIpY6k2Ay6tI7TASnI9rnWqk9JTOr37r/O3Rt7PXGvyC0eZefenw8IGkSjINyafuJDv3u2cMNbBFsnjnHe1AqepBVDZDW+IizfGiNESezC35xaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l/2zQYX+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l/2zQYX+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3Mvt7uGvnB+vId/or2IkyiRiQBX7EgdHITq/A1Okw/0=; b=l/2zQYX+WjoCZHG1iHis9Rcgro
	0c0XPqszsE+bHq0QlHfg9CVjzY5RK4GSvUzTanAFlogh1bMWyLgBqLz59DyTNSKsxPCc+FNuJgpz0
	jbV0KvkdifSKzhZaIY529D5h5hhLjthcDi+lxJR2vOyXkAnkdOLbt5LdPOoghljkuZpicMsVqHcJK
	CtEKgBs/JGaJzX8beRVfzbgwMDZyg18+lew+G4aG7TEbzuQg9DxcS4nJqy7X8CmGJ4bJzbZgMxvPq
	VvCC/UhnHl8wWHHhuD+F39MTTLhwjqzaVF049a9NVkzrPfCkJCfPXi0rHt1KtYApXj14tAHz4twxN
	BE8XqRHQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsefn-0000000HFHM-0Lhz;
	Wed, 18 Feb 2026 10:20:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 952E03031D4; Wed, 18 Feb 2026 11:20:45 +0100 (CET)
Date: Wed, 18 Feb 2026 11:20:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260218102045.GD1282955@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aZRY9HthKwVJrAf1@google.com>
 <67aea464d25c8cafb3113eea62c8221b@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67aea464d25c8cafb3113eea62c8221b@garyguo.net>

On Tue, Feb 17, 2026 at 11:10:15PM +0000, Gary Guo wrote:

> If we have this in stable, I think it's sufficient for LKMM. However
> for Rust/C11 MM says that volatile ops are not atomic and use them for
> concurrency is UB.
> 
> I recall in last Rust all hands the vibe at discussion is that it's
> desirable to define volatile as being byte-wise atomic, so if that
> actually happens, this would indeed be what we want (but I think
> semantics w.r.t. mixed-size atomics need to be figured out first).

I would strongly suggest for volatile to be single-copy 'atomic' for any
naturally aligned word sized access. This is what we have with
GCC/Clang.

If you pick anything else, you're explicitly creation interoperability
issues.
