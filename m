Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FD313531;
	Mon,  3 Aug 2026 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767676; cv=none; b=WA4iKNxDv3ZjNCeYHyGyXz5G15Iia0QEDqZQorL7b6jmWLCnVpuSxnJYzZXd+joTfErqWu5Q4lpr90leJJm/zXrnYbS0ppf8gWnrMnitZhpetMy1XNikNVXP34FXBu2y4oeQEA91O+jzDFXscvUatd57Bj+GzRi+3okmj30YxNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767676; c=relaxed/simple;
	bh=DulWPAx5iSZXUMfU+g33v9+qFqBBMUznano+9kukvdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDiQdyaLrSuITqcUvzLBo9KO3mSgMXqU0WCF/Kul+Dfv/OZFWqwqHYzxnO2th9f7oVul1ryKo7sCSsI25KdCfgSfnf16H57z01cEF2DIFLTikISxXC2Kr5kwlWPg73/mwB31oXV4iDly+Y3zOi+/fF4I5EYrdftcG3HiX6bwKdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GcuOhb+d; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GcuOhb+d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=S91dlgpngRG2zHwN7gcWpXOHDNgor8s0w3nRAGsJyN4=; b=GcuOhb+d0jpQIsKFpF0VuNwjTR
	FtOqYGaGVS+V7KjdP+AwBEz9+T1Mq35V7p0DWIVY+WVCKVrqYDp6KSiDcbheyCQ/dM+hGb/i+Dj7C
	BFtJZSUuL9Vag8+BWiKrXypVkZ+Wnan0K67pGQZdGvWjxS5/XsCGalwMtGAVtiWmc8r7/8RApr66U
	mccj9TExEIpwTFpF9eL2wAjWd5Tojz5nPCrjmb31wQFf7uRrt2bA5IZyCGfXgB7B67aw8nw31HTBe
	RlA30TOLJe748smOSD+pmBvAn/lkg5GeQfE0tacH9EhzRtBT5sHqzlf0WQiCGrT+S1L2ez8wUo1ER
	hXUUojNA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqtkJ-000000092zl-3DWV;
	Mon, 03 Aug 2026 14:34:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 690053012AB; Mon, 03 Aug 2026 16:34:26 +0200 (CEST)
Date: Mon, 3 Aug 2026 16:34:26 +0200
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
Message-ID: <20260803143426.GD788244@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803102155.GI49951@noisy.programming.kicks-ass.net>
 <anCgfqYg0vYCgZr-@tardis.local>
 <20260803142106.GF687043@noisy.programming.kicks-ass.net>
 <20260803143315.GC788244@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803143315.GC788244@noisy.programming.kicks-ass.net>

On Mon, Aug 03, 2026 at 04:33:15PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 03, 2026 at 04:21:06PM +0200, Peter Zijlstra wrote:
> 
> > No; for one, you cannot elide the preempt_disable/enable() from this
> > thing.
> > 
> > It has always been valid to do:
> > 
> > 	raw_spin_lock_irq(lock);
> > 	...
> > 	raw_spin_unlock(lock);
> > 	...
> > 	local_irq_enable();
> > 
> > And since raw_spin_unlock() does have the preemption thing,
> > raw_spin_lock_irq() must too. And the very same argument is still valid
> > if you now write:
> > 
> > 	raw_spin_lock_irq_disable(lock);
> > 	...
> > 	raw_spin_unlock(lock);
> > 	...
> > 	local_interrupt_enable();
> > 
> > Secondly, nothing should 'set' NEED_RESCHED without also immediately
> > causing a preemption.
> 
> Notably, scheduler_ipi() is the one that folds TIF_NEED_RESCHED into
> PREEMPT_NEED_RESCHED for remote reschedules.

(and note that this is exactly the from hardirq context on current usage
as per the below...)

> Other than that, set_preempt_need_resched() must always be used from
> hardirq context or inside the schedule() loop on current. When used from
> hardirq context, the interrupt-return path will handle the reschedule,
> when used inside the schedule() loop, the loop will.
> 
> No other fiddling of NEED_RESCHED should occur.
