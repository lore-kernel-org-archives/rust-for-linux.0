Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B9CC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 09:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjFJJeA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 05:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjFJJd7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 05:33:59 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6084826B0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:33:57 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bb2ffa1e235so2410249276.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686389636; x=1688981636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpUwGOnoOHu08lZ/lw4DcfajLIEqCil2z/LnIcaqETI=;
        b=mQC1yNIWE/pKDqm69vFKcCqugeN9MziYsVATOVvLvUzOQSltG8FSpCaJJubStYF4qn
         GgPl915ZdBBfiWkKYVmweikc1PVZyxBSLmQPU7EQhcgedQMZlWncyIPR4W0mV3ME+VL/
         YOJ4vy1B+zLZNpc6sWyYjKJyW8iM0nl1id+6Ox4AtYQbBT+QjXK9R5EYlaz1+f6QHSPE
         PoF80ZivXv271TjTj+DT+fyNhnPBLRfFNFD3d9pD+a5G9LagDpdwNfnuZpsws8ypoBrt
         rbTi/6UUwyx3Ly0i3ouh2K4FE0hgabCQfwzZ/yYFpTg6wBjFyARHIQ78CdUB8ThU5ee+
         pGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686389636; x=1688981636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpUwGOnoOHu08lZ/lw4DcfajLIEqCil2z/LnIcaqETI=;
        b=FZQryrY9W1Gt5wwSsdJyQFJaERLOHLHYIq5zEDQxpoW7m/bSPCEpMU6YQ6lyol2mB/
         NnDblwzIBbH+Yyz+1Fa8WewFtzD/tnCEplBxo4pd7XwbB97cCAwgU+l1AdnShbEuVNTc
         UNLF9r+uy3h79hYi5S8AONWJNIcj9vv1dx2/j7nN1iKg9OF7HoLvleI56VGemIUqxned
         y1r8ATsg6EGokko6wQAduN6chNVrOaVGflSdGhRwE11E30ZEKzhhyUwYFDD8sarkgUCk
         qTRQDrxV6/aScNlyakqGgz0USgD8RhAT7XsPKyi2VkxcVGbzWf+o8ykKDjL7cAa/JsZt
         NzaQ==
X-Gm-Message-State: AC+VfDzTLu1Ej9/YKEo13hh62Tl1nrmImSmetPFCcpgvJleJpforx+FI
        7gwBx1kl1+k5L4NF713suOcdYc8lviZ3yry8fnc=
X-Google-Smtp-Source: ACHHUZ7GhOS6RYwqVWg2cevVPo8Ya9bGkQhfa4v03mRSedZHxJomwY0M6ZT95oZOsgxNYfuDKscDcvEFnygKMi+73Rg=
X-Received: by 2002:a25:d217:0:b0:bb8:22f2:9f3f with SMTP id
 j23-20020a25d217000000b00bb822f29f3fmr3235253ybg.39.1686389636574; Sat, 10
 Jun 2023 02:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPDCGM9HbPhR2yW@moria.home.lan>
In-Reply-To: <ZIPDCGM9HbPhR2yW@moria.home.lan>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 10 Jun 2023 11:33:45 +0200
Message-ID: <CANiq72kXNu1UK2jVNoABeRtwbcZyF1XkOH1c6DgyVTsVNt3iiQ@mail.gmail.com>
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 2:25=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> Separately from that - are we sure we want to be pulling Serde into the
> kernel?

No, we are not -- see https://rust-for-linux.com/third-party-crates
(these have my SoBs because I provide an experiment branch at
https://github.com/Rust-for-Linux/linux/pull/1007, since some people
wanted to use them, but it is not decided which ones to have).

Cheers,
Miguel
