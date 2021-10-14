Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32C3C433F5
	for <rust-for-linux@archiver.kernel.org>; Thu, 14 Oct 2021 08:03:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8C6E61040
	for <rust-for-linux@archiver.kernel.org>; Thu, 14 Oct 2021 08:03:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhJNIFy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 14 Oct 2021 04:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhJNIFx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 14 Oct 2021 04:05:53 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C01C061570
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Oct 2021 01:03:48 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e12so16665436wra.4
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Oct 2021 01:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BV9XBReTKJgN+fpn0BSQUuJER9rkUtY6+lZ+O932uv8=;
        b=Ug1zQHhbOatsR88vf5BLB8YiUkbzYm5xDaN8H2AuANNuxPHLlC4AK2V4HqeYMtXknc
         b4BpuqueoZHfkIvDgNH/ejsoqp9qcRnaKMRy+vvBobEiHFi6XGqwn46t4r0X1haPTQDt
         R/vd7Ciyyu3h6SYWNMmUFz0GiJzevRn74WOQuk0A5iglTNfJGNFx/j19s3rmVpjaaO9p
         /o/0A2NbCYMOtYwqxEb34pxriMnrRT8gp6GykL1neXsl06XY3cXosbWApRInWnerr5cr
         dUG4QmWo7THbMD/9LttgFuCEBs5WI2oqBZ93Bu6F5oM8oQFLa6+XWjjOaw9dQiuBA2e+
         sE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BV9XBReTKJgN+fpn0BSQUuJER9rkUtY6+lZ+O932uv8=;
        b=g4OcYjBdTimWBNuEuv086czyHVSrkRHui/44qlxAnKiPD8Oh5vRfXeC6RDb+olVGrD
         cTI86SfKSVC13mGRVj2rBQSO6tZApP8RvDWcxss84ERmGYwQZ2F78KT49cVz4QhyIS4/
         VwP/hMyopdylPnPxtXo65e1uZXhQ0fVCNo2XvyHXmXbTrYaZ1VS/8z3Ypzi07RRof6JX
         fNOVZHPkV1hbJrILOfEOV9vNhHffQkHFmJonfpoigaak8T2VNtcZxG2uuLbOxcWNCyif
         NChBlrVdgXbxuMYFi7TEevF4mW3apsIcnsp5Bbh5rWJVsfwuZkcH8tlOl6tB191PKT+m
         p49A==
X-Gm-Message-State: AOAM530pZ3nKlgj3rW+CtmqxydVO4f1DeEOGpZlpIj5aMWbfYhl3oust
        b9nBLE45UYbdnjMsnG5O+MXx
X-Google-Smtp-Source: ABdhPJwouwuV5ZtKUNIvcZ8mchsOdc2M9uynO2Bmo2XDPagdDSn3thJJFNneglMea37lcG4sYJrxDQ==
X-Received: by 2002:adf:a10f:: with SMTP id o15mr5051311wro.286.1634198626911;
        Thu, 14 Oct 2021 01:03:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:c85c:bd9:50ac:bc30])
        by smtp.gmail.com with ESMTPSA id k10sm1674730wrh.64.2021.10.14.01.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 01:03:46 -0700 (PDT)
Date:   Thu, 14 Oct 2021 09:03:42 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <YWfkXjHtVhZpg2+P@google.com>
References: <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
 <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
 <20211009235906.GY880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mj9x7a4mfzJo+pY8HOXAshqfhyEJMjs7F+qS-rJaaCeA@mail.gmail.com>
 <20211011190104.GI880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72ny0RCnO1+E_wBgx0C6NCaMfv82rvkLVuwmW8Y+7Kii0Q@mail.gmail.com>
 <20211013160707.GR880162@paulmck-ThinkPad-P17-Gen-1>
 <YWccYPLUOH7t9JtB@google.com>
 <20211014033557.GZ880162@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014033557.GZ880162@paulmck-ThinkPad-P17-Gen-1>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Oct 13, 2021 at 08:35:57PM -0700, Paul E. McKenney wrote:
> On Wed, Oct 13, 2021 at 06:50:24PM +0100, Wedson Almeida Filho wrote:
> > On Wed, Oct 13, 2021 at 09:07:07AM -0700, Paul E. McKenney wrote:
> > > On Wed, Oct 13, 2021 at 01:48:13PM +0200, Miguel Ojeda wrote:
> > > > On Mon, Oct 11, 2021 at 9:01 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > > >
> > > > > The main issue I was calling out was not justifying Rust, but rather
> > > > > making sure that the exact same build could be reproduced a decade later.
> > > > 
> > > > Yes, but that is quite trivial compared to other issues I was
> > > > mentioning like adapting and requalifying a testing tool. For
> > > > instance, if you already had a team maintaining the configuration
> > > > management (i.e. the versions etc.), adding one more tool is not a big
> > > > deal.
> > > 
> > > OK, close enough to fair enough.  ;-)
> > > 
> > > > > There are things that concurrent software would like to do that are
> > > > > made quite inconvenient due to large numbers of existing optimizations
> > > > > in the various compiler backends.  Yes, we have workarounds.  But I
> > > > > do not see how Rust is going to help with these inconveniences.
> > > > 
> > > > Sure, but C UB is unrelated to Rust UB. Thus, if you think it would be
> > > > valuable to be able to express particular algorithms in unsafe Rust,
> > > > then I would contact the Rust teams to let them know your needs --
> > > > perhaps we end up with something way better than C for that use case!
> > > 
> > > Sequence locks and RCU do seem to be posing some challenges.  I suppose
> > > this should not be too much of a surprise, given that there are people who
> > > have been in the Rust community for a long time who do understand both.
> > > If it were easy, they would have already come up with a solution.
> > 
> > (Hey Paul, I tried posting on your blog series, but I'm having difficulty so I
> > thought I'd reply here given that we mention seqlocks and RCU here.)
> 
> It should be straightforward to post a comment, but some report that
> their employers block livejournal.com.  :-/

I tried to use my google account while posting and then after I posted it took
me through some workflow to confirm my account, perhaps the comment was lost
during this workflow. Let me try again.

> Oh, and I have updated heavily recently, including adding a bunch of
> Linux-kernel use cases for both sequence locking and RCU.

I'll check it out, thanks!
 
> > I spent a bit of time thinking about sequence locks and I think I have something
> > that is workable. (I remind you that we use the C implementation for the
> > synchronisation primitives). Suppose we had some struct like so:
> > 
> > struct X {
> >     a: AtomicU32,
> >     b: AtomicU32,
> > }
> > 
> > And suppose we have it protected by a sequence lock. If we wanted to return the
> > sum of the two fields, the code would look like this:
> > 
> >     let v = y.access(|x| {
> >         let a = x.a.load(Ordering::Relaxed);
> > 	let b = x.b.load(Ordering::Relaxed);
> > 	a + b
> >     });
> > 
> > It would be expanded to the following machine code in aarch64 (when LTO is
> > enabled):
> > 
> >   403fd4:       14000002        b       403fdc
> >   403fd8:       d503203f        yield
> >   403fdc:       b9400808        ldr     w8, [x0, #8]
> >   403fe0:       3707ffc8        tbnz    w8, #0, 403fd8
> >   403fe4:       d50339bf        dmb     ishld
> >   403fe8:       b9400c09        ldr     w9, [x0, #12]
> >   403fec:       b940100a        ldr     w10, [x0, #16]
> >   403ff0:       d50339bf        dmb     ishld
> >   403ff4:       b940080b        ldr     w11, [x0, #8]
> >   403ff8:       6b08017f        cmp     w11, w8
> >   403ffc:       54ffff01        b.ne    403fdc
> >   404000:       0b090148        add     w8, w10, w9
> > 
> > It is as efficient as the C version, though not as ergonomic. The
> > .load(Ordering::Relaxed) can of course be improved to something shorter like
> > .load_relaxed() or even new atomic types  with .load() being relaxed and
> > .load_ordered(Ordering) for other ordering.
> 
> Nice!
> 
> Is this a native Rust sequence-lock implementation or a wrapper around
> the C-language Linux-kernel implementation?

It's a wrapper around the C-language Linux kernel implementation. (To get the
generated code with LTO inlining, I compiled the code in userspace because
LTO with cross-language inlining isn't enabled/working in the kernel yet).

> > I also have guard- and iterator-based methods for the read path that would look
> > like this (these can all co-exist if we so choose):
> > 
> >     let v = loop {
> >         let guard = y.read();
> >         let a = guard.a.load(Ordering::Relaxed);
> >         let b = guard.b.load(Ordering::Relaxed);
> >         if !guard.need_retry() {
> >             break a + b;
> >         }
> >     };
> > 
> > and
> > 
> >     let mut v = 0;
> >     for x in y {
> >         let a = x.a.load(Ordering::Relaxed);
> > 	let b = x.b.load(Ordering::Relaxed);
> > 	v = a + b;
> >     }
> > 
> > The former generates the exact same machine code as above though the latter
> > generates slightly worse code (it has instructions sequences like "mov w10,
> > #0x1; tbnz w10, #0, 403ffc" and , "mov w10, wzr; tbnz w10, #0, 403ffc", which
> > could be optimised but for some reason isn't).
> 
> The C++ bindings for RCU provide a similar guard approach, leveraging
> C++ BasicLock.  Explicit lock and unlock can be obtained using
> move-assignments.

I haven't seen these bindings, perhaps I should :) But one relevant point about
guards is that Rust has an affine type system that allows it to catch misuse of
guards at compile time. For example, if one wants to explicitly unlock, the
unlock method 'consumes' (move-assigns) the guard, rendering it unusable:
attempting to use such a guard is a compile-time error (even if it's in scope).
In C++, this wouldn't be caught at compile time as moved variables remain
accessible while in scope.

> > Anyway, on to the write path. We need another primitive to ensure that only one
> > writer at a time attempts to acquire the sequence lock in write mode. We do this
> > by taking a guard for this other lock, for example, suppose we want to increment
> > each of the fields:
> > 
> >     let other_guard = other_lock.lock();
> >     let guard = y.write(&other_guard);
> 
> The first acquires the lock in an RAII (scoped) fashion and the second
> enters the sequence-lock write-side critical section, correct?

Yes, exactly.

Additionally, the ownership rules guarantee that the outer lock cannot be
unlocked while in the sequence-lock write-side critical section (because the
inner guard borrows the outer one, so it can be only be consumed after this
borrow goes away). An attempt to do so would result in a compile-time error.

> 
> >     guard.a.store(guard.a.load(Ordering::Relaxed) + 1, Ordering::Relaxed);
> >     guard.b.store(guard.b.load(Ordering::Relaxed) + 1, Ordering::Relaxed);
> > 
> > The part the relates to the sequence lock is compiled to the following:
> > 
> >   404058:       f9400009        ldr     x9, [x0]
> >   40405c:       eb08013f        cmp     x9, x8
> >   404060:       54000281        b.ne    4040b0
> > 
> >   404064:       b9400808        ldr     w8, [x0, #8]
> >   404068:       11000508        add     w8, w8, #0x1
> >   40406c:       b9000808        str     w8, [x0, #8]
> >   404070:       d5033abf        dmb     ishst
> >   404074:       b9400c08        ldr     w8, [x0, #12]
> >   404078:       11000508        add     w8, w8, #0x1
> >   40407c:       b9000c08        str     w8, [x0, #12]
> >   404080:       b9401008        ldr     w8, [x0, #16]
> >   404084:       11000508        add     w8, w8, #0x1
> >   404088:       b9001008        str     w8, [x0, #16]
> >   40408c:       d5033abf        dmb     ishst
> >   404090:       b9400808        ldr     w8, [x0, #8]
> >   404094:       11000508        add     w8, w8, #0x1
> >   404098:       b9000808        str     w8, [x0, #8]
> > 
> > If we ignore the first three instructions momentarily, the rest is as efficient
> > as C. The reason we need the first three instructions is to ensure that guard
> > that was passed into the `write` function is a guard to the correct lock. The
> > lock type already eliminates the vast majority of issues, but a developer could
> > accidentally lock the wrong lock and use it in the sequence lock, which would be
> > problematic. So we need this check in Rust that we don't need in C (although the
> > same mistake could happen in C).
> > 
> > We can provide an 'unsafe' version that doesn't perform this check, then the
> > onus is on the callers to convince themselves that they have acquired the
> > correct lock (and they'd be required to use an unsafe block). Then the
> > performance would be the same as the C version.
> 
> The Linux-kernel C-language sequence counter (as opposed to the various
> flavors of sequence lock) assume that the caller has provided any needed
> mutual exclusion.

Yes, this actually uses sequence counters.

I suppose if we embed the locks ourselves like sequence locks do, we can wrap
such 'unsafe' blocks as part of the implementation and only expose safe
interfaces as efficient as C.

Do you happen to know the usage ratio between sequence counters vs sequence
locks (all flavours combined)? If the latter are used in the vast majority of
cases, I think it makes sense to do something similar in Rust.

> 
> > Now that I've presented how my proposal looks like from the PoV of a user,
> > here's its rationale: given that we only want one copy of the data and that
> > mutable references are always unique in the safe fragment of Rust, we can't (and
> > don't) return a mutable reference to what's protected by the sequence lock, we
> > always only allow shared access, even when the sequence lock is acquired in
> > write mode.
> > 
> > Then how does one change the fields? Interior mutability. In the examples above,
> > the fields are all atomic, so they can be changed with the `store` method. Any
> > type that provides interior mutability is suitable here.
> 
> OK, so following the approach of "marked accesses".

Yes.
 
> > If we need to use types with interior mutability, what's the point of the
> > sequence lock? The point is to allow a consistent view of the fields. In our
> > example, even though `a` and `b` are atomic, the sequence lock guarantees that
> > readers will get a consistent view of the values even though writers modify one
> > at a time.
> 
> Yes.
> 
> I suppose that the KCSAN ASSERT_EXCLUSIVE_WRITER() could be used on
> the sequence-lock update side to check for unwanted concurrency.

Yes, definitely!

> > Lastly, the fact we use a generic `Guard` as proof that a lock is held (for the
> > write path) means that we don't need to manually implement this for each
> > different lock we care about; any that implements the `Lock` trait can be used.
> > This is unlike the C code that uses fragile macros to generate code for
> > different types of locks (though the scenario is slightly different in that the
> > C code embeds a lock, which is also something we could do in Rust) -- the Rust
> > version uses generics, so it is type-checked by the compiler.
> 
> OK, so this is a standalone implementation of sequence locks in Rust,
> rather than something that could interoperate with the C-language
> sequence locks?

It's an implementation of sequence locks using C-language sequence counters.
Instead of embedding a lock for writer mutual exclusion, we require evidence
that some lock is in use. The idea was to be "flexible" and share locks, but if
most usage just embeds a lock, we may as well do something similar in Rust.

> Is "fragile macros" just the usual Rust denigration of the C preprocessor,
> or is there some specific vulnerability that you see in those macros?

I don't see any specific vulnerability. By fragile I meant that it's more error
prone to write "generic" code with macros than with compiler-supported generics.
 
> Of course, those macros could be used to automatically generate the
> wrappers.  Extract the macro invocations from the C source, and transform
> them to wrappers, perhaps using Rust macros somewhere along the way.

Sure, we could do something like that.

But given that we already wrap the C locks in Rust abstractions that implement a
common trait (interface), we can use Rust generics to leverage all locks without
the need for macros.

> > RCU pointers can be implemented with a similar technique in that read access is
> > protected by a 'global' RCU reader lock (and evidence of it being locked is
> > required to get read access), and writers require another lock to be held. The
> > only piece that I haven't thought through yet is how to ensure that pointers
> > that were exposed with RCU 'protection' cannot be freed before the grace period
> > has elapsed. But this is a discussion for another time.
> 
> Please note that it is quite important for Rust to use the RCU provided
> by the C-language part of the kernel.  Probably also for sequence locks,
> but splitting RCU reduces the effectiveness of its batching optimizations.

Agreed. We actually use the C implementation for all synchronisation primitives
(including ref-counting, which isn't technically a synchronisation primitive but
has subtle usage of barriers). What I mean by "implemented in Rust" is just the
abstractions leveraging Rust concepts to catch misuses earlier where possible.

> For at least some of the Linux kernel's RCU use cases, something like
> interior mutability may be required.  Whether those use cases show up
> in any Rust-language drivers I cannot say.  Other use cases would work
> well with RCU readers having read ownership of the non-pointer fields
> in each RCU-protected object.
> 
> Again, I did add rough descriptions of a few Linux-kernel RCU use cases.
> 
> > I'll send out the patches for what I describe above in the next couple of days.
> > 
> > Does any of the above help answer the questions you have about seqlocks in Rust?
> 
> Possibly at least some of them.  I suspect that there is still much to
> be learned on all sides, including learning about additional questions
> that need to be asked.

Fair point. We don't know quite yet if we've asked all the questions.

> Either way, thank you for your work on this!

Thanks for engaging with us, this is much appreciated.

Cheers,
-Wedson

> 
> 							Thanx, Paul
> 
> > Thanks,
> > -Wedson
> > 
> > > So the trick is to stage things so as to allow people time to work on
> > > these sorts of issues.
> > > 
> > > > In any case, Rust does not necessarily need to help there. What is
> > > > important is whether Rust helps writing the majority of the kernel
> > > > code. If we need to call into C or use inline assembly for certain
> > > > bits -- so be it.
> > > > 
> > > > > But to be fair, much again depends on exactly where Rust is to be applied
> > > > > in the kernel.  If a given Linux-kernel feature is not used where Rust
> > > > > needs to be applied, then there is no need to solve the corresponding
> > > > > issues.
> > > > 
> > > > Exactly.
> > > 
> > > Thank you for bearing with me.
> > > 
> > > I will respond to your other email later,.  but the focus on memory
> > > safety in particular instead of undefined behavior in general does help
> > > me quite a bit.
> > > 
> > > My next step is to create a "TL;DR: Memory-Model Recommendations" post
> > > that is more specific, with both short-term ("do what is easy") and
> > > long-term suggestions.
> > > 
> > > 							Thanx, Paul
