Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648EAC43461
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 18:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D8486127C
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 18:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbhDSSjL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 14:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24481 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232527AbhDSSjK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 14:39:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618857520;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PmMpoqajN3kYFits3mKGuMX/Gpaj/8aNNG+P1JlM6wc=;
        b=eyCBe+4OeOGBIAbrcA34EBvprX+XnJgQ2E909+gcehr/XoLoji2gT4iPQg/hW2rBRXAS1a
        Vv9mZgeqMRNhMe5avczMMsQrPz7pRyQOr53BNOKhvP8swLl7oeo2+BRHYUJ6Zf7PLmPsb6
        DMIZ421/zb+zkm7dQp9/XNKLBKEzQ0g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-WNJJEaG9MY-QbixeT7mbRQ-1; Mon, 19 Apr 2021 14:38:38 -0400
X-MC-Unique: WNJJEaG9MY-QbixeT7mbRQ-1
Received: by mail-ej1-f70.google.com with SMTP id p25-20020a1709061419b0290378364a6464so3976382ejc.15
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 11:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PmMpoqajN3kYFits3mKGuMX/Gpaj/8aNNG+P1JlM6wc=;
        b=b4cgqaCKRs80l7U1wJwPoSQ4xuPsLuec1vS1PI4qBuyij+68j7z5sbCmmP4A6xBjCK
         vSRgChB/4ZQFfJ4oibIS+UjdgD8j5CORuhyOUYKqbNVHYCd5rVEcU5dvjsvc5c153g1/
         jEROiTou0nuVm/ZtSBClUcpGzcFqEbb/7mC6ayHn+B+ult1jpmhoThjItEoYQw9VF3ff
         R4iu6SDCjT9Q/YAhD4GMX/wBO4fPnFtbMJSn5GxMXdg2UFT8A+C73SZXyRS47Dyp9RtZ
         6jbI2etg62Z/LFsAAcJyOuA4PFsEhjefCI9C2Rvn7H8CSaDhxITqE7A1Pd4ha6yYVukY
         RQNQ==
X-Gm-Message-State: AOAM531YtjbFvp951+9/fWhQz+/Ki29poefzdfBFQ7NFjyGF73NLsed+
        uZr64FrSoo7HPO7937p2kJRPM327vLIYH2nd37M3IDADp6A0zgRsAUGHT4izkjRyYesBgVes+ms
        hNPIB1ieVDoI1fr1hbpLJ8o7VMiA=
X-Received: by 2002:aa7:db87:: with SMTP id u7mr26555994edt.16.1618857517782;
        Mon, 19 Apr 2021 11:38:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSoLXrPSs39zJEB+7+9uQJX6oXOARN/G69LiGquMuawAqQDZEfWVnHA83Lq8KX68XzCPInWg==
X-Received: by 2002:aa7:db87:: with SMTP id u7mr26555985edt.16.1618857517581;
        Mon, 19 Apr 2021 11:38:37 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
        by smtp.gmail.com with ESMTPSA id kx3sm10981044ejc.44.2021.04.19.11.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 11:38:36 -0700 (PDT)
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
 <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
 <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com>
 <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
 <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <ae079b78-1c26-ddb9-fb8f-83d27ba0c5a9@redhat.com>
Date:   Mon, 19 Apr 2021 20:38:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 19/04/21 19:14, Linus Torvalds wrote:
> On Mon, Apr 19, 2021 at 2:36 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> I also don't see how this is better than seq_cst.
>>
>> But yes, not broken, but also very much not optimal.
> 
> I continue to feel like kernel people should just entirely ignore the
> C++ memory ordering standard.
> 
> It's inferior to what we already have, and simply not helpful. It
> doesn't actually solve any problems as far as the kernel is concerned,
> and it generates its own set of issues (ie assuming that the compiler
> supports it, and assuming the compiler gets it right).
> 
> The really subtle cases that it could have been helpful for (eg RCU,
> or the load-store control dependencies) were _too_ subtle for the
> standard.
> 
> And I do not believe Rust changes _any_ of that.

It changes it for the worse, in that access to fields that are shared 
across threads *must* either use atomic types (which boil down to the 
same compiler intrinsics as the C/C++ memory model) or synchronization 
primitives.  LKMM operates in the grey area between the C standard and 
what gcc/clang actually implement, but there's no such grey area in Rust 
unless somebody wants to rewrite arch/*/asm atomic access primitives and 
memory barriers in Rust.

Of course it's possible to say Rust code just uses the C/C++/Rust model 
and C code follows the LKMM, but that really only delays the inevitable 
until a driver is written part in C part in Rust, and needs to perform 
accesses outside synchronization primitives.

Paolo

> Any kernel Rust code will simply have to follow the LKMM rules, and
> use the kernel model for the interfaces. Things like the C++ memory
> model is simply not _relevant_ to the kernel.

