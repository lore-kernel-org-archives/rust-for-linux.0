Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E857380FC3
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776988; cv=none; b=jKYhGWRymxd8c+1O8St7c3SjrpyKrOfH2cmMEyWh6JkDogGyDPEx8LeAxxvfkZ7jm9Vy5ur1ZvhYk7wnbm4Y0/E5VgMj8HMul/ZXYGxeJwuzjk8x3ZDszvrM1zLqQ5KeUwtrSyPbt9Q2WpObRsMwaPzm324JQjjurjGzDOVECM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776988; c=relaxed/simple;
	bh=yPUhbRb3hhX7p9ZpWTtPi0O+ICvAPOZCb6fmW7ePP/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mO77rZz0nEpWzoCnPcUYaBSQNNxDb9CwQ9TFdss/eYNX76KfNBNuhLVakFinCMFbunl6I5TMtCFgIe/SC1kojxfARQUfjeNEsIoXkEcpjH6EPN/LUjbwFpY8SWw4zV7IYOjD3+MN+vXeqSIbVRjq8Ble3fSP+tZT1k7Dm0VEJn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xhsn+/XH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xhsn+/XH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBA41F00A3D;
	Mon,  3 Aug 2026 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785776986;
	bh=HJ4pbSYFDmSNH/mFfgHb3QUeZ/ZIA6/RFq/CXxX5pI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xhsn+/XHbCpCSiOcw1h+OKYw6bUfj/B7OC51wsvtHHlyF7a4+VfkOqfjLalRJPe6A
	 a0S78QkxhgFCe03lx07J6UzEapWRydpSZYnch1KKZYQqesDvjyCb37oi2CvH7n4+1k
	 4scCkJeFe2pGFavH3ePZ6F6dQEPhOOY+c95D4JWFn/IBoYTkuXLDt9ZkKBsDDsH0+J
	 JnNY/3RoxEG05KO+B7gaMtko+U0XPVDpDVOFYJeD84rMOtFK6eI2ZF+gOF6z8Wd2or
	 hy4KqaolKZHVaOB6rPrNs32yDrBwa5FRwWa6VGVpvCSC3Dg3P/UHFj9Bw4sNUxHsgg
	 PoXi0AiffNZ+w==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 67221F40066;
	Mon,  3 Aug 2026 13:09:45 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 03 Aug 2026 13:09:45 -0400
X-ME-Sender: <xms:WctwahhN9CjLi3iJqYoOuECYPyl8TPy3B1BATSWWtqEQXpIWw43N4w>
    <xme:WctwarOq6P9ttw4K_wXZibPEBy35NuSAsw2ChAhkyd-y8Id47lgHZTFicd3CZ_oAz
    JSuuRrHsexGoV6ZokBv0QwTR1h0IsxiKGAlDEgj8Q3q99ME4v154hU>
X-ME-Received: <xmr:WctwakcI3LV-PSMV_6jYDrSA3-x_SncHJf28_dEv1S5SC1yVc1ZMZMMstDLg_lyyXUTuyvkZS11qYrpYzS7dA1MKf-TzG_bt>
X-ME-Proxy-Cause: dmFkZTGWEyGumjW/6lh12+07q957ttryP/EIZQX/zs3qGm/pSnEpSFbbiWJKdJ0zJsJHYS
    cr9x0Hl3V695jazyF60mxQf0WjSxGiBRkO2y+7gRv4fL7oG77Wj+Db1GxK94l88aA8lUlN
    m8NRZaSMmnnJH5cUXhMVCGqStNzqiigZ/2asXODsS70qLqz5hwFeZwIDft7QdmGpbK9k9Z
    IpeFP3NjTTf+PoZBk+ILtSuc0zPXztHmScnzPo6/YSMZK8khrpPFO25oxFwQP9g8tpS3jU
    GVW+C3qfHVTt1tHqcGCPc6BdnZZnF5kxmq5u5OilD3O08zv/IHAUKTKLLd8tBjTG/1zbU6
    Ehv4RyvId8NF/1b7goW8GVkFYnXPlWKpK45Uw6GogL3bSu3K7VuhTDhwJ2R8anQgDLTX93
    B9lnK7DcCqtu4vrhTnI3B7zOEcnWfnmvId9UKIEIHr+buivZQrbIOR1qahR8QF0ulFzXNI
    WSCU17TjKkq5MYXn7PEw7fzPyGhojmExjdnEEyWOkox3SOQn5zaiHDEABhoal0Mo+o0+8V
    9qCQFDXpcMq6C/MwplWocTmuwxDAWwvkWBWCRGXMVxmmJ67eDaVgCqAOYpq9j+N/p3Os0X
    tTBTOKhoP/nazlzk5+sFy9VHUP110+e7AW9gCZi5BZv1XQv+CKBU2usAC9Gg
X-ME-Proxy: <xmx:WctwalyPse8BK2a-ThQ5Yvsnpld2hJem5V1TV9rEZd3PVYeHI4Bn8A>
    <xmx:Wctwap1Fsmg7_Kh-c66RfhbVnXuaHshcg67zGzLqW8-D700PC_U29g>
    <xmx:WctwascxD1Is9qjWb5pzovH9nsa8Bn_8aATNZfSH4TjNYHfWvVQxhw>
    <xmx:WctwauWMYE8KFkv4gHPaYzxbJyPDg9yTlXhZ2cPgLL3KDahDvAvInA>
    <xmx:Wctwak_QAos9KRiPXmkj1x8NGYikx_aQGXpDdgLNiQNyTKKhq8aD1A3u>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 13:09:44 -0400 (EDT)
Date: Mon, 3 Aug 2026 10:09:43 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 13/24] irq: Optimize reschedule check in
 local_interrupt_enable()
Message-ID: <anDLV6WR-y-unEga@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-14-boqun@kernel.org>
 <20260803114128.GD687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803114128.GD687043@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 01:41:28PM +0200, Peter Zijlstra wrote:
> On Fri, Jul 31, 2026 at 01:30:14PM -0700, Boqun Feng wrote:
> > In local_interrupt_enable(), we could avoid re-reading preempt count
> > because of should_resched() by using the result from
> > hardirq_disable_exit(), however this means __preempt_count_add_return()
> > and __preempt_count_sub_return() need to return all the preempt count
> > bits (including the PREEMPT_NEED_RESCHED bit), since the only user of
> > __preempt_count_{add,sub}_return() is hardirq_disable_{enter,exit}(),
> > hence make them return "unsigned long" to optimize this.
> 
> >  static inline void local_interrupt_enable(void)
> >  {
> > -	int new_count;
> > +	unsigned long new_count;
> >  
> >  	new_count = hardirq_disable_exit();
> >  
> > @@ -52,15 +68,8 @@ static inline void local_interrupt_enable(void)
> >  
> >  		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> >  		local_irq_restore(flags);
> > -		/*
> > -		 * TODO: re-read preempt count can be avoided, but it needs
> > -		 * should_resched() taking another parameter as the current
> > -		 * preempt count
> > -		 */
> > -#ifdef CONFIG_PREEMPTION
> > -		if (should_resched(0))
> > -			__preempt_schedule();
> > -#endif
> > +
> > +		local_interrupt_enable_reched(new_count);
> >  	}
> >  }
> 
> As stated before; this whole thing is a mystery to me, this should not
> be needed.

I will drop this patch entirely per the discussion.

Regards,
Boqun
