Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3E5C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 18:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 841C861075
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 18:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234726AbhDZSdg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 14:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234599AbhDZSdg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 14:33:36 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D725C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 11:32:53 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id c195so66076863ybf.9
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 11:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h4xn7tOLXOH4z5X4U7tifUBlM34e4cRoXMAr6VJ2CkQ=;
        b=cEeywMrFcsfnhlC1hJyiZBckjfcuY/ba3tRN+lmNVXj/jI10xcu/YUvVY/TRBKSG93
         1Jd9tBRIOFWLh9UOqvK4/VlTDiXdPrbXVg5yARCsVIkv3NSzkcxC9AUo0HNHUZSoVAca
         E/gGwyXV2+QkSTXhnHMrtzMTO4iZw0z5l+KCH/SP1lW8uTDF3AgsEG2qj0GCnetksFRO
         pNPrtrOsPkJcdfC24DrUggVImLUBd8MxeFOq8wTmeEBEXr9zqD14ReflL+QpWKDi5/B2
         bhGJAch3y7v1jSkx824uGZK8KX5ONcZo8uz2m1v7I5gy7gH0T0g5fYfVRpD6988lrBVn
         Q9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h4xn7tOLXOH4z5X4U7tifUBlM34e4cRoXMAr6VJ2CkQ=;
        b=UnqpbunNU9kOyAcMvuNMd3IfiSjwNZitYMknyjD+c0jnDOYf9gRR6BdpyXlhOxEeQK
         re3hXPKEw6bzFEYTSFwr3GXl+4ipyLdGee1VCCHK/4XnEI4vjhPHO9+S9KBQQEnBG0yC
         xia827yt5RSvpfIR+Ir2meDFUo1I13+J8KR4tvhU3hYl6c5xh81KxyP5ehMnlihbc6WQ
         q0sA2Mo1Zmjk+ZTf096TzfuaA+JBoU5919mdV2ctsLk3s6UtHc1PBfxVQq+ZXJ3Ob92U
         3sT75iO8c4Xs9NigONlvx889hUYraQvIsa9XA9P43hosua4w9Eztjuhhlpf+qcRucM7E
         0Zaw==
X-Gm-Message-State: AOAM531SzE4EDPuw2huk7eVk98pDY9BEMWJm4Z/sf6awQcY5u9kn/Mjz
        byEPLQCelh+ZXMoRT6z9IdXJ5skCzbq2Atoq7JM=
X-Google-Smtp-Source: ABdhPJyrJMg3ngthg5bfBLhsLsuUhV77KW95dtDoRMc879scKMWfJzYVdlBvhkAabOoK98ovb2Ih3aKLy85y1fyxus0=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr27508652ybk.115.1619461972876;
 Mon, 26 Apr 2021 11:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
In-Reply-To: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 26 Apr 2021 20:32:42 +0200
Message-ID: <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com>
Subject: Re: [Question] import third-party crates in kernel modules
To:     Hanqing Zhao <ouckarlzhao@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Hanqing,

On Mon, Apr 26, 2021 at 7:01 PM Hanqing Zhao <ouckarlzhao@gmail.com> wrote:
>
> Is it possible to import third-party crates in the kernel modules?
> (e.g., crates on crates.io)
>
> Any suggestions to import crates while writing kernel modules?  TIA.

Which crates do you need? We may end up importing some things into the
kernel (such as `alloc` and `syn`), but we do not plan to depend on
crates.io (offline or otherwise).

Cheers,
Miguel
