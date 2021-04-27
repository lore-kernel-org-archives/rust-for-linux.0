Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905ACC433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45EBE60FDC
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbhD0KXz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235817AbhD0KXu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 06:23:50 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DC0C061362
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 03:19:05 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id n2so5720457wrm.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BwepRXLnhCJ3kzA2bTOMnXqZIn6BiSKiPtNRofd7bEg=;
        b=dKJchVhVI4IS+uWvqIIMuqmjIeDMQrf9zQtp0KXgVq79mPGuPKYvuQh1Ui7cyTvJvi
         a0hz6I1EDvSRf+Rh3WrG6KIazo/gsfpLSzExX5Mo3+k/FgVno6g8HIIjiFQRNyEFTkCA
         PIRm+fbi1DnQGkvveVQOGDyYYaE+/APH6fRmGSwrzDyyAqZc5M0ID0kjpGK2fSy+BjaS
         MoRHa9rerXAx9TtJDFpcMJ+l0B1nlCCKn/SZSxr5KahOO7k1BN0pycuPL69dAr8RLu8K
         YRZ/pRvLTWxCrhGtA3EgnqYti0niS//s/viQ6at+MaiqYiazxgotD0yOakEwMIyXsG8/
         k6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwepRXLnhCJ3kzA2bTOMnXqZIn6BiSKiPtNRofd7bEg=;
        b=SJQN+Oh7mkJipYLEDbp11WZ/+mxmW8WFrsm6MrD0A/qAkckJMiUPnLAEowv6a4J4TR
         dFbd1jAUglCjUn0Qi77oZjvqBMNzJ8vMdKGUgdkz5Ay3pOn/vwO/yFvRIDt+dh5l+GWE
         ZlNQvHwxYpuEtGGuOfwSyn2eunRyCYyeo4LBOm8ADuNjOswL1I8x6PYytVigr05Nd5H0
         oSfmHbc+xb+ycihPPmw6llojhwEUvCwawfFCfMJxkwVhu5P644WpRocymBCqkFGhiG29
         czUAn1QrSxKqOnvzffpfw/LtX8cSATXiBKdNPwTK2jT339XaBjE1ylJ9n3ds1PlyWLLJ
         udvA==
X-Gm-Message-State: AOAM533BNdCWn4IkO7LYa9r4Cov4BHh+KKNd22Z8CkqjTsbW3b0q4+mP
        SUJo1dlF/5v/1DGbCayofNrWIxstFmvbLNWPtys=
X-Google-Smtp-Source: ABdhPJzIR1u2NZL17XK2u3G2aCDtzPHzJAbpCCjCXxKwG/EOdgYo/eSa6+S4UEvgIFuGctfF3jqtNMBCUMYR6B3yV3U=
X-Received: by 2002:a5d:678d:: with SMTP id v13mr7665747wru.85.1619518743222;
 Tue, 27 Apr 2021 03:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <YIdUf1C5VtWn/D2G@localhost.localdomain>
In-Reply-To: <YIdUf1C5VtWn/D2G@localhost.localdomain>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 27 Apr 2021 06:18:52 -0400
Message-ID: <CAGngYiUMFuzRmjM5__RUTZsp9N63zr+Y6R7kVuMU5BxRS17wcw@mail.gmail.com>
Subject: Re: Exposing semaphores
To:     Carlos <carloscarral13@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Carlos,

On Mon, Apr 26, 2021 at 8:02 PM Carlos <carloscarral13@gmail.com> wrote:
>
> I recently began assessing what functionality from the kernel is missing
> for implementing a basic scull driver.
>
> Semaphores are the first missing primitive that caught my attention, and
> being such an important part of the kernel itself, I will make exposing
> this functionality my first priority instead.

Isn't scull's semaphore used exclusively in mutex mode, i.e.
initialized using init_MUTEX?

If so, prefer "struct mutex" instead. At the time scull was written
(over 15 years ago) it did not yet exist.
A Rust-for-Linux abstraction is already available:
https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/sync/mutex.rs

This is before my time, but I believe that the use of "bare" struct
semaphores in drivers used to be a common anti-pattern, often
resulting in buggy code and/or performance issues - most semaphores
have been replaced by conceptually safer, higher-level primitives, and
today one needs a valid excuse to use them in new or even refactored
driver code. But I do not know the full story.

Sven
