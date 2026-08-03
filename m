Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5860B40DB46;
	Mon,  3 Aug 2026 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770391; cv=none; b=Lv9Of8kfPdnSxKv50Qc25aqb3PFt2Wpp9hi5el/a70+DMXMLbrMrJJPnaNnivFaDAKT6swtGPfAmLz+RevAffva2ZuXznsGLKCp22aPsUOWrJaK7ymN2pmJ/QIZCg79grOHxRVkOSWY/UEZXnqZRKyqf1CYmfDYiViT48A6bMyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770391; c=relaxed/simple;
	bh=qgLHzyLqO+f5jaWyUJGppAjLf5MPGv8EZZGPyEaa9js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FI14XFOwfT4kYIywhbPUbW1xkMepI8QT5JZU1LF3OBdBieG06Gz1RIG1AGu+OtptgmzSZXnX5lZdNoGzprKya9IIIWeAhocpJ0bX94Jd5EwYdWjTNQDA46rnxRpcqtQkDIprHIFbET6DFUN8ZyeTiiGCL9kqF1ijj5CPdEf63dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MGOgDsDQ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MGOgDsDQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=msUVGJ06Pr7eVkB13/3ehWqQx5dEKKB1ZdPa7btkIKE=; b=MGOgDsDQ4h0fb3jTRYyHr8FJ4+
	facejFjyUP/1FZmv24khUVSiZne3GdEl2jJaAukQV3dwUYDpu8uEa8WfDd8aVyB3NisKGTGouikzE
	winijiFFcTKBC5gaq2n0ONW33fI/M4jnnJ5w5RY+F7EZ4BVbgZGKF8o8/K3buVOvHToGSsgVdS2qQ
	avbeN+MoHEM6i5qPQkwMnqyVK/noEuov32Gs5TwKRoYFChF5y5iw4RmLgalPoSi9YCwusra9uZghc
	UPP7WZZH7fFHo6tQZAZtePo97JJg2Sfmn1U7FeS0jth/eLMSt+mAr1zkGk4NhSw415Giqyxi9qI+9
	EsMHaRXA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wquS8-000000095MQ-0uZ1;
	Mon, 03 Aug 2026 15:19:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 609E73012AB; Mon, 03 Aug 2026 17:19:43 +0200 (CEST)
Date: Mon, 3 Aug 2026 17:19:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 10/24] preempt: Introduce
 HAS_SEPARATE_PREEMPT_RESCHED_BITS
Message-ID: <20260803151943.GH687043@noisy.programming.kicks-ass.net>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-11-boqun@kernel.org>
 <20260803113817.GB687043@noisy.programming.kicks-ass.net>
 <anCuG683z-iDfq9o@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anCuG683z-iDfq9o@tardis.local>

On Mon, Aug 03, 2026 at 08:04:59AM -0700, Boqun Feng wrote:

> > > +/*
> > > + * unsigned long preempt count parameter works for both 32bit and 64bit cases:
> > > + *
> > > + * - For 32bit, "int" (the return of preempt_count()) and "unsigned long" have
> > > + *   the same size.
> > > + * - For 64bit, the effective bits of a preempt count sits in 32bit, and we
> > > + *   reserve the NEED_RESCHED bit from the old count.
> > > + */
> > 
> > The 64bit comment doesn't really make sense to me.
> > 
> 
> Ah, I meant "preserve" instead of "reserve"..

Ah, yes, that makes sense.

> > > diff --git a/include/linux/preempt.h b/include/linux/preempt.h
> > > index 33fc4c814a9f..87d5367f986c 100644
> > > --- a/include/linux/preempt.h
> > > +++ b/include/linux/preempt.h
> > > @@ -30,18 +30,20 @@
> > >   * NMI nesting depth is tracked in a separate per-CPU variable
> > >   * (nmi_nesting) to save bits in preempt_count.
> > >   *
> > > - *         PREEMPT_MASK:	0x000000ff
> > > - *         SOFTIRQ_MASK:	0x0000ff00
> > > - * HARDIRQ_DISABLE_MASK:	0x00ff0000
> > > - *         HARDIRQ_MASK:	0x0f000000
> > > - *             NMI_MASK:	0x10000000
> > > - * PREEMPT_NEED_RESCHED:	0x80000000
> > > + *				32bit		HAS_SEPARATE_PREEMPT_RESCHED_BITS
> > > + *
> > > + *         PREEMPT_MASK:	0x000000ff	0x00000000000000ff
> > > + *         SOFTIRQ_MASK:	0x0000ff00	0x000000000000ff00
> > > + * HARDIRQ_DISABLE_MASK:	0x00ff0000	0x0000000000ff0000
> > > + *         HARDIRQ_MASK:	0x0f000000	0x000000000f000000
> > > + *             NMI_MASK:	0x10000000	0x00000000f0000000
> > > + * PREEMPT_NEED_RESCHED:	0x80000000	0x8000000000000000
> > >   */
> > 
> > Perhaps add a comment about how HAS_SEPARATE_PREEMPT_RESCHED_BITS really
> > is about having PREEMPT_NEED_RESCHED in its own word, rather than
> > preempt_count() being 64bit.
> > 
> > Because as presented it is very easy to confuse these two options.
> > Ideally it would explain the LOAD-STORE issue with NEED_RESCHED and
> > point to ARM64 or something.
> 
> How about organizing the comments as following:
> 
> + *
> + *         PREEMPT_MASK:	0x000000ff
> + *         SOFTIRQ_MASK:	0x0000ff00
> + * HARDIRQ_DISABLE_MASK:	0x00ff0000
> + *         HARDIRQ_MASK:	0x0f000000
> + *
> + * Depending on HAS_SEPARATE_PREEMPT_RESCHED_BITS, NEED_RESCHED bit
> + * is put in a separate 32bits.
> + *
> + * HAS_SEPARATE_PREEMPT_RESCHED_BITS=n:
> + *
> + *             NMI_MASK:	0x10000000
> + * PREEMPT_NEED_RESCHED:	0x80000000
> + *
> + * HAS_SEPARATE_PREEMPT_RESCHED_BITS=y:
> + *
> + * (NMI_MASK can use all the 4 bits)
> + *
> + *             NMI_MASK:	0xf0000000
> 
> Thoughts?

Perhaps add something like:

"Having PREEMPT_NEED_RESCHED in a separate word allows 64bit load-store
architectures to 'set' PREEMPT_NEED_RESCHED without messing up the
otherwise symmetric modifications used on preempt_count and still load
the whole thing (single-copy) atomically, without having to resort to
full atomic operations."


