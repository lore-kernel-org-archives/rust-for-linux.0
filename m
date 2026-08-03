Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188F62F87B;
	Mon,  3 Aug 2026 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772531; cv=none; b=bifoD8iCatYqITmc5AACak7HEndWtvGy0Z3wQ/ao66nunQmVqF9gnKoAibsbWrvWKlhwdxXp3tVCKzBq5k14hNfeMIH/q8DadXnZ+n7VeC4EaQQSB2V2yDRvWVRhb4JvUWxMypylj556xAv8YtfSK7kZbBKGEJxxPWaI9M/kpfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772531; c=relaxed/simple;
	bh=Z+aZ4zqKwI5hD2jNikmbQ2BvLAEDmXptIOdC9NThJAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3DLmJXoW0UzGxDJzHjqcSO/4YDORzFnhEU1+3fbhI/A4RHEI6A7lj3AJV0Cv6DyXJ79XjUbMIeK6gOhxReV9rFoVie8A0U+oT+3ACd6Qsc0WKHej4JUdb28ou1M7oLHrcPbkQREnYeRdT2GqBKGtc5dizlA5q6ZfCzekll00pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RA78y4Pz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RA78y4Pz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473FE1F000E9;
	Mon,  3 Aug 2026 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785772529;
	bh=3pnE5vmVqVNlnw5pSEb3v7AMKUOabo5CxzpoQpMvUL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RA78y4PzeCm8HKVWWpwAq2DhwoMb/pM8nQ9d/ZjBI+meve5+dNk5k8gOdfyMENKOd
	 RS39sRa71fPjGSfdWDxR1JW7cSjEBTZe2bYhPlRNuKnUQcIbn1VJTLxNOHKj375AF/
	 QaezphFNENbceEvavsnfL+P0plJyIo3pYZ6gqY/5XfMAykdaR5Dr36lLb4GVvJVPu7
	 GIsj9ucjxCQ7kyPnyoqQDpk8XKoZMzekXM0g8dCgPnsnYh6VYpCI+/h953eY/9X6Fo
	 6isTKEvG+TUPm6HAIxhuHivbG+1lAoDpGeX4WpYsChBQeqeAOwUy7iLIt4x4kGNNTP
	 jris1Tpq1lsUw==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6F662F40067;
	Mon,  3 Aug 2026 11:55:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 03 Aug 2026 11:55:28 -0400
X-ME-Sender: <xms:8Llwat0PqCkZncVNp_qFLYlpFJ-vaFooEB1fX39KkeQLkJZmRymDnQ>
    <xme:8LlwapSWCzHXomTSyYHNyVZhn2IqinJL92fagXgRefkYyZm6q5boVuzEnddr7WBFx
    b7iMeZSAlzhKQBgJsKluSYmeRnYM8UxQh3EtVymiKiVIBmNsETcYw>
X-ME-Received: <xmr:8LlwahSdEpMBrhfMMJY2D_IJncwtGB52ikGUNxR8te2eNvw7S1RnmbAHUrElrxS3iUUuRoNsdSkY3RF3QFS8XCQsZPT_1SwS>
X-ME-Proxy-Cause: dmFkZTFxY1F3JB0z5PJMxBQN7BaBss94S200xrf4uOxUwowzcm6P/hjioQ8wv7mdds29UZ
    iVTict7SXXiiESeu5bUzcekqpIKwcS29ujKjaYPcNKpQ1brzIng/SAgrDVn88hM6INlPkd
    j+sMe75wnuIIjrQDvCNUlcaMMUq5THwHroJ0C7Lx4yA9XKw67ZPRxTGSKJH1vDBRQC+oPe
    ymRbYNPxrppKmP6SCbGb/YDOW8Q3SCRYh0dAaGhMRz7zf2Xl4EoGuBGpZaAgPSEZtHarFX
    WDmCfPxijjtPXR7b6Op4SaYC0ks3ErJ2UGxKA/TFOgUS1oEuSx5Q9o+uJydFDJd4HvsOCK
    vlGJmEaowbpQw7xB0KOlCmXmRQgdmsbRdkMmpny9wIJKtNFgGoA2WTnuaydPWT+4TKbEle
    ot81nqoucS6PPQUZ8+wKetXOiVnnj/k3M3zqC0qbPtauyeK9ouCrdVY000wgsU2fs7H8Cf
    rnWPUyOSFKS16RQyqLLYbEvEk89exXoXIcDLhjNhImhQ/R8clqwsvFR/+OI6HOJBiZyBs4
    ax6Q6EMOkfTdSWpDUDwtIW2kiIl66scjfJ5yMtefcMayDodcvpQbTxCtKJUNPpz7mckoR5
    W4hmxIYUg6wR3i6DHnq5HJcDrO8Y+P2re8d3fBlwGLqXsg6kUSxn1WB+OtYQ
X-ME-Proxy: <xmx:8LlwaqUYmxwHvfbZHrSrmPWtR3vLZpsQJAi4gF3wGhLQhrkEnxvhyA>
    <xmx:8LlwarJPxTYec5gKimMUMkujWz1AOMstZ-BVwWKYsEcL0UD5vo3J6w>
    <xmx:8LlwarhalaykxybZ27ggaCKv4KTz1Bh6sa-PGUb1mG_0YNngBOLPLA>
    <xmx:8LlwaoKBdB8jxM6JBImdn0PBMKhiWOOrCkgnTY-HWy4BVScKmeDnxw>
    <xmx:8LlwaigFA7gfBDBsPBcvqKj4J1vm4NY-WN7Exi9BaHq6xYdUSJQAK3zN>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 11:55:28 -0400 (EDT)
Date: Mon, 3 Aug 2026 08:55:27 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 10/24] preempt: Introduce
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <anC57yYZI3w56UQB@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-11-boqun@kernel.org>
 <20260803113817.GB687043@noisy.programming.kicks-ass.net>
 <anCuG683z-iDfq9o@tardis.local>
 <20260803151943.GH687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803151943.GH687043@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 05:19:43PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 03, 2026 at 08:04:59AM -0700, Boqun Feng wrote:
> 
> > > > +/*
> > > > + * unsigned long preempt count parameter works for both 32bit and 64bit cases:
> > > > + *
> > > > + * - For 32bit, "int" (the return of preempt_count()) and "unsigned long" have
> > > > + *   the same size.
> > > > + * - For 64bit, the effective bits of a preempt count sits in 32bit, and we
> > > > + *   reserve the NEED_RESCHED bit from the old count.
> > > > + */
> > > 
> > > The 64bit comment doesn't really make sense to me.
> > > 
> > 
> > Ah, I meant "preserve" instead of "reserve"..
> 
> Ah, yes, that makes sense.
> 
> > > > diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> > > > index 33fc4c814a9f..87d5367f986c 100644
> > > > --- a/include/linux/preempt.h
> > > > +++ b/include/linux/preempt.h
> > > > @@ -30,18 +30,20 @@
> > > >   * NMI nesting depth is tracked in a separate per-CPU variable
> > > >   * (nmi_nesting) to save bits in preempt_count.
> > > >   *
> > > > - *         PREEMPT_MASK:	0x000000ff
> > > > - *         SOFTIRQ_MASK:	0x0000ff00
> > > > - * HARDIRQ_DISABLE_MASK:	0x00ff0000
> > > > - *         HARDIRQ_MASK:	0x0f000000
> > > > - *             NMI_MASK:	0x10000000
> > > > - * PREEMPT_NEED_RESCHED:	0x80000000
> > > > + *				32bit		HAS_SEPARATE_PREEMPT_RESCHED_BITS
> > > > + *
> > > > + *         PREEMPT_MASK:	0x000000ff	0x00000000000000ff
> > > > + *         SOFTIRQ_MASK:	0x0000ff00	0x000000000000ff00
> > > > + * HARDIRQ_DISABLE_MASK:	0x00ff0000	0x0000000000ff0000
> > > > + *         HARDIRQ_MASK:	0x0f000000	0x000000000f000000
> > > > + *             NMI_MASK:	0x10000000	0x00000000f0000000
> > > > + * PREEMPT_NEED_RESCHED:	0x80000000	0x8000000000000000
> > > >   */
> > > 
> > > Perhaps add a comment about how HAS_SEPARATE_PREEMPT_RESCHED_BITS really
> > > is about having PREEMPT_NEED_RESCHED in its own word, rather than
> > > preempt_count() being 64bit.
> > > 
> > > Because as presented it is very easy to confuse these two options.
> > > Ideally it would explain the LOAD-STORE issue with NEED_RESCHED and
> > > point to ARM64 or something.
> > 
> > How about organizing the comments as following:
> > 
> > + *
> > + *         PREEMPT_MASK:	0x000000ff
> > + *         SOFTIRQ_MASK:	0x0000ff00
> > + * HARDIRQ_DISABLE_MASK:	0x00ff0000
> > + *         HARDIRQ_MASK:	0x0f000000
> > + *
> > + * Depending on HAS_SEPARATE_PREEMPT_RESCHED_BITS, NEED_RESCHED bit
> > + * is put in a separate 32bits.
> > + *
> > + * HAS_SEPARATE_PREEMPT_RESCHED_BITS=n:
> > + *
> > + *             NMI_MASK:	0x10000000
> > + * PREEMPT_NEED_RESCHED:	0x80000000
> > + *
> > + * HAS_SEPARATE_PREEMPT_RESCHED_BITS=y:
> > + *
> > + * (NMI_MASK can use all the 4 bits)
> > + *
> > + *             NMI_MASK:	0xf0000000
> > 
> > Thoughts?
> 
> Perhaps add something like:
> 
> "Having PREEMPT_NEED_RESCHED in a separate word allows 64bit load-store
> architectures to 'set' PREEMPT_NEED_RESCHED without messing up the
> otherwise symmetric modifications used on preempt_count and still load
> the whole thing (single-copy) atomically, without having to resort to
> full atomic operations."
> 
> 

Will do this as well. Thanks!

Regards,
Boqun
