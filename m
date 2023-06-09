Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934F3C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 09:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238956AbjFIJpR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241891AbjFIJos (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 05:44:48 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1714217
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:39:55 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ba818eb96dcso1550810276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686303555; x=1688895555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBcgPvxhS52Smc40YipwOR839jRGyxX4qLmv+p5ICzk=;
        b=B8d5S8R9Fkv6vFQt/QnchKa5qOioTq77iBp7lqXxbbM09SN4ytAbgVLbCAGjGKBSJU
         ouMOWhsh+ybnkFJW8bxJEJMgVWEmNVS3yIZuyeh+TRaKZhUhr9JLrkBCZbB9Dj523fCL
         u+vJAm4ctxg/GQf2aQvzM8m3u5bFdVOm5uUfyB1VT9HxBimm6q1AsXq/TK4O2exH3EBA
         WTCQA7hYIf0dinBYnoKIEgiFzdvyvuZSIMCLBKtdh0y/MNb4lyMGkDj0CAEWSjGez/hx
         9ef68H96t0qPEzJB3b9fiFZcPrPC1xgynir9MGDpri+yFEfFgI8H7csCXV3ef1HeDtXc
         XTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686303555; x=1688895555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hBcgPvxhS52Smc40YipwOR839jRGyxX4qLmv+p5ICzk=;
        b=BY2K1NBLQYFx4QGQExxSpm01sGV8PUgsD/+uNi3Rhyo4ayBtlPjzTOZbccOY5uH7AN
         RBirR5jGW7/nZiizggbeZI4RvxdhaQqfp9QtsP0q8lxGQGiOzN1YLF3NX7jwTRDCrBtT
         WrUgwU/HRhn28cpVlEa1qSJg4WoUmA1eTC5GlWjD0L/nFpUiv6pfy9IH2y4iW7tfwdkC
         cGwf18hWVukOJ36Ve6qUlF3EAULVhlFPIyoyUB1NK5h4SMFOnwLZY8s9raVdy+YR9g8R
         zUzTJZFWK4Xh8uVuKBIeLtsNcWZ46vdHsq8W0xd1EUvP3doqApY1xxJMoQhkyesogzW4
         5rRw==
X-Gm-Message-State: AC+VfDypkMz9aempnNlqjdqMRUaAwHvpbjJ8v6Zr/58+uyELffsf+WIj
        9EZq89W4fz/76Q3eTZe08Gk4FpWNxl3R6ZTOmQI=
X-Google-Smtp-Source: ACHHUZ7QaSx05Q9PRXYZSvtZ3U8u1PPg1FlbhWcQMrEkk/1tXAx4KvLVJgl0gHS00R6typJeJ7Q9Sxh9O0zX4rnHJtU=
X-Received: by 2002:a25:3486:0:b0:b8f:6cd0:4ef1 with SMTP id
 b128-20020a253486000000b00b8f6cd04ef1mr601025yba.17.1686303555023; Fri, 09
 Jun 2023 02:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-18-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-18-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:39:04 +0200
Message-ID: <CANiq72=7V0Cs3RuhDQRp3SnySDN88dE45QHw2nqVsG3DwXTBeg@mail.gmail.com>
Subject: Re: [PATCH 17/80] kernel: configs: add qemu-busybox-min.config
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 8:58=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

These originally came from Wedson (Cc'd).

Cheers,
Miguel
