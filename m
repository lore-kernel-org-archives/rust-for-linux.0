Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC668349CD2;
	Thu,  6 Aug 2026 00:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785977886; cv=none; b=oD1cJdcUXd1zqiuBo+7zwRRc+JgCtT6MuxaytZR9h2K65/K8jD8RRDzX5MwUXwNIuBnbN6A68hxRlEcM6Rz4kDHyiTGYTvnI3KvQfNLsjmgUMQq3USyzej7bfd7tfITp5CvOqetEE61O9tUxC3mqzVvMdLOLISsvcgS6NS/fj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785977886; c=relaxed/simple;
	bh=oUP1tRYlZSATYDS8ZuQH09G4VTtAle+Rc4+z9YRmQq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q60UhSJECcod+It+nACQdaPliIqC1DPjKE1b84/Ng/zTNqP1mvqFYhuLwdFfoljnD1XRx6vFmxE34h8SocOvD2lHplAuM2vt/nzLeyP/IjG4DeHGV4wnKqfS0b1zeta6E4zmT7nBO3qHw+dexldB0r63l8eYku8jKr584hFM9yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnTL3B7s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnTL3B7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FF71F00A3D;
	Thu,  6 Aug 2026 00:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785977884;
	bh=46aXUg7oqDilWF0lCAkvTgzgcoJI//kDZx/wA1eD97g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WnTL3B7ss7Lmq3AEdIKI6qm8T2rK0l/9e6P8fYlEtPCkxCGvwXA60C1yqyx35Sc0L
	 wJLDfygZISPf5ye17qeADFN4NwSVuc1uz7OK0kEMClHRsmmLgi//BIyomNPfWMXo6E
	 NkRsLrQJnI1qhMzr1AMjUYMSyXLfRv/2KfN1y4X/AHXfsUKlFQfujAlLDa9HnIsfAQ
	 230MznFWdNE5IbLCUP1YtNWECrznTMY4ocJnREF7774P73LMqcRe+uKuEl8GWp/nn2
	 N4PiPISHK2d6RoPALdR/DKHa3xYMbQvAowOJT5bBwDcd+Rme1v3pjLbND1YfnSwAFe
	 +ajMfAp/US4wQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id BD6D6F40067;
	Wed,  5 Aug 2026 20:58:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 20:58:02 -0400
X-ME-Sender: <xms:GtxzaoB1ycpqTwucvPIL35kVQShhJU0kjnLbDubJdlt5sT7Go6MjTQ>
    <xme:Gtxzap8rv8Q4lWMSCdlbsVQXzo5Gl9LDBV85O1erkMXs-3Y6I8dRaxEXQdPbDr1Qv
    dP-7YggfL4xUtXn8B7135Xe_j_QKfmTWJPEoXqyMaAy3ARF8gFajlg>
X-ME-Received: <xmr:GtxzaspxVTOEGViw5Mfkn6T5I0z1EXmePmR7Rz0Udao02lPMT1eqXPajLGe6erJj762uBmtM8C9uZv8IHi3fRzrRMlxaT5f2>
X-ME-Proxy-Cause: dmFkZTEWR+LlDctKEBSb0iz6fwSXZiMhRM/E74xtYYnk6sq35gQ6rwOchEDL1FdTbIoESh
    PE6S1zSRTqqlAVpUViL/Vt1Xx85/Te4pps+PGU5kuIr2O/pFmlOIdzDjk8kViVXxhqQhPU
    G4gX8IuFY+J7Un1sP0e1hcTkXG4QIASPoFciNZ6X638uXoC6UzyD+7eQqwNbhsaOJXcFew
    3UDndWwEEPazPYRX3agZaqo4BHD7gBAneAFw0UXG41OxOPbeJHTtUYNqPSDL/t1ZB8Lal3
    LJNJCDLxyezW5jfJsjLkEgcQjryV3P5Idg6dPZChPZ7Xr6GSOx4FMdhdJpYkRqAmQHQvKS
    O0Hzs25GzTtCukuBH5cbg289plFuHUktlKwbmOiR8zBNHjDVQ8zhXax60osEXvLDvkMkNi
    MAnDY5WZ4iz97a865xKhxjsVrA9f/XRxD1vJ2ylUrCzr2IzL9Ujpytph80KUzYpQzbDG0C
    SUBZliC/0wPyt4MmIOnDLAONGGtoJQpPLN+oSk15tOUQfgn8wqYJASbocup/pRr5pnjamH
    opzveJLE6mP56z2abXQ3vnur5O/WXLMDAfakb7v2rdk4SDWpTb3HHr0OMPHaSXwUZUfH05
    0fZuKoPr4PXYQcqrPMTXSsywTXcC2yyftgCfrOGz5I1aYHjmRHfCUeGucF0g
X-ME-Proxy: <xmx:GtxzajFif-W-RHyTZYT_zKpqBUfbqZAXfNNlrskLjxEpA01ecFEVpA>
    <xmx:Gtxzag9FhI15IW9SEEzS2fyQkazT3J7cFd3CCyMJg6OpuvTYqqgTjA>
    <xmx:GtxzagSxwhnKFIjPQUtqwbNRlOcx9BdlY9W0eAi2x_5AVJNvkao1fA>
    <xmx:GtxzaloBSqXE-xPc-nAvLfXEUlfS8oO4UljbO98une8ImST_s09sHA>
    <xmx:GtxzatPOZNyOXQuEKJNni_Tiz5QD41w2ABtlSaDyo2jYonKeZdinI2QW>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 20:58:02 -0400 (EDT)
Date: Wed, 5 Aug 2026 17:58:00 -0700
From: Boqun Feng <boqun@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 10/17] preempt: Introduce
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <anPcGFXV1GrhJxdV@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-11-boqun@kernel.org>
 <2a9aec78-fe1b-49c9-884f-a59eb36c8905@linux.ibm.com>
 <anLeKu7X6SndqFR4@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anLeKu7X6SndqFR4@tardis.local>

On Tue, Aug 04, 2026 at 11:54:34PM -0700, Boqun Feng wrote:
> On Wed, Aug 05, 2026 at 01:41:48AM +0530, Shrikanth Hegde wrote:
> > Hi Boqun,
> > 
> > On 8/4/26 9:44 PM, Boqun Feng wrote:
> > > With the changes that enable preempt count to track IRQ disabling
> > > nesting, we don't have enough bits in 32-bit preempt count
> > > implementation, as a result we move NMI nesting bits out of the 32-bit
> > > preempt count. However on the architectures that can support 64-bit
> > > preempt count implementation, we can keep the NMI nesting bits in the
> > > 32-bit preempt count and avoid maintaining NMI nesting bits outside of
> > > the same cache line.
> > > 
> > 
> > [...]
> > 
> > > --- a/include/linux/hardirq.h
> > > +++ b/include/linux/hardirq.h
> > > @@ -10,8 +10,6 @@
> > >   #include <linux/vtime.h>
> > >   #include <asm/hardirq.h>
> > > -DECLARE_PER_CPU(unsigned int, nmi_nesting);
> > > -
> > >   extern void synchronize_irq(unsigned int irq);
> > >   extern bool synchronize_hardirq(unsigned int irq);
> > > @@ -94,6 +92,37 @@ void irq_exit_rcu(void);
> > >   #define arch_nmi_exit()		do { } while (0)
> > >   #endif
> > > +#ifdef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
> > > +static __always_inline void __preempt_count_nmi_enter(void)
> > > +{
> > > +	__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);
> > > +}
> > > +
> > > +static __always_inline void __preempt_count_nmi_exit(void)
> > > +{
> > > +	__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);
> > > +}
> > > +#else
> > > +DECLARE_PER_CPU(unsigned int, nmi_nesting);
> > > +
> > > +#define __preempt_count_nmi_enter()				\
> > > +	do {							\
> > > +		__preempt_count_add(HARDIRQ_OFFSET);		\
> > 
> > nit: This limit is because to have the same behavior as other case when
> > NMI_BITS=4 right?
> > It is not easy to infer that from comment.
> > 
> 
> It's sort of design by implementation IIUC, previously because of
> NMI_BITS=4, we could only support nesting level being 15. And here we
> just want to keep the same behavior here.
> 
> If your question is why 15 was a good number before this change, I guess
> would be it's just a number that is neither too big or too small.
> 
> > > +		/* Maximum NMI nesting is 15. */		\
> > > +		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
> > > +		__this_cpu_inc(nmi_nesting);			\
> > > +		preempt_count_set(preempt_count() | NMI_MASK);  \
> > 
> > 
> > Is there a reason preempt count updates are split rather than
> > folded into a single preempt_count update?
> > 
> 
> Keeping the implementation simple is one reason, most architectures
> could utilize the HAS_SEPARATE_PREEMPT_RESCHED_BITS for better
> performance. So that reduces the importance of having something
> complicated but saves one access here. But if you see an optimization
> that can be done here, please do share!
> 
> Peter had proposed one optimization here:
> 
> 	#define __preempt_count_nmi_enter()				\
> 		do {							\
> 			unsigned int _o = NMI_MASK + HARDIRQ_OFFSET;	\
> 			/* Maximum NMI nesting is 15. */		\
> 			BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
> 			__this_cpu_inc(nmi_nesting);			\
> 			_o -= (preempt_count() & NMI_MASK);		\
> 			__preempt_count_add(_o);			\
> 		} while (0)
> 	
> 	#define __preempt_count_nmi_exit()				\
> 		do {							\
> 			unsigned int _o = HARDIRQ_OFFSET;		\
> 			if (!__this_cpu_dec_return(nmi_nesting))	\
> 				_o += NMI_MASK;				\
> 			__preempt_count_sub(_o);			\
> 		} while (0)
> 
> but it has a problem considering this:
> 
> 	// outermost NMI handler
> 	// nmi_nesting == 0
> 
> 	nmi_enter();
> 	// ^ nmi_nesting == 1 and NMI_MASK is set.
> 	...
> 	nmi_exit():
> 	  if (!__this_cpu_dec_return(nmi_nesting)) // return true
> 	    _o += NMI_MASK;
> 	  <NMI start>
> 	  nmi_enter();
> 	  // ^ nmi_nesting == 1 and NMI_MASK is set.
> 	  nmi_exit();
> 	  // ^ nmi_nesting == 0 and NMI_MASK is *unset*.
> 	  <NMI end>
> 
> 	  preempt_count_sub(_o); // _o == HARDIRQ_OFFSET + NMI_MASK,
> 	  			 // underflow
> 
> (Now think about this, the __preempt_count_nmi_enter() does seems
> fine, maybe we can keep that, too tired to remember whether there is any
> subtly here... will take another look tomorrow)
> 

Ok, now I remember the issue of the preempt_count_add() implemented
__preempt_count_nmi_enter(), considering this:

 	// outermost NMI handler
 	// nmi_nesting == 0
 
 	nmi_enter():
	  __preempt_count_nmi_enter():
	    unsigned int _o = NMI_MASK + HARDIRQ_OFFSET;
	    ...
	    __this_cpu_inc(nmi_nesting);
	    // ^ nmi_nesting == 1
	    _o -= (preempt_count() & NMI_MASK);	
	    // ^ _o == NMI_MASK + HARDIRQ_OFFSET because the NMI_MASK bit was not set
	    <NMI start>
	    nmi_enter();
	    // ^ nmi_nesting == 2 and NMI_MASK is set.
	    nmi_exti();
	    // ^ nmi_nesting == 1 so NMI_MASK is *still* set
	    <NMI end>
	    __preempt_count_add(_o);	
	    // ^ NMI_MASK overflows because of the addition.

Make sense?

But maybe there are clever ways that I don't know. Please do tell!
	    
Regards,
Boqun

> Regards,
> Boqun
> 
> 
> > > +	} while (0)
> > > +
> > > +#define __preempt_count_nmi_exit()				\
> > > +	do {							\
> > > +		__preempt_count_sub(HARDIRQ_OFFSET);		\
> > > +		if (!__this_cpu_dec_return(nmi_nesting))	\
> > > +			preempt_count_set(preempt_count() & ~NMI_MASK); \
> > > +	} while (0)
> > > +
> > > +#endif
> > > +
> > >   /*
> > >    * NMI vs Tracing
> > >    * --------------
> > > @@ -110,18 +139,14 @@ void irq_exit_rcu(void);
> > >   	do {							\
> > >   		lockdep_off();					\
> > >   		arch_nmi_enter();				\
> > > -		/* Maximum NMI nesting is 15. */		\
> > > -		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
> > > -		__this_cpu_inc(nmi_nesting);			\
> > > -		__preempt_count_add(HARDIRQ_OFFSET);		\
> > > -		preempt_count_set(preempt_count() | NMI_MASK);	\
> > > +		__preempt_count_nmi_enter();			\
> > >   	} while (0)
> > >   #define nmi_enter()						\
> > >   	do {							\
> > >   		__nmi_enter();					\
> > >   		lockdep_hardirq_enter();			\
> > > -		ct_nmi_enter();				\
> > > +		ct_nmi_enter();					\
> > >   		instrumentation_begin();			\
> > >   		ftrace_nmi_enter();				\
> > >   		instrumentation_end();				\
> > > @@ -129,12 +154,8 @@ void irq_exit_rcu(void);
> > >   #define __nmi_exit()						\
> > >   	do {							\
> > > -		unsigned int nesting;				\
> > >   		BUG_ON(!in_nmi());				\
> > > -		__preempt_count_sub(HARDIRQ_OFFSET);		\
> > > -		nesting = __this_cpu_dec_return(nmi_nesting);	\
> > > -		if (!nesting)					\
> > > -			preempt_count_set(preempt_count() & ~NMI_MASK);	\
> > > +		__preempt_count_nmi_exit();			\
> > >   		arch_nmi_exit();				\
> > >   		lockdep_on();					\
> > >   	} while (0)
