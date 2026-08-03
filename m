Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A04156E5;
	Mon,  3 Aug 2026 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767605; cv=none; b=r2BSNw7OkUkWcU4CqDMcFwty9JOianv9UNkwg2ebZf8wGfnqJNdzGh1dLv+cyiqnAEE/MFE+A1BFyi77RRK0FIeo67ZZE/zGsIq99L69IWHEUn6+r3C0MVsBrA0JyZHRpX9j0Fl8KwJ1/IUPy/DAaIlGNTDPXktkbvF0F2ElFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767605; c=relaxed/simple;
	bh=cdjtm7y8sQ8KvaSXQ6RTib7Bd80T3eEGWbErjDzP5Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJKWjr/YKf4+ysXw+LGPNELVFhkLT5IRgxt4yIQcW+fs3EfqxBJUdy53JXQqg+qzT4sBT+e4lKRBU1zljZJDnIdepksoQ8Ow8RoJ+vchTePMQwcUC4LT1GKVEOkL7FO8yzlZrLWrTYJBChdbj8zb2OCmKp14RspjxuZxNfEbzS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=X9WCOrk0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X9WCOrk0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SHqeYdMFLe2SuCrvaXaRB/rLWEkPMlLMtR7Ww3H9UK8=; b=X9WCOrk0ZdGuOEOWzqYVkk4JBK
	He9kYt7HU0Tk/L4Gb4xGH9+sIWu2xwsqTvvLFGRuiri/n5+kgg1TNQ7UjqsB11BZ6sx0kSUEwzgCs
	mb4g+p++o5mk41/vSeIQ6DWOBK82AXIaITLEG8Dg1mVPal4IQkKK53vUYUGlF1vqzBTjloifTpQdL
	wMwbUbI7/LPKyKxslLYtxvv00IYz1QLToVmaO7uFPQ1EEPXWjd/L04H3np3Y0bocKQJa/IKLFdxmr
	Fq0fMRm0GZ2j769mL0DIaNcss/Clqk1qwkd26i5bDmCoV66N/+Gu5hm0PIO9A0lzxl3OqGNwn2BtE
	saOUX4+w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtjA-0000000DmOB-0JJu;
	Mon, 03 Aug 2026 14:33:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9F49B301127; Mon, 03 Aug 2026 16:33:15 +0200 (CEST)
Date: Mon, 3 Aug 2026 16:33:15 +0200
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
Subject: Re: [PATCH 05/24] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <20260803143315.GC788244@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803102155.GI49951@noisy.programming.kicks-ass.net>
 <anCgfqYg0vYCgZr-@tardis.local>
 <20260803142106.GF687043@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803142106.GF687043@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 04:21:06PM +0200, Peter Zijlstra wrote:

> No; for one, you cannot elide the preempt_disable/enable() from this
> thing.
> 
> It has always been valid to do:
> 
> 	raw_spin_lock_irq(lock);
> 	...
> 	raw_spin_unlock(lock);
> 	...
> 	local_irq_enable();
> 
> And since raw_spin_unlock() does have the preemption thing,
> raw_spin_lock_irq() must too. And the very same argument is still valid
> if you now write:
> 
> 	raw_spin_lock_irq_disable(lock);
> 	...
> 	raw_spin_unlock(lock);
> 	...
> 	local_interrupt_enable();
> 
> Secondly, nothing should 'set' NEED_RESCHED without also immediately
> causing a preemption.

Notably, scheduler_ipi() is the one that folds TIF_NEED_RESCHED into
PREEMPT_NEED_RESCHED for remote reschedules.

Other than that, set_preempt_need_resched() must always be used from
hardirq context or inside the schedule() loop on current. When used from
hardirq context, the interrupt-return path will handle the reschedule,
when used inside the schedule() loop, the loop will.

No other fiddling of NEED_RESCHED should occur.
