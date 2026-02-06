Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E434DCC4;
	Fri,  6 Feb 2026 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770367515; cv=none; b=MRo03lQ6/rRDZhVGd4i+KtT9ePAuJYVpm0oJcwNYVVbZ9O0nL4o4NZXpfkMzqDTuyDjq0ms8TM4ARiN7gb5DCNEEGnVz8yza1k3g7IPHwZpoglv1LcCNjv7HA8y773lpsxd8fBTOGnu6OtnB0z0dpc1S6H84bE9seQacKLOhBzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770367515; c=relaxed/simple;
	bh=XxhE0/MRGtH2BwXsguVpnOR7utO1If5TEcJ5x6lKKN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvhGcVEnF0OUvzxgznUqrsv4fkEJWLiEp81lyrtIlTn5xoP9LUvc3qAiLUXkbbcjZs+TtVCtRNbf2maR94j5C0K4XCLd9IuQY/+23Z2tpkkRcHDi8l76UP5VHvBo8U40Ysq8v7rvbrhkvBHCu7oz7MkAMcPMD29TZrTdJvXXXLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AFEUJ1WO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AFEUJ1WO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P6VMGNbf3gAkj+pmL/XOWPnqn3QvJRF1k2W7G3nV7sc=; b=AFEUJ1WOnwhhLYfXtaoLTnnbJ7
	UN+ZZng8HPnoFWpBMQkrwP3VAWPFGQamcwSALuQmFzQQwvRF8gCX7iUSfUrzhk3VZASmFAK9noCRF
	p5+HCKtbuGLXA08XqggJqo325GoximrETlhKeLiZ9fHdltga51gToDOg2rPRcieI/Z55NI/ZCuHp4
	lRoSFeiBowUkNqgaMNs8X0x6q0fMwH8P7yHGH5IZ6N6Agr1zJYIxCIK/bAw84e47msDjKrM5ZPVDR
	l2ipvCUImSooRNLLG6j26Nrr6VoKe58sg5R1wPgx7VAZnWwW9uKMDhjCLroCXE0ymGANVet/kAmcy
	XXIp0eqg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHSc-00000004uiu-1jd3;
	Fri, 06 Feb 2026 08:45:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EA438302DA9; Fri, 06 Feb 2026 09:45:05 +0100 (CET)
Date: Fri, 6 Feb 2026 09:45:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <20260206084505.GP1282955@noisy.programming.kicks-ass.net>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
 <aYUUrHQliNIoe9eQ@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYUUrHQliNIoe9eQ@tardis.local>

On Thu, Feb 05, 2026 at 02:07:40PM -0800, Boqun Feng wrote:
> On Wed, Feb 04, 2026 at 12:12:34PM +0100, Peter Zijlstra wrote:
> [...]
> >  DEFINE_PER_CPU_CACHE_HOT(unsigned long, cpu_current_top_of_stack) = TOP_OF_INIT_STACK;
> > diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
> > index d57cab4d4c06..77defd9624bf 100644
> > --- a/include/linux/hardirq.h
> > +++ b/include/linux/hardirq.h
> > @@ -108,15 +108,14 @@ void irq_exit_rcu(void);
> >  	do {							\
> >  		lockdep_off();					\
> >  		arch_nmi_enter();				\
> > -		BUG_ON(in_nmi() == NMI_MASK);			\
> > -		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
> > +		__preempt_count_nmi_enter();			\
> >  	} while (0)
> >  
> >  #define nmi_enter()						\
> >  	do {							\
> >  		__nmi_enter();					\
> >  		lockdep_hardirq_enter();			\
> > -		ct_nmi_enter();				\
> > +		ct_nmi_enter();					\
> >  		instrumentation_begin();			\
> >  		ftrace_nmi_enter();				\
> >  		instrumentation_end();				\
> > @@ -125,7 +124,7 @@ void irq_exit_rcu(void);
> >  #define __nmi_exit()						\
> >  	do {							\
> >  		BUG_ON(!in_nmi());				\
> > -		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
> > +		__preempt_count_nmi_exit();			\
> >  		arch_nmi_exit();				\
> >  		lockdep_on();					\
> >  	} while (0)
> > diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> > index d964f965c8ff..7617ca97f442 100644
> > --- a/include/linux/preempt.h
> > +++ b/include/linux/preempt.h
> [...]
> > @@ -132,6 +145,27 @@ static __always_inline unsigned char interrupt_context_level(void)
> >  # define in_task()		(!(preempt_count() & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET)))
> >  #endif
> >  
> > +#ifndef CONFIG_PREEMPT_LONG
> > +DECLARE_PER_CPU(unsigned int, nmi_nesting);
> > +
> > +#define __preempt_count_nmi_enter()				\
> > +	do {							\
> > +		unsigned int _o = NMI_MASK + HARDIRQ_OFFSET;	\
> > +		__this_cpu_inc(nmi_nesting);			\
> > +		_o -= (preempt_count() & NMI_MASK);		\
> > +		__preempt_count_add(_o);			\
> > +	} while (0)
> > +
> > +#define __preempt_count_nmi_exit()				\
> > +	do {							\
> > +		unsigned int _o = HARDIRQ_OFFSET;		\
> > +		if (!__this_cpu_dec_return(nmi_nesting))	\
> > +			_o += NMI_MASK;				\
> > +		__preempt_count_sub(_o);			\
> > +	} while (0)
> > +
> > +#endif
> > +
> 
> We need to move it into include/linux/hardirq.h because percpu is not
> included in <linux/preempt.h>.

That is fine. I also realized you can move the variants from
arch/x86/asm/preempt.h right next to it, it only depends on
PREEMPT_LONG, not anything else, so there is nothing arch specific to
it.

Avoids that getting duplicated on arm64,s390 etc.
