Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A403C433ED
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7B42611AF
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhDPNAs (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 09:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbhDPNAr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 09:00:47 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BC5C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 06:00:20 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id g38so29985600ybi.12
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=L+L0bHtjhBtNS4Jk6FZintvlDWSRhLmVfoGhwnYpCNA=;
        b=i/ld2nmDvNT/vsK4Zd8KgrRtvdHN1vOa3cRjmWrzT6baxvz9r5rbNtQbsBtVYD68vx
         Tj0IqzA5K97gWcrdCOa8QYUDYveYtPbxBOdchpH3DdH+Qpj62Ri4PG/4pwxGkUjkOAYq
         io8JO9KtHkvLDcGGPmuipvlwttAQHoz5LWwyPfaACUeVrRkKJAgfbQfyolxzwmSojF1j
         +Zly+3F6jL3ifMrjXKDH69Y3wZv13ZxXlveGBKF2GtZruAC0IuBjsu4+A6vDnmpPbUx/
         vEMOOHzdbE6VJMA+EvMOQ+tF9Sc5yNIgbD1K8k1HEU5AEAYULIesN0UaWPJ1ZFdcMoHu
         zSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=L+L0bHtjhBtNS4Jk6FZintvlDWSRhLmVfoGhwnYpCNA=;
        b=qpdsdh4n0GtNEudTmbiMGCVbuG01LXSRYi7ZzCMONiZc2Fxz5NamPixPV44zxAwoS2
         jKVX9WuU0vJmhUfbqo+cDXe0E7F0UM+jyx3wG1asixMAsU2V8ap5PuhadAjNWjBxGjcA
         2LKy4D3E7mGnbYjR1qgwiJ7pMDcm4sHWuYQAh8/6SbXtYoViSP5txK2f+FxlYNcTyIiS
         roAoRjUbm+zv6g7W0CIZNB1LNbM1V1hTXs2f+Kfc/ahadBZ94Q5+xom1zlaYrmPhFgU8
         3rGT758CWw40jMhmwAhhE4++u0p8ymmkv3olANalqdIvwzMqlkEu7CrVvP04XBYALkIn
         /BDg==
X-Gm-Message-State: AOAM531y1ZaoPVFi5bO196GAxNEoTLX2KrmTiYB0QKN45ecDdscATnEd
        j+ccFUgWmhifNNr4GTqUOz0LeQh1MqEd7KCOPYg=
X-Google-Smtp-Source: ABdhPJz+RXbZhBm3xYKqELOmu0tPKXwz5UvnW4sxqTf9ymwRJm7XgCQKrcjZlLLr2eW3+ThAlwThghccJjM5Mbt4zX8=
X-Received: by 2002:a25:7909:: with SMTP id u9mr11291389ybc.22.1618578019812;
 Fri, 16 Apr 2021 06:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
In-Reply-To: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 15:00:09 +0200
Message-ID: <CANiq72nvB7LYTc7wfuV+UM-s9wvOpObBhdJa4=odd8103x7BKA@mail.gmail.com>
Subject: Re: Rust-for-Linux Hydra CI
To:     Finn Behrens <me@kloenk.de>
Cc:     rust-for-linux@vger.kernel.org, linux@petabyte.dev,
        Joerg Thalheim <joerg@thalheim.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Finn,

On Fri, Apr 16, 2021 at 10:44 AM Finn Behrens <me@kloenk.de> wrote:
>
> The nix-community gave me access to the nix-community hydra. Hydra is the=
 CI tool written for nix builds, and so builds the rust-for-linux tree with=
 nix. The hydra is checking the GitHub rust-for-linux/linux repo for new co=
mmits, and then builds these in a nix context (If we want to move to git.ke=
rnel.org, hydra can also check there for new commits).
>
> The latest builds can be seen here: https://hydra.nix-community.org/jobse=
t/rust-for-linux/rust and is also uploaded to the nix cache at https://app.=
cachix.org/cache/nix-community (local nix versions can use those caches to =
substitute builds, e.g. rustc-nightly)
>
> We could also add vm tests via nixos, and documentation is not generated =
currently, but if we write nix derivations for that, hydra could also deliv=
er those for download.

This is great! Thanks a lot for moving this forward!

> PS: I=E2=80=99m not sure If this will break if we rebase to a newer linux=
 version, as nix needs a version to find some files.

If we rebase, does it affect negatively Hydra or some of the other
tools? i.e. would we be blocking some other project in some way? If it
is just us seeing a "red" state in the CI, then I think it is fine :)

Cheers,
Miguel
