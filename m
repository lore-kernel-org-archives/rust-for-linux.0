Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919A4C433EF
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 17:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66EEA6101A
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 17:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhJHRmp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 8 Oct 2021 13:42:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:39612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231234AbhJHRmo (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 8 Oct 2021 13:42:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCA6160FE8;
        Fri,  8 Oct 2021 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633714848;
        bh=QYLcjNKxLdwESZr/jjCOqoVUsE0zN/n1DYbbhSlw4jI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=o566nqtW/eMyms+8VHSHoFuOP/j+9dCaymrwD6u9lAMC43T0MWfXyHEsYn2cm9i2c
         ZWBOX46H9VLARi7DJ9FfiF7zKw8PtbWTdKA+LV5ZhpeWsR7dFYRwQB6NC/NTvj0oKT
         qhvts6B6fTmut+vxAvHChZk+ZDUyWW3W5zYWyeQLWd6CPRPA5AMwa2sudY8EpINr3U
         CY41n5We7CyRLCuvnFE35HiHSsF+eJze6U1iOconVpcrMBErJ2DAynKRGTfRattU4Z
         CJ/OS6ZY1fAji3Ih66rDRGDTGvOq5GudXK2/PscqIewpw+nlmscAA3YB5mC5xSnrLn
         jNxUaotBAJbaQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 9E0FA5C0AD6; Fri,  8 Oct 2021 10:40:48 -0700 (PDT)
Date:   Fri, 8 Oct 2021 10:40:48 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Gary Guo <gary@garyguo.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux>
 <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008005958.0000125d@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008005958.0000125d@garyguo.net>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Oct 08, 2021 at 12:59:58AM +0100, Gary Guo wrote:
> On Thu, 7 Oct 2021 16:42:47 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > > I don't see why LTO is significant in the argument. Doing LTO or not
> > > wouldn't change the number of bugs. It could make a bug more or less
> > > visible, but buggy code remains buggy and bug-free code remains
> > > bug-free.
> > > 
> > > If I have expose a safe `invoke_ub` function in a translation unit
> > > that internally causes UB using unsafe code, and have another
> > > all-safe-code crate calling it, then the whole program has UB
> > > regardless LTO is enabled or not.  
> > 
> > Here is the problem we face.  The least buggy project I know of was a
> > single-threaded safety-critical project that was subjected to
> > stringent code-style constraints and heavy-duty formal verification.
> > There was also a testing phase at the end of the validation process,
> > but any failure detected by the test was considered to be a critical
> > bug not only against the software under test, but also against the
> > formal verification phase.
> > 
> > The results were impressive, coming in at about 0.04 bugs per thousand
> > lines of code (KLoC), that is, about one bug per 25,000 lines of code.
> > 
> > But that is still way more than zero bugs.  And I seriously doubt that
> > Rust will be anywhere near this level.
> > 
> > A more typical bug rate is about 1-3 bugs per KLoC.
> > 
> > Suppose Rust geometrically splits the difference between the better
> > end of typical experience (1 bug per KLoC) and that safety-critical
> > project (again, 0.04 bugs per KLoC), that is to say 0.2 bugs per KLoC.
> > (The arithmetic mean would give 0.52 bugs per KLoC, so I am being
> > Rust-optimistic here.)
> > 
> > In a project the size of the Linux kernel, that still works out to
> > some thousands of bugs.
> > 
> > So in the context of the Linux kernel, the propagation of bugs will
> > still be important, even if the entire kernel were to be converted to
> > Rust.
> 
> There is a distinction between what is considered safe in Rust and what
> is considered safe in safety-critical systems. Miguel's LPC talk
> (https://youtu.be/ORwYx5_zmZo?t=1749) summarizes this really well. A
> large Rust program would no doubt contain bugs, but it is quite
> possible that it's UB-free.

The only purpose of my above wall of text was to assert that, as you
said, "A large Rust program would no doubt contain bugs", so we are
good on that point.

Just in case there is lingering confusion, my purpose in providing an
example from the field of safety-critical systems was nothing more or
less than to derive an extreme lower bound for the expected bug rate in
production software.  Believe me, there is no way that I am advocating
use of Rust as it currently exists for use in safety-critical systems!
Not that this will necessarily prevent such use, mind you!  ;-)

OK, on to your point about UB-freedom.

From what I have seen, people prevent unsafe Rust code from introducing
UB by adding things, for example assertions and proofs of correctness.
Each and every one of those added things have a non-zero probability
of themselves containing bugs or mistakes.  Therefore, a Rust program
containing a sufficiently large quantity of unsafe code will with high
probability invoke UB.

Hopefully, a much lower UB-invocation probability than a similar quantity
of C code, but nevertheless, a decidedly non-zero probability.

So what am I missing here?

> I should probably say that doing LTO or not wouldn't make a UB-free
> program exhibit UB (assuming LLVM doesn't introduce any during LTO).

I defer to comex's reply to this.

							Thanx, Paul
