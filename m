Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8FCC433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 11:48:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6630B610C9
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 11:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhJMLu3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Oct 2021 07:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhJMLu2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Oct 2021 07:50:28 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E227C061570
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Oct 2021 04:48:25 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id w11so2371045ilv.6
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Oct 2021 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ELh1ETW2BQMRKmMeuZ20a3+0xvnisIhgucjoSJxtDIw=;
        b=aOl3f4kYynjqoU05sdD3tuJl9DTRDN0i/3TZEjlB5CiS0MfsAMBW8lxY8byixDTnXT
         I7Zn/Ye4pwd8BL+w4EADuVKAqRdlfCBK2qPaRCSY/VieQZRbmZeME0t41+AeoBgAlgz/
         3kD+iEPL6zy93HN6F5ZDTitKljcuZE+/O9fQZOyYAzq7J6XgO+aBIlcaea0YiSc2kTSX
         D76RTtYSzZrK9AcMhK9ZvtyGR9oGB2QkW6xs2kAUWphbuQI21uaAuLeEGrpyJMCJ23Og
         02hiTZMSTIJjC+J86AJLUZ1IUVcRJV/Ozp22kNjKHiue9uzK3rJOBPAhIg3RGEhPzp1a
         Vo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ELh1ETW2BQMRKmMeuZ20a3+0xvnisIhgucjoSJxtDIw=;
        b=zxqe3+PtRzFvxxKOmWsRNGrfnAP3A79QmvnE4pXpC1osVmP5aljlrxB6gcSkp428mR
         q5prqaEyWPr0h7LcVmsfrYNnyJ9tiIaTT6+nKOEzgB7ID0TL/kYwdjGelUD/2WoYnyO/
         0ShGZSsfqVmPM8x7g8WaPvUpFHL7F59/3GNpdJj6pEfD1P83cEVaPw3J+wqBCqF7Otxj
         jZ0xRoBl6JMjqkqUv8nQeJgvfiQVCPNGENZiWk33/20ZzJCuduZ2yeh7W6tR15AHoxj9
         v24RwbxRffoAgXZrs5R3QTdeH4xt1AW6xrajy6lxKk7R1Ypz1gUGov4qcRUSpt5OnvUl
         scig==
X-Gm-Message-State: AOAM531IJqPkz1aXQyedQdWoL/yXzTmC0NE1lwLTDEhgO96W6rHhaimn
        B+r5u3GEDT5oRCl87gU7c7MDWmA5mEaziktLLC4=
X-Google-Smtp-Source: ABdhPJwCqB6gZW6qNx0evbsrEAd9yMJg4x4hV49lE7CdVeDV+BRWFalZS/uvS5I9C+vIRUV0odRGNLw9rEZOUmr/8h8=
X-Received: by 2002:a05:6e02:1688:: with SMTP id f8mr28645833ila.72.1634125704955;
 Wed, 13 Oct 2021 04:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net> <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008005958.0000125d@garyguo.net> <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
 <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
 <20211009235906.GY880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72mj9x7a4mfzJo+pY8HOXAshqfhyEJMjs7F+qS-rJaaCeA@mail.gmail.com>
 <20211011190104.GI880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211011190104.GI880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 13 Oct 2021 13:48:13 +0200
Message-ID: <CANiq72ny0RCnO1+E_wBgx0C6NCaMfv82rvkLVuwmW8Y+7Kii0Q@mail.gmail.com>
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

On Mon, Oct 11, 2021 at 9:01 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> The main issue I was calling out was not justifying Rust, but rather
> making sure that the exact same build could be reproduced a decade later.

Yes, but that is quite trivial compared to other issues I was
mentioning like adapting and requalifying a testing tool. For
instance, if you already had a team maintaining the configuration
management (i.e. the versions etc.), adding one more tool is not a big
deal.

> There are things that concurrent software would like to do that are
> made quite inconvenient due to large numbers of existing optimizations
> in the various compiler backends.  Yes, we have workarounds.  But I
> do not see how Rust is going to help with these inconveniences.

Sure, but C UB is unrelated to Rust UB. Thus, if you think it would be
valuable to be able to express particular algorithms in unsafe Rust,
then I would contact the Rust teams to let them know your needs --
perhaps we end up with something way better than C for that use case!

In any case, Rust does not necessarily need to help there. What is
important is whether Rust helps writing the majority of the kernel
code. If we need to call into C or use inline assembly for certain
bits -- so be it.

> But to be fair, much again depends on exactly where Rust is to be applied
> in the kernel.  If a given Linux-kernel feature is not used where Rust
> needs to be applied, then there is no need to solve the corresponding
> issues.

Exactly.

Cheers,
Miguel
