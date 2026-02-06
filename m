Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83F61FE45D
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 02:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770346308; cv=none; b=gCglibfEJmNcoXaq00LhFXnyeTmEvGCWR2I16pNQEVWLN4nSyIn9H7LODM8Gzzisocpsl4lp7GvBm9QJqq0GKvFJJK9UoEefRL/TRxC56nmX7rD4U/peU4zsY6coouzXesK27jgSj2MgU8KvLuYIl20/M5V1UqJ0/yxqNWyW/+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770346308; c=relaxed/simple;
	bh=bTUWb06AwQSfpsx5UM/Ov+cjZ2E7HpfcVrse6GI7+r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFGMYdF0r7bkDI6pnJ22ZUUhE7qVMDXkQOzoDGPKnuk8m2nAEf6D0Ztjrz+LFGAIJwC4yHInpWZ9rCNzxLJGtMPvlYIjqnRLpR4Zw7LG7rAN5QaaVqN/wwK0edUwnt+q2U1ImCT0ozuOwo9CHMEQLfgVYnSgb6Dl80ymGTrWPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnzBsMOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnzBsMOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE86C116D0;
	Fri,  6 Feb 2026 02:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770346308;
	bh=bTUWb06AwQSfpsx5UM/Ov+cjZ2E7HpfcVrse6GI7+r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pnzBsMOz0cCeqdLcXYQCSArxt0UoiyrWZWhTDZymPuDgoCZuulPsSz4t8IqhCnahj
	 A7O/ijs/gXNaxsWPuTFc8yqJ+5b8kbNc4fA9Muvl0ILGxJ+aJzvAwhybnlVbT3NUWo
	 XVMh+1lMcUnGJXCXh0ySydqpEb8sAdE8+JvCmETfT2Nk9XoeppsJHyy9NZpKG1mk1m
	 +6QJvkPZvyiCbY+PEa91LS7yGvchCTTx3atheDe2JNT6Vcz3ieRfkXHRWKtFdOOvDz
	 GGPUaVCRTUr+cafE6RpCVU+tZFRSAKA7JPR3jaXKDCR/YxKd+7ZtlRo1HFRitHFg4F
	 IGJPEXvOJdCaw==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id B51A2F40068;
	Thu,  5 Feb 2026 21:51:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 05 Feb 2026 21:51:46 -0500
X-ME-Sender: <xms:QleFadaO1FJttacW8b609bhbDHHiRulX_ZuAYpP0_-UoVmztZ8gd8g>
    <xme:QleFaVvG7htASLd3xHtAZ8AhVV8l8oGp54ZH4hGGy609aNfUT-4A9LAXuRdHGObQ5
    LKjD90wq6jeEsU-2sFaaScWNuyzrxbquHJ2J661_gGaQVxXWowSZg>
X-ME-Received: <xmr:QleFaUk788voie9B83vYJA59u_b6WO9cE6Hj3AeMD_eni649SVxbDtXZPb2N_UOkgUoQ2XMbcHAVCw34YsghmJCCTXTQHlDu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhho
    vghlrghgnhgvlhhfsehnvhhiughirgdrtghomhdprhgtphhtthhopehpvghtvghriiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtgho
    mhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtph
    htthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopegurghn
    ihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehojh
    gvuggrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:QleFaeV72_2W74OfMEqvVHC5M_AU5rBPEXQ6C-2-MnfIIZTTZw9QjA>
    <xmx:QleFafkbBVtaWeWS9cLUzptT3ZcOhGZ3yyRKYUjNMaEi6Tmno-NAhg>
    <xmx:QleFaTRmRyuyRPjHambeY2d7D8ZXCZgNzcEX5-owcz6bPc7N9Gn-qg>
    <xmx:QleFabF_57d0a2uzSDkHqPIRDkEfA8waOhXZ1EXt6svcBzq6pjQoLg>
    <xmx:QleFaVi7rpUOefzf2G3dHLXTGeBLpKRyrT9-Dd6rYYg1imG8Ia3S8lo->
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 21:51:46 -0500 (EST)
Date: Thu, 5 Feb 2026 18:51:45 -0800
From: Boqun Feng <boqun@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <aYVXQVwOZapVbnP5@tardis.local>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <20260121223933.1568682-3-lyude@redhat.com>
 <20260203121520.GN1282955@noisy.programming.kicks-ass.net>
 <20260204111234.GA3031506@noisy.programming.kicks-ass.net>
 <aYUOME2XV_ZmRk3F@tardis.local>
 <1a332333-0706-4548-8fbe-d65956f70f99@nvidia.com>
 <44507281-87bc-4548-b542-addf3477921c@nvidia.com>
 <aYVAYq1oM78glL7w@tardis.local>
 <52c1f833-0967-4692-8275-6d448a104350@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52c1f833-0967-4692-8275-6d448a104350@nvidia.com>

On Thu, Feb 05, 2026 at 08:24:40PM -0500, Joel Fernandes wrote:
> 
> 
> On 2/5/2026 8:14 PM, Boqun Feng wrote:
> > On Thu, Feb 05, 2026 at 07:50:03PM -0500, Joel Fernandes wrote:
> >>
> >>
> >> On 2/5/2026 5:17 PM, Joel Fernandes wrote:
> >>>
> >>>
> >>> On 2/5/2026 4:40 PM, Boqun Feng wrote:
> >>>> On Wed, Feb 04, 2026 at 12:12:34PM +0100, Peter Zijlstra wrote:
> >>>>> On Tue, Feb 03, 2026 at 01:15:21PM +0100, Peter Zijlstra wrote:
> >>>>>> But I'm really somewhat sad that 64bit can't do better than this.
> >>>>>
> >>>>> Here, the below builds and boots (albeit with warnings because printf
> >>>>> format crap sucks).
> >>>>>
> >>>>
> >>>> Thanks! I will drop patch #1 and #2 and use this one (with a commit log
> >>>> and some more tests), given it's based on the work of Joel, Lyude and
> >>>> me, would the following tags make sense to all of you?
> >>>>> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> >>>
> >>> I don't know, I am not a big fan of the alternative patch because it adds a
> >>> per-cpu counter anyway if !CONFIG_PREEMPT_LONG [1]. And it is also a much bigger
> >>> patch than the one I wrote. Purely from an objective perspective, I would still
> >>> want to keep my original patch because it is simple. What is really the
> >>> objection to it?
> >>>
> > 
> > PREEMPT_LONG is an architecture-specific way to improve the performance
> > IMO. Just to be clear, do you object it at all, or do you object
> > combining it with your original patch? If it's the latter, I could make
> > another patch as a follow to enable PREEMPT_LONG.
> 
> When I looked at the alternative patch, I did consider that it was
> overcomplicated and it should be justified. Otherwise, I don't object to it. It

I don't think that's overcomplicated. Note that people have different
goals, for us (you, Lyude and me), we want to have a safer
interrupt-disabling lock API, hence this patchset. I think Peter on the
other hand while agreeing with us on the necessity, but wants to avoid
potential performance lost (maybe in general also likes the idea of
preempt_count being 64bit on 64bit machines ;-)) That patch looks
"overcomplicated" because it contains both goals (it actually contains
patch #1 and #2 along with the improvement). If you look them
separately, it would be not that complicated (Peter's diff against patch
1 + 2 will be relatively small).

> seems to be a matter of preference I think. I would prefer a simpler fix than an
> overcomplicated fix for a hypothetical issue (unless we have data showing
> issue). If it was a few lines of change, that'd be different story.
> 
> > 
> >>> [1]
> >>> +#ifndef CONFIG_PREEMPT_LONG
> >>> +/*
> >>> + * Any 32bit architecture that still cares about performance should
> >>> + * probably ensure this is near preempt_count.
> >>> + */
> >>> +DEFINE_PER_CPU(unsigned int, nmi_nesting);
> >>> +#endif
> >>>
> >> If the objection to my patch is modifying a per-cpu counter, isn't NMI a slow
> >> path? If we agree, then keeping things simple is better IMO unless we have data
> > 
> > I guess Peter was trying to say it's not a slow path if you consider
> > perf event interrupts on x86? [1]
> 
> How are we handling this performance issue then on 32-bit x86 architecture with
> perf? Or are we saying we don't care about performance on 32-bit?
> 

I'm not in the position to answer this (mostly for the second question).
Either we have data proving that the performance gap caused by your
original patch is small enough (if there is any) or it's up to x86
maintainers.

Regards,
Boqun

> -- 
> Joel Fernandes
> 
