Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49947338581;
	Wed, 11 Feb 2026 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770801657; cv=none; b=QmyEI6NcOWR3Hrl1POuA424489cIsX73YQ6ZU2SR0pAz/JO9BsE6sRuBRTkYjTCjt/FcbZ864ABOaKcoPG5/COVTy1ZV47fY2dCVA37fT4QqHs9NvCwFtVbsSoMM2tuReevI37eP7TOlLwuNHNp67wt9goIXAc+SLd9ciAIB4C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770801657; c=relaxed/simple;
	bh=Yk26e93Doh3HdbWTahzAdjGYPXnSk9mDmGEaOLuJTe0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BuvaODgCRarGbLRv5jpXpC2Rqm7UG4ubQXL/jM+5R4LslyWeKhPjPka4sC+WjPOXJzjIwpaslyezJ+Ig8OT8kjzzxTFqpMx7V0N5VJqoMZwZeHLeY9YVB2Ed9NWWTORaBU0yAktz4BfPn2kjdGWXl/Z+yDV16LbKHKbOuxSA7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=laVEUzuA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="laVEUzuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770801654;
	bh=Yk26e93Doh3HdbWTahzAdjGYPXnSk9mDmGEaOLuJTe0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=laVEUzuALoQSK7tMuKlSLx8vGhKQcg6YOe8kFZlJZm18gaCLuMnWpi++iJzoJQ98B
	 xqXFIJbMecDQpwn42V/pB8CvS9mDnTtVGqlAz6KWMirIE+cFdJIEVtfnHmRX44zTZa
	 /HNTzqFQrf8ssJeScKtckyMfk/cfk0Cw9dVHdq/i7b50B48vikG+3UN1YV6O0wdYS9
	 IatBzsGfPzJWg9WQCBsLOTWt8NzLWvM/Z4i1CfH47/4PY5ZDQYOO2AXIf7y/YiMDKA
	 27Coy4Ik+I5fMH9l818aq3Arb12/PKzsgXBMczEjNm58kXuvi1GubpQNWNPx8LRMRl
	 TsFnJ9N3tqzog==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 090DF17E0E90;
	Wed, 11 Feb 2026 10:20:53 +0100 (CET)
Date: Wed, 11 Feb 2026 10:20:49 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: "Christian =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp
 Stanner <phasta@mailbox.org>, phasta@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>, Benno Lossin
 <lossin@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260211102049.4f39b6ae@fedora>
In-Reply-To: <aYw65omhksM7jjQi@google.com>
References: <20260209155843.725dcfe1@fedora>
	<c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	<aYruaIxn8sMXVI0r@google.com>
	<20260210101525.7fb85f25@fedora>
	<aYsFKOVrsMQeAHoi@google.com>
	<20260210134913.33cb674f@fedora>
	<aYsyGAwy4rq-H7Hd@google.com>
	<20260210145156.108ab292@fedora>
	<aYs8gN34IVPQiqLk@google.com>
	<20260210155025.1b9ad2f1@fedora>
	<aYw65omhksM7jjQi@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Feb 2026 08:16:38 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Feb 10, 2026 at 03:50:25PM +0100, Boris Brezillon wrote:
> > On Tue, 10 Feb 2026 14:11:12 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >   
> > > On Tue, Feb 10, 2026 at 02:51:56PM +0100, Boris Brezillon wrote:  
> > > > On Tue, 10 Feb 2026 13:26:48 +0000
> > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > >     
> > > > > On Tue, Feb 10, 2026 at 01:49:13PM +0100, Boris Brezillon wrote:    
> > > > > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > > >       
> > > > > > > /// The owner of this value must ensure that this fence is signalled.
> > > > > > > struct MustBeSignalled<'fence> { ... }
> > > > > > > /// Proof value indicating that the fence has either already been
> > > > > > > /// signalled, or it will be. The lifetime ensures that you cannot mix
> > > > > > > /// up the proof value.
> > > > > > > struct WillBeSignalled<'fence> { ... }      
> > > > > > 
> > > > > > Sorry, I have more questions, unfortunately. Seems that
> > > > > > {Must,Will}BeSignalled are targeting specific fences (at least that's
> > > > > > what the doc and 'fence lifetime says), but in practice, the WorkItem
> > > > > > backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
> > > > > > met, and N > 1 if more than one job is ready). Similarly, an IRQ
> > > > > > handler can signal 0-N fences (can be that the IRQ has nothing to do we
> > > > > > job completion, or, it can be that multiple jobs have completed). How
> > > > > > is this MustBeSignalled object going to be instantiated in practice if
> > > > > > it's done before the DmaFenceWorkItem::run() function is called?      
> > > > > 
> > > > > The {Must,Will}BeSignalled closure pair needs to wrap the piece of code
> > > > > that ensures a specific fence is signalled. If you have code that
> > > > > manages a collection of fences and invokes code for specific fences
> > > > > depending on outside conditions, then that's a different matter.
> > > > > 
> > > > > After all, transfer_to_wq() has two components:
> > > > > 1. Logic to ensure any spawned workqueue job eventually gets to run.
> > > > > 2. Once the individual job runs, logic specific to the one fence ensures
> > > > >    that this one fence gets signalled.    
> > > > 
> > > > Okay, that's a change compared to how things are modeled in C (and in
> > > > JobQueue) at the moment: the WorkItem is not embedded in a specific
> > > > job, it's something that's attached to the JobQueue. The idea being
> > > > that the WorkItem represents a task to be done on the queue itself
> > > > (check if the first element in the queue is ready for execution), not on
> > > > a particular job. Now, we could change that and have a per-job WorkItem,
> > > > but ultimately, we'll have to make sure jobs are dequeued in order
> > > > (deps on JobN can be met before deps on Job0, but we still want JobN to
> > > > be submitted after Job0), and we'd pay the WorkItem overhead once per
> > > > Job instead of once per JobQueue. Probably not the end of the world,
> > > > but it's worth considering, still.    
> > > 
> > > It sounds like the fix here is to have transfer_to_job_queue() instead
> > > of trying to do it at the workqueue level.  
> > 
> > Hm, so Job would be something like that (naming/trait-def are just
> > suggestions to get the discussion going):
> > 
> > trait JobConsumer {
> > 	type FenceType;
> > 	type JobData;
> > 
> > 	fn run(self: MustBeSignalled<T::FenceType>) -> Result<WillBeSignaled<Self::FenceType>>;
> > }
> > 
> > struct Job<T: JobConsumer> {
> > 	fence: MustBeSignalled<T::FenceType>,
> > 	data: T::JobData,
> > }  
> 
> The fence field of Job would be PublishedFence or PrivateFence (or just
> DriverDmaFence). The MustBeSignalled/WillBeSignaled types should only
> exist temporarily in a function scope.
> 
> Any time you transfer from one function scope to another (like our
> transfer_to_job_queue() or transfer_to_wq() examples), that results in
> finishing the MustBeSignalled/WillBeSignaled scope on one thread and
> creating a new MustBeSignalled/WillBeSignaled scope on another thread.

Makes sense.

> 
> One could imagine a model where there is no lifetime and you can carry
> it around as you wish. That model works okay in most regards, but it
> gives up the ability to ensure that dma_fence_lockdep_map is properly
> configured to catch mistakes.
> 
> The lifetime prohibits you from using the normal ownership semantics to
> e.g. transfer the MustBeSignalled into a random workqueue, enforcing
> that you can only transfer it into a workqueue by using the provided
> methods, which sets up the lockdep dependencies correctly and ensures
> that dma_fence_lockdep_map is taken in the workqueue job too.
> 
> > I guess that would do.
> > 
> > And then we need to flag the WorkItem that's exposed by the
> > JobQueue as a DmaFenceWorkItem so that
> > bindings::dma_fence_begin_signalling() is called before entry and
> > lockdep can do its job and check that nothing forbidden happens in
> > this WorkItem.  
> 
> In the case of JobQueue, it may make sense to just have the job queue
> implementation do that manually. I do not think the workqueue-level API
> can fully enforce that the job queue can't make mistakes here.

Sure, it can't ensure the fence will be signaled in finite time
(like, you can't prevent an infinite loop, or jobs being dropped on
the floor without having their fences signaled), but it could at
least check that no prohibited ops (blocking allocs, prohibited
locks taken, etc) are done in the common JobQueue implementation if we
introduce some sort of MaySignalDmaFencesWorkItem
abstract (call it what you want, I just made the name super explicit
for clarity) that does the annotation around the ::run(), and then have
JobQueue use this instead of a regular WorkItem.

Note that we'll need this MaySignalDmaFencesWorkItem (which is basically
the thing I've been describing in my previous replies) in Tyr if we
want to mimic Panthor, because the IRQHandler doesn't directly signal
the job fences. We have an extra work item that's scheduled when we
receive FW events related to scheduling, and we do the fence
signalling from a workqueue context after having demuxed all the events
and extracted which GPU context made progress.

Of course, devs can very much call some
{Driver,Published}DmaFence::may_signal_fences() (which would return this
Guard we were discussing) manually in their WorkItem::run()
implementation. But then it becomes an explicit operation, with the
risk of forgetting (intentionally or not) to flag those sections as
being part of the signalling path. If we make it an explicit object,
with a dedicated DmaFenceWorkqueue abstract preventing anything but
MaySignalDmaFencesWorkItem from being scheduled on it, all of a sudden,
this explicit model becomes implicit, and it strengthen the
requirements, which is a good thing, I think.

> 
> > > > > And {Must,Will}BeSignalled exists to help model part (2.). But what you
> > > > > described with the IRQ callback falls into (1.) instead, which is
> > > > > outside the scope of {Must,Will}BeSignalled (or at least requires more
> > > > > complex APIs).    
> > > > 
> > > > For IRQ callbacks, it's not just about making sure they run, but also
> > > > making sure nothing in there can lead to deadlocks, which is basically
> > > > #2, except it's not scoped to a particular fence. It's just a "fences
> > > > can be signaled from there" marker. We could restrict it to "fences of
> > > > this particular implementation can be signaled from there" but not
> > > > "this particular fence instance will be signaled next, if any", because
> > > > that we don't know until we've walked some HW state to figure out which
> > > > job is complete and thus which fence we need to signal (the interrupt
> > > > we get is most likely multiplexing completion on multiple GPU contexts,
> > > > so before we can even get to our per-context in-flight-jobs FIFO, we
> > > > need to demux this thing).    
> > > 
> > > All I can say is that this is a different use-case for the C api
> > > dma_fence_begin_signalling(). This different usage also seems useful,
> > > but it would be one that does not involve {Must,Will}BeSignalled
> > > arguments at all.
> > > 
> > > After all, dma_fence_begin_signalling() only requires those arguments if
> > > you want to convert a PrivateFence into a PublishedFence. (I guess a
> > > better name is PublishableFence.) If you're not trying to prove that a
> > > specific fence will be signalled, then you don't need the
> > > {Must,Will}BeSignalled arguments.  
> > 
> > Okay, so that would be another function returning some sort of guard
> > then? What I find confusing is the fact
> > dma_fence::dma_fence_begin_signalling() matches the C function name
> > which is not per-fence, but just this lock-guard model flagging a
> > section from which any fence can be signalled, so maybe we should
> > name your dma_fence_begin_signalling() proposal differently, dunno.  
> 
> Yes we would need multiple methods that call dma_fence_begin_signalling()
> depending on why you are calling it.

Ack.
