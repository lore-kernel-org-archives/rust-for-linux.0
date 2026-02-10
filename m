Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A264D27FD4F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731352; cv=none; b=HZqqLjoNWRMh58hUrFpFsex0tl+Rw+UvoV34P0b9fkZ1MTzb7Guc20nChy/jQr76CAfWgPVDYyjystognTd3fKLK10NKrX7c8dl9iqnGbCddFMQjtqSJbS5dPrYAp3T2/4CFA0//oWsw4ZuvwDqq/FMyXSOxaHKDHIcWRJcrMNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731352; c=relaxed/simple;
	bh=VoychUp4WgC3UFyzJ9DDREreyemqMLEfACxyDDCKvKQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j93If+tWMJlUWRMNL7y0O7MAIYGMb/Amk25DB+bNFAqQcltKNlB7NC3l0F2UcN7MswPiiVap6aZHIni5yW5yvDUhwrqmYnRBWjIrVzEZhA2u6pHusmcAqcVgwxeouOqGnM5w41WgyLSxK9L3lRppozOFgeM3VdDp+lQ1Y/Dj8K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bZb9Kn1X; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bZb9Kn1X"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806fa4a180so35541895e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770731350; x=1771336150; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ir8q+upc8QwnzKnnpPbPVZe9GiYbjnyr5Mc/R3N1TXo=;
        b=bZb9Kn1XWPxSUeHkvovaq/TFQL8KpMXrlaE6GnN5ARKz0Ur5oUwB2wX8bM2HE5uOEX
         bsJDaggvB22kDMftcDlpslye6WwPulQzkVjQh+dbJmptl4q9c00mhtJ9u9qa7effymRc
         vNYpcrqS4eYitC9OyaFfCVLq/cDZfTdITyrfCaVyr3souZQsETw3l9f/K+H/vikD1xXX
         FxPWYCFbuUJTyn9goTIIZ07PBws8VQ44K02ybIGVqbwz3qmszon7nNZ/8rPfzzq3Gvfp
         dCd+VvdT3K6CATIGMB67SfR8tprBGzEw9YVOmHnvnLxsCVWPRKl0jDVIaZBdhBSXf9VI
         m+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731350; x=1771336150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir8q+upc8QwnzKnnpPbPVZe9GiYbjnyr5Mc/R3N1TXo=;
        b=jXcH7BSgGQYwB6rnXtKab6mQplR+mEcAdjSxQzsVl071r3U6pW9qCMIra8kykvhDWx
         Gw9hoB8PCaaJfAjLuvjh8mee9ylXe9VCTMEhMcfmxT0AHx4x7+0cArsdfOI0NDfs5DuG
         qFjaBoKs/7+sFLuCrWYTM1A8zYVvmoOmg0JMQceHP3kFTMW4z2xTDYXEcyJezo0FYIvV
         VWkduyX0PiLFkH88C8FdL/442NvdD31Ai/RKPfvbLlubxgE59BxI4yuIu9VSenPL1cZ3
         p/gd8iw9A7SVE0/3VmF5rs8BNi1X3plLLIbYjJUmkZIwUeQAQTIbofb4LAPEAy7gxbaO
         IAmA==
X-Forwarded-Encrypted: i=1; AJvYcCUnyKRxI19QYCOKBFzQk/odS/VFMw5JrZYgOQQ77YQfXAyFE0MHNascRP/r3nyikk4e+blL4WZ32kwDrlfW/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1iTf/RPy4xTpfh8iIk1KvlTHcZwLQmHU6D+N7jcpjBQUSfiR
	ewzOTAoh/cekK7YavHQmzYsFqWAdmmTUMooDgQw/2MwYEE3DkWd1HYhPVeExRoGYdhrwkNd7vnj
	29iYIhg8/aRPdIP0aAw==
X-Received: from wmrc23.prod.google.com ([2002:a05:600c:ad7:b0:480:1bc3:e23c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d01:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-48320213a37mr218488375e9.22.1770731350068;
 Tue, 10 Feb 2026 05:49:10 -0800 (PST)
Date: Tue, 10 Feb 2026 13:49:09 +0000
In-Reply-To: <20260210142631.6f8a3411@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org> <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
 <aYsvc3Q8h-Gg27-g@google.com> <20260210142631.6f8a3411@fedora>
Message-ID: <aYs3VVH_UXMFa5oC@google.com>
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

On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 13:15:31 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
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
> > > > 
> > > >         // enqueue the job
> > > >         wq.enqueue(item, wq);
> > > > 
> > > >         // The signature of DmaFenceWorkItem::run() promises to arrange
> > > >         // for it to be signalled.
> > > >         self.i_promise_it_will_be_signalled()
> > > >     }  
> > > 
> > > I guess what's still missing is some sort of `transfer_to_hw()`
> > > function and way to flag the IRQ handler taking over the fence
> > > signaling token.  
> > 
> > Yes, transfer to hardware needs to be another piece of logic similar to
> > transfer to wq. And I imagine there are many ways such a transfer to
> > hardware could work.
> > 
> > Unless you have a timeout on it, in which case the WillBeSignalled is
> > satisfied by the fact you have a timeout alone, and the signalling that
> > happens from the irq is just an opportunistic signal from outside the
> > dma fence signalling critical path.
> 
> Yes and no. If it deadlocks in the completion WorkItem because of
> allocations (or any of the forbidden use cases), I think we want to
> catch that, because that's a sign fences are likely to end up with
> timeouts when they should have otherwise been signaled properly.
> 
> > Well ... unless triggering timeouts can block on GFP_KERNEL
> > allocations...
> 
> I mean, the timeout handler should also be considered a DMA-signalling
> path, and the same rules should apply to it.

I guess that's fair. Even with a timeout you want both to be signalling
path.

I guess more generally, if a fence is signalled by mechanism A or B,
whichever happens first, you have the choice between:

1. A in signalling path, B is not
2. B in signalling path, A is not
3. A and B both in signalling path

But the downside of choosing (1.) or (2.) is that if you declare that
event B is not in the signalling path, then B can kmalloc(GFP_KERNEL),
which may deadlock on itself until event A happens, and if A is a
timeout that could be a long time, so this scenario is undesirable even
if technically it's not a deadlock because it eventually unblocks
itself.

So we should choose option (3.) and declare that both timeout and hw irq
codepaths are signalling paths.

Alice
