Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6438361960;
	Mon,  3 Aug 2026 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752222; cv=none; b=Nuy9f1CWa2sme1W3KSzeBSSJyzS/YyEwIfI59cCwUdyiPUyDfkH5cCM7aNWWML5+aerYDv/3zbMlGH1zcR6D5wuAN4rDTL095j3ikYXig6JX7TWyXVroyhA9bT7v1q1HdppQVimjJPyhVxNp2YRhTyiM/XksFmmOtDbs8LfAPqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752222; c=relaxed/simple;
	bh=o8kBNrv1UfJ26Kd/8zf/oVxgeetFCR0GEd0ENtW5cVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGSOksPXXL1O4xqCAKgK/nU9aFcHHbRrjxx95XWj5P/kGxMVcFWWHQBvoFzysul6+d6TrxcdXhtRMgn5pKy24oQ8EU0PWDQf9R6GUsReVi5Ybgdz6Stki3H6DN02+k+PHGfQKDdtvWpWBSNJYFH43zWbdYc153RLUdTuPs9DfH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pwwcyOSt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pwwcyOSt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GxS9RDwU6IbCM8ZYn4WWoFXZfvEsVVX7w4lWl+B7HIM=; b=pwwcyOStuGWcu2yutMhjXQPMFo
	binNUpjBxQvorlS9awBzyv6ZdhR7Ws2cX/HtS2GPPceT2JlE/LUOVX80Ao8ux2qPDD0nDvR0tutgj
	XQgETt1wvvZU+/TEfYHsdY8yRq10+SfQNJmbf1xnhlRs0tmk0sJKEbawy0pJHQlS3ELptuCuvCREy
	4qdazcaOqMo7VyjcUq8WAtOtXOys5Sy58+CuF9Rx3yEPCd3qQnY+fnWGoq/fOxXlfZajZ6j87naTD
	x02tedCpGVUZkDFDd8veGAkXOIgy2U2vhXdW2gwwrPuWIfYObsPLsSkz8+qqaDBbwmDluObm38rMS
	i7NCoCJw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpj3-0000000D9s7-1XzX;
	Mon, 03 Aug 2026 10:16:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E2E85301127; Mon, 03 Aug 2026 12:16:52 +0200 (CEST)
Date: Mon, 3 Aug 2026 12:16:52 +0200
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
Message-ID: <20260803101652.GH49951@noisy.programming.kicks-ass.net>
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

> diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> new file mode 100644
> index 000000000000..dd4444c61330
> --- /dev/null
> +++ b/include/linux/interrupt_rc.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * include/linux/interrupt_rc.h - refcounted local processor interrupt
> + * management.
> + *
> + * Since the implementation of this API currently depends on
> + * local_irq_save()/local_irq_restore(), we split this into it's own header to
> + * make it easier to include without hitting circular header dependencies.
> + */
> +
> +#ifndef __LINUX_INTERRUPT_RC_H
> +#define __LINUX_INTERRUPT_RC_H
> +
> +#include <linux/irqflags.h>

My lsp/clangd insists on:

#include <linux/preempt.h>

> +#include <asm/processor.h>
> +#ifdef CONFIG_SMP
> +#include <asm/smp.h>
> +#endif
> +
> +/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> +struct interrupt_disable_state {
> +	unsigned long flags;
> +};
> +
> +DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> +
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
> +#endif
> +	}
> +}
> +
> +#endif /* !__LINUX_INTERRUPT_RC_H */
