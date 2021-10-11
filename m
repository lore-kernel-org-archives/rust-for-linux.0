Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E90C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Oct 2021 00:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5004C60EE7
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Oct 2021 00:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbhJKBBL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 10 Oct 2021 21:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbhJKBBL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 10 Oct 2021 21:01:11 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FE8C061570
        for <rust-for-linux@vger.kernel.org>; Sun, 10 Oct 2021 17:59:11 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id b10so2871858iof.12
        for <rust-for-linux@vger.kernel.org>; Sun, 10 Oct 2021 17:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kg1lM2jGKX12em01lUkwgIGQjeOxXQjzNmMLAv0o5ho=;
        b=WER49xjJbYc0EVr2Q4TwGU2I1sq77ZdVxXr2QLoYrNMvuFm+j1eiUZhA8oHm4PsXC/
         ad5CEjJcx0WEmlqTH0RpX+Wzqf+lpTD1QOm950Kw/JFiuZBgjZ2iL42if3fSCy+1+J3H
         PJ/XyGPf6TVrS4WyVIaXrULQoABeMpzkxfnkF5qBG1SJfjVR/m1914pwnzsHLSwX4GRM
         HA5PD2rYB8EyX07fX94BDzmODkbQ4Z9GAqi4FXhn5POLkqPk3Do5LgLB79gK0hFKqZ6k
         ltooclIGCbpDCH3o/QGNh5FpSCTualPdknVKlqCBICIM8AZSZjeV2h4T8Dk+0ltfCPEj
         7d1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kg1lM2jGKX12em01lUkwgIGQjeOxXQjzNmMLAv0o5ho=;
        b=r/wC8Wew3DFPm8BBv/UqFW/LFV8Xp3VT6I0gQXs+ew50SGa0JpsFJC7YbVDvO/BLjU
         lEkWLtbdSzbFwphAmZgRPZwDxZrIL7F0dGC5kWWv5aaYbubkOuFunyCeC6OZqGlEycm7
         o3T4Y1zIxDobdgeoiwRz5DHtj84ErYZSMhm9gwR6RWnO3qjPreDe1cDx/ueklVw4qX/D
         7IauFW6IjijIp6N3RvFYcuZdELDkPbNy61ZlCrfBNRZi55seHjdZPzhBaFR7USQQPvSZ
         4HeJCcjocLsu89GXiL0kwmEgc8zUGBs1qbayduhR9ojksBOvchavoPt4Rj5zEYx8re6T
         CijA==
X-Gm-Message-State: AOAM531VZmUlpmZrald/RatpMZzxFPEE9przZor99wZoqO5GlZzkIHKb
        +yhdfALNU6QNy3lhawug8Vt9RCGUKY4SaVYUKDfD2tt0LtvrCf95
X-Google-Smtp-Source: ABdhPJw887BgYVtEIEYVpyPgOe+oeyYX2S3H6XtC/mZzRYrnHHcc4YWpE6Y1pXeL51NKtihIzosTJYpWeyXGjO8dOyg=
X-Received: by 2002:a05:6638:14d0:: with SMTP id l16mr16766540jak.142.1633913951248;
 Sun, 10 Oct 2021 17:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1> <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1> <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
 <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
 <20211009234834.GX880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211009234834.GX880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 11 Oct 2021 02:59:00 +0200
Message-ID: <CANiq72=uPFMbp+270O5zTS7vb8xJLNYvYXdyx2Xsz5+3-JATLw@mail.gmail.com>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Oct 10, 2021 at 1:48 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> As long as a significant number of compiler writers evaluate themselves by
> improved optimization, they will be working hard to create additional UB
> opportunities.  From what you say above, their doing so has the potential

Compiler writers definitely try to take advantage of as much UB as
possible to improve optimization, but I would not call that creating
additional UB opportunities. The opportunities are already there,
created by the standards/committees in the case of C and the
RFCs/teams in the case of unsafe Rust.

Of course, compiler writers may be stretching too much the intention
and/or ambiguities, and there is the whole discussion about whether UB
was/is supposed to allow unbounded consequences which WG14 is
discussing in the recently created UBSG.

But I touch on this to emphasize that, even in unsafe Rust, compiler
writers are not completely free to do whatever they want (even if they
completely disregarded their users and existing code bases) and that
C/unsafe Rust also share part of the responsibility (as languages) to
define clearly what is allowed and what is not. So unsafe Rust is in a
similar position to C here (though not equal).

> to generate bugs in the Rust compiler.  Suppose this happens ten years

I am not sure what you mean by bugs in the Rust compiler. If the
compiler is following what unsafe Rust designers asked for, then it
wouldn't be a bug. Whether those semantics are what we want as users,
of course, is a different matter, but we should talk in that case with
the language people (see the previous point).

> from now.  Do you propose to force rework not just the compiler, but
> large quantities of Rust code that might have been written by that time?

No, but I am not sure where you are coming from.

If your concern is that the unsafe Rust code we write today in the
kernel may be broken in 10 years because the language changed the
semantics, then this is a real concern if we are writing unsafe code
that relies on yet-to-be-defined semantics. Of course, we should avoid
doing that just yet. This is why I hope to see more work on the Rust
reference etc. -- an independent implementation like the upcoming GCC
Rust may prove very useful for this.

Now, even if we do use subtle semantics that may not be clear yet,
upstream Rust should not be happy to break the kernel (just like ISO C
and GCC/Clang should not be). At least, they seem quite careful about
this. For instance, when they consider it a need, upstream Rust
compiles and/or runs the tests of huge amounts of open source
libraries out there [1] e.g. [2]. It would be ideal to have the kernel
integrated into those "crater runs" even if we are not a normal crate.

[1] https://rustc-dev-guide.rust-lang.org/tests/intro.html#crater
[2] https://crater-reports.s3.amazonaws.com/beta-1.56-1/index.html

> The thing is that you have still not convinced me that UB is all that
> separate of a category from logic bugs, especially given that either
> can generate the other.

Logic bugs in safe Rust cannot trigger UB as long as those conditions
we discussed apply. Thus, in that sense, they are separate in Rust.

But even in C, we can see it from the angle that triggering UB means
the compiler output cannot be "trusted" anymore (assuming we use the
definition of UB that compiler writers like to use but that not
everybody in the committee agrees with). While with logic bugs, even
with optimizations applied, the output still has to be consistent with
the input (in terms of observable behavior). For instance, the
compiler returning -38 here (https://godbolt.org/z/Pa8TWjY9a):

    int f(void) {
        const unsigned char s = 42;
        _Bool d;
        memcpy(&d, &s, 1);
        return d ? 3 : 4;
    }

The distinction is also useful in order to discuss vulnerabilities:
about ~70% of them come from UB-related issues [1][2][3][4].

[1] https://msrc-blog.microsoft.com/2019/07/18/we-need-a-safer-systems-programming-language/
[2] https://langui.sh/2019/07/23/apple-memory-safety/
[3] https://www.chromium.org/Home/chromium-security/memory-safety
[4] https://security.googleblog.com/2019/05/queue-hardening-enhancements.html

> Hence the Rust-unsafe wrappering for C code, presumably.

Yes, the wrapping uses unsafe code to call the C bindings, but the
wrapper may expose a safe interface to the users.

That wrapping is what we call "abstractions". In our approach, drivers
should only ever call the abstractions, never interacting with the C
bindings directly.

Wrapping things also allows us to leverage Rust features to provide
better APIs compared to using C APIs. For instance, using `Result`
everywhere to represent success/failure.

> This focus on UB surprises me.  Unless the goal is mainly comfort for
> compiler writers looking for more UB to "optimize".  ;-)

I could have been clearer: what I meant is that "safety" in Rust (as a
concept) is related to UB. So safety in Rust "focuses" on UB.

But Rust also focuses on "safety" in a more general sense about
preventing all kinds of bugs, and is a significant improvement over C
in this regard, removing some classes of errors.

For instance, in the previous point, I mention `Result` -- using it
statically avoids forgetting to handle errors, as well as mistakes due
to confusion over error encoding.

> It will be interesting to see how the experiment plays out.  And to
> be sure, part of my skepticism is the fact that UB is rarely (if ever)
> the cause of my Linux-kernel RCU bugs.  But the other option that the

Safe/UB-related Rust guarantees may not useful everywhere, but Rust
also helps lowering the chances of logic bugs in general (see the
previous point).

> kernel uses is gcc and clang/LLVM flags to cause the compiler to define
> standard-C UB, one example being signed integer overflow.

Definitely, compilers could offer to define many UBs in C. The
standard could also decide to remove them, too.

However, there are still cases that C cannot really prevent unless
major changes take place, such as dereferencing pointers or preventing
data races.

Cheers,
Miguel
