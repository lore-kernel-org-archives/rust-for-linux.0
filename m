Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F113C0C
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770825221; cv=none; b=lCJ/2e9gbEPxxo/LwAZzkImRHhlQxIqvNUrgLN98T1IFov7kS9VIcPn97qeJ9nnDphfMIpaCIG/m0Y1DdgMpZdyjJVia0MBPpXlaItiZMdQiHMN0JHIPFXFOcWLiMrkdARhG7DzadiM0D1QTUceNxfkD1wZu3Vi4+mWoi4wMuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770825221; c=relaxed/simple;
	bh=CgMTUjg8cMuQiWwcY9AuIP07bDr48KxocPQ7VDQ2FLo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ag/dxg33l+12LYG83/XTSqNWnZ6J9+uJB+HjlExzveLc1qFzRUdjTKoD+NoEdQrmMcUP44KNJPWMB82aQeVBwilD7vu1QwCj1yTbEBtBuLaN8/cEzRXn5ZqxMcsHsQnfuIhtIlKbbTSqJLPEi3zH3toLjd0iYCqD7Qo3BMn6oe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H4nCOMNZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H4nCOMNZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-482ef3af991so5953615e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 07:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770825218; x=1771430018; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo7WKYebi3fAlOUB+zK2I6teKG+LDSaCT9sMVh6hilE=;
        b=H4nCOMNZwBwyb/rZU7xaFST7a7ZUsaYGGJidJdkITKbtDP0ePTSCHDxxeoEkbp8CFn
         QIhmXKp21O1IYjAVRIockb3zALfnBn4idRbOAofiPC6TNKkiSrJI34XP/6rVUvXPCqIO
         TLghmXTBS/6IVafaUhsgkQNLXImXA9SUEQE7tf5FMgT66Ivkn9YJ0R1IKh2zbDtlrfdp
         W26pSUSATF9/QF7GkeqvImweXPD+ajTy6B0+UQG9X9Tmxzvm0UDErA3R3YGP/9jUGUdI
         NmLliYybF+KCRTY402Qt4eirPccxRBfMQ71qTA8Mg2w1KJQlfuvUnu1MfC8uDUm3/HFH
         NtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770825218; x=1771430018;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fo7WKYebi3fAlOUB+zK2I6teKG+LDSaCT9sMVh6hilE=;
        b=cRsu0NGgyQdaol0GoT95YO3tyh44BfWHLI5nZgkItFPC2DrX3VbGCuiSFwoFF0C7TP
         /kTADo9GDaUJm0Xz9bwhdSd4gRcYI0GIbeI49Y6zezBh8x3eKkZBVrmfq+ibnUoT+qOz
         2lc+8xUrqH2L5rqXmNl3MQewwdZrtqVJvH2ZLEjkKxbCEcRkfv3ildaCRJZ9yFfFJ375
         bVMtjMBLqSm5ofr65gp4CQYbfkMppC2lyGX7uFkvNqPNmmMSTKuvzNFZwQbjWIzrdMlJ
         cpO+cdBvvLTuyS8gwLVCm5ZvQ3xmQC0kPCljWfOsrNo//UeIcJdB/ywybtYsIx8rwmJ1
         LTtA==
X-Forwarded-Encrypted: i=1; AJvYcCWEOVqfa1voonb5uh+J7Cqa02BEjYbWqoNRyrm1WYD7skfis5lQWBdjCE+3Ex1t/RU8GCHnT5HpnC2jT+20XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+5HPE1w9c9EShaDhm57DhVWf0otVDj/qnZJ3wybUga6ky7t69
	UNN1UARHeMK5+imu2utRWDHYbZ2WSln4AAXmVkEbKGwyPIC9pNeMPFP/ZX2d3+aKxrZaelPXphW
	whwZijA3jfgTB6lUYqg==
X-Received: from wmov20.prod.google.com ([2002:a05:600c:4714:b0:480:4a03:7b5c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35d2:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-48350547564mr88179375e9.14.1770825218555;
 Wed, 11 Feb 2026 07:53:38 -0800 (PST)
Date: Wed, 11 Feb 2026 15:53:37 +0000
In-Reply-To: <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora> <f3d2e3b370bed55cc2a95287b3c257f878b5e92b.camel@mailbox.org>
 <aYx0a-2eANbM_vnd@google.com> <DGC6FE14C91M.1BMCS7XHRVP6J@garyguo.net>
 <20260211150738.049af4bb@fedora> <aYydpYzd4AzFoAvZ@google.com> <bd6343fc39b78d4b2ba1b82a83c689cdb3a1d6fc.camel@mailbox.org>
Message-ID: <aYymAR8BRNL-DVMh@google.com>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Gary Guo <gary@garyguo.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Feb 11, 2026 at 04:20:15PM +0100, Philipp Stanner wrote:
> On Wed, 2026-02-11 at 15:17 +0000, Alice Ryhl wrote:
> > On Wed, Feb 11, 2026 at 03:07:38PM +0100, Boris Brezillon wrote:
> > > 
> > > Back to this particular job dependencies use case: we have to embed the
> > > DmaFence pointer in some wrapper with the ListLinks element anyway,
> > > because DmaFences can be inserted in multiple of those lists in
> > > parallel.
> > 
> > Okay, if that's the case, then the linked list is *really* not the right
> > tool for the job.
> 
> We have to distinguish what we are talking about here.
> 
> For the JobQueue, it takes over a cloned DmaFence and stuffs that into
> its own list. Problem solved.
> 
> Whether the driver has other clones of that fence in other list is not
> relevant because it's not the same list head.
> 
> JQ's lists and list heads are internal.
> 
> I don't see a problem.

I'm talking about this allocation:

    pub fn add_dependency(&mut self, fence: ARef<DmaFence<i32>>) -> Result {
        let dependency = Dependency::new(fence)?;

and this one:

    pub fn submit_job(&self, mut job: Pin<KBox<Job<T>>>) -> Result<ARef<DmaFence<i32>>> {
        [...]
        let wrapped_job = JobWrap::new(job)?;

Replacing `dependencies` with a KVec and `waiting_jobs` with xarray
would cause these to use less memory, fewer allocations, and be faster.
And it would solve the raw pointer in HwFenceWaker, as you can use the
address (or other ID) of the Job<T> as key to look up in the xarray.

For `dependencies` there's no need to worry about the vector growing too
large, because the vectors are not long-lived: when the fence signalled
the entire vector can be freed. As for waiting_jobs, the xarray
auto-shrinks its memory usage, so no problem there.

Alice
