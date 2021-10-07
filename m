Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D279C433EF
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 23:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2BD860FD8
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 23:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbhJGXom (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 19:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229778AbhJGXol (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 19:44:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43F906128C;
        Thu,  7 Oct 2021 23:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633650167;
        bh=h8MKDRb/H5oGPylMUikxB350wWoIdOzX/KXgytHNkZA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=MGYwZGwWMTqeJWeiuaQX+DFlWIsalTyPmZemwvCkPnYz+0KSm9+ITuBS7/KGraTpk
         cXAxRlRDrT4Ok9O32BF0HrHxnNGPUMZBGbdV6cRz/YKOHCjcUU55+L+xZH+RP2EoaU
         U8CoroAkqNnMZeDQ8RkP8t2Xict5HKiuoIQsM5aVLr6v0oSSoGRFi8RjPptlFdzsWi
         8Q7zdkYsdkxye+14I0oI6+hQVWt3Y3tiXX0ncWD1ct3mWR/VoshKvecr5zprul5vbx
         zP/cZmOx2s14zZUt2xb6n3eLS2aRCx/+hNR9OFYdSgQjoic5+TzG4rhEt7M1mEmEXs
         QjTb+cQ3NtcCw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 12EEC5C0870; Thu,  7 Oct 2021 16:42:47 -0700 (PDT)
Date:   Thu, 7 Oct 2021 16:42:47 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Gary Guo <gary@garyguo.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux>
 <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008000601.00000ba1@garyguo.net>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Oct 08, 2021 at 12:06:01AM +0100, Gary Guo wrote:
> On Thu, 7 Oct 2021 15:30:10 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > For C/C++, I would have written "translation unit".  But my guess is
> > that "Rust module" would work better.
> > 
> > Thoughts?
> 
> Module is not a translation unit in Rust, it is more like C++
> namespaces. The translation unit equivalent in Rust is crate.
> 
> > And the definition of a module is constrained to be contained within a
> > given translation unit, correct?
> 
> Correct.

OK, I now have this:

	Both the unsafe Rust code and the C code can interfere with Rust
	non-unsafe code, and furthermore safe code can violate unsafe
	code's assumptions as long as it is in the same module. However,
	please note that a Rust module is a syntactic construct vaguely
	resembling a C++ namespace, and has nothing to do with a kernel
	module or a translation unit.

Is that better?

> > But what prevents unsafe Rust code in one translation unit from
> > violating the assumptions of safe Rust code in another translation
> > unit, Rust modules notwithstanding?  Especially if that unsafe code
> > contains a bug?
> 
> Unsafe code obviously can do all sorts of crazy things and hence
> they're unsafe :)
> 
> However your article is talking about "safe code can violate unsafe
> code's assumptions" and this would only apply if they are in the same
> Rust module.

Understood.  I was instead double-checking the first clause of that
first sentence quoted above.

> When one writes a safe abstraction using unsafe code they need to prove
> that the usage is correct. Most properties used to construct such a
> proof would be a local type invariant (like `ptr` being a valid,
> non-null pointer in `File` example).
> 
> Sometimes the code may rely on invariants of a foreign type that it
> depends on (e.g. If I have a `ptr: NonNull<bindings::file>` then I
> would expect `ptr.as_ptr()` to be non-null, and `as_ptr` is indeed
> implemented in Rust's libcore as safe code. But safe code of a
> *downstream* crate cannot violate upstream unsafe code's assumption.

OK, thank you.

> > Finally, are you arguing that LTO cannot under any circumstances
> > inflict a bug in Rust unsafe code on Rust safe code in some other
> > translation unit? Or just that if there are no bugs in Rust code
> > (either safe or unsafe), that LTO cannot possibly introduce any?
> 
> I don't see why LTO is significant in the argument. Doing LTO or not
> wouldn't change the number of bugs. It could make a bug more or less
> visible, but buggy code remains buggy and bug-free code remains
> bug-free.
> 
> If I have expose a safe `invoke_ub` function in a translation unit that
> internally causes UB using unsafe code, and have another
> all-safe-code crate calling it, then the whole program has UB
> regardless LTO is enabled or not.

Here is the problem we face.  The least buggy project I know of was a
single-threaded safety-critical project that was subjected to stringent
code-style constraints and heavy-duty formal verification.  There was
also a testing phase at the end of the validation process, but any failure
detected by the test was considered to be a critical bug not only against
the software under test, but also against the formal verification phase.

The results were impressive, coming in at about 0.04 bugs per thousand
lines of code (KLoC), that is, about one bug per 25,000 lines of code.

But that is still way more than zero bugs.  And I seriously doubt that
Rust will be anywhere near this level.

A more typical bug rate is about 1-3 bugs per KLoC.

Suppose Rust geometrically splits the difference between the better
end of typical experience (1 bug per KLoC) and that safety-critical
project (again, 0.04 bugs per KLoC), that is to say 0.2 bugs per KLoC.
(The arithmetic mean would give 0.52 bugs per KLoC, so I am being
Rust-optimistic here.)

In a project the size of the Linux kernel, that still works out to some
thousands of bugs.

So in the context of the Linux kernel, the propagation of bugs will still
be important, even if the entire kernel were to be converted to Rust.

							Thanx, Paul
