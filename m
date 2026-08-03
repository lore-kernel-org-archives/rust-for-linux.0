Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF934279792;
	Mon,  3 Aug 2026 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757107; cv=none; b=QTmy5CgQSOr5nTWJS4WJlFQn/+RLlQjI4Q338xvzvmR//jXwl3k4HKB7wr2DL3S1saY3xYwYhJcZhxwrbeJLHewMQW4w1EO4AW45njiw72gQHdfnpo5nYyB6P44WrGzYWIanFU4KZShnPMkgM7VzUCH7b4MhAkW+hP6f52cuInQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757107; c=relaxed/simple;
	bh=wYTLfmNJMCmVMyI5inNMqGobpKpLdxbDt9iPXmsSs3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTG6vTtyyQe5/iPuMwaZ4ANFaYkriXCB4UqfJghpctTs8kcxuM2ROJHqlXA+ZsHx1ipR24WPLJ7jETBJALyGgazwSES1r1RTa0eebvdG57TbLCenT7tyWc84jgk65DkTYsOPKeWeSXfkP0dad8NcgxCsX/rlsbOl9AYUtJTJeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NAHiBZm8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NAHiBZm8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wweCVsEN00M8ke2cMvnjwXNgDp2k9PZEWKWSuY6hq7Q=; b=NAHiBZm8bEFzX+yWj3eiFc0tZb
	UwTU/MwTkdS36HRcOrpMJALss+a1uubz3J2pacpg6SiEaRByuPIzUI2AowHFj0fnUyOWgJbFCM8Tf
	+fY8VCMalGIlSqRywL/wCNe4yuY7a1A2w4mNyY6lsT3hS9gEu+/au1mY9bUykQQCyAXk+Lt6R6tJA
	QqQjsXjk2i0XU+e0OpVpf7rg7NoPDIHNKXBYaqYi454Uy6vUK+0z89MBv5G5LrfwYYLZt9z70YDRL
	fnl9rhj7pSW/7glljfgQS1DTWowCCDojL5HpIQWHW7Mep4AZBDWDF918uEaH1nITCDb0jaEs22Q0W
	W/IAVKtA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqzq-0000000DN3w-1dqj;
	Mon, 03 Aug 2026 11:38:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9DD2F3003DE; Mon, 03 Aug 2026 13:38:17 +0200 (CEST)
Date: Mon, 3 Aug 2026 13:38:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 10/24] preempt: Introduce
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <20260803113817.GB687043@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-11-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731203031.13679-11-boqun@kernel.org>

On Fri, Jul 31, 2026 at 01:30:11PM -0700, Boqun Feng wrote:

> diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
> index 1220656f3370..12353eeebc52 100644
> --- a/arch/x86/include/asm/preempt.h
> +++ b/arch/x86/include/asm/preempt.h

> @@ -24,18 +34,26 @@ DECLARE_PER_CPU_CACHE_HOT(int, __preempt_count);
>   */
>  static __always_inline int preempt_count(void)
>  {
> -	return raw_cpu_read_4(__preempt_count) & ~PREEMPT_NEED_RESCHED;
> +	return __pc_op(read, __preempt_count) & ~PREEMPT_NEED_RESCHED;
>  }
>  
> -static __always_inline void preempt_count_set(int pc)
> +/*
> + * unsigned long preempt count parameter works for both 32bit and 64bit cases:
> + *
> + * - For 32bit, "int" (the return of preempt_count()) and "unsigned long" have
> + *   the same size.
> + * - For 64bit, the effective bits of a preempt count sits in 32bit, and we
> + *   reserve the NEED_RESCHED bit from the old count.
> + */

The 64bit comment doesn't really make sense to me.

> +static __always_inline void preempt_count_set(unsigned long pc)
>  {
> -	int old, new;
> +	unsigned long old, new;
>  
> -	old = raw_cpu_read_4(__preempt_count);
> +	old = __pc_op(read, __preempt_count);
>  	do {
>  		new = (old & PREEMPT_NEED_RESCHED) |
>  			(pc & ~PREEMPT_NEED_RESCHED);
> -	} while (!raw_cpu_try_cmpxchg_4(__preempt_count, &old, new));
> +	} while (!__pc_op(try_cmpxchg, __preempt_count, &old, new));
>  }

> diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> index 33fc4c814a9f..87d5367f986c 100644
> --- a/include/linux/preempt.h
> +++ b/include/linux/preempt.h
> @@ -30,18 +30,20 @@
>   * NMI nesting depth is tracked in a separate per-CPU variable
>   * (nmi_nesting) to save bits in preempt_count.
>   *
> - *         PREEMPT_MASK:	0x000000ff
> - *         SOFTIRQ_MASK:	0x0000ff00
> - * HARDIRQ_DISABLE_MASK:	0x00ff0000
> - *         HARDIRQ_MASK:	0x0f000000
> - *             NMI_MASK:	0x10000000
> - * PREEMPT_NEED_RESCHED:	0x80000000
> + *				32bit		HAS_SEPARATE_PREEMPT_RESCHED_BITS
> + *
> + *         PREEMPT_MASK:	0x000000ff	0x00000000000000ff
> + *         SOFTIRQ_MASK:	0x0000ff00	0x000000000000ff00
> + * HARDIRQ_DISABLE_MASK:	0x00ff0000	0x0000000000ff0000
> + *         HARDIRQ_MASK:	0x0f000000	0x000000000f000000
> + *             NMI_MASK:	0x10000000	0x00000000f0000000
> + * PREEMPT_NEED_RESCHED:	0x80000000	0x8000000000000000
>   */

Perhaps add a comment about how HAS_SEPARATE_PREEMPT_RESCHED_BITS really
is about having PREEMPT_NEED_RESCHED in its own word, rather than
preempt_count() being 64bit.

Because as presented it is very easy to confuse these two options.
Ideally it would explain the LOAD-STORE issue with NEED_RESCHED and
point to ARM64 or something.
