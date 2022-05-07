Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8538EC433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 May 2022 07:55:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382920AbiEGH7H (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 May 2022 03:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358709AbiEGH7F (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 May 2022 03:59:05 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA211EEF5
        for <rust-for-linux@vger.kernel.org>; Sat,  7 May 2022 00:55:19 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id j6so8062679pfe.13
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 00:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XQZ0jflEj3ZwDdXxvsSFNpBxdR4iKUh7DFg36P3Lf1Y=;
        b=k8XL1BxUa+Ec15LWWdxguxto1dBkS3U+zppqYT4iyKpNspFGDOF0HcTPPHLJiBCUf8
         mc2RdLx4q0nCJo3pVAqXd1FOWoJAB6bxaNyJQ728vG67Uwa0An65tEsYUBt/gPrFE/IZ
         kpjen0oZQ2DGUSJzCUW3jrRPoMQN+CdVKI+EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XQZ0jflEj3ZwDdXxvsSFNpBxdR4iKUh7DFg36P3Lf1Y=;
        b=nvnLgDun9m7pnH0gjHR1mjnwM/he8Iy72tDK2bRmrS1zONkvKbCfHjnS9hgvnBERaf
         zDm6TZ7gdjpLyQC4p1Jcb3IZhCh8mY1pqoqnOrM3aH9k+9F79mct25hrPLnB0nu4bcxB
         IN/lPXFD44H5Q/4golwbi7shYi0SZMQL4rCCEBO8tYl2GBlA5xGqpd2sFgj+3cfkHLpF
         SGQlSuzdnBlN4jayF3Vbvuo0H6fLRNPN/r9Wakntec7tZD1HNTBGJPTN4keDWjW5svSG
         EkT0ROGbA7EwkbDP1XyKSALxgyqNZ+PJ4Ht7XKtCjPt6DD+S6Ox53mJLU6l+0fcxmfB0
         hu0g==
X-Gm-Message-State: AOAM533dZ97AwqrFrBqI7qP4vCiEs0Vhuw8QowoExmLwu9ZwUPmH3AZS
        k8z0sEhC3LWKSxCq1P5nmD7N9Q==
X-Google-Smtp-Source: ABdhPJw541yvtB0SwHhc57WgV9+sbvT2fz/QLC9JKaka5Qzd+gH8Uqv9Lfa4rtVSJySmpReUn6jBAQ==
X-Received: by 2002:a05:6a00:1411:b0:4fd:e594:fac0 with SMTP id l17-20020a056a00141100b004fde594fac0mr7330862pfu.79.1651910119067;
        Sat, 07 May 2022 00:55:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 14-20020a62140e000000b0050dc76281besm4643503pfu.152.2022.05.07.00.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 00:55:18 -0700 (PDT)
Date:   Sat, 7 May 2022 00:55:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Wayne Campbell <wcampbell1995@gmail.com>,
        Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <brauner@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v6 23/23] [RFC] drivers: android: Binder IPC in Rust
Message-ID: <202205070050.A870AEAC6@keescook>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <20220507052451.12890-24-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507052451.12890-24-ojeda@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 07, 2022 at 07:24:21AM +0200, Miguel Ojeda wrote:
> From: Wedson Almeida Filho <wedsonaf@google.com>
> 
> A port to Rust of the Android Binder IPC mechanism.
> 
> This module is a work in progress and will be sent for review later
> on, as well as separately from the Rust support.

Is any functionality missing for this driver compared to the C driver?

>  12 files changed, 3400 insertions(+), 13 deletions(-)

The C driver appears to be much larger, so if the Rust binder is
feature-complete, that's quite a reduction in code size.

Are there any other metrics can that be compared in a direct a/b test?

-- 
Kees Cook
