Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E451C32B9B4
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 11:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329084; cv=none; b=IJXB3jlGvcRVn/aFreSSu+CY/q39ESjh/8a5MIzcqGJ6PdBXfg8H3/eqgvFDTLUnGCpT7P5gfPVYkDvXRxDPKiGBo5dU7e+jodnZviEDi/G88W4cDreZMfCoMHmS81YMvydUHeAWEXKu+3x4ba9fUlX0W3PhUPlhZz5VKiFiawA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329084; c=relaxed/simple;
	bh=FK28VlCz/kieZEbnDDHfYWnmbeWGC9EEPtCcoJFnJHE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uzDjeCxN3gQ2u+inNOc8a2OMwfxzTuhpT5ZZzdabiqlhJguTy7niUgeiEb9C71LnFv/5balGkY/JqWGr9NZlqKcL6PnC2bW1m8DZINfsgnD7aak3JGNOWs5n2SDstC1RITEFzW+MVekx6etjlK7/IQbj4gcfSkfKj0J6ct0QlCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qUtn4YMO; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qUtn4YMO"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836b7fbf4fso32242405e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 03:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771329081; x=1771933881; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJZSAw1OS3HkHNvztNaVejaKs19d/dpxzj4ZsznN3tA=;
        b=qUtn4YMOISbp75XPCiuKfo/vZo0loujYVJ+2thVs0aTmOzLu/FUY4aRldLABqX/Gt+
         x74EFLKhDD42A4Gj++XgMUnBpYAeVZcDT8WDDupM8KDVerufRqRPX8rZ1U/meHEB5H4W
         wJhwlzCVvl5P+NNd+eDESm/k7VTYIUMkZ/TBCP179+hIJ8Z1vAKJQsYCCY87QRbtTq03
         WQ/bJFKvG74+ekYkzhkm7lCQvbWoe55f8uT+0CJykSKF3F64Qk2nzUUDCgSu4jdIVAgR
         lKHSBYTC0IedCaNBw4euxKrLmtGr2Xh7AEhi6PlNh5hYMTTb6NT8zd+rQE432u9GTuCm
         6DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329081; x=1771933881;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJZSAw1OS3HkHNvztNaVejaKs19d/dpxzj4ZsznN3tA=;
        b=vwmMuySVbdm9AMXGhbz3/4vQtgo9EPqQ79GrU5LI/j5auW0ReCwgP1Qzg2+i1+/mnd
         P9VAjyLPi0DkIIEI5wLp3iORAMP8J/XVNhYydgAA8uI1iqLmSf4TDKx8UkhvpQRhBCGp
         LJfRq9pi5UYgveVy/chszaWu4lWeJOwxtrAcjzusNYp8c/C7f5UpvLyiXPgTY7RlfW4m
         KlOGUyZ8kmQb3Ln4vFO5cNGTXgbsyncdivQihTYv5QbmHkNyR9tlzOGzdhsdipUqFcti
         Kzo50mvn4/n6VHYuc4W1rY+kfMEQ+Prb6LtM6jnINe/WCQzoxJEYSx9ICM+QMmMYL1H+
         1jrA==
X-Forwarded-Encrypted: i=1; AJvYcCVOz5yxisFhTH4Ad93IvjQVZAcXj2bcDJ37Ri+pJEmoQhXREVRwE/DaMnJVLH+oAqs/05wwvalf+pgOIveEtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgP6O5VPmqKD4mzAFJEj9fbg0AvQB5peTtOQlYwLT/MXdVsVuC
	RRshUROGKct4s+fNF9DSVja0cDpYnPB92vvIuN1I+//F7dA10m31T7YKUVhV+heGwps708CcdYF
	a4148R5XxE+ByRX0jEg==
X-Received: from wmte24.prod.google.com ([2002:a05:600c:8b38:b0:480:6c54:bb0a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4688:b0:483:703e:4ad5 with SMTP id 5b1f17b1804b1-48373a37af9mr213342565e9.22.1771329080922;
 Tue, 17 Feb 2026 03:51:20 -0800 (PST)
Date: Tue, 17 Feb 2026 11:51:20 +0000
In-Reply-To: <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aY9HD7nH5A-DtgmR@tardis.local> <2026021326-stark-coastline-c5bc@gregkh>
 <aY9PBfx3RRV7rXZ5@tardis.local> <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com> <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com> <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com> <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
Message-ID: <aZRWOIPThLfIZ1Ph@google.com>
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 17, 2026 at 12:09:11PM +0100, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 10:47:03AM +0000, Alice Ryhl wrote:
> > > > 	// OK!
> > > > 	unsigned long *a, b;
> > > > 	b = READ_ONCE(a);
> > > > 	if is_valid(b) {
> > > > 	    // do stuff
> > > > 	}
> > > > 
> > > > Now consider the following code:
> > > > 
> > > > 	// Is this ok?
> > > > 	unsigned long *a, b;
> > > > 	memcpy(a, &b, sizeof(unsigned long));
> > > > 	if is_valid(b) {
> > > > 	    // do stuff
> > > > 	}
> > > 
> > > Why the hell would you want to write that? But sure. I think similar but
> > > less weird example would be with structures, where value copies end up
> > > being similar to memcpy.
> > 
> > I mean sure, let's say that it was a structure or whatever instead of a
> > long. The point is that the general pattern of memcpy, then checking the
> > bytes you copied, then use the bytes you copied, is potentially
> > susceptible to this exacty optimization.
> 
> > > And in that case, you can still use volatile and compiler must not do
> > > silly.
> > 
> > What you mean by "volatile" here is the same as what this patch means
> > when it says "per-byte atomic". If you agree that a "volatile memcpy"
> > would be a good idea to use in this scenario, then it sounds like you
> > agree with the patch except for its naming / terminology.
> 
>   struct foo {
>     int a, b;
>   };
> 
>   struct foo *ptr, val;
> 
>   val = *(volatile struct foo *)ptr;
> 
> why would we need a an explicit new memcpy for this?

In my experience with dealing with `struct page` that is mapped into a
vma, you need memcpy because the struct might be split across two
different pages in the vma. The pages are adjacent in userspace's
address space, but not necessarily adjacent from the kernel's POV.

So you might end up with something that looks like this:

struct foo val;
void *ptr1 = kmap_local_page(p1);
void *ptr2 = kmap_local_page(p2);
memcpy(ptr1 + offset, val, PAGE_SIZE - offset);
memcpy(ptr2, val + offset, sizeof(struct foo) - (PAGE_SIZE - offset));
kunmap_local(ptr2);
kunmap_local(ptr1);

if (is_valid(&val)) {
    // use val
}

This exact thing happens in Binder. It has to be a memcpy.

> > > So I'm still not exactly sure why this is a problem all of a sudden?
> > 
> > I mean, this is for `struct page` specifically. If you have the struct
> > page for a page that might also be mapped into a userspace vma, then the
> > way to perform a "copy_from_user" operation is to:
> > 
> > 1. kmap_local_page()
> > 2. memcpy()
> > 3. kunmap_local()
> > 
> > Correct me if I'm wrong, but my understanding is that on 64-bit systems,
> > kmap/kunmap are usually complete no-ops since you have enough address
> > space to simply map all pages into the kernel's address space. Not even
> > a barrier - just a `static inline` with an empty body.
> 
> That is all correct -- however that cannot be all you do.
> 
> Any shared memory will involved memory barriers of a sort. You cannot
> just memcpy() and think you're done.
> 
> So yeah, on x86_64 those 1,2,3 are insufficient to inhibit the re-load,
> but nobody should ever just do 1,2,3 and think job-done. There must
> always be more.
> 
> If it is a ring-buffer like thing, you get:
> 
>          *   if (LOAD ->data_tail) {            LOAD ->data_head
>          *                      (A)             smp_rmb()       (C)
>          *      STORE $data                     LOAD $data
>          *      smp_wmb()       (B)             smp_mb()        (D)
>          *      STORE ->data_head               STORE ->data_tail
>          *   }
> 
> if it is a seqlock like thing you get that.
> 
> If it is DMA, you need dma fences.
> 
> And the moment you use any of that, the re-load goes out the window.

I don't know how Andreas is using this, but the usage pattern I'm
familiar with for `struct page` from my work on Binder is this one:

1. memcpy into the page
2. return from ioctl
3. userspace reads from vma

or

1. userspace writes to vma
2. call ioctl
3. kernel reads from page

which needs no barriers whatsoever. There is nothing to prevent this
kind of optimization in this kind of code, so an evil userspace could
trigger TOCTOU bugs in the kernel that are not present in the source
code if the code was optimized like I described.

Alice
