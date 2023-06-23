Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF45CEB64DA
	for <rust-for-linux@archiver.kernel.org>; Fri, 23 Jun 2023 01:07:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjFWBHj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 22 Jun 2023 21:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjFWBH2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 22 Jun 2023 21:07:28 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F171FC0;
        Thu, 22 Jun 2023 18:07:25 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6b711c3ad1fso176310a34.0;
        Thu, 22 Jun 2023 18:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687482444; x=1690074444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oi3Ygn7d9QROh9zMnyn6jfDGTwHuWZ7Z7xzWKiYlV6M=;
        b=kj1FmKF5cz50gAMtmLchpYc2n11yD731qNme+0UN1w7H04oQnfD6xji4WzoIMj1foM
         9LvewmX4OHwVg8KlMp3XbHjH5BvOr5/PizhoVJU51JAFNFeQn+Cf1zgMIN5RbkMAF1a0
         nPzNdncE1IcZA66oDgNjq7SYgeUpCrf7VEuLRWv0nVFRBc6UjjTwSc0l+D3PoebUXAVs
         2tOvgS7lQ1pu2XVExTvEPdJayor71/l00wy3g+4fgscwi7ZAfLQMQxZimrZYgk4DbbWv
         g7kYgH699onLDnA5S4MLQ00tLk+CNK5ZeJhPqGfeNmoNi6RtVsl3hI+XKWiKBKJ7UuNg
         eiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687482444; x=1690074444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oi3Ygn7d9QROh9zMnyn6jfDGTwHuWZ7Z7xzWKiYlV6M=;
        b=HDcVitDpJ+W66fWdQ1Fs3hduoat8aVHVQQbsFLZhHhIyRDTYrHbE8P0uatYNCxSli1
         bYwj4VtYpr+5kzGxXygkAfqSfSGYql7Y33CV1UBVS/UsGq/fkb1RAdbbC2Ccm3AzcXhV
         fXoxoJqerpFD7Z/zhFt+SMSsFVNN5FvOmYfM2bXWSizGH2kKWC4SkVbLOZbbLMCfoOPX
         ri2i0cPZo8yxEPd6qgxTUtkwn+kvH/A5HKpCDugXRLdt9Ai+ppNe6LPHT0P+BzP62qON
         +CiFu3kaXrOReLumRe3Y6oHLck3ufTCPEl5iAc5IaYkEipwAmDybdxbD9Bt25OREiNdj
         dNpg==
X-Gm-Message-State: AC+VfDx84Rmof4/VDNhgvk6s/FuxynX89x5zFUkHzNTLImzZlRNC4iET
        p8dCOvdZZMDHj6pHS/v+FlVxD5UWDgs=
X-Google-Smtp-Source: ACHHUZ5TbrdHjQ+eK1AQUR6esk5HFcpPiWK/6oDwJrQIPvFHdDACffCi+qs3rBkKOCBb4t4693ATqg==
X-Received: by 2002:a05:6870:3845:b0:1a2:7786:9406 with SMTP id z5-20020a056870384500b001a277869406mr16114620oal.4.1687482444480;
        Thu, 22 Jun 2023 18:07:24 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id g19-20020a9d6b13000000b006af78565d64sm3413913otp.46.2023.06.22.18.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 18:07:24 -0700 (PDT)
Message-ID: <2e24fc18-c118-59b9-d205-4759329273e0@gmail.com>
Date:   Thu, 22 Jun 2023 22:07:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] rust: alloc: Add realloc and alloc_zeroed to the
 GlobalAlloc impl
To:     bjorn3_gh@protonmail.com, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Benno Lossin <benno.lossin@proton.me>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230622-global_alloc_methods-v1-1-3d3561593e23@protonmail.com>
Content-Language: en-US
From:   Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20230622-global_alloc_methods-v1-1-3d3561593e23@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 6/22/23 16:24, Björn Roy Baron via B4 Relay wrote:
> From: Björn Roy Baron <bjorn3_gh@protonmail.com>
> 
> While there are default impls for these methods, using the respective C
> api's is faster. Currently neither the existing nor these new
> GlobalAlloc method implementations are actually called. Instead the
> __rust_* function defined below the GlobalAlloc impl are used. With
> rustc 1.71 these functions will be gone and all allocation calls will go
> through the GlobalAlloc implementation.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/68
> Signed-off-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
> ---
> [...]

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
