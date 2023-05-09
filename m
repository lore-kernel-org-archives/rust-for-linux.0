Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE504C7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue,  9 May 2023 20:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235202AbjEIU73 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 9 May 2023 16:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbjEIU71 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 9 May 2023 16:59:27 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5772683
        for <rust-for-linux@vger.kernel.org>; Tue,  9 May 2023 13:58:44 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1aaea3909d1so60264705ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 May 2023 13:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1683665879; x=1686257879;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=wGSlyNoNEgum+U70dHQogcXITA/6qezybzU+rcF2jfc=;
        b=KSsvD321cDPrU3Q6JPqXRZNf4XJtKylCcVay6B3lnHml5xEp3aWu8vMqY9Px5k5TWv
         sw3Yns4edSoTrkJLiPyfba6ulQ0/3/MwV8gFfulp0aD5MDmKsK9Wthdme6s9Vo1byoVe
         nkC4mhfRxI1jZnuTXD0K2vLHYC1N2nh/aKse2VXVyzcewHEKngxX81phn3DjN5IFuu4h
         5tJweuFpAbOlaspXSfGc+n9uMOhii/2g48P06D5nTwrwXzf5Nj1ld3TgSBSEH5wUqSge
         7RgjTl9lIv98MdubihUcitLbAAGvVPFRGakYxzHfNjvMqRlfzSXIyVBhcPgNhkq4pIyW
         2WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683665879; x=1686257879;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGSlyNoNEgum+U70dHQogcXITA/6qezybzU+rcF2jfc=;
        b=ck3eZT3mYtP/KkKlqcFAvN3FhnctabJOnwzfX1oCH/b6tzF+Y0ehhEoC5RJqxFgpxA
         BW5O+e29H+g90YcmoUqlw0hwfcBTwxPAZ+mszG6aDTRymJ/lmoeR4gkIp4kHXLfi6+sw
         +t8EKxmsA9Lx63MoCW2CQ4VxZtFTYToe7+zZUvekhtGlEaaE5naDJ7zjKBmd6Iam/n/D
         lEMeu66MdTZkM5KDqQhgZAo3Jvqgym1oZWG63YhjZAl6lqWPmONz8dCCe4wm+axoaJmA
         K1yDR1oUEPJUSIWo8DCTssLkIvrlJez1ZZFNbfWCHiPNDmocB7OAJ/hH0sTpEW7LuHqw
         znVA==
X-Gm-Message-State: AC+VfDwWgwN9/A171EPwYZ9ygHFvm/lxvQ9R76UBOdRaJdxoMvhPaE5Y
        +Ci1ViPn9XPfIm07+Hw0RACrew==
X-Google-Smtp-Source: ACHHUZ73+zHi3Seg6S+4EiVpOsxhIS8YI33bLLJxkgjJKOgnOArbquvVNUNfB1Y6L9JlVUyaBURBrQ==
X-Received: by 2002:a17:902:ce82:b0:1a9:9a18:345c with SMTP id f2-20020a170902ce8200b001a99a18345cmr18784456plg.44.1683665878927;
        Tue, 09 May 2023 13:57:58 -0700 (PDT)
Received: from localhost ([72.28.92.215])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902a50800b001ac8e0ea157sm2049135plq.144.2023.05.09.13.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 13:57:58 -0700 (PDT)
References: <20230503065354.19071-1-i@truongsinh.pro>
 <ZFqHFTMqetbQKtah@moria.home.lan>
 <CAMy36z75N9obj0WM+OFhhnzXAPxqhg8PVY7_x8X6JbQABFnMQw@mail.gmail.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     TruongSinh Tran-Nguyen <i@truongsinh.pro>
Cc:     Kent Overstreet <kent.overstreet@linux.dev>,
        linux-bcachefs@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] chore(util): minimal Rust build example
Date:   Tue, 09 May 2023 22:52:48 +0200
In-reply-to: <CAMy36z75N9obj0WM+OFhhnzXAPxqhg8PVY7_x8X6JbQABFnMQw@mail.gmail.com>
Message-ID: <87mt2dcje2.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


TruongSinh Tran-Nguyen <i@truongsinh.pro> writes:

> On Tue, 9 May 2023 at 10:47, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
>> We pretty heavily use to_text() functions kernel side; these output to
>> printbufs, and in Rust they map nicely to the Display trait - do we have
>> that available in the kernel or is that in std?
>>
>
> https://doc.rust-lang.org/std/fmt/trait.Display.html Display trait is definitely
> in Rust `std`. As for the alternative from kernel, I am still searching.
> Worst case, there is nothing right now, Rust-for-linux folks would
> happy to take PR
> to include it.

Many traits and types in `std` are reexports from `core` or `alloc`.
To my knowledge, there is no way to see if an item is reexported when
browsing the documentation. Some ways discover reexports when browsing docs:

 - hit the `source` link at see where it is going
 - when searching for an item, see if it is present in multiple crates.

Best regards
Andreas

