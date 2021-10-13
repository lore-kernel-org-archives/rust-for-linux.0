Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EED0C433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 17:51:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 767EE60FDA
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 17:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238198AbhJMRxd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Oct 2021 13:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238565AbhJMRxI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Oct 2021 13:53:08 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D427C061746
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Oct 2021 10:50:30 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r7so11041111wrc.10
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Oct 2021 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=52v6GxGe7wvzewDWq67IcYS7Vxmb6Nbwq6eBE/FcbdE=;
        b=qeaOU5WPjbAEGERo0xv5gpsZ3W9MBHRWUWB04j9l7hETUIrcKGy1sjOcVLfUFM6HHH
         f4K6i9XOtKCFUjEfvbTyppigDAQQ5HMKhgFKm9xeshxMH7HQJG8SOb0fE7qeY96MamlU
         /3pbKY1tqe+T4+qwkLhZzeEVdjSChYAZWZeVCvYfndPcc97F/yhcxFJ+tWMJaKI8i8le
         E0vx1dHiPLIfRyMd6AdpybQmPjQnS89tXBSuhxz3vQkLM8uk2ekf1Xas0afEDZofwIzN
         ntfMWflgLvLCaBpOp7pd9TqPU2Gzcfj3ivpC5wZ05fRCBPMYZL/jN4S7XK1lOlFCiLja
         uXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=52v6GxGe7wvzewDWq67IcYS7Vxmb6Nbwq6eBE/FcbdE=;
        b=e3u63SlwOeILYwN2dAlwVd/Cyap9CAb/6mJOMyoziM8MrkFDfSIbPcXMaN96n9xUP5
         MKwpgcRyyQrseEg7AtPqBC/1hyqIEzpW06I8vvz8bKTvd2msuKPgCQknmRngoOQSTXnc
         0HZkO1BHhouKzm69K3cUDyCf/Y4wn83TypSUofOVH4Lyooe32qPsap4DN7NW288NyjoQ
         923TRk5an2XHWRw88dPScwVAhhNaapcpT1/w34VFFlxxlQKix5sQtBImuRL47iclt4aD
         y8CZMVZ6DalkmoLTMhv9REgBQtT9pQZqI/C14LeyKY2ask7JFU3Y8GmnEile5o+gH6K0
         WaIw==
X-Gm-Message-State: AOAM531E4vEfRoZXGfvQeNaODAyEZSLeC7qV7l8gkHUR21OXWZlN3JcX
        iCI0SWTRGyOTlu6a5yCc9QX9
X-Google-Smtp-Source: ABdhPJwrwKCFQ0hYsuhFWFMC3twPkM375Kr7gvd8vScYo42AIGZ538Ti4ithVjyInT1dn/HZRXt3Kw==
X-Received: by 2002:a1c:14b:: with SMTP id 72mr14694962wmb.188.1634147428469;
        Wed, 13 Oct 2021 10:50:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:c85c:bd9:50ac:bc30])
        by smtp.gmail.com with ESMTPSA id z133sm6243363wmc.45.2021.10.13.10.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 10:50:28 -0700 (PDT)
Date:   Wed, 13 Oct 2021 18:50:24 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <YWccYPLUOH7t9JtB@google.com>
References: <20211008005958.0000125d@garyguo.net>
 <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
 <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
 <20211009235906.GY880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mj9x7a4mfzJo+pY8HOXAshqfhyEJMjs7F+qS-rJaaCeA@mail.gmail.com>
 <20211011190104.GI880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72ny0RCnO1+E_wBgx0C6NCaMfv82rvkLVuwmW8Y+7Kii0Q@mail.gmail.com>
 <20211013160707.GR880162@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013160707.GR880162@paulmck-ThinkPad-P17-Gen-1>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Oct 13, 2021 at 09:07:07AM -0700, Paul E. McKenney wrote:
> On Wed, Oct 13, 2021 at 01:48:13PM +0200, Miguel Ojeda wrote:
> > On Mon, Oct 11, 2021 at 9:01 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > The main issue I was calling out was not justifying Rust, but rather
> > > making sure that the exact same build could be reproduced a decade later.
> > 
> > Yes, but that is quite trivial compared to other issues I was
> > mentioning like adapting and requalifying a testing tool. For
> > instance, if you already had a team maintaining the configuration
> > management (i.e. the versions etc.), adding one more tool is not a big
> > deal.
> 
> OK, close enough to fair enough.  ;-)
> 
> > > There are things that concurrent software would like to do that are
> > > made quite inconvenient due to large numbers of existing optimizations
> > > in the various compiler backends.  Yes, we have workarounds.  But I
> > > do not see how Rust is going to help with these inconveniences.
> > 
> > Sure, but C UB is unrelated to Rust UB. Thus, if you think it would be
> > valuable to be able to express particular algorithms in unsafe Rust,
> > then I would contact the Rust teams to let them know your needs --
> > perhaps we end up with something way better than C for that use case!
> 
> Sequence locks and RCU do seem to be posing some challenges.  I suppose
> this should not be too much of a surprise, given that there are people who
> have been in the Rust community for a long time who do understand both.
> If it were easy, they would have already come up with a solution.

(Hey Paul, I tried posting on your blog series, but I'm having difficulty so I
thought I'd reply here given that we mention seqlocks and RCU here.)

I spent a bit of time thinking about sequence locks and I think I have something
that is workable. (I remind you that we use the C implementation for the
synchronisation primitives). Suppose we had some struct like so:

struct X {
    a: AtomicU32,
    b: AtomicU32,
}

And suppose we have it protected by a sequence lock. If we wanted to return the
sum of the two fields, the code would look like this:

    let v = y.access(|x| {
        let a = x.a.load(Ordering::Relaxed);
	let b = x.b.load(Ordering::Relaxed);
	a + b
    });

It would be expanded to the following machine code in aarch64 (when LTO is
enabled):

  403fd4:       14000002        b       403fdc
  403fd8:       d503203f        yield
  403fdc:       b9400808        ldr     w8, [x0, #8]
  403fe0:       3707ffc8        tbnz    w8, #0, 403fd8
  403fe4:       d50339bf        dmb     ishld
  403fe8:       b9400c09        ldr     w9, [x0, #12]
  403fec:       b940100a        ldr     w10, [x0, #16]
  403ff0:       d50339bf        dmb     ishld
  403ff4:       b940080b        ldr     w11, [x0, #8]
  403ff8:       6b08017f        cmp     w11, w8
  403ffc:       54ffff01        b.ne    403fdc
  404000:       0b090148        add     w8, w10, w9

It is as efficient as the C version, though not as ergonomic. The
.load(Ordering::Relaxed) can of course be improved to something shorter like
.load_relaxed() or even new atomic types  with .load() being relaxed and
.load_ordered(Ordering) for other ordering.

I also have guard- and iterator-based methods for the read path that would look
like this (these can all co-exist if we so choose):

    let v = loop {
        let guard = y.read();
        let a = guard.a.load(Ordering::Relaxed);
        let b = guard.b.load(Ordering::Relaxed);
        if !guard.need_retry() {
            break a + b;
        }
    };

and

    let mut v = 0;
    for x in y {
        let a = x.a.load(Ordering::Relaxed);
	let b = x.b.load(Ordering::Relaxed);
	v = a + b;
    }

The former generates the exact same machine code as above though the latter
generates slightly worse code (it has instructions sequences like "mov w10,
#0x1; tbnz w10, #0, 403ffc" and , "mov w10, wzr; tbnz w10, #0, 403ffc", which
could be optimised but for some reason isn't).

Anyway, on to the write path. We need another primitive to ensure that only one
writer at a time attempts to acquire the sequence lock in write mode. We do this
by taking a guard for this other lock, for example, suppose we want to increment
each of the fields:

    let other_guard = other_lock.lock();
    let guard = y.write(&other_guard);
    guard.a.store(guard.a.load(Ordering::Relaxed) + 1, Ordering::Relaxed);
    guard.b.store(guard.b.load(Ordering::Relaxed) + 1, Ordering::Relaxed);

The part the relates to the sequence lock is compiled to the following:

  404058:       f9400009        ldr     x9, [x0]
  40405c:       eb08013f        cmp     x9, x8
  404060:       54000281        b.ne    4040b0

  404064:       b9400808        ldr     w8, [x0, #8]
  404068:       11000508        add     w8, w8, #0x1
  40406c:       b9000808        str     w8, [x0, #8]
  404070:       d5033abf        dmb     ishst
  404074:       b9400c08        ldr     w8, [x0, #12]
  404078:       11000508        add     w8, w8, #0x1
  40407c:       b9000c08        str     w8, [x0, #12]
  404080:       b9401008        ldr     w8, [x0, #16]
  404084:       11000508        add     w8, w8, #0x1
  404088:       b9001008        str     w8, [x0, #16]
  40408c:       d5033abf        dmb     ishst
  404090:       b9400808        ldr     w8, [x0, #8]
  404094:       11000508        add     w8, w8, #0x1
  404098:       b9000808        str     w8, [x0, #8]

If we ignore the first three instructions momentarily, the rest is as efficient
as C. The reason we need the first three instructions is to ensure that guard
that was passed into the `write` function is a guard to the correct lock. The
lock type already eliminates the vast majority of issues, but a developer could
accidentally lock the wrong lock and use it in the sequence lock, which would be
problematic. So we need this check in Rust that we don't need in C (although the
same mistake could happen in C).

We can provide an 'unsafe' version that doesn't perform this check, then the
onus is on the callers to convince themselves that they have acquired the
correct lock (and they'd be required to use an unsafe block). Then the
performance would be the same as the C version.

Now that I've presented how my proposal looks like from the PoV of a user,
here's its rationale: given that we only want one copy of the data and that
mutable references are always unique in the safe fragment of Rust, we can't (and
don't) return a mutable reference to what's protected by the sequence lock, we
always only allow shared access, even when the sequence lock is acquired in
write mode.

Then how does one change the fields? Interior mutability. In the examples above,
the fields are all atomic, so they can be changed with the `store` method. Any
type that provides interior mutability is suitable here.

If we need to use types with interior mutability, what's the point of the
sequence lock? The point is to allow a consistent view of the fields. In our
example, even though `a` and `b` are atomic, the sequence lock guarantees that
readers will get a consistent view of the values even though writers modify one
at a time.

Lastly, the fact we use a generic `Guard` as proof that a lock is held (for the
write path) means that we don't need to manually implement this for each
different lock we care about; any that implements the `Lock` trait can be used.
This is unlike the C code that uses fragile macros to generate code for
different types of locks (though the scenario is slightly different in that the
C code embeds a lock, which is also something we could do in Rust) -- the Rust
version uses generics, so it is type-checked by the compiler.

RCU pointers can be implemented with a similar technique in that read access is
protected by a 'global' RCU reader lock (and evidence of it being locked is
required to get read access), and writers require another lock to be held. The
only piece that I haven't thought through yet is how to ensure that pointers
that were exposed with RCU 'protection' cannot be freed before the grace period
has elapsed. But this is a discussion for another time.

I'll send out the patches for what I describe above in the next couple of days.

Does any of the above help answer the questions you have about seqlocks in Rust?

Thanks,
-Wedson

> So the trick is to stage things so as to allow people time to work on
> these sorts of issues.
> 
> > In any case, Rust does not necessarily need to help there. What is
> > important is whether Rust helps writing the majority of the kernel
> > code. If we need to call into C or use inline assembly for certain
> > bits -- so be it.
> > 
> > > But to be fair, much again depends on exactly where Rust is to be applied
> > > in the kernel.  If a given Linux-kernel feature is not used where Rust
> > > needs to be applied, then there is no need to solve the corresponding
> > > issues.
> > 
> > Exactly.
> 
> Thank you for bearing with me.
> 
> I will respond to your other email later,.  but the focus on memory
> safety in particular instead of undefined behavior in general does help
> me quite a bit.
> 
> My next step is to create a "TL;DR: Memory-Model Recommendations" post
> that is more specific, with both short-term ("do what is easy") and
> long-term suggestions.
> 
> 							Thanx, Paul
