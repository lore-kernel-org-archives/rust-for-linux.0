Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B696EC54EAA
	for <rust-for-linux@archiver.kernel.org>; Mon, 30 Jan 2023 05:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbjA3FgD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 30 Jan 2023 00:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234818AbjA3FgC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 30 Jan 2023 00:36:02 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3ABA1C338
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Jan 2023 21:36:01 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id e16so11530636ljn.3
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Jan 2023 21:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YNmp6hBxSYlTkhsmzXLxGAqaVCQ3e6vjSozcYohM8Tc=;
        b=wKatVutRHoLHfIT0j8NZZ/thluctINlIrmddQaBJJfmYd2NWwiW26ojfWX0+Ol15RB
         h3VNPlY8Zzia3VkqsBDp0JhwXwQ9mXirWb4c6GlMMF3kyMmXiHaYr0UByMvor9LaXrGC
         Xw0KYnChNH0ujdWEJ89QGS6iHdmGG+jh0866FOk6vVODcjEWRVl07Rt85ZTGdxuED9Yx
         hIXKKysNRmWn9KwuygLvKR/wiEaHFgUmU9MBjSjI82knLpZgXZZnc5J8s1P7E72v5NRk
         NNj8sA+s3a37/Qndux5Sy4EhGXRzQFmPEwYiL6tRG/X4DOAreq8HAA9L43CIqtSkNxOH
         ETVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNmp6hBxSYlTkhsmzXLxGAqaVCQ3e6vjSozcYohM8Tc=;
        b=xr730Bh0kcnDKJbILovfVvWpxnMdgT0LAHuwvbZMULrOyH69V1e4KFpQt6zZrhQnKj
         VWb0fo9gHK3ceIvTfbRQz2TNRMcZLBMQa54F8YCSdLgdiPUburnpX0y7OgA4aqA4+8kk
         6jBO2g/JUKjNBm8Qfa1dWr8aqewsGiSGejtzm8Exs0Bo0nnMrS44rVXEDius9sY6+aQG
         VnZkHHb2ys/QdK/vlLs5jw48nj+D5aJS+F8OqZQrdw191ma06PjGsPZnQIQJGokEFdCn
         oB1vzvZ0DtQIQPORjs3lGsHmPhhSDQKS9PQVtD4gl7V6Y6bgO/QpLM+uJIWRXJ5HJ4hl
         n0Aw==
X-Gm-Message-State: AO0yUKVatizRdd/Efhnh284DHTKJ68yeGVGFrhGcCTGps+mH4bPfc7rR
        eGpiCdkOb4MW6mPfmxFP+OaCvRk+5UUb8IHzjM4C
X-Google-Smtp-Source: AK7set+HJwoxmCcTyt4BFt1cti5G4e11paT49mcW7S9oeXR5WL6C8HKD/U6xgF+HUE/8U3orKnnx0FFXTUggjICusxU=
X-Received: by 2002:a2e:b817:0:b0:290:5102:a7f8 with SMTP id
 u23-20020a2eb817000000b002905102a7f8mr798131ljo.63.1675056960020; Sun, 29 Jan
 2023 21:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20230119174036.64046-1-wedsonaf@gmail.com> <20230119174036.64046-5-wedsonaf@gmail.com>
In-Reply-To: <20230119174036.64046-5-wedsonaf@gmail.com>
From:   Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>
Date:   Mon, 30 Jan 2023 14:35:14 +0900
Message-ID: <CANgtXuM2A80=et=2GQRajy5ntri65QvRH3zg7xr5KPasQ16BUg@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: types: implement `ForeignOwnable` for `Arc<T>`
To:     Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jan 20, 2023 at 2:41 AM Wedson Almeida Filho <wedsonaf@gmail.com> wrote:
>
> This allows us to hand ownership of Rust ref-counted objects to
> the C side of the kernel.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>

Reviewed-by: Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>

-- 
======================================
Cybertrust Japan Co.,Ltd.
Alice Ferrazzi
alice.ferrazzi@miraclelinux.com
======================================
