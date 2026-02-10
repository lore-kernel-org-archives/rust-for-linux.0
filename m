Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66596314A7A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730472; cv=none; b=AVDXQiYY0Z0vnzoAHAeTPn99CUoFwa3bx9O28wke2OIcTu6/N0JgjpEfbcGKtf3SoNtR7j6Jw7OqReQYgG4nhh4oYE91nS+1/4vaBF7OK83KLyPoiqAQVAkZeVVW59M365YQRB0n+XmxyeWYdCOog5ekUnuo1bvSFKqqorEF3fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730472; c=relaxed/simple;
	bh=MNIe+XDOwGOsoc0qakZ4m0xGRs00VWpWGot8ay2Scfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YSwa42ssI1Sl1K1zllC5t6UTAEQx/fOFveCmCzNwLxQAiwH4EcxorVCBFKfZCVLsSRXQI+a2jd9woWT9cqrJmrq2kj6ttA2uIRcLYQ+O81/OSkInnX2FRuInYlMhujyEg8Q6RGTMeHaI3OeUvZgLWNte8y59uPh1DVZ4szxnaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z89Nl3Wp; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z89Nl3Wp"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8718916c9aso89564166b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 05:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770730470; x=1771335270; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/H7jmw8ZJJGOF6KNSe5xcMTZ4QJmclAwWnwXYIlcAk=;
        b=Z89Nl3Wpxt0zs8BsfCYH8VOaVOwwtRSvN5Hmc2QP2tm5UX2sfrAoZt/6G7uvr1zWBY
         Tz1ksaiTnob3W0/pGFvrLGNGN6orsIM3zgSBJ6Srucjha8QRme5DhHCI+jqTKGDxglvv
         GLvHgMxPWK94Kqo6kPB1VTs9Uck82EgzreOx9GYDMONyxtW8Quj0KXkCmr5Cp4ltADwb
         xkOeD8Y4i9uKSEXObVuz+exXyuBS66Thdle3fB6Dd1T0YPNYTYje79vCOGTejglxAuUa
         QoFL+rVnHQYhYkrymZmrtGC0OR4K//E1BI4J+HggjMFUjzEvw3EUGECiwXjxPboeTMq0
         Zueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730470; x=1771335270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/H7jmw8ZJJGOF6KNSe5xcMTZ4QJmclAwWnwXYIlcAk=;
        b=v1kXfp/Y7g2mQHvrqpArujEvLFCGaaWGIQ1OXNoURcScFULTQ0GsXa9brSRYcUV9Vt
         OS2IOYxKT+ibrK6p9oVBgHIJCHuxZw7eHV9YMlM9JeCDtSiNkJ44dPwftWdoPxC+RhT/
         RcYmKEtlx44lVB5heJCPIcUoXHECm4XeCw67s9MILjgkNfWbUzzi0tc4hCPBCMwWPG4n
         gvWL53YlSY6pDzk45hFRR/3s5m8MMU5OVsIOesmhQo3vfNmRpN2voc47DmZnDyVu2DN/
         cNh33e9p6DgnHYzBvC6BV9VJcIWZMPnVIqVWUapYF1T185g66J80NGFDhiRMMz8/1KRk
         GeeA==
X-Forwarded-Encrypted: i=1; AJvYcCUgywxtwl2UrQsbdKdGAUqFKfqbG8W1/436eVVyWQ46zThuMsFtCZZdi+Xtxaq+TonsgmTaVhnB3/KvuwIXLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0KGIMJEW8u30zcRfqUwzxymNFmRTvVWWZihYr/nYXpS8oJt2G
	YR1jK1ok7UhnxA2T07DqZ0p5XUDlIGRIy4DhZtHMjLFEU2T6tKnRcYfH6hMDWa35e2Gr+0odSIB
	0Xzb2lpyDxvFzUxQ/eg==
X-Received: from ejbr12.prod.google.com ([2002:a17:906:364c:b0:b88:38ff:1869])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:9f85:b0:b8e:4790:d7c7 with SMTP id a640c23a62f3a-b8edf175f83mr881079766b.6.1770730469653;
 Tue, 10 Feb 2026 05:34:29 -0800 (PST)
Date: Tue, 10 Feb 2026 13:34:28 +0000
In-Reply-To: <20260210132147.4d5a491b@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org> <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210123432.588a20f5@fedora>
 <aYsaYBimKUaRA1Gb@google.com> <20260210132147.4d5a491b@fedora>
Message-ID: <aYsz5JKjTrxNPW4w@google.com>
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

On Tue, Feb 10, 2026 at 01:21:47PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 11:45:36 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Tue, Feb 10, 2026 at 12:34:32PM +0100, Boris Brezillon wrote:
> > > On Tue, 10 Feb 2026 10:15:04 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >   
> > > > impl MustBeSignalled<'_> {
> > > >     /// Drivers generally should not use this one.
> > > >     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
> > > > 
> > > >     /// One way to ensure the fence has been signalled is to signal it.
> > > >     fn signal_fence(self) -> WillBeSignalled {
> > > >         self.fence.signal();
> > > >         self.i_promise_it_will_be_signalled()
> > > >     }
> > > > 
> > > >     /// Another way to ensure the fence will be signalled is to spawn a
> > > >     /// workqueue item that promises to signal it.
> > > >     fn transfer_to_wq(
> > > >         self,
> > > >         wq: &Workqueue,
> > > >         item: impl DmaFenceWorkItem,
> > > >     ) -> WillBeSignalled {
> > > >         // briefly obtain the lock class of the wq to indicate to
> > > >         // lockdep that the signalling path "blocks" on arbitrary jobs
> > > >         // from this wq completing
> > > >         bindings::lock_acquire(&wq->key);
> > > >         bindings::lock_release(&wq->key);  
> > > 
> > > Sorry, I'm still trying to connect the dots here. I get that the intent
> > > is to ensure the pseudo-lock ordering is always:
> > >   
> > >    -> dma_fence_lockdep_map
> > >       -> wq->lockdep_map  
> > > 
> > > but how can this order be the same in the WorkItem execution path? My
> > > interpretation of process_one_work() makes me think we'll end up with
> > >   
> > >   -> wq->lockdep_map
> > >     -> work->run()
> > >        -> WorkItem::run()
> > >           -> dma_fence_lockdep_map
> > >              -> DmaFenceSignalingWorkItem::run()  
> > >                 ...
> > > 
> > > Am I missing something? Is there a way you can insert the
> > > dma_fence_lockdep_map acquisition before the wq->lockdep_map one in the
> > > execution path?  
> > 
> > Conceptually, the dma_fence_lockdep_map is already taken by the time you
> > get to WorkItem::run() because it was taken all the way back in the
> > ioctl, so WorkItem::run() does not need to reacquire it.
> > 
> > Now, of course that does not translate cleanly to how lockdep does
> > things, so in lockdep we do have to re-acquire it in WorkItem::run().
> > You can do that by setting the trylock bit when calling lock_acquire()
> > on dma_fence_lockdep_map. This has the correct semantics because trylock
> > does not create an edge from wq->lockdep_map to dma_fence_lockdep_map.
> 
> Ah, I never noticed dma_fence_begin_signalling() was recording a
> try_lock not a regular lock. I guess it would do then.

Calling dma_fence_begin_signalling() never blocks so 'trylock' is the
right option.


Actually, that raises one question for me. Right now it's implemented
like this:

	/* explicitly nesting ... */
	if (lock_is_held_type(&dma_fence_lockdep_map, 1))
		return true;

	/* ... and non-recursive successful read_trylock */
	lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1, NULL, _RET_IP_);

but why not drop the explicit nest check and pass `2` for read instead?

	lock_acquire(&dma_fence_lockdep_map, 0, 1, 2, 1, NULL, _RET_IP_);

Note that passing 2 means that you're taking a readlock with
same-instance recursion allowed. This way you could get rid of the
cookie entirely because you're just taking the lock multiple times, and
lockdep will count how many times it's taken for you.

Alice
