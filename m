Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1F3C43460
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 18:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21F0861285
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 18:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241168AbhDSSvo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 14:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241151AbhDSSvn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 14:51:43 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142C2C061761
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 11:51:12 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u25so2278145ljg.7
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mvwuk72OV8nQxYdIe9d627zTpbWzXnBqVHooi1BCdcI=;
        b=ABIAZh0Yc6gK7Ft1wtnc4ohcPbNT4AIxM87QybtInWLGgYjHUnUzGJQO+0SQtmtF+P
         SJNEk+teRDbaI1T6wAN0fGq5AdHUpbsxHIxuCmNNPS1nc9teY9xfGzk1uG6n4KgcF6pi
         rwTMC5yQwaeCnKmG5juA/gDi6ahV1DltGgDNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mvwuk72OV8nQxYdIe9d627zTpbWzXnBqVHooi1BCdcI=;
        b=rcu+LrfNwVQsb8dY+8gsXs8fXAxIC8mEiqvmUTihj7pjhKHw+SqnM5JsygkSfIJRBF
         LUoZDMt/m9po30qljgwZFdNS+kGFIR9gJRga0v/VXc1cUrlqn6Jm7U2PCxNPaFkzWGIH
         gN2CE4satAt/I2edK539Puc2vCg8A5k0S+FLRgX+9FXgv/Y7JBNuRWkwsb7+3yKF2eaz
         WGvd4RrBlL+ZS3jzh/DbFO/sTC+/dZiVQA18orqBMF2si22EVFAeQVSdic4mfNvtVnwn
         oaRNexMkCLYf1e2lQwXCON4K6VeQU5psydb60m/54twGkV6BDpji53QQrDYnYEJbmL4z
         C12w==
X-Gm-Message-State: AOAM532sTfqpU7Mr488XHZ8EtcqRm+SsDxw8JIpZtqwiy0ko8g+yfxft
        jK2QPL0hJC8ZXdExTgDqKHZLd1PcOKtONCOT
X-Google-Smtp-Source: ABdhPJwsjKpiBcXEQjk13DBsCG0PC9/G9aCY8a1if+Y3fbVQGcqwiRGSQk4A3UWBWe2YkPQ5ZTgrGg==
X-Received: by 2002:a2e:9bd1:: with SMTP id w17mr11978439ljj.77.1618858270170;
        Mon, 19 Apr 2021 11:51:10 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id h28sm1892372lfv.26.2021.04.19.11.51.08
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 11:51:08 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id u25so2278036ljg.7
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 11:51:08 -0700 (PDT)
X-Received: by 2002:a05:651c:1117:: with SMTP id d23mr12844637ljo.220.1618858268248;
 Mon, 19 Apr 2021 11:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com> <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com> <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com> <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
 <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com> <ae079b78-1c26-ddb9-fb8f-83d27ba0c5a9@redhat.com>
In-Reply-To: <ae079b78-1c26-ddb9-fb8f-83d27ba0c5a9@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Apr 2021 11:50:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiqX=uweoE+4hUTSLRsR87u2WAnYjmQtR1Zw0k0-cMocA@mail.gmail.com>
Message-ID: <CAHk-=wiqX=uweoE+4hUTSLRsR87u2WAnYjmQtR1Zw0k0-cMocA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 19, 2021 at 11:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> It changes it for the worse, in that access to fields that are shared
> across threads *must* either use atomic types

Well, we won't be using those broken types in the core kernel, so that
would all be entirely on the Rust side.

And I don't expect the Rust side to do a lot of non-locked accesses,
which presumably shouldn't need any of this anyway.

If Rust code ends up accessing actual real kernel data structures with
memory ordering, then that will be to types that do *not* follow the
useless C++ atomics, and that in turn presumably means that it will be
done as "unsafe" helpers that do what the LKMM does (ie READ_ONCE()
and all the rest of it).

                 Linus
