Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C10C761A6
	for <rust-for-linux@archiver.kernel.org>; Thu, 30 Mar 2023 12:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjC3MSr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 30 Mar 2023 08:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjC3MSq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 30 Mar 2023 08:18:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3258172BA
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Mar 2023 05:18:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id t17-20020a05600c451100b003edc906aeeaso3194567wmo.1
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Mar 2023 05:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680178723;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Wyt/QKbfFqwXxgXngsVcjXvUcjSi2SpEjcCROkpNZHw=;
        b=Eqmfhnq5IEFLLhAjAZRIobhW/2B13mAKES+/WX/G7vJ9k6+u98ggyXukQa0h3R3Pf3
         hjsG7bZivizU1puj66d5NNFYaW+jHoYbxNV/lTSLJgMMevl4Go5+ZPboncgUDRXv+Pb5
         GkG6JqvpkWG3I7zPRYUM/oVw8aPAfOctlVnYhW3XV6iph4MfSFnbNkEfkkUtUh3+FKZp
         d9vZsJt5qH/TE/5iu76QwFEFI3Y6o0Et9QWOv86TCtRi04gMXrYrQfxpDNocZPH0N5AI
         +FBeoAHbfb91soVmz+IvymSJvF+YbDnt0hX2v2zuIdsuZ1JNTbWQnLcpZ2QItLZ9R6eX
         MdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680178723;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wyt/QKbfFqwXxgXngsVcjXvUcjSi2SpEjcCROkpNZHw=;
        b=pyNVIHCURzP29xPG/VdNVSJcO/TTJcsVakJkj2/HUdHtFs/lfhwsLDUFKGZnAl0DfR
         LeCCORsfolXGSW/D8ndC9818eKoMu4vOPj/aTqT0/C3aKLWkprGlz1mBC+B00kl4V88p
         +vzu81svyXed2O+bpsJGsOIyCh5l0nyVlzKD1osvPoDUK4CoPwRt5UUbcSVuRWMt7jiW
         5sBZ1Fsda2mklr2SvQakZ51aFHLVuRAV8i4+kg99asO8k0aMmSjGRoHU9c05hqvBJ4Np
         bWkAEde4qHsESDHBi5Pwd3H6/sHlTcMp0V7WJ6lZCItv+VO5aGXEUZLSPxlqdmSubBFc
         BJfA==
X-Gm-Message-State: AO0yUKXjtgiwd+Ixuh0iZcVtHX2GmCRNLVzeZ3vuUoKJpqqvIj/w3QQX
        KvAFycNtMR2HWcJdDHusRfXVrQ==
X-Google-Smtp-Source: AK7set8KZRCKiYFEeuKZGefi283mvYKlXVix1qHiiGvficshl2fwJ0ohFCGwM+wM6kXCzp8F9AjUWQ==
X-Received: by 2002:a7b:cbc2:0:b0:3df:de28:f819 with SMTP id n2-20020a7bcbc2000000b003dfde28f819mr18146008wmi.15.1680178723657;
        Thu, 30 Mar 2023 05:18:43 -0700 (PDT)
Received: from localhost ([165.225.194.194])
        by smtp.gmail.com with ESMTPSA id n23-20020a05600c3b9700b003ede04deb14sm5744936wms.48.2023.03.30.05.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:18:43 -0700 (PDT)
References: <20230329223239.138757-1-y86-dev@protonmail.com>
 <20230329223239.138757-3-y86-dev@protonmail.com>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     y86-dev@protonmail.com
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Alice Ryhl <alice@ryhl.io>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v3 02/13] rust: sync: add `assume_init` to `UniqueArc`
Date:   Thu, 30 Mar 2023 14:18:06 +0200
In-reply-to: <20230329223239.138757-3-y86-dev@protonmail.com>
Message-ID: <87y1ne4el9.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


y86-dev@protonmail.com writes:

> From: Benno Lossin <y86-dev@protonmail.com>
>
> Adds the `assume_init` function to `UniqueArc<MaybeUninit<T>>` that
> unsafely assumes the value to be initialized and yields a value of type
> `UniqueArc<T>`. This function is used when manually initializing the
> pointee of an `UniqueArc`.
>
> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

