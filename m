Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54804C433B4
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 19:34:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17A1961166
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 19:34:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353419AbhDNTe5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353414AbhDNTe5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Apr 2021 15:34:57 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA11C06175F
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:34:35 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l14so21631861ljb.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p+qlBpfKKNNSmiIVDWZAwm2J5XBPYb6crTXEI3M0nwo=;
        b=VgiHLTWI3FosiEpCVUDwPU9YJez9f9/W7OcDyGRWAVmbGZSYPWyC/lw/A8EwBL9ftK
         liArfTuPen3tkf1eQSyheZ4w4SwmZAyOVnVWF6E8SqyJGlCejb7Dr9Y8seU8GmIElaDu
         glo7f1q5erTsGKyDwy5UyrL8uODJ+xbE+9wDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p+qlBpfKKNNSmiIVDWZAwm2J5XBPYb6crTXEI3M0nwo=;
        b=ohgIUfO44HLx3d3s7lwbIdhK3c7j/wnrdk972zg/hY0qO4yelYzjILnIIKFrEbrP/r
         ziXoXZ0PgVqWzCW0aKZP/i/HJ21Qf7umUhtDQw2ryzwyiG9jzbYoc3x6G9SOkpcOs7ph
         7UlSvMa99gZxhcBL55pNi9mUF2sY8baanPrBEnMy3SFI93Ye4/3lG3WOEnTccuEBIhNO
         46xhWgv6ZPKOnOgp3KT24VVdFLl25DuXw3ngf9vTs9d25xWXe5F1dtlO6iCyrOqpLD3m
         2POl6rJOiz5kx+SNp4DJCFg3Hkkcy7XVWdeGPZSZFzfuuIh5wIuPiEMZyWMkBU5jhS+Q
         PdNg==
X-Gm-Message-State: AOAM530+FlVvb1nS4PVNnlYaymlf/XnZB9zBz8DzyvJ0uvEup2GT1Mzc
        +KDaz3l15wBaFD9Lyve35tyZc/5az96w63gt
X-Google-Smtp-Source: ABdhPJx6KgQ2YALHIStJb4ysTpamcPqY6uWqC9SU1VHurFw2Z7Ys+cG9tlTxXkLMSO3NAOX5eTj4sA==
X-Received: by 2002:a2e:9c9a:: with SMTP id x26mr24705038lji.371.1618428873686;
        Wed, 14 Apr 2021 12:34:33 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id f3sm157817lfu.225.2021.04.14.12.34.32
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:34:33 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id f41so11741989lfv.8
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:34:32 -0700 (PDT)
X-Received: by 2002:ac2:4947:: with SMTP id o7mr22894176lfi.253.1618428872725;
 Wed, 14 Apr 2021 12:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-10-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-10-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:34:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
Message-ID: <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> A set of Rust modules that showcase how Rust modules look like
> and how to use the abstracted kernel features.

Honestly, I'd like to see a real example. This is fine for testing,
but I'd like to see something a bit more real, and a bit less special
than the Android "binder" WIP that comes a few patches later.

Would there be some kind of real driver or something that people could
use as a example of a real piece of code that actually does something
meaningful?

               Linus
