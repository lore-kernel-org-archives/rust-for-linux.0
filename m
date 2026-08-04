Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53163DC4D8
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847853; cv=none; b=o3h+ztkHogOdc8Yer0QTkBckDZrfcH8GmIPRypA0pjkOGcRzGNKWPNTeIpOB/6MRaT0BLTbgOTt2kNldjwFnPhv5eGyps8LTXy5KHHJp/4mnR/GEZK6IirYaMbi8+HjXGlYpQm8/4MFyCJ2rV7zBF0LWsgWmzP5qtJjnlNtcXxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847853; c=relaxed/simple;
	bh=YvsiGLEtJMwpaz3ldf6ChQgoUpLxPIZ9GGcIr0ebqz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0C0PnxjZygvfkUCLWWR5zkClmI5euJbN6ojzFIShWsG8ZBZfevSJy6OSfhuBZk3hKub0Huslj7hUzXOblfp7kkmq+0/SS8osoA3pY/WZQAFWtCgIOCgj9MOS3ZmirEEHxDoJoyHQSNbRRovvpWT3sahJNnuKSfErB1C+KbAXcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRojcnEc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRojcnEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1571F00A3A;
	Tue,  4 Aug 2026 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847849;
	bh=G2HWqCy8onUrTlodF3rdZsn04uwXI8+k7g1CFEH0ads=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SRojcnEcMZHihrIvFsL+1xSsMpIz3KgtSu90j4lmqPnA7bpb5wpNV10KKmUKHpy78
	 9sDxDqAlV+fO45Rmu0oMSdAXs5CGA3llLjHAH7jr3lVQ6NeC4WamkEF5ds7wrdNclG
	 ojOeSvfHJVK9mCBjxm+GOg5QFhtk3E37/C7gVve64s1Jrv2xhEa0CKQXlAtskggnvd
	 5PZMIbkirf1jzWCtXH6JiuXe+nGsbqZZVyx6naoobCD5lDZIxkmtK7K/1NFtBF4EDN
	 TEaKMB4x6+eQjU2n4VIA1whOHC3nGdsJ0uuKOwn5SoM6tHZwdwcIGQnGK/JwDYlIlR
	 zaf+6moKLDvjg==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id D3E28F40066;
	Tue,  4 Aug 2026 08:50:47 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 04 Aug 2026 08:50:47 -0400
X-ME-Sender: <xms:J-BxajFNqytj2vM0QOsjkYzlKOOz45WOiXILwm1ZfdpE7x8tAwaHOg>
    <xme:J-Bxaqv4qq09OwnxAzPYqOQyCqcXbYkbJNKh8gLd5y1cnJL5nyJbgNMB3lhQHmLkn
    MXPBV1wvISD7lWW-duk1g_ShVEJrwoLbNGW7l2S60maUJQ0jeoVJm4>
X-ME-Received: <xmr:J-BxarQioMGXacDP3EOm1CiFJoSMGZIJrfP4r2W_PAEso22tb6MSq3eppJdN49eY1L72P6WZC2TPuA5Ng3j8XIDjei51SkXQ>
X-ME-Proxy-Cause: dmFkZTGU1X6076rIJKNdW1FFhP11/tBeXs92RjMj2saBaElls5tRB7o2clEtuMKjoQjhdq
    BJi64uuaVtNUKiKkUrvn9wVjmQeY5zUwWzbfFzqUjYjhpX9PaR0NkLpTK4f7h9WxCydjcT
    l4NS//8mbaMaMn2+/aaLgyLEjY7AuFP+XFOWZVcPgWuxdfkS7MX4SbE8Zv0jQHoAs5ka9T
    1z4XcLGQ7FjlND67UEpXW/O9YelB6jXYMAFMKPCoUUH0I53Jcl6qQp+I1Y7a2P5Tyufl0y
    f4kWNcLFwwkdkk50oRe/Om+JGu3UvLra5MHfR7Z9oseALAskolq+TAFvwweJP0ni8DrDNG
    UZc9l4twr9sqPi+amsfbUiE7eQ10qOdkH4e8MwJoaN6UeZRjhm/+Mod/1zV2e+22RoiKYh
    7yDc0NyYyBq8w4W0j+LPGZGM2u6OlRYK+RsHYwROFKnK0ruvy8HauUWOx9XMeMWr4LU/wG
    rJ++dHw5tQ6zxWUA+5VcbvubX804gWksIzGx7GJYBuqBLLRB1ruSWgkoWelA1DVmua3wiz
    aZVNX48QGUDOABBAC/3TMSqicSKZSnxSi4prFWt9euJeBgDX/PoULi9PmsFv4cuhyWara7
    fYFSHFcf0jrGRNNvpSIqUUzTo5fnOvfT9/ORzZl6BNtD+NBWGQ+ZC6jCBe9g
X-ME-Proxy: <xmx:J-BxasOis4HAcvxqZq5Z31c-nAYvJnrJCQxA-zUkBzwyPEYqIW527w>
    <xmx:J-Bxah6EplfsQZi3m2yIRsVbPcO6H3HaeMJ25hzJexqYRDZuMB2f5A>
    <xmx:J-BxavWn6-89xG3CrkQmqb83Z6ZvoG9pn_0N06FGkYdNG1mHITFofw>
    <xmx:J-BxaoMR_IwAkiAN1iAOParq_W4S594r5muLvFMr4dxWyQxAuhTVhg>
    <xmx:J-Bxamj2ZJQ8jsleOBN6VVXZwnVmlwvB-ZmQwS-JFaxiRspko0C1w8rY>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 08:50:47 -0400 (EDT)
Date: Tue, 4 Aug 2026 05:50:46 -0700
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
Subject: Re: [PATCH 05/24] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <anHgJuGoRmTItBT2@tardis.local>
References: <20260731203031.13679-1-boqun@kernel.org>
 <20260731203031.13679-6-boqun@kernel.org>
 <20260803092910.GD49951@noisy.programming.kicks-ass.net>
 <20260803104321.GL49529@noisy.programming.kicks-ass.net>
 <anFtXgGUiTmqimkz@tardis.local>
 <20260804072640.GL687043@noisy.programming.kicks-ass.net>
 <20260804073316.GE788244@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804073316.GE788244@noisy.programming.kicks-ass.net>

On Tue, Aug 04, 2026 at 09:33:16AM +0200, Peter Zijlstra wrote:
> On Tue, Aug 04, 2026 at 09:26:40AM +0200, Peter Zijlstra wrote:
> 
> > > > @@ -88,8 +89,17 @@ EXPORT_PER_CPU_SYMBOL_GPL(hardirqs_enabl
> > > >  EXPORT_PER_CPU_SYMBOL_GPL(hardirq_context);
> > > >  #endif
> > > >  
> > > > -DEFINE_PER_CPU(struct interrupt_disable_state, local_interrupt_disable_state);
> > > > -EXPORT_PER_CPU_SYMBOL_GPL(local_interrupt_disable_state);
> > > > +DEFINE_PER_CPU(unsigned long, local_interrupt_disable_state);
> > > > +
> > > > +void _local_interrupt_disable(void)
> > > > +{
> > > > +	__local_interrupt_disable();
> > > > +}
> > > > +
> > > > +void _local_interrupt_enable(void)
> > > > +{
> > > > +	__local_interrupt_enable();
> > > > +}
> > > >  
> > > 
> > > We need to EXPORT_SYMBOL_GPL() for these two functions.
> > > 
> > > Right?
> > 
> > Quite so.
> 
> Although, I suspect people will come and complain that this should be
> !GPL, it being something 'trivial' and all that nonsense, but we'll get
> there when we get there I suppose.

I haven't thought about the GPL part, but after a look, I think we
could do EXPORT_SYMBOL() (similar __local_bh_disable_ip) from the
get-go.

Regards,
Boqun
