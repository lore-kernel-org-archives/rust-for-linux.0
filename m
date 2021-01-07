Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAEEC433E0
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Jan 2021 21:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFE7F23441
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Jan 2021 21:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbhAGVP0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Jan 2021 16:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbhAGVP0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Jan 2021 16:15:26 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390A9C0612F4
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Jan 2021 13:14:46 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 30so5999848pgr.6
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Jan 2021 13:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xcastHJogR52mkMFZUyCWpm72JNTWtTrlPNFmTZRntE=;
        b=bSnePIuWWNMgzUqZepTM9GldIWEQ2Ov/YY6MVT7+22YvtLSdPo5TZUbJoxbKg7RKy1
         e+UKytQD8Psss9ATeucFwgFiMsjVwlFO18SITx46/dQBVmUPsURchft5jGQZTKDjI3uV
         TE0/mhLS+W2S8WHDi5Euwe9oSC67+RrIdrV7thn7qSjpS92g9QworIQpI5a6Cq7T8JqF
         71BkxuiPw7FtZjgapzWwHgLS1k/MDWAh+ogqPMJt8jj+7CQJuiKCYp2FQ4N6ljCXQ/6l
         MeyxiKYKe/cPGsgs6sdEDy409Z1GhKzFK3ORhENKuK/d6QcxDkw1pN+IosFnhCvPGxyf
         t+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xcastHJogR52mkMFZUyCWpm72JNTWtTrlPNFmTZRntE=;
        b=I9DsLPdX5QQFZ4fH1r5v3U9nzaLnjiRMH0ilW1JdzFhXhsPYuk/zf2gtVhG8cUNw/W
         JfXB0vMoK46KD7GgXt+MH64av0E0zRZzZDtAB+gJLAi7236lGQJO7zlEjVqub8vcgPCS
         0c/VIgH5TNszwokNNqqJ71b06RionWuHCDMytiLqVoiJQky99ROoH999nit+ivbO1Rdb
         Xhyq26WQdJDUL8oTwkeiICUVe6ZEfQR2vwtwyXxRaFDePkDuo/I8//OEcRul3Dvp+kel
         fvzY6k4grMfuj5qb1SyvvExLT/N7L1MIJenfkKD8zff3NoskZmmW3MgZJ1eE8pV2X7gc
         4VZQ==
X-Gm-Message-State: AOAM531uDYY/vszVbe5XdgBjraRRwqzQrDsCDX12mDxIuR22yOjnm5bJ
        /eaZDJZNQeOQEpMSTDYydh5jKRMLUDAYI4GpFUQ=
X-Google-Smtp-Source: ABdhPJzLIlt5Rk4OUWZigng8BG9vHsPGeaUXkCRxq80vo37+0zix/H5sjcOxoFLqiMOPjkBwlvJkCaGABBMx9s9vldc=
X-Received: by 2002:a62:f948:0:b029:1ad:c27d:2b9e with SMTP id
 g8-20020a62f9480000b02901adc27d2b9emr408617pfm.33.1610054085666; Thu, 07 Jan
 2021 13:14:45 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72=-He3iQRpKrCwApPUCjbF+zAiM95mR5JJ0tvs1hA0fnQ@mail.gmail.com>
 <CANiq72mRp6goyxUCrCGZ=VHJ1Xi74v0ey1sFt=7fzLELsHkpQw@mail.gmail.com>
In-Reply-To: <CANiq72mRp6goyxUCrCGZ=VHJ1Xi74v0ey1sFt=7fzLELsHkpQw@mail.gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Thu, 7 Jan 2021 16:14:34 -0500
Message-ID: <CAFRnB2XcsPD3jiYmajC-2n_6g02+MgzbLSSZwV42rCJidfTZdA@mail.gmail.com>
Subject: Re: [Rust for Linux] Happy new year & Poll for call
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Thanks for organizing this Miguel!

Alex

On Thu, Jan 7, 2021 at 4:05 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jan 3, 2021 at 9:18 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > I propose next weekend Saturday 9th or Sunday 10th, at some point
> > between 16:00-21:00 UTC (EU evening / US afternoon).
>
> Thanks everyone for the replies! Let's do it Saturday 18:00 UTC then.
> Hopefully that is not that early for those in PST, just after lunch
> for EST and not too late for anywhere in Europe. :-)
>
> Cheers,
> Miguel



-- 
All that is necessary for evil to succeed is for good people to do nothing.
