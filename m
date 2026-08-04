Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB580EACD;
	Tue,  4 Aug 2026 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828822; cv=none; b=APSBeqBaVHR9HhOixfKRow0YixX5T47aLiZVQIXyHur1LFiPRtYEeQ2HI6sqzdNfYb1MpviR28L0gQHmck4KufGbTzB87quiECjqLivJS0b+ACTtQusPghl7QGk+sONBBn46TXDoY1QbvBLFVA/w/DwA1pm2Cd96a4rOW4TWqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828822; c=relaxed/simple;
	bh=5hLrMhx/KOBzm19zJ9tq9X6YtW0NRzxPfCzDUwRJWCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVDsfaJO4CVv3xU4RUi08O0p7hGd34udTqmrRN4hbWmqCSD+uoGGK7Dei7pGX1VAhL8i5KJbyaGQ5Yilylpr7JYDKl7ZKvcF2mqDzB9r0pBwUSXbmNXcfjBWB0pFAAgQ96I9NPC5SnJTFtgsdbDE8XI7XoK3H6MQfYJu6Sp8I44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BM3d+U7e; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BM3d+U7e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=earLvvFQ9ItzFIxRx9x4/b+TYDDEr1cV7ld1WZklikg=; b=BM3d+U7ewsopUnznrun/65GOPC
	lyRgoqTsenj8N6ahjpwF84r0W/YBS9EHKJewKZdNgQfBZEqiG3eag0IcWcwQ6Fsh9Jy88sfC/EyyX
	y8AM13YGQOF37D/OqN+1AXRh1mG8oveZoYLvqDm2uFISMepxeyT7ThRSH7v4h04QZYb5q4XzKhz1T
	gB4Hy7x3ZPe0WJuE9X94OCay9j/jcV4x0PxYvxLtX9QKC91E/xkFNtizkIRwmfa859VkHZML8JHdV
	+TwX68U7CGGM2slEMDsdWQX2pKFKvizqtU8GcNQVhg6eIxksfJ6Bqs4097fWabLoS8455hkiwW/D8
	rmgZt+wQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wr9eI-00000009e7n-39bS;
	Tue, 04 Aug 2026 07:33:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D3E8B30093A; Tue, 04 Aug 2026 09:33:16 +0200 (CEST)
Date: Tue, 4 Aug 2026 09:33:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
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
Message-ID: <20260804073316.GE788244@noisy.programming.kicks-ass.net>
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

> > > @@ -88,8 +89,17 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabl
> > >  EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
> > >  #endif
> > >  
> > > -DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> > > -EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
> > > +DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
> > > +
> > > +void _local_interrupt_disable(void)
> > > +{
> > > +	__local_interrupt_disable();
> > > +}
> > > +
> > > +void _local_interrupt_enable(void)
> > > +{
> > > +	__local_interrupt_enable();
> > > +}
> > >  
> > 
> > We need to EXPORT_SYMBOL_GPL() for these two functions.
> > 
> > Right?
> 
> Quite so.

Although, I suspect people will come and complain that this should be
!GPL, it being something 'trivial' and all that nonsense, but we'll get
there when we get there I suppose.
