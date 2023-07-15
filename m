Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA53EB64DC
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Jul 2023 14:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjGOOlF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 Jul 2023 10:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjGOOlE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 Jul 2023 10:41:04 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1FD18F
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Jul 2023 07:41:03 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3a43cbb4343so1083187b6e.1
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Jul 2023 07:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689432063; x=1692024063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NjK3GVVDNR7DSonWLyYWNCew6vYgvAvN82YW6gtFy2g=;
        b=H4yOBRWASwmqKysIAQwidE6MSjFMNGlzLVCD3e07YcgNaJ0kZA0g4TioH68vAoitId
         LNSrlxK3ho2bD28PjDCX55dsn5jAkqa9gAVU5TAAGwn0R0zBe6MDmTC1nOm7hg1RXpvp
         t8faTXhIpJizpup2XbSWSSoX2EZRxLkrN5fNVAyNCNBRuewFgPOupG0kEeckFSdb0uUd
         t/dX5ahm5dKyphn14tyQxxVDOm6KTvqQKV5LMRJTntKbhlV2xVFWeiboVVWIA/4C3RtP
         Hc0a+I3EuVZLr7S/dqUGW/C9Rate2tcknUwUO5NCmVYkImU2UTeEDBJ/3fw9LX/ic8qX
         QKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689432063; x=1692024063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjK3GVVDNR7DSonWLyYWNCew6vYgvAvN82YW6gtFy2g=;
        b=BANXaTDQxlIdZv1wqlscUn1x3algbMfsB1bGGibSe15jfOHfnJp/Fzt9/c495cBvfA
         P2aB8NU50qOlToguATvmeNM8PnHvlTWup/SHhxEDD6MHbKorREGgYGKY3ByD2Pu6dF9o
         DtavD2AbwmOrCEGM+F7npCtHDDw2mn57mmOKjM728pCKBTgks7eG+xS/pccdaVGv/MVt
         /QykDXBMwBI/s7d6f8Kh8H3pMx7hYm5S15HZracJy9D2MzhMOGsCOaYHeoukwtDGD3Jw
         xMssWSIr3dOuXqq03P0TmGSuT5zvA9Gy+nGapSXHqZ6SRQxJdu6MVxM1lbxAb6TPX7WP
         ojZA==
X-Gm-Message-State: ABy/qLaWPDb9LrMQABDBV5W0fuyexsHD+6B3W9fI7wBIt/+xRtcxb2Bt
        ZG7gQegiW3TRFGa2/Q3UYPg=
X-Google-Smtp-Source: APBJJlE9mqofXzDuvZxhbwERYbVx2pNiGRvGPPa6H5Aix6h7TRRArIEVs8wjo39GJhOrp0UI9TEqqQ==
X-Received: by 2002:aca:f0d4:0:b0:3a3:7e6f:d5f5 with SMTP id o203-20020acaf0d4000000b003a37e6fd5f5mr6181326oih.25.1689432062967;
        Sat, 15 Jul 2023 07:41:02 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id v18-20020a056808005200b003a3ff661368sm4932764oic.54.2023.07.15.07.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 07:41:02 -0700 (PDT)
Message-ID: <a961984e-9837-1534-6b23-87eaaed3d9a9@gmail.com>
Date:   Sat, 15 Jul 2023 11:40:57 -0300
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
From:   Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <fW_Nn96x2phVy1b0wgVr6-xSGl3YXXhw5r-3XmAbDz_vsYWr3OmRu-b8pQnVlf0OcAbXRa9BnJXc_tsqVPijmkQtHTAzoZlbt8Gl-4f423w=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 7/15/23 05:07, Benno Lossin wrote:
> On 15.07.23 05:33, Martin Rodriguez Reboredo wrote:
>> On 7/14/23 12:55, Benno Lossin wrote:
>>>> Both `core` and `alloc` had their `cfgs` missing in `rust-project.json`,
>>>> to remedy this `generate_rust_analyzer.py` scans the Makefile from
>>>> inside the `rust` directory for them to be added to a dictionary that
>>>> each key corresponds to a crate and each value, to an array of `cfgs`.
>>>>
>>>> Signed-off-by: Martin Rodriguez Reboredo yakoyoku@gmail.com
>>>
>>> When I try this patch *all* configuration options are input into the `cfg`
>>> field of the `core` crate (others are also affected):
>>> ```json
>>>                "cfg": [
>>>                    "CONFIG_RING_BUFFER",
>>>                    "CONFIG_RING_BUFFER=\"y\"",
>>>                    "CONFIG_HAVE_ARCH_SECCOMP_FILTER",
>>>                    "CONFIG_HAVE_ARCH_SECCOMP_FILTER=\"y\"",
>>>                    "CONFIG_KERNEL_GZIP",
>>>                    "CONFIG_KERNEL_GZIP=\"y\"",
>>>                    "CONFIG_CC_HAS_SANCOV_TRACE_PC",
>>>                    "CONFIG_CC_HAS_SANCOV_TRACE_PC=\"y\"",
>>>                    "CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP",
>>> ```
>>> The snippet would continue on for about 1000 lines.
>>> I think this is wrong and not intended.
>>>
>>> --
>>> Cheers,
>>> Benno
>>>
>>
>> Wait, can you tell me which branch are you on? As it works on
>> `rust-dev` and `rust-next` with `make rust-analyzer`. Also, do you
>> have any other details?
> 
> I tried it on both `rust-dev` and on `rust-next` and on both I have
> this problem. Here is what I executed:
> 
> ```sh
> git checkout $branch
> make clean
> make mrproper
> make menuconfig
> make LLVM=1 rust-analyzer
> ```
> 
> In the `make menuconfig` step I disabled `DEBUG_INFO_BTF` and enabled
> `RUST`.
> 
> If you want, I can upload the `rust-project.json` file to GH, since
> it is 55k lines long.
> 

I'm thinking that you may be looking at the wrong side. So, can you
show me the output of these `jq` commands?

```sh
jq '.crates[] | select(.display_name == "core")' rust-project.json
jq '.crates[] | select(.display_name == "alloc")' rust-project.json
```
