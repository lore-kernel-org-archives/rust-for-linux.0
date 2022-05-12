Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F6AC433EF
	for <rust-for-linux@archiver.kernel.org>; Thu, 12 May 2022 19:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357844AbiELTBg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 12 May 2022 15:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357840AbiELTBf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 12 May 2022 15:01:35 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BDF58E79
        for <rust-for-linux@vger.kernel.org>; Thu, 12 May 2022 12:01:34 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bv19so12060312ejb.6
        for <rust-for-linux@vger.kernel.org>; Thu, 12 May 2022 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pszSDfe0UbNgZW4RxKcUIgfomIDDQRx5VP5T7VUEGIM=;
        b=VQA5v8vqLahAK/ejzfmgUBIfDmleeuUyWizNuLo7eork68u0Kdo0mLk2LagPzvdFwu
         bPCS9pMREZcOLfpyQDK34HFBotdepKvHzCsAOrES5gBMNoFMkdTjhNWo3ROXCx8UIc6v
         BCV6hXpLKsRMRyhsT3mtXAL6JctiOwVyu0Mtk+yNpYb9O3TLaydg6GrpNp6If5JZq/2u
         rssY3r/WK4mSLTJQ7j7QHbvFf/6tkQnm06XpMa68d3wW/OykknmCFx3ve/RcoC7VmZQo
         aMmeuLlc6VWJC+vLFjNH6JHeTvcDMOyWHEaZB5+wgl5AgyD4B4DGg2VFzVrGtKgI1+lS
         OgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pszSDfe0UbNgZW4RxKcUIgfomIDDQRx5VP5T7VUEGIM=;
        b=cERkZBfth6Wsi4cfbqtDyStYyrXgTBZ2nSBW77mieJ76sTRvfIhmhQImhAsmch34yh
         PILv/xLfJBU5hU5/3jJjB8l3NGUYRd0aPXEl1ISBM7maH6Nq7uGSJc2+wmtVpY2WxRQ2
         pjh1S6oKV0OFQKYVq6ytKP3FOgJSXaZHP7XFN7YNPmB6Z/IhqAb+qEv+0P1QPrBp1rkS
         LS237RtnkS0NRinYNOEOBIQqx4ZamzHFWS8YO09ABUK9Mdd+BKnC9Drcf2cLDWDApljl
         N1HUxWCYoe5MF7sTbir0t7B2K1ZKdtbbrv+eEVT1XAt96DheOubEE0CMagbX4idpqxLx
         bfqA==
X-Gm-Message-State: AOAM530DzevVZrcSaUa9qxxjryAnIKfn234HAIpUCZ2SXnDLNbx7v99E
        4uQ0nhQGLqaxHmAi7VeEe73x6iTCe11FXlwSUoVHmw==
X-Google-Smtp-Source: ABdhPJwemMtr42pU2bJn8Gbt0kVxmOlvLYjum2OQe6Gv6T1/qdj76xgaaBMFoVVLZwHNnlZ+i3CiOANGsUxi8Hhu0qQ=
X-Received: by 2002:a17:907:8a24:b0:6f4:82c9:9adc with SMTP id
 sc36-20020a1709078a2400b006f482c99adcmr1202252ejc.223.1652382092846; Thu, 12
 May 2022 12:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org> <20220507052451.12890-5-ojeda@kernel.org>
In-Reply-To: <20220507052451.12890-5-ojeda@kernel.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 12 May 2022 15:01:21 -0400
Message-ID: <CAFd5g47skTReYjQDHdv=V52+E-1odLsTJMn6E3GV7N7mYia=bA@mail.gmail.com>
Subject: Re: [PATCH v6 04/23] kunit: take `kunit_assert` as `const`
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Daniel Latypov <dlatypov@google.com>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 7, 2022 at 1:26 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> The `kunit_do_failed_assertion` function passes its
> `struct kunit_assert` argument to `kunit_fail`. This one,
> in turn, calls its `format` field passing the assert again
> as a `const` pointer.
>
> Therefore, the whole chain may be made `const`.
>
> Reviewed-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
