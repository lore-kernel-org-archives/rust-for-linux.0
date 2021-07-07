Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A96EC07E9C
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jul 2021 14:07:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F62E61C9D
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jul 2021 14:07:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhGGOKh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Jul 2021 10:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbhGGOKg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Jul 2021 10:10:36 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD2AC061762
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Jul 2021 07:07:56 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a13so3187546wrf.10
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jul 2021 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kWyuGMwX+ZNUDXD7vDpVa4A2OyqG/8p+xZdri8V20uc=;
        b=T2dqzRwPotD5ZOjn6JCz0tkAm6jUi7jcBoxaUMn0E8tLfrXB0oQe6az48pOSGJeQOW
         178QgAoV2QSn0YP58N1pUNvWbviBPoa+YmpgoiPa7onI0WpIAZ/dSIQv5hS1gUaaqREJ
         kO32XVR27MdLkzkZJa2JQSqI1EUnfYR+YjUuoTJ+uqmoTBXGwuX7DQmCaNhLiYoVAXow
         cPcp1zIGaVOyt8InKS58l8xUrIOs8k9obW3pQvApQNh1DwtllPUndcl/wrN9CHKK7mi5
         cfWBeLOO6jBVnT6Q9OuOnZap2IOh2UbzlIS20nbxa4Z+4d7oFG7B1ozeGTdk3YJ3FTjA
         QkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kWyuGMwX+ZNUDXD7vDpVa4A2OyqG/8p+xZdri8V20uc=;
        b=T3Pc5KM24I0JQn6zDYCdQZ/a+q8YMccH5+iJFtEz6h602uPZuMFzzCt0YFD4VgVlB1
         ITBfiOE5LJgqKyRO1wOWPHOwq3q6PVDCK+K6UitOb2Xx5CqN0Wnm99DbrQBvzgLxi+eU
         OHikPNYU9AjQJGo/APYuY9WZMhKHx2sVwYDlYagZfekQGmv/Nh+0lMPXhy+T23Xcntj/
         3zcxHo9YUIdG3S5snUDohHkKEQSD6gCPNDqGAW9c69/dlr1ClrNM2d6gv8Sqg6apuI5j
         pq3OPKCCofGwlI33rXa1Iy23vFEZiqPvJRTpe8gP7KYic1T2aFy3bD16dZee8QEKS8H0
         XtCQ==
X-Gm-Message-State: AOAM533dwZQIMcqfDOO/mturVvd6fL84th4Oc+joJ4GeGb63PxjxFOE6
        uhTMk2+TzBgZH3rDfNTzV4gp
X-Google-Smtp-Source: ABdhPJy4pvViQLXcf5CZiXO9ylISZ7qhOwfU2XWINGPk2cDzGLvvCqrd+9hRWF0xZknrQrz1n7ZNEQ==
X-Received: by 2002:a05:6000:1867:: with SMTP id d7mr21264188wri.263.1625666874582;
        Wed, 07 Jul 2021 07:07:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:860d:625a:fd59:d699])
        by smtp.gmail.com with ESMTPSA id u9sm21396849wmq.41.2021.07.07.07.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 07:07:54 -0700 (PDT)
Date:   Wed, 7 Jul 2021 15:07:50 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOW1Nj8+a2Yth2++@google.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOWjLmg/Z7kr2+tx@kroah.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jul 07, 2021 at 02:50:54PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 07, 2021 at 02:33:57PM +0200, Miguel Ojeda wrote:
> > Now, if you are OK with non-hardware modules, you can take a look at
> > Rust Binder (last patch in the series) which is a non-trivial module
> > and it is already working.
> 
> Cool, does it actually pass the binder self-tests that the Android
> systems have for the codebase?

We haven't run the Android tests yet because they depend on an Android-specific
service (servicemanager) running and other Android-specific libraries. What we
are doing instead is adding binder tests that don't depend on anything
Android-specific; in fact, we are putting them in tools/testing/selftests/binder
so that they can run on any vanilla system.

The commit is available here:
https://github.com/wedsonaf/linux/commit/f90ec49be9207fa765f07ad1071210ad871712ac

The tests are written in C and run successfully against both C and Rust drivers.
I still have another ~20 tests that I wrote in another harness that I will
convert to selftests soon, but the two together I believe have more coverage
than the ones in Android.

We also have a trivial latency benchmark (ping with no payload) where the Rust
version performs better than the C one.

The benchmark is available here: https://github.com/wedsonaf/linux/commits/ping

> Last I looked at this thing, it was not
> feature-complete compared to the in-kernel binder code, has that been
> resolved and the needed filesystem changes added?

It is not feature-complete in comparison to the C one just yet, it is missing a
few things but not for any fundamental reason -- we were mostly focusing on the
kernel crate and tests.

Miguel's point is that it does implement the vast majority of binder features
and is non-trivial, so it could be used as evidence that useful kernel drivers
can be built with Rust; not just "transpiled" from C, but written with the Rust
safety guarantees.

Cheers,
-Wedson
