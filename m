Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A44C54EE9
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Sep 2022 00:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbiI1ALN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Sep 2022 20:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbiI1ALM (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Sep 2022 20:11:12 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9743E5F96
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Sep 2022 17:11:10 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id b5so10793117pgb.6
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Sep 2022 17:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=cmG65wzSzYi7hGoMEWIbS7DJOTmuAIyWOhAjc3YjV1E=;
        b=IR9nlCDixIsx2l9q0CgkOLRjWV1HKwfjx15bUruXKYDFUn8QfudJ/Iidf2j07AkFDu
         jNKEm3M2aoaCKMpoJl22A0snrasLDfPtrOOs4nq312N5vA38vulXNSLJfgk+S3bnhpjb
         h0mzdAeKiuEvWzOC5Q+3gXZekcnd17C9gonKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=cmG65wzSzYi7hGoMEWIbS7DJOTmuAIyWOhAjc3YjV1E=;
        b=T6GvgKHV3Nhyj29ds0aOIJjD+GNIQsfQ1jQ0lqryuRIVsRl+JclRunhHVKcmoE0Ot4
         FxIICzfBSPOehu9vV0L0z1Izz7OK774Nba4yZFAJWIePfTQou5XPHWF1B/6r7qWTmUUk
         O1SlRpDtSWaCfWrQ9fsB+zeyBvhiP8TlbGoytWWohCAFU2ISXjaicyZJ7MMVerLWVgcV
         mf6D8K1KwVRFSzGjGGSy6mKP1ObBMMWfw/AVxFk0zJIjBN9meLb87fxRiqTvnSIUXLjT
         C9eKLlgzggTQhk151BrvIEqjmqcLkwxRp4s2gLLYXOxMvmF2s4Zsb+9jeM05vxMXU36X
         pY6Q==
X-Gm-Message-State: ACrzQf26j1hZFojeHrWM2Ip18VQOui75cftUiZVI0ThX7OMMWcEWBP5z
        sbMr/m/SPkwkZvddm/eYHcP1JQ==
X-Google-Smtp-Source: AMsMyM7f8AEq6UNNkcKk2D+H3d700LQtj7Mzllr5njmtRSRmF0oa+61OoP8amL7HP96XJoW4l8dLkA==
X-Received: by 2002:a05:6a00:b8d:b0:545:e7de:78e5 with SMTP id g13-20020a056a000b8d00b00545e7de78e5mr31769320pfj.72.1664323870374;
        Tue, 27 Sep 2022 17:11:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b12-20020a63d80c000000b00422c003cf78sm2097646pgh.82.2022.09.27.17.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 17:11:09 -0700 (PDT)
Date:   Tue, 27 Sep 2022 17:11:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Geert Stappers <stappers@stappers.nl>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Maciej Falkowski <maciej.falkowski9@gmail.com>
Subject: Re: [PATCH v10 27/27] MAINTAINERS: Rust
Message-ID: <202209271710.6DD4B44C@keescook>
References: <20220927131518.30000-1-ojeda@kernel.org>
 <20220927131518.30000-28-ojeda@kernel.org>
 <20220927141137.iovhhjufqdqcs6qn@gpm.stappers.nl>
 <202209270818.5BA5AA62@keescook>
 <YzMX91Kq6FzOL9g/@kroah.com>
 <CANiq72kyW-8Gzeex4UCMqQPCrYyPQni=8ZrRO1dQsUwDmAPedw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kyW-8Gzeex4UCMqQPCrYyPQni=8ZrRO1dQsUwDmAPedw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Sep 27, 2022 at 05:53:12PM +0200, Miguel Ojeda wrote:
> On Tue, Sep 27, 2022 at 5:34 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > How about just fixing up the emails in these patches, which will keep us
> > from having bouncing ones for those of us who do not use the .mailmap
> > file.
> 
> Sorry about that...
> 
> One question: if somebody wants to keep the Signed-off-bys and/or Git
> authorship information using the old email for the patches (except the
> `MAINTAINERS` entry), is that OK? (e.g. maybe because they did most of
> the work in their previous company).

IMO, the S-o-b's should stand since they're historical, but fixing
MAINTAINERS to be up-to-date makes sense.

-- 
Kees Cook
