Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F540683F;
	Mon,  3 Aug 2026 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766018; cv=none; b=eSwrkkuueRu+Dypg+vgUNCG/HVlCH8CeonN0nPyN28PPZTMwSZvzHGFQ71DPpj3iGaf6js+65dn8FvXy8wn3avtYVgPVMJ0JDl1aD+3ugLlGDYj+NzbhTk6CYiRsCD6fKmVd3LgIBFCPboa4m1qIXTcNEL7XTOxVZDqcRJheQ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766018; c=relaxed/simple;
	bh=bRDkzpatCH09aYzPPSrOkHfga4zS4ljeJL9ZIhu8aAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4mFGcUd3amz3uGIZ/tteqZ3RmJw9NZpktdn9A5gqDvOZG7MZm37HpvpuTtSyBAXiyESwlIvsKeoafXy27nw621AHgRTI/BSch+Ui4LrR2fDo3OJUxurf0X1CmjJdReH9apy5VM7gQhYtppp9L4BgQEFBXC29aamCBk7OXrb5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHB7KbSp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHB7KbSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592181F00A3D;
	Mon,  3 Aug 2026 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766016;
	bh=5H4NN5eDBOfDN4Hqu97aBcWDF4DC41ZVbttgrS4PNNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hHB7KbSpz4Tfhk/KHoDBjUsD12a0LyX7L+e3mZ2q4fbHqB6PPL3CW5W/bt8xpDdYS
	 OIgjJaj1mjwPdojdvakjiLijPiIcs5q+3K0yawE25oGpQRvNvpMGhyD/1YPI/QZR3R
	 Vroz7gimKATlOfx/uFurdossU5ZZQ0RzjuvSLBhkzUif7FLWk2Vifzhawku+nF2qXj
	 giwyWaXxHDidJ6RY1Ucqs/mYqANHF07mrYLM9Hc5KMXO0Q4AMurhcmeYT7yjh3GjCb
	 9wXO82Tu/p22t+IkkDfKYWmEYF5WAw6s5BzRx0m3tujqFi5MUuQQv5Q9EucYe7F4X6
	 mkx4O0DAm3jgg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 823BFF4006A;
	Mon,  3 Aug 2026 10:06:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 03 Aug 2026 10:06:55 -0400
X-ME-Sender: <xms:f6BwajFCRN8a6PEV_joosMAWd6KBHcC_hlfq7WpK3WpllLge-ak8qw>
    <xme:f6BwaqtJ6W1YYsx2EHd4KrKM0SX_Dvwtepj8FZNuRkBjLMhgjalIgzW2AYkKyJpJG
    m_nPKRnzlfOM5O8Q2EKXjbNg1OYPqQ28JK2E9rS32i8TMFrc_6JJQ>
X-ME-Received: <xmr:f6BwarSf7kQBTKgMVmBtWNIe5BmrRL7ezbEBm9legXs9ftYns0kXor772r3rcdjCfvry947Vr-L5pdWw3hgYK5yM_tw62Uvv>
X-ME-Proxy-Cause: dmFkZTGAOjcGsAVwjg1pZR7FapvB52YUKvd5Ig1Ng+LP429WM26qMJuk8EfJgpzi3bQO5q
    ssn6ePJgaEl93odTqh/ADNhUwH5feDgSCNih/IzqGzdqh+HUVeglO0/W1a+H6oZom6rcdd
    M582Ons64GCxWGQaZ37PQ5TdCUXb3/uqKcFLESgNj0MV9g2B3xo0G/duUm+e6EB6EXMtA1
    RZhQyDSswCltLM69LrLv1D6a2ugnuzpoqgfm/czLk2M5zeSGu12Qkk5JdEVYT14qtUKdVz
    rFDEr9JcHNp/3Cezf9BR0X4yEYuDjAbk4nzxJqTESFHnPlZU9LFHJ8Ka1unTj/bkmvhnRi
    x6g5zueYwtvsY04+KplPtN0FP8/DXzWg34ENDLsOvv2D4E5mRqPMKMuM3e/jgm8IOTsB5O
    VmWr81daL/FliwnOBAJ7kvVgKdhsgyGMjKnv9THwpLOhulWsUY68C3CUOUswBsexKB18ID
    JpKnp+XwkbBCeRTCGbfi9X+z2GTeoDflz5UKouj0FMjLId34Ymu6Scaz0HZhDeCsdaVZSR
    cDwYsdYValne9eVvpnrGnmdwSt6Ge6o5dGyNXLUGl6jQhvcPM1kWB2OkPc9NURRwRcVcPK
    uCHPVscsCw2MrdTn+IagwkLM+h8N8PMcKtXsqC5EnvpkothkkIPlAnYFQ1bA
X-ME-Proxy: <xmx:f6BwasPbbCouwmjxJtZAhmy0A773KQDidynrGz6UTjCt_cYJyRhV6w>
    <xmx:f6Bwah7JuSNzzj8Y7qf7WkkOLl5ZWbElC3YW2jPe64miGWyczuBecQ>
    <xmx:f6BwavUIHsCLe80RqEBrPrzdJwhUmAEJ_2qt77p0xzKprx7bscfHDg>
    <xmx:f6BwaoNeleGknQYvv7skdm3bmQhjhoz6VJr79cPWK-M395uNTOi--g>
    <xmx:f6Bwami_2FDxUKcrU2uTHdWsH5rdKT9QQN7IhIBE_EB8P0mYtsXDVMQo>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 10:06:55 -0400 (EDT)
Date: Mon, 3 Aug 2026 07:06:54 -0700
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
Message-ID: <anCgfqYg0vYCgZr-@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803102155.GI49951@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803102155.GI49951@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 12:21:55PM +0200, Peter Zijlstra wrote:
> On Fri, Jul 31, 2026 at 01:30:06PM -0700, Boqun Feng wrote:
> > +static inline void local_interrupt_disable(void)
> > +{
> > +	unsigned long flags;
> > +	int new_count;
> > +
> > +	WARN_ON_ONCE(in_nmi());
> > +
> > +	new_count = hardirq_disable_enter();
> > +
> > +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > +
> > +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
> > +		local_irq_save(flags);
> > +		raw_cpu_write(local_interrupt_disable_state.flags, flags);
> > +	}
> > +}
> > +
> > +static inline void local_interrupt_enable(void)
> > +{
> > +	int new_count;
> > +
> > +	new_count = hardirq_disable_exit();
> > +
> > +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
> > +		unsigned long flags;
> > +
> > +		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> > +		local_irq_restore(flags);
> > +		/*
> > +		 * TODO: re-read preempt count can be avoided, but it needs
> > +		 * should_resched() taking another parameter as the current
> > +		 * preempt count
> > +		 */
> > +#ifdef CONFIG_PREEMPTION
> > +		if (should_resched(0))
> > +			__preempt_schedule();
> 
> I'm confused by this one. This should not be needed. If there was a
> preemption while IRQs were disabled, there should be a pending
> IPI.
> 
> Notably local_irq_restore() also doesn't do this, since otherwise you
> would not have needed to add this here, since you already call that.
> 

I should probably have made a comment on this instead of keeping it in
my head ;-)

Note that since we use preempt_count to record irq disabling, then in
the spinlock version i.e. spin_{,un}lock_irq_{disable,enable}(), we
don't need (and don't have) preempt_disable/enable() any more. So we
need to rely on this for the following case:

	spin_lock_irq_disable();
	<set NEED_RESCHED for the current task>
	spin_unlock_irq_enable():
	  do_raw_spin_unlock(lock);
	  local_interrupt_enable(); // <- need this to trigger a
	                            // reschedule, because no
				    // preempt_enable here.

Make sense?

Regards,
Boqun

> > +#endif
> > +	}
> > +}
