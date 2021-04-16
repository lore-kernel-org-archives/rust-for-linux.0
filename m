Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E00C433B4
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 12:49:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A77B61107
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 12:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243815AbhDPMtb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 08:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243448AbhDPMtW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 08:49:22 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E58C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 05:48:57 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u20so30883649lja.13
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 05:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=christine-website.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZSGFuqpzG2xPxzBSa8tQ+fTgSWz5oFANqgBMW33l+eo=;
        b=xpmxw3bTv6Q4NgsMmntRI/EJY4rdQJo+2klmQgOpQtogN+8jhzzssyG9UR5tDdnX/+
         IZWH9IUad7xlR03tMzIykKEm299kT0MpC8xkYFzrQi9wR6a+B6A63iyZ5p5UeeOyGyZm
         xjUEdBEdUm8Arfx3oijgZBpAXItq3GK/Dg7HQXOWwAB/xDlqXxK7Q//Pd4Fy13tR7+Zy
         nC0im7XYHcOJ1EHGf+xFjSKAx/6gzWd8CQqc8jYwVa2xLSgeiAJDDRTznMoUWrWp9flG
         yz8TTHB2skmMYSw6lV1LxlVKHegoqehwtw+tGEm4wp/JX4Mvnklj60gfsfE//lFuwtAZ
         FtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZSGFuqpzG2xPxzBSa8tQ+fTgSWz5oFANqgBMW33l+eo=;
        b=toItgUhHYUmlc/wn89rBEaar0Kf/PYTpnL3rdh7ImeOxZN+kO2OXhP/m4htZyLQhVW
         l701n2SkSWfvvrQb5MsgDiJxUKPVfElw3CV8Zk+6xNWdzb1jXYQP3mBikdbG1sjmriNv
         VhFozpoq33vZRArhO73n7Pb4GtZWvVzciBDFeAhN5NAmPy1XC1l/d9RdMsH5azKUVZ6I
         v83thzRdv8SlnCs8cawa0Ortsby1zwLTZksdbAoGGU5BZmwelTedKmr9rdd4fLIBNE4c
         RkaW/r26otWGwWqchWz9zfJlTqvFJuqbSpCeNKfOeMJVXypPylYQSq2FZvWxVPvQkTvo
         UA3g==
X-Gm-Message-State: AOAM531ZZHyP9K6SmTkHpo3lHVi/VyQHgGh15p+jy4wVc2PRYi+zEOEP
        W5JbskllffHZYYM8QjKOoGrkXBPhXa0Qq0ToQa66DA==
X-Google-Smtp-Source: ABdhPJyJVLMK5749Bjp7OQjZfH/qH9gLTaXp83QfS6w41U+Naz1jE+5mJ/d+ryKHmhOlqT8FkC/ZxO4ASeMCwoZ6h9M=
X-Received: by 2002:a2e:8987:: with SMTP id c7mr2547093lji.185.1618577335598;
 Fri, 16 Apr 2021 05:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
In-Reply-To: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
From:   Christine Dodrill <me@christine.website>
Date:   Fri, 16 Apr 2021 08:48:44 -0400
Message-ID: <CAE06CAF3Ebm9Q-jmO32ynJ41yV2fPFf81zb2AYZNWJUTs6im7g@mail.gmail.com>
Subject: Re: Rust-for-Linux Hydra CI
To:     Finn Behrens <me@kloenk.de>
Cc:     rust-for-linux@vger.kernel.org, linux@petabyte.dev,
        Joerg Thalheim <joerg@thalheim.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I have been working on implementing a kernel driver in Rust to learn
how to do it and I have a NixOS test for it in case you want to use it
as a starting point: https://github.com/Xe/dev-printerfact-on-nixos.


On Fri, Apr 16, 2021 at 4:33 AM Finn Behrens <me@kloenk.de> wrote:
>
> Howdy,
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
>
>
>
> CU,
> Finn
>
> PS: I=E2=80=99m not sure If this will break if we rebase to a newer linux=
 version, as nix needs a version to find some files.



--=20
Christine Dodrill
me@christine.website

.i la budza pu cusku lu
 <<.i ko snura .i ko kanro
   .i ko panpi .i ko gleki
