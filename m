Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E3CC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:07:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241541AbjFIKHH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241969AbjFIKG3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:06:29 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE485FEA
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:57:02 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565aa2cc428so15001427b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304621; x=1688896621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UrdIZppQiF0kDZz1uX3XYJM5eYhc1zT6X9Lk7TUM9k=;
        b=eXJfpG7u30ZMhBTa/xFVX9MMlZJf54FK5evAI5Uu7e1++gm1x7z6WiBnLHVh0AWx+5
         YV8rJGQ6FbsyN5U8hlqvwZOz/3TU8SfeS3e+F1Ssx9FzXtsEcdqh5n7SfKyldds91KOW
         4G/SSBoH5Fq+wbSzB5qJ9+d1l8K2RLGfsgiOC9hQmYT4L5+G1fbAOfSz0A19a4MT7qt4
         qE89SPsQdtguJyXBGtL3fdLarKmOrP/63wRD2nQ1RcQC433NOga4KWXh1QQR57H36AZq
         2I/ShlV2ZtUU5C2tKlj12BxAOuDy15vhV/VXGMyMADnC6AET2EWRRDA39rbguCPoeks0
         TrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304621; x=1688896621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UrdIZppQiF0kDZz1uX3XYJM5eYhc1zT6X9Lk7TUM9k=;
        b=OVg61Z4RDbg0Ta2GjEYX/lfeoPE+pDidS1AyMVs5NjO+FVQtOvYdXDsDtXQhmPkQC6
         DLwU3b25dR4/lx/TD7+EGJIN/JKD1OhVVL9+iKzPoVzd6InQGagms8Y8/d40PfKioKqd
         W10/2i24Bmw9mmmRS0hPJrXDwB7PR+/Sr0E+mt9dKmas/5XpPN7ZHr+Ey4WkQsJgpQso
         aSudEgwIFXzrh0PNoHYufclac80UC08h/iM0hEXfOM1uXHRHBMZfxFHXuiO1Se5hDElv
         zMLWJxByd0kX/hNqEm9Ui8ysjawC3M4AohC1EJAntyOsfq8nRVo9ymxdI/xP8Oq2Ziu5
         PkZg==
X-Gm-Message-State: AC+VfDyIF1LmjfDufz2W8cCqzTVAaMmth8uLe5vgWLozX/eG7P4vrRiR
        qvE3YuPWm48iPi5yk2ho5SL6Q1t9WnhC0N6J7nc=
X-Google-Smtp-Source: ACHHUZ7UwFguBfNpCfzGWtNp7Of6zdQFvq4gHwCPxILvwf36V/jI44GmFKLFQyec7cCg8Rh7Tdy15ppI2QPeC7DJp1Y=
X-Received: by 2002:a25:7ec2:0:b0:bac:64d5:5a18 with SMTP id
 z185-20020a257ec2000000b00bac64d55a18mr550859ybc.41.1686304621297; Fri, 09
 Jun 2023 02:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-14-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-14-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:56:50 +0200
Message-ID: <CANiq72n3xzA58RNu73pMHW6frh1biOkUDt1jVZ=LOD98NKKryw@mail.gmail.com>
Subject: Re: [PATCH 13/80] rust: kernel: rename from_kernel_errno to from_errno
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:06=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

This one should also be applied to the original patch.

Cheers,
Miguel
