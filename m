Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207393DDB10
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 06:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785912883; cv=none; b=kLmS/o2VX1HdfQNrQx4vrXjw3i5PeeZ4r5HxNZzeOgPKPGREWoXNnRXSPm5JjR81ZwwKlKehmtaaZ1fjJUOkWVlu5AOHMlhfl2LdsWlJV32hsdgbWaefc+tNLdOgvDKU6x4dLb2CsHHAVRjexp//Eb71Q7ENt5bklwo/w3tZw94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785912883; c=relaxed/simple;
	bh=HWTjcUSN2IB6boG4Q2RaNBHxxImxjEk8dTCYk0sy/cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsSgJ4r9XJqXy1yIdT0ygHARLJHC4IpADXBa1IQ2/I+7WFj+kEckLYGUWFVCv4r9O53nLCGcxDocgJ7xdj5f1O4BFQIMeyjPaQKlPFDl9VAAkmrIiD7hpdHzMpeA+r0PTv8nPJH/Xya47Pv+8rfp2t8gk54ubQaRUaiZKSTzwhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvoWnqaA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvoWnqaA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63881F000E9;
	Wed,  5 Aug 2026 06:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785912877;
	bh=mtk5yG+p2oMXSBi9xKVejvcKTnpxSTk2FClm4+Pw6k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WvoWnqaAVGYhwlgKP2/GaD+02sxboe/5P90tMyFtotB2hm5i0quiMH5pIDip5m40u
	 /cbsPwkQpYoEzZJ1bFW46Q0MEljRLjJwdtrDfXiWBVwL0kDTlPcd+yJSeOJc1xmj6Y
	 wF8/xXJ4gMoTuqpQJV5ji6/Xmeap1V8cCDM83IOaecVD+2xiBctz4lRFmHr8Mhx3gq
	 U0zhDms3HohPmlaYfBRsZklyWu352Or1CXRFGqe0oA90FtibkaxKwFc3DWJL5pekB9
	 xZ+H3+aF4E5d5iWZSqERXMSiJ70mf/e2YjR8hqJXF1D74bbRUOeg15aWp+tzBz0obD
	 PKP01xuDG8V9g==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id BDC8AF40067;
	Wed,  5 Aug 2026 02:54:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 02:54:35 -0400
X-ME-Sender: <xms:K95yakWDLHvlWcVmGiPaleGBnI-EkZHM1OqtAEpNz8G2SHb4hnvutQ>
    <xme:K95yaoAG52Rf8SBuoMFX5j9p8XF7cJ6FPuCFlPs-b085JhQzRm9ePWn-ZmF3npu0k
    yIUziEZWYpAWX1cV44pqcPW_XYQIACqNHraAYBPhLe1k3Jjxy_qpQ>
X-ME-Received: <xmr:K95yapfJXxhDLlS0cChp6tzmuBOJtCPEOVZ40QY21sAU684t-RcZ94lOTvj8fr3dtZbhzfqIK5ygqgH8GbgmCqPf6YZ2cRgi>
X-ME-Proxy-Cause: dmFkZTGZFQ0o86FLaqWtagjmJkkfgguVhRIBRhz0ClfX0CN3tVHB90PF7NouXCpt0F8K1W
    ImYVX2ILHZmJ6riCe/GagrrY+CsEGzYmcJBFesyWnOf4NxQ0noVgnIY0uTWxQcoOrmaeqj
    vA9N4t7HZemiYbQDXeRBPGJZqequZ9mOfMGNXmkDzotk0vj/86KicPxrmzHO7GeqNLrYj+
    Tyv7XawxP0YmhKLVUnkC5nvoCaRY2uu9bbEIdnHjB6daK6n2WrK8SozQ3yMmu7wnax4pnV
    mC3HqMXNtw2RcDq6tGVUmze0Sd4wg3bxL422Npb0/xGZvYl716d2ivOyU6S/TGlIHsgAds
    irN2YzyhhMUWok/Ee3kJ6LDh6PUmTnC84Z3vzTdeXvfHU6EoO5u8lTMPLPhyRq5DAKwkfH
    iNeOdM8+/NnHaAJtV5Av/8z6QMU4wkoOpz6oE0uyyre3Qj52HdPgGYtDsm62k+c+Ihloho
    WKv4lxGB07/yzTQZahbQxwhi7NLq6r14dOIZNMsdEK0dQdZeV68tnusdLlqKHtfKc0PimS
    Ym/2LRdoxZLKom13lI2bxvTpvcf5ugtdILH8+TNnRZwbuwl/4QXp9EiexQX2ui54H8oRVr
    /sROsVT4PZPgSTYeY4AO+DUKdaH+G9vzEhdNCTSxz0CV8eMd0D2VYmj/e8+Q
X-ME-Proxy: <xmx:K95yanryxGwByL081NQDrFZAc5q_HtFMm338s3eqKAVoEd2EV-VUpQ>
    <xmx:K95yaiRKEPdCSy3fLCu6OeLufBpMcgceMn5XgD6JqbKy1QURg6zFtA>
    <xmx:K95yavW4TbziBKP-KoPwLsaICrEBB3bQ44UYBzPl9C3SO038-SPEAg>
    <xmx:K95yavfoyhN5dInhvM1l33KGcwDWc3uRuN6jszaIUn4gb2nbKyx_BA>
    <xmx:K95yaqx6GmSr95ZkUU0mtKbfMsU6Q4oT9BVyhFEDzMn4abe55d40-4Ad>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 02:54:35 -0400 (EDT)
Date: Tue, 4 Aug 2026 23:54:34 -0700
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
Message-ID: <anLeKu7X6SndqFR4@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-11-boqun@kernel.org>
 <2a9aec78-fe1b-49c9-884f-a59eb36c8905@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a9aec78-fe1b-49c9-884f-a59eb36c8905@linux.ibm.com>

On Wed, Aug 05, 2026 at 01:41:48AM +0530, Shrikanth Hegde wrote:
> Hi Boqun,
> 
> On 8/4/26 9:44 PM, Boqun Feng wrote:
> > With the changes that enable preempt count to track IRQ disabling
> > nesting, we don't have enough bits in 32-bit preempt count
> > implementation, as a result we move NMI nesting bits out of the 32-bit
> > preempt count. However on the architectures that can support 64-bit
> > preempt count implementation, we can keep the NMI nesting bits in the
> > 32-bit preempt count and avoid maintaining NMI nesting bits outside of
> > the same cache line.
> > 
> 
> [...]
> 
> > --- a/include/linux/hardirq.h
> > +++ b/include/linux/hardirq.h
> > @@ -10,8 +10,6 @@
> >   #include <linux/vtime.h>
> >   #include <asm/hardirq.h>
> > -DECLARE_PER_CPU(unsigned int, nmi_nesting);
> > -
> >   extern void synchronize_irq(unsigned int irq);
> >   extern bool synchronize_hardirq(unsigned int irq);
> > @@ -94,6 +92,37 @@ void irq_exit_rcu(void);
> >   #define arch_nmi_exit()		do { } while (0)
> >   #endif
> > +#ifdef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
> > +static __always_inline void __preempt_count_nmi_enter(void)
> > +{
> > +	__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);
> > +}
> > +
> > +static __always_inline void __preempt_count_nmi_exit(void)
> > +{
> > +	__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);
> > +}
> > +#else
> > +DECLARE_PER_CPU(unsigned int, nmi_nesting);
> > +
> > +#define __preempt_count_nmi_enter()				\
> > +	do {							\
> > +		__preempt_count_add(HARDIRQ_OFFSET);		\
> 
> nit: This limit is because to have the same behavior as other case when
> NMI_BITS=4 right?
> It is not easy to infer that from comment.
> 

It's sort of design by implementation IIUC, previously because of
NMI_BITS=4, we could only support nesting level being 15. And here we
just want to keep the same behavior here.

If your question is why 15 was a good number before this change, I guess
would be it's just a number that is neither too big or too small.

> > +		/* Maximum NMI nesting is 15. */		\
> > +		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
> > +		__this_cpu_inc(nmi_nesting);			\
> > +		preempt_count_set(preempt_count() | NMI_MASK);  \
> 
> 
> Is there a reason preempt count updates are split rather than
> folded into a single preempt_count update?
> 

Keeping the implementation simple is one reason, most architectures
could utilize the HAS_SEPARATE_PREEMPT_RESCHED_BITS for better
performance. So that reduces the importance of having something
complicated but saves one access here. But if you see an optimization
that can be done here, please do share!

Peter had proposed one optimization here:

	#define __preempt_count_nmi_enter()				\
		do {							\
			unsigned int _o = NMI_MASK + HARDIRQ_OFFSET;	\
			/* Maximum NMI nesting is 15. */		\
			BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
			__this_cpu_inc(nmi_nesting);			\
			_o -= (preempt_count() & NMI_MASK);		\
			__preempt_count_add(_o);			\
		} while (0)
	
	#define __preempt_count_nmi_exit()				\
		do {							\
			unsigned int _o = HARDIRQ_OFFSET;		\
			if (!__this_cpu_dec_return(nmi_nesting))	\
				_o += NMI_MASK;				\
			__preempt_count_sub(_o);			\
		} while (0)

but it has a problem considering this:

	// outermost NMI handler
	// nmi_nesting == 0

	nmi_enter();
	// ^ nmi_nesting == 1 and NMI_MASK is set.
	...
	nmi_exit():
	  if (!__this_cpu_dec_return(nmi_nesting)) // return true
	    _o += NMI_MASK;
	  <NMI start>
	  nmi_enter();
	  // ^ nmi_nesting == 1 and NMI_MASK is set.
	  nmi_exit();
	  // ^ nmi_nesting == 0 and NMI_MASK is *unset*.
	  <NMI end>

	  preempt_count_sub(_o); // _o == HARDIRQ_OFFSET + NMI_MASK,
	  			 // underflow

(Now think about this, the __preempt_count_nmi_enter() does seems
fine, maybe we can keep that, too tired to remember whether there is any
subtly here... will take another look tomorrow)

Regards,
Boqun


> > +	} while (0)
> > +
> > +#define __preempt_count_nmi_exit()				\
> > +	do {							\
> > +		__preempt_count_sub(HARDIRQ_OFFSET);		\
> > +		if (!__this_cpu_dec_return(nmi_nesting))	\
> > +			preempt_count_set(preempt_count() & ~NMI_MASK); \
> > +	} while (0)
> > +
> > +#endif
> > +
> >   /*
> >    * NMI vs Tracing
> >    * --------------
> > @@ -110,18 +139,14 @@ void irq_exit_rcu(void);
> >   	do {							\
> >   		lockdep_off();					\
> >   		arch_nmi_enter();				\
> > -		/* Maximum NMI nesting is 15. */		\
> > -		BUG_ON(__this_cpu_read(nmi_nesting) >= 15);	\
> > -		__this_cpu_inc(nmi_nesting);			\
> > -		__preempt_count_add(HARDIRQ_OFFSET);		\
> > -		preempt_count_set(preempt_count() | NMI_MASK);	\
> > +		__preempt_count_nmi_enter();			\
> >   	} while (0)
> >   #define nmi_enter()						\
> >   	do {							\
> >   		__nmi_enter();					\
> >   		lockdep_hardirq_enter();			\
> > -		ct_nmi_enter();				\
> > +		ct_nmi_enter();					\
> >   		instrumentation_begin();			\
> >   		ftrace_nmi_enter();				\
> >   		instrumentation_end();				\
> > @@ -129,12 +154,8 @@ void irq_exit_rcu(void);
> >   #define __nmi_exit()						\
> >   	do {							\
> > -		unsigned int nesting;				\
> >   		BUG_ON(!in_nmi());				\
> > -		__preempt_count_sub(HARDIRQ_OFFSET);		\
> > -		nesting = __this_cpu_dec_return(nmi_nesting);	\
> > -		if (!nesting)					\
> > -			preempt_count_set(preempt_count() & ~NMI_MASK);	\
> > +		__preempt_count_nmi_exit();			\
> >   		arch_nmi_exit();				\
> >   		lockdep_on();					\
> >   	} while (0)
