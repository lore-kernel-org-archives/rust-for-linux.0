Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A076C433B4
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 20:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 167B8613CD
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 20:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343531AbhDPUfW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 16:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56553 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238807AbhDPUfW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 16:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618605296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cnQ1WYK1Q/fzVZJP5dTDD7O6rnfjXe0Zb86HEbMOmAg=;
        b=E628u2pWL3sHBsPhpu04Pq8htTzbljPYFYunrFBs2C1RVE/LckwTQFF7uFDzO/C4nqYvWq
        HtE1Hzhf74VXRrdmOBClEwR1CpmEplP6Y7F2vT0xp7akT61qsZ7gfjyLMY2r8dpomvv/UR
        xNBIAALROvwMrp5BhiSrzbBAf6UzvXo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-co5-4T5uP0CM6Ju_o1NV2g-1; Fri, 16 Apr 2021 16:34:53 -0400
X-MC-Unique: co5-4T5uP0CM6Ju_o1NV2g-1
Received: by mail-ot1-f69.google.com with SMTP id b11-20020a056830310bb02901c911d48743so5285766ots.14
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 13:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cnQ1WYK1Q/fzVZJP5dTDD7O6rnfjXe0Zb86HEbMOmAg=;
        b=j4dyJcB8KseqO+fYwvQ3Oay4Xn41fq16pV8BsdJcH/mtK1WtgbrYueO6T9gBvpwFWi
         P3RyyWCSll6EFDJWXe+cG5XGOlTTuoif6JZDZnvT8N8h1l/piczZo1uSX0Gc1rpB38mm
         yPiTH9KAh+3G/LInRJ8FIhhQAG4ganIppAlSDScua/+TWhsl4bMssl/8m3FhTH3MKwdK
         eZ4k2C02q7EGNm/U3JYBLA4X9yTFFlkSW0IeZwTXnZx7GNUQkaz6PCAIcL7C0LrNc1Pa
         sM+fdZXuVwHfkkH7W1zCgGW7Fw1zwoRq6gENRwh1zIn3XLYo87+zx6HoRE57w3REov6R
         WL7g==
X-Gm-Message-State: AOAM533k6v2jlDrkWpXcdJTSST557cDHDpWXmz4wXUwISm8axDBH0dF3
        rEUT6rGH+ZFUIG1InjrWHJCgE6ml1gv4V0CqpNwSMnxUg9x/jSX2B2iMOBgWkr6T5A0pTAlpsxx
        k98IFHKGz0zSxVxNy3UQS/xB4cYE=
X-Received: by 2002:a05:6808:c7:: with SMTP id t7mr1055082oic.43.1618605292401;
        Fri, 16 Apr 2021 13:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDMeiBTSr4JPC5fMGzlWAn3gckHs2z8NaKVn5KrdX3KcjblRSMUGrgWzBCK6PA2rqcIxQZiA==
X-Received: by 2002:a05:6808:c7:: with SMTP id t7mr1055071oic.43.1618605292143;
        Fri, 16 Apr 2021 13:34:52 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
        by smtp.gmail.com with ESMTPSA id c21sm1431581ooa.48.2021.04.16.13.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 13:34:51 -0700 (PDT)
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Willy Tarreau <w@1wt.eu>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
 <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
 <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
 <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk>
 <CANiq72=RLf0FiuLVL-ZeLFp9P2LxTymbzhXoyQGG=tvUY_J-Sg@mail.gmail.com>
 <20210416202215.GA11236@1wt.eu>
From:   Connor Kuehl <ckuehl@redhat.com>
Message-ID: <efe80452-fac9-247a-1e2b-a73553f605e8@redhat.com>
Date:   Fri, 16 Apr 2021 15:34:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416202215.GA11236@1wt.eu>
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 4/16/21 3:22 PM, Willy Tarreau wrote:
> So it simply does the equivalent of:
> 
>   #define EINVAL -1234
> 
>   struct result {
>      int status;
>      int error;
>   };

Result and Option types are more like a union with a tag that
describes which variant it is.

struct foo_result {
    /* if ok, then access foo_or_err.successful_foo
     *        else, access foo_or_err.error
     */
    bool ok;
    union {
        struct foo successful_foo;
        int error;
    } foo_or_err;
};

> [..]
> 
> So it simply returns a pair of values instead of a single one, which

It will only return 1 value.

