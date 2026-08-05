Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED033DEFF6
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914370; cv=none; b=dGlsArWR9pG70zG6NB4TeDI7bLfB0O5ekHHL0hRm75mllP+b+xkUFcXG9QbE+uAy54QABcWqxSTLadPGZsyfOh3ZzPh+g/uhdTe/ncw2dYEBjOqb0M+fP69Xsi/ral9ELYGiCmhMohOAxuKXfW9mz4roC453YLZB6RKyl0k2keA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914370; c=relaxed/simple;
	bh=MjPumZhtckEQORkSCzv16s4EOzplMOwPkk98i839jsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1rLWqx7XGikT+ScEOhwUH85NAUfUWSkS+rNfHgZnycyA7iRg1AN11jBlKFPn9LsUbwV/DRysfKroiT5s4v3BZYBimNN/euP6SDG46ioKwD5265QToA8dwFCJOHFbA+XHDnGbWouLGpZ57lv7f7UyW0+ZtyVVpx8A5K0Ve6OTbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCrSydD1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCrSydD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3393D1F00A3E;
	Wed,  5 Aug 2026 07:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785914368;
	bh=h77XuUkoSd4VEZ3PF63TnU+R9IUegp/zYod/2HxGtxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bCrSydD1fb76f7Igcj9j+vHQeSEoHxWAMauuV1D3OsF9YE/hHSjR303nhDAWH67cm
	 p4VHwfO8oPB8lmaTPttZfm4Kr1RrKQnhsyJQyhyeG+Zl9hF8qlOp090fPeXbgNPFUr
	 dCSY8oxI8faQ9B6i87HJo8tAJ628y24s095Bpskp9V21gL+O1T2NeH2mi6GqacRncp
	 xfpimUOS9PMKgBhB7d0B7jDwGJ5+wOao9LxF4cU0mf4szgx6kKnG8b4cCffNryLQKf
	 ZUvZZZ7/f3W6krJdp9cZwy0crBiB+lohrf87n1PDUQpTN1Gi7hZFncFt5ph+6KBZJv
	 Nv6f8bCviB9vQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4343EF40066;
	Wed,  5 Aug 2026 03:19:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 05 Aug 2026 03:19:27 -0400
X-ME-Sender: <xms:_-NyauFPOPQysGKPYxBCjZE4cpGsMq22dvIVXiUdt-JnoU2a8rRing>
    <xme:_-NyauxMkXAfgLTR2p-2HQvcUMhePlMzctvSVAkKZpGhgV2IZDGo9os-uYFEEDUYh
    Jgii8riQXWCuWEUl_PJDpn3BcS7MrvZ-hdFXQ7jNqV0SHlnNdPvWVM>
X-ME-Received: <xmr:_-NyapPNtJ5XbLtT8NnwmAYgGbchZdP5l_PPhm7LHbET1S9GpbcJVFR3VKK7VA3-QliedTTqtEhcba27e6jrBf3MCSWuTy5B>
X-ME-Proxy-Cause: dmFkZTFIlqiQOGbU5rsQMfoHCRonjR7TKC9xoizTjN7+iZbSGTWFPtqLYG5CW145/kUBo2
    GpWMZ4I2oc4iXDDkUKbu8x1BV+of4mEOPAUzGCvsgKF3svPtvUbNl3Me8hKhIyF7zhc2iw
    FKDMXJHjxIuJd1bUarXzdeFY8Jo5W1An3uWmAk1DUlfQZLmg9seb5tZu8J36hWX84PY+pc
    2ZFYNxfLGGE5OrpJ331RRVMv1La8RlvL6oFBz1isiJPD2ki+gly0BT7qSe6mjVxtURo2iI
    IPYR7Kcdsy2NK38bNkADilYBzD28ymJRg/mVeC9kUU6iHEj4HIb0VEXi5lIx5qH/26OTLw
    sRRdOn/4TzHGC69keu6T/rrSzt1rcH0Pux2hmGZlRdSjMxm0gG4R937me7fy06CWScgt+s
    UD1nyjl7XnBTV65e/lufGKqpIr40r2naL1PAgStQnJ22TJYkmVyPmBCsCmprpnmNVESy8c
    ohtjm1oNJH/KMfY5rrpqts92yqbowbaW6nUdp2FvUANwSf80DePcwCuDLQbMTL13XYEdKg
    qpynUc2dmne1xiNgU1TP0XoDku/bQE5Ov3z0idT6nXmCMjP/i53kqTpohGR8NQZjNgm3nb
    7xOnHF2W2bQzDGDlV1zken+x2CMr/6mSM8TuZ+o8+ks9FIX3txMBPQ1ZseqA
X-ME-Proxy: <xmx:_-NyasYM3DT9EP_LpyPoa4GxceUD9Pbso1lY-X_p5zxEOgub9BVyTw>
    <xmx:_-NyaoDElhCL-houuqSYWZM-4NRhhsu_zV_6MVuIcZYsFGxADOAy5g>
    <xmx:_-NyaiF6TgGe9i5xFWTFLOAOuluzrEOgEt6HV5o_hwI8jmWcuVC6yw>
    <xmx:_-NyarOwOl_T-9dc2ZBfQcRHRuSh0QwzjNNG0itrHR7Gnqv257ZRsw>
    <xmx:_-NyarhtdRmLmjH3AMlDmDyM_TiLwcaOIlt0Zf6QHnLOBHAmAo_GOdgm>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 03:19:26 -0400 (EDT)
Date: Wed, 5 Aug 2026 00:19:25 -0700
From: Boqun Feng <boqun@kernel.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 05/17] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anLj_Ryl635sxvI8@tardis.local>
References: <20260804161447.84806-1-boqun@kernel.org>
 <20260804161447.84806-6-boqun@kernel.org>
 <2fc01d90-e081-4ddf-a842-b68eda15ca9e@linux.ibm.com>
 <anJUuzBcWRwyw6NJ@tardis.local>
 <20260805063645.GO776954@noisy.programming.kicks-ass.net>
 <anLhM8xTlB6bN2N7@tardis.local>
 <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a6dd561-f529-433d-bc09-094924d861fe@linux.ibm.com>

On Wed, Aug 05, 2026 at 12:39:36PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 8/5/26 12:37 PM, Boqun Feng wrote:
> > On Wed, Aug 05, 2026 at 08:36:45AM +0200, Peter Zijlstra wrote:
> > > On Tue, Aug 04, 2026 at 02:08:11PM -0700, Boqun Feng wrote:
> > > 
> > > > > > +	/* Interrupts can happen here, but it's OK, see __irq_exit_rcu(). */
> > > > > > +
> > > > > > +	if ((new_count & HARDIRQ_DISABLE_MASK) == HARDIRQ_DISABLE_OFFSET)
> > > > > > +		_local_interrupt_disable();
> > > > > > +}
> > > > > 
> > > > > Maximum nesting possible is 256 right? Whats is stopping here to do more than that?
> > > > 
> > > > Yes. Currently similar as softirq, we don't detect the overflow.
> > > > 
> > > > > Should there be a warn_on?
> > > > 
> > > > A simple warn_on could be problematic because warn_on() itself may take
> > > > an irq-disabling lock, and that may trigger another overflow on top of
> > > > the existing overflow. It's a bit tricky to do a proper detection. But
> > > > I'm open to ideas.
> > > 
> > > DEBUG_PREEMPT's preempt_count_add() does:
> > > 
> > >          DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >= PREEMPT_MASK - 10);
> > > 
> > 
> > Yeah, but this is behind a kconfig (DEBUG_PREEMPT), so not sure whether
> > it's what Shrikanth asked here.
> > 
> 
> I was suggesting to have a mechanism which allows to debug it/
> find the callers.
> 

Ok, I can reuse the DEBUG_PREEMPT kconfig and the DEBUG_LOCKS_WARN_ON()
here, but it'll be similar to the detection here, not a 256 maximum
nesting but a 256 - 10 value (and I'm not going to explain why we think
10 is a good buffer, unless you think we should have a discussion about
it ;-) )


(But still who is going to add the detection for BH count over? ;-) )

Regards,
Boqun

> > Regards,
> > Boqun
> > 
> > > 
> 
