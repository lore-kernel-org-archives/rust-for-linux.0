Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C437AA9E;
	Mon,  3 Aug 2026 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757297; cv=none; b=Zq4nFiwMvPi8pftVZ9TDqshFNf7995XovTv8t/HrYSP36FihFV5/1S6RhZZiwiYs3hzdigb1ZdITu6CiF5DpClfMEyxgBs4UGWcVm0Sfw9SIV+M4QLmcsQ+DxnihIYW4x79eRKp6RGzH3E9LSFYcEGHDJe4mrohOlKr7XCoDL9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757297; c=relaxed/simple;
	bh=+4OcL7ADT8hMthnnn95cCekXkpsRnXFR+l2NUyUamg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SafWDVtvdyy/7qribO3SYEFLqra9QESQKOZ11oxcIqDVKUmlX5tt58FtCKf03IeZhkaBuvddD06PhXfi/PEQcsECzw1N7w7p49zp57eDePUBmcWwmUyjWF6lCpzgo8VimkcTDqf1+LGY997TVx94O/wdVSYd4JIh+GEUVg1Bm6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dF+WlasZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dF+WlasZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pIqXhv2zSnDw+wZ/eQSSEOkhmVEws8/fY8tVMkzDrT4=; b=dF+WlasZQg0mP9HvUnCawZRFyj
	sGJDoXURfTpJkv+zWwisz6KG4Za6cEJXqIIEp/oedcWzsAHi2ZD70HMSar15qfn19nzfq4QAVw58/
	2WO4g4iCJ80frbzZNMaDmEoHr3mkZtOC+07RgSVaqpmsnX1JgRwYrY80NYWNFFezR+IAgA3FIG3xy
	4rZ+PzF6hNWKjIdzdZVAYi+lQdKXqTUZEoGR3VN2BFqdNskfyALDj7liL6lBaJ8QPdDBXkZvt+Nsp
	yMxxNeX7U05HcoKYD4URwv9erdoWE8cxXz+8GO00JRXGHiiOXEucWe40BdVAwT3CObcNy5YXN0Y1N
	CtfYNWLQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqr2v-00000008vc8-2VjX;
	Mon, 03 Aug 2026 11:41:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C0F52301127; Mon, 03 Aug 2026 13:41:28 +0200 (CEST)
Date: Mon, 3 Aug 2026 13:41:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 13/24] irq: Optimize reschedule check in
 local_interrupt_enable()
Message-ID: <20260803114128.GD687043@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-14-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731203031.13679-14-boqun@kernel.org>

On Fri, Jul 31, 2026 at 01:30:14PM -0700, Boqun Feng wrote:
> In local_interrupt_enable(), we could avoid re-reading preempt count
> because of should_resched() by using the result from
> hardirq_disable_exit(), however this means __preempt_count_add_return()
> and __preempt_count_sub_return() need to return all the preempt count
> bits (including the PREEMPT_NEED_RESCHED bit), since the only user of
> __preempt_count_{add,sub}_return() is hardirq_disable_{enter,exit}(),
> hence make them return "unsigned long" to optimize this.

>  static inline void local_interrupt_enable(void)
>  {
> -	int new_count;
> +	unsigned long new_count;
>  
>  	new_count = hardirq_disable_exit();
>  
> @@ -52,15 +68,8 @@ static inline void local_interrupt_enable(void)
>  
>  		flags = raw_cpu_read(local_interrupt_disable_state.flags);
>  		local_irq_restore(flags);
> -		/*
> -		 * TODO: re-read preempt count can be avoided, but it needs
> -		 * should_resched() taking another parameter as the current
> -		 * preempt count
> -		 */
> -#ifdef CONFIG_PREEMPTION
> -		if (should_resched(0))
> -			__preempt_schedule();
> -#endif
> +
> +		local_interrupt_enable_reched(new_count);
>  	}
>  }

As stated before; this whole thing is a mystery to me, this should not
be needed.
