Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9B439F9D
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785877696; cv=none; b=YPV4/AuIIycfVjImRy7kkxdqZcWzSwTCjX60d3qtv7nH0fthELLJcSDGursJyZ0wdbLYDkt7qUBmnOFJC+Q7maIc0hiDSlzFKzoO+XmIyOen3fMb0pnsMbWH1SFVodADjXTCArOdRGF+7w2EP1rbejCH3OG8XYGErH0FzycUWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785877696; c=relaxed/simple;
	bh=mV+KxwLsUxiKPYT1PfE6xHeVuV3Bd1N83GtQ7TKz5ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAd2mHmjrVJs7+0dssz9G0XJQ4z6hmHidJ/F66vZekRKUrpTfJa9FBddSBQsiNbBxcSrQ2xIHRKxiyEtezwvX6rlAznV/6BEfz/eMKO4QC9EuiCDlmncni9U79/xOKnWqepjEbyg8VB/A1hEsi76sFKnxBJanjtEsp+XfPlLpiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0+5TiuE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0+5TiuE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691711F00A3E;
	Tue,  4 Aug 2026 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785877694;
	bh=QGeQWevi3ohDZB4wCfkmrhvkA89lJtrIyp+Wfk7S66Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g0+5TiuE6mFScXaiEmibrn9aNOwGjckQFn2Vj2CR9Ft+nRfugA+ftOQl3TXYO4IW2
	 bgewUQ8aruc5hFqvgRtt2QLBwcnGhGslzFm7Iqpyh5i5FYvtIuC0XAwEiUvBnlwJ6a
	 4qxxqNM8mzglvj5bAJsUpPt2dfpO82hT51GKyhtOYDB0cjJw8zHf1G+slu0eINBAzy
	 T/vXG7LUMI3eV6XLQGE3KTj/OjgevnyAGmY4pUjf10z5aecEbgFAHtxp8QruALfUUY
	 PEsJ54Wm8yQfF7BksA9T5EdE4LqebWoWL84jr0Dlp8gWCsVE9AdkUFeG9DybNErByM
	 6NW+HR7mqHCkA==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 81E94F4006B;
	Tue,  4 Aug 2026 17:08:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 04 Aug 2026 17:08:13 -0400
X-ME-Sender: <xms:vVRyauOv77abI6CwzcIRZLZ7QPtOn0u3NbLZum8F_822towyMtRn4A>
    <xme:vVRyasb5vlaPLu5x_EZre-rQbtAuJrs_nyFxX_jIRqRfcxL5nWLR76kr01yDcxTed
    6XUjES4QVLCAOrE8EySjabYHlnrs4XlgWrP5F32H1iqdEOBbGglZFA>
X-ME-Received: <xmr:vVRyamVCaw4HQhYOx8uxdu1DBNGGMhqoFpqAUFjxEdgexAs1GREhOpoEb0lppcNt86uDHJpmxb9jKfr9272h6zumrj6xtEHZ>
X-ME-Proxy-Cause: dmFkZTFKm0TJaq3PQg3SohxjnoFuL5d8EmYdLIOcxSlcwcXl+XwRaidL66Fk8U6FAWTUol
    3TqfKq7Q1ZrxAyz6Ju9s0vUHKFkQon5AU/0/juuEEChJqhrTFB118SMBbQN7aKr+4sWnt8
    JQNmTMAQOopjARYc6dqVvbV6H2Ve5WJmvqtBJDwlxuxbcR9FYElFvfTtNaKc5SrgXN6S8E
    Siv8DEeQhRTFFDAL6xCGzAbjkdPS5MOmdSRBCkcS2BHxz67uWdneVl1UiTlCb8Iz3cjyUS
    Gz7KxXD9tGs+MIlZaRzUJsVSUm3H+z95XsAtrFFWe2rRaaQ6I3z1+TSCTcZb3jsIA/DUrm
    2lIbTLDMCnWnukr49eA9E8MUkS0XaYda7EfZ1qOPXCH/WcUpFkp/38MfUCpq2fYaTDkxeb
    KD2gnISrRAA2Z5qQhb6pP0S3iW9i1ryyS6Ga+A3TJ6N0h7MbK7ubHCdUMQTQk4EH9iI9AX
    OcFBGMRqSg1DsymwqUcAG7cobQBNiEk8zRZJxk6pn8qhx9TQaW6jnFtbzTmYFxTcv1muco
    vBCklxcylg/auCVWLJFwJVrrFitB47jvtde2V07F7K7RLwoDwA/GFxd8F3GDfKX9d/NUwC
    Ni1Lx/ML33GSn5qQjm+a/iEwd8xE4I1hOqtME58tqoNLSI82Ch7BVKoZdE7Q
X-ME-Proxy: <xmx:vVRyajB2GIAh5ukFpqtBxVB_56Jr-2UYn6eq7am1H5phtfZVThWl1w>
    <xmx:vVRyaqLivHlGHbKvVMJeU__QMK93_BVb4txpPU07F7gym6r6dwbzKQ>
    <xmx:vVRyapva80gN29JcajtRosLStHwreSBOdXy0ZEfV1m37yPXrpSNvzA>
    <xmx:vVRyaqVgyjGKbZLQ0dQmWRtJvt-NJQ81EIFvLzcf4HGBaC6rk1K79A>
    <xmx:vVRyasLDzucAcZyNgRkNCgfC27O9RPIjoDZYFdMsLzBbHhdIZCDBmfLl>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 17:08:12 -0400 (EDT)
Date: Tue, 4 Aug 2026 14:08:11 -0700
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
Message-ID: <anJUuzBcWRwyw6NJ@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
 <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>

On Wed, Aug 05, 2026 at 02:21:49AM +0530, Shrikanth Hegde wrote:
> 
> 
> On 8/4/26 9:44 PM, Boqun Feng wrote:
> > Currently the nested interrupt disabling and enabling is represented by
> > _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> > example:
> > 
> > 	<interrupts are enabled as beginning>
> > 	spin_lock_irqsave(l1, flag1);
> > 	spin_lock_irqsave(l2, flag2);
> > 	spin_unlock_irqrestore(l1, flags1);
> > 	<l2 is still held but interrupts are enabled>
> > 	// accesses to interrupt-disable protected data will cause races
> > 
> > This is even easier to trigger with guard facilities:
> > 
> > 	unsigned long flag2;
> > 
> > 	scoped_guard(spin_lock_irqsave, l1) {
> > 		spin_lock_irqsave(l2, flag2);
> > 	}
> > 	// l2 locked but interrupts are enabled.
> > 	spin_unlock_irqrestore(l2, flag2);
> > 
> > (Hand-to-hand locking critical sections are not uncommon for a
> > fine-grained lock design)
> > 
> > And because of this unsafety, Rust cannot easily wrap the
> > interrupt-disabling locks in a safe API, which complicates the design.
> > 
> > To resolve this, introduce a new set of interrupt disabling APIs:
> > 
> > *	local_interrupt_disable();
> > *	local_interrupt_enable();
> > 
> > They work like local_irq_save() and local_irq_restore() except that 1)
> > the outermost local_interrupt_disable() call saves the interrupt state
> > into a per-CPU variable, so that the outermost local_interrupt_enable()
> > can restore the state, and 2) a per-CPU counter is added to record the
> > nest level of these calls, so that interrupts are not accidentally
> > enabled inside the outermost critical section.
> > 
> > Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
> > and spin_unlock_irq_enable(), as a result, code as follows:
> > 
> > 	spin_lock_irq_disable(l1);
> > 	spin_lock_irq_disable(l2);
> > 	spin_unlock_irq_enable(l1);
> > 	// Interrupts are still disabled.
> > 	spin_unlock_irq_enable(l2);
> > 
> > doesn't have the issue that interrupts are accidentally enabled.
> > 
> > This also makes the wrapper of interrupt-disabling locks on Rust easier
> > to design.
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > [boqun: Apply Peter's feedback and fix spell errors reported by Ingo]
> > Signed-off-by: Boqun Feng <boqun@kernel.org>
> > ---
> >   include/linux/interrupt_rc.h     | 82 ++++++++++++++++++++++++++++++++
> >   include/linux/preempt.h          |  4 ++
> >   include/linux/spinlock.h         | 23 +++++++++
> >   include/linux/spinlock_api_smp.h | 43 +++++++++++++++++
> >   include/linux/spinlock_api_up.h  | 15 ++++++
> >   include/linux/spinlock_rt.h      | 18 +++++++
> >   kernel/locking/spinlock.c        | 31 ++++++++++++
> >   kernel/softirq.c                 | 28 ++++++++++-
> >   8 files changed, 242 insertions(+), 2 deletions(-)
> >   create mode 100644 include/linux/interrupt_rc.h
> > 
> > diff --git a/include/linux/interrupt_rc.h b/include/linux/interrupt_rc.h
> > new file mode 100644
> > index 000000000000..b9a7f05ecf42
> > --- /dev/null
> > +++ b/include/linux/interrupt_rc.h
> > @@ -0,0 +1,82 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __LINUX_INTERRUPT_RC_H
> > +#define __LINUX_INTERRUPT_RC_H
> > +
> > +/*
> > + * include/linux/interrupt_rc.h - refcounted local processor interrupt
> > + * management.
> > + *
> > + * Since the implementation of this API currently depends on
> > + * local_irq_save()/local_irq_restore(), we split this into its own header to
> > + * make it easier to include without hitting circular header dependencies.
> > + */
> > +
> > +#include <linux/irqflags.h>
> > +#include <linux/preempt.h>
> > +#include <linux/processor.h>
> > +#include <linux/smp.h>
> > +
> > +#ifndef MODULE
> > +/* Per-CPU interrupt disabling state for local_interrupt_{disable,enable}(). */
> > +DECLARE_PER_CPU(unsigned long, local_interrupt_disable_state);
> > +
> > +static __always_inline void __local_interrupt_disable(void)
> > +{
> > +	unsigned long flags;
> > +
> > +	local_irq_save(flags);
> > +	raw_cpu_write(local_interrupt_disable_state, flags);
> > +}
> > +
> > +static __always_inline void __local_interrupt_enable(void)
> > +{
> > +	unsigned long flags = raw_cpu_read(local_interrupt_disable_state);
> > +
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
> > +#endif /* !MODULE */
> > +
> > +static inline void local_interrupt_disable(void)
> > +{
> > +	int new_count;
> > +
> > +	WARN_ON_ONCE(in_nmi());
> > +
> > +	new_count = hardirq_disable_enter();
> > +
> > +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > +
> > +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > +		_local_interrupt_disable();
> > +}
> 
> Maximum nesting possible is 256 right? Whats is stopping here to do more than that?

Yes. Currently similar as softirq, we don't detect the overflow.

> Should there be a warn_on?

A simple warn_on could be problematic because warn_on() itself may take
an irq-disabling lock, and that may trigger another overflow on top of
the existing overflow. It's a bit tricky to do a proper detection. But
I'm open to ideas.

Regards,
Boqun

> 
> > +
> > +static inline void local_interrupt_enable(void)
> > +{
> > +	int new_count;
> > +
> > +	new_count = hardirq_disable_exit();
> > +
> > +	if ((new_count & HARDIRQ_DISABLE_MASK) == 0)
> > +		_local_interrupt_enable();
> > +}
> > +
> > +#endif /* !__LINUX_INTERRUPT_RC_H */
