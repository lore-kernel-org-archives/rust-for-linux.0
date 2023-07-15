Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AB6C001B0
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Jul 2023 16:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbjGOQNV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 Jul 2023 12:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjGOQNV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 Jul 2023 12:13:21 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E3730E5
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Jul 2023 09:13:19 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3a337ddff16so2357891b6e.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Jul 2023 09:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689437599; x=1692029599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fSkUwZwWgpEg7E1AfGnY0xHC2ivhpIX/9oHdlp8xhDA=;
        b=PQbauBDDY+u5+Xxzouzbx+UqspIEZOl7pWaZ6DP5aR5enRk67+mWBi6hMhhfHiDFLp
         SRz7Ck8HKJcwjV0xdrqVjPEc3By/370McG3o1kfAuFUOqA+wAJrSmEhJKafm/KTywg7F
         j7yVnzRbPjpJyMuOreabs6CRw2R5CkBq6dSlrcPKOD9E7x/U4Du8WQubJKcb1DL741+m
         qUPO12yv7QPpbdcUnwcFrfeSLTTiZZYTx0BkOI4Q6CYLIjCibcTeo07D1c/AoWnaIM4w
         HgahMlmX01t/0EgO0c9sVM5KgfLeIrfhHLnXerAtD1efz6G6Eqo8NjvQWpO5X0xllqUp
         S8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689437599; x=1692029599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fSkUwZwWgpEg7E1AfGnY0xHC2ivhpIX/9oHdlp8xhDA=;
        b=W95nHToIm/90q5Wsqqljdh0oKKXI56+kBNb0IJo15YutR29aG5A8eVgfmdosJV1xro
         jcEPSxJirdKW4+VudhxQaSf0vs/yJHzZMAiJwiuWWNoF7o0NJyM1FLiRHBNbTVg6N54k
         +3XzbqJQotObh1+0AtXW34efSJkDpQspnPmXDsSwaDPyvotU+Bl045lt2439rVAu5M16
         pH0wCwzlvLdzQXovPZGCvJzzSswh46aE85Wzd2BvChdwgUc3X4H/9DdhXOySe28pPyut
         k66olJG6RzrzHVtWKVdbc0DyZTR6pdWGI8afk9q4vJFDb3nW8DgkJSraiMRd8hATXlba
         agMQ==
X-Gm-Message-State: ABy/qLZnyCivZ/9GfBeBYGFxcSNlRsuMjnOJBAMFdw/iT1q0iZyeBPau
        HamQfH/J89o3QyZxw4TqWhDVGOI3p2Y=
X-Google-Smtp-Source: APBJJlF/0laXihkzCPE8p3iIAnvKhPr/WZg5/uzhkR4d8XqJDA0k+saY+jPMgE9AZoEYmaUVIRwazg==
X-Received: by 2002:a05:6808:171c:b0:3a3:63f2:eff with SMTP id bc28-20020a056808171c00b003a363f20effmr9939999oib.4.1689437598956;
        Sat, 15 Jul 2023 09:13:18 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id bx17-20020a0568081b1100b003a0619d78ebsm4988795oib.55.2023.07.15.09.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 09:13:18 -0700 (PDT)
Message-ID: <0f7645a2-a4dd-6e5c-25fd-4543f7c4bd13@gmail.com>
Date:   Sat, 15 Jul 2023 13:13:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] scripts: read cfgs from Makefile for rust-analyzer
Content-Language: en-US
To:     Benno Lossin <benno.lossin@proton.me>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
References: <20230520231701.46008-1-yakoyoku@gmail.com>
 <diYQuBM2vYke0twpM2m8npuzVA2tHeJ2y52qN25pwSUmgBG0wxwaEQjBVg8eZnxu2kqcBf8wqNiu0aqgAGR3mlmtT2wPuO_HbVxAyhxR3X0=@proton.me>
 <1326c1e8-1707-9275-c1b4-4b4870912158@gmail.com>
 <fW_Nn96x2phVy1b0wgVr6-xSGl3YXXhw5r-3XmAbDz_vsYWr3OmRu-b8pQnVlf0OcAbXRa9BnJXc_tsqVPijmkQtHTAzoZlbt8Gl-4f423w=@proton.me>
 <a961984e-9837-1534-6b23-87eaaed3d9a9@gmail.com>
 <UNNYZPvSjkF1LFhX3VpAPSscY-z09oyuMXMW5f43bXBI0GeOYpcVk79sC9dFS12mNMtRZIYPwa6txmDAa4ewPmJb8SaaWrMnvYvaYJ-IeqA=@proton.me>
From:   Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <UNNYZPvSjkF1LFhX3VpAPSscY-z09oyuMXMW5f43bXBI0GeOYpcVk79sC9dFS12mNMtRZIYPwa6txmDAa4ewPmJb8SaaWrMnvYvaYJ-IeqA=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 7/15/23 12:10, Benno Lossin wrote:
> On 15.07.23 16:40, Martin Rodriguez Reboredo wrote:
>>> If you want, I can upload the `rust-project.json` file to GH, since
>>> it is 55k lines long.
>>>
>>
>> I'm thinking that you may be looking at the wrong side.
> 
> Seems so, I looked at `bindings` and `kernel`, but got confused by deps.
> I also verified that without your patch all of those configs are present.
> 
> Still I find it a bit confusing that all of these configs are present
> there. How does rust-analyzer use those?

`rust-analyzer` sees those configs so when you type code it'll show you
suggestions based upon them in your IDE. For example, if you have
`CONFIG_NET` enabled then when you type "kernel::net::" your IDE will
suggest you completions from that module, otherwise it will not.

> Also sorry for the noise.

No problem, you'll easily get confused if you look upon that massive file.
Happened to me.

>> So, can you show me the output of these `jq` commands?
>>
>> ```sh
>> jq '.crates[] | select(.display_name == "core")' rust-project.json
>> jq '.crates[] | select(.display_name == "alloc")' rust-project.json
>> ```
> 
> [...]

Output looks as it was expected, so if in your IDE you go to the
definition of a function or type from either `core` or `alloc` then it's
going to show you the correct result, otherwise it might get confused or
throw you an error.
