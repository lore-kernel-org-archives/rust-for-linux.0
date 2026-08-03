Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E4C3B6BE4;
	Mon,  3 Aug 2026 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748800; cv=none; b=qblPjyQ5YbM25b8JqzUwf4fqhNUQe8LQ2BKDUOC9JhaOepMlKGoHHSZKyvKD/a1NLfV4evvKU5WNVLVveWv2TJtAw24mft/SlaptUcbre0U5/2ABlElzbme+6TQcYFD75qauUPI6SaArAqeMXDFlxa/O+MzYi9xqjjs8Jdd6TBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748800; c=relaxed/simple;
	bh=NfzYDrHgVuFd/Mz3HETLQES8W5HqVekyVScOeoGuS3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDM2gFqtmBlOmPmz4ZZwnMyM7aiRlKqflESjV8Os9Ti6jh2inknr26edT7eBDa6JMWMwTaTPGdZCC3JG9nG4Q/vpGL4fbcKSP5n5+cS51k8nOsI5di+Khk/t0VjV+LtRYXEpmbbVfcm2+DrW91QNapr3sg5F6ASD4gxpEp6bGUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dMHqkv9o; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dMHqkv9o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tSgU5QUHXfusCbOWiwSDsmCHBt6w6CZCHmbnVq/tBI4=; b=dMHqkv9oTb7drYBPeIUZsNoXSR
	NsiPWbvJg24i2bQi4btu9KBS5lHgckP88NQd3eI1kgd0QVJ36KKoH7IAyC4WKtyTxweP1SMKz1c5U
	NjnBJlkajKvMTvuGqJanS7xF9vy+CD8kz6Pmpc1epDc5OM2Ex2MuForRj8ML7bC9eWs2NC2n6Ipr8
	cMC6u8vZn5jQ1I3AEjL7W63ccxKaPFl2vWQHEYB0E8mihexDqexf48EGVhH7/rjG2lfumo1B2+ZU8
	tKjzpfM8Iksy53M6H0WBtIVFZJhptaK42dWr60ztNWmw35PRy+PzM2UIGKleWUKpTo0RZj8DaVfWj
	qovkAL8w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqopM-0000000CnOR-1NcJ;
	Mon, 03 Aug 2026 09:19:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8675F301127; Mon, 03 Aug 2026 11:19:19 +0200 (CEST)
Date: Mon, 3 Aug 2026 11:19:19 +0200
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
Message-ID: <20260803091919.GC49951@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731203031.13679-6-boqun@kernel.org>

On Fri, Jul 31, 2026 at 01:30:06PM -0700, Boqun Feng wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
> 
> Currently the nested interrupt disabling and enabling is present by
> _irqsave() and _irqrestore() APIs, which are relatively unsafe, for
> example:
> 
> 	<interrupts are enabled as beginning>
> 	spin_lock_irqsave(l1, flag1);
> 	spin_lock_irqsave(l2, flag2);
> 	spin_unlock_irqrestore(l1, flags1);
> 	<l2 is still held but interrupts are enabled>
> 	// accesses to interrupt-disable protect data will cause races.
> 
> This is even easier to triggered with guard facilities:
> 
> 	unsigned long flag2;
> 
> 	scoped_guard(spin_lock_irqsave, l1) {
> 		spin_lock_irqsave(l2, flag2);
> 	}
> 	// l2 locked but interrupts are enabled.
> 	spin_unlock_irqrestore(l2, flag2);
> 
> (Hand-to-hand locking critical sections are not uncommon for a
> fine-grained lock design)
> 
> And because this unsafety, Rust cannot easily wrap the
> interrupt-disabling locks in a safe API, which complicates the design.
> 
> To resolve this, introduce a new set of interrupt disabling APIs:
> 
> *	local_interrupt_disable();
> *	local_interrupt_enable();
> 
> They work like local_irq_save() and local_irq_restore() except that 1)
> the outermost local_interrupt_disable() call save the interrupt state
> into a percpu variable, so that the outermost local_interrupt_enable()
> can restore the state, and 2) a percpu counter is added to record the
> nest level of these calls, so that interrupts are not accidentally
> enabled inside the outermost critical section.
> 
> Also add the corresponding spin_lock primitives: spin_lock_irq_disable()
> and spin_unlock_irq_enable(), as a result, code as follow:
> 
> 	spin_lock_irq_disable(l1);
> 	spin_lock_irq_disable(l2);
> 	spin_unlock_irq_enable(l1);
> 	// Interrupts are still disabled.
> 	spin_unlock_irq_enable(l2);
> 
> doesn't have the issue that interrupts are accidentally enabled.
> 
> This also makes the wrapper of interrupt-disabling locks on Rust easier
> to design.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> Link: https://patch.msgid.link/20260121223933.1568682-6-lyude@redhat.com

Same SoB chain issue.
