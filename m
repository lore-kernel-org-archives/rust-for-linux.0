Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0F0C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 28 Mar 2022 00:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237116AbiC1Ank (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 27 Mar 2022 20:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237094AbiC1Ank (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 27 Mar 2022 20:43:40 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD701E000
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Mar 2022 17:41:56 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id bi12so25499201ejb.3
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Mar 2022 17:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sutes-me.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=PgKcRmQl79BDV6/v41mFEjNotR71PBkWJJKbt2dKYC8=;
        b=b0rI1Rod1Qb1IIyVXUhaPBdLEFn0lPZRHThg4VO1EuOXDJWyEBRiZ2dcCOVtM6wHkc
         EUqD0R5422tBwVP6DaTr7azP3qivIs1Ne3P+36KxMrvJteIPE/k5WTszVoK5kh52BwOx
         u6Qx02rjPkU0+EIbpmlfXFBUL74lB7KCaOhtLsGoXbbvfwMBYZGvXSXiXzNtjasiJ5Ju
         ipnzCmjlcNR7t2tRYtB+JqwobCE8ODwj7Ez29j+UJphR2rLfcKzv9sVVJBdT3IAKdPN/
         s1lb+6pN1CAtjh6JMvBmKDgFftBGcfzPkFJCktoHOUT0gtbhOXl6U4VXFTBoPhd+jy6q
         2cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=PgKcRmQl79BDV6/v41mFEjNotR71PBkWJJKbt2dKYC8=;
        b=zEmorbzz3FUugILgqjot6u4hXeK6k4i8dom/iqnMKPFm27cxsYHEYL2aiN4Vt9riL8
         sFSxIymdBy0eGk+b5CJ8rpyz3j/nuDxuhHgSzEK3arVlxS5cKm97NntwEBxJWOVek/99
         bXxNFEX23Fwy+AbhNhHJhtCJdgEZy/FgtFAf82sr/8sWRbM26y0CRPEmYP/m5IM0xiHh
         V4cdx1bWa9piJDxiNDQk5Yy0GbsifbQA6DGIW50YrrFwZbViylc/rg6OVsTU0FDRdM+m
         g/suLrZBJIeU7ZrUw88nIp8OGIKPoLLPy3r2Enb/XY3UiMlIYzM0xu5HWFli0fkqNlPd
         Pusg==
X-Gm-Message-State: AOAM531hQEA0F6O108y2CpZgI8W3c00S/bifOPoPyZttLa6bbx2UzAGH
        yMqDgYcqbmiEokeBbeXn2glVB5x5bqZsTvIS0aXI8MK4mjI=
X-Google-Smtp-Source: ABdhPJwaao88n8UtXE6DOZG2z1kZeG0yzLb98jbOupXZhCAo0rD7TrEy9TOBFdJkcdH5A8bL81d/L3oL9AdkvG8Zlpo=
X-Received: by 2002:a17:906:6a02:b0:6d7:cda:2cf7 with SMTP id
 qw2-20020a1709066a0200b006d70cda2cf7mr23876622ejc.53.1648428114989; Sun, 27
 Mar 2022 17:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
In-Reply-To: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
From:   Chris Suter <chris@sutes.me>
Date:   Mon, 28 Mar 2022 11:41:43 +1100
Message-ID: <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
Subject: Fwd: Adding crates
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hey folks,

I'm playing with a kernel module written in Rust, and for the thing
I'm working on, I need to pull in a number of crates. The most
significant of those might be some async ones: (e.g. futures,
async_trait). What's the best way to pull those in and get them
building with my module? In particular, I'm interested in how to
structure the Makefile to make it work. Are there any examples I could
follow?

Cheers,

Chris
