Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0A437C11E;
	Wed,  5 Aug 2026 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939662; cv=none; b=iz+nKiyLi5OqBWGfHOLPOG2zlEtQzGLWQmWaOItbqTKJt8A+R7rTCK+oLuhiU857I6h3uQTJmLlVfTnqZrHmm1EUqdG3npAW20gn3kVT1uwnn2SQN8Kl77a8m6DDiJ+fNr94RwRPUxoO12NkPDKsznTTBXivHx+YUvwivsWMw8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939662; c=relaxed/simple;
	bh=6ICyW0V7IVJlfQOi+qd9kZF1KcI5Q0vO42CMNGShS6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVH7avy8ZrLg4mR0S2QrKWB8Y1LmNjJiG5ODySbf3AptgjUTvKtzwe/F48mCjmwcWMEN2xT+LFHDd8qQ7SGSobQGoQy/gR0GnGPXI5y+U2f6IZEDNKdxQLN340FGKNrLj7jr8Od+ujteKwmvujv6+77X77TjJYqYOhGXcvKKsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcqAAula; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcqAAula"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DA41F00A3A;
	Wed,  5 Aug 2026 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785939652;
	bh=gWkBd+NMfsoWi0xyoMJCH8i9uSob1Fobwp1ZlKFHagQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bcqAAulaTs9KercETcZNqeO/9FzAv8TTymNExz9Hj9jMLH5CTZ2h7PaGAACYI7Z6A
	 YUxUWkjR15qzmLTiybi9KPFqzQF48cPcHLMAOPYMx2bDMwDu+Z/In6IJIl1+oprEVQ
	 cvboLtx50CmqthBBlQLFNBE8Njw4DmNvCSiyGJb+qNB1jKore5UZqtPD3V1F6AqJT+
	 Iq1rrHQoSFlxOBp+/a4/caXz8T+2k6C3zq0C76ogpafZOb0qXs+Fwaz8jeflEOvkxP
	 gWqR3P8Ht7nufyUdkuf90vfRkhnoSxZFB0lwp7kf+EZKMfKVpMFWbbKm2prcQpw/Pa
	 bXbQkl+1g+W2A==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7F323F40067;
	Wed,  5 Aug 2026 10:20:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 05 Aug 2026 10:20:50 -0400
X-ME-Sender: <xms:wkZzavm_-GRvhgBlyFcUz8-t_goPEWVpO4oJ6H-V_7zBOikfN1qChA>
    <xme:wkZzaiSXVn0c4ekpoZhpa8JPq_USvitw-ObUMcCWZxrllEDipLoTDVtGBNJ-u_G1D
    EVGdYX8SniFQuGjZppb9ZjhJAsU_I_lgaWUCTxKXXoELalviCzsIg>
X-ME-Received: <xmr:wkZzamu3A0u_NTf-Ee4gP8KMKu0F805y4GN-jS6B0_vcBb7LI24NCC5ou9HUo3osZIJIXdinkpV-gxsRT3NsekrtK6ZZYUKQ>
X-ME-Proxy-Cause: dmFkZTEhoGnHqqYRTSVptv5rP4s4ObDAB6VgvtxvsQo4/f2Abtx9VoYeGzFGKSpLinA4I9
    Kcq41BXIihxEcnSkk6lGbf4WgnAmMPD0zQXCWxH3BWxIaWO8xCSZfU+y2cC46HakhQFYAJ
    FeaJQFC5vWAJN8ypODx2AljCNHUwma0olTgSemT0IeHJkbXXv092rOSq7/cygS6tvFkKja
    0/jhSN85RX4WxFI6Bc3wigpfTYk+7c7Op2vkPzN1dB+XNDGBGkTtOiqRwtEEx8PmVwhjty
    cE+z0L/0FTIrBN4nkMzNgwv6kEOWTc5vaVCvfi3QzpD4VB44UjsGUvBBp2WM2mTso3ZJsc
    E3JlRd4CSu3V6BzP59byOl93+HiXGd1kFLqLY8Zwqk+mELUphBzBI8Ym9ENy/kbmYT0RyL
    Sp1lCoTkq7ENQ3/OBqShVRiFz9zuaLt1ZJ1lErt1IJ9uptFeQy9sAgQMG0/wDP04La5BIM
    hqwWINh3VystAHPQQ/jX6R6Cq6sBhqGn4NQ+BuLZlz4Nmv+l6mLiIzh8e27zpNc9DPyfhR
    //awfsgEBkn/zj2ypVPtbUidecFGMKq6jiSdRGhR/M0IB1h/SR2RWLgVClkkIqLvlA479G
    RF5GnwZedT23u0L7Ja+UmIzevVC7pvSFAJ6K1/As8Zf7nrm9wfFp0RhZUC1Q
X-ME-Proxy: <xmx:wkZzar6trVtfPgopNckp8B4pCmkTpIV6ZV0rRzj09B0FG6m8jsekCg>
    <xmx:wkZzahgeF2NxfdVnF2Mgr-7GcOXfRTSnkrA9i-R9KL0itzOEbkOTrQ>
    <xmx:wkZzatkvk9oeDVFm7bIdU_motwV8Zfpm0qF1Tt3UTukRdDVv6sdqfQ>
    <xmx:wkZzagtgX7K3osfqgMwG4y9AiXC6a2Jh_pLuqxOKylMuIzj67qAM4A>
    <xmx:wkZzajAmvWrOqvSl21b98t5rcAaN1ekrHJsjhJbtArKnGnX52tKshuoI>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:20:49 -0400 (EDT)
Date: Wed, 5 Aug 2026 07:20:49 -0700
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
Message-ID: <anNGwaegou9WJHC_@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
 <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
 <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
 <anLj_Ryl635sxvI8@tardis.local>
 <anNAWmjK4_jfMHkl@tardis.local>
 <1eccb39d-f4bf-41d3-a999-e4bf45833c04@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eccb39d-f4bf-41d3-a999-e4bf45833c04@linux.ibm.com>

On Wed, Aug 05, 2026 at 07:40:18PM +0530, Shrikanth Hegde wrote:
> 
> Hi Boqun,
> 
> > 
> > Something as below? Going to send it to kernel build bot and see if it
> > works for all configs.
> > 
> > ----------------->8
> > diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> > index b9a7f05ecf42..39f30bc65548 100644
> > --- a/include/linux/interrupt_rc.h
> > +++ b/include/linux/interrupt_rc.h
> > @@ -12,6 +12,7 @@
> >    */
> > 
> >   #include <linux/irqflags.h>
> > +#include <linux/debug_locks.h>
> >   #include <linux/preempt.h>
> >   #include <linux/processor.h>
> >   #include <linux/smp.h>
> > @@ -63,6 +64,12 @@ static inline void local_interrupt_disable(void)
> > 
> >          new_count = hardirq_disable_enter();
> > 
> > +       /* Is hardirq disable count overflow soon? */
> > +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT))
> > +               DEBUG_LOCKS_WARN_ON((new_count & HARDIRQ_DISABLE_MASK) +
> > +                                   (10 << HARDIRQ_DISABLE_SHIFT) >
> > +                                   HARDIRQ_DISABLE_MASK);
> > +
> 
> This needs a return here right? Else we will see warning for 10 times
> and then overflow happens and we will call _local_interrupt_disable. No?
> 

DEBUG_LOCKS_WARN_ON() uses debug_locks_off() to avoid this, so we won't
see it 10 times. The reason not using return here, because we would
introduce unpaired local_interrupt_disable() if we returned:

	// hardirq disable count is n
	local_interrupt_disable(); // hardirq disable count is n + 1

	local_interrupt_disable(); <- trigger the warning, if we return
				   // hardirq disable count is n + 1

	local_interrupt_enable(); // hardirq disable count is n

	local_interrupt_enable(); // hardirq disable count is n - 1

Regards,
Boqun

> Not sure, if below is any better? (Igore whitespace mangling)
> 
> if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
>     DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) >=
> 			 HARDIRQ_DISABLE_MASK - (10 << HARDIRQ_DISABLE_SHIFT)))
> 	return;
> 
> >          /* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > 
> >          if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > @@ -73,6 +80,11 @@ static inline void local_interrupt_enable(void)
> >   {
> >          int new_count;
> > 
> > +       /* Unpaired local_interrupt_enable()? Warn and abort. */
> > +       if (IS_ENABLED(CONFIG_DEBUG_PREEMPT) &&
> > +           DEBUG_LOCKS_WARN_ON((preempt_count() & HARDIRQ_DISABLE_MASK) == 0))
> > +               return;
> > +
> >          new_count = hardirq_disable_exit();
> > 
> >          if ((new_count & HARDIRQ_DISABLE_MASK) == 0) >
> 
