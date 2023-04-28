Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E060C77B60
	for <rust-for-linux@archiver.kernel.org>; Fri, 28 Apr 2023 09:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345360AbjD1JlV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 28 Apr 2023 05:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjD1JlV (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 28 Apr 2023 05:41:21 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFA72680
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Apr 2023 02:41:20 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2aa39ce5d26so87066471fa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Apr 2023 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682674878; x=1685266878;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NfA7AlKYMbryLMd7N+DrxMkKQYp/h/z1OKBVWr/N64Q=;
        b=qq9p2NHByRlgezbmZct/xPH6T/syAybsHBFdyqV+55w1hfqM4GETwtu1sC01N8nm1x
         3qNj41i42++5RVXjvaqS8wmlI/y4uE7VHfcS6kEvjdoEWf9YAbwR5wW/9c+OyYUiNRz7
         8rtkD+I9Kpzoxgp74yNMlo2/YgwIcJGYz80vc50Qbx3zHzkUaTS4p29n9bE+wryP8rXi
         /FuirBk3AreCCyvjBIyLhJlIDVQaEO4v2BFi5eYzJwzkIb/APxw9QBCrpyFHdizH+ErZ
         UgJRDMe1g5HR0PJBk4jMl9+QB6iUI9tw8B/so4B0J60HpBxCkCYGEvOfJrcVX9jcB+Li
         gz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682674878; x=1685266878;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NfA7AlKYMbryLMd7N+DrxMkKQYp/h/z1OKBVWr/N64Q=;
        b=KPyalxwimGsAYfpdkaZjjHiVDGI5LhXfL7wLIGk4B71Vxsu7srSTPMipWfNw0RU+yi
         dTqfG/21P9JBm3Tm5HiRgZ2N8BZk0s/rKHKhIDQHzutnAU9W7XncbZLxsS5wKlf5KQqf
         5zEJlhiay+SUb+pAX2ty9iBsBvATZwBeT5P9fF5Flh3dQ59UOH7CQzkCyJuNdXXaN2E7
         JHLwyv/TWuJ2NvMe3m2ADAL2MewXHcr/WmeOsS/GTFxjZISR0tQ2SpR+hB/BJ7D27Uv0
         X23O4rh6znkY0CUaTe2+hTo0F72RPNBxBdgwMO+KdViKFVrZ3nELD3c7GHj3CFjU6ZAi
         prsA==
X-Gm-Message-State: AC+VfDzyYIkO53IELnE7qYe543bptuca4FJqwxLK405ryM4joFl44wH7
        t1gusW9vrMvLOYh1R6kE7mESUbsaHvEAxiFOQwq7wbNFpqg=
X-Google-Smtp-Source: ACHHUZ6bd/8eqRLec+MkSQz/PVJih8wAs45ibA//19Dcd+O5nnpAvD3zPb2D4aLCBlMOu83wula3mnme2A30QJEBG80=
X-Received: by 2002:a05:651c:c6:b0:2a9:f7fa:421a with SMTP id
 6-20020a05651c00c600b002a9f7fa421amr1394505ljr.22.1682674878277; Fri, 28 Apr
 2023 02:41:18 -0700 (PDT)
MIME-Version: 1.0
From:   Alfo314 Sanchez <alfito314@gmail.com>
Date:   Fri, 28 Apr 2023 11:41:04 +0200
Message-ID: <CAN7_B6rKwLxt3R2bBPcDfmwCGL81Cnu0SLE8dya=sn1byBQSag@mail.gmail.com>
Subject: Hello, rust-for-linux folks
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I'm right now with an end-of-degree project trying to implement scull
into rust, but the one in wedson's tutorial has a cap of 4MiB, which
seems a little low for comparing with its C counterpart. While trying
to implement a linked list of vectors and an array of vectors in rust
without success, i saw linked_list.rs and unsafe_list.rs, but they're
a work in progress.
Do you think these are good options for declaring a linked list of vectors?
If not, I was planning on comparing C and rust by using bindgen and,
in a C program, including a rust function for matrix multiplication
and measuring the times.
Do you think this approach is more or less simmilar to what
rust-for-linux does, as far as bindgen goes? Rephrasing it, is this
more or less what rust for linux is all about? C communicating with
rust and vice versa via bindgen. More than anything, I'd like my
experiments to be significative.

PS: I may have more doubts so, if you need me to speak using a
different mean other than this mailing list please tell me.
Thanks in advance.
              Alfonso
