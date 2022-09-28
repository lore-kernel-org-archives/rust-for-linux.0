Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A99C04A95
	for <rust-for-linux@archiver.kernel.org>; Wed, 28 Sep 2022 15:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbiI1PZr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234037AbiI1PZU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 28 Sep 2022 11:25:20 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AC7617A
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Sep 2022 08:24:35 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id a4so6795126ilj.8
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Sep 2022 08:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MMafc0XKw6NOaWKtKUXbsQqdoWCvB0DJXsiUjrpEzCI=;
        b=Vk2/c/Qz12RvICkhjBceX/XqnoLrDwb+m3TQGUKCOtCNNf8qtt42mUrdJeyRZLUgOQ
         MOuNjgFcS1oQFy4yh+ByFM1qu6DHcmnXERS/SBfLavedpav00pHMXyxvYBr73doOweLx
         A0Jpb4i0gYpFpmQwwLdNLlw94uzNqRQYyS7Zt6+YUjZUnuGmPwUcZEXRjGmunZN+x1BW
         696oAegTlgPcgrHaEVfm9lJRHafs1tJ8ZDqDAMpdHePwZkIPtHyE6XTxwY2uG0j+2/my
         c5pfJaHJg1J590s4jG0qCoKbsmxeSdZDZU5kg1OKn/qcpRXeeq6cyZt8jLZoDEXXx0+o
         6koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MMafc0XKw6NOaWKtKUXbsQqdoWCvB0DJXsiUjrpEzCI=;
        b=DNA/eKl/anro8wpDSi5SIOHfxhV+3QCe9YLp8GrcV7PjD0Hnn3G02CEjPjA3j/LlEU
         Y+S8MRs2MXwm3h8I/j0A5/HHL1zNswlPpT7r20ny00W67Tzp8lsOtPAUrT/v18em8oY/
         mwvg56KZGad68PbErf/wlTBtf02byV6VY6fX8xUY/c7pgYLErZvEplx9andvzQD9decC
         c+KLm2LnI4GDkc2g1ZAkaljigpPs4cdm6tbom5oCOAuqJO35ssOEghpSdhF10X9VtpOy
         EsmHcMURy9pyVdSZpmCGtPprmQH/xK08mYJc34wu5gUp9FpYY497KeNQqg23YFdPnGkt
         pCaA==
X-Gm-Message-State: ACrzQf3bDu3EoBmTqAeVlRnIjJEBP07sv/KL5MB20E/LtSgYLAtfSnnd
        q3QHyNXKpLrPb7S5RxU9aQAgKg0zX45y79tmNXs=
X-Google-Smtp-Source: AMsMyM5/m+9HLaa/UHczWhxXgqBERQjHDLegxgVDVVuD1YxN8P691We2P6PHhUCMHbtZ2iapXwg5L4f4eDu/MmACoKg=
X-Received: by 2002:a05:6e02:188f:b0:2f8:993:e7ba with SMTP id
 o15-20020a056e02188f00b002f80993e7bamr10542908ilu.321.1664378674581; Wed, 28
 Sep 2022 08:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220919.103820.680182888079022491.fujita@lima-default>
 <CAFRnB2U9EBdRLy0YCdQjCvgHra4T9bB+hrW==5iGWNhS-U7MUQ@mail.gmail.com> <20220928143120.iavijwru6r3qnhiy@gpm.stappers.nl>
In-Reply-To: <20220928143120.iavijwru6r3qnhiy@gpm.stappers.nl>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 28 Sep 2022 17:24:23 +0200
Message-ID: <CANiq72nAUKmcBWYqJ0WRHzJbad9L2RrOMP9DY9EYqDD8qSx0RQ@mail.gmail.com>
Subject: Re: Rust e1000 driver (Intel Ethernet adapter)
To:     Geert Stappers <stappers@stappers.nl>
Cc:     Alex Gaynor <alex.gaynor@gmail.com>,
        FUJITA Tomonori <tomo@exabit.dev>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Sep 28, 2022 at 4:49 PM Geert Stappers <stappers@stappers.nl> wrote:
>
> Where to look for such merge request?

Tomonori has been sending nice PRs for a while -- you can look them up
using the author filter in GitHub, for instance.

>   * git clone a modified version of a modified version of Linux kernel
>   * git clone the  rust-e1000 at the right place

I would expect the branch to contain whatever is needed, thus you
should only need to clone/fetch/checkout a single branch, i.e. without
having to do merges.

>   * build "rust for linux"
>   * start qemu with correct parameters
>   * find out that existing e1000 driver is NOT in the way

Those are pretty standard steps, though I guess you could prepare a
container or VM image with everything ready if you need it for demo
purposes.

Cheers,
Miguel
