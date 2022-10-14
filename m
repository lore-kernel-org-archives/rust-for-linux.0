Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F26C433FE
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Oct 2022 18:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230427AbiJNSop (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Oct 2022 14:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiJNSoo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Oct 2022 14:44:44 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD85BCE17
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Oct 2022 11:44:41 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id s185so2710664vkb.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Oct 2022 11:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qHPx3FIICBJ97+4m/tNrnrrE7c7V77it4zG5MOEekP8=;
        b=uRB9bMp8g92Q1/kj2CCMj1RnY456AXrKWO1G6V1TtDob3IS9h+kGLhuo7DxuE/3/VR
         mclpNViNnitDQKXEhe6xad8L+Xy6HfUWQJWP7LA4EuSYNHg5BpeBSpaVnAazHVW+EPtN
         Zwg+tbgIbik1grCVluV1PqKZbftqR+FQYT7s2Xq4nNrs3erhO8uwK0OOm28CpBZZZOdP
         JXkd78OGKeNktU8kmzFEt42ykgYDiVTF4w1qE6Amw6GtJRAf/GMnfbzaKJgmvFMTjGPe
         miuf2ZnYjBf/vH+77VeBBV+2MnZ6rGtBmnXDjV1ivrCMFFv9BHIECzP2XQli5INU4V9R
         3sSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHPx3FIICBJ97+4m/tNrnrrE7c7V77it4zG5MOEekP8=;
        b=ggWKDXabWiXXdZwfQT+52cZBcSVDY+UoeDChsvsvu4kkLy+YI+sVBKM8Q/cW4VZpTl
         JBpp5+gW//joIN/r5XqsL4WyLD4+g12gKWghfHDV9+JrjQJGeGQGm51zm/n23XALdlS7
         jItEmxyTNlLjF88lBPtMb6NAXAR94qyXk4qJvaGcrshFnxBDRZ/ukojJH7gQSsnVJzEI
         AqsmuElq2DQw4KLdEiVl2mzdVz+/yDpILR/2vW1HXfoQyEiG7bc/X61HV0slaHy714Gj
         zag9v3FmZtKiSUAM5xJ/5i/Dp2YAbfReY3+jg+vrm51VDtYlfAtrQnQbJhVdwuT9FqrN
         LXXA==
X-Gm-Message-State: ACrzQf1wy9Bd8zZX/oCBhNKMLITlF+WG9ovHbjWkYC1GRPX/E6xJ1zjA
        fllKgsqfOVBzimq0+6KBnNTX4tJXSQ5hZPD9zQnKwQ==
X-Google-Smtp-Source: AMsMyM6QKRzoCjo0ApqBM+lkCZ5RSJXpZqKuxDYGeeX6qtxur8+D1dbHMhYRfQNGn6xUWsYDjysKB/tPD11BUvp0DyE=
X-Received: by 2002:a1f:a0d8:0:b0:3a3:e1a1:3682 with SMTP id
 j207-20020a1fa0d8000000b003a3e1a13682mr3547342vke.20.1665773080912; Fri, 14
 Oct 2022 11:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221004184625.10076-1-olof@lixom.net> <CANiq72mFGoDySLHNyakOnJMDpRVmvCRUAAuiKw1B2KrMhFteCA@mail.gmail.com>
In-Reply-To: <CANiq72mFGoDySLHNyakOnJMDpRVmvCRUAAuiKw1B2KrMhFteCA@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 14 Oct 2022 11:44:30 -0700
Message-ID: <CAOesGMhBnBrrJuT49V64nSN=UyvAdh1n9mXKYbxAexi1FC1_DA@mail.gmail.com>
Subject: Re: [PATCH] scripts: rust_is_available.sh: Provide hints on how to
 fix missing pieces
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Oct 14, 2022 at 9:21 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 4, 2022 at 8:47 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > This might be a bit bikesheddy, but it saves a few roundtrips to the
> > documentation when getting the `make LLVM=1 rustavailable` run to pass.
>
> It is faster for someone that already knows how things work, but it
> may make newcomers skip the docs and it duplicates the information
> there. In addition, for the non-error case, it makes it more verbose
> which may not be appreciated. So maybe we should point to the docs
> instead? What do you think?

I don't really have a preference. This patch would have helped me, so
I figured I would post it. My interest isn't really high enough to
spend more effort on it at this time -- I got my setup working by now.

Refactoring the script to have a shared message on non-successful exit
with a reference to the doc would achieve what you're suggesting
though.


> Also, the patch doesn't add instructions for all the cases, so
> somebody that may have hit one of the documented ones + not have read
> the docs may wonder where to find them the solution or why they are
> missing.

Sure.


-Olof
