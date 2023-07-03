Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BA3EB64DC
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Jul 2023 14:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjGCOYw (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Jul 2023 10:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbjGCOYn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Jul 2023 10:24:43 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6F310C8
        for <rust-for-linux@vger.kernel.org>; Mon,  3 Jul 2023 07:24:21 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6b883e1e9d5so2632105a34.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jul 2023 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688394260; x=1690986260;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPtCbtcihslYW+XUtJHE99I5DPZqY3kLO8CasrXWG1Q=;
        b=oVyGFKNG4kLmwPQ6Hvdq65eAW4Bx2hOhDm+ETMYjUKRqyzwPliluFaek6t41aQrI5+
         fUpP0sDw9YSpDr5YfMGEUzsWl28RLI98QAl2Ou3he3DCveSTRH6UPk94Hn/rr6Ve80IK
         7U5+G5wIdGAIyRF4bpW3S8Wdu+R5x5ZHKGXr7a700pvM+H+t0PInljl+RKsotGYrEEtk
         ZpP3y0JWGD5wIBnU0FE+CQvSmK1AqkRnpFFNWievsfSru7Ga0qd7R96AEyIw8Lin43H2
         1+ykT+ixY7G8oAYKp2zyRMeWfq+ctcNdHONfqahzDnUecbYnomCg9AJccCnDlXILyd6o
         rNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688394260; x=1690986260;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPtCbtcihslYW+XUtJHE99I5DPZqY3kLO8CasrXWG1Q=;
        b=Mxeju3h8NDDm8yC22Fn++BxPEZB1jxHCyklq+3SZyMpWmvgXpmFGl7/4drwLqFk+Z0
         U7yHCvnKd6dUEH7uwibHuWJXumjDEZIJEbzxK5+y1UDk+inSriFQIuCbu554YYprkCio
         6+vxWDXCL8TDAlasAE4TQShhyPP+ftahzE1PF4tnbn8LhI9nkqu/pT6UBkZR79JuWZLB
         CjgxyGKpC9wifyqfH5PNPs51sdMR4tHfuukkqbnqOXgHG1qo6kE6JMv4wpikfpkEtjzY
         aiFOygxBMK8W0riIMJF3apbLGqgW3sBJukeMOE8RSZxvf4Lm5J1/dkBVvBBReigwgt84
         4GUA==
X-Gm-Message-State: AC+VfDwPzRijFoY7KZkX5B6oj14Da2vXkwhQHiEKwYNr7H0mpippHeyt
        oSzmSNd0lXsWK3q0dKATu+1BRfiqe78=
X-Google-Smtp-Source: ACHHUZ5ip3SUbuIedR8wSuGpw1emaURnEUbRzu8yWkKMf1BQwCL2hk2McHGMobAd56tsZKcRgxiOCw==
X-Received: by 2002:a05:6830:18d2:b0:6b7:5362:6275 with SMTP id v18-20020a05683018d200b006b753626275mr8947852ote.22.1688394260121;
        Mon, 03 Jul 2023 07:24:20 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id v4-20020a056830140400b006b8adf1bc0csm2757045otp.33.2023.07.03.07.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 07:24:19 -0700 (PDT)
Message-ID: <1d9daf30-8d88-ea6b-b22e-23049daed5b4@gmail.com>
Date:   Mon, 3 Jul 2023 11:24:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] scripts: read cfgs from Makefile for rust-analyzer
Content-Language: en-US
From:   Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
References: <20230520231701.46008-1-yakoyoku@gmail.com>
In-Reply-To: <20230520231701.46008-1-yakoyoku@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Bump 🧐
