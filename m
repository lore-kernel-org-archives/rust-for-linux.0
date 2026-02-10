Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6006327798
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770729335; cv=none; b=QTMhU7HY9GHBee1SCJggqpIJWRDAr8S5ZnYL5FYZZZIrqGXejlr4NMhiEwDQu+B3oSYKB/GD0kr+TMZ4sC/9x0YbWg++IV+lNGiin69UJE9Qvl2+bp/xXDrtcIJE6YW6VRzREM5Ap66xpX+GXsTvQLkMY1z/f85fgnWffDu1TbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770729335; c=relaxed/simple;
	bh=KJdhIBo/4fECGQFApQvOnFub1K6b6tpxhSOpPuMA3eg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Il1VAIlfGdUgAF97BOry1wizNFL3Mcrix4/P0JDOpl/w6HHn40nrxb8LvtDkdmbQotmB6f2LM9Gpw9zR9xPl0lV5XWBOZvXdq/wiOnvQz6nzaH0Ct9/6e6IQQejryvP/J17KcI6Qix8t1sKy1UP7N+SqhkuPq57a6B9Vq1EKqzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bdOQbvqc; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bdOQbvqc"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8863e43fefso706829266b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 05:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770729332; x=1771334132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9VV/JxScsbsZ/xttmVg7Jcxlx8uiC2eXBQsyDkGahJE=;
        b=bdOQbvqciUuOmPTNSN9EucYRslkjET3YOaUQAzi+JtHeKwp2NZdiK8/XCsMxjgV81r
         Qz2vSiXQhfUguoXO/ss64jGq1z6Bmu/8eM54XnWYbOEjAK7+d+6TCb4Iax28jSVU7LAR
         KFNZZlA5ALbW/XEvhv1hPzJGhSg1Dxmi9qrtRzVaBLVQBanhoyU0yRGD8VHhfSs/cz6W
         vrnOT0UAfR1mEv22JDRQmWRIIba3S2brY4sx9Ki4u3ajTdJMaZvmngNrgykrCoDLn+Pt
         0ngFQYH/lQ7/ExAxa9kkuxF+R9DPMiB8WRen7I0+7VLu/MGuJe2tO418G2arz3wZJpAh
         lWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770729332; x=1771334132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VV/JxScsbsZ/xttmVg7Jcxlx8uiC2eXBQsyDkGahJE=;
        b=cDGLGeUYzelxAHbB6neCob9Z14b80kMVCeLZf5BAgQ5Fuybio75J0C+JUR8cmpErVr
         djGvilWdO9uIIHOq2hOvts0Te3DW2DKzM2pavINkRGzttUE+r9eI4EIAZWlFbQupOcqC
         rcaXQ3shvCHNOoujp/vilfCme9l535vNisrbxRPlloZz5gXIm3izY9Z4uwhmny4PrtXG
         Ef2wG5/8qpigiPh/Zz9vN4CcJiLVlsM3gineM16824MFUuUYsWp9enes+Elv/F0pjM5x
         9yvck9wCugImcvleY1eYKgBZ4oCQNjG2eIHBzs/n4+X/pXFORqRA5MrvIC5Ta6+9UNsa
         ehMg==
X-Forwarded-Encrypted: i=1; AJvYcCU5kRv41bp4Z/pSQkKu6NrBQpF+cgga3hGv0IjC676mfvlwsUdarOpgDEW+F4fSadZVQUSxe/3msZLMM/NhKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz326nGRO9Nyy6YHomnUO7KdCtGE6KBddq5Scb+AuPcLkewB60Q
	nf6mwCmL4ovLg2pXCOVNZ5D+yWMO/gYYVWTZa+N99WJ5g1kH7ebTM9gnOcFsQdW5S1abYhkTDXa
	zcKLZF2Kx3eaeeLSNow==
X-Received: from ejblc1.prod.google.com ([2002:a17:906:f901:b0:b88:4d07:231])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a15:b0:b88:4e9d:bc63 with SMTP id a640c23a62f3a-b8f5438238fmr102094466b.6.1770729332186;
 Tue, 10 Feb 2026 05:15:32 -0800 (PST)
Date: Tue, 10 Feb 2026 13:15:31 +0000
In-Reply-To: <20260210133617.0a4be958@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-4-phasta@kernel.org> <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org> <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora> <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <20260210133617.0a4be958@fedora>
Message-ID: <aYsvc3Q8h-Gg27-g@google.com>
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

On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
> On Tue, 10 Feb 2026 10:15:04 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > impl MustBeSignalled<'_> {
> >     /// Drivers generally should not use this one.
> >     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
> > 
> >     /// One way to ensure the fence has been signalled is to signal it.
> >     fn signal_fence(self) -> WillBeSignalled {
> >         self.fence.signal();
> >         self.i_promise_it_will_be_signalled()
> >     }
> > 
> >     /// Another way to ensure the fence will be signalled is to spawn a
> >     /// workqueue item that promises to signal it.
> >     fn transfer_to_wq(
> >         self,
> >         wq: &Workqueue,
> >         item: impl DmaFenceWorkItem,
> >     ) -> WillBeSignalled {
> >         // briefly obtain the lock class of the wq to indicate to
> >         // lockdep that the signalling path "blocks" on arbitrary jobs
> >         // from this wq completing
> >         bindings::lock_acquire(&wq->key);
> >         bindings::lock_release(&wq->key);
> > 
> >         // enqueue the job
> >         wq.enqueue(item, wq);
> > 
> >         // The signature of DmaFenceWorkItem::run() promises to arrange
> >         // for it to be signalled.
> >         self.i_promise_it_will_be_signalled()
> >     }
> 
> I guess what's still missing is some sort of `transfer_to_hw()`
> function and way to flag the IRQ handler taking over the fence
> signaling token.

Yes, transfer to hardware needs to be another piece of logic similar to
transfer to wq. And I imagine there are many ways such a transfer to
hardware could work.

Unless you have a timeout on it, in which case the WillBeSignalled is
satisfied by the fact you have a timeout alone, and the signalling that
happens from the irq is just an opportunistic signal from outside the
dma fence signalling critical path.

From dma-fence.c:

 * * The only exception are fast paths and opportunistic signalling code, which
 *   calls dma_fence_signal() purely as an optimization, but is not required to
 *   guarantee completion of a &dma_fence. The usual example is a wait IOCTL
 *   which calls dma_fence_signal(), while the mandatory completion path goes
 *   through a hardware interrupt and possible job completion worker.

Well ... unless triggering timeouts can block on GFP_KERNEL
allocations...

Alice
