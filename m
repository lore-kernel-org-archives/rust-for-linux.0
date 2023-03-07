Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2BFC678D5
	for <rust-for-linux@archiver.kernel.org>; Tue,  7 Mar 2023 12:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjCGMRn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 7 Mar 2023 07:17:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbjCGMR3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 7 Mar 2023 07:17:29 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEF14740C
        for <rust-for-linux@vger.kernel.org>; Tue,  7 Mar 2023 04:17:29 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id i6so11132409ybu.8
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Mar 2023 04:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678191448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgvli3vXi16/WjW2/KUTutIlzcJ4qcqP3NfDES8ZV0w=;
        b=KCYM93Bg1KoPVFs+SVXaELxSZbOXyY9JcMZZ7ghzteI8M6w/3qB9Yvm9O9NllORUg/
         r3+SUWg3YspURLr0fTOM6tM+/RgG9DRldMCpw/HYI4/6HMxej4bZWKLHFhp47cQ8PqXt
         oEsclmljhc9x5LSpQKcDt9wdK8jtmAotMqhtDzTN9DVe1NQuFYPidi1Osphakxc+YseC
         Kq/iw+1EkL4adHfNKqVlYexdr3K1JOgATTTh/Hn+hMvQ0PXat28vMnjYZJZCGeB+jR4P
         R9LlcEi0tgZlQ1rG/3FQRwIugh0BAeHa2inzuFEKzPtTLLXRStZUHexqj9HAyJ6LtNNl
         sjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678191448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgvli3vXi16/WjW2/KUTutIlzcJ4qcqP3NfDES8ZV0w=;
        b=XI1eHG/lBl8vLg9Qvc6Rld72hNNy/eF8jJjwFe/aPa76QQp4ueOBjwxUpwvMPJpaT3
         ltUqJm3TQSj5hA5fIfnnEBwv8Fvcx2Qk1JRRC+3H4Y8aug4s70nTU7ZXihU76G5pkBUG
         nwYrg9T9PMI23TCWZaDT9Dup3lPA+bkygNi4vKCpU67jnrbDOXw9ErSc4Ou9MgamN2Ut
         RrJgs8Mrb4FJY2ZOgOeS7trKRt689jjztN1roqYYww6BjbGzjGIN0TnFx5fdv/Y0OW3J
         lI3PaQ/LzYGehd+h0e2SkQ2zrScbidPUDKvNfE9z1MyYxrDzQl/XzKk6AWaMTaio4J5v
         eHjA==
X-Gm-Message-State: AO0yUKVxP7MUevMYdxpj6z+TvakQLghCOsfCCq9wZxvAoRzqzQ5RliD/
        ZTTyrpzQYkiq1/ecsZsSX0meHiT3clZWXQyDHCR95J6TrF8=
X-Google-Smtp-Source: AK7set9ihkY03r1PvtcEHznsfBSC1qbVvIyTs4BMK3OjcsflwlhbnhO8vF/Ms3nnCzcLQwkeh5KByur4+wbX4lJGn7Q=
X-Received: by 2002:a5b:585:0:b0:b13:7a6:f462 with SMTP id l5-20020a5b0585000000b00b1307a6f462mr2802232ybp.3.1678191448244;
 Tue, 07 Mar 2023 04:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com> <e76cb3e8-3d29-1caa-588c-29686c536d37@asahilina.net>
In-Reply-To: <e76cb3e8-3d29-1caa-588c-29686c536d37@asahilina.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 7 Mar 2023 13:17:17 +0100
Message-ID: <CANiq72kkkaa=n+rEBJu4eaqctpOAosXhrqmZ9NcaHQgZ5WphKQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Rust enablement for AArch64
To:     Asahi Lina <lina@asahilina.net>
Cc:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 7, 2023 at 10:32=E2=80=AFAM Asahi Lina <lina@asahilina.net> wro=
te:
>
> Just as a note, we ran into an issue with this patchset. There is a
> missing `BINDGEN_TARGET_arm64` in rust/Makefile (around line 255).
> Without that, bindgen fails.

For GCC builds, indeed, it is needed. Same applies to the RISC-V patch
series. Thanks!

Cheers,
Miguel
