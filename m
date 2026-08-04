Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69926ED33;
	Tue,  4 Aug 2026 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785828412; cv=none; b=OW27Rc0BE0E8yoUOpft48mLRtD3L0O36nX8mxCQLYyhgcmM23jHhwJcJvUDv+zYqwsSf6g1OJz5M4wpPtR0ZaPSX+NGQZ/tx1kJtDKYyDTj29aFn2oxtruEYFgg+6CKWiSNt7CJ6RjJOkMas1M9eg8GAM/qJiAhaCLtxz/L0BEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785828412; c=relaxed/simple;
	bh=hqqM5xc2+M05xiSAB2ec8pil1GsopkeAXm63IV+m7s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KW4PAD7lHEJURSlDktoRauMhoRaFrl3LGB5eMcql0hqdAmCP/CGoydJPHZjLoqgdDb8Qu5JgvqIj96C0fba/XPYa7Q152kQv6qOdW8fxmm222gDQbdxHhq8eJWMv1cKCypboXR0FsYaIL+1CxP127Q0Zl6JMO/VcpQonDJ2z1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Vp2doBV9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vp2doBV9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tv8UyrWB7Yka7wbBRCFcDz7G+gPe2c4zMcsQGy/f61E=; b=Vp2doBV9hu97dAMvBufKOWx1P5
	9F8ewEPH0nYkQNcZfgaazlnwatAzTNXFeWHj030Bve5yShIzReJeb/8DSSeDCi/dMtBY7UJGjYnKz
	uNuqfBwVRU67JNNY9g77UeSAndSomIWBO3ZalhWUpFRnHWMXbHpTBZKkqjwvAsV6DjTJAGGI2vzsX
	rldgKACk2aEDQd3m1N6y3TFwlnUpXR85AbXK8+xepOCzzkzDRzYRpob9/4WqLSxcQrejXrQIaG7gm
	M1jcgP1NHQpEzVomJi6/UF0V0cbx2rj7SUEH6GoAzMDRgeyVCDpN3TADlwBoxKmjU0t+Dav98Yr5V
	ihaZL9QA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Xv-000000017Zk-2Y8y;
	Tue, 04 Aug 2026 07:26:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F1E3E30093A; Tue, 04 Aug 2026 09:26:40 +0200 (CEST)
Date: Tue, 4 Aug 2026 09:26:40 +0200
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
Message-ID: <20260804072640.GL687043@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803092910.GD49951@noisy.programming.kicks-ass.net>
 <20260803104321.GL49529@noisy.programming.kicks-ass.net>
 <anFtXgGUiTmqimkz@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anFtXgGUiTmqimkz@tardis.local>

On Mon, Aug 03, 2026 at 09:41:02PM -0700, Boqun Feng wrote:

> > +#ifndef MODULE
> >  /* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> > -struct interrupt_disable_state {
> > +DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
> > +
> > +static __always_inline void __local_interrupt_disable(void)
> > +{
> >  	unsigned long flags;
> > -};
> >  
> > -DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> > +	local_irq_save(flags);
> > +	raw_cpu_write(local_interrupt_disable_state, flags);
> > +}
> > +
> > +static __always_inline void __local_interrupt_enable(void)
> > +{
> > +	unsigned long flags = raw_cpu_read(local_interrupt_disable_state);
> > +	local_irq_restore(flags);
> > +}
> > +
> > +#ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
> > +static __always_inline void _local_interrupt_disable(void)
> > +{
> > +	__local_interrupt_disable();
> > +}
> > +
> > +static __always_inline void _local_interrupt_enable(void)
> > +{
> > +	__local_interrupt_enable();
> > +}
> > +#else
> > +extern void _local_interrupt_disable(void);
> > +extern void _local_interrupt_enable(void);
> > +#endif
> > +
> > +#else /* !MODULE */
> > +extern void _local_interrupt_disable(void);
> > +extern void _local_interrupt_enable(void);
> 
> I think the "extern" keywords are not necessary and ..

Probably, but I like them (and I know that other people hate on then).
To me it makes it clear the definition is not here and should be sought
elsewhere.

The extern really is needed for variables, but I also use it with
functions for the same.

> > +#endif /* !MODULE */
> >  

> > --- a/kernel/softirq.c
> > +++ b/kernel/softirq.c
> > @@ -9,6 +9,7 @@
> >  
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >  
> > +#define INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
> >  #include <linux/export.h>
> >  #include <linux/kernel_stat.h>
> >  #include <linux/interrupt.h>
> > @@ -88,8 +89,17 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabl
> >  EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
> >  #endif
> >  
> > -DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> > -EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
> > +DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
> > +
> > +void _local_interrupt_disable(void)
> > +{
> > +	__local_interrupt_disable();
> > +}
> > +
> > +void _local_interrupt_enable(void)
> > +{
> > +	__local_interrupt_enable();
> > +}
> >  
> 
> We need to EXPORT_SYMBOL_GPL() for these two functions.
> 
> Right?

Quite so.
