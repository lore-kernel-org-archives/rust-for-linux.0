Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A3AC433F5
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 19:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9937B61037
	for <rust-for-linux@archiver.kernel.org>; Fri,  8 Oct 2021 19:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241371AbhJHTzm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 8 Oct 2021 15:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbhJHTzl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 8 Oct 2021 15:55:41 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2930DC061570
        for <rust-for-linux@vger.kernel.org>; Fri,  8 Oct 2021 12:53:46 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id e144so11972040iof.3
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Oct 2021 12:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OBX9dZSpmQcEMkNsFs72/snKGvpakQB3FBMD+xsLJgs=;
        b=Q0cZY5sBzC4gb+eC/WMGD1gIhnJdSqGnWwsKL3qiVxIoY9G13rI44jr0vH6AxHxZmZ
         C95FFtna4qskCAEaTPmbrttW1Ep97EZ1mlP7Vr37fmz9BWThAYJzBrKy/chmmW4QKIJG
         amBI4m4WffYt8rJ4G2iXdwcMywSDWW9KY+vzpCbCUTHBl7iIcy3WkzpCapy7YXOvA5R0
         Qs0xjUVgWS4Ae5K7PJWESLfeC/rJtF6LglIeOMAbjKNsC6IpkvneOF46UNzIUFennR+C
         /UtXXxv9jAJ24KDbcTUSQI1ZwCa8DkEYEPINGcFjaJiXZXOFEI8rdefukUaHPL5500Dd
         SW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OBX9dZSpmQcEMkNsFs72/snKGvpakQB3FBMD+xsLJgs=;
        b=1P13w3N7Ph3sz/Y951Aw6vArRwGHflwdn3bRJCqKLynofYku+5+ZBrTNDM3i93zYHc
         OoaGuBXUbpp+6ovAQymuUEOZE5suz+VC8ZjwrhAFtUvjlLQSQ68dyKXYdm9Ut9XDoZZ2
         ndYGQVwMIgfUTIogpTCsckrxTBkf/6yWYA7Ss3fvbbRTrkRMn5x92k8of07UgcapwwKM
         FpI+1IcjsOVPFICxTfEQ4+u7NuAxDJMzugO3gkQv59AZrMBbaPUGBH0DTAQ7rUd9BxVR
         AEZeq2AnNkZ7YaBgydNyBvt50ukPSM9Sn9idA9VmUsm/ZiVpjNdRh4UPCLvyNl+FgeRB
         eITA==
X-Gm-Message-State: AOAM533YzoumAlytJiwzwheM21vLG7OpqizKoIomGMjNDDsMBJqeNEJ1
        02Zxu+iLKPVzcRUSvtnPas5hJbSkzlQjEe5X5Fc=
X-Google-Smtp-Source: ABdhPJzUmRHPEH7LgQYkuBBvK87amvXRNmu8eoJy32kEBOf6vDtVRxCqtM2jb7aD+9B8puFel1hf+lybRO+WHKKxtMU=
X-Received: by 2002:a05:6638:297:: with SMTP id c23mr9231975jaq.131.1633722825542;
 Fri, 08 Oct 2021 12:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux> <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1> <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1> <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 8 Oct 2021 21:53:34 +0200
Message-ID: <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
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

On Fri, Oct 8, 2021 at 1:42 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> OK, I now have this:
>
>         Both the unsafe Rust code and the C code can interfere with Rust
>         non-unsafe code, and furthermore safe code can violate unsafe
>         code's assumptions as long as it is in the same module. However,
>         please note that a Rust module is a syntactic construct vaguely
>         resembling a C++ namespace, and has nothing to do with a kernel
>         module or a translation unit.
>
> Is that better?

For someone new to Rust, I think the paragraph may be hard to make
sense of, and there are several ways to read it.

For instance, safe code "can" violate unsafe code's assumptions in the
same module, but then it just means the module is buggy/unsound.

But if we are talking about buggy/unsound modules, then even safe code
outside the module may be able to violate the module's assumptions
too.

Instead, it is easier to talk about what Rust aims to guarantee: that
if libraries containing unsafe code are sound, then outside safe code
cannot subvert them to introduce UB.

Thus it is a conditional promise. But it is a powerful one. The point
is not that libraries may be subverted if there is a bug in them, but
that they cannot be subverted if they are correct.

As an example, take `std::vector` from C++. Correct usage of
`std::vector` will not trigger UB (as long as `std::vector` is
non-buggy). Rust aims to guarantee something extra: that even
*incorrect* safe code using `Vec` will not be able to trigger UB (as
long as `Vec` and other abstractions are non-buggy).

As you see, the condition "as long as X is non-buggy" remains. But
that is OK -- it does not mean encapsulation is useless: it still
allows to effectively contain UB.

Put another way, C and C++ APIs are the trivial / reduced case for
what Rust aims to guarantee. For instance, we can think of C++
`std::vector` as a Rust type where every method is marked as `unsafe`.
As such, Rust would be able to provide its guarantee vacuously --
there are no safe APIs to call to begin with.

To be clear, this "incorrect" usage includes maliciously-written safe
code. So it even has some merits as an "extra layer of protection"
against Minnesota-style or "Underhanded C Contest"-style code (at
least regarding vulnerabilities that exploit UB).

Cheers,
Miguel
