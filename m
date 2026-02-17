Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323BE318EF8
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322520; cv=none; b=VsuUFKDszE4bR3DixMBJWIlPgM3YeB/e04aVeE/dbZj63t6kWflUSWU9HH74/GFABhJ+r9jTbYW3t7Lz4D8DGWZmrjHvEoDnWzIAzMTvi1hVlkYW6/tMGVPNykAIS39kmhep/ane6DLozSzl3ZmgR03N3Xy9O7JZyb00D2+UM6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322520; c=relaxed/simple;
	bh=JHYuYSV/cFIZxf2/DEW1DjRbihxvnkQSdsFFOvDNJ30=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=muL5iwjI73NcypB8qSFgmuAJlhfjC2+62Ckb5PViZviu9vRccnXh1a0lcwBeAdUfKkriMvnOKS8BsBCWYZfYSNlEY1hy6UCA2ywDN8Gg3vvdPDNrB2dwqm/nrn1L8VOpb0KvTBjFjIDf2b7WerLxrMx0jn6CcPeChMdWMSm+p10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kPfTFXY3; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kPfTFXY3"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43635708e98so2617040f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 02:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771322517; x=1771927317; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aVqzBedJl0e/SY5rTfSCMuageeXR/z0e1KuV2G9as6U=;
        b=kPfTFXY3mi6JCTjoGr4ErkaRmJ+ur1IexSRM1Qb9w4ysoSjk3fnBr5spwVzIj3/tv6
         acESPGFa7aNpDRITNFJNYBSqKio02yyRKtB2t8ToKABuuUCjtqSeRSWsUHKOISilXwNZ
         e1SEYeFhxlEgAHwI9UNkzE3bjC6NIK2hlMK6mzhPo/VCpgUZ7v65W0lmA5KXyqVAwOPw
         l8I0lBaaW1hFf9jbbIHJywBRPyfc/7+m0/I9eGVa/Th2FUv8AETG5qurEqUwN1mnCX58
         00P2Y4kGSa9QWXBfmymcWbNrhLdUjcQ3DFMYI6jzH2HVbZQ+Xxqe0fU9hIRXub5HU0Nw
         xLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771322517; x=1771927317;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVqzBedJl0e/SY5rTfSCMuageeXR/z0e1KuV2G9as6U=;
        b=I8trcDGnZbQqc7WBnq7BQH6KukgKt1TQNaYCGVoBz8vjBfIsg22nC+QqCaKMFx/DGh
         Oj6anyKdF6xaKg8y19Gp3/TLhb7bYoBG0rZAE72XL/FR9bnfqCPVNZq9ahR27PVKHyqs
         /Vm2+xYEbqb1uBoa/AJVOLpkKLGGf5IxXNqAOmu88PqSNP+hZhvmYsXS+W+eOCTsKXSg
         tqK2a559fqjS+HRNsOSV8ptuaJYyIpFIJgWAd1miNJA+F+KtJv5zu3pjSyFSv8NN6nkW
         w8D33ADQYl6745ZPAHjGaaq+RtGN/ZIyh5PmkQNtMso+rU+CpGtqonrAOLsJrFvkkEiS
         W2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2A9+TrZuRtslI1Ky8xtPG7cpAqse1Zp9BIHcVse9Fe+e23R9prGt9oDPZIopVEOfvBcoZGyvPNsYEDs1bRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/2wvYDDqT0/Mq5+9dc8ghJnCkgRGG+ShHFHzfmme5vMSE2R8
	i3y394Z0FID9WBYash3B/bodJFj9k0JPN6mlGOcQLVCA5oSi9/fOF99VqgWUNqqsYplQFXNh3ax
	DHD8lCuvLTY4Ow0dK6g==
X-Received: from wrbfa8.prod.google.com ([2002:a05:6000:2588:b0:435:bb92:9d28])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e7:0:b0:437:8f98:8c91 with SMTP id ffacd0b85a97d-4379db34172mr17645373f8f.3.1771322517142;
 Tue, 17 Feb 2026 02:01:57 -0800 (PST)
Date: Tue, 17 Feb 2026 10:01:56 +0000
In-Reply-To: <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2026021313-embody-deprive-9da5@gregkh> <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh> <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh> <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com> <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
Message-ID: <aZQ8lJJ-U_8j03Z4@google.com>
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

On Tue, Feb 17, 2026 at 10:45:15AM +0100, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 09:33:40AM +0000, Alice Ryhl wrote:
> > On Tue, Feb 17, 2026 at 10:13:48AM +0100, Peter Zijlstra wrote:
> > > On Fri, Feb 13, 2026 at 08:19:17AM -0800, Boqun Feng wrote:
> > > > Well, in standard C, technically memcpy() has the same problem as Rust's
> > > > `core::ptr::copy()` and `core::ptr::copy_nonoverlapping()`, i.e. they
> > > > are vulnerable to data races. Our in-kernel memcpy() on the other hand
> > > > doesn't have this problem. Why? Because it's volatile byte-wise atomic
> > > > per the implementation.
> > > 
> > > Look at arch/x86/lib/memcpy_64.S, plenty of movq variants there. Not
> > > byte-wise.
> > 
> > movq is a valid implementation of 8 byte-wise copies.
> > 
> > > Also, not a single atomic operation in sight.
> > 
> > Relaxed atomics are just mov ops.
> 
> They are not atomics at all.

Atomic loads and stores are just mov ops, right? Sure, RMW operations do
more complex stuff, but I'm pretty sure that relaxed atomic loads/stores
generally are compiled as mov ops.

> Somewhere along the line 'atomic' seems to have lost any and all meaning
> :-(
> 
> It must be this C committee and their weasel speak for fear of reality
> that has infected everyone or somesuch.
> 
> Anyway, all you really want is a normal memcpy and somehow Rust cannot
> provide? WTF?!

Forget about Rust for a moment.

Consider this code:

	// Is this ok?
	unsigned long *a, b;
	b = *a;
	if is_valid(b) {
	    // do stuff
	}

I can easily imagine that LLVM might optimize this into:

	// Uh oh!
	unsigned long *a, b;
	b = *a;
	if is_valid(*a) {  // <- this was "optimized"
	    // do stuff
	}

the argument being that you used an ordinary load of `a`, so it can be
assumed that there are no concurrent writes, so both reads are
guaranteed to return the same value.

So if `a` might be concurrently modified, then we are unhappy.

Of course, if *a is replaced with an atomic load such as READ_ONCE(a) an
optimization would no longer occur.

	// OK!
	unsigned long *a, b;
	b = READ_ONCE(a);
	if is_valid(b) {
	    // do stuff
	}

Now consider the following code:

	// Is this ok?
	unsigned long *a, b;
	memcpy(a, &b, sizeof(unsigned long));
	if is_valid(b) {
	    // do stuff
	}

If LLVM understands the memcpy in the same way as how it understands

	b = *a; // same as memcpy, right?

then by above discussion, the memcpy is not enough either. And Rust
documents that it may treat copy_nonoverlapping() in exactly that way,
which is why we want a memcpy where reading the values more than once is
not a permitted optimization. In most discussions of that topic, that's
called a per-byte atomic memcpy.

Does this optimization happen in the real world? I have no clue. I'd
rather not find out.

Alice
