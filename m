Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088326ED3A;
	Tue, 10 Feb 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730000; cv=none; b=cky0veufRUbJqeDAK/SoMTnTFAPcwDSTKQ0YiqdeX8Q1ZkrRC9Fc1xchFX7RV2usMi8ePGbw2capQwAy8rahG8MZTp0B6zbFCcSJw4Qy+CgkfNC+12SskFluGoz1B3Fv6un2/3uTFvmZzJ3XhyDDShQllOMEJ0FeErnwElFqd+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730000; c=relaxed/simple;
	bh=1f2ByBVbJvu0q0MRxOhcWnBmbdQEufXvwagAzQ5WedQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f0NMj6tNgYhL1ddFKQzR1BacIT3OgyPIp4ZmMJUBTufTgFkGrc3NbcQ1+T4fOARu9AY5vQCpmMU/OKJPl78icOawtM6ybX22CW5KRTGHL9MMHIm4BqqLX4Yof7Xfc9UY3Q2d8ahH5/VnvrJAONsll1nXG9IwuMmgxebaYUhA2ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BvJe2eTZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BvJe2eTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770729997;
	bh=1f2ByBVbJvu0q0MRxOhcWnBmbdQEufXvwagAzQ5WedQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BvJe2eTZAH+7JqFQiwN14wFddnGxGiP5yF7yEE7mBR2AjE+dYGCMOsJu93OLdVYr1
	 EpBIyaqDcXUZ04z1PpttfM7EW/pTAV1FCqTTE75dMCMMybczYehuac2ROxzIVo4o2q
	 D23iHFdd6ay/DOOqVJYsTd4onckoSKs0y3+CfU439ZCsT0/CWcWpB5WarQtD5NCvfH
	 Fn7PvBbDxSlGxNLOZx6O9DbHdhuLm8X74vd3Gu2PtoKF3bBrYFmLqQa1RJZLKFIBx7
	 8c3Rks++K5NkZ2QBn2OdaUWwcvpG+EIvvd1nDBVJ6MoG9/CRg91Yq3vw0Bk4cI1k30
	 ZqZjPFuv7Q7ug==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 212CD17E0FCE;
	Tue, 10 Feb 2026 14:26:37 +0100 (CET)
Date: Tue, 10 Feb 2026 14:26:31 +0100
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
Message-ID: <20260210142631.6f8a3411@fedora>
In-Reply-To: <aYsvc3Q8h-Gg27-g@google.com>
References: <20260203081403.68733-4-phasta@kernel.org>
	<20260205095727.4c3e2941@fedora>
	<DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
	<bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
	<20260209155843.725dcfe1@fedora>
	<c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
	<aYruaIxn8sMXVI0r@google.com>
	<20260210101525.7fb85f25@fedora>
	<aYsFKOVrsMQeAHoi@google.com>
	<20260210133617.0a4be958@fedora>
	<aYsvc3Q8h-Gg27-g@google.com>
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

On Tue, 10 Feb 2026 13:15:31 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
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
> > > 
> > >         // enqueue the job
> > >         wq.enqueue(item, wq);
> > > 
> > >         // The signature of DmaFenceWorkItem::run() promises to arrange
> > >         // for it to be signalled.
> > >         self.i_promise_it_will_be_signalled()
> > >     }  
> > 
> > I guess what's still missing is some sort of `transfer_to_hw()`
> > function and way to flag the IRQ handler taking over the fence
> > signaling token.  
> 
> Yes, transfer to hardware needs to be another piece of logic similar to
> transfer to wq. And I imagine there are many ways such a transfer to
> hardware could work.
> 
> Unless you have a timeout on it, in which case the WillBeSignalled is
> satisfied by the fact you have a timeout alone, and the signalling that
> happens from the irq is just an opportunistic signal from outside the
> dma fence signalling critical path.

Yes and no. If it deadlocks in the completion WorkItem because of
allocations (or any of the forbidden use cases), I think we want to
catch that, because that's a sign fences are likely to end up with
timeouts when they should have otherwise been signaled properly.

> 
> From dma-fence.c:
> 
>  * * The only exception are fast paths and opportunistic signalling code, which
>  *   calls dma_fence_signal() purely as an optimization, but is not required to
>  *   guarantee completion of a &dma_fence. The usual example is a wait IOCTL
>  *   which calls dma_fence_signal(), while the mandatory completion path goes
>  *   through a hardware interrupt and possible job completion worker.

In this example, the fast-signaling path is not in the IRQ handler or
the job completion work item, it's directly in the IOCTL().
Unfortuantely I don't know exactly what would cause dma_fence_signal()
to be called opportunistically in that case, because that's not part of
the description :D. I can tell you there's no such thing in panthor.

> 
> Well ... unless triggering timeouts can block on GFP_KERNEL
> allocations...

I mean, the timeout handler should also be considered a DMA-signalling
path, and the same rules should apply to it.
