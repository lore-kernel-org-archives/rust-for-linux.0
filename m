Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6074FC433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:36:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3914461029
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbhD0Agy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 20:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhD0Agy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 20:36:54 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4042FC061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:36:12 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id y2so65117476ybq.13
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cKmsEzrsQSeJT5xey3tKsyO4IOZ85VA05Kh/Amehg0A=;
        b=Ct1sYCpXzn6zGpMOGlxylPjU5F2Znn7JibYzCpCwaDpbeZau/R3bZd3WYKPioSv8qX
         hzswE5VLt8L4SNES5vxVd5iqpuBHvyW25X7M/hgqeQ6b2GC10m8NYimjUeb4wF9mQPJv
         M9ire6x/XNVIan1MpfPEPuROyAjjOdrFE009A8D01Ryy8EjHzfSf7lUa+ALcjpCAg6pv
         nUYHJ38wT1/4CGptSF9D5w5Y+BZi1Xcd5u0vyL9lDIIJbnM8F9tTh1o5rVwLDDVPOE2A
         6tBFN43WYA0ARvc8wQDvclDZhXSZRDcQ66owuFzT5fAUjTS+wQNijMCqD4BxkuoUDBnu
         aT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cKmsEzrsQSeJT5xey3tKsyO4IOZ85VA05Kh/Amehg0A=;
        b=WRyHpvFugKmnGf1wcr0b41BlcHmynhXehgiIiBWteERSjMmsGhqgKXMmdnzgK2bH0H
         KVRwPzZQ75Mcs0ficl7gDvSH4I8jgEjBHzC0pDpT0DDWWSy+mhZ59kFsxuUGMmNtTzZ9
         EXd0tuJiJxLCUct/lJ/P3oPsoKY3qjdIAGexHVe1YiUweuAY+MXLyBnZbttDNZoZY+gQ
         YoBQpa7xy3ibn+BOqhuHjEgJRowp+76WMWPAhOHyoo5WzrlCdqBA8PkrgWCH9dtV80kF
         oAbC97DgJ8w6QIcK9777ikONXId90P+O3ixak1ACgdYCz7E2bFTwksjtIBp2UKCuFN2s
         RMGg==
X-Gm-Message-State: AOAM532jBg1+v7VfEXVLOVXSmHox0y5R6qNCdL6wBcSEV2QLrWlmFphX
        ySH1wQM5Z+LH0fkyUzlPuvXgocbIlObpBpPLtmQK3hg+BlIAMA==
X-Google-Smtp-Source: ABdhPJwt29NNfVBVShrd0+agfsLLI5nKmMfm/2l1AQX311zpRy9aCqIHKdscJjF8MubF5g/hFtSEnhL2FYqYsRwvJnI=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr29404802ybk.115.1619483771690;
 Mon, 26 Apr 2021 17:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
 <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com>
 <CAKmvQ+UGiKVchv3DpR-QhyWqQ6-kx9HETNUcZqAv+An0ZgQwCg@mail.gmail.com>
 <CANiq72=oSMO1yGKFdOfVSZbLcsTVeJCXmbD_RdpnOqqKw4p55A@mail.gmail.com> <87tunsr499.fsf@gmail.com>
In-Reply-To: <87tunsr499.fsf@gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 27 Apr 2021 02:36:00 +0200
Message-ID: <CANiq72nb-PU_OxiVxj8ie_kYL0ohKN+R6Tf0ooO6KjHg-xsKMQ@mail.gmail.com>
Subject: Re: [Question] import third-party crates in kernel modules
To:     Kajetan Puchalski <mrkajetanp@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 27, 2021 at 1:54 AM Kajetan Puchalski <mrkajetanp@gmail.com> wrote:
>
> Hi,
> Is there any way someone interested in the project could watch or
> listen to the meetings?
> I don't think I have enough knowledge/experience to contribute at
> this point
> but I'd definitely like to watch the progress more closely.

Yes, feel free to join! We announce the meetings in the mailing list.

Cheers,
Miguel
