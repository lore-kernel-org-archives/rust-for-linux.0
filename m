Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F7D346E7A;
	Wed,  5 Aug 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942694; cv=none; b=f+Of+e4WllFxYt2qVYVeOd6u9RT7NMQit+8If0G1J5J+5ASv9MdCdWLBUdUJ7X5tsr2Sw0u5xGGznIxxOUDHruokwMDq/pDH+BN8H2AKO+u7ak76oxiG9iBX/76yoDwUkV9buHRCMvw0O9+HjL6R3BxkwnNOEFK3kqHZw6rJf0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942694; c=relaxed/simple;
	bh=oasUqQ3PIY0y35eI4hqivgveksMNP8kmfG0ZCGzWyWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMcxgZt7f7SOI6m1RmAjfuat6wHbhy5LbqUNGF8dpfDOsQrhHqXVfB3+jxEC4I4QuRzOHs+igJVZoV0yeJZdiivhKhotNO98sraoVXjNne4weuwTX7+CbNwH+y8FxAGFpDAjcM1buMntqGTTLzBpeIv9kB1kycx6XVbqEB3yFgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYczy4YO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYczy4YO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D542B1F000E9;
	Wed,  5 Aug 2026 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785942692;
	bh=/80xzO4P2zKl7Hnr4SEG2rkIBkWDjFa9OrwAgmEofLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OYczy4YO2Na55ORm/P/2xCZQM3MD4wQA1Ko9GQiPBvrMeMzXeHuB224g6WbApaSTU
	 eLawPFRqIzWnaIsi1IVedZvXxD+5o6lYYEu6WVxxj3My3niIyTz0hFmC2TvEPUedVO
	 neMi5lq/S5y6LIbn1K0DbP6YytpCw1M0rDY95ctwfVB4fPgKI//mjRP9z1Wt61E4BC
	 uxP4OqPQra+JOYOF5iqMGBEIuP5yhu/NLhx6mZS8cNUn9hxljqBal41F+snoDmmAqY
	 AhcqiRB4RU3deDQ6FZ14xD8OI2OQdh4KB6TVOzUIA50BfFw9icX1Wy49S18z0Oy8j2
	 0l7S7gt3fK8og==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 17844F40069;
	Wed,  5 Aug 2026 11:11:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 11:11:31 -0400
X-ME-Sender: <xms:o1JzaiJ9L9FBCe6FAuC7yPEAvIqJs6YIiI5z_OWkipyd2kIb6eRq1Q>
    <xme:o1Jzapn3Y65H7iewwh9RP-3BSrKhpoouRxnKkg5fy-gAVmCtAjKMhyGO5Z3SpnFE2
    PFgnetk6wC0c5SLF7MLwjsWMJn7oCjw32s1xE0e6t1JPTMy-7XlLg>
X-ME-Received: <xmr:o1JzajznOpR0fS7NI2clrOPSMLzwQ21eH-50QCfA7a0NQlVGqCe6AIih5ZGYOK_btxeKPXXITLzjy_KaYIqrKYS92JLrHr8e>
X-ME-Proxy-Cause: dmFkZTERdIwQ/laHaUH4/uneY/evygVvaleJo5dVEZP6aEQw8OJVdbZJAWor0JqxEWz/mo
    semItcIZMQOcTAuyA91CBd+262sMLv8at3VKs7pcQwpQ+iQztkNLJu64YfKJXmPY18vtsb
    Ex6fkx+96OJRqwsXw0hkFZ4jvKzciISrmV/fBmoM8HIly2vhpUWrDAJlbmj7KNYRFRKuId
    LNpPl9wfW8zxksEx7eckXMeCzhAHP1Jcww7rHWmvnaZYUMP0WeVA+gZ9yX+onR8ZH/3jGV
    3WFo8NPJog0wQ6KlUSQ2weGdBCPvfH+NXSzdrZY4U9QkwwhQxigWtLFowMwiKmEamHt8AE
    UlkSVO8jVbggEd8TTqvvWEKPPHT2ydv6Wyq7CSevtMOu1tFEbb3unD7z4mHdy2uoJ9R82l
    AnpRrkqWrq0F1zzAipw5/cLblRSJmiY2OI8PdN97DCpeTbJN//Lj1acLBHNWsIXc0EEVP5
    KPQfzHh+hPFRBMO1ge65I+vk89WX2+n4Gpj7c428auApDUo6kEv7lt8AS3siqkwoHqrwLl
    WwcSxOkbAfMhJCUMCl33NCK4fyodDfNr3nr5U6Gwo5AbVrymMvMk2GAfRhWOru6lAibme+
    lo649J5UUkc9+U87Vgfhs21w/4roKat3Ac1bPDWfoT78TF9hOMXUJQUTjgHA
X-ME-Proxy: <xmx:o1JzarvPzm9Pa8pA6zqMGLGY8-q5g5aH0oj7EIFcv3CQJ807ualcmg>
    <xmx:o1JzatHk93QLDdy6cBBElVsAAHG995fbLDzN3OL-e_sQCseyrXE0SA>
    <xmx:o1Jzap4CXgrYyUCXn2ELLGGbW5VsNjzthg9-xPfyr-G1ypmXoHdFUQ>
    <xmx:o1JzauwbtGj8rJAOM6EI7VH_H_rhefLYM9yPV0fYVOoYSFMt75y1NA>
    <xmx:o1Jzav1KCX94XOgWE30KtcCkx_5O6zo6BcBEFbQsNbx9Mge8zC7WRTjV>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 11:11:30 -0400 (EDT)
Date: Wed, 5 Aug 2026 08:11:29 -0700
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
Subject: Re: [PATCH v4 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anNSocuKlbA7cLKk@tardis.local>
References: <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
 <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
 <anLj_Ryl635sxvI8@tardis.local>
 <anNAWmjK4_jfMHkl@tardis.local>
 <1eccb39d-f4bf-41d3-a999-e4bf45833c04@linux.ibm.com>
 <anNGwaegou9WJHC_@tardis.local>
 <0367352e-5578-4d70-88ae-1bfa446ec377@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0367352e-5578-4d70-88ae-1bfa446ec377@linux.ibm.com>

On Wed, Aug 05, 2026 at 08:26:49PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 8/5/26 7:50 PM, Boqun Feng wrote:
> > On Wed, Aug 05, 2026 at 07:40:18PM +0530, Shrikanth Hegde wrote:
> > > 
> > > Hi Boqun,
> > > 
> > > > 
> > > > Something as below? Going to send it to kernel build bot and see if it
> > > > works for all configs.
> > > > 
> > > > ----------------->8
> > > > diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> > > > index b9a7f05ecf42..39f30bc65548 100644
> > > > --- a/include/linux/interrupt_rc.h
> > > > +++ b/include/linux/interrupt_rc.h
> > > > @@ -12,6 +12,7 @@
> > > >     */
> > > > 
> > > >    #include <linux/irqflags.h>
> > > > +#include <linux/debug_locks.h>
> > > >    #include <linux/preempt.h>
> > > >    #include <linux/processor.h>
> > > >    #include <linux/smp.h>
> > > > @@ -63,6 +64,12 @@ static inline void local_interrupt_disable(void)
> > > > 
> > > >           new_count = hardirq_disable_enter();
> > > > 
> > > > +       /* Is hardirq disable count overflow soon? */
> > > > +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT))
> > > > +               DEBUG_LOCKS_WARN_ON((new_count & HARDIRQ_DISABLE_MASK) +
> > > > +                                   (10 << HARDIRQ_DISABLE_SHIFT) >
> > > > +                                   HARDIRQ_DISABLE_MASK);
> > > > +
> > > 
> > > This needs a return here right? Else we will see warning for 10 times
> > > and then overflow happens and we will call _local_interrupt_disable. No?

Oh, seems I overlooked something... could you elaborate on this? What's
the scenario in your mind? You said we hit 10 times warning and *then*
overflow?

> > > 
> > 
> > DEBUG_LOCKS_WARN_ON() uses debug_locks_off() to avoid this, so we won't
> > see it 10 times. The reason not using return here, because we would
> > introduce unpaired local_interrupt_disable() if we returned:
> 
> Yes, it could be a weird case if the overflow actually happens.
> So just warning maybe enough to catch such callers.
> 
> Maybe your kunit test can actually help test the behavior with the loop
> count.
> 
> > 
> > 	// hardirq disable count is n
> > 	local_interrupt_disable(); // hardirq disable count is n + 1
> > 
> > 	local_interrupt_disable(); <- trigger the warning, if we return
> > 				   // hardirq disable count is n + 1
> 
> Likely i am missing to understand.
> 

No, it was me who misunderstand ;-)

> Isn't the count incremented earlier than return?
> I.e even if return happens it should be n + 2 right?
> 

Yeah, you're right, but then why do we want to return earlier? Since the
following if:

	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)

will be false, and we will just return from the function, no?

Regards,
Boqun

> > 
> > 	local_interrupt_enable(); // hardirq disable count is n
> > 
> > 	local_interrupt_enable(); // hardirq disable count is n - 1
> > 
> > Regards,
> > Boqun
> > 
> > > Not sure, if below is any better? (Igore whitespace mangling)
> > > 
> > > if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
> > >      DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) >=
> > > 			 HARDIRQ_DISABLE_MASK - (10 << HARDIRQ_DISABLE_SHIFT)))
> > > 	return;
> > > 
> > > >           /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > > > 
> > > >           if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > > > @@ -73,6 +80,11 @@ static inline void local_interrupt_enable(void)
> > > >    {
> > > >           int new_count;
> > > > 
> > > > +       /* Unpaired local_interrupt_enable()? Warn and abort. */
> > > > +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
> > > > +           DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) == 0))
> > > > +               return;
> > > > +
> > > >           new_count = hardirq_disable_exit();
> > > > 
> > > >           if ((new_count & HARDIRQ_DISABLE_MASK) == 0) >
> > > 
> 
