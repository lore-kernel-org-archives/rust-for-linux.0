Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BA9C433F5
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 23:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30BC960FC1
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 23:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243836AbhJHX7l (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 8 Oct 2021 19:59:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:48874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243798AbhJHX7k (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 8 Oct 2021 19:59:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7DBB60F9E;
        Fri,  8 Oct 2021 23:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633737464;
        bh=lGldR/lYEhTf/xadlo+RSI+8V8Nmx0IX2SlGzCSxAHQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=pYnxhcbDKdpSn666AdUs69VS3uRcLPUBo7MUDOhUnIfwXJ2qQT4tL9dgzGmic1ttS
         Oxa5yNWOFCSqi/qpfuTOdEI0pDOA43z9vAQG045CMaBipieON/nCv4er++MkJZgawx
         1ZMzLmXhZskMt1zl+5Bq4kWcJtk4z0Ji6/1KZlc60Mb44Z2IKwSddDJqZtoVkLZpyh
         AP9JAsGaqe9nP/dkO0SE8vjRjDIREPDJhUCZuuXVIifyzrDsVU2QT0a9we8FT+b+x9
         MZGwKAvLLQ3408tOn0YarDd5qOfZNGfNAaxMtlfKXd3+XWjfd3gT5uDXjR9XEfzjX/
         7yv2Q2aszFx8w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 9AEA35C1E85; Fri,  8 Oct 2021 16:57:44 -0700 (PDT)
Date:   Fri, 8 Oct 2021 16:57:44 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1>
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
 <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Oct 08, 2021 at 09:53:34PM +0200, Miguel Ojeda wrote:
> On Fri, Oct 8, 2021 at 1:42 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > OK, I now have this:
> >
> >         Both the unsafe Rust code and the C code can interfere with Rust
> >         non-unsafe code, and furthermore safe code can violate unsafe
> >         code's assumptions as long as it is in the same module. However,
> >         please note that a Rust module is a syntactic construct vaguely
> >         resembling a C++ namespace, and has nothing to do with a kernel
> >         module or a translation unit.
> >
> > Is that better?
> 
> For someone new to Rust, I think the paragraph may be hard to make
> sense of, and there are several ways to read it.
> 
> For instance, safe code "can" violate unsafe code's assumptions in the
> same module, but then it just means the module is buggy/unsound.
> 
> But if we are talking about buggy/unsound modules, then even safe code
> outside the module may be able to violate the module's assumptions
> too.
> 
> Instead, it is easier to talk about what Rust aims to guarantee: that
> if libraries containing unsafe code are sound, then outside safe code
> cannot subvert them to introduce UB.
> 
> Thus it is a conditional promise. But it is a powerful one. The point
> is not that libraries may be subverted if there is a bug in them, but
> that they cannot be subverted if they are correct.

But some other library could have a wild-pointer bug in unsafe Rust code
or in C code, correct?  And such a bug could subvert a rather wide range
of code, including that of correct libraries, right?  If I am wrong,
please tell me what Rust is doing to provide the additional protection.

> As an example, take `std::vector` from C++. Correct usage of
> `std::vector` will not trigger UB (as long as `std::vector` is
> non-buggy). Rust aims to guarantee something extra: that even
> *incorrect* safe code using `Vec` will not be able to trigger UB (as
> long as `Vec` and other abstractions are non-buggy).
> 
> As you see, the condition "as long as X is non-buggy" remains. But
> that is OK -- it does not mean encapsulation is useless: it still
> allows to effectively contain UB.

I would like to believe that, but I have seen too many cases where
UB propagates far and wide.  :-(

> Put another way, C and C++ APIs are the trivial / reduced case for
> what Rust aims to guarantee. For instance, we can think of C++
> `std::vector` as a Rust type where every method is marked as `unsafe`.
> As such, Rust would be able to provide its guarantee vacuously --
> there are no safe APIs to call to begin with.

Believe me, I am not arguing that C code is safer than Rust code,
not even than Rust unsafe code.

> To be clear, this "incorrect" usage includes maliciously-written safe
> code. So it even has some merits as an "extra layer of protection"
> against Minnesota-style or "Underhanded C Contest"-style code (at
> least regarding vulnerabilities that exploit UB).

Except that all too many compiler writers are actively looking for more
UB to exploit.  So this would be a difficult moving target.

Let me see if I can summarize with a bit of interpretation...

1.	Rust modules are a pointless distraction here.	Unless you object,
	I will remove all mention of them from this blog series.

2.	Safe Rust code might have bugs, as might any other code.

	For example, even if Linux-kernel RCU were to somehow be rewritten
	into Rust with no unsafe code whatsoever, there is not a verifier
	alive today that is going to realize that changing the value of
	RCU_JIFFIES_FQS_DIV from 256 to (say) 16 is a really bad idea.
	Nevertheless, RCU's users would not likely suffer in silence
	after seeing the greatly extended RCU grace periods, which in
	some cases could result in OOMing the system.

3.	Correctly written unsafe Rust code defends itself (and the safe
	code invoking it) from misuse.  And presumably the same applies
	for wrappers written for C code, given that there is probably
	an "unsafe" lurking somewhere in such wrappers.

4.	Rust's safety properties are focused more on UB in particular
	than on bugs in general.

And one final thing to keep in mind...  If I turn this blog series into
a rosy hymn to Rust, nobody is going to believe it.  ;-)

							Thanx, Paul
