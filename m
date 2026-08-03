Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8222DC350;
	Mon,  3 Aug 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766875; cv=none; b=VJMThaJ0ov0LPufrILucUqbDdNM+vix1pgBY8u9oLJ0lEhw8gbW8Y5qSj4meaxPwhTm7wjVgu/gJHhqFQJBSzRNyFUNgKjT9foTvRFVX8lGyDBWrm+VAVKWmJnGd63mlxFrj8Rp6hujUxQ4U3tscO1Iiwp+xP4wl05SVcUpa0YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766875; c=relaxed/simple;
	bh=0+ws57Mni6NFUPjAqcbESNcyvsLHHP/3YpmsqZrXiwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcxP+BpSY9thfhPOFK8Y+endVXB6of73uaPe0yqYRz2yRmV2GSfLginnAwfK4vEct9gR34F6PSrP+H/q9ECYUlXL7gmKFYIxHPHNQWBOmj7YkePgdfufWMyJIbS6gZ0BJ73F410B/o8f6Fn9pEOZx2dDe+VFUf/ITKJLt9WoQfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RKw1yPO0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RKw1yPO0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CfSTbGPt5AShRDVI9WoDTHEy2qqp09u8MIuXKLViHm0=; b=RKw1yPO0JY3jbx7lHACZx1sZ3J
	uwq6qbc7iaDfwbqjRXw0kun40Q+IvyW4F7gZ/gbHqnH2y4+QBHYIiivhqOHga7t4gyye3lljc37hr
	5jLaVDHaKh817h+0qEOBxVwondB/SqGDFfNnvUhVti73p83RWW2qohDR56BS78af4xbd0NRZL6x4R
	KTY3rSkr4PVRkcbPoFiZWuqOAQei6rkbUdHzP74ELgPl9kSdVCRdhH8o5+k+wVg9HIHY/UW2pSEXT
	LoYfmuXisF+Emzaf/T87rc2zeQTUWHYVCD34mD+bKEqNiDEOoOmiA+bAhHGbiX4OSMCNVPEwbwJ61
	75EkaO7g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtXP-0000000Dl2u-29vG;
	Mon, 03 Aug 2026 14:21:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 83BF9301127; Mon, 03 Aug 2026 16:21:06 +0200 (CEST)
Date: Mon, 3 Aug 2026 16:21:06 +0200
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
Message-ID: <20260803142106.GF687043@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803102155.GI49951@noisy.programming.kicks-ass.net>
 <anCgfqYg0vYCgZr-@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anCgfqYg0vYCgZr-@tardis.local>

On Mon, Aug 03, 2026 at 07:06:54AM -0700, Boqun Feng wrote:
> On Mon, Aug 03, 2026 at 12:21:55PM +0200, Peter Zijlstra wrote:
> > On Fri, Jul 31, 2026 at 01:30:06PM -0700, Boqun Feng wrote:
> > > +static inline void local_interrupt_disable(void)
> > > +{
> > > +	unsigned long flags;
> > > +	int new_count;
> > > +
> > > +	WARN_ON_ONCE(in_nmi());
> > > +
> > > +	new_count = hardirq_disable_enter();
> > > +
> > > +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > > +
> > > +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
> > > +		local_irq_save(flags);
> > > +		raw_cpu_write(local_interrupt_disable_state.flags, flags);
> > > +	}
> > > +}
> > > +
> > > +static inline void local_interrupt_enable(void)
> > > +{
> > > +	int new_count;
> > > +
> > > +	new_count = hardirq_disable_exit();
> > > +
> > > +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
> > > +		unsigned long flags;
> > > +
> > > +		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> > > +		local_irq_restore(flags);
> > > +		/*
> > > +		 * TODO: re-read preempt count can be avoided, but it needs
> > > +		 * should_resched() taking another parameter as the current
> > > +		 * preempt count
> > > +		 */
> > > +#ifdef CONFIG_PREEMPTION
> > > +		if (should_resched(0))
> > > +			__preempt_schedule();
> > 
> > I'm confused by this one. This should not be needed. If there was a
> > preemption while IRQs were disabled, there should be a pending
> > IPI.
> > 
> > Notably local_irq_restore() also doesn't do this, since otherwise you
> > would not have needed to add this here, since you already call that.
> > 
> 
> I should probably have made a comment on this instead of keeping it in
> my head ;-)
> 
> Note that since we use preempt_count to record irq disabling, then in
> the spinlock version i.e. spin_{,un}lock_irq_{disable,enable}(), we
> don't need (and don't have) preempt_disable/enable() any more. So we
> need to rely on this for the following case:
> 
> 	spin_lock_irq_disable();
> 	<set NEED_RESCHED for the current task>
> 	spin_unlock_irq_enable():
> 	  do_raw_spin_unlock(lock);
> 	  local_interrupt_enable(); // <- need this to trigger a
> 	                            // reschedule, because no
> 				    // preempt_enable here.
> 
> Make sense?

No; for one, you cannot elide the preempt_disable/enable() from this
thing.

It has always been valid to do:

	raw_spin_lock_irq(lock);
	...
	raw_spin_unlock(lock);
	...
	local_irq_enable();

And since raw_spin_unlock() does have the preemption thing,
raw_spin_lock_irq() must too. And the very same argument is still valid
if you now write:

	raw_spin_lock_irq_disable(lock);
	...
	raw_spin_unlock(lock);
	...
	local_interrupt_enable();

Secondly, nothing should 'set' NEED_RESCHED without also immediately
causing a preemption.
