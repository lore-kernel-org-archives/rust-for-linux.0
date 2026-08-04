Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBE4377A88
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847925; cv=none; b=MsmxX/hj+yvXC8WzwqIzAuyMS+RwJ/+1hfwtPMzk1CsIh13JJzqlInCSXPciTS5bn2Ow3XEmu7zphAOUD4PylKpqRsadWI0wF5Y+tphhPPN8Wf4FTQmZ4k4F30HPCVW/ecVTVGedGe/381U2EiNj5XD1QDjYMrLGn1z92B3bcVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847925; c=relaxed/simple;
	bh=SKjbJXD9HjcYPbNiDsWG5A9CVjnKnq9Cf53g7XodzJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P62jHf2m/3k44va7/XTn8eNoxjH2KWU33qBTrf3e7MRFK9YcPb7on51/UwpolMauJvu+jk0Ipqqcney8ICut/mXfLBUzrkjSgtOlXbB9/Vw7VlhqNWXGap96PfJktyFkXAej8kq30m6rKkRpFJf4UGG71d7r6HQfwlv2QoVXK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHsqDdyI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHsqDdyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A311F00A3D;
	Tue,  4 Aug 2026 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847923;
	bh=uIDQdLbyTWGfy60CuGiv0qcB+Eb3946GXyDDRMspVFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZHsqDdyIl0C0Zj3tklkVzRaYKvRK4ZrkQnahJYOz7CJ2HLd0geNfSHlr0f+iwx6j7
	 2N/vvW2O62cqY3RHvOLHx2QsxpnJUe8cyGNwBbldRrXMaIE71sVwr/moFTJtfcLZ1U
	 cdWrz3KiTf+HdxWmWA3cbg29Tqm7oAsZx14e97aUf3s5aCHFRg9hne4FHPH5wSDE7B
	 JhQNRye8SRxBDZSfP7o4GC0qZM6nhnZAUNjGCZPQ6JwT/sp81nTs2DuWnUAS5qHwka
	 NYVtJQBd0PTS+aXf+jsK+cClH7VJnnkrqcTknrZuu/aw95bDgs3o7oO/+0WbtXRIr8
	 SsZ5++V9+AaAA==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 06DEAF40066;
	Tue,  4 Aug 2026 08:52:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 04 Aug 2026 08:52:02 -0400
X-ME-Sender: <xms:ceBxauDOknBW7orRNqFoSIEKufMm1SD0rnayR4yOJ0hMj0wnZ8Fs1A>
    <xme:ceBxai5qFFIilj1Z5zXHoxf1o9FUp2PrwilijQqtmqN1gyK5vFbnpZxUqHVulEWw9
    iq6zL1PjEU6HqDNYt7FtdkMspp2ylwdDzU4KZGYrzReSH8f7SGUI6E>
X-ME-Received: <xmr:ceBxanspRb0sqbpf7yM-nzntG6BqWrF7T3BxmpgmJOEVSfpDgjyFJd813YScTorw99VFkdFmf9dzhwIajPQjkNFnvjPmG1jp>
X-ME-Proxy-Cause: dmFkZTEEs6PhN4tsBPGef0X2s1y2juSVOaooRxccuUGgU2bD7gR251oRL2bQjKBQGXiK2e
    hRPVX5TScXYGNfEs9dSitDZ5395d7h4NhNtESMfa6yfng0N+ZsdXycFf/wjX8iUAQsfAgi
    UXBMJkTodDRRLyCOxlNi6sIpcZ1h2b5Sn3EVExTN3hJG6hRZZiTXP7PCQws7KG9WPHuRHh
    RPG4A6+VkR9XhMgp6Jzj0Xs/lfKsD7GPd859U0WEjUSrGCD2GnElw3JusBb8jPnrZnBPxy
    jj4A6PPrygpRc7tlpqeHlEVoGdCIvtrCHRcXzAjJl/dxmdLsm53wGkLR4Ogan8JHX/0hIG
    4qSFrIc6zR+XJgoQU61TfdL2rCQ+N0FkVFYFtR6egp6dQyGiU2RYooSdP6b9SraX3EoQxV
    4wyvXa5ZbshCZzjVtgPCZYm2xwIh7/pyr9dC3r7+k8SWkUpUBLIg8/c2o70rgJcA5aC4wU
    /jDG3L+ez8G5HgDsKpyxTPhk5LffTAscRT86EN1VItkgi/UwCe6w9nAFyLcK0Lc0HWpDE9
    cXbbWsJMaNgQP5aBrZY1tZ6yOeG5c/HB5v3x2iU37ul9S61OmQT75ePn3KqvbYwgvwK21q
    V1GKzOiGm9e/BwwhX4nFPiHkKDmxqEDaYXA8iSV1oPfkQKGXMmXrM0DYqehA
X-ME-Proxy: <xmx:ceBxan5PgrxlFN4XJTaudXWN0uIK5DnoROkBDtO7diWwl9TcQ6-xcA>
    <xmx:cuBxar0ROneG9ogawHViWT0Z0aFahw8RByFAxXuGEhn5a3rG3Yg8uQ>
    <xmx:cuBxaqjOj2Pf2ofpNWcXtSyOpe1LbX-Vc0lb7vLiPfVW0GgCcuc7Qg>
    <xmx:cuBxarpdqStS79ty-rjTvCxnDbK3CBBIH6m1qYtRVaPgbjne3SsHoA>
    <xmx:cuBxatPTW8sLknoOR868yJXHacYWtYIcNTn2e_GPUwa5DsvRJQqbTuRa>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 08:52:01 -0400 (EDT)
Date: Tue, 4 Aug 2026 05:52:00 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 05/24] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anHgcDaChi0y1A7T@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803092910.GD49951@noisy.programming.kicks-ass.net>
 <20260803104321.GL49529@noisy.programming.kicks-ass.net>
 <anFtXgGUiTmqimkz@tardis.local>
 <20260804072640.GL687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804072640.GL687043@noisy.programming.kicks-ass.net>

On Tue, Aug 04, 2026 at 09:26:40AM +0200, Peter Zijlstra wrote:
> On Mon, Aug 03, 2026 at 09:41:02PM -0700, Boqun Feng wrote:
> 
[...]
> > > +#else
> > > +extern void _local_interrupt_disable(void);
> > > +extern void _local_interrupt_enable(void);
> > > +#endif
> > > +
> > > +#else /* !MODULE */
> > > +extern void _local_interrupt_disable(void);
> > > +extern void _local_interrupt_enable(void);
> > 
> > I think the "extern" keywords are not necessary and ..
> 
> Probably, but I like them (and I know that other people hate on then).
> To me it makes it clear the definition is not here and should be sought
> elsewhere.
> 
> The extern really is needed for variables, but I also use it with
> functions for the same.
> 

Alright I will keep them, thanks!

Regards,
Boqun

> > > +#endif /* !MODULE */
> > >  
> 
[...]
