Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112E13AA4F6;
	Mon, 10 Aug 2026 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352542; cv=none; b=Hp+LQgDIIkTCs0sMAMKfxfNStaYXtiKEf4dwH3xlj7qLJVmb/7PQNfExqvU35mdUGuMBgDdcj8fsLVKOTqjjp/G9poKkEr3bk2bSZRsYyZaFBGn8OER4JxHfzJzhnv3MjViHc11qWp25e1UmuvdbhmU+sxdz6bDVYEy+adeQlSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352542; c=relaxed/simple;
	bh=rWel6a9+CJ9FMD8pjuTKi0O2dILs7UXEASnlXNpXF7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5NF/rJWyMRakWh0LRF2QQWGiJMIvKYQ1IrvXTYJuCc4NTMShcyMcLXWnT/0ijff4W/F/B6z4cyCG6N7dCQl9rztPqsSQjfFKjJ39EtkLE3GVzRqMCxoWypeYh/CNm0BjrTpVVmmsScxhR+RhJ2cY1GKndZfYXrwVl5qzpJPjF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TVHktrJr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TVHktrJr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZcGAhj/4YAe5AHXJ5BxsbyGs+QKBPvlzCnjPL06aQgg=; b=TVHktrJrHFzEj74mukwZf6boKW
	xdoX6znj/Zp8RwiPo0DFV1vuXfk/85sNM+IomRsyf79l8dinoexhM3ELyae9OwlQY8xwF2UHmlK/L
	xRZ4tuGK55GIlS8QwcNXZXKj/TYl0eidh+h5xQi+c5cM1Wz1KMNYUs6AoKViVFE3EyJBhtlcfof+4
	IrNXSQlEq833JS41EIvLF01pFf/1mTWWp7Z4P4pyPoE6q5CoSLn36nl/gAXZyFiVCuDpoqsaJIpkw
	mMB5G4EztAWoxBMWgvUykSBBLN7RKiwAx0SMQzrS2V2DvXJT5h5cAWIJbAtHHuJWTNw1nsvATwNx0
	j2Zq0M0g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLte-0000000AgKz-018q;
	Mon, 10 Aug 2026 09:02:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 67D833030A6; Mon, 10 Aug 2026 11:02:13 +0200 (CEST)
Date: Mon, 10 Aug 2026 11:02:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v5 17/18] rust: sync: Add SpinLockIrq
Message-ID: <20260810090213.GG1642880@noisy.programming.kicks-ass.net>
References: <20260807070218.27144-1-boqun@kernel.org>
 <20260807070218.27144-18-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807070218.27144-18-boqun@kernel.org>

On Fri, Aug 07, 2026 at 12:02:14AM -0700, Boqun Feng wrote:

> -pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
> +pub use lock::spinlock::{
> +    new_spinlock,
> +    new_spinlock_irq,
> +    SpinLock,
> +    SpinLockGuard,
> +    SpinLockIrq,
> +    SpinLockIrqGuard, //
> +};

What's this new_spinlock* stuff about? It has sensible naming; unlike
that CameCase nonsense the rest has.
