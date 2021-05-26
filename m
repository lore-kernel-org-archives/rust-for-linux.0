Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4DAC47087
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 May 2021 02:21:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 232FD6142B
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 May 2021 02:21:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbhEZCXO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 25 May 2021 22:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhEZCXN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 25 May 2021 22:23:13 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26205C061574
        for <rust-for-linux@vger.kernel.org>; Tue, 25 May 2021 19:21:42 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id i4so45925859ybe.2
        for <rust-for-linux@vger.kernel.org>; Tue, 25 May 2021 19:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/r2hM9P0dzKdFkISSQnoZOhyyiCuS+lMjyOGEQHSJDQ=;
        b=nqrLg0YT0Kr1YR/tSqwj5kko2mSM36Wl3Z5pWl8wdFe7S8Rhfru5t1JVGk76PT9Mo+
         GrY747/tVOe1dE893urvlQw9SM5sEne61xIUsrCNd5kTzYghGkYpdU6e/KRVzH15Gbm0
         kvNmhGlZXRTSojLb9taDGFqBR3ZYA8R0bLlL5ZcT/pAJIE1zaNPW6Xhka/92YY6VX7nA
         CJEHAEJA0B7lAndLEF2SGs1jwA1D8saloiaJBbvUZtKWtCmzB3/sJDoK2QufJf8DqVbW
         xBtI1A4C9K4xzM3BvZPcRu3nWaus67VIcFuO0LgM2RxC74j/P/XlqknyJ79gNGrH6ZSm
         iVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/r2hM9P0dzKdFkISSQnoZOhyyiCuS+lMjyOGEQHSJDQ=;
        b=C90E2DZicONTQREFbsVziUvlq3bW5665AVTch1WOopHJmaN9kUCLss1gC9OjmuNkIR
         7x6jkEFI81ygwNgrvj8D1yrxV24CVRnOhbyP65ce87WAJ1qwlXitjPDY3UOvIC+lQoPb
         a7OLXVMantSh8nSeHEQ7GB9fMOblKV24tz6rtV8YSAVndOwMfIVoN//LM/ipyzKzmebQ
         XlPJczWboLCiGMZU8KGcs5rSA3Ez9giLwTSujxSZRtz3O8LxaVHpSxD/ZfsVnNz1F/Ov
         o+wtLmxAvq6TGRJOVkKJyDB7OZAOcpzBoJ6deQ7iOT3G9M8inmz+J6xP7sAeZapJwHQ1
         /OXg==
X-Gm-Message-State: AOAM533zTKUgnPItaUmJG0thBPinY9X1L0CLpy7yVsMvCn4M6gQKi/Ot
        m1y49BrkDW4znI+cnCuJx0ZfMz2biwzEYc3f3s8y4cWIFFI=
X-Google-Smtp-Source: ABdhPJzQcu9v0omB3FFOwI4vhi9v4EINdzluiNpydvFQrUF2tscCGNTOtq3yfp3Vjl26qOQ4GldQGl3AdtqAmM3zFwc=
X-Received: by 2002:a25:d994:: with SMTP id q142mr9536581ybg.93.1621995701337;
 Tue, 25 May 2021 19:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <fde720d1-cade-e01b-8dc2-afdbfa52bb3b@thomasthanner.de>
In-Reply-To: <fde720d1-cade-e01b-8dc2-afdbfa52bb3b@thomasthanner.de>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 26 May 2021 04:21:30 +0200
Message-ID: <CANiq72keqzr2vraGSOcC4=Ew=Ax6ds_m7E3Gy2az3JLzmtcnsg@mail.gmail.com>
Subject: Re: Error building sample modules
To:     Thomas Thanner <e580@thomasthanner.de>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, May 25, 2021 at 8:24 PM Thomas Thanner <e580@thomasthanner.de> wrote:
>
> ERROR: modpost: too long symbol
> "_RNvXsp_NtCsbDqzXfLQacH_6kernel12module_paramjNtB5_11ModuleParam5value"
> [samples/rust/rust_module_parameters.ko]

Sven privately told me he recalls this being CONFIG_MODVERSIONS (thanks!).

Thomas, can you try disabling:

    Enable loadable module support  --->
        Module versioning support

(Ref: https://github.com/Rust-for-Linux/linux/issues/59)

Cheers,
Miguel
