Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CBB3168E6;
	Tue, 10 Feb 2026 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726116; cv=none; b=tLJS01H4GVP3yr4S3tvksokqU6mNLcPjOcvWy4ml86onTp+jHq76Q+3pGsDoAqPWrupkRL0YiaupbJzVkQe+fTtj4s3r//I1rAgY3i8z0YlWdNTlbeYU5xB/BMhkvG3MdlG7lkLFcICuCPV4tnHQDj3z4RfnMsx5tQOgXPIm8WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726116; c=relaxed/simple;
	bh=jMJV9tKFqsuBrmNctkDK2BnQ6D28pGD2piAupHW2p88=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UViGQhEVen/e2IGxw0XsxTynfaOaPGjygG99pgp6vV9tULGiOCFgCNSXCz5Wu0chMn5ArCuYtMgnRbLEtdG70lRIrlp7Fe5FnnQRniOBmVgzTZ/Oa9nrtD8MOLO78zhBDjSpmFgwVmF2FfKqgAFG+gLY2bD/2qdu84DESA2VeQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mtPTGOmq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mtPTGOmq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770726113;
	bh=jMJV9tKFqsuBrmNctkDK2BnQ6D28pGD2piAupHW2p88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mtPTGOmqIKmUIBc0P69rw4gmQbmaxUYXbAXQksJSy99Pozl59V/iD875PGaMIernh
	 hOMhXaaR3OH0gTJRLHee7JK2XhW8415qb2MJhg1Aj+JkCX1vYi0xUVT3qXB62cdXH2
	 0Hivv1kbdmi2RB+YV7FwFPOHLFh+JoP3jBR+WVKRV0jvkgxbrIg1owOnHGD22251Es
	 ofXeq/uF467EFwO4JAokOkb3kHfPc0bFJCq6sbnN1IFVkQOoAas+A+oyo1c1O3+ZI5
	 QR89piZoEjJroPbJ754gK4s12lTdIs1SVv5Ct7G6f0yPFNKGDhL6nXMfKfbsQfJhIs
	 X9x9K10K1+aJw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7104B17E114C;
	Tue, 10 Feb 2026 13:21:52 +0100 (CET)
Date: Tue, 10 Feb 2026 13:21:47 +0100
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
Message-ID: <20260210132147.4d5a491b@fedora>
In-Reply-To: <aYsaYBimKUaRA1Gb@google.com>
References: <20260203081403.68733-4-phasta@kernel.org>
	<20260205095727.4c3e2941@fedora>
	<DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	<bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	<20260209155843.725dcfe1@fedora>
	<c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	<aYruaIxn8sMXVI0r@google.com>
	<20260210101525.7fb85f25@fedora>
	<aYsFKOVrsMQeAHoi@google.com>
	<20260210123432.588a20f5@fedora>
	<aYsaYBimKUaRA1Gb@google.com>
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

On Tue, 10 Feb 2026 11:45:36 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Feb 10, 2026 at 12:34:32PM +0100, Boris Brezillon wrote:
> > On Tue, 10 Feb 2026 10:15:04 +0000
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >   
> > > impl MustBeSignalled<'_> {
> > >     /// Drivers generally should not use this one.
> > >     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
> > > 
> > >     /// One way to ensure the fence has been signalled is to signal it.
> > >     fn signal_fence(self) -> WillBeSignalled {
> > >         self.fence.signal();
> > >         self.i_promise_it_will_be_signalled()
> > >     }
> > > 
> > >     /// Another way to ensure the fence will be signalled is to spawn a
> > >     /// workqueue item that promises to signal it.
> > >     fn transfer_to_wq(
> > >         self,
> > >         wq: &Workqueue,
> > >         item: impl DmaFenceWorkItem,
> > >     ) -> WillBeSignalled {
> > >         // briefly obtain the lock class of the wq to indicate to
> > >         // lockdep that the signalling path "blocks" on arbitrary jobs
> > >         // from this wq completing
> > >         bindings::lock_acquire(&wq->key);
> > >         bindings::lock_release(&wq->key);  
> > 
> > Sorry, I'm still trying to connect the dots here. I get that the intent
> > is to ensure the pseudo-lock ordering is always:
> >   
> >    -> dma_fence_lockdep_map
> >       -> wq->lockdep_map  
> > 
> > but how can this order be the same in the WorkItem execution path? My
> > interpretation of process_one_work() makes me think we'll end up with
> >   
> >   -> wq->lockdep_map
> >     -> work->run()
> >        -> WorkItem::run()
> >           -> dma_fence_lockdep_map
> >              -> DmaFenceSignalingWorkItem::run()  
> >                 ...
> > 
> > Am I missing something? Is there a way you can insert the
> > dma_fence_lockdep_map acquisition before the wq->lockdep_map one in the
> > execution path?  
> 
> Conceptually, the dma_fence_lockdep_map is already taken by the time you
> get to WorkItem::run() because it was taken all the way back in the
> ioctl, so WorkItem::run() does not need to reacquire it.
> 
> Now, of course that does not translate cleanly to how lockdep does
> things, so in lockdep we do have to re-acquire it in WorkItem::run().
> You can do that by setting the trylock bit when calling lock_acquire()
> on dma_fence_lockdep_map. This has the correct semantics because trylock
> does not create an edge from wq->lockdep_map to dma_fence_lockdep_map.

Ah, I never noticed dma_fence_begin_signalling() was recording a
try_lock not a regular lock. I guess it would do then.
