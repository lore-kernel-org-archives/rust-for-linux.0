Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9F9C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241327AbjFIKaY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbjFIK35 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:29:57 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDD735A9
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 03:21:12 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so3937372276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 03:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686306071; x=1688898071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJ4NfzXm/jwiu0ERfQQu3RwpGVNWm9ZelmP0AzGJoGM=;
        b=n13CmvO5K8JeOob7PvMfj0t7r/GJURfwuUnBRhxnbKxTUjpTZFh4CbndSHV/V8maFH
         PXKwIeJj7/HVS5P3E8kwJic6fwcY3fQdTBKMkj8lE4NKOv6DH4Id5VwABt364UFhVyhT
         u0zsvzXOgk3+n24V2DV5VEK+MEnkZup2u8z52c9IH4N3x13dYk5V86rw2ixUi5FeKiFd
         Jav+wdwr7wmUqrA7RwSFcmRpmOMsexclVpuLp8tTYnwaVW6NbiaIfaNpfic2E0/y1UG1
         YosCSbavWornZfI+G639EvbnGnP6gajUUTS3QuHzJAhfYaSkVHkREN0SsLbQ5IzaDs6S
         eY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686306071; x=1688898071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ4NfzXm/jwiu0ERfQQu3RwpGVNWm9ZelmP0AzGJoGM=;
        b=Tj93xB+zuL1FRFR4fZHNbx2Ubt12sL4hdd8wpTAXVg6KHQKr7h8LMeghfjljZxS5Ho
         bfvVA8Ui2muNcUOc4XoMEMjZiRTsVTov4FAFe2qnHcGCHy2zKwyvNFUmv1huPJ9Caqs3
         P7h9yczX5oNlC+qj/6yWxDgqiJ7nFWpLJltqowaSblR1Ppfv1+mnkHA6sFwNoEzYans4
         Xe4PGSWONYp33fa+/GyU2L47XOlLDD0tSWWQr+6NL0w0XgM2Xo3+v7HFxhI1/ltU6+6b
         j7b/a7jetALTfdj8XYcuz0tux+vVEoWWCYQikfX2fClWx6PiohxVFIKw6PLeidzAabY9
         3LtA==
X-Gm-Message-State: AC+VfDx0hfrYuQ/WxvJoAdPRutPTO9hVNYc2mB0zX3EFcCdFmiiL3NJS
        NNdUCP9v1RAuJSqm1c0TO+FseaULg9a4/+9tKNU=
X-Google-Smtp-Source: ACHHUZ7KREZ83f3MKYfgzlMB1a1T46B6uF8yHQ3wsDU6v1EICx2yQQ9raux0eH1eAKYhkvGU65Bpb/XYT4hQwRiOk7k=
X-Received: by 2002:a25:2481:0:b0:bad:1cb2:bd26 with SMTP id
 k123-20020a252481000000b00bad1cb2bd26mr3014773ybk.9.1686306071250; Fri, 09
 Jun 2023 03:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-42-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-42-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 12:21:00 +0200
Message-ID: <CANiq72=06i+G=nannpKHB0BFQ+xo4mZL8XoEbou6AKCmQpEmuA@mail.gmail.com>
Subject: Re: [PATCH 41/80] rust: Kbuild: enable serde_cbor
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 8:57=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

Regarding `serde_cbor`: the repository upstream says it was archived
almost two years ago.

While it says it is widely used, it also says it is unmaintained and
recommends other two crates for new users.

Since this is an RFC, this is fine for the moment to have something
that works, but if eventually the kernel decides to merge puzzlefs and
its dependencies, we will need to consider who will maintain this, or
whether another crate would be a better fit (or a kernel-made one),
etc.

Cheers,
Miguel
