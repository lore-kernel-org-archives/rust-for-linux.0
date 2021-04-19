Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8025EC433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 09:41:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5521361157
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 09:41:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhDSJl3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 05:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50083 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232004AbhDSJl3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 05:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618825259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AmGTVNtUbfWIthapU1UBUKJXnV5z2nwQ4bKCA13Sz/w=;
        b=E+YV1KOFQcqtxL+rcmaQ8po30QFcam+D9xxYyRwfwKgmJEDX5e1K4x0XStg1iZIuTdTkKE
        DcfO2KXdIztCCZ2S7kqrewozt+ii26DKdBT3uJ59Vo/RGzWLjzwhN/NnwUIHW6Zs1+7PRF
        JOEljcrsc7cjvMmCZkDfU+ZG5wXAO4o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-YF76Vx_2Oz-PngnT-mNBVA-1; Mon, 19 Apr 2021 05:40:58 -0400
X-MC-Unique: YF76Vx_2Oz-PngnT-mNBVA-1
Received: by mail-ej1-f71.google.com with SMTP id r17-20020a1709069591b029037cf6a4a56dso3455057ejx.12
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 02:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AmGTVNtUbfWIthapU1UBUKJXnV5z2nwQ4bKCA13Sz/w=;
        b=ma8hDJLvB/8DenCTk+I7kLNYsjiKWQrNQ05+P9dVVGa2BOBsil3nscDCiIwJm0ok7I
         T28B3NpSNn2eWm5g9zwFoo8eLqVh934LMpKFa6MGm37URJZEgMUzqjJnUZonJ4yXJ/Oa
         b5+kklLA7Qdek7CWDDzIHxpr0LEWRMweT4IpSE1dRpfTXceH6qZGLPPNpZSnij6Hxtqz
         /1NkyjD5x7RvJt6IPBV3ohe/1PbqHjZk2nzCu+N6Tse5SlijXE2wq2EAd0Osx9yWXuTK
         wsw97FYK9DPFgYMBn4CJ2NrHopccVoR5Cx0mQ2hpe5PZKQleo4sLf1KrXLp+1eIYbVLc
         d2FQ==
X-Gm-Message-State: AOAM5317nBEyvBB1h9VkOnBOs+zVfyXORZyKCVHrkPESH/UnjgdKDKMu
        1ldGw3gAQ5TNUrajVDC6pYOI4eThHKKv4oqEE/6AxCMP9AoeMwSfnm5HQzYITO/GZqB59+tU1lP
        190BEcZVHrwKYle65v5khqqRSxLM=
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr5758034edd.258.1618825256864;
        Mon, 19 Apr 2021 02:40:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbtPzHbVC2RzD+kuMasvTGdWEU1pXWvHTNdC+/82ekpX/pQhjS/66zHCChzb2+hcis/LcehQ==
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr5758019edd.258.1618825256654;
        Mon, 19 Apr 2021 02:40:56 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id n2sm12149749edi.32.2021.04.19.02.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 02:40:56 -0700 (PDT)
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a6297428-c4c6-f03b-49c7-6026c3d16d30@redhat.com>
Date:   Mon, 19 Apr 2021 11:40:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 19/04/21 11:36, Peter Zijlstra wrote:
> On Mon, Apr 19, 2021 at 11:02:12AM +0200, Paolo Bonzini wrote:
>>> void writer(void)
>>> {
>>>       atomic_store_explicit(&seq, seq+1, memory_order_relaxed);
>>>       atomic_thread_fence(memory_order_acquire);
>>
>> This needs to be memory_order_release.  The only change in the resulting
>> assembly is that "dmb ishld" becomes "dmb ish", which is not as good as the
>> "dmb ishst" you get from smp_wmb() but not buggy either.
> 
> Yuck! And that is what requires the insides to be
> atomic_store_explicit(), otherwise this fence doesn't have to affect
> them.

Not just that, even the write needs to be atomic_store_explicit in order 
to avoid a data race.atomic_store_explicit

> I also don't see how this is better than seq_cst.

It is better than seq_cst on TSO architectures.  Another possibility is 
to use release stores for everything (both increments and the stores 
between them).

> But yes, not broken, but also very much not optimal.

Agreed on that, just like RCU/memory_order_consume.

Paolo

