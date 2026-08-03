Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E8314D0D;
	Mon,  3 Aug 2026 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767989; cv=none; b=rOxrfJM3T2MW2H4JbZuSEn8uRvMlMugx+QTY5avyiFHpEoWVBSSv9lzBNRpyAu7wegfr/UUeZCDiAUCido7OVjjbdHYtmLj626FIZAXBhn/+Lb8+8RZRq2TPv6LZtMPYTT4ekEG+NJdJeKMEIdM7M+9U3VfAJFjfnLyiEPlsdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767989; c=relaxed/simple;
	bh=0g2EljvuC9h0pqwj8+ZuBqyGledG6k3jGZEjHv3qjMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0hEEk5p4pdbvPbzngrUfI24MHUKkWCNdMQNC3qMRFQf5d/NEtkyCQSe2Q93lceiZjDvOlqX3rPatX+zYJFYd0AUVSmsueJ7kODRuVHiSk1LsZdTp/2GlKKO4UGI7toRuypqAvUDVTezZCUtTglJnW9OIppmwvLCKyqV1ujZyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/Bua6Cg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/Bua6Cg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AE51F00A3A;
	Mon,  3 Aug 2026 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767987;
	bh=Motr8DJ4Boelkn/MqZDUFGt12uok8eRJlM4+sHMnUhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M/Bua6Cg7QiWrMJRe0bMVhhUefRtvtDcROnEUn81bRas7m61kFhqqg8m7Po5NTEtU
	 Lp9wMHJCtd/0FHPbZdKCG8nhOHQVQaGfqBXHBREmlCsnNcbkJqSs1z9HM95HbB4KGa
	 7juGIYkNuFq/p6ng80nAsfWSpvhBf4DhutHyZGhaSQKFFix4gw/iUAyofxXqh7pCQ4
	 Fpa0B6I6ypFdUZs7QRpDUMrShXMl1ohZLujY/wyD8HbKAj7KMRC8P8juJzZGO75dq6
	 ejdA1Q5R0npA8eoT4z4HfPZzCnP8wPSCE3ZTG/lGDGfwrzEOFhfL1cDu13WKKXdqfz
	 1vY//NTxb7KxQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 29B7AF40068;
	Mon,  3 Aug 2026 10:39:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 03 Aug 2026 10:39:46 -0400
X-ME-Sender: <xms:MqhwautJwQr-h2dB-nEjxB4W5fukeEZi6BxKWJu2NW0t9Qa6SZBZdw>
    <xme:Mqhwat2vjrI4fjha-AQh2M_Vu6-lK-0o-Jix8KMByEXX0b_R-04Mn8Z1K-Oyms9f6
    Xduf-8QnykO8JUg1WWVhreXj-wfP7H9LsVz5iMhnHifEvcvrSLFhQ>
X-ME-Received: <xmr:Mqhwav4ORKvosWCsCOK5k3m2hWuPeFhKXynIaF45bN59_WmVXsUC_ERwzk6Vb0OhJegB_HdpUmmDJhpkefOkHiclmeb4PqVt>
X-ME-Proxy-Cause: dmFkZTERKNLZ4Poq7ApBDtsDpJcdzXJyw5GtePICMqCNqul9pjRNQsUrStn5JfDhXLFsR0
    OS+yLTOZIGxmsJdjEmHROoZexfP+bYk/QKMlt64Spuyy1kq4y5wnm32LTggvR4EiTbytYF
    bWz8hX6n9Uxoqs+tUzAqGExtvLBKoGyE0fAbatbGGmjwp5NcI2e+2TerQejbb/lrVDPDoz
    fWB/Stb97TS6yIHJi4eeveZNibpf5jRTW1LQWr/4CDwmfluqB2Du/xgKefRbFVqNU0huHu
    e3+REwqIAjseuBJmqYQo1MnQiKbKL87jxnGTEvZ6OBwkzxATd4rjd9EiFBeu7hxL+YeeCR
    9Ft5uv3lokOWpat7fBrXkOqwvc61d3FZrPW6ie7NCBbdRs0ziuufaM124cazusVmLZEBE0
    oWfQQy8bND+6H3rTABQZVO4mTtgbKBQWZQJZr3s8kVcG6dFyCiC3g1kG47U1KGpDMkDN+h
    gfT3XIlepPyiqavvzj9OGioTHoRO7zb4MzrJ0nNW0pglzQqN7LSB7GOwRfElhf4rWd7Ryu
    TOzs+MDUZiUXSDwfXMn3cwK8DUaVWOoaN1etFLSom4oUilDaacKDiYz41f+n06/Zujw1si
    eQeePjZ52rITMekLz5FUsTYLzSHybz2KG1EQFo4JSNLxUaWQEdyvfOnGf/2w
X-ME-Proxy: <xmx:MqhwakW6AUMFC6odTyfxS_25aaptEuyaGMNcupypFHVCV4Htq-ls4Q>
    <xmx:MqhwanhS3TbjxczCHjDDxJnoSSF9wZPvxINv5esGc0UqdkfFc0DhiA>
    <xmx:Mqhwakdgnn6r-fp1fwJ2PoqYuERtJESazGjzAG07xaf5vuAE3MERYw>
    <xmx:Mqhwam04RujBTg-l-ALOGDc4I-dvJfllXqa8nmI0TvBqJNgmKQcikw>
    <xmx:MqhwagrEpd1ykrqFN-_kmhXb8ObmJSoG06uAOh_ppLIaFCa7uAz-vdYp>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 10:39:45 -0400 (EDT)
Date: Mon, 3 Aug 2026 07:39:44 -0700
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
Message-ID: <anCoMLTS2-OtaTrt@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803102155.GI49951@noisy.programming.kicks-ass.net>
 <anCgfqYg0vYCgZr-@tardis.local>
 <20260803142106.GF687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803142106.GF687043@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 04:21:06PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 03, 2026 at 07:06:54AM -0700, Boqun Feng wrote:
> > On Mon, Aug 03, 2026 at 12:21:55PM +0200, Peter Zijlstra wrote:
> > > On Fri, Jul 31, 2026 at 01:30:06PM -0700, Boqun Feng wrote:
> > > > +static inline void local_interrupt_disable(void)
> > > > +{
> > > > +	unsigned long flags;
> > > > +	int new_count;
> > > > +
> > > > +	WARN_ON_ONCE(in_nmi());
> > > > +
> > > > +	new_count = hardirq_disable_enter();
> > > > +
> > > > +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > > > +
> > > > +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
> > > > +		local_irq_save(flags);
> > > > +		raw_cpu_write(local_interrupt_disable_state.flags, flags);
> > > > +	}
> > > > +}
> > > > +
> > > > +static inline void local_interrupt_enable(void)
> > > > +{
> > > > +	int new_count;
> > > > +
> > > > +	new_count = hardirq_disable_exit();
> > > > +
> > > > +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
> > > > +		unsigned long flags;
> > > > +
> > > > +		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> > > > +		local_irq_restore(flags);
> > > > +		/*
> > > > +		 * TODO: re-read preempt count can be avoided, but it needs
> > > > +		 * should_resched() taking another parameter as the current
> > > > +		 * preempt count
> > > > +		 */
> > > > +#ifdef CONFIG_PREEMPTION
> > > > +		if (should_resched(0))
> > > > +			__preempt_schedule();
> > > 
> > > I'm confused by this one. This should not be needed. If there was a
> > > preemption while IRQs were disabled, there should be a pending
> > > IPI.
> > > 
> > > Notably local_irq_restore() also doesn't do this, since otherwise you
> > > would not have needed to add this here, since you already call that.
> > > 
> > 
> > I should probably have made a comment on this instead of keeping it in
> > my head ;-)
> > 
> > Note that since we use preempt_count to record irq disabling, then in
> > the spinlock version i.e. spin_{,un}lock_irq_{disable,enable}(), we
> > don't need (and don't have) preempt_disable/enable() any more. So we
> > need to rely on this for the following case:
> > 
> > 	spin_lock_irq_disable();
> > 	<set NEED_RESCHED for the current task>
> > 	spin_unlock_irq_enable():
> > 	  do_raw_spin_unlock(lock);
> > 	  local_interrupt_enable(); // <- need this to trigger a
> > 	                            // reschedule, because no
> > 				    // preempt_enable here.
> > 
> > Make sense?
> 
> No; for one, you cannot elide the preempt_disable/enable() from this
> thing.
> 
> It has always been valid to do:
> 
> 	raw_spin_lock_irq(lock);
> 	...
> 	raw_spin_unlock(lock);
> 	...
> 	local_irq_enable();
> 
> And since raw_spin_unlock() does have the preemption thing,

Good point!

However, IIRC, the elision was trying to optimize two preempt_count
accesses (one for irq disable, one for preempt disable) into one in
raw_spin_lock_irq_disable() or raw_spin_unlock_irq_enable(). We may
still want to do it in the future, if that's the case, we will still
have should_resched() check in raw_spin_unlock_irq_enable()?

> raw_spin_lock_irq() must too. And the very same argument is still valid
> if you now write:
> 
> 	raw_spin_lock_irq_disable(lock);
> 	...
> 	raw_spin_unlock(lock);
> 	...
> 	local_interrupt_enable();
> 
> Secondly, nothing should 'set' NEED_RESCHED without also immediately
> causing a preemption.

Thanks for the information.

Regards,
Boqun
