Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF330D416
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769503; cv=none; b=UjgxOLpg4EN1XunKbdTENe2GG1wniLCOcVmxTNlGLGBkUXRGqrCR8dgJs9FQ4J3Xg2/TnSwrjm2IReObS6qVJVVxqkdHTNt9++nGmDbLM9Y92qkBOrD4QwhyRgVYednW1CHdVCMrGlZmZHQCRIINYmPCSGFHb0d+ct+/JMa27LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769503; c=relaxed/simple;
	bh=2iU1UAs+sm+48yzFX7vpjGm3HzL21Y8twGh0LZy2UgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcTvcRJpsWbB0J6/U2EFO3iK+88fOdzwfADLuQzS9zOT0N6JQGNigUqW5Za6imqlWV607Sz24K4PtsI7G23u5edXfjp/v7e5hbJg701sOPVzDJ4GDqSg4/RgivbyXX1yvu/KGiEYP9MCrxCMNFW+WrJu+WadrVnuC+XHtHOUSKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyFteE6c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyFteE6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DF01F000E9;
	Mon,  3 Aug 2026 15:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785769501;
	bh=ZoA0ZzcmNg6/H7+zDVrgZ61YpGl4SyWjGUZLYGSn7FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LyFteE6cpmwp8TPBZE2fI8p+TOdaFZkScoimGxhynw5vXrCw0MJA4fsJ/vmTaEhJR
	 1MwYVqJ7B+wXFhqUELQgUkM1VTjdhkoQLNE/x3wvn3BUpAM7MuMJ73QkIeE0enjklm
	 1TH61KA3Fi22LNH2kRabuFNs7d3i3Ws5VZZpBnBLDXIHnJl63y2OJ6tn0YJjKsfVww
	 RXc+ZQalqpaCZyH9W3Z7ckXfOJn53M/t2s3QWJDXBHvbYKDlBNVG2jLVqNiKGzgvDW
	 pxuz+TxTS5JWBvd1cpkfbXteXUX93+BxJJGKPTdH6z2lWNT3XW83shjm35szy5cTl3
	 4E4smNfwjc+Og==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id C01C1F40066;
	Mon,  3 Aug 2026 11:05:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 03 Aug 2026 11:05:00 -0400
X-ME-Sender: <xms:HK5waiyLtA4gpJHO95cTKCKN3sSV0jkWCWwj_aq9QNO4rCH1xIqbUw>
    <xme:HK5wajcR-RwHyhapoDzfpmMxIiqj5jMGKZqji-ptTtXWY5Au9NRSOVVT9tC-wSIRF
    qaGzPxUbMlUnOsn7gGOuaZA6QvMf3UBfFvn5rt5w74Po0cYHUul>
X-ME-Received: <xmr:HK5wantGosudkheszJY1urZLLNbp-yFa0EQY6o-PX_Y8aW5bLcoOaapkS3cx025xsqnWRWrEt5bAmZpBXwaqgVjPVJSJJATd>
X-ME-Proxy-Cause: dmFkZTEcqG3YFCZivVR4TevQhnVl9dzrI+z92TSR0P+WfPPUE8y0SNKyMas+dlxt+mTgWD
    9q8m3pvDoT23yONJYjnXa+MpDjUwXmCTQI8A8N1B8L/tGkpyxuHc81I6651Tiuh61vVCNL
    0oey3LjOy2gAJsYcZ2ejtZuhNT2R7SIAt4rzfn/+LA3xJHq7nx8eDIQCwjg7VbUoCbB/TO
    r/gbYzQYG6Y9zxf88rN5YmdQPAwdTagnD3k2/8A+G5P88sAN2kqZUzDQ3wjU9appDStGv8
    WyXIrvLJluQZShsK+dneBPyiDQUKy4ZUo/g+09o+7Dru4VT8jFRAL1oU8ZN4/MtPht9Lgk
    kT9pLfmHVz1CJp6UVxG9wGVOSrtyVxwc9y1VyoHD/OT4NIzCgQWiBUvE1xujKcNtukqfIo
    rmAJ5X2PkEvJ4GRq2AJVgBbfISht08vIH33Ex1k98K9GH/OftdB1qX8uhDALR73Hw6LU8y
    SX9ZxXqkdjWXCLTU9iIKs4wBlkt/PFz5IHrhpAyUI8l7Y7o4/WYM19cliE8NoPCGRcnm7h
    SHrU82xEHO07HwyjoJ+5Ba4ALcfi/eG2tgVkpdn2BsR1VvKQKBm689kI3LTtVMisXCbiiS
    Cd3RWWV61qJz2z0GbwPrC1QZKcgmmnkr0ldVx6bgwoAtL1QyljAmgg/7HtzQ
X-ME-Proxy: <xmx:HK5waoDD7MC0k_8ZTCrDUEFkPjjynY6eUY7ap6ZjCZJM1F4pNB4vzQ>
    <xmx:HK5wavHQ7_iqZcZr4_L_smqgr7Y4nV3mApeW9mCckCMU1d38-Lcixw>
    <xmx:HK5waov84FAI1w-d8GEcr2zJZHDUuwwbITLc5C_ncgP999PXaHks8w>
    <xmx:HK5waln6jy_-UI-NBD5WJV3eYaCV6DaiJUmgq_A9rLoj_93QssF5iQ>
    <xmx:HK5warOieho_nONIF5eZr4btZyn56X4iq1fiR3ZuorntWDKvUY3C9ZPy>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 11:05:00 -0400 (EDT)
Date: Mon, 3 Aug 2026 08:04:59 -0700
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
Message-ID: <anCuG683z-iDfq9o@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-11-boqun@kernel.org>
 <20260803113817.GB687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803113817.GB687043@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 01:38:17PM +0200, Peter Zijlstra wrote:
> On Fri, Jul 31, 2026 at 01:30:11PM -0700, Boqun Feng wrote:
> 
> > diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
> > index 1220656f3370..12353eeebc52 100644
> > --- a/arch/x86/include/asm/preempt.h
> > +++ b/arch/x86/include/asm/preempt.h
> 
> > @@ -24,18 +34,26 @@ DECLARE_PER_CPU_CACHE_HOT(int, __preempt_count);
> >   */
> >  static __always_inline int preempt_count(void)
> >  {
> > -	return raw_cpu_read_4(__preempt_count) & ~PREEMPT_NEED_RESCHED;
> > +	return __pc_op(read, __preempt_count) & ~PREEMPT_NEED_RESCHED;
> >  }
> >  
> > -static __always_inline void preempt_count_set(int pc)
> > +/*
> > + * unsigned long preempt count parameter works for both 32bit and 64bit cases:
> > + *
> > + * - For 32bit, "int" (the return of preempt_count()) and "unsigned long" have
> > + *   the same size.
> > + * - For 64bit, the effective bits of a preempt count sits in 32bit, and we
> > + *   reserve the NEED_RESCHED bit from the old count.
> > + */
> 
> The 64bit comment doesn't really make sense to me.
> 

Ah, I meant "preserve" instead of "reserve"..

+/*
+ * unsigned long preempt count parameter works for both 32bit and 64bit cases:
+ *
+ * - For 32bit, "int" (the return of preempt_count()) and "unsigned long" have
+ *   the same size.
+ * - For 64bit, the effective bits of a preempt count sits in 32bit, and we
+ *   preserve the NEED_RESCHED bit from the old count.
+ */

It means we won't change the NEED_RESCHED bit regardless that `pc` has
it set or not.

> > +static __always_inline void preempt_count_set(unsigned long pc)
> >  {
> > -	int old, new;
> > +	unsigned long old, new;
> >  
> > -	old = raw_cpu_read_4(__preempt_count);
> > +	old = __pc_op(read, __preempt_count);
> >  	do {
> >  		new = (old & PREEMPT_NEED_RESCHED) |
> >  			(pc & ~PREEMPT_NEED_RESCHED);
> > -	} while (!raw_cpu_try_cmpxchg_4(__preempt_count, &old, new));
> > +	} while (!__pc_op(try_cmpxchg, __preempt_count, &old, new));
> >  }
> 
> > diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> > index 33fc4c814a9f..87d5367f986c 100644
> > --- a/include/linux/preempt.h
> > +++ b/include/linux/preempt.h
> > @@ -30,18 +30,20 @@
> >   * NMI nesting depth is tracked in a separate per-CPU variable
> >   * (nmi_nesting) to save bits in preempt_count.
> >   *
> > - *         PREEMPT_MASK:	0x000000ff
> > - *         SOFTIRQ_MASK:	0x0000ff00
> > - * HARDIRQ_DISABLE_MASK:	0x00ff0000
> > - *         HARDIRQ_MASK:	0x0f000000
> > - *             NMI_MASK:	0x10000000
> > - * PREEMPT_NEED_RESCHED:	0x80000000
> > + *				32bit		HAS_SEPARATE_PREEMPT_RESCHED_BITS
> > + *
> > + *         PREEMPT_MASK:	0x000000ff	0x00000000000000ff
> > + *         SOFTIRQ_MASK:	0x0000ff00	0x000000000000ff00
> > + * HARDIRQ_DISABLE_MASK:	0x00ff0000	0x0000000000ff0000
> > + *         HARDIRQ_MASK:	0x0f000000	0x000000000f000000
> > + *             NMI_MASK:	0x10000000	0x00000000f0000000
> > + * PREEMPT_NEED_RESCHED:	0x80000000	0x8000000000000000
> >   */
> 
> Perhaps add a comment about how HAS_SEPARATE_PREEMPT_RESCHED_BITS really
> is about having PREEMPT_NEED_RESCHED in its own word, rather than
> preempt_count() being 64bit.
> 
> Because as presented it is very easy to confuse these two options.
> Ideally it would explain the LOAD-STORE issue with NEED_RESCHED and
> point to ARM64 or something.

How about organizing the comments as following:

+ *
+ *         PREEMPT_MASK:	0x000000ff
+ *         SOFTIRQ_MASK:	0x0000ff00
+ * HARDIRQ_DISABLE_MASK:	0x00ff0000
+ *         HARDIRQ_MASK:	0x0f000000
+ *
+ * Depending on HAS_SEPARATE_PREEMPT_RESCHED_BITS, NEED_RESCHED bit
+ * is put in a separate 32bits.
+ *
+ * HAS_SEPARATE_PREEMPT_RESCHED_BITS=n:
+ *
+ *             NMI_MASK:	0x10000000
+ * PREEMPT_NEED_RESCHED:	0x80000000
+ *
+ * HAS_SEPARATE_PREEMPT_RESCHED_BITS=y:
+ *
+ * (NMI_MASK can use all the 4 bits)
+ *
+ *             NMI_MASK:	0xf0000000

Thoughts?

Regards,
Boqun
