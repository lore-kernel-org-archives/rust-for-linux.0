Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6B9C433E6
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 15:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF46264F17
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 15:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhCQP4L (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Mar 2021 11:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232307AbhCQPzo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Mar 2021 11:55:44 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053CEC06174A
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 08:55:44 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id p186so41045662ybg.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 08:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKo1felwtLVleNMCBb3J0+X48Q53ozNL0yvadcLlVUc=;
        b=n7FzX+xE98s7B6FzESU6aNWpM/YkjtyYooy17Yh60qGn8eIrOog33als9hqh+dq81i
         ANZrDe+k8d8O93KswKvAdM+mLhsTdTfpdenK5U8iWoyo1+XCTeokVq35zwGQXnKULPgQ
         oGSZkgD+iK0E86RNC/ob6E1KXrkjI0LaHLWOL+1EBFw8ekD044l79eeMX1WKdN5FKIlZ
         lN0JIL/DBivNAFLAiRtzvpqKs3MqMjHxGEG6W8ChVvxpTcdfcanM6/qZJwO5yNwtnc9D
         8kIk9dxxAE0oLEbBaYQjYod7Nkf2QPYfj6piNcN5TMjz1I+VAFJzUMZOAP1Emyh0o+yk
         WGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKo1felwtLVleNMCBb3J0+X48Q53ozNL0yvadcLlVUc=;
        b=oSGL8750CQUND0ekbbME/9Fh59FD+qSXXLH4X/rSCknL57IGjhHqG5hzi1+CUz35hr
         +SoWho61a5Rl2Yn5fBP4zoOPvceEi2o0I9ARFjvheuXUbAeWzyUqymlt4lqQiGdZmeM1
         G2neimEhwwI6X+1Er1JGP3dvwjnrIAVTQb1wX9w5QKKSVsQ97aY2rEyOPnYy+rJoBgaL
         AQjuzZKvoVw/5jRPwrabZp849VjCxHawX4NYbuKA3oqsaEre6mAEVMg9OwVmN6NFG2pw
         lydfkJGSQPR6E0RmKD2tbhnk5L+a1QI7nLZR6E3ikUDNAF4IJeB1MEqlXthQmUxWpfis
         Vb3A==
X-Gm-Message-State: AOAM533VqqI7OL+2ABPsmPznFXZJSp17Km1aDm9XA2SKOyh29mcpPyCw
        D4wtsS9svnauJ8Yo2fB8X5LGFAE3VcWyDZZzExs=
X-Google-Smtp-Source: ABdhPJzhBjEbHu3Ar4SJ4Nf4S3fodEWtTntEv1rZtgNwn9EFGhJa2dIg1f/jeN+oYBW1RzzGqrkn5xb3ZsnHusqThBo=
X-Received: by 2002:a25:6e02:: with SMTP id j2mr4915030ybc.247.1615996543277;
 Wed, 17 Mar 2021 08:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin> <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
 <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
In-Reply-To: <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 17 Mar 2021 16:55:32 +0100
Message-ID: <CANiq72n0anrr7E_2D7nTt4PxQQPn0KxT86y5dS3AE47su0Ff7Q@mail.gmail.com>
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
> ```
> error: unknown argument: '-mindirect-branch=thunk-extern', err: true
> error: unknown argument: '-mindirect-branch-register', err: true
> error: unsupported option '-mrecord-mcount' for target
> 'x86_64-pc-linux-gnu', err: true
> thread 'main' panicked at 'Unable to generate bindings: ()'
> ```

Reproduced with defconfig, building with GCC. I'm sending the fix.

Thanks for the report!

Cheers,
Miguel
