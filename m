Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AD0EB64DC
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Jul 2023 03:34:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjGODe0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jul 2023 23:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbjGODeI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jul 2023 23:34:08 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE9E3C15
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 20:33:48 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6b87d505e28so2072686a34.2
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jul 2023 20:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689392027; x=1691984027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrmbFM4tG/DMmaef1eDfS+w/+cLsMTxrQqI00uvYFcA=;
        b=GSYXP0e/WYQPuOUz2SRm+6kz+iaFHjN/lUA3/3XrmEvV9cLQBnt4XnyY4RxLZMYRxP
         QZ41yo5ZwoPLY2tz39/bi0syMjNXyZLOgiO2PVF+BDY4EFUdIUMFgDOsZ/VSszKmAiZV
         XFs7lltdVSTZdW44SCWaDPGW+khOzRiJ5tOOfEohmU7X5R9/rDXfJl2lVJL5fwvfJs9x
         AauzpX8Q95bDZili13yqh/dxoBkI23emdAATorUax7rYrrdc3tsbDBF55GVxLAgFeqHB
         mTaitZoo09wEZ0O+YXN+lMpAKy52nI60YHj5qB7b+kStKTFOPyROXEQLaCafQdBSz4fU
         KxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689392027; x=1691984027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrmbFM4tG/DMmaef1eDfS+w/+cLsMTxrQqI00uvYFcA=;
        b=EO27zhUFuQrkkzUvZzQmKDAtHfsyuqG/lF/SmRISpeB8v1+V2cMmsZ2+kizlLl1/Bt
         hONZaFqZh1OQPFIsTHqIBEDm3txNGPKG8oNs4NRw0ICchyU5jKkcGm2uJQ5txWge73Q5
         Bl9TDkQtFkH4VEJQx6nAO9Wqpa1cSIIbAKNhT0ibPvgK+r21R6Gc2e0rNjQq5/qgoU+0
         Xb4QLpvuNUr1pwXuPWKyS9IvP1C6tLpKrIzMDUCDL3lsS8RsmBFboASDGkItVd7ABfrl
         w8Q8fXnjQTJsO12LR6lNjwA3pnU6ipTRmvpp8lA1IeaSRWCLGISGDWjS//GjtQ5mhoLP
         OVVg==
X-Gm-Message-State: ABy/qLY3/3j48nY26j/QbZ7VeiIJ+ptOmilM1Ky2aUK7KPXLnEC3fSF9
        mCUzEw10LM6+GZcpTlG2AsA=
X-Google-Smtp-Source: APBJJlHLDI6SXNXsR9MBkD6qCAE2sEp9CuoGRvr4V3JclMYj2UVTxXTzI7G4U4JePorla+LJcuOQGA==
X-Received: by 2002:a05:6830:1003:b0:6b1:c635:b10d with SMTP id a3-20020a056830100300b006b1c635b10dmr6351875otp.13.1689392027323;
        Fri, 14 Jul 2023 20:33:47 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id m15-20020a9d6acf000000b006b8b55297b5sm4570514otq.42.2023.07.14.20.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 20:33:46 -0700 (PDT)
Message-ID: <1326c1e8-1707-9275-c1b4-4b4870912158@gmail.com>
Date:   Sat, 15 Jul 2023 00:33:43 -0300
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
From:   Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <diYQuBM2vYke0twpM2m8npuzVA2tHeJ2y52qN25pwSUmgBG0wxwaEQjBVg8eZnxu2kqcBf8wqNiu0aqgAGR3mlmtT2wPuO_HbVxAyhxR3X0=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 7/14/23 12:55, Benno Lossin wrote:
>> Both `core` and `alloc` had their `cfgs` missing in `rust-project.json`,
>> to remedy this `generate_rust_analyzer.py` scans the Makefile from
>> inside the `rust` directory for them to be added to a dictionary that
>> each key corresponds to a crate and each value, to an array of `cfgs`.
>>
>> Signed-off-by: Martin Rodriguez Reboredo yakoyoku@gmail.com
> 
> When I try this patch *all* configuration options are input into the `cfg`
> field of the `core` crate (others are also affected):
> ```json
>              "cfg": [
>                  "CONFIG_RING_BUFFER",
>                  "CONFIG_RING_BUFFER=\"y\"",
>                  "CONFIG_HAVE_ARCH_SECCOMP_FILTER",
>                  "CONFIG_HAVE_ARCH_SECCOMP_FILTER=\"y\"",
>                  "CONFIG_KERNEL_GZIP",
>                  "CONFIG_KERNEL_GZIP=\"y\"",
>                  "CONFIG_CC_HAS_SANCOV_TRACE_PC",
>                  "CONFIG_CC_HAS_SANCOV_TRACE_PC=\"y\"",
>                  "CONFIG_ARCH_WANT_OPTIMIZE_VMEMMAP",
> ```
> The snippet would continue on for about 1000 lines.
> I think this is wrong and not intended.
> 
> --
> Cheers,
> Benno
> 

Wait, can you tell me which branch are you on? As it works on
`rust-dev` and `rust-next` with `make rust-analyzer`. Also, do you
have any other details?
