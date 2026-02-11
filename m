Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18C031ED80
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770797802; cv=none; b=jQhG9gb9zIOXVoHWWVT6K0x8t3KyUA0mSbtVUR9HNVBee/alw3sEoXRpgd6WDMQO5OyQgd+RFO7lAvfLin14y9Mdfcvq0w/3JonzGd/lTgfeXbxHDVyyUI0+rHfvNyJ77qwvUqH+6dVTUT/icTRWVXNlieik7CesKjWH/BEIofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770797802; c=relaxed/simple;
	bh=M72G2mLh/ZPjBJntqxGSFJRmCzo8n+rp9WMe5eYHyJ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AC5u8Wkhvw2M7FkIf3mrWVUHH5nerIsO40LNT5KjN7Lpi185TucQCQf7WnAuHn8RsJe+i91vhsXMAUdnRbklYVg6IWGLJXCGi/hL4JVCd1+VIj3h08+N4nD67rIRS6Z85OWhsAwtj8gbxvmQ6XavCHidB+SacTXCDnz9MvidNpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uUmeK6My; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uUmeK6My"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65a7dd40026so108508a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770797799; x=1771402599; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9T4h+/rjLr1sBmgdVrcdKQN1OfKBnfrGuf/DCV1l4ug=;
        b=uUmeK6MyEoPJS/vI/D94KPpJ7Ta2/dULs7MziI5289bmf8HnPB2YsykJZZX0JXFtUm
         fkay+EAGNqLad7TOp+yQyLaHLZfIw3a7hgJMcMOb+n1lFdMFXfzf+bcoUE6X4hZilqA5
         y6rZ+zh79GsZ0onNaU+E1vHmV0Y5x/PyYpWT7ZC3EYK81GB4QKV+PRuE4TIJbR6zLp1d
         4P5hfZHav1Y3HeQyKkrr+vuzRFn7ihizCOiJhcSlTjuEytfmE+PZWGyFJjjvBEixHyuu
         PQ7AW/4PiwyNm4a2avo9UYiEEivNMng1S5j+POOIDLVIWz65jmDMz6OFmDucuacpigta
         gdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770797799; x=1771402599;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9T4h+/rjLr1sBmgdVrcdKQN1OfKBnfrGuf/DCV1l4ug=;
        b=Vs0CUPb2CAd2jot4XW8v6bQHZnhjLKm9gQjb0ei0AbuXUzWzUizAauFR4pId5RKCfJ
         LrwlVg40Y/GP1IEoksI9h4OHRdZp5QROj6tkVvLCS+IuG/EZmwWbZ8YuIpMZAzd1+jyy
         /6msUH4aUTsfme++mkBSP/SQowP09jhks4rw6d79teB5u8k2i7aPRZn5UMbNFp5EfMLV
         rpvfIO9w8hxlRv2pw/ZVTPAdVkFn+vuUbJl2iGNuKpBxnm9tdPu6vJl91O43Poe0irzO
         kTpn9waeBvAKCjP4wpiJxXWBjnftv1BEuCWjgN5RKa5wkn9DISsbEk3BpXt4EoSLp1rY
         i0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ob4H7Zb+iuckfRDuSriEDIiUXrmnWG1oFaGHcqaykL8QqWCjN6wnIeXkbG8M7ROkwRBgjuS8jC2c4WSNqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIA2GLbFWKU0xGqKvqcnABNcCkHVil3YxyG/dTZEsb7W6LVi1R
	X94lbzYQAGh/eVseI155Fy0J4paDlIbHtmu5FrPVGTYAPF8jpU0ksOwKsJFih0s7gnMhAqrbbRx
	fki0vqEFQTHlZObyFeg==
X-Received: from edhr9.prod.google.com ([2002:a50:8d89:0:b0:65a:3735:74dd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5110:b0:659:7d96:f715 with SMTP id 4fb4d7f45d1cf-65a4024118amr505843a12.26.1770797798924;
 Wed, 11 Feb 2026 00:16:38 -0800 (PST)
Date: Wed, 11 Feb 2026 08:16:38 +0000
In-Reply-To: <20260210155025.1b9ad2f1@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210134913.33cb674f@fedora>
 <aYsyGAwy4rq-H7Hd@google.com> <20260210145156.108ab292@fedora>
 <aYs8gN34IVPQiqLk@google.com> <20260210155025.1b9ad2f1@fedora>
Message-ID: <aYw65omhksM7jjQi@google.com>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 10, 2026 at 03:50:25PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 14:11:12 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Tue, Feb 10, 2026 at 02:51:56PM +0100, Boris Brezillon wrote:
> > > On Tue, 10 Feb 2026 13:26:48 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >   
> > > > On Tue, Feb 10, 2026 at 01:49:13PM +0100, Boris Brezillon wrote:  
> > > > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > > >     
> > > > > > /// The owner of this value must ensure that this fence is signalled.
> > > > > > struct MustBeSignalled<'fence> { ... }
> > > > > > /// Proof value indicating that the fence has either already been
> > > > > > /// signalled, or it will be. The lifetime ensures that you cannot mix
> > > > > > /// up the proof value.
> > > > > > struct WillBeSignalled<'fence> { ... }    
> > > > > 
> > > > > Sorry, I have more questions, unfortunately. Seems that
> > > > > {Must,Will}BeSignalled are targeting specific fences (at least that's
> > > > > what the doc and 'fence lifetime says), but in practice, the WorkItem
> > > > > backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
> > > > > met, and N > 1 if more than one job is ready). Similarly, an IRQ
> > > > > handler can signal 0-N fences (can be that the IRQ has nothing to do we
> > > > > job completion, or, it can be that multiple jobs have completed). How
> > > > > is this MustBeSignalled object going to be instantiated in practice if
> > > > > it's done before the DmaFenceWorkItem::run() function is called?    
> > > > 
> > > > The {Must,Will}BeSignalled closure pair needs to wrap the piece of code
> > > > that ensures a specific fence is signalled. If you have code that
> > > > manages a collection of fences and invokes code for specific fences
> > > > depending on outside conditions, then that's a different matter.
> > > > 
> > > > After all, transfer_to_wq() has two components:
> > > > 1. Logic to ensure any spawned workqueue job eventually gets to run.
> > > > 2. Once the individual job runs, logic specific to the one fence ensures
> > > >    that this one fence gets signalled.  
> > > 
> > > Okay, that's a change compared to how things are modeled in C (and in
> > > JobQueue) at the moment: the WorkItem is not embedded in a specific
> > > job, it's something that's attached to the JobQueue. The idea being
> > > that the WorkItem represents a task to be done on the queue itself
> > > (check if the first element in the queue is ready for execution), not on
> > > a particular job. Now, we could change that and have a per-job WorkItem,
> > > but ultimately, we'll have to make sure jobs are dequeued in order
> > > (deps on JobN can be met before deps on Job0, but we still want JobN to
> > > be submitted after Job0), and we'd pay the WorkItem overhead once per
> > > Job instead of once per JobQueue. Probably not the end of the world,
> > > but it's worth considering, still.  
> > 
> > It sounds like the fix here is to have transfer_to_job_queue() instead
> > of trying to do it at the workqueue level.
> 
> Hm, so Job would be something like that (naming/trait-def are just
> suggestions to get the discussion going):
> 
> trait JobConsumer {
> 	type FenceType;
> 	type JobData;
> 
> 	fn run(self: MustBeSignalled<T::FenceType>) -> Result<WillBeSignaled<Self::FenceType>>;
> }
> 
> struct Job<T: JobConsumer> {
> 	fence: MustBeSignalled<T::FenceType>,
> 	data: T::JobData,
> }

The fence field of Job would be PublishedFence or PrivateFence (or just
DriverDmaFence). The MustBeSignalled/WillBeSignaled types should only
exist temporarily in a function scope.

Any time you transfer from one function scope to another (like our
transfer_to_job_queue() or transfer_to_wq() examples), that results in
finishing the MustBeSignalled/WillBeSignaled scope on one thread and
creating a new MustBeSignalled/WillBeSignaled scope on another thread.

One could imagine a model where there is no lifetime and you can carry
it around as you wish. That model works okay in most regards, but it
gives up the ability to ensure that dma_fence_lockdep_map is properly
configured to catch mistakes.

The lifetime prohibits you from using the normal ownership semantics to
e.g. transfer the MustBeSignalled into a random workqueue, enforcing
that you can only transfer it into a workqueue by using the provided
methods, which sets up the lockdep dependencies correctly and ensures
that dma_fence_lockdep_map is taken in the workqueue job too.

> I guess that would do.
> 
> And then we need to flag the WorkItem that's exposed by the
> JobQueue as a DmaFenceWorkItem so that
> bindings::dma_fence_begin_signalling() is called before entry and
> lockdep can do its job and check that nothing forbidden happens in
> this WorkItem.

In the case of JobQueue, it may make sense to just have the job queue
implementation do that manually. I do not think the workqueue-level API
can fully enforce that the job queue can't make mistakes here.

> > > > And {Must,Will}BeSignalled exists to help model part (2.). But what you
> > > > described with the IRQ callback falls into (1.) instead, which is
> > > > outside the scope of {Must,Will}BeSignalled (or at least requires more
> > > > complex APIs).  
> > > 
> > > For IRQ callbacks, it's not just about making sure they run, but also
> > > making sure nothing in there can lead to deadlocks, which is basically
> > > #2, except it's not scoped to a particular fence. It's just a "fences
> > > can be signaled from there" marker. We could restrict it to "fences of
> > > this particular implementation can be signaled from there" but not
> > > "this particular fence instance will be signaled next, if any", because
> > > that we don't know until we've walked some HW state to figure out which
> > > job is complete and thus which fence we need to signal (the interrupt
> > > we get is most likely multiplexing completion on multiple GPU contexts,
> > > so before we can even get to our per-context in-flight-jobs FIFO, we
> > > need to demux this thing).  
> > 
> > All I can say is that this is a different use-case for the C api
> > dma_fence_begin_signalling(). This different usage also seems useful,
> > but it would be one that does not involve {Must,Will}BeSignalled
> > arguments at all.
> > 
> > After all, dma_fence_begin_signalling() only requires those arguments if
> > you want to convert a PrivateFence into a PublishedFence. (I guess a
> > better name is PublishableFence.) If you're not trying to prove that a
> > specific fence will be signalled, then you don't need the
> > {Must,Will}BeSignalled arguments.
> 
> Okay, so that would be another function returning some sort of guard
> then? What I find confusing is the fact
> dma_fence::dma_fence_begin_signalling() matches the C function name
> which is not per-fence, but just this lock-guard model flagging a
> section from which any fence can be signalled, so maybe we should
> name your dma_fence_begin_signalling() proposal differently, dunno.

Yes we would need multiple methods that call dma_fence_begin_signalling()
depending on why you are calling it.

Alice
