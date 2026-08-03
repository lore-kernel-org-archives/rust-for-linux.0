Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DCC43552B;
	Mon,  3 Aug 2026 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784189; cv=none; b=rgI25xfLIorRYGvWshK8FwTw0LPdOnwG8fBq1cr47yK/Tirml0r8GXpZydYPqnmdXw3t36A7Dcbvb4ru8ykbEwn1P/bWCYasP7CLPfmvcVi6n1ORkmz0T51m+2RtwccyJc2WUfXaAeydXHV38rMSOdcfQFFc0ZaITxuBzLCJwis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784189; c=relaxed/simple;
	bh=lkoVIrPDfyGgjVKmeRIkVqC2RCpq+w+xnOMI15LjtEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vieac5m/OuuHH4tok/rqiT5NkSs1gPvoxNaLvdzFvIrhM8PLlQU2tVpVsw30FixsLVGEXYUDti6jrcExo7KO5e94rR/+yAsrhml3wseGc3ZypENtArQXv/uH8Dgfx3/FpPodIEZqzx9d5u2J34V+DtGELt1SabkHx5SYabesIJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5UTH+vO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5UTH+vO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A54C1F000E9;
	Mon,  3 Aug 2026 19:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785784187;
	bh=oKCTlQGeDXcsDChXq0Gsca6FLaEn0r/nUq256E6Lt7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M5UTH+vOcTfg1bMavACiFtwZhvTRZ5n1Zoo/kl//azLvm5bpqkOB9l4q7e8Qo8riV
	 9sIgvtWPYjW4G9fFdlgwqEo65Xab2tit6a03gTlOibk1zjj9eaiBy0BYBu5EHqA2pD
	 WNGfa/VLAbY3KPZoqa7HDi4tVf3Kr4znTgnEyNKTNpiTG6ZnElV0jJid0ATOnluyrT
	 onFC0j3RD1f3dFB0MGhUhgebzVpsvr3pT4QEidrwQj+j69zlS1F+dZr+/+fjiZSUW7
	 FA2FDBVh6u1FfrUpAI0cnJKnctxfYMcdOjF0aCOOo5bnT7cyGyhA4cd7EQgyW6nBj0
	 o+r/8yCTBaXIw==
Date: Mon, 3 Aug 2026 21:09:41 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 05/24] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anDndQlfuVIneMe4@gmail.com>
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


* Boqun Feng <boqun@kernel.org> wrote:

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

That's not the customary placement for header guards, please try to
follow existing patterns as much as possible.

> +/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */

That's not the standard spelling of per-CPU.

> +struct interrupt_disable_state {
> +	unsigned long flags;
> +};

Unless this structure is extended in the same series - and it isn't
AFICT, why this layer of obfuscation of type and purpose?

> +		/*
> +		 * TODO: re-read preempt count can be avoided, but it needs
> +		 * should_resched() taking another parameter as the current
> +		 * preempt count
> +		 */
> +#ifdef CONFIG_PREEMPTION
> +		if (should_resched(0))
> +			__preempt_schedule();
> +#endif

Let's not add TODOs and call it an upstream-ready patch ...

  	preempt_count_sub(HARDIRQ_OFFSET);
> -	if (!in_interrupt() && local_softirq_pending()) {
> +	/*
> +	 * Interrupts may happen between hardirq_disable_enter() and
> +	 * local_irq_save() in local_interrupt_disable(), if irq_exit() invokes
> +	 * softirq here, we may have a softirq handler calling
> +	 * local_interrupt_disable() but it won't disable the irq because
> +	 * hardirq disabling count is already 1, hence we need to prevent
> +	 * invoking softirq when a local_interrupt_disable() is ongoing.

Non-standard spelling of 'IRQ'.

> +	 */
> +	if (!in_interrupt() && !hardirq_disable_count() &&
> +	    local_softirq_pending()) {
>  		/*
>  		 * If we left hrtimers unarmed, make sure to arm them now,
>  		 * before enabling interrupts to run SoftIRQ.

Non-standard spelling of 'softirq' here.

There's also new spelling errors in some of the comments introduced
by this patch.

This is a very low quality patch, it should never have been included
and declared 'ready' for upstream. It's not even close!

Thanks,

	Ingo
