Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9D53B994A;
	Mon,  3 Aug 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769630; cv=none; b=mzpqbCSW1vv8sgeYG6en206WrnXx+khR2EaBlrFrK98REf5PdBZujWf7zARq2rc6rUilM5q3TFpSp/Q05tiDsc3pGMHPrujJNbiC2g2EHSef/ipSWBM4yaoDSXJvuefsnu5NQyUblDalzb54Ojqb0R9k734m30bzq8QvicUbT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769630; c=relaxed/simple;
	bh=zY5wLJJ1PNpViytGrY6x+pIbuJ0+nb1wHP/b6mB23Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIgW0/dFC+ZKgjH1yWryWuRsfgtxynfRCTf1zlixBegXE8EamvSafUO/pXP08R/A45MMhtY4PZB+rONSV7eCadZb4IJP0P46QoirkbJuyjbsmNCHVua5tuuKtIrCFMvIZuOTBNuS+qjVUUrbpzPBjGniLAqM5oMRgO9Rk9nXxjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NtGw06cK; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NtGw06cK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lDKC16hU69X6rScMzzGverp5AkU//ffxTRaJqQopOTg=; b=NtGw06cKc6z6QNXVsmSSWnGXcq
	vQiY5fsLP5hnYJyRH+6oiCIqlj5ePitU/BcON7U5XH5VJ4KTQT6arIYBASUNysjYuCe2ZnQJWtGow
	XHxpzy577mX2rHlYf5AhLyXO9Wt2g5m9ogShBmQSrHFoSVy2WZ8IZDuqt1Vwk0UsU8dFV1yhPXPFK
	fOqj2O658Dy+9VkVSWE04H8zDdPxrRcI2hDJpSKeRF8BJEl40JhnzwmZXafQ6ObtZMdnifIYKoI6L
	iLNBw/1Tqqb/Wt5+4qYHzILQNcNDECl+SREG9NvunMmltTE4xAWOG4751jeX7Z0OZdZ3CxQufv8OS
	+PMeDc/w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wquFp-000000094mg-3NfV;
	Mon, 03 Aug 2026 15:07:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 857B1301127; Mon, 03 Aug 2026 17:06:59 +0200 (CEST)
Date: Mon, 3 Aug 2026 17:06:59 +0200
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
Message-ID: <20260803150659.GG687043@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803102155.GI49951@noisy.programming.kicks-ass.net>
 <anCgfqYg0vYCgZr-@tardis.local>
 <20260803142106.GF687043@noisy.programming.kicks-ass.net>
 <anCoMLTS2-OtaTrt@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anCoMLTS2-OtaTrt@tardis.local>

On Mon, Aug 03, 2026 at 07:39:44AM -0700, Boqun Feng wrote:
> On Mon, Aug 03, 2026 at 04:21:06PM +0200, Peter Zijlstra wrote:

> > No; for one, you cannot elide the preempt_disable/enable() from this
> > thing.
> > 
> > It has always been valid to do:
> > 
> > 	raw_spin_lock_irq(lock);
> > 	...
> > 	raw_spin_unlock(lock);
> > 	...
> > 	local_irq_enable();
> > 
> > And since raw_spin_unlock() does have the preemption thing,
> 
> Good point!
> 
> However, IIRC, the elision was trying to optimize two preempt_count
> accesses (one for irq disable, one for preempt disable) into one in
> raw_spin_lock_irq_disable() or raw_spin_unlock_irq_enable().

It is relatively easy to fold the increments in
raw_spin_lock_irq_disable(), the enable (see below) is going to be a
little more tricky.

> We may
> still want to do it in the future, if that's the case, we will still
> have should_resched() check in raw_spin_unlock_irq_enable()?

So if you have raw_spin_unlock_irq_enable() *and* you've managed to fold
the preempt_count() accesses of hardirq_disable_exit() and
preempt_enable(), then yes. Consider:

	preempt_disable();

	<IRQ happens, set TIF_NEED_RESCHED and folds PREEMPT_NEED_RESCHED>

	raw_spin_lock_irq_disable(lock);
	preempt_enable(); // can't reschedule
	...
	raw_spin_unlock_irq_enable(lock); // drops to 0 without an interrupt pending

So the folding of hardirq_disable_exit() and preempt_enable() needs to
take care of *both* special cases: 1) the local_irq_restore() and 2)
calling __preempt_schedule() when 0.
