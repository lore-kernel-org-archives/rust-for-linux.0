Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30595C7EE29
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 09:52:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjFJJwY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 05:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjFJJwX (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 05:52:23 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9237530F4
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:52:22 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-56cf6f4211aso1885907b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686390741; x=1688982741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGoALet3JGLl9hfH2Ws6ANGCDUJ4OjpD24mfV04r9+I=;
        b=UEGsGMfsNDHB0+rES1CU7kbI+CCxP/c51LBHFEVhFReWBK+Fu9qJCbwxlDaQbqz/tD
         EV56CZVxnwNa/2kSALGqmkCKrvunQs5KZgvAORdwEliYZlX7/Ijea91MLE7upbldLFkT
         4VX6aS54VtIO2NFdJh7au/lnzuTvk6NC+JWBPwnQmxTTlwEI0apFrThjMvUUOlDsH8uc
         wLdP7KDej6nVEGCDvP+oke5yC8rwKQgnqYB9lx+W7E3/ORhAz/zSL14/u/LjDW1OeKDg
         xA3nOlKqfUna0fbzkoAG44g/ZVADzWZyA4EFBMAR4+2MYxK1OKa0w+FHVdXjdGgGSLdh
         iNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686390741; x=1688982741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGoALet3JGLl9hfH2Ws6ANGCDUJ4OjpD24mfV04r9+I=;
        b=URLLAbsgZxvJ5kVtzeApLs2qbg2+NpYIsCqaPCZ7AfmzTPL9MmVilRf0QIPxgE4kXp
         dbKrqoEfvOXo5SFR74G26CpEi81SokqbMMJWOeDm9cS2/hmeMnjyg4basSuivYKdmdYf
         rSWTqY3mPvABnEU3b4RKNuhhAjlxThavCeK6FNn3ihyp/SPVPlHD8mMSq5Rvfn9s+nrK
         mx822FR2G6HfQQU3SwYC59yRvK7sKz1vYDh9wbSn/JfSgflp+0j//5wuVMsrLLezZ/Gt
         vydYGwyB6GBGJ5tfWPWOm06FPgzTgOYLlKMABh+wSdOwfKLFQQbu9HFeEbfR6d0KcXUu
         fQ+Q==
X-Gm-Message-State: AC+VfDy8+NfD72sxT7WoW/5EiMz4f7hQ0H66NnMUNF7h98UXivs6We9f
        cKuYbkEBt7ZRW4JUWanMmLtTtMMum6jHRQdBej8=
X-Google-Smtp-Source: ACHHUZ6Z8qA/dG890qIR33EvUgBMKUJkHKrGdnSKP7Wa3ctShFwMJ0vkYvp/4igiw09lbiWhW+CeD0dJrzTzPGnzPk0=
X-Received: by 2002:a0d:e481:0:b0:56c:f090:36eb with SMTP id
 n123-20020a0de481000000b0056cf09036ebmr1093215ywe.36.1686390741186; Sat, 10
 Jun 2023 02:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <01010188a42d5244-fffbd047-446b-4cbf-8a62-9c036d177276-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188a42d5244-fffbd047-446b-4cbf-8a62-9c036d177276-000000@us-west-2.amazonses.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 10 Jun 2023 11:52:10 +0200
Message-ID: <CANiq72k09iAEhevUUpUpM=Yg=5MFEb92PhgaM7FPAU3hs0+QeQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] add abstractions for network device drivers
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 9:40=E2=80=AFAM FUJITA Tomonori <tomo@exabit.dev> w=
rote:
>
> This patchset adds minimum abstractions for network device drivers and
> Rust dummy network device driver, a simpler version of drivers/net/dummy.=
c.

If these are intended as non-RFC patches, then please send these to
the relevant maintainers/MLs too (see
https://rust-for-linux.com/contributing#the-rust-subsystem).

Cheers,
Miguel
