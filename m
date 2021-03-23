Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B50EC433DB
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 Mar 2021 17:32:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3518B619C3
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 Mar 2021 17:32:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhCWRcI (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 Mar 2021 13:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhCWRbe (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 Mar 2021 13:31:34 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C03FC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Mar 2021 10:31:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z25so26668367lja.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Mar 2021 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=BFix2GFyhYPQHkyVdecf6Yrx9yd4f4ToeY5Rzv7lN2s=;
        b=Rk20NHGEUsQYbE7jSoHkz1yjUCodpN9BLI6Nzb5JfWoAGp3pYlG1mQjxC3BPUff3aB
         ozHhVqLKExrw2UifjAeJGCtJ8bQxbVrweGSHKY6GluymkhEHSh8aZTY70wVR96fIUvP4
         tUOUAOiR5guS29tctagOKVYsV5YWBxDZkO3+Ltg/txW/rUk/To9f4jr4XR4YiMZERhHr
         CJDwRPln2jSAk7v0tLmjgJ/mkm2Fw6/1e+tSasQ+fSM8OgV9asApilWYYHKH3Sdab1c3
         pDD2Lse4IkXjZfa+hlxPlZaiXdkAExPElmWgFi62kpijld0XyJoPPQPkzeEf7/EmpCXl
         4u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=BFix2GFyhYPQHkyVdecf6Yrx9yd4f4ToeY5Rzv7lN2s=;
        b=fWcuDbOD1jlTsXtntr604++q49ubg12fPjHNJXFfnDu1WlrqWxVxo0gM0GBGzDk6Al
         O1Ekfhn7eXG/nK64z4kn1yI43Vy0EVvcVyuTvW9Nr1D4WQB5g6jD0ZeSfPjtnkDNSuoR
         wrLTWNiloUiut2rLAKCJ1b5Iqf1p1yre6vGYR9qLAOimLf7mzfS3eDBJj2ueoOlbWxWl
         ARzREb5XFZz0dkoVsL4lEnWfPF91B0RUWNQnhTobLrPMdjoY09BlLLfaj0bwO1pY4sEg
         VgdfMpzKG839l2reG1/0ubVSFAPlG23cVMkemCKtzjn2UtT7RYzmDI/tTBXIAWJ+CZDk
         q9Fg==
X-Gm-Message-State: AOAM533I7CojqZ3U8JQefhvbdPbHeCcBshxsVZQ1dpWXA+NN9jOwvPKl
        V7SVxPTD7fyE/PO+PVQlkTFlRbPxHkGAWQUXFl9oBaVpMLgGUB1c
X-Google-Smtp-Source: ABdhPJwZT3TD7fSPKSiOlEaEJdesnIuuDtJ7ry06xdtqU0Otm/GbfeTs31UxUvpsEcJ8pBCRQaBlp7W5yGdMdywtTlU=
X-Received: by 2002:a2e:868e:: with SMTP id l14mr3861256lji.479.1616520692450;
 Tue, 23 Mar 2021 10:31:32 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 23 Mar 2021 10:31:21 -0700
Message-ID: <CAKwvOdkAN0c6+gDTiBEbV6zNSVdSjg1ANg5-_6=H_5b5rVpzqg@mail.gmail.com>
Subject: ZDNET: Linus Torvalds on where Rust will fit into Linux
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

https://www.zdnet.com/article/linus-torvalds-on-where-rust-will-fit-into-linux/

-- 
Thanks,
~Nick Desaulniers
