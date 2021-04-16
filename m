Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9BDC433ED
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 17:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4781260FF1
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 17:05:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235667AbhDPRGD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 13:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbhDPRGD (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 13:06:03 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39408C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 10:05:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id o16so31858092ljp.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AcDAVQ+0h+jENPZeM69/kZwGZfdDXc/0125nsKSlnZg=;
        b=dnz1bYqVAlRM6259A+dx+Rc2q9Qis0LBOOOmkDKaY6WJu06OAB3WTXaPaSSbSH2kHN
         CUxAYJW2MSUb6KLd9VHkZqoeTvqRIILdDBdw4/TbIMff3ssQa3bNYa96Mu2MipKekQxe
         RdIn9i/ob2oUe8MI005glSrjfmJXy7RQVtkC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AcDAVQ+0h+jENPZeM69/kZwGZfdDXc/0125nsKSlnZg=;
        b=M81mao4nigCqacw3x6tK/I6vLNnMwoZxlJVTmoawrwWjc/9osSY4aexCXSZLh0qfFJ
         W8HuNmlOTyxMAi2bF8yJbBrxWEZ2IXz9l7YP5f22LtTza2lZn8ldWLBcBvmteI8ZhmE/
         SlAf+f9AoWBQstJq5SrqOmhtu3eaabiWmRhR1/bvVV+U7tx0jNQZwPsED04UQ70f5gIs
         4jCnjhZCxw4Tj0NY5kIMuxOvw82emcSTKnAJ8v+CPC2kHQtatZWICQMdQgFzqoIRPWrj
         mCFvTpFxaf1p/uNdRti0hcf27XNI5fqQrqwLgttYewzBMLkm9VNE4uo1ENaQe4HQIOL2
         GXDg==
X-Gm-Message-State: AOAM531E4/XupU+BYj9thVm0RIj0OLVFyY1bwNf99oMnOt3pSWJEK2+f
        upDczvEKNeo6ksOBdS4bzkUHrAtTe7GcfAKW
X-Google-Smtp-Source: ABdhPJzOXWXqQ5ozeH3Imu753JNZ7SU8DRCrvZsJlMMHL4lxqre1VfoRJay2eZsxyzPiGltTYQ+Jog==
X-Received: by 2002:a2e:b043:: with SMTP id d3mr3297887ljl.280.1618592736485;
        Fri, 16 Apr 2021 10:05:36 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id z14sm997530ljk.33.2021.04.16.10.05.34
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 10:05:35 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id g8so45858281lfv.12
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 10:05:34 -0700 (PDT)
X-Received: by 2002:a05:6512:1286:: with SMTP id u6mr3571784lfs.377.1618592734654;
 Fri, 16 Apr 2021 10:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
In-Reply-To: <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 16 Apr 2021 10:05:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
Message-ID: <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     ojeda@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Apr 16, 2021 at 6:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> AFAICT rust has try/throw/catch exception handling (like
> C++/Java/others) which is typically implemented with stack unwinding of
> its own.

I was assuming that the kernel side would never do that.

There's some kind of "catch_unwind()" thing that catches a Rust
"panic!" thing, but I think it's basically useless for the kernel.

Typical Rust error handling should match the regular kernel
IS_ERR/ERR_PTR/PTR_ERR model fairly well, although the syntax is
fairly different (and it's not limited to pointers).

                Linus
