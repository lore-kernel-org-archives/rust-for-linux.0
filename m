Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA62328273
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325227; cv=none; b=pEXuz8NX/J9j2KzGoEUndrAFOJd2IDPUBw4T00MpRd277ebRmkzI+2kIzgQqXPpbna+KJvflYnNbSkP12eifpZ/iMkeN/A4DI4d22GWNo6FBmR9aiFm1lbd2jlwpkBYkKDpEb2Ad3aF+5qGQx2jvQDMU8NsERffOWe+cI/YfNJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325227; c=relaxed/simple;
	bh=iIDZ8wYtoubaj8kqL+AEw4oSHtNdqtihaQHKkOzTa+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uVsX6Bz5kBnvjjIHhE/hLP24L0qtjrLJVu5zjiszrA2trhX5je9Qi7y+/PmxsZykNTuTj8OXovzSHjkjXMHMzFLNo9haRKVFyNV5iFRXFRq1BuSZXpGDDUWclNL4RZo9WaPpwLPEhaP5G9Je7ZT42v7M81XKq39s8Ml2nvlYw24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yZ7c4XF8; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yZ7c4XF8"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65813cc7ef5so3093627a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 02:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771325225; x=1771930025; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0hJHRJh2R9794qv5CCWWuTbVzrBfeQJNewapWgpa6c=;
        b=yZ7c4XF8vP0c9i6pRQqgxe9/Rvn30dBzCoE7EOrKlso1CZ1+L2OH2Ts+6bev4HoJaz
         o6JqE/Mn8gMZhGhRnbXI/uFWfP+oDWrrJb4EA3anJFbrABylEK1NAe61PQWKtqRjIQ/m
         R/yqJSKSD6IHbFiGWY/GfEe9uHqmoPWi66q0EdKULwZv8hEj58hpAsZlxtutiowU/8AW
         HQ0nXByBfGhkI51Syu36AETOSmRDeuWy3jHniSt8NFmxXZMtcli78VXZTHGKNr3bz3M1
         sJMgGc6+P4/yfbU+U4kTjpdlti5SGNnPHKLif/JIUH6tgUpaaVLXv1sn1sxIWp8cGpbk
         tgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771325225; x=1771930025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0hJHRJh2R9794qv5CCWWuTbVzrBfeQJNewapWgpa6c=;
        b=N9B/lhpAARIPliRqY0yPva3DGsK+R0NKUikYH4FTw1zze/JDFXba8cCn2GoTRtFh5B
         nagJQJb3BsufBQ4P7Cc2UsO3YF5mdxKzSzDsgjIlpPZmGbU+twJFMxzFaOR9o1uIQ+9z
         Jr/vX/cilFglBJl+4IiQaeoXLbkcBbWEGugirrpIQbA9RRp76qcLu7IdhVbII9gAFCzq
         9cSI2Makej8smQ8uOQcFAxS9mmAVh2iiQSoioUqef2SCfuAe/F4Sv48tKTCz5yJGIq/K
         v1b2b7+2Xg8qso1Em4Qt+JAr91ejmY0ZdSUvBz0e/PjbPqE6JLkscoUgR1hh1c5OzX1r
         Q0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3ZBK9qyvEF2Bi7H9udNP9d6c2e9xAs9BMV5bHcEDAITML57a7wrv3toxUrjZb8B7Q2CdPCCifk/STFg+gJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxilaEnSX9q4KAdlOCzEdDN1sRzoqMDOK0RpYAP8wXEkiuG7tax
	O/+rChKz0owfaJ3r70kQChVhL02X3kgEkJU/IaTZwe+LdieQRXY2pvVW0hewwKqM4fGfZRrzwVZ
	RX32rBnBA0Gr8l2BgpQ==
X-Received: from edqz17.prod.google.com ([2002:aa7:d411:0:b0:65a:44ae:faa8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2549:b0:65a:3f4b:947b with SMTP id 4fb4d7f45d1cf-65bb112f4fcmr6725247a12.15.1771325224379;
 Tue, 17 Feb 2026 02:47:04 -0800 (PST)
Date: Tue, 17 Feb 2026 10:47:03 +0000
In-Reply-To: <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh> <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh> <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com> <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com> <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
Message-ID: <aZRHJ7pSzOHruPA2@google.com>
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

On Tue, Feb 17, 2026 at 11:25:57AM +0100, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 10:01:56AM +0000, Alice Ryhl wrote:
> > On Tue, Feb 17, 2026 at 10:45:15AM +0100, Peter Zijlstra wrote:
> > > On Tue, Feb 17, 2026 at 09:33:40AM +0000, Alice Ryhl wrote:
> > > > On Tue, Feb 17, 2026 at 10:13:48AM +0100, Peter Zijlstra wrote:
> > > > > On Fri, Feb 13, 2026 at 08:19:17AM -0800, Boqun Feng wrote:
> > > > > > Well, in standard C, technically memcpy() has the same problem as Rust's
> > > > > > `core::ptr::copy()` and `core::ptr::copy_nonoverlapping()`, i.e. they
> > > > > > are vulnerable to data races. Our in-kernel memcpy() on the other hand
> > > > > > doesn't have this problem. Why? Because it's volatile byte-wise atomic
> > > > > > per the implementation.
> > > > > 
> > > > > Look at arch/x86/lib/memcpy_64.S, plenty of movq variants there. Not
> > > > > byte-wise.
> > > > 
> > > > movq is a valid implementation of 8 byte-wise copies.
> > > > 
> > > > > Also, not a single atomic operation in sight.
> > > > 
> > > > Relaxed atomics are just mov ops.
> > > 
> > > They are not atomics at all.
> > 
> > Atomic loads and stores are just mov ops, right? Sure, RMW operations do
> > more complex stuff, but I'm pretty sure that relaxed atomic loads/stores
> > generally are compiled as mov ops.
> 
> Yeah, because they're not in fact atomic. I have, on various occasions,
> told people to not use atomic_t if all they end up doing is atomic_set()
> and atomic_read(). They're just loads and stores, nothing atomic about
> them.
> 
> They are just there to complete the interactions with the actual RmW
> operations.
> 
> > > Somewhere along the line 'atomic' seems to have lost any and all meaning
> > > :-(
> > > 
> > > It must be this C committee and their weasel speak for fear of reality
> > > that has infected everyone or somesuch.
> > > 
> > > Anyway, all you really want is a normal memcpy and somehow Rust cannot
> > > provide? WTF?!
> > 
> > Forget about Rust for a moment.
> > 
> > Consider this code:
> > 
> > 	// Is this ok?
> > 	unsigned long *a, b;
> > 	b = *a;
> > 	if is_valid(b) {
> > 	    // do stuff
> > 	}
> 
> Syntax error on is_valid(), need opening ( after if.

Oops, too much Rust for me :)

> > I can easily imagine that LLVM might optimize this into:
> > 
> > 	// Uh oh!
> > 	unsigned long *a, b;
> > 	b = *a;
> > 	if is_valid(*a) {  // <- this was "optimized"
> > 	    // do stuff
> > 	}
> 
> Well, compiler would not do anything, since it wouldn't compile :-) But
> sure, that is valid transform.
> 
> > the argument being that you used an ordinary load of `a`, so it can be
> > assumed that there are no concurrent writes, so both reads are
> > guaranteed to return the same value.
> > 
> > So if `a` might be concurrently modified, then we are unhappy.
> > 
> > Of course, if *a is replaced with an atomic load such as READ_ONCE(a) an
> > optimization would no longer occur.
> 
> Stop using atomic for this. Is not atomic.
> 
> Key here is volatile, that indicates value can change outside of scope
> and thus re-load is not valid. And I know C language people hates
> volatile, but there it is.

Well, don't complain to me about this. I sent a patch to add READ_ONCE()/
WRITE_ONCE() impls for Rust and was told to just use atomics instead,
see: https://lwn.net/Articles/1053142/

> > 	// OK!
> > 	unsigned long *a, b;
> > 	b = READ_ONCE(a);
> > 	if is_valid(b) {
> > 	    // do stuff
> > 	}
> > 
> > Now consider the following code:
> > 
> > 	// Is this ok?
> > 	unsigned long *a, b;
> > 	memcpy(a, &b, sizeof(unsigned long));
> > 	if is_valid(b) {
> > 	    // do stuff
> > 	}
> 
> Why the hell would you want to write that? But sure. I think similar but
> less weird example would be with structures, where value copies end up
> being similar to memcpy.

I mean sure, let's say that it was a structure or whatever instead of a
long. The point is that the general pattern of memcpy, then checking the
bytes you copied, then use the bytes you copied, is potentially
susceptible to this exacty optimization.

> And in that case, you can still use volatile and compiler must not do
> silly.

What you mean by "volatile" here is the same as what this patch means
when it says "per-byte atomic". If you agree that a "volatile memcpy"
would be a good idea to use in this scenario, then it sounds like you
agree with the patch except for its naming / terminology.

> > If LLVM understands the memcpy in the same way as how it understands
> > 
> > 	b = *a; // same as memcpy, right?
> > 
> > then by above discussion, the memcpy is not enough either. And Rust
> > documents that it may treat copy_nonoverlapping() in exactly that way,
> > which is why we want a memcpy where reading the values more than once is
> > not a permitted optimization. In most discussions of that topic, that's
> > called a per-byte atomic memcpy.
> > 
> > Does this optimization happen in the real world? I have no clue. I'd
> > rather not find out.
> 
> OK, but none of this has anything to do with atomic or byte-wise.
> 
> The whole byte-wise thing turns out to be about not allowing
> out-of-thin-air. Nothing should ever allow that.

It's not just about out-of-thin-air, it's also the kind of optimization
I mentioned.

> Anyway, normal userspace copies don't suffer this because accessing
> userspace has enough magical crap around it to inhibit this optimization
> in any case.
> 
> If its a shared mapping/DMA, you'd typically end up with barriers
> anyway, and those have a memory clobber on them which tell the compiler
> reloads aren't good.
> 
> So I'm still not exactly sure why this is a problem all of a sudden?

I mean, this is for `struct page` specifically. If you have the struct
page for a page that might also be mapped into a userspace vma, then the
way to perform a "copy_from_user" operation is to:

1. kmap_local_page()
2. memcpy()
3. kunmap_local()

Correct me if I'm wrong, but my understanding is that on 64-bit systems,
kmap/kunmap are usually complete no-ops since you have enough address
space to simply map all pages into the kernel's address space. Not even
a barrier - just a `static inline` with an empty body.

Alice
