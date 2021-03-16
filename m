Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B59C433E0
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 15:09:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50CA565037
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 15:09:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhCPPJ1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbhCPPJS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 16 Mar 2021 11:09:18 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8572BC06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 08:09:16 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id b10so37202356ybn.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jTqCap7AmWqlbVPCqIQNT+st6SQh02vbEf17c2gRCLQ=;
        b=E23ovjNIuoQUNmWPAJSx+kCMaAFvtXOZLZKNcYe8ArvQbi/0yU5QuvlEbQhwpGMBR7
         Mldu9Sw6Qc5Ul7SMkDYC5QFFQJVFpEh5y1WbIPsJu274of7VComSA3m4fUFksyz0yOZr
         p4kpaxRLBmW8inH/xrpfs0yqEj3A1gUba+PsaAOGt8K/4ihzZ6SaVpCtbv2P5nWmbxNs
         VHCqNB7iDbvvj1DzYg8sqyuyIZEBRTHXJrq82iLJ17aurDIeEqxJkZlvrilRluxOr/wD
         WvO1yeNdPr1uC50W2fWoHQ3J42mQbFKs6Kcr7Xy0F6oa9IWAPnzZZ8GU1CLGA8BFl7r7
         wz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jTqCap7AmWqlbVPCqIQNT+st6SQh02vbEf17c2gRCLQ=;
        b=lQibUrmTi5yR3pH737hvbH0ZKAsJvubxbpDckx8tS8rG+sBmunEecBOcsrus0n8dg6
         dbNL9sW3WOEkpjzBTA1b8NUkohojcSaDj8u06uSN0Ia7K0DJO38DpCM8f4gDv62HkMcg
         Pxso+JgESxmnfgEGOtpIfVyeoAMvzo2LekDY0TKpiEQRzaj9mZ8cbQDjEF00gT/RuWlq
         1IOsadxf9YA8HnM8qRIP7a+2ns6GnN0Ctzq/Oqex748BnvAmdZvd6IPTJ5qV0sUNL15w
         HtuGz0F6qWFMfyt43YVZv9uN+4r5qQ6RL0a9pNsvq/b38ylhKuldO5Wp5iHog+cNLvhx
         v6wg==
X-Gm-Message-State: AOAM5306WIIEOqgr+ZLwnrFIIDHit1EU7a+TsDee3RehD2S6VQJ5F3mk
        51FI/T09/0sfIGTkeiKhj6BwiqvZ5WRYFCcHGxiRoQXx/eqiWw==
X-Google-Smtp-Source: ABdhPJyl5V5ac8Gik4UWccmaklAMz8GmFUWOvT04PXUTTFfR7903nYGRGdlGQzhFjIE4ZS4Acg7nHztDXsMpp/LfeRw=
X-Received: by 2002:a25:d94b:: with SMTP id q72mr7136649ybg.135.1615907355866;
 Tue, 16 Mar 2021 08:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin> <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
 <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
In-Reply-To: <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 16 Mar 2021 16:09:04 +0100
Message-ID: <CANiq72=2FJQ7Ct_77MsaYe-3qThuRJ-gkLFvY-acq_GmhR9A4A@mail.gmail.com>
Subject: Re: Build system can't detect rustc
To:     Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 16, 2021 at 3:10 PM Sumera Priyadarsini
<sylphrenadin@gmail.com> wrote:
>
> Hi Miguel,
>
> This definitely helped- I was using the master branch earlier. Can I
> make a PR to add this to the documentation on rust/quick-start page?

I didn't put it there since, if we manage to get this mainlined, then
we would be in the master branch already. :-)

However, you can send the PR to add a line to the `README.md` file,
which is only intended for GitHub!

> gcc versions 8 /9 / 10 but the error persists. I am not sure how to
> proceed here :/

This happens when bindgen (which uses Clang internally) gets GCC
parameters, but that should not happen and is a bug when it does.
Which kernel config are you using? defconfig for x86_64?

To progress, please try a Clang build (pass CC=clang or LLVM=1 to
make), which is much more likely to work (GCC builds rely on a hack to
make bindgen work), or use one of the kernel configs inside
.github/workflows/ which are known to build since we check them in the
CI.

HTH,

Cheers,
Miguel
