Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CFC3CF212;
	Wed,  5 Aug 2026 17:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951491; cv=none; b=l8dDT9/XexIq15AS+qr4r+vvcoWs6bVL7huC/mXpV6hcVOJTP05PGsDN21PvgNP7RExM21QgiSTpxhCNgUv48NHsu4ETYe/nWfGZE0AUmqnoVafWp3UdOBuS/hvHPHliMb7fyH9/IMey1OMf6q1EVY/JhTwtWxsv9fD3nq087IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951491; c=relaxed/simple;
	bh=yfHIDv02CPaAuW6SSkAcnUHYSa6+aRYEpET1F/O3ZH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/R0+qe6gLMwgmbb3LXnuzU0YHvVEYit8VLx8pAH8JAqwWSGbVAftBJtDgrGEQh6cnMQzlTMW5xnp5ukPZgvp4bdHshS/PFK5HCHQiazlzmVYMXzR6Z/W7UjDnpjIn9BOSKwjvkq8BHR07XkDzspPTjPz6ZtHgGVOMcZMpI3Rsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hjjgicyq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hjjgicyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E851F00A3D;
	Wed,  5 Aug 2026 17:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785951490;
	bh=EF0Q1J2jjFDGm1qxB+XwlidFK5+nWr/yg2BUs849nYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hjjgicyq+/K5ho8hwt4zLJq4u8rAJhWKfzt14EBHR6EsIlZIYLVYPbmqpwnWzca3z
	 PzSe64PLgqxHjg5ECIPVy60Lw9293EhqvBKs40ladwl61ceffWV7wLW7+SCKXKKPUX
	 NrmOroIUaOHue4vymRWDkact+sKvKKGSSXOii4WM8M7zOS6o19e0Pq3wPkh6uEF+Tx
	 2sYuOYaCmQkxe63Y3z92kkC43FT5v/1j7fuUVEJt2xHxTkShT8BziipcngPR31dtJl
	 zL5Yw+5vieavJrNqOBSGCE1foqW2hz8O5DmkV2h5oZCSd+HSXJD/Ywcpef82X+129V
	 S6mO2TGPcCbiw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id CC60BF40068;
	Wed,  5 Aug 2026 13:38:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 05 Aug 2026 13:38:08 -0400
X-ME-Sender: <xms:AHVzauzuZEYSxqMo2TQTYCga-sz4IzoRITZ--RWyj1HdDhypl9BBIw>
    <xme:AHVzapvmmKzCY8ghsTdyAQ2hzjDJgwjaXWHNPqGbsyPrOiossCpeQFZu1KQ99iKQl
    _C8K3On7ts8zeXxAkWKL7mSWvtRvu08brggcsd145oW_EGYCAsHUA>
X-ME-Received: <xmr:AHVzahZ3WHH1OghtddYWXQ1UVa0te1tFbTMHCj5NTwhUq8TXIMYw7InW4a3QZTeZWGFL4oiJhQS2No_UiAhjR0uQOUEkTXNV>
X-ME-Proxy-Cause: dmFkZTGKEYHELQbNNbIOdUGpWFNAbpXLbQVK+aYxl96DaHHP6dJv/1XbASsRC90wj3qDPF
    +Zyfc8Ze8/8Y40yLvAMrtWNo6BVwS6rQFtgnZCrklbxROhOQ6MBxdZ883UO8icvzSATLbH
    klDeAfK4aq7SgaT4RD6bZx/El+XWTSANzSlHfjv3czD0DeX/JUwhWMAYy1+ABg1g5sL04o
    q3dk8mCIdQt14VmcqdTUUOMSKEuVZtuq4qnQL1sO0ttbR9t0OYVgI4vq1knZ/fFNLFowmH
    i925Ck4WZC783EOyw3xZ+qS3Tsvtbpx0K9IuTEJpbPPpdM1mefTIK3nceRyv389r0CB1ee
    rop9Wx+PKfAJrxySNSVT9WSCobrI+MDM9RymXkBYWaZVpgMnj0Y2Vj39A/G+9bswberb6X
    2CzK64bFVvuK0/HlOcUQK15cl5C2EUUP75kblVlPeL2Q92cCa4Q3u4chLnl7dv09V3Hp+t
    oiuqeUQoBwz9Z+MlN/eyO3ZLRErsFDL1KfrnQZwS0IPu2/2U9EXVg2hzaxQo7c/0o2QFyk
    sYn0UG/svNpqFDOlgaGAPNf06izkvvh3zMMx8Xg4wr6pfYBq9mpYHJNQrror53HGmcaDlG
    92OCE0GtR7HPCU/AmaS4NxNGPcih2X+Zcru3i7tk36MwLSMJQINTDywk3drA
X-ME-Proxy: <xmx:AHVzao3rms3gqQSbakRNeTtEqyzsKO6ei8ozkmonl8XHyBNubVbvEA>
    <xmx:AHVzajtpdoe96awEkXaYJcuRv7t56c9a6t_MzJKwp8GMQEv2AD84CQ>
    <xmx:AHVzasCf65Ij2RS0Ec8HNE9HoMmvaofxpiku2a-nUOUwalkRruI7QA>
    <xmx:AHVzamaPhB-QpQ2rQVRvD0HVzB2-1qQMwSes67pXr4b1DYFor9Q-5A>
    <xmx:AHVzau8RAt7pXQZocwlnMduiYoA-yOhAUhKRaCE2GD-12LGOIwr6uGWn>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 13:38:08 -0400 (EDT)
Date: Wed, 5 Aug 2026 10:38:07 -0700
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
Message-ID: <anN0_z--Mnuw3IK-@tardis.local>
References: <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
 <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
 <anLj_Ryl635sxvI8@tardis.local>
 <anNAWmjK4_jfMHkl@tardis.local>
 <1eccb39d-f4bf-41d3-a999-e4bf45833c04@linux.ibm.com>
 <anNGwaegou9WJHC_@tardis.local>
 <0367352e-5578-4d70-88ae-1bfa446ec377@linux.ibm.com>
 <anNSocuKlbA7cLKk@tardis.local>
 <f1d73456-73ee-46e3-aaf7-6a6fe40f3196@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f1d73456-73ee-46e3-aaf7-6a6fe40f3196@linux.ibm.com>

On Wed, Aug 05, 2026 at 10:23:20PM +0530, Shrikanth Hegde wrote:
> Hi Boqun.
> 
> On 8/5/26 8:41 PM, Boqun Feng wrote:
> > On Wed, Aug 05, 2026 at 08:26:49PM +0530, Shrikanth Hegde wrote:
> > > 
> > > 
> > > On 8/5/26 7:50 PM, Boqun Feng wrote:
> > > > On Wed, Aug 05, 2026 at 07:40:18PM +0530, Shrikanth Hegde wrote:
> > > > > 
> > > > > Hi Boqun,
> > > > > 
> > > > > > 
> > > > > > Something as below? Going to send it to kernel build bot and see if it
> > > > > > works for all configs.
> > > > > > 
> > > > > > ----------------->8
> > > > > > diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> > > > > > index b9a7f05ecf42..39f30bc65548 100644
> > > > > > --- a/include/linux/interrupt_rc.h
> > > > > > +++ b/include/linux/interrupt_rc.h
> > > > > > @@ -12,6 +12,7 @@
> > > > > >      */
> > > > > > 
> > > > > >     #include <linux/irqflags.h>
> > > > > > +#include <linux/debug_locks.h>
> > > > > >     #include <linux/preempt.h>
> > > > > >     #include <linux/processor.h>
> > > > > >     #include <linux/smp.h>
> > > > > > @@ -63,6 +64,12 @@ static inline void local_interrupt_disable(void)
> > > > > > 
> > > > > >            new_count = hardirq_disable_enter();
> > > > > > 
> > > > > > +       /* Is hardirq disable count overflow soon? */
> > > > > > +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT))
> > > > > > +               DEBUG_LOCKS_WARN_ON((new_count & HARDIRQ_DISABLE_MASK) +
> > > > > > +                                   (10 << HARDIRQ_DISABLE_SHIFT) >
> > > > > > +                                   HARDIRQ_DISABLE_MASK);
> > > > > > +
> > > > > 
> > > > > This needs a return here right? Else we will see warning for 10 times
> > > > > and then overflow happens and we will call _local_interrupt_disable. No?
> > 
> > Oh, seems I overlooked something... could you elaborate on this? What's
> > the scenario in your mind? You said we hit 10 times warning and *then*
> > overflow?
> > 
> 
> 
> (the "10 times" wording was for the possible wraparound.
> I didn't know DEBUG_LOCKS_WARN_ON() will turn debug_locks
> off after the first warning, I thought it will print 10 times.)
> 
> Main concern is the wraparound itself. If the HARDIRQ_DISABLE field reaches
> 0xff and we increment it once more, the field becomes zero after masking
> (ff + 1 -> 100 in the shifted field). Then local_interrupt_enable() can
> observe:
> 
>         (new_count & HARDIRQ_DISABLE_MASK) == 0
> 
> and treat it as the outermost enable, potentially calling
> _local_interrupt_enable() while there are still outstanding logical
> local_interrupt_disable() users.
> 
> So I think the useful debug check is one that catches the count before it
> gets close enough to wrap. Thing I wanted to avoid is silently making the
> HARDIRQ_DISABLE field look like zero after overflow.
> 

Given that the detection is only on debug kernel, I think the damage of
keeping increment after warn triggered is low (this is assuming that we
can detect all the issues with the debug kernel, similar treatment as
the preempt_count nowadays). However, your suggestion does look better
for the corner cases and it's a better damage control, so I will add the
return part, thank you!

For the future, we need better detection and report for these counters
for sure.

Regards,
Boqun

> Whether it returns or just warns, I am not sure. As recovery may
> not be easy. It is meant more to be a damage contol than recovery.
> 
> 
> My line of thought is,
> 
> If we return after debug checks in local_interrupt_disable(), we wont advance the preempt count
> further, so it wont wrap around. Now, there will be corresponding local_interrupt_enable(),
> at some point it will reach 0, we enable the interrupts. There will be some more
> local_interrupt_enable() still, but they will be caught with your debug check in
> local_interrupt_enable() and preempt count won't be decremented further.
> So if we put return we may have a damage control.
> 
> > > > > 
> > > > 
> > > > DEBUG_LOCKS_WARN_ON() uses debug_locks_off() to avoid this, so we won't
> > > > see it 10 times. The reason not using return here, because we would
> > > > introduce unpaired local_interrupt_disable() if we returned:
> > > 
> > > Yes, it could be a weird case if the overflow actually happens.
> > > So just warning maybe enough to catch such callers.
> > > 
> > > Maybe your kunit test can actually help test the behavior with the loop
> > > count.
> > > 
> > > > 
> > > > 	// hardirq disable count is n
> > > > 	local_interrupt_disable(); // hardirq disable count is n + 1
> > > > 
> > > > 	local_interrupt_disable(); <- trigger the warning, if we return
> > > > 				   // hardirq disable count is n + 1
> > > 
> > > Likely i am missing to understand.
> > > 
> > 
> > No, it was me who misunderstand ;-)
> > 
> > > Isn't the count incremented earlier than return?
> > > I.e even if return happens it should be n + 2 right?
> > > 
> > 
> > Yeah, you're right, but then why do we want to return earlier? Since the
> > following if:
> > 
> > 	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > 
> > will be false, and we will just return from the function, no?
> > 
> > Regards,
> > Boqun
> > 
> > > > 
> > > > 	local_interrupt_enable(); // hardirq disable count is n
> > > > 
> > > > 	local_interrupt_enable(); // hardirq disable count is n - 1
> > > > 
> > > > Regards,
> > > > Boqun
> > > > 
> > > > > Not sure, if below is any better? (Igore whitespace mangling)
> > > > > 
> > > > > if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
> > > > >       DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) >=
> > > > > 			 HARDIRQ_DISABLE_MASK - (10 << HARDIRQ_DISABLE_SHIFT)))
> > > > > 	return;
> > > > > 
> > > > > >            /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > > > > > 
> > > > > >            if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > > > > > @@ -73,6 +80,11 @@ static inline void local_interrupt_enable(void)
> > > > > >     {
> > > > > >            int new_count;
> > > > > > 
> > > > > > +       /* Unpaired local_interrupt_enable()? Warn and abort. */
> > > > > > +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
> > > > > > +           DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) == 0))
> > > > > > +               return;
> > > > > > +
> > > > > >            new_count = hardirq_disable_exit();
> > > > > > 
> > > > > >            if ((new_count & HARDIRQ_DISABLE_MASK) == 0) >
> > > > > 
> > > 
> 
