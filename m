Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82C4C76196
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 Apr 2023 03:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjDJDmz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 9 Apr 2023 23:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjDJDmy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 9 Apr 2023 23:42:54 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E364269D;
        Sun,  9 Apr 2023 20:42:49 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id y69so10357400ybe.2;
        Sun, 09 Apr 2023 20:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681098168; x=1683690168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqy+7HgrqhTA3y3Mm7XBf4JyoweihTIc8x6wEhmraPM=;
        b=GawGlHsoA2kIbqxJQVRZov4meNamppKioPXApj9jwaZlnW0T1h2th4QNPx79j3GiR/
         F6v4c+2G+5ZB9mjWuIF8KJmB2pClE0SinH6j5NERHHNGptlEAefSQ6hhd4guBykVIjh3
         HqQYr8Fot0T7HfYUOyxUpJ/zv8Hb0Cr4lB6e3WtQSIPi5ISU3Qx1GOizP/bVfQI7s95e
         Q8Ffof529tBogs5QxsSKCwHKHnPiY3O+fHpdjkm/dFQn528bnsKmx+/nOrAfCgrCpv0u
         EzJjf5TWf92RSBwAMvhikLLUtOCx5gg7i03Gwd9RCiOXcX1ZO8vsIe2jm2KuIEylEvlv
         mt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681098168; x=1683690168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqy+7HgrqhTA3y3Mm7XBf4JyoweihTIc8x6wEhmraPM=;
        b=6wpcwxIfOY0cax/iCFX+KbFGZRxWtg8y5IsEq3jrHz5uwCh8lN6ycRNXBg7pCJ8Z4m
         1r4Mh/EY9WnSKDIm4xHbyXN1WzoUyYL17MvtINgEpDke8Fr/iHM6so/43J+EugwxUSQi
         DUWCmqDybt03rRqF+xvXCdu/afYPv9wBsOgGaaH0qKh7pr17cZB/uaK24MIUPWFYk2XI
         hUFBaQX64tQ3UbeFC36QgDUA9mlVveIYDVE5yMwBg8g8ZoW0AHl1Gk53eyDDC6KrV4PX
         OpuB//PzuYZYWY8YbEYMfc9OfQSU7L2P/V703OJraqsFLCP1oFftz+nUCLD23Dp/WOSx
         BcNQ==
X-Gm-Message-State: AAQBX9eWFFWEP3C14A2BDzGrnEKw0u8cJt27MQ8jDp3SKofi5nQnlk4K
        V1qin+Yp1ViD8DtewVjm/NWYiCYJsEj/VOk3RJY=
X-Google-Smtp-Source: AKy350Zg3LyywQHh550qv7aoJJHLaiYrdsf0Yzhcm0fkr1UkhpgZkbYWByN4y3ey5VlDLH0uEnvJF3KwvJHqgdhwgQY=
X-Received: by 2002:a25:dad3:0:b0:b77:e465:cb16 with SMTP id
 n202-20020a25dad3000000b00b77e465cb16mr6281632ybf.11.1681098168252; Sun, 09
 Apr 2023 20:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230224-rust-vec-v1-0-733b5b5a57c5@asahilina.net>
In-Reply-To: <20230224-rust-vec-v1-0-733b5b5a57c5@asahilina.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 10 Apr 2023 05:42:37 +0200
Message-ID: <CANiq72kVpFMqk82Tx23GmBsLy3mwrPLEfPod=BvXsE-s4MCMUQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: alloc: vec: Add some missing fallible try_* methods
To:     Asahi Lina <lina@asahilina.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
        asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Feb 24, 2023 at 10:12=E2=80=AFAM Asahi Lina <lina@asahilina.net> wr=
ote:
>
> Hi everyone!
>
> This short series is part of the set of dependencies for the drm/asahi
> Apple M1/M2 GPU driver.
>
> This series imports part of a commit from Miguel in
> rust-for-linux/linux, which adds missing fallible
> mutation/allocation methods to `Vec`. These are generally useful to make
> standard features available to the kernel environment, which does not
> have infallible allocation.
>
> The additions in turn depend on importing two submodules from the Rust
> stdlib, which I have attributed using the same commit message template
> used for the original import of this part of the codebase. These
> versions come from Rust 1.66, but also build on Rust 1.62 (the current
> version upstream). I added the SPDX identifiers in a separate commit to
> clearly separate the original code from subsequent changes.

I have used the 1.62.0 versions to keep things aligned.

More importantly, I matched the new fallible methods to those in
1.62.0, since the commit used to import them was quite old and there
have been changes since then.

Applied to `rust-next`. Thanks!

Cheers,
Miguel
