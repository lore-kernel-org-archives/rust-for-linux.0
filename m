Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382C4C433EF
	for <rust-for-linux@archiver.kernel.org>; Tue, 17 May 2022 11:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242699AbiEQLEF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 17 May 2022 07:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344819AbiEQLEF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 17 May 2022 07:04:05 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83942167F3
        for <rust-for-linux@vger.kernel.org>; Tue, 17 May 2022 04:04:02 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id j7so2980029ila.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 May 2022 04:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Uz6tH+FiSVkBLi8yUXoPodMS4knNvPD8/OKq+xvwd18=;
        b=FkCWI7k7rECC2ItzwPzkLWbkX5//m4TLxICaGniqnnqBG8vXkY8iolEGovzvMBfqnv
         BAGmef6+uszbhwwRfcthjeWgtLEtDMjOObSCX4aVcf/sTzpyiWY9jIitwW/bKprJM0xK
         TfckadIayJ46YafNgoOm3yPCHuHRrH2wZ4kIjnPpPco/7gGE6mF+G6i9Q6keJVzSMEjn
         IArpYC3dicAjYofYH+TPA09vqCJ3pr+ClWTLngL2KPH0TLNQXuXsPmN6i1a8fZ7qeCtJ
         eyg2xprzLHIwbRoFnzBT4CJMUuyoz/Ub4/k8DAmpvXGbcH5v2bQzVuymhW1FjjZXzAI1
         CQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Uz6tH+FiSVkBLi8yUXoPodMS4knNvPD8/OKq+xvwd18=;
        b=n8P27IEz5RNU7uaBZfxvHohgVm2OkDYnZRe7/NkKrQYNp47WcCo6Dy5zkLp7h7FGgs
         3xsoz5Y6G0gUv5FLsz1qS6x4yfLDdFbkSAzVoy89JoYodPNdYyjkHlJUFYa0mDoU0p/Y
         iqjUGZsTkSTGzEZr2ItZAfQf8p5dO13s3pndZRp5CFYaQMchafD2OZtfxfySxSRgaplR
         V8/9GQfkAFdOj1HEx9mUK3tC+apFcdLfnEbdQx+W+2gpTW+LwXyAC4ZVR9T7KD3Qfm3X
         8SIoDS1NP1IyFoXiE3WztUr+bszcYOf0u9Yr0i2z/ojTosQ2b10MLALmX7SaXMObhjuz
         VM9g==
X-Gm-Message-State: AOAM530Zo3uDF0Bml55gmXHmncAgA/uNA6+ydEcCw8GWNyupSBg5iLcd
        JGIoFJbX0QhixYbSuiGS+PJuX0496gth5rhU1bxAMUmknU0=
X-Google-Smtp-Source: ABdhPJxi/FHXq8QglBmP0XJ2PZ2nABkeFZcj00wh5xQVpvj4kH9t7g+InV6ninNwvbUFi6iEQw203QPzphJIooF4TUQ=
X-Received: by 2002:a05:6e02:170b:b0:2cf:970f:6050 with SMTP id
 u11-20020a056e02170b00b002cf970f6050mr11585050ill.5.1652785441872; Tue, 17
 May 2022 04:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72=P76KwNBOnZ+h8kAWrfMCsvMJt4we69atDeW1ugY7_jg@mail.gmail.com>
 <DA4D23F2-412B-4669-A079-A654735CE9B4@lri.fr>
In-Reply-To: <DA4D23F2-412B-4669-A079-A654735CE9B4@lri.fr>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 17 May 2022 13:03:50 +0200
Message-ID: <CANiq72=kFrvrRqa+WGu_-jeda5xOA-Jq4RU5MUWuNzKb-vwr_A@mail.gmail.com>
Subject: Re: Taint Analysis for Kernel Rust
To:     Xavier Denis <xldenis@lri.fr>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, May 17, 2022 at 12:39 PM Xavier Denis <xldenis@lri.fr> wrote:
>
> Is there any interest in a prototype? Doesn=E2=80=99t the kernel already =
use a similar system for C?

Definitely, any analysis that is able to statically prove some
properties would be ideal, and any improvement over what the kernel
has now (whether for C or for Rust) would be welcome.

For debugging sleeps in atomic contexts, there is `might_sleep()` and
friends: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/include/linux/kernel.h#n131

Another area that could be interesting to look at for feasibility of
new analyses is locking correctness, see lockdep:
https://www.kernel.org/doc/html/latest/locking/lockdep-design.html

> Right, I forgot about that, but if anything it slightly simplifies the wo=
rk.

Indeed.

Cheers,
Miguel
