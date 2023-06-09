Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1FAC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241195AbjFIKS4 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241811AbjFIKSE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:18:04 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7334EDC
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 03:10:25 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-ba82059ef0bso1631007276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686305424; x=1688897424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP2j7VCv5J8N9ZATKMaVdZ19KGwuUgt/WKtRy9AqcCU=;
        b=jW7iwTg1x8hSw+gJkgxLO5ZXAfVFmNJ99YnKSh/8j76uuJC/qF0sJXEhc5r8lpIim0
         RKQ8/6HvAKEEhEI1/lMirJ97XmoBEZUG1dYgbGFaQZUsrgQWZF32T7WLB727+k8c59YU
         Fz0Y9CxEKOypjPL5oLUh8kLdlLbqCs2CQXOmd9Jk7T4F3qGCJWuDDxJVdYOMM4AjYKKU
         g6XTHtUyEpaBGr1eRwSB8FY8p+TI/Z370z4ZJ8zpfptNXYU/hhzkrLFAfYlKEaF3EyVe
         S+xAUjPVP7OXbHfOT2/tREAdwLWd5/4zi0KMVbawIhiU2GeRNZ6G+hUCJiPu1QNtmIDq
         Fevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686305424; x=1688897424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zP2j7VCv5J8N9ZATKMaVdZ19KGwuUgt/WKtRy9AqcCU=;
        b=BMl3x6MsOxpmLxglVegXK7vv6A24fpR5fX10aqvU9VNtwlpCXdrXUVRBU5PhzS3Hfp
         m4XzsjuljtY0VCQDq+RJ+zTcdnxaQeEIs/VATpAYnHL60H9AWvDFo4tv8Z9eKW4NQNRK
         nyIB1mYt8h44bgS3dUeINY/mI+z7xbuWst5Tbf6ieJ1girTK3FXcQSrG9FpULDWOx1cf
         GYT9gISBLOTW7RT5/kxZ8Q9qlmdftMO1nSbtOG75i1TLr5plzmh/sVt+B/EtYJp1fGKZ
         SdO8wQz1uLYr4RZYu+51xbBzAdChOOfA3gaHnUsb/ZYUjCo1LFBRhq4Cszo65N/rQm4f
         7TQw==
X-Gm-Message-State: AC+VfDziBgUCw2/brD1PGlT9orKsHkoob+IVQdfe7GXKLVfqJKGp3iOx
        UuDLYKAFT9vnmiHtuJOey29C5C7wBa4z2dF/q8S8OD2L
X-Google-Smtp-Source: ACHHUZ4OhXP8wRhbqZtm1+daywiDJH/mo62aAnHTMp23upMkS2VAQXtsGrjU9Hu3GPm5FU88rjP0A+0FE7NDyPjPFb0=
X-Received: by 2002:a25:7288:0:b0:ba2:dc22:9607 with SMTP id
 n130-20020a257288000000b00ba2dc229607mr642175ybc.47.1686305424134; Fri, 09
 Jun 2023 03:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-45-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-45-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 12:10:13 +0200
Message-ID: <CANiq72=_PoQevGhwyhfBr+JZBOa6ds8CvJ8Kd_9dDMuR+hpv+g@mail.gmail.com>
Subject: Re: [PATCH 44/80] rust: serde: add support for deserializing Vec with
 kernel_alloc feature
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 8:58=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> +                #[cfg(not(feature =3D "kernel_alloc"))]
>                  let mut values =3D Vec::with_capacity(size_hint::cautiou=
s(seq.size_hint()));
> +                #[cfg(feature =3D "kernel_alloc")]
> +                let mut values =3D Vec::try_with_capacity(size_hint::cau=
tious(seq.size_hint())).unwrap();

Same note on these `unwrap()`s as in the other patch.

Cheers,
Miguel
