Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE663783C1;
	Mon,  3 Aug 2026 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766195; cv=none; b=TISGcLODUcg0ckDIh1nqY4hAD1ZFWYuHdaggtpfoEJX2U5Wy/wZxcKaNzOMkFbGMxZwG0CHoaZmvNPjPLyS/Uvr7GI2eSGtQJBibfOJi0qovkY4jrWqTb3iUov8hfDw3NWebSPS79xeuwU+JT0EwBgrH2xYkDWEJ9wYPXqFtOqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766195; c=relaxed/simple;
	bh=ZVyHAQW0A9xJvl3qECT+kpUTAE+/6zVs3fDDilyMvEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKIeK4mdiKYYD376avpJXU2prVAphGNP2/+8U0lQSFnF7ID6v9F6n8sYAALsS1HZtMtPJGgURGQL5PTtCYxYtwowoZaL8j2KXvVdpIDNixS6jqW17eAPEi4g8fsc8DdRC0SiOmrRI7eLpn5w3LXdO1a3vjoE09OB/xYtfCY5kgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpvdgLkG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpvdgLkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7081F00A3F;
	Mon,  3 Aug 2026 14:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766193;
	bh=fV+vYc3oCrAYfqUGsLHeUkd+d6tCv/QjVOrSc6K/8Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UpvdgLkGFQAIvAwGglVH9lZXE6WUSf2yFDwRxLHuhxIvXYCzEFCFfp5ygZuuIFbIv
	 xkdz0Dp1qHIlCIe3DFVFPzUknr3zHTDSsko1RmY9Zzlkkxme2Mef+nGEXvjYdGlbqU
	 Dy1OL/KL7ncYoPRSy3nIeTv1F+WXidJ7VCpNN9Glet6auqMrRalrxLaohec6oFSu+x
	 G5QeJvlw/OWTHtt8zeofMutAEs58OiKBc0dBv54UL4g27aoIDaebqk+pCOLLxF9AFl
	 mfSCxbhFbLINiU9/D1B7f1WZe3c1mgIUU5nOa1SOzgR41moGJZHVKYv4sjnu8U/4V4
	 p7lXC5FATD20A==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 81B87F4006A;
	Mon,  3 Aug 2026 10:09:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 03 Aug 2026 10:09:52 -0400
X-ME-Sender: <xms:MKFwauCm-x5I7apNxfEqN3NWQ1EcTWZ4hwIIdxeV5tOChh3PKKkuCA>
    <xme:MKFwai5iyOZ9AOGbmdhZ4VdpO19hIU42z-BSELZ3lLld5ZUIZA-0f6Wbjpriz45vL
    ZYaGv3LtvG5HuiPcAYY-qiZuhSPVThj6gbcCwP9aiUllSPVEVPGFFc>
X-ME-Received: <xmr:MKFwanvBtV6iZo3VFyiOqnWcOPSOJKhxKj59l0gTLZSrdqrmu--9yU3x7ywtbgw1-IhmM2bgX57J1762bOLcvV7dht7UrVgf>
X-ME-Proxy-Cause: dmFkZTENvGBUUiVSyg2lJ4h8TeEx9UKKjIxF4/rH0f5yXRhB+k2e4o/bNTYNglkeEZ6S4L
    B/oLHqDQ6n57GuVcECAusXOJuEzOFt9+FPRQh+s2+lqC4fxb6rcmDX1kt2xXx6S4uV11UB
    ahDJHOD7mKYhbbx7J29xB9NJzvHpMvU3c7In6ymWa0xvWf3dQl0pOaFTckBvPx2iRJhXa/
    Hp3W+sZVY61vPn109NZFXv38oR6xmQQdP8VVN7ctXwUCZrHxhxAYNPd6dF2fNsaLH/YdgZ
    8HhL7RAbR2jIR1ZZ1A/kqGqXCfaRqqTZsMkb0EIhWLMpWwJ6pO6MS12BPX76Nw9kzZILJR
    Q+dJFpgJGRgnnU9s4+xqX4vh1RXsl28l61kAD225YtmcnFxMhr9bSVu9Xqgzl5oXN4nrKi
    xQhqigevrFi40dcj9JlFdP+ugkC/MvEeuS7PxTJJfLyBXmA1uzkyXbh7svQudI0LgSGwBh
    K2cSXEwEh0h1oZsuPwrZ/oSmPJL7HQE0QZxVVd/D1CJVh/M1+dTKyc4k5rxBhDkmwp1cpp
    RXImJcng5+Be6sO5q1vQAHT2VzLHQPdeiAeaOXEIl+6QH9lyw8x1dJcgBT2ufU6XxoTyjT
    jLL1aIROzqCljolJYc6iEl2EmdsKqgmz8oOqBZPxFzpyqXAEsPHzVl92RUVQ
X-ME-Proxy: <xmx:MKFwan4HA8Jj7Lh5xzLGbVPTka0ug8-JqSDR_PtY-rcp2IO_NDXcEA>
    <xmx:MKFwar1pWBS8b7Q66PUTdYwTW8xj683wf5dhBO9g_v54uTt11wsJ_Q>
    <xmx:MKFwaqhGi6xipJHXQjCXX83DexE6Pa8w0sqhEAKT6GGq2eOiQirIEg>
    <xmx:MKFwarp1i8zOkOYjWAhgsHumVIwSpf2fFrqWfLgW02UX75LIgG9WwQ>
    <xmx:MKFwatMLMI0I26t3z_84SXdXzAFBXPNvpc8yt_SnRJeUSKNRbfZHsJnY>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Aug 2026 10:09:52 -0400 (EDT)
Date: Mon, 3 Aug 2026 07:09:51 -0700
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 07/24] locking: Switch to _irq_{disable,enable}()
 variants in cleanup guards
Message-ID: <anChL7FSBqFnoQP_@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-8-boqun@kernel.org>
 <20260803093433.GE49951@noisy.programming.kicks-ass.net>
 <anCbq2gh1uIcYHRU@tardis.local>
 <20260803135547.GE687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803135547.GE687043@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 03:55:47PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 03, 2026 at 06:46:19AM -0700, Boqun Feng wrote:
> 
> > > What about the _irqsave() guards?
> > > 
> > > Is the goal to replace _irqsave guard usage with _irq and then remove
> > > the _irqsave guards?
> > > 
> > 
> > Yes, that's the goal. I had that in previous version. However in
> > 1abbecd1d2d2 ("sched/fair: Convert cfs bandwidth throttling to use
> > guards"), we have a user that explicitly plays with the .flags in guard. 
> > Lyude also spotted that too. We could adjust that user to the new API
> > (Lyude already has the diff for that) but I decided to simply drop that
> > part for now given the current size of the changes. But if you think
> > it's a must for merge this, I will add it.
> 
> Well, but this new stuff should be able to clean that up, no?
> 

Yeah... I admit that the decision was made based on how much time I
could spend on this cycle, rather than "what the best we can do here".

Thank you. I fold the following.

Regards,
Boqun

> ---
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7248,7 +7248,7 @@ static bool distribute_cfs_runtime(struc
>   * period the timer is deactivated until scheduling resumes; cfs_b->idle is
>   * used to track this state.
>   */
> -static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun, unsigned long flags)
> +static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun)
>  	__must_hold(&cfs_b->lock)
>  {
>  	int throttled;
> @@ -7283,10 +7283,10 @@ static int do_sched_cfs_period_timer(str
>  	 * This check is repeated as we release cfs_b->lock while we unthrottle.
>  	 */
>  	while (throttled && cfs_b->runtime > 0) {
> -		raw_spin_unlock_irqrestore(&cfs_b->lock, flags);
> +		raw_spin_unlock_irq_enable(&cfs_b->lock);
>  		/* we can't nest cfs_b->lock while distributing bandwidth */
>  		throttled = distribute_cfs_runtime(cfs_b);
> -		raw_spin_lock_irqsave(&cfs_b->lock, flags);
> +		raw_spin_lock_irq_disable(&cfs_b->lock);
>  	}
>  
>  	/*
> @@ -7394,7 +7394,7 @@ static __always_inline void return_cfs_r
>  static void do_sched_cfs_slack_timer(struct cfs_bandwidth *cfs_b)
>  {
>  	/* confirm we're still not at a refresh boundary */
> -	scoped_guard(raw_spinlock_irqsave, &cfs_b->lock) {
> +	scoped_guard(raw_spinlock_irq, &cfs_b->lock) {
>  		u64 runtime = 0, slice = sched_cfs_bandwidth_slice();
>  
>  		cfs_b->slack_started = false;
> @@ -7479,14 +7479,14 @@ static enum hrtimer_restart sched_cfs_pe
>  	int idle = 0;
>  	int count = 0;
>  
> -	CLASS(raw_spinlock_irqsave, cfsb_guard)(&cfs_b->lock);
> +	guard(raw_spinlock_irq)(&cfs_b->lock);
>  
>  	for (;;) {
>  		overrun = hrtimer_forward_now(timer, cfs_b->period);
>  		if (!overrun)
>  			break;
>  
> -		idle = do_sched_cfs_period_timer(cfs_b, overrun, cfsb_guard.flags);
> +		idle = do_sched_cfs_period_timer(cfs_b, overrun);
>  
>  		if (++count > 3) {
>  			u64 new, old = ktime_to_ns(cfs_b->period);
