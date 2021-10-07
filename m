Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D84C433EF
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 22:30:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B78DC610A5
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 22:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236914AbhJGWcE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 18:32:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:58886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233370AbhJGWcE (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 18:32:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CA77610E6;
        Thu,  7 Oct 2021 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633645810;
        bh=JA1p6xEYc5PmNkkq0aTH5OtFhiJp3epW9Uog47wGHkM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=myPIN3IYs8GxQdnD6Lu1IPEwKD5WchZMklReW34lb2+xgOPuJFGpjhTx9JDb19cPO
         AlKf6A0TfdGvYT0P1QClhrN9y8PwXuSbdRtHxzR4JsQU6wa2JBBvVKciDKyXKUO09c
         3/5LLyO4xmKy6A56yihyaSHL7XpSMuDhHR5fDodtUZLRzsGjd/EmdFxFE5XtHZKBZq
         NX5zg7FN7lDNnkPOUWFt9dOxH5xBzoG+jv/qUALwVJqngZITjA1TBf2dWPtYFf+Zip
         JS57YrdnPSxZBd27IvBKRWCE81+NpeVg5vN4ksThyUrI4l8N36LS5smm2TXJ78hHlZ
         EZZ4ApLWI5eIA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 3D0A95C0870; Thu,  7 Oct 2021 15:30:10 -0700 (PDT)
Date:   Thu, 7 Oct 2021 15:30:10 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Gary Guo <gary@garyguo.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux>
 <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007224247.000073c5@garyguo.net>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Oct 07, 2021 at 10:42:47PM +0100, Gary Guo wrote:
> On Thu, 7 Oct 2021 11:50:29 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > I have updated https://paulmck.livejournal.com/64970.html accordingly
> > (and hopefully correctly), so thank you both!
> 
> The page writes:
> > ... and furthermore safe code can violate unsafe code's assumptions as
> > long as it is in the same module. For all I know, this last caveat
> > might also apply to unsafe code in other modules for kernels built
> > with link-time optimizations (LTO) enabled.
> 
> This is incorrect.
> 
> The statement "safe code can violate unsafe code's assumptions as long
> as it is in the same module" is true, but the "module" here means [Rust
> module](https://doc.rust-lang.org/reference/items/modules.html) not
> kernel module. Module is the encapsulation boundary in Rust, so code
> can access things defined in the same module without visibility checks.

Believe it or not, I actually understood that this had nothing to
do with a modprobe-style kernel module.  ;-)

For C/C++, I would have written "translation unit".  But my guess is that
"Rust module" would work better.

Thoughts?

> So take this file binding as an example,
> 
> 	struct File {
> 	    ptr: *mut bindings::file,
> 	}
> 
> 	impl File {
> 	    pub fn pos(&self) -> u64 {
> 	        unsafe { (*self.ptr).f_pos as u64 }
> 	    }
> 	}
> 
> The unsafe code assume ptr is valid. The default visibility is private,
> so code in other modules cannot modify ptr directly. But within the
> same module file.ptr can be accessed, so code within the same module
> can use an invalid ptr and invalidate assumption.
> 
> This is purely syntactical, and have nothing to do with code generation
> and LTO.
> 
> And this caveat could be easily be mitigated. In Rust-for-linux, these
> structs have type invariant comments, and we require a comment
> asserting that the invariant is upheld whenever these types are
> modified or created directly with struct expression.

And the definition of a module is constrained to be contained within a
given translation unit, correct?

But what prevents unsafe Rust code in one translation unit from violating
the assumptions of safe Rust code in another translation unit, Rust
modules notwithstanding?  Especially if that unsafe code contains a bug?

Finally, are you arguing that LTO cannot under any circumstances inflict a
bug in Rust unsafe code on Rust safe code in some other translation unit?
Or just that if there are no bugs in Rust code (either safe or unsafe),
that LTO cannot possibly introduce any?

							Thanx, Paul
