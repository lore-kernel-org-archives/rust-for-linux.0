Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0065C433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 May 2022 17:06:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355565AbiEGRKn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 May 2022 13:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446730AbiEGRKb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 May 2022 13:10:31 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22903981E
        for <rust-for-linux@vger.kernel.org>; Sat,  7 May 2022 10:06:23 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d17so10257516plg.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=50cVO3qthcm3b2xqR68tMJMaU8j4FFGwSvmXlvEKRIg=;
        b=XA4BbRCNayh/ytgikpUzN4kvedWLzqcSDET1DkqFEpWb05dxGME4hQ87mzjH5F9G9/
         xslbNlR2pxxvG3czjh/ep8ePi4H01ka3my8EYhtL8rsMeuGFZYcJKaqiavLi+W+QUcd+
         qV8npTLSNTD52lb5uiF2OA+4PsVCQHMbM2YYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=50cVO3qthcm3b2xqR68tMJMaU8j4FFGwSvmXlvEKRIg=;
        b=lqtI4MxVx4ljZE72sQ4GXIZaxns/MLZEjMV/NUdIBtGIKLoCMR0XbjSKVLHDDFK4YC
         2Ct9itIbQysfHlk0sb+cEB6HTvEzdA0uHa72uIFEG8hAqYY4kQ79beWvHUXLljWDWq7K
         rYeGzqhCN440vytec4rmej2xEzFVd7nF6hmWjfx4xlTsLBQjYzYinzvUYGzMl0ZG15Db
         BxTDpbPEUFcTMcJ3UeJOa1+o8/Nez8F2pN54Mp3o2mIjH8uqszBlhSvZ24sy1VV6M4/2
         NbiaRrXZpjUbcqxSRYx0a+Tzzm5oeKcqU0SEBN4rJaqsxjNskx7LACtmJ7uCiImbg3A+
         AGvw==
X-Gm-Message-State: AOAM533XdT40zmYhLyjKPIXdmlCRCxXSyJZqxIKaVTXlUAxSenAf/5Lt
        HFBAbvldpPen5aipdV+jfglPKA==
X-Google-Smtp-Source: ABdhPJw266ytADuOoLTKDxHhoUYHP07t/aN0b1wVgzExgdUVx2SDfoNg+6V87xdhJW1dCGT7MbbOsA==
X-Received: by 2002:a17:902:ab55:b0:15c:ecb:81ad with SMTP id ij21-20020a170902ab5500b0015c0ecb81admr9071715plb.50.1651943183125;
        Sat, 07 May 2022 10:06:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r23-20020a632057000000b003c14af50615sm5431944pgm.45.2022.05.07.10.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 10:06:22 -0700 (PDT)
Date:   Sat, 7 May 2022 10:06:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH v6 07/23] rust: import upstream `alloc` crate
Message-ID: <202205071005.E734A5D6@keescook>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <20220507052451.12890-8-ojeda@kernel.org>
 <202205070214.AC7C566@keescook>
 <CANiq72kHUmxyKEuWydnMrhHRS-zZ878z6KJ96VEfBE9vByfZXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kHUmxyKEuWydnMrhHRS-zZ878z6KJ96VEfBE9vByfZXA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 07, 2022 at 11:33:22AM +0200, Miguel Ojeda wrote:
> On Sat, May 7, 2022 at 11:23 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > $ find . -type f -name '*.rs' | xargs sha256sum | \
> >         (cd ~/src/rust/library/alloc/src && \
> >          sha256sum -c -)
> >
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Even if I suggested it in the message, I did not expect somebody to
> actually go and double-check it that soon! Thanks a lot, Kees!

How could I resist a code review that I could script? ;)

-- 
Kees Cook
