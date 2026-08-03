Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7026E41BA8A;
	Mon,  3 Aug 2026 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765360; cv=none; b=tiLQ53eFQwrCG4Cd9mgLHfaLniBUHoF7Hx7hNEUXSJfG4xD50MhJ8JFEJrmPWhiPi5W7iWNHTKzdj9F4xhsCYNhnAAyq+ePdAVc3A6zFbRw86p1wN9WDU9ZGjV0f/IEBFvCrHM3MGBiW6t0Kb6ezRLXLBCEwPxWGiEmt5zLBhOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765360; c=relaxed/simple;
	bh=ACua8exxWWvVeznokb9LOFfV+Cw/SSYvtMEt1poWqxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REyb2YHKPQYKvMBNbT34WgJNM4cFkG7Nti5RZJwlLRI5Kp2nKIV0GOg4pLCwoUQMH62XgsbSgfQow0xs4JXkV/35i45BmxWQDl9ZJLDkywwDULjGsONuIQYFaYsbR3Rrgijb5wjzumEQ/NtlggqDiDWXdnGLKL3UqnPOEb6sSc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mHOAAPK4; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mHOAAPK4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C5q3u70FJWxH/uvFn8cDpg+rEo8Z9ECXOh+5edjuc9I=; b=mHOAAPK4wELQ0PQTghVRa0GY+I
	HJpO7mwujMMONi1oSTMAC3elIprTbzi6bKiUlpljUXrixtaPUDq2RVeILzkcouZkogpAOjFwEQorq
	MG8mN2GwOo4Ccgu4NxVph1kX/6MFrQ8nqVvJCAB692VTeuKBu5snQ/4MUt2/Y6h06smteZ0nyD15b
	0SwP39FbVmO4bCEyiDN2YbOJiN09mb1ci08x6hAGQ8td2dRPK/0S+npKVqbcTs43TElCRMHFO1sMz
	zdIDMrxfUQlFGp2HSYRqBOk4SlZNqCrtv297RwX85GTjpqJ+2RJ7CZohuW8cbhi79YJrOG+l/QnQA
	TAdhUFzA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqt8v-0000000919M-0VZT;
	Mon, 03 Aug 2026 13:55:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A1959301127; Mon, 03 Aug 2026 15:55:47 +0200 (CEST)
Date: Mon, 3 Aug 2026 15:55:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
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
Message-ID: <20260803135547.GE687043@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-8-boqun@kernel.org>
 <20260803093433.GE49951@noisy.programming.kicks-ass.net>
 <anCbq2gh1uIcYHRU@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anCbq2gh1uIcYHRU@tardis.local>

On Mon, Aug 03, 2026 at 06:46:19AM -0700, Boqun Feng wrote:

> > What about the _irqsave() guards?
> > 
> > Is the goal to replace _irqsave guard usage with _irq and then remove
> > the _irqsave guards?
> > 
> 
> Yes, that's the goal. I had that in previous version. However in
> 1abbecd1d2d2 ("sched/fair: Convert cfs bandwidth throttling to use
> guards"), we have a user that explicitly plays with the .flags in guard. 
> Lyude also spotted that too. We could adjust that user to the new API
> (Lyude already has the diff for that) but I decided to simply drop that
> part for now given the current size of the changes. But if you think
> it's a must for merge this, I will add it.

Well, but this new stuff should be able to clean that up, no?

---
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7248,7 +7248,7 @@ static bool distribute_cfs_runtime(struc
  * period the timer is deactivated until scheduling resumes; cfs_b->idle is
  * used to track this state.
  */
-static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun, unsigned long flags)
+static int do_sched_cfs_period_timer(struct cfs_bandwidth *cfs_b, int overrun)
 	__must_hold(&cfs_b->lock)
 {
 	int throttled;
@@ -7283,10 +7283,10 @@ static int do_sched_cfs_period_timer(str
 	 * This check is repeated as we release cfs_b->lock while we unthrottle.
 	 */
 	while (throttled && cfs_b->runtime > 0) {
-		raw_spin_unlock_irqrestore(&cfs_b->lock, flags);
+		raw_spin_unlock_irq_enable(&cfs_b->lock);
 		/* we can't nest cfs_b->lock while distributing bandwidth */
 		throttled = distribute_cfs_runtime(cfs_b);
-		raw_spin_lock_irqsave(&cfs_b->lock, flags);
+		raw_spin_lock_irq_disable(&cfs_b->lock);
 	}
 
 	/*
@@ -7394,7 +7394,7 @@ static __always_inline void return_cfs_r
 static void do_sched_cfs_slack_timer(struct cfs_bandwidth *cfs_b)
 {
 	/* confirm we're still not at a refresh boundary */
-	scoped_guard(raw_spinlock_irqsave, &cfs_b->lock) {
+	scoped_guard(raw_spinlock_irq, &cfs_b->lock) {
 		u64 runtime = 0, slice = sched_cfs_bandwidth_slice();
 
 		cfs_b->slack_started = false;
@@ -7479,14 +7479,14 @@ static enum hrtimer_restart sched_cfs_pe
 	int idle = 0;
 	int count = 0;
 
-	CLASS(raw_spinlock_irqsave, cfsb_guard)(&cfs_b->lock);
+	guard(raw_spinlock_irq)(&cfs_b->lock);
 
 	for (;;) {
 		overrun = hrtimer_forward_now(timer, cfs_b->period);
 		if (!overrun)
 			break;
 
-		idle = do_sched_cfs_period_timer(cfs_b, overrun, cfsb_guard.flags);
+		idle = do_sched_cfs_period_timer(cfs_b, overrun);
 
 		if (++count > 3) {
 			u64 new, old = ktime_to_ns(cfs_b->period);
