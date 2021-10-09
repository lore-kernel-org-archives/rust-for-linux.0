Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA408C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 16:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFFEB60F6E
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 16:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhJIQcT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 9 Oct 2021 12:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhJIQcT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 9 Oct 2021 12:32:19 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A16EC061570
        for <rust-for-linux@vger.kernel.org>; Sat,  9 Oct 2021 09:30:22 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id 134so14391736iou.12
        for <rust-for-linux@vger.kernel.org>; Sat, 09 Oct 2021 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y6JYx687k6xboEf2wHzwYIK5mYxKxPQWwDp9SWS5NZ8=;
        b=l5OSqSETqcqYbS256Tp+eB8bhZs9ks5htzG+B+h54XA1YDhwW8td/kd4trqk+8T4N0
         mHztiewMASgBU1jvsStrwMSIUOiYkHJtoHi9Ps47N6ZhYm1nPH5cWbNTYQW5qlznVL2S
         WeZJOb3k9hL4uD2WEBpxoGMwraxf9MM6eVSDzUaIuKlXY0/1hW1pARBinOYbuN/vnVjr
         s8eHKkKOc2z+aWGylIPYtPsmTWDk/clypryHXQ7Bpy/xMxOK+L5ocInQme6grY0IDCKR
         wPvNpPtLeeyiSaY3m8OcAO8vGJuGZVLa5faeRcIsDZaTNjQnSVtKX1UtXycWj/gHf1KV
         AmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6JYx687k6xboEf2wHzwYIK5mYxKxPQWwDp9SWS5NZ8=;
        b=NUOVwNve88rlz6d8Qf3rykzLA3yV2huTq+WG/6BPz8QC6A4Fi3O/7BPxr7SB/WTa4I
         btkI1uqOotc/90V7ck2Zu5RHrfO/M1auFJLKgU82WQrXsZWtMYu0SX2p18YxfwbWO3z2
         P7W3+itucBBFYgNcHMewXClX0XFJNJs3IpbnQ5IA/bgyttuG0viCGZbLOevbDo34Qb4a
         M2xXT/ugmIDZIvaT369u1G27LS8+/h3OdzAthU4cYwtPlUeGkwVZoWIksPADVQNeqhPJ
         bv6pM/SmnmTCuESwFCbw8pf7JKvu2/cKqOWGy03BNi4tI1Xm7von5L22dctFt9u2wSxa
         UzzA==
X-Gm-Message-State: AOAM532X9yl0QtxS2fxZ5cozO31IHc+nxJgaWvrktMzNe23X1P08LQHJ
        1DBF7Y5/poHx8kbMTI73g1YUo8gxebZvkKnrBGk=
X-Google-Smtp-Source: ABdhPJyxmCLEEBHDxyuwFmCjEjb5kd77QL6WXb7Xde+Ts2zhP7pn/uSqER1zBZlb9qRg8L0qM8Zsk/li0bd5UUaP7Lo=
X-Received: by 2002:a05:6638:2ac:: with SMTP id d12mr12504807jaq.133.1633797021729;
 Sat, 09 Oct 2021 09:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux> <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1> <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1> <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
 <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 9 Oct 2021 18:30:10 +0200
Message-ID: <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
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

On Sat, Oct 9, 2021 at 1:57 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> But some other library could have a wild-pointer bug in unsafe Rust code
> or in C code, correct?  And such a bug could subvert a rather wide range

Indeed, but that would require a bug somewhere in unsafe Rust code --
safe Rust code cannot do so on its own. That is why I mentioned
"outside safe code".

> of code, including that of correct libraries, right?  If I am wrong,
> please tell me what Rust is doing to provide the additional protection.

Of course, an unsafe code bug, or C code going wild, or a compiler
bug, or a hardware bug, or a single-event upset etc. can subvert
everything (see the other reply).

This is why I emphasize that the guarantees Rust aims to provide are
conditional to all that. After all, it is just a language -- there is
no way it could make a system (including hardware) immune to that.

> I would like to believe that, but I have seen too many cases where
> UB propagates far and wide.  :-(

To be clear, the "effectively contain UB" above did not imply that
Rust somehow prevents UB from breaking everything if it actually
happens (this relates to the previous point). It means that, as a
tool, it seems to be an effective way to write less UB-related bugs
compared to using languages like C.

In other words, UB-related bugs can definitely still happen, but the
idea is to reduce the amount of issues involving UB as much as
possible via reducing the amount of code that we need to write that
requires potentially-UB operations. So it is a matter of reducing the
probabilities you mentioned -- but Rust alone will not make them zero
nor guarantee no UB in an absolute manner.

> Except that all too many compiler writers are actively looking for more
> UB to exploit.  So this would be a difficult moving target.

If you mean it in the sense of C and C++ (i.e. where it is easy to
trigger UB without realizing it because the optimizer may not take
advantage of that today, but may actually take advantage of it
tomorrow); then in safe Rust that would be a bug.

That is, such a bug may be in the compiler frontend, it may be a bug
in LLVM, or in the language spec, or in the stdlib, or in our own
unsafe code in the kernel, etc. But ultimately, it would be considered
a bug.

The idea is that the safe subset of Rust does not allow you to write
UB at all, whatever you write. So, for instance, no optimizer (whether
today's version or tomorrow's version) will be able to break your code
(again, assuming no bugs in the optimizer etc.).

This is in contrast with C (or unsafe Rust!), where not only we have
the risk of compiler bugs like in safe Rust, but also all the UB
landmines in the language itself that correct optimizers can exploit
(assuming we agreed what is "legal" by the standard, which is a whole
another discussion).

> Let me see if I can summarize with a bit of interpretation...
>
> 1.      Rust modules are a pointless distraction here.  Unless you object,
>         I will remove all mention of them from this blog series.

I agree it is best to omit them. However, it is not that Rust modules
are irrelevant/unrelated to the safety story in Rust, but for
newcomers to Rust, I think it is a detail that can easily mislead
them.

> 2.      Safe Rust code might have bugs, as might any other code.
>
>         For example, even if Linux-kernel RCU were to somehow be rewritten
>         into Rust with no unsafe code whatsoever, there is not a verifier
>         alive today that is going to realize that changing the value of
>         RCU_JIFFIES_FQS_DIV from 256 to (say) 16 is a really bad idea.

Definitely: logic bugs are not prevented by safe Rust.

It may reduce the chances of logic bugs compared to C though (e.g.
through its stricter type system etc.), but this is another topic,
mostly unrelated to the safety/UB discussion.

> 3.      Correctly written unsafe Rust code defends itself (and the safe
>         code invoking it) from misuse.  And presumably the same applies
>         for wrappers written for C code, given that there is probably
>         an "unsafe" lurking somewhere in such wrappers.

Yes. And definitely, calling C code is unsafe, since C code does not
have a way to promise in its signature that it is safe.

> 4.      Rust's safety properties are focused more on UB in particular
>         than on bugs in general.

Yes, safety in Rust is all about UB, not logic bugs.

This does not mean that Rust was not designed to try to minimize logic
bugs too, of course, but that is another discussion.

> And one final thing to keep in mind...  If I turn this blog series into
> a rosy hymn to Rust, nobody is going to believe it.  ;-)

I understand :)

As a personal note: I am trying my best to give a fair assessment of
Rust for the kernel, and trying hard to describe what Rust actually
aims to guarantee and what not. I do not enjoy when Rust is portrayed
as the solution to every single problem -- it does not solve all
issues, at all. But I think it is a big enough improvement to be
seriously considered for kernel development.

Cheers,
Miguel
