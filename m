Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692883E171B;
	Wed,  5 Aug 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913655; cv=none; b=fWE3Qhcd/YdbdtjetT/GMzK5MVtHJ1shamf22gBaz49Mt3Z/tZd0pn7wXssIfekP7hKKs5C73SmyLO3wpgKpaAKrlMapK6mYrp3GEg5Rh0+iboAHZKQcdm9z2RtS19FpEw6Oq8dYfM5ZWYCOn3DeyNH8uEIEAuBK38QeXvih6xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913655; c=relaxed/simple;
	bh=FvrIhNkulb9DO/LZBwdNrdiZmbNuMoqCt3hMd4nPx1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0vM1ls8rsCb/7cISFUr5UQXjYYs612gFhrxygUq71Z5FlzbdluDfsPZxRJH/1RuxXX4VDpkjhChcwZaSgS8EHiS2dAEkEUFxVFiVd4/JIagq8AcqZ4MA0CMQ6QOsbu1caIOqysmzOzXXhcyAN+ABYQmSc3yI6pRf0nNQl0P1zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Efba8kLb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Efba8kLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A57D1F000E9;
	Wed,  5 Aug 2026 07:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913654;
	bh=YAxIbMSm2mj2m7Z9p7Tz9ihj93Kn6O8FiLry5u9oklY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Efba8kLbWaQk2nvzBHr2eCxfkOrCKNrnTUeFCy9e2UG50pt+pmcp7+ZUBS33oxJtv
	 fShNaKDUfw64WbK+LkxPyirPT/aTK1mBdwmzBdU7rSkK0E+h537jHoFTRSYDd4sszd
	 +SM5KI7ZVnCGHoXyY/ctIRA5YfVTGdFMK95L7JsesjEMAbs4sxltRJWoCNHMqPnyzG
	 swdLTnBSHN7pJ9FtgHil39yVQ6LMhsoCRtd6H2JyLYfIzsPGTGBwb0bejSKmbzT52T
	 tEfRFRKsFJWieztsP2x38mcwD3hdjSYum009Ko+JVUTEQVveW9SzJcUQ6rxN4idmPQ
	 XN3NKOj1egOog==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 74E30F40066;
	Wed,  5 Aug 2026 03:07:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 05 Aug 2026 03:07:32 -0400
X-ME-Sender: <xms:NOFyavpaFucXrbdU_WYshtWuyVLnxE9WY1wnAomk1a50qjNGI8ogyg>
    <xme:NOFyapF8IEB15P-q8sigBR2W1Kfj6vm74GRPnotWHuTCrKpuc2hqcjFUsAMVDcjq7
    3f5Wphf1gwJy-Vin2rd3Xf-38Kri9hed7G6NhIa_hKx5ydD9UG4-A>
X-ME-Received: <xmr:NOFyatRUlqX5TpGRaYtvHdiqoRlVFv9XIoOpgYeq8ZRuECBk9300C7JzzL-Zr3I6vywr7B3FmpluJlPYUwRej7pq2EPmabWf>
X-ME-Proxy-Cause: dmFkZTGvtMnO7TZgz0e5E7/KFLO6I96gBhSzJeFdSBjpcvdAFSJQuZ7bGKxDMJoGAMx0Hu
    2xeFwhI8dMjNWihU+7vOY7iZHWT2PL6i7G7YqfJ+SLux16oag/WUkwzhIgqxhhXFY9Eg8q
    nAcEcdVnh70AByVokFIc0uq23KKyHLhF8nIN2UWd9k881lamB1Z1jCsaYMbE8plYRMINV6
    1r+RC8uoCsDLc3ikiIgVTCMtF7BVb3cq+UR623Gow/q2OKh+rIUN9f/zferNtgPVpAxj45
    7aclWO+MRdXycign/uAfPjSgGt54WMIDsxzip9AM4sMIO5j71/1GylTukskgA0QSCpT7EY
    wEkpSmyjjZ5HSD6PRZ7GhC6D5jZt8NTdz9cmZUkmEnU8YQvH3bhEx/Cpjdh7ctRmHdz7qP
    9jPDTqwq4G+QhRMqnNo8Dy62d7As4H1biYkl51RAzyg+S1puoabUsrXOTPUIJzLaXK31g/
    lfcQCFglnrwD8gNIs1NHboZ33AYgfeSacL4lG42R3nIjm7KSAeEKSY2T5C2YzahC0EPGiw
    mJh1S7seJz0+6bGvxK0HS+hhexdGCjSNkINBMzC6dSTomXTEeTXw4JVTS7bx4FLi3CWRuw
    /rBSUK3BJrx2KXjezw+fwNWAbqJ1LcOTI6C2LcCZ3KGf7DQnxVYLhvUmJUcA
X-ME-Proxy: <xmx:NOFyanMJU9AvoR1-uN805QV9K_gvt2JXfnPG8MqXKRDwAFTeD7LbeQ>
    <xmx:NOFyainIvx4TCAdh7IKJvlakMcdDc00dcPUwd3ozi0uaPTSRMNwTOQ>
    <xmx:NOFyahbf2s-MtpaXcNR3PiZjC5TPEqRSs1osIEK4DeaXBkY9SpsjYQ>
    <xmx:NOFyagTLkfvL_NopaBXzBjNfiVH6Lk2f8oy6flL8InXmVVpptFGThQ>
    <xmx:NOFyajVo3GwvjdCgb3r7sA-wZq46GqVv7ps_2BkbGvyBVFvJKLO1xlaC>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 03:07:31 -0400 (EDT)
Date: Wed, 5 Aug 2026 00:07:31 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anLhM8xTlB6bN2N7@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
 <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805063645.GO776954@noisy.programming.kicks-ass.net>

On Wed, Aug 05, 2026 at 08:36:45AM +0200, Peter Zijlstra wrote:
> On Tue, Aug 04, 2026 at 02:08:11PM -0700, Boqun Feng wrote:
> 
> > > > +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > > > +
> > > > +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > > > +		_local_interrupt_disable();
> > > > +}
> > > 
> > > Maximum nesting possible is 256 right? Whats is stopping here to do more than that?
> > 
> > Yes. Currently similar as softirq, we don't detect the overflow.
> > 
> > > Should there be a warn_on?
> > 
> > A simple warn_on could be problematic because warn_on() itself may take
> > an irq-disabling lock, and that may trigger another overflow on top of
> > the existing overflow. It's a bit tricky to do a proper detection. But
> > I'm open to ideas.
> 
> DEBUG_PREEMPT's preempt_count_add() does:
> 
>         DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >= PREEMPT_MASK - 10);
> 

Yeah, but this is behind a kconfig (DEBUG_PREEMPT), so not sure whether
it's what Shrikanth asked here.

Regards,
Boqun

> 
