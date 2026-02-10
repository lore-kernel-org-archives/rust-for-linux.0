Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B12BAF4
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 14:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770732676; cv=none; b=d1rxCkTSCxyu7PiuDH3W9Yti6zOhyBvRAAW7M83drVqQx39/d+bYIgo51TOTz/Xl7e9/G8Y0oVZzZJlGWZhnj4FzpZiqvHyPL57nBbV9oFf0A8BfGgzfZNHiwRyLL7jx1uV6JGXeAFJQB2ioZjyUbuWQ+uuFq3sJXjhj2NYdp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770732676; c=relaxed/simple;
	bh=qYC95AIHzGKa9UHbhK4gdEItdEhA/WrbJAvnt1ujDXM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=THGnci3+1MhuMA0NtLZRbsd8FdEw6rrbC2c/Uue5lZIvfMExx1YfCsPXzgxZeXYoJN8iFBJJyYvvLhDFjFIf14AYN7qgN0fXAuiNliVMvuwJeZ4YP0NH3LMeox4K7iJihb7T42rxjmUNz+ZTlbzeRuPOp/XvlUQ661tmHRIpZRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2ksu+LtG; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2ksu+LtG"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8f5bce308dso44256066b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 06:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770732674; x=1771337474; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wpyZuzgNw/WGJaYO0aTw62Jp3X9Gu5cXyXe5IaYxcjU=;
        b=2ksu+LtGL24jabf4jISRI4ekREKT5Bsya3JAlDdJ5lUb+Okymk4s6PpQSHPrGlw6H/
         voL7V81qsgtLTdPT9f/82nGqozmcx4kfCSPX2zaUgAQ6kVMZBKzHpOtcgAMX+CQkoxJ/
         nSrA/HwEfKJVSAw8SwFkdyKS98RsP8k+Cxu7UmvxF/OiLpeqg035paqXn28A1y88KazG
         E2lAY4/omCfDmBj6jnJ1ISuQdQNMqwxglLhtOXxk0K50LYD3yfKSXlS21zKOueVSjCqe
         B8aPaAul4OD0qFxHtr1ymJf1goZ9QY+lGBhyp7CuBAIsLJ7xzlWClLpHckF056wiRwZP
         YH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770732674; x=1771337474;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpyZuzgNw/WGJaYO0aTw62Jp3X9Gu5cXyXe5IaYxcjU=;
        b=K2kQzNLdgo5q1ePumL0Rh0LYY3Fn4V7iaMYImIcyIC/mkQ4axEbXf5mrqUhXgF/ayI
         zCxdpKULL0OEvdPQZnPdvzqHeI2ezH5BiXiml+asV06mxLgUxFKk5cKb3VCzh88YaRru
         2AvjgV0tzbVAFt9VSL5mAe0PlUzx488RPT1LQGTVKnvMiC0z7jGnRp0iDqPc297RJkJF
         UUcWKW4bKMF039hWKlsE6874fAAOi3s6neAVaGkzSFyh+NOJtvWTTXEj92pnjH0KvSQA
         zWQndHhztjvcCl9mM5z7unr7nlfVz3apm27LGRJ3F13+LkUlx5GaL5Jct2rV1qXA0nfi
         g5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXL9YgasvqpAYMMGamgO9HJvnmOmHVVSc60iWBPGL+JxN2G02sndbcE/P8FDDvUM7xnUDdcEXDAmzHsUW+LOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUoWRKfzhmF7bCEGyKETrF+L0A4oBFS5zBUZZDZ/eUjzSr9vFU
	ZWFb2Ls5TKFESFetoHggsLqLvFy2qyN4mZoeakhHxbQWnKoEc0UFC7HmZ27Lg68fDNAee761H1A
	KRIqMd1dK0q5EmivnjA==
X-Received: from ejca6.prod.google.com ([2002:a17:906:3686:b0:b8e:7d43:b280])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:f58b:b0:b86:f194:9eec with SMTP id a640c23a62f3a-b8edf1ea493mr956084166b.18.1770732673626;
 Tue, 10 Feb 2026 06:11:13 -0800 (PST)
Date: Tue, 10 Feb 2026 14:11:12 +0000
In-Reply-To: <20260210145156.108ab292@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org> <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210134913.33cb674f@fedora>
 <aYsyGAwy4rq-H7Hd@google.com> <20260210145156.108ab292@fedora>
Message-ID: <aYs8gN34IVPQiqLk@google.com>
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

On Tue, Feb 10, 2026 at 02:51:56PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 13:26:48 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Tue, Feb 10, 2026 at 01:49:13PM +0100, Boris Brezillon wrote:
> > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >   
> > > > /// The owner of this value must ensure that this fence is signalled.
> > > > struct MustBeSignalled<'fence> { ... }
> > > > /// Proof value indicating that the fence has either already been
> > > > /// signalled, or it will be. The lifetime ensures that you cannot mix
> > > > /// up the proof value.
> > > > struct WillBeSignalled<'fence> { ... }  
> > > 
> > > Sorry, I have more questions, unfortunately. Seems that
> > > {Must,Will}BeSignalled are targeting specific fences (at least that's
> > > what the doc and 'fence lifetime says), but in practice, the WorkItem
> > > backing the scheduler can queue 0-N jobs (0 if no jobs have their deps
> > > met, and N > 1 if more than one job is ready). Similarly, an IRQ
> > > handler can signal 0-N fences (can be that the IRQ has nothing to do we
> > > job completion, or, it can be that multiple jobs have completed). How
> > > is this MustBeSignalled object going to be instantiated in practice if
> > > it's done before the DmaFenceWorkItem::run() function is called?  
> > 
> > The {Must,Will}BeSignalled closure pair needs to wrap the piece of code
> > that ensures a specific fence is signalled. If you have code that
> > manages a collection of fences and invokes code for specific fences
> > depending on outside conditions, then that's a different matter.
> > 
> > After all, transfer_to_wq() has two components:
> > 1. Logic to ensure any spawned workqueue job eventually gets to run.
> > 2. Once the individual job runs, logic specific to the one fence ensures
> >    that this one fence gets signalled.
> 
> Okay, that's a change compared to how things are modeled in C (and in
> JobQueue) at the moment: the WorkItem is not embedded in a specific
> job, it's something that's attached to the JobQueue. The idea being
> that the WorkItem represents a task to be done on the queue itself
> (check if the first element in the queue is ready for execution), not on
> a particular job. Now, we could change that and have a per-job WorkItem,
> but ultimately, we'll have to make sure jobs are dequeued in order
> (deps on JobN can be met before deps on Job0, but we still want JobN to
> be submitted after Job0), and we'd pay the WorkItem overhead once per
> Job instead of once per JobQueue. Probably not the end of the world,
> but it's worth considering, still.

It sounds like the fix here is to have transfer_to_job_queue() instead
of trying to do it at the workqueue level.

> > And {Must,Will}BeSignalled exists to help model part (2.). But what you
> > described with the IRQ callback falls into (1.) instead, which is
> > outside the scope of {Must,Will}BeSignalled (or at least requires more
> > complex APIs).
> 
> For IRQ callbacks, it's not just about making sure they run, but also
> making sure nothing in there can lead to deadlocks, which is basically
> #2, except it's not scoped to a particular fence. It's just a "fences
> can be signaled from there" marker. We could restrict it to "fences of
> this particular implementation can be signaled from there" but not
> "this particular fence instance will be signaled next, if any", because
> that we don't know until we've walked some HW state to figure out which
> job is complete and thus which fence we need to signal (the interrupt
> we get is most likely multiplexing completion on multiple GPU contexts,
> so before we can even get to our per-context in-flight-jobs FIFO, we
> need to demux this thing).

All I can say is that this is a different use-case for the C api
dma_fence_begin_signalling(). This different usage also seems useful,
but it would be one that does not involve {Must,Will}BeSignalled
arguments at all.

After all, dma_fence_begin_signalling() only requires those arguments if
you want to convert a PrivateFence into a PublishedFence. (I guess a
better name is PublishableFence.) If you're not trying to prove that a
specific fence will be signalled, then you don't need the
{Must,Will}BeSignalled arguments.

Alice
