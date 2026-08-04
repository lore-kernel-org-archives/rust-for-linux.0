Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6591032B10D
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 04:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785818466; cv=none; b=hDiBgdCgdCgvfCLMDPznm/FgYyL5kXFB8anHGzUzuoHZHxJi009SBxzSMDVh0Nfqkacb9ccJ6t5ZyuwUVfnnQpgJmZIxTst3aA3ubOsj4/SonA2SQYT7WIZcU/O9kMShAWym1LlIOhxWEda10Fw0xMDxgd6WwiHWYYRXHrLgH/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785818466; c=relaxed/simple;
	bh=E/QMJtRC1jMdMGDKIqUCRLVVeAV/9Q8uCRCj+cj9f70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IA3Da13IXCstyKRnwEtW/1uOxkH237focgcZqKVfDLn7BT1oMv4URCARv7m7zf8Ehuo4fSXhle3fknr75rKmFL0QeL3oLj6BufcHjzv31nwunDdLhS2VvU3MkPXmCgf39Aa7bqgH/kFSjUkxDoC8oCC8vua/eDQxCQL/fnIlilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWI/MDeu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWI/MDeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AC51F000E9;
	Tue,  4 Aug 2026 04:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785818465;
	bh=zDDRvNpwIcPJaOmZXUWamxaIiadF1tSKMFLhidGIlDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aWI/MDeuJj9ZNfXic7t4yXDK6AVS0if4Dv1nHiBYAL2R9LbJDuB5Ecs97xUpSO0My
	 piNCgssUVaYWhekiaBmY4rt2Yr52uYJ+aQnONXX6fn2B37XmgEQJlPBQccKwka06wF
	 Fuo2SHicKveMkutIkGwrFKToksl78QCrD08Tjxwd2Rq5xwxLX9qAlrXWg2d5ffPo4l
	 sph50F0FIFCcukPnXSWaiqqG0ynU5ZhLg+yKhYWyJTr2e6lJEOp5EVLCGrseVKOPyK
	 r/sGfl5P2qwAhVJQFRh/y/V0KLB0KwhvOhJXPCI47fmHP8gHInOYatGjngREalZ0PO
	 V52CpRjyvDPqw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BC280F40066;
	Tue,  4 Aug 2026 00:41:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 04 Aug 2026 00:41:03 -0400
X-ME-Sender: <xms:X21xaii8W90ECcrOimhu6F4uq7cQpMYAAQxS_T5HetGkt74_DyzKOg>
    <xme:X21xatYhMFflyat_N0LYEAwz5OandPGIpQoSnva_Ok0EGOWPkzgdHO-KCYzIV2NLw
    IruMjGbtSHZqrTGrPKggamewSEG368Pq96McemudEcBIYLStdT0YQ>
X-ME-Received: <xmr:X21xagNM88-TMOc_EPzdoLY8nf2jt9-SbA4sORMh0VRjJtCMNbDNGqhTyS4vczktpWvuZeRBtiIOgWR9n6q2JN-ZDu-a0k4W>
X-ME-Proxy-Cause: dmFkZTFuAJM6oCOos/T1GcS3aHgvFInzwzGj4iWatViKQDrVJ8KYRVKSwilnhen7UVf7lW
    3E6EZKG/zcyGqkWMBr+u5CwtYVJCw/XmJRCiOJNDcKr9v+SD1Owy85t6Z2bztkGuLVQXKX
    4804TT60oGV+1LImvAI3XGJfH/pLWVlaJVVd93+6jHGHPuUKgDq2Uc2nAPg0nYtxmnEXxW
    Ya/pfDtno1Gp6S5kL6YJZ4ioiLMl4pBtFIYufcKFgO1aQyi0pE7AaUf3AcShY7Y2Oe7N1Y
    Rmua8FvWmEU7rkTP+K8/edNzK5djADug2oRMu6GHVQjlqY221uaWXoog1UnFde35QPnfdl
    BvV3rgQji7DK0j/doswwKyDSorlNd1Kdnco7oWKvG6sVFoUyxIyiahOcrLNKRzsS2/RIH0
    CBRDLqgMD/pct+Zokfzd7XoLzH0n/KKn/rN0K4BO5HQsxQfZzcnx81KrOlyWadVeI1lAkU
    wNik6AKjKi8OyNjSyxfamYMwl5kTF8itQ99ZBAEjocHIwRs0OPCEYtgCHUhqPlkEk+WU/d
    l6xgbuFn0zgHjg6mgnOj3EqdvJNLY75VCMv4nJi+PGdyA6kUkAu7WcikNlz9qQNyWuCUGe
    HuvCdwPdKBeHPYBvEMO9fPgxgVSev6xj0CjhW4vuRM0j/R9ijvL6orwEpr1Q
X-ME-Proxy: <xmx:X21xamYzDelndUg2QAqel9koBh0z6Ou_GGfwHTdNh4-zu9DVDyDtFQ>
    <xmx:X21xaoWL_4ADAMx9hR9ZChvGCGwyNJneKyOspq_wRqtncO3e6Vs3rw>
    <xmx:X21xatBYbqygthQi_dwZ0bL8Z3JD9h9iy1eMcw03Ef0N-X89DOrk3Q>
    <xmx:X21xasIgai9nxFIUmtvSdI-jtTOC1Y4KKCquBioVvOPxte0c6fr7gA>
    <xmx:X21xajsOCE9ln78_wfal9d0DqN0URjBWFRd1C8I9le50Xbexx8g6ePvw>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 00:41:03 -0400 (EDT)
Date: Mon, 3 Aug 2026 21:41:02 -0700
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
Message-ID: <anFtXgGUiTmqimkz@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803092910.GD49951@noisy.programming.kicks-ass.net>
 <20260803104321.GL49529@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803104321.GL49529@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 12:43:21PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 03, 2026 at 11:29:10AM +0200, Peter Zijlstra wrote:
> > On Fri, Jul 31, 2026 at 01:30:06PM -0700, Boqun Feng wrote:
> > > +++ b/include/linux/interrupt_rc.h
> > > @@ -0,0 +1,67 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * include/linux/interrupt_rc.h - refcounted local processor interrupt
> > > + * management.
> > > + *
> > > + * Since the implementation of this API currently depends on
> > > + * local_irq_save()/local_irq_restore(), we split this into it's own header to
> > > + * make it easier to include without hitting circular header dependencies.
> > > + */
> > > +
> > > +#ifndef __LINUX_INTERRUPT_RC_H
> > > +#define __LINUX_INTERRUPT_RC_H
> > > +
> > > +#include <linux/irqflags.h>
> > > +#include <asm/processor.h>
> > > +#ifdef CONFIG_SMP
> > > +#include <asm/smp.h>
> > > +#endif
> > > +
> > > +/* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> > > +struct interrupt_disable_state {
> > > +	unsigned long flags;
> > > +};
> > > +
> > > +DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> > 
> > I'm a bit confused by the need for this struct; afaict there aren't any
> > additional members in the rest of the series. So at this point this is
> > pointless wrappery, no?
> > 
> > Having this variable exported is unfortunate.
> 
> One option to get rid of that EXPORT would be something like so I
> suppose.
> 
> ---
> --- a/include/linux/interrupt_rc.h
> +++ b/include/linux/interrupt_rc.h
> @@ -12,21 +12,52 @@
>  #define __LINUX_INTERRUPT_RC_H
>  
>  #include <linux/irqflags.h>
> +#include <linux/preempt.h>
>  #include <asm/processor.h>
>  #ifdef CONFIG_SMP
>  #include <asm/smp.h>
>  #endif
>  
> +#ifndef MODULE
>  /* Per-cpu interrupt disabling state for local_interrupt_{disable,enable}() */
> -struct interrupt_disable_state {
> +DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
> +
> +static __always_inline void __local_interrupt_disable(void)
> +{
>  	unsigned long flags;
> -};
>  
> -DECLARE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> +	local_irq_save(flags);
> +	raw_cpu_write(local_interrupt_disable_state, flags);
> +}
> +
> +static __always_inline void __local_interrupt_enable(void)
> +{
> +	unsigned long flags = raw_cpu_read(local_interrupt_disable_state);
> +	local_irq_restore(flags);
> +}
> +
> +#ifndef INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
> +static __always_inline void _local_interrupt_disable(void)
> +{
> +	__local_interrupt_disable();
> +}
> +
> +static __always_inline void _local_interrupt_enable(void)
> +{
> +	__local_interrupt_enable();
> +}
> +#else
> +extern void _local_interrupt_disable(void);
> +extern void _local_interrupt_enable(void);
> +#endif
> +
> +#else /* !MODULE */
> +extern void _local_interrupt_disable(void);
> +extern void _local_interrupt_enable(void);

I think the "extern" keywords are not necessary and ..

> +#endif /* !MODULE */
>  
>  static inline void local_interrupt_disable(void)
>  {
> -	unsigned long flags;
>  	unsigned long new_count;
>  
>  	WARN_ON_ONCE(in_nmi());
> @@ -35,10 +66,8 @@ static inline void local_interrupt_disab
>  
>  	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
>  
> -	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET) {
> -		local_irq_save(flags);
> -		raw_cpu_write(local_interrupt_disable_state.flags, flags);
> -	}
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> +		_local_interrupt_disable();
>  }
>  
>  #ifdef CONFIG_PREEMPTION
> @@ -63,14 +92,8 @@ static inline void local_interrupt_enabl
>  
>  	new_count = hardirq_disable_exit();
>  
> -	if ((new_count & HARDIRQ_DISABLE_MASK) == 0) {
> -		unsigned long flags;
> -
> -		flags = raw_cpu_read(local_interrupt_disable_state.flags);
> -		local_irq_restore(flags);
> -
> -		local_interrupt_enable_reched(new_count);
> -	}
> +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0)
> +		_local_interrupt_enable();
>  }
>  
>  #endif /* !__LINUX_INTERRUPT_RC_H */
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -9,6 +9,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#define INSTANTIATE_EXPORTED_INTERRUPT_DISABLE
>  #include <linux/export.h>
>  #include <linux/kernel_stat.h>
>  #include <linux/interrupt.h>
> @@ -88,8 +89,17 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabl
>  EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
>  #endif
>  
> -DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> -EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
> +DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
> +
> +void _local_interrupt_disable(void)
> +{
> +	__local_interrupt_disable();
> +}
> +
> +void _local_interrupt_enable(void)
> +{
> +	__local_interrupt_enable();
> +}
>  

We need to EXPORT_SYMBOL_GPL() for these two functions.

Right?

Regards,
Boqun

>  #ifndef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
>  /*
