Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C58D37F335;
	Mon,  3 Aug 2026 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752526; cv=none; b=sBOZNdIxZ2WKlDG5+DU77c6GsSzkGJCLW9HwO2QoS8Q8Ic1GTA+BJOJX6HKUjM8Uuby+9jzXr7p4fFvfvVfK0WD5zHoMyVOEF5RWwWTckJjxmVOvkuNoIvktSiwGo1j4ad2ZQ/EGGN7YYPTsMOCbLYsqqiX7luQ2TuuQ8eJGeMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752526; c=relaxed/simple;
	bh=uXAKr+1vURHyqP9pVXjC8Z5zNx5GKSlhTqLZO1bcFhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDqXV4xlyoy2aiDw+96cuLB3872lMOmriIW884669Rel6JU8TwBKCEebbLWx7Qp4hWGqxZAk/LCgIoWi/xITV9/+MQxUNMDhpcg1PUgQYVN2kcvgUHG+URfO91dM+cxXE690AIs0CMUP9qGz1K4OrnEPvMvC1RU/9IgB2YpDSek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NHk6Cgmr; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NHk6Cgmr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/mmEEKobMKBcRI6g4SqveKknd1sETxCN5SKKnt6IJyU=; b=NHk6Cgmruza7cBybr0E/CU8YGq
	e9uNpbrQdtreSLfzinDejDonAkt9sq5y+GTWWk15rMHeTf2ijsmDzN2e95BY7URDO3mC32HyqjdMq
	EHf5gujYCuzvb6jFqq/AGb2UolBItX6YxHJjRqRUe+TYj0kW7rpplAZbIqpNytQnGpo33S/zkM76T
	apwCHeK3+Gbo+lpIpSPC3AZr24et9hKHadxSLSIsWtxasrhOrlsPbCMiKJkyvtfUDbNt+GU6aE3Ab
	suex6saFB9TEGHLYypld+QkgUGlYRdTlcMSKzmkg+9TrbHIdn/CQwT0eGo8IL+rtBdjjWu8x52XLa
	iRXdyxpQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqpnw-00000008t2U-057a;
	Mon, 03 Aug 2026 10:21:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 184BD301127; Mon, 03 Aug 2026 12:21:55 +0200 (CEST)
Date: Mon, 3 Aug 2026 12:21:55 +0200
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
Message-ID: <20260803102155.GI49951@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731203031.13679-6-boqun@kernel.org>

On Fri, Jul 31, 2026 at 01:30:06PM -0700, Boqun Feng wrote:
> +static inline void local_interrupt_disable(void)
> +{
> +	unsigned long flags;
> +	int new_count;
> +
> +	WARN_ON_ONCE(in_nmi());
> +
> +	new_count = hardirq_disable_enter();
> +
> +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> +
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
> +		local_irq_save(flags);
> +		raw_cpu_write(local_interrupt_disable_state.flags, flags);
> +	}
> +}
> +
> +static inline void local_interrupt_enable(void)
> +{
> +	int new_count;
> +
> +	new_count = hardirq_disable_exit();
> +
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
> +		unsigned long flags;
> +
> +		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> +		local_irq_restore(flags);
> +		/*
> +		 * TODO: re-read preempt count can be avoided, but it needs
> +		 * should_resched() taking another parameter as the current
> +		 * preempt count
> +		 */
> +#ifdef CONFIG_PREEMPTION
> +		if (should_resched(0))
> +			__preempt_schedule();

I'm confused by this one. This should not be needed. If there was a
preemption while IRQs were disabled, there should be a pending
IPI.

Notably local_irq_restore() also doesn't do this, since otherwise you
would not have needed to add this here, since you already call that.

> +#endif
> +	}
> +}
