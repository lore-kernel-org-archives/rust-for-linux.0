Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EAA3DDAED;
	Tue,  4 Aug 2026 23:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785885266; cv=none; b=ViWzCMDP6B48iZGzhB1jMCxpZijJ1/NpndLiAtaolx2PgMnvzYUm7WiifTkk+b1Gjgzd0Q8qiTDQbepwJAfzSz/ddt+HZtODhO8Y3s6B3/5nDE7AY+TDAKeGf+2WV+yfOP2KNaM5wWxH4g/3yypLNXVdGuNtptHljyqS8k9iF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785885266; c=relaxed/simple;
	bh=c8s9t74R63al0gIsZzerShuDk8UPb3xr3jPc6weyEm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1Ghev9q1RujtV5IVwqx6QL3oURQkmhmmmjq82htjaqoRQkUdG5EYgMxhT33HiE6zeKo4Tv5QQKP1V4joU7c3pEqLxx2BhIlAuNzFdDur/iGXDJJNtaEEw9Q5lQyuHJCdO5+Pz/qNVGCDH8A1Ay3ACx2TjIoJngpbP41eLMvfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCI4umYS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCI4umYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF1C1F00A3A;
	Tue,  4 Aug 2026 23:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785885264;
	bh=ircKCw5UOA4dkAYrhVvksoma3ZpqmqgSFuzNYMdCbM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SCI4umYS7KSAruJUhQXRXLBDC78zB3MM+4Y3PT6KnFrnG3RSkiBGHxMlbjr4inRsC
	 hkACqhsT9nbV37i7SY8o+n7XwQabUJ3rcL6Q1MDcscmq3KXx4gdM819jeKUU+8jB6A
	 WIPHoD6enQhAoplatCSkM7UFq/qj570r6DW/qHWCeYpgyiNQxegIVPn4iRaiYkMFYt
	 buEEveNtAIG8a1MFj3rQ9t0ca4yRuFLvAtVwqnmczmaCvRfxjvkOFvoVGCEWN9PlyQ
	 9O8m2OO2g7zkoUW6mxDAr4fZkbJoYYuKLZjYvy+4IvYnX130h31w+Ww1r37G2AhfZO
	 DzH30p4wMlCJg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 46DA5F40068;
	Tue,  4 Aug 2026 19:14:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 04 Aug 2026 19:14:23 -0400
X-ME-Sender: <xms:T3JyamA2MJSomqvMRRH354dMDHUpjsEFnnkCkiNLjC2VkWvv-UNHSg>
    <xme:T3Jyav-KSOUfUvibHVY1fZZFMnPCoycrZTVm2tTcXKrOb7Q3gzqj5VSYCMtyPo7ba
    yZTX2uFBmYIgtULx_Onb8-BfOAtYXRIyG8d4AvqQmSB-yPu1-NS_kw>
X-ME-Received: <xmr:T3JyaqpNA6Y_ts5VemSFMNRK2Iefob3uYiXbJQ-uC4jimqf6-dyizXxVhPBvOggPukYpto7YTryzGyRCw1sFCOGXDOg-8NGv>
X-ME-Proxy-Cause: dmFkZTGrZwd5jG6Ka3hrO+04TfQx7li3NQOMdiDaVoSL82z8IMsBQ4rct7W/xZcoEHZwXU
    6XoTHzl5EdJIMHk25AtjN56IK0RCIA7gBKgmB4aw1TeKstMhRSYFU0MJuy003FPzpzAMyC
    vLbPF5S0/RPpC9I7k3i94F710cRS9b7o7DrZ07MFue4UuWBl7HkZTQZVAucL+YrBrPwjm7
    YKy+g3mRxlcpTphsV9CNzCbtoDG0heFGQUuCgC9UVlxmC42F5P/q50xswINSSYnCC3f0gA
    +h6Rj3xf30Dn8kCNlpheBHwJpiyWzfg9A+0FK7AkdPIWDke9nPkryRmIJZ2ylqBWQr8sAO
    O14gsWMfHMDi5Q32XwBDPosnAu6J7BXz9FjZpCh+XOionJIDh0pSX5M3PDqInHyPH5aNNw
    l5nQK1Z3JwlP2U4hnRVVCOxEAr4htgvV8M9OC/7aYHgAmgiY/P0TAUJEaSbEz016BUSGdp
    jQMkltIxzS2aYp0gxfcA8mP+SE5PEcDVuaHb81vhf0nXdHv2MdEZwWZl5itrETPxkvwKOQ
    GC3+OjF7xG4LN5ft5rUG71SVfYdovX+DmQQY4yTInou+Cg5Ma+9kPN43P5kQNm9J87eJQm
    kIXyACUMKCLrUKTak6IOIYN7mzHdenScaq/iDJ6rebhWUvbeFZt1f5ekvCwA
X-ME-Proxy: <xmx:T3JyapFAkd_rW0wsb7nRYjZData-ojcUt1WKRXNWw-y9dAQfDN5l7A>
    <xmx:T3Jyau8zalVYiIYPeLNcjKjPRMTXVgX9Ug3gS4TbS5MUhsJfwPfSfQ>
    <xmx:T3JyamSmxkG_zS4QiKDm_Q5HSzqksHgJsrFgS2zAtYIxx3g0BpOfsQ>
    <xmx:T3Jyajq77bEQAPWCTdS20dpx5kq_D-MFnr6rkj9y1b9WyHGHQ68oXA>
    <xmx:T3JyajMzmvEHDVxMFg-upCpJNAwGwOwL3hymmpqKkFrUVWmcZjIUUwGj>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 19:14:22 -0400 (EDT)
Date: Tue, 4 Aug 2026 16:14:21 -0700
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
Message-ID: <anJyTS_3sr9Oh7ZL@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-11-boqun@kernel.org>
 <3513cd3b-5b6a-4a3a-bf56-79bbd40b3bec@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3513cd3b-5b6a-4a3a-bf56-79bbd40b3bec@linux.ibm.com>

On Wed, Aug 05, 2026 at 02:39:20AM +0530, Shrikanth Hegde wrote:
> Hi.
> 
> > diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> > index 33fc4c814a9f..8299657f0f86 100644
> > --- a/include/linux/preempt.h
> > +++ b/include/linux/preempt.h
> > @@ -34,14 +34,31 @@
> >    *         SOFTIRQ_MASK:	0x0000ff00
> >    * HARDIRQ_DISABLE_MASK:	0x00ff0000
> >    *         HARDIRQ_MASK:	0x0f000000
> > + *
> > + * When HAS_SEPARATE_PREEMPT_RESCHED_BITS=y, PREEMPT_NEED_RESCHED is put in a
> > + * separate word and that allows 64bit load-store architectures to 'set'
> > + * PREEMPT_NEED_RESCHED without messing up the otherwise symmetric
> > + * modifications used on preempt_count and still load the whole thing
> > + * (single-copy) atomically, without having to resort to full atomic
> > + * operations.
> > + *
> > + * Because of the above, NMI_MASK bits are different depending on
> > + * HAS_SEPARATE_PREEMPT_RESCHED_BITS:
> > + *
> > + * - HAS_SEPARATE_PREEMPT_RESCHED_BITS=n:
> > + *
> >    *             NMI_MASK:	0x10000000
> >    * PREEMPT_NEED_RESCHED:	0x80000000
> > + *
> > + * - HAS_SEPARATE_PREEMPT_RESCHED_BITS=y:
> > + *             NMI_MASK:	0xf0000000
> > + * (PREEMPT_NEED_RESCHED is in a different word)
> >    */
> >   #define PREEMPT_BITS	8
> >   #define SOFTIRQ_BITS	8
> >   #define HARDIRQ_DISABLE_BITS	8
> >   #define HARDIRQ_BITS	4
> > -#define NMI_BITS	1
> > +#define NMI_BITS	(1 + 3*IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS))
> 
> 
> Shouldn't testing/selftests/bpf/bpf_experimental.h also be updated with
> same?
> 

Yeah, sashiko found out the same thing.

> 
> >   #define PREEMPT_SHIFT	0
> >   #define SOFTIRQ_SHIFT	(PREEMPT_SHIFT + PREEMPT_BITS)
> > @@ -116,8 +133,8 @@ static __always_inline unsigned char interrupt_context_level(void)
> >    * preempt_count() is commonly implemented with READ_ONCE().
> >    */
> > -#define nmi_count()	(preempt_count() & NMI_MASK)
> > -#define hardirq_count()	(preempt_count() & HARDIRQ_MASK)
> > +#define nmi_count()		(preempt_count() & NMI_MASK)
> > +#define hardirq_count()		(preempt_count() & HARDIRQ_MASK)
> >   #ifdef CONFIG_PREEMPT_RT
> >   # define softirq_count()	(current->softirq_disable_cnt & SOFTIRQ_MASK)
> >   # define irq_count()		((preempt_count() & (NMI_MASK | HARDIRQ_MASK)) | softirq_count())
> > diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> > index 88c594c6d7fc..35f546a042b1 100644
> > --- a/kernel/Kconfig.preempt
> > +++ b/kernel/Kconfig.preempt
> > @@ -122,6 +122,10 @@ config PREEMPT_RT_NEEDS_BH_LOCK
> >   config PREEMPT_COUNT
> >          bool
> > +config HAS_SEPARATE_PREEMPT_RESCHED_BITS
> > +	bool
> > +	depends on PREEMPT_COUNT && 64BIT
> > +
> >   config PREEMPTION
> >          bool
> >          select PREEMPT_COUNT
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 9b3f1764fa9e..6d88343c3bad 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -5973,8 +5973,13 @@ void preempt_count_add(int val)
> >   #ifdef CONFIG_DEBUG_PREEMPT
> >   	/*
> >   	 * Underflow?
> > +	 *
> > +	 * Cannot detect underflow based on the current preempt_count() value
> > +	 * if using HAS_SEPARATE_PREEMPT_RESCHED_BITS because preempt count takes all 32
> > +	 * bits.
> >   	 */
> > -	if (DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
> > +	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
> > +	    DEBUG_LOCKS_WARN_ON((preempt_count() < 0)))
> >   		return;
> >   #endif
> >   	__preempt_count_add(val);
> > @@ -6006,7 +6011,10 @@ void preempt_count_sub(int val)
> >   	/*
> >   	 * Underflow?
> >   	 */
> > -	if (DEBUG_LOCKS_WARN_ON(val > preempt_count()))
> > +	unsigned int uval = val;
> > +	unsigned int pc = preempt_count();
> > +
> > +	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
> >   		return;
> >   	/*
> >   	 * Is the spinlock portion underflowing?
> > diff --git a/kernel/softirq.c b/kernel/softirq.c
> > index 0c9b2269a8d6..7980a4a232f9 100644
> > --- a/kernel/softirq.c
> > +++ b/kernel/softirq.c
> > @@ -103,7 +103,13 @@ void _local_interrupt_enable(void)
> >   }
> >   EXPORT_SYMBOL(_local_interrupt_enable);
> > +#ifndef CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS
> > +/*
> > + * Any 32bit architecture that still cares about performance should
> > + * probably ensure this is near preempt_count.
> > + */
> >   DEFINE_PER_CPU(unsigned int, nmi_nesting);
> > +#endif
> >   /*
> >    * SOFTIRQ_OFFSET usage:
> > diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
> > index bfafe1204c7b..c3d976c801bb 100644
> > --- a/lib/locking-selftest.c
> > +++ b/lib/locking-selftest.c
> > @@ -1429,7 +1429,7 @@ static int unexpected_testcase_failures;
> >   static void dotest(void (*testcase_fn)(void), int expected, int lockclass_mask)
> >   {
> > -	int saved_preempt_count = preempt_count();
> > +	long saved_preempt_count = preempt_count();
> 
> nit: Isn't preempt_count still returns int?
> 

Right, let me fix that. Thank you!

Regards,
Boqun

> >   #ifdef CONFIG_PREEMPT_RT
> >   	int saved_mgd_count = current->migration_disabled;
> >   	int saved_rcu_count = current->rcu_read_lock_nesting;
> 
