Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85004C54EED
	for <rust-for-linux@archiver.kernel.org>; Mon, 30 Jan 2023 05:34:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjA3Fek (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 30 Jan 2023 00:34:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235413AbjA3Fej (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 30 Jan 2023 00:34:39 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849951C338
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Jan 2023 21:34:34 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id y25so17325403lfa.9
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Jan 2023 21:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miraclelinux-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h2DAn1cDWhS4hWbAX5+FKv8Yf9kS0lfsICMw7GzgTVs=;
        b=Oa6bpA0CeS9crFBiT3tsWK1F958FAFINFWMutxHYPjSfQO41s5btefoXXLK9TT29RI
         E6Lz/kDDEertuiGLTGrLVQKuxp9pCsqJWPbEHo46Zs701fVNPtYKAseKbM7Y/Xjd5kut
         zsmZ1ynbiLhqerrBIIpkrPXpUVSELucFhKgl7/fI1NBPLdzi5KB4x/SoAn3QOQAa5ykE
         VRmz9xmlNWZHl2SKLVyH9osfMBXdHrU+ZEpeYNp19P+tgR6pclqZOWGTApyQ04OwQ4W5
         wCzCzdHj9hnQjq6QBQj/quyeSAQhvid7JPG9cUvT2tr+rRzkQ5BNBSCBcSxV+hjM1cr2
         nBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2DAn1cDWhS4hWbAX5+FKv8Yf9kS0lfsICMw7GzgTVs=;
        b=Y7NmUNpF7q+HRvIZ+Quk1zWjSEqaFiJDU4CAWTNR8GRWoY+P1Z0V1zk7L1O6aTwXHq
         32IaFxuTLpv/p8F0/xPV2SS6kppCPFks6cEhaps4a4W/VVisNc6ZSjBvG7zRYrp+9x7X
         /XqDRG7bVi9nmg5SsQxgV5ZSVl/uz4wGUw++FfNNpGDUdBZoEAOxeINaDjjfEH5ueW10
         AtVWZu1CrWv+osz0sJtNmjZaj1rPGryeem2Wwb03IzRWDzhaQAIpLjWYy88wbVZGqeZK
         o7ATSDSmLSsojsnqfJIRdTL28gDFmLZiIsJM7+bHcS7WKYqvaB71kMlNmr8nFehShQ4C
         EBUw==
X-Gm-Message-State: AFqh2koHeUD5mnS76WxO/QSA0FhdlBMiQUZ6rtVhcgK04+o8KCQl2MND
        eouls/aoaInsLvnVj9m4YD1Q6EXdB7ghP0v25f/E
X-Google-Smtp-Source: AMrXdXtEdkOYXuOyxZRMxkgDYx46tbObgIxk9ho161qExqZpoelxez3nzvioAqUeoze5GshAQlI6B+HtJBfXHmf0UWo=
X-Received: by 2002:a19:ae14:0:b0:4cc:8589:595b with SMTP id
 f20-20020a19ae14000000b004cc8589595bmr6144264lfc.0.1675056872897; Sun, 29 Jan
 2023 21:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20230119174036.64046-1-wedsonaf@gmail.com> <20230119174036.64046-3-wedsonaf@gmail.com>
In-Reply-To: <20230119174036.64046-3-wedsonaf@gmail.com>
From:   Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>
Date:   Mon, 30 Jan 2023 14:33:47 +0900
Message-ID: <CANgtXuPjovOGH7yeM28uRXOUX04KSTrzthqG_s+-77CBVdCCuw@mail.gmail.com>
Subject: Re: [PATCH 3/5] rust: types: implement `ForeignOwnable` for `Box<T>`
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
> This allows us to hand ownership of Rust dynamically allocated
> objects to the C side of the kernel.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> ---

Reviewed-by: Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>

-- 
======================================
Cybertrust Japan Co.,Ltd.
Alice Ferrazzi
alice.ferrazzi@miraclelinux.com
======================================
