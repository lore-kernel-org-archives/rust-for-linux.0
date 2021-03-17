Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE92FC433DB
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 10:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80F2664F26
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 10:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhCQKcl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Mar 2021 06:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhCQKcb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Mar 2021 06:32:31 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C529AC06174A
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 03:32:30 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id jt13so1767511ejb.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtcnM7qiuzMfmaa7Bz011Or3pWJDtvTzJeXAXT9OyZw=;
        b=sAeHYLAsQhAhkXjDqheTqjCRqydwnaQaRfZ4yOuNeHgSPSTOWEk9Xs8KbGMsE6mOJ/
         Wfr2jp2iRcZkGZ/9qQxSVh9VUhp+qX/ViC5tcf6/nyY76+BH/L5mxGRznJXXikQ+wxN6
         SEJpzH+HmvGS0/gIoNg7Q8bRN20Pg568c3171uTgqdpuDG8sc07ylw9RTCxIvNBt6wqd
         Fwds1GCpknh0jAqAhci5fxGsM43IzsriBE9k1dYrwdewqV7X1cPIKMCAaMa74qF4dsuJ
         4JfnI0F+4fCNcBC40Hd6CsOiBdW1e62GVjAIpICbZxGYjqVmjgMjYAPCGVbneN3/LjDf
         bFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtcnM7qiuzMfmaa7Bz011Or3pWJDtvTzJeXAXT9OyZw=;
        b=bWsSUMRJpbCQzUBpvA8/yHrrAUte5YSMKan/qsBhqFciQS5vgZ4gNcOlOGzXe4x2vQ
         cirAx/Eefbi/ZEKKcVaVdAH2vzbEDtGFZjvIpSCVqWFXoF2gZCLb1lf06MqpQDlV9pcZ
         jck4Au2jUMP4xEo9HVF0uWqpyRm3PGnYmvFkg1TmaFJ4nRVjBIXtDo4q/5QeVDK8fuzS
         BhEwOKzGy/fB35A0Ibbt3ETRSgqN3Q5gtl7JVPhi4Y3uQ9sc0jdfhnnOizbFBfVbauUh
         5NH3vjhUDUp2Vpss1VWPmkrZDXc24/DZMQM3koSFXJpb0vdeeS+6Y1NmbEUMQFmRc6P5
         bzLA==
X-Gm-Message-State: AOAM533B0S1Oq0fKyXbxFj1uBUnIHViN5epw9M/ilCcp6zg9sHO3Kl7u
        87wFrK1MOYNouhL1s88PaldAQ43vzr0r22NpmY0=
X-Google-Smtp-Source: ABdhPJxDfacIM8/j1FZf5ljlLpxMcfMYSAwj+hgA4WDwlFi3nY1YR52XJB1Kolqqao7vJcoqnTtkWl/7MMrZ1cyZ0Tk=
X-Received: by 2002:a17:906:c9c2:: with SMTP id hk2mr34821981ejb.244.1615977149597;
 Wed, 17 Mar 2021 03:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin> <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
 <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com> <CANiq72=2FJQ7Ct_77MsaYe-3qThuRJ-gkLFvY-acq_GmhR9A4A@mail.gmail.com>
In-Reply-To: <CANiq72=2FJQ7Ct_77MsaYe-3qThuRJ-gkLFvY-acq_GmhR9A4A@mail.gmail.com>
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
Date:   Wed, 17 Mar 2021 16:02:18 +0530
Message-ID: <CACAkLuopZwyXSMX0TNK_AV=nSjSp7++mXJ7PNeg2_j1bNxrekQ@mail.gmail.com>
Subject: Re: Build system can't detect rustc
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 16, 2021 at 8:39 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 16, 2021 at 3:10 PM Sumera Priyadarsini
> <sylphrenadin@gmail.com> wrote:
> >
> > Hi Miguel,
> >
> > This definitely helped- I was using the master branch earlier. Can I
> > make a PR to add this to the documentation on rust/quick-start page?
>
> I didn't put it there since, if we manage to get this mainlined, then
> we would be in the master branch already. :-)
>
> However, you can send the PR to add a line to the `README.md` file,
> which is only intended for GitHub!
>
> > gcc versions 8 /9 / 10 but the error persists. I am not sure how to
> > proceed here :/
>
> This happens when bindgen (which uses Clang internally) gets GCC
> parameters, but that should not happen and is a bug when it does.
> Which kernel config are you using? defconfig for x86_64?

Hi,

Specifying  clang did work, thanks! I used "make nconfig" but I am
guessing it would be the same as what 'defconfig' would have given.
Here is a paste if you want to take a look:
https://paste.ubuntu.com/p/dMb3bb34Qf/

>
> To progress, please try a Clang build (pass CC=clang or LLVM=1 to
> make), which is much more likely to work (GCC builds rely on a hack to
> make bindgen work), or use one of the kernel configs inside
> .github/workflows/ which are known to build since we check them in the
> CI.
>
> HTH,
>
Thanks,
Sumera

> Cheers,
> Miguel
