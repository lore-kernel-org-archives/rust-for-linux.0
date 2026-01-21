Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FCD223DC0
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769000976; cv=none; b=LsFG7POTf1hOclWmNpMN4mIdyF4llTsk1ENq1FyWJxQH+OOG7bI0inbQuXg4cE7Eu3zeG5pdPuYurX92SEiFPaNxSdv/Gn3z1XVD/OyS08FLKpAVLpiGqxBSEAu+xr0UgZgKkwDRiZqt1udarzIwx3w2fmoT2boscPST7npSSVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769000976; c=relaxed/simple;
	bh=+ZSgzFr1hrskbYz2DqxBWD0sKH/BKI4m7f4BLrv9im8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YwrcF960v17dTq1769LpUiHAHJ/JGRrsGVH4/6Pfiw954CHoeZ6lNBXo8yGz73aP8uy6WIodKjAa0jS9Oq+ZJMqiMswjEeakKLJDpO5FxLus3brUu8yb5yZa96gOzDeqwRj80/sjrscyFPFqKdH79mJCKy+OvcbiV1SPYQdxvdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RgJJgEkL; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RgJJgEkL"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65820bba158so484207a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 05:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769000973; x=1769605773; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e6EfVFXbq2W0nAFcvfXqkhYP0i8qGUxUjSq0sP59zac=;
        b=RgJJgEkLdNg2xg9OxjnWiiLXUrsQ9PemGinQ9GYe3uglW/sg+H41N3dtqz//q8A8d0
         UeuYwiqOwnucTatXpga1MUyLkMrBYWjAI/0MR0+ajrUqy42DgtPCJ4fKTj+dprdAKHH2
         1k4t2K5kvSRKPuI1CG5obX5MDbfbkLJYSOUBne1aMtzi9tu7TjpqBcpNdDAW4CLx30Wb
         YDNvb+UujEiiEQj1kJvNjixY6oRwShJqIQVnXzEDIkPKF0G2Cy/rti57UeOMBZjlLu0D
         axFGGq78XKJRjDqn4u2OYBH+M21bH12F+nUIy8SeTgS3PEZfR9/7hZSALh4sg0nlA5I1
         VfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769000973; x=1769605773;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6EfVFXbq2W0nAFcvfXqkhYP0i8qGUxUjSq0sP59zac=;
        b=I0+C0mkYz2M9ggZ0vorKyPHyP1nX6yo0uKBQhAYmIPNyB8OSgOQgK56mxrVwKDuG1k
         arJr/nEKns62EwH0MTiCZT/TGLt9pC+WKlh3NXp0uY22I+XU1p4HS5JsC3biqh6dUOmX
         foDNyF111S8ac4UNOb2uf2Cbb/ekt4Gd6i4ws3YrlXDJ9DSkFhIKtGWhbtRXaIFn6Sgh
         wwWB8NTdERA23JW3TbPZmbFcUlm7aoQsvD5q6aMZ120fhx27xEF1mA/gvTHBYjrCR6AF
         5m4LIOiLlj7fZWrB5/NuVsWe6EYQ964Sfp6Jr84zTXhqPkTnV9+x2CMchJ1unq+7Tki1
         MRVg==
X-Forwarded-Encrypted: i=1; AJvYcCVJvk4MZYRJTjYqaQzIvVkuhT8JPZcee2MpXjMHKymWkqgn71xTsqsWOzndk/LJ+BF2MJX8NUJ2TwCRL8J+NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5f6eQvGFe/pSShJs1yewUn50g0EiZkgEs7uC5i9O6oOYCzXzo
	JE0+yVOjiB22yKaORVbfmLIFcL7LcmeluGyFp3vdT4yqOtID+tzozqsFIgIrvEKd+hxTCpQkKDA
	XiHTASqz6n6gSnIrK5g==
X-Received: from edrn25.prod.google.com ([2002:aa7:c459:0:b0:658:3f8:4209])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:51d4:b0:658:2e5d:cc1 with SMTP id 4fb4d7f45d1cf-6582e5d1110mr308806a12.21.1769000973476;
 Wed, 21 Jan 2026 05:09:33 -0800 (PST)
Date: Wed, 21 Jan 2026 13:09:32 +0000
In-Reply-To: <CANpmjNNpb7FE8usAhyZXxrVSTL8J00M4QyPUhKLmPNKfzqg=Ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120115207.55318-1-boqun.feng@gmail.com> <20260120115207.55318-3-boqun.feng@gmail.com>
 <aW-sGiEQg1mP6hHF@elver.google.com> <DFTKIA3DYRAV.18HDP8UCNC8NM@garyguo.net>
 <CANpmjNN=ug+TqKdeJu1qY-_-PUEeEGKW28VEMNSpChVLi8o--A@mail.gmail.com>
 <aW_rHVoiMm4ev0e8@tardis-2.local> <CANpmjNNpb7FE8usAhyZXxrVSTL8J00M4QyPUhKLmPNKfzqg=Ww@mail.gmail.com>
Message-ID: <aXDQDFjKnjOi7Pri@google.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers over
 raw pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 21, 2026 at 01:13:57PM +0100, Marco Elver wrote:
> On Tue, 20 Jan 2026 at 23:29, Boqun Feng <boqun.feng@gmail.com> wrote:
> [..]
> > > > > READ_ONCE is meant to be a dependency-ordering primitive, i.e. be more
> > > > > like memory_order_consume than it is memory_order_relaxed. This has, to
> > > > > the best of my knowledge, not changed; otherwise lots of kernel code
> > > > > would be broken.
> >
> > Our C's atomic_long_read() is the same, that is it's like
> > memory_order_consume instead memory_order_relaxed.
> 
> I see; so it's Rust's Atomic::load(Relaxed) -> atomic_read() ->
> READ_ONCE (for most architectures).
> 
> > > > On the Rust-side documentation we mentioned that `Relaxed` always preserve
> > > > dependency ordering, so yes, it is closer to `consume` in the C11 model.
> > >
> > > Alright, I missed this.
> > > Is this actually enforced, or like the C side's use of "volatile",
> > > relies on luck?
> > >
> >
> > I wouldn't call it luck ;-) but we rely on the same thing that C has:
> > implementing by using READ_ONCE().
> 
> It's the age-old problem of wanting dependently-ordered atomics, but
> no compiler actually providing that. Implementing that via "volatile"
> is unsound, and always has been. But that's nothing new.
> 
> [...]
> > > > I think this is a longstanding debate on whether we should actually depend on
> > > > dependency ordering or just upgrade everything needs it to acquire. But this
> > > > isn't really specific to Rust, and whatever is decided is global to the full
> > > > LKMM.
> > >
> > > Indeed, but the implementation on the C vs. Rust side differ
> > > substantially, so assuming it'll work on the Rust side just because
> > > "volatile" works more or less on the C side is a leap I wouldn't want
> > > to take in my codebase.
> > >
> >
> > Which part of the implementation is different between C and Rust? We
> > implement all Relaxed atomics in Rust the same way as C: using C's
> > READ_ONCE() and WRITE_ONCE().
> 
> I should clarify: Even if the source of the load is "volatile"
> (through atomic_read() FFI) and carries through to Rust code, the
> compilers, despite sharing LLVM as the code generator, are different
> enough that making the assumption just because it works on the C side,
> it'll also work on the Rust side, appears to be a stretch for me. Gary
> claimed that Rust is more conservative -- in the absence of any
> guarantees, being able to quantify the problem would be nice though.
> 
> [..]
> > > However, given "Relaxed" for the Rust side is already defined to
> > > "carry dependencies" then in isolation my original comment is moot and
> > > does not apply to this particular patch. At face value the promised
> > > semantics are ok, but the implementation (just like "volatile" for C)
> > > probably are not. But that appears to be beyond this patch, so feel
> >
> > Implementation-wise, READ_ONCE() is used the same as C for
> > atomic_read(), so Rust and C are on the same boat.
> 
> That's fair enough.
> 
> Longer term, I understand the need for claiming "it's all fine", but
> IMHO none of this is fine until compilers (both for C and Rust)
> promise the semantics that the LKMM wants. Nothing new per-se, the
> only new thing here that makes me anxious is that we do not understand
> the real impact of this lack of guarantee on Linux Rust code (the C
> side remains unclear, too, but has a lot more flight miles). Perhaps
> the work originally investigating broken dependency ordering in Clang,
> could be used to do a study on Rust in the kernel, too.

We did already have discussions with the Rust compiler folks about this
topic, and they said that they are comfortable with Rust doing the exact
same hacks as C since that should "work" in Rust for the same reasons it
"works" in C.

Alice
