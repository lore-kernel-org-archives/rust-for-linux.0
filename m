Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9EBC433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 23 May 2022 17:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240140AbiEWRSU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 23 May 2022 13:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240149AbiEWRRa (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 23 May 2022 13:17:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871DC703E5
        for <rust-for-linux@vger.kernel.org>; Mon, 23 May 2022 10:17:18 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id f9so30298410ejc.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 May 2022 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fedUXB9PCZprDJtOf0/YUNtATNS2b1cwPIEIQjz3C5U=;
        b=qSGY95RPQbk/z3IZR2wbR9A+mIAY4Evz9P0y1QbCQZkw9mL3rtDPqjtqier7UAQbRt
         cRXL97xjijcBb2skG6FctVkzFdhkgqSxrsm4wM7wgxjsQvOir4bI7uATxEvuRfIwc44a
         EwpX/thbz01WEwPwaS+BR4fXjazKiGLx21UrszmsB4Jc2evogwNg6KTyok2wBTqDFVSd
         BOqV/5UpARO8gm/18TeR3u86M2cuaIaZHIcg7QWRdC9V1i4j+HshVV1q0YQu1vaAiJb1
         7VeYI4hYWMv/nIBKym0uuUsyDsGjmroQS67KhM474f3HzYsx2G4oK4iZtOuRfwJY/t7S
         JGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fedUXB9PCZprDJtOf0/YUNtATNS2b1cwPIEIQjz3C5U=;
        b=OXfEMo/qwghLpxxsyh6Sdrhjwobnyjfg0uaV/vrBtQsYM+7+lE3GxoKYOePyOIKPwK
         Hpvf+zLWELKq7ntSl6kH97hXex2SBs/8+BrLfAiJVYj9IXPNVge44lLmAlR0TmX9nav1
         RjEx0B0YgpNcaJ3faskSA4A5+flVt3l5YkENZ4uy11ig1CLL1nYinHe9N7/KUdkptnJa
         z+tSNGJyjH+U/EYcWBLtWla9ionWEP0BLb4sR2DV/rTQLgm5FcvEyvwtYLtv+Q5OltY+
         Q788oPQ2QNssKGyVJVEnrucwHr8BjYtjKB2TJaQjOkt1dZPM2IVcrxKHyU1ix67w2HGE
         0Mpg==
X-Gm-Message-State: AOAM531ppOxyBGo2ZCfuYRudZuUnJEajNw1jz49OR/c73oQF9YiEmJn5
        hLmcGMwGQGuRQhN1QchnL+hI0MU4QASoT80yo1k7MXGwdPVdRw==
X-Google-Smtp-Source: ABdhPJxJp+UOrH5XwC1bW0gxjFCeL9tPbqF9Oys4KOYyLcxhtgzBSwhtxHRu1jsf4X3pcTQXwa5oIGirMCihhSJafo8=
X-Received: by 2002:a17:907:3faa:b0:6fe:d013:b22a with SMTP id
 hr42-20020a1709073faa00b006fed013b22amr7070939ejc.425.1653326161514; Mon, 23
 May 2022 10:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220523020209.11810-5-ojeda@kernel.org>
In-Reply-To: <20220523020209.11810-5-ojeda@kernel.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Mon, 23 May 2022 10:15:50 -0700
Message-ID: <CAGS_qxrW+GpDpD7-jxyGaPtQUzBGTdR7N=_7FRR0KdoJCshAAA@mail.gmail.com>
Subject: Re: [PATCH v7 04/25] kunit: take `kunit_assert` as `const`
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, May 22, 2022 at 7:03 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> The `kunit_do_failed_assertion` function passes its
> `struct kunit_assert` argument to `kunit_fail`. This one,
> in turn, calls its `format` field passing the assert again
> as a `const` pointer.
>
> Therefore, the whole chain may be made `const`.
>
> Reviewed-by: Daniel Latypov <dlatypov@google.com>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> This is a prerequisite patch, independently submitted at:
>
>     https://lore.kernel.org/lkml/20220502093625.GA23225@kernel.org/

FYI, we'd asked Shuah to pick this patch up in her "kunit" branch.
It's applied here:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit&id=7466886b400b1904ce30fa311904849e314a2cf4

It had previously seemed unclear if this series could make it for the
5.19 merge window (but it now looks like there's interest in trying it
out early on).

Daniel
