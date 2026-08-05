Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B0326939;
	Wed,  5 Aug 2026 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911815; cv=none; b=cihBcpAgxCW40XZ0v0mXR/Mp3LqHCUMD7vo4KOoDryd5bAPQeI+BEFp6t/FvbP5zfFIKNoD/iYP0bVs8RzmBI6iShup9cO2yxRWHPxUSS0Z5hv5lr27RHq96G85nGWaD03ufQbJiJDyPm7JcdWUaLP2YiswlXEjrdis94L8w+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911815; c=relaxed/simple;
	bh=ysP5bSJ2UOjLU0wRRehiIQDXOIeqE6glLEsuvZz2LmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkaJNlkgC9F6BEL8+5a8M1k5nfHBRb6+3i9TFusjQEzBK4WiDfQ8pkxzWtQVcUfvrzUHYqBnboqfN3yV1dwyE/omltvUc3RqCrirQ52/DFsdcbLKB8NY2h5mVbjvCNS1vXVjBkwiPpkQaaaoTGlE6tuxB9j5q78qDdL/lKLbExE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=H/McYkXq; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H/McYkXq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hNrzc80EiCLORaNBmWAPsHAA7cOyxRrr0yNguTvUYSY=; b=H/McYkXqXadoCReSEKGub9heWX
	ZmOq6NvkKdOfAEhULQC1Bpo9wLqorKuR10GpuXcmgNYfze3UblbXhfPejuBogCGQLSg885jQulZ0c
	oxkkmCBjTKgtcGPIPDcf3o9iog+fvK5glxs9tzQprOCdXbEzeNalDZI3lgIjYo5KDkzEND4asze8N
	ZzCCQTGWqeXOLr1lOdKNpc0FEBYXy2cgLuI1DoBUHRUI5qlvwbWRqRGHOE/1Nb+GocDRLXPtroDmL
	Qb75v3NSyL9nOgwbYEDTS1+A0hv4maDI5Kr2qRnFP6deW2MSjdbCHYpMVntOwdbHMKMqUFnmeTE/f
	5yO5y4Ag==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrVF8-0000000AVMg-2vkW;
	Wed, 05 Aug 2026 06:36:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 651C0301127; Wed, 05 Aug 2026 08:36:45 +0200 (CEST)
Date: Wed, 5 Aug 2026 08:36:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
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
Message-ID: <20260805063645.GO776954@noisy.programming.kicks-ass.net>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
 <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anJUuzBcWRwyw6NJ@tardis.local>

On Tue, Aug 04, 2026 at 02:08:11PM -0700, Boqun Feng wrote:

> > > +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > > +
> > > +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > > +		_local_interrupt_disable();
> > > +}
> > 
> > Maximum nesting possible is 256 right? Whats is stopping here to do more than that?
> 
> Yes. Currently similar as softirq, we don't detect the overflow.
> 
> > Should there be a warn_on?
> 
> A simple warn_on could be problematic because warn_on() itself may take
> an irq-disabling lock, and that may trigger another overflow on top of
> the existing overflow. It's a bit tricky to do a proper detection. But
> I'm open to ideas.

DEBUG_PREEMPT's preempt_count_add() does:

        DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >= PREEMPT_MASK - 10);


