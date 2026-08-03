Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B83A1682
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 19:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786442; cv=none; b=cdaJFg37LFTLc39nAySMTaaweoQsIiUpyZfIZKxdeflrJi6ZbvgptvVq3bRml4677/YRtl2UFHYUYr3DSZSemR67Gmvk3HjWVK16Vnlok/vYG5N34WrktBNqR7lblPLomArA/j2+/UCZid87u92HmD6Bc7ggD763TPUmVlZ8JTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786442; c=relaxed/simple;
	bh=BMzoDVHa7QtWMKnvYw1zMlAq4Q9ARQ9SD0GmvCpWqBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cM6/yyegKmCgLQt5sJwB01o96UQWVFLaVJmNmPf+YauDvguE5LgQF1/6ksFHLucNEPw3OEVU9EjrHlCIUIBAE6aIauyLpZ14oDo4PFkB4W96COwxVpOQzwl+yrw3xCKWltGriZ2ulfqnwVFFpDEeMd0R9Tr/WalpfiUzAuxI2HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EA1yC0Vq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EA1yC0Vq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446371F00A3A;
	Mon,  3 Aug 2026 19:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786440;
	bh=8Mc9TASqyYwPYmXzbYIWunU+e52PGxKceV1fqMj9opU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EA1yC0Vqdxxe9YYvagtQGZOOTyGpFwv0gsD9xH+a5QT6hGL4gnFINZv/OeDRMkyLX
	 zVA19gOExGHapIDuPh1TNnDk+NhWwBqnXPcCmLyrQYFTVbiejWfdfos2vw/NoAAb2K
	 GjTGMyTLvZsyuIOS7B7kqbqrMBEXXDp3K9r6lWFHp5QekdK0kDS6IdDTgmEWNHkVCL
	 5kPClxVyvNMGoHNNB8DsnzwSQTa6dtoTv+OKvCeS/BI1PXBIk130vXpK6FIBntCSjc
	 Ohyj68KHRJK4N6dc65se62a4ZjPaJIdwFartrc/ARbeMuxVnz8aZpAji5AYVB9uA2k
	 sR+Y7bOqXe97Q==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5B8C6F4006C;
	Mon,  3 Aug 2026 15:47:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 03 Aug 2026 15:47:19 -0400
X-ME-Sender: <xms:R_BwahiGIIXAqe3GfziPcgp1I8qy1InCEUyusQuX1w48pV3lIArmsw>
    <xme:R_Bwaga9p9yvzUUpTToVlxFyFofLggFZ2X8rke0OpEezPCICkDYK_adASTM-m1UDu
    CzA_jpwNYz0L6b3SsdFgUJkmgn8EthWEIsGV7PG5T895Pd0d2W5>
X-ME-Received: <xmr:R_BwanN_jcn0bk2O4qBQWjrAZ6SRI10xpuyFizY1iyeLGod_jOKYEsP2cZhZk2WHWCUepuXZnV7DAChEcJGNNgwHqlaLdYo3>
X-ME-Proxy-Cause: dmFkZTF97F7WdKA835fHrte+QTqhTeFP0GGLmx0dcPEnx4F2G4t+X8fnI4zzXxsB+cKmxh
    BVRtm9tMh/OAGBF485tQ0sTw+HHd/oxFRP+F5dgv9qCcRKc2hLOfxAfkLI7CivNiNQAro+
    aSDajLVX+6dV3cIiRa61uxp4I9xV8RfETLn2g6dSnPnDE/KBP0MWEDRH0c9x5qokV25lwZ
    2t0OuK2a0LQFiU3id00D0K/DBjUjMtL6s6z2dCezYwlQUV6sxsondlLm2I/Y0hFOYfdDVl
    K1j3fCvd+jqxNvD8hNd3+B4kZ9pClnMpSsh4dZv9V8tmWBFFfJyInjuyC0HzjpXsaZ1bmL
    O7csdUQSS5GTe4xUmxrYtTxFEgDTsJ4YwC3ekPvBmmMKaZ2s0yXOgO23zt1mrk6nhC9MHf
    uMCj7snviQ7Wu/P+6GO+oJeiJwTYXnQReVEFPfAMDpdinowOCbZ7Cczubn1bueVd5qh8jV
    GaprvBQBo7Cfi1xHQ49pQKv1Cj82BjMrXUaBCbL2KDTNP2TbbntPtWEiM7RgemCgA1o2Xo
    zmcEVFxlZf77m3JRpcEK9mUZ3e7IvXQt9VLuDzund8pZIyY4Nc1R7z/caBMHbKm7Hl7Xy8
    RXGO+kLYw5HANlaOZKKGku9jTsqBM5oFgRGrmSQBbl8iKAD0FsA6EoJZIrrw
X-ME-Proxy: <xmx:R_Bwaha6K0WUl6JANTpl4lJ03d95GbBnC4PdNOIH3LsclrY-GtzXDQ>
    <xmx:R_BwanUEQfH2fBfooI5LksSSvHHcXuKX0S6z-bF_mhXr9iZnJQxv9w>
    <xmx:R_BwagB3NugOfSr5sqf2sUIgZT72aEKulKITYOkTEEPPaluD4N2QTg>
    <xmx:R_BwajIb_uKVsNg6kVgvsCePZbybrH2xlz_0SosuvYsj3U6FENWAew>
    <xmx:R_BwautPSrfSThgrt-NNIoWikhX-f8ofnhZayXGEMjaABcEgCRvpzcIf>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 15:47:18 -0400 (EDT)
Date: Mon, 3 Aug 2026 12:47:17 -0700
From: Boqun Feng <boqun@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
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
Message-ID: <anDwRdepUowo-YIR@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <anDndQlfuVIneMe4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anDndQlfuVIneMe4@gmail.com>

On Mon, Aug 03, 2026 at 09:09:41PM +0200, Ingo Molnar wrote:
> 
> * Boqun Feng <boqun@kernel.org> wrote:
> 
> > diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> > new file mode 100644
> > index 000000000000..dd4444c61330
> > --- /dev/null
> > +++ b/include/linux/interrupt_rc.h
> > @@ -0,0 +1,67 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * include/linux/interrupt_rc.h - refcounted local processor interrupt
> > + * management.
> > + *
> > + * Since the implementation of this API currently depends on
> > + * local_irq_save()/local_irq_restore(), we split this into it's own header to
> > + * make it easier to include without hitting circular header dependencies.
> > + */
> > +
> > +#ifndef __LINUX_INTERRUPT_RC_H
> > +#define __LINUX_INTERRUPT_RC_H
> 
> That's not the customary placement for header guards, please try to
> follow existing patterns as much as possible.
> 

Fixed locally, I follow what spinlock.h does.

> > +/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> 
> That's not the standard spelling of per-CPU.
> 
> > +struct interrupt_disable_state {
> > +	unsigned long flags;
> > +};
> 
> Unless this structure is extended in the same series - and it isn't
> AFICT, why this layer of obfuscation of type and purpose?
> 

Will remove this layer in the next version.

> > +		/*
> > +		 * TODO: re-read preempt count can be avoided, but it needs
> > +		 * should_resched() taking another parameter as the current
> > +		 * preempt count
> > +		 */
> > +#ifdef CONFIG_PREEMPTION
> > +		if (should_resched(0))
> > +			__preempt_schedule();
> > +#endif
> 
> Let's not add TODOs and call it an upstream-ready patch ...
> 

Per discussion with Peter [1], this part is not needed, so the TODO will
be removed.

>   	preempt_count_sub(HARDIRQ_OFFSET);
> > -	if (!in_interrupt() && local_softirq_pending()) {
> > +	/*
> > +	 * Interrupts may happen between hardirq_disable_enter() and
> > +	 * local_irq_save() in local_interrupt_disable(), if irq_exit() invokes
> > +	 * softirq here, we may have a softirq handler calling
> > +	 * local_interrupt_disable() but it won't disable the irq because
> > +	 * hardirq disabling count is already 1, hence we need to prevent
> > +	 * invoking softirq when a local_interrupt_disable() is ongoing.
> 
> Non-standard spelling of 'IRQ'.
> 
> > +	 */
> > +	if (!in_interrupt() && !hardirq_disable_count() &&
> > +	    local_softirq_pending()) {
> >  		/*
> >  		 * If we left hrtimers unarmed, make sure to arm them now,
> >  		 * before enabling interrupts to run SoftIRQ.
> 
> Non-standard spelling of 'softirq' here.
> 

Fixed.

> There's also new spelling errors in some of the comments introduced
> by this patch.
> 

Will try to find and fix these as well.

[1]: https://lore.kernel.org/rust-for-linux/20260803142106.GF687043@noisy.programming.kicks-ass.net/

Regards,
Boqun

> This is a very low quality patch, it should never have been included
> and declared 'ready' for upstream. It's not even close!
> 
> Thanks,
> 
> 	Ingo
