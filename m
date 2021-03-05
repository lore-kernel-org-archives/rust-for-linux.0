Return-Path: <SRS0=mOKO=ID=vger.kernel.org=rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2044C433E0
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Mar 2021 16:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C67226502A
	for <rust-for-linux@archiver.kernel.org>; Fri,  5 Mar 2021 16:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhCEQ5h (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 5 Mar 2021 11:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhCEQ51 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 5 Mar 2021 11:57:27 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28E9C061574
        for <rust-for-linux@vger.kernel.org>; Fri,  5 Mar 2021 08:57:26 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id a9so1004873uat.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Mar 2021 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6RTQodsrRWjzvVhSSznw6ol12Q/fBvOfkZfrHjhip1A=;
        b=gJrLwNaDMr4E5pvbGjXSCVB+hMZRZZMj827o9xroRjxJdpoAF8DUTuvnyuseJsppO+
         PRVnm8PLWVqsSjIhB6CMe8mRzfsMJ/TBFZBmZbToat82XioOVNq8umCfO+TVxfAFTEmh
         uPLLzGVHsBEqilW0Hh98MAGy0vKgoRiGjnDAFv4cligwtKp6iF6TEDTtcFsMnodeUuJM
         oE8KibcelVZul12LzXXUeRIRIy+5VyMLQ9X3ToFvOA0rtx9TWdfzmH2bBRUpTkiuCFOh
         c32qhqd8qnSidoHfz7VjT2U9RmPord5yxv4zPSx11gvRk3o8ogNR5WoYpWIulrOcUZz0
         rWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6RTQodsrRWjzvVhSSznw6ol12Q/fBvOfkZfrHjhip1A=;
        b=uPeCwAruynhR5QmpD/THu636cjfy+KGAbZw1K12i1ZJ9yX/W6w+9UQ/l+hZBEgQSmK
         JFOPwEOQSr18bRMSkSAaVn/+IWq96aIVBUzKJrAPFSH7YKBhKxLcOK77j9XoywoATR1N
         B0tA2t39wp0bt28ohO16wLcRkthif9ppmyNG/qFCxmNznZnEi0sJnPKd461xnAMZBJuE
         sSYbVBmBSLV1ikQk9C/7X6jO23eEk4MNfvuU2Xx4iix933lNNxy8u6hKx9P6W25BT8C9
         pf0m8KL0LZzjB8vYYH/H86dXJ0EnTLksf/hzDtDWrOeCSnlVRwCGaF9rgRXhmzEtBM23
         7Oow==
X-Gm-Message-State: AOAM531ezc/Zros+r39PznjN46zgIudrBypJq62ZF4IqbRkHLhdNkKAM
        3tOAFa4/tUhL5KP6tWHbO+8ulKq09j8tGFYTQWkzmNjG
X-Google-Smtp-Source: ABdhPJy0a0LFfNK2mgUVf9QpeavbyY7E/61Gv8j1e2oVksKeQPPh529GR2/Bs8SPWnozd/s++Xy3BxPxqnzVOPkOHmA=
X-Received: by 2002:ab0:3142:: with SMTP id e2mr7572343uam.110.1614963446237;
 Fri, 05 Mar 2021 08:57:26 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
 <CAKwvOd=1a9er4qvYp1NaYWLPwTzNbo68Xc1+hQcv-qb-iuSjMQ@mail.gmail.com> <CAMKQLNKRMb1a6ydGxA4ZAYBUJKGMxJ6=PYOLn6HJ8ZH3GdJpZQ@mail.gmail.com>
In-Reply-To: <CAMKQLNKRMb1a6ydGxA4ZAYBUJKGMxJ6=PYOLn6HJ8ZH3GdJpZQ@mail.gmail.com>
From:   Adam Bratschi-Kaye <ark.email@gmail.com>
Date:   Fri, 5 Mar 2021 17:57:14 +0100
Message-ID: <CAHaybgmSbhj_XOwkch-ukjenHghXtyPe80He6LBSBG8LuxSy0Q@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I can also do either day.
